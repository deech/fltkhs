import Data.Maybe(fromJust)
import Data.List(partition, isPrefixOf)
import Distribution.Simple.Compiler
import Distribution.Simple.Configure    
import Distribution.Simple.LocalBuildInfo
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.Setup
import Distribution.Simple.Utils
import Distribution.Verbosity
import Distribution.Simple.Program(requireProgram, arProgram)
import System.IO.Unsafe (unsafePerformIO)
import qualified Distribution.Simple.Program.Ar    as Ar
import qualified Distribution.ModuleName as ModuleName
import Distribution.Simple.BuildPaths
import System.Directory(getCurrentDirectory, getDirectoryContents, copyFile, doesDirectoryExist)
import System.FilePath ( (</>), (<.>), takeExtension,
                         takeDirectory, replaceExtension, splitExtension, combine, takeBaseName) 
import System.IO

main = defaultMainWithHooks autoconfUserHooks {buildHook = myBuildHook, cleanHook = myCleanHook}

fltkcdir = unsafePerformIO getCurrentDirectory ++ "/lib"
fltkclib = "fltkc"
headerdir = unsafePerformIO getCurrentDirectory ++ "/c-src"
currentdir = unsafePerformIO getCurrentDirectory
getHeaders = unsafePerformIO $ do
  contents <- getDirectoryContents headerdir
  let headerFiles = filter (\f -> (takeExtension f) == ".h" -- keep the headers
                                  &&
                                  (not $ isPrefixOf (takeBaseName f) "Derived") -- but not the extra classes
                           ) contents
  return headerFiles
objectFileDir = unsafePerformIO getCurrentDirectory ++ "/object_files"
getObjectFileDirContents = getDirectoryContents objectFileDir
                    
addIncludeDirs pd =
  let lib = (fromJust . library) $ pd
      bi = libBuildInfo lib
      ids = includeDirs bi
      bi' = bi {includeDirs = ids ++ [headerdir, currentdir]}
      lib' = lib {libBuildInfo = bi'}
  in
  pd {library = Just lib'}

addHeaders pd =
  let lib = (fromJust . library) $ pd
      bi = libBuildInfo lib
      is = includes bi
      headers = getHeaders
      bi' = bi {includes = is ++ headers}
      lib' = lib {libBuildInfo = bi'}
  in
  pd {library = Just lib'}

withFltkc op pd =
  let lib = (fromJust . library) $ pd
      bi = libBuildInfo lib
      elds = extraLibDirs bi
      els = extraLibs bi
      bi' = bi {extraLibs = els `op` [fltkclib], extraLibDirs = elds `op` [fltkcdir]}
      lib' = lib {libBuildInfo = bi'}
  in
    pd {library = Just lib'}

getHaskellObjects :: Library -> LocalBuildInfo
                  -> FilePath -> String -> Bool -> IO [FilePath]
getHaskellObjects lib lbi pref wanted_obj_ext allow_split_objs
  | splitObjs lbi && allow_split_objs = do
        let splitSuffix = if compilerVersion (compiler lbi) <
                             Version [6, 11] []
                          then "_split"
                          else "_" ++ wanted_obj_ext ++ "_split"
            dirs = [ pref </> (ModuleName.toFilePath x ++ splitSuffix)
                   | x <- libModules lib ]
        objss <- mapM getDirectoryContents dirs
        let objs = [ dir </> obj
                   | (objs',dir) <- zip objss dirs, obj <- objs',
                     let obj_ext = takeExtension obj,
                     '.':wanted_obj_ext == obj_ext ]
        return objs
  | otherwise  =
        return [ pref </> ModuleName.toFilePath x <.> wanted_obj_ext
               | x <- libModules lib ]

createInternalPackageDB :: FilePath -> IO PackageDB
createInternalPackageDB distPref = do
    let dbFile = distPref </> "package.conf.inplace"
        packageDB = SpecificPackageDB dbFile
    writeFile dbFile "[]"
    return packageDB

myBuildHook pkg_descr local_bld_info user_hooks bld_flags =
    do
      fltkcBuilt <- doesDirectoryExist fltkcdir
      if (not fltkcBuilt) then
         do
           putStrLn "==Compiling C bindings=="
           rawSystemExit normal "make" ["src"]
      else
          return ()
      let new_pkg_descr = (addIncludeDirs . (withFltkc (++)) $ pkg_descr)
          new_local_bld_info = local_bld_info { localPkgDescr = new_pkg_descr }
          (libs, nonlibs) = partition
                               (\c -> case c of
                                        CLibName -> True
                                        _ -> False)
                               (compBuildOrder new_local_bld_info)
          lib_lbi = new_local_bld_info {compBuildOrder = libs}
      buildHook simpleUserHooks new_pkg_descr lib_lbi user_hooks bld_flags
      -- recreate the archive
      let verbosity = fromFlag (buildVerbosity bld_flags)
      info verbosity "Relinking archive ..."
      let pref = buildDir local_bld_info
          verbosity = fromFlag (buildVerbosity bld_flags)
      cobjs <- getObjectFileDirContents >>= return . map (\f -> combine objectFileDir f) . filter (\f -> takeExtension f == ".o")
      withComponentsLBI pkg_descr local_bld_info $ \comp clbi ->
          case comp of
            (CLib lib) -> do
                      hobjs <- getHaskellObjects lib local_bld_info pref objExtension True
                      let staticObjectFiles = hobjs ++ cobjs
                      (arProg, _) <- requireProgram verbosity arProgram (withPrograms local_bld_info)
                      let pkgid = packageId pkg_descr
                          vanillaLibFilePath = pref </> mkLibName pkgid
                      Ar.createArLibArchive verbosity arProg vanillaLibFilePath staticObjectFiles
            _ -> return ()

      -- reuse the inplace package database that has already been created
      let distPref  = fromFlag (buildDistPref bld_flags)
          dbFile = distPref </> "package.conf.inplace"
      -- copy the temporarily created database into a temp file and add to the list of databases
      -- add that file to the list of files to clean up after the installation is done
      (tempFilePath, tempFileHandle) <- openTempFile distPref "package.conf"
      -- don't need the handle
      hClose tempFileHandle
      copyFile dbFile tempFilePath
      let exe_lbi = new_local_bld_info {withPackageDB = withPackageDB new_local_bld_info ++ [SpecificPackageDB tempFilePath], compBuildOrder = nonlibs}
          exe_pkg_descr = new_pkg_descr {extraTmpFiles = extraTmpFiles new_pkg_descr ++ [tempFilePath]}
      buildHook simpleUserHooks exe_pkg_descr exe_lbi user_hooks bld_flags

myCleanHook pd _ uh cf = do
  rawSystemExit normal "make" ["clean"]
  cleanHook autoconfUserHooks pd () uh cf
