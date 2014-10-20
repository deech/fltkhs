import Data.Maybe(fromJust)
import Data.List(partition, isPrefixOf)
import Distribution.Simple.Compiler
import Distribution.Simple.Build
import Distribution.Simple.Configure
import Distribution.Simple.LocalBuildInfo
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Simple.Setup
import Distribution.Simple.Utils
import Distribution.Verbosity
import Distribution.Simple.Program(requireProgram, arProgram)
import Distribution.Simple.BuildPaths(mkLibName)
import Distribution.Simple.PreProcess
import System.IO.Unsafe (unsafePerformIO)
import qualified Distribution.Simple.Program.Ar    as Ar
import qualified Distribution.ModuleName as ModuleName
import Distribution.Simple.BuildPaths
import System.Directory(getCurrentDirectory, getDirectoryContents, copyFile, doesDirectoryExist)
import System.FilePath ( (</>), (<.>), takeExtension,
                         takeDirectory, replaceExtension, splitExtension, combine, takeBaseName)
import System.IO
import Debug.Trace
import Data.Graph
import qualified Distribution.Simple.GHC  as GHC
import qualified Distribution.Simple.JHC  as JHC
import qualified Distribution.Simple.LHC  as LHC
import qualified Distribution.Simple.NHC  as NHC
import qualified Distribution.Simple.Hugs as Hugs
import qualified Distribution.Simple.UHC  as UHC

main = defaultMainWithHooks autoconfUserHooks {
         buildHook = myBuildHook,
         cleanHook = myCleanHook
       }

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

removeExecutables pd = pd {executables = []}

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

buildExe :: Verbosity -> Distribution.Simple.Setup.Flag (Maybe Int)
                      -> PackageDescription -> LocalBuildInfo
                      -> Executable         -> ComponentLocalBuildInfo -> IO ()
buildExe verbosity numJobs pkg_descr lbi exe clbi =
  case compilerFlavor (compiler lbi) of
    GHC  -> GHC.buildExe  verbosity numJobs pkg_descr lbi exe clbi
    JHC  -> JHC.buildExe  verbosity         pkg_descr lbi exe clbi
    LHC  -> LHC.buildExe  verbosity         pkg_descr lbi exe clbi
    Hugs -> Hugs.buildExe verbosity         pkg_descr lbi exe clbi
    NHC  -> NHC.buildExe  verbosity         pkg_descr lbi exe clbi
    UHC  -> UHC.buildExe  verbosity         pkg_descr lbi exe clbi
    _    -> die "Building is not supported with this compiler."

myBuildHook pkg_descr local_bld_info user_hooks bld_flags =
    do
      fltkcBuilt <- doesDirectoryExist fltkcdir
      if (not fltkcBuilt) then
         do
           putStrLn "==Compiling C bindings=="
           rawSystemExit normal "make" ["src"]
      else
          return ()
      let new_pkg_descr = (removeExecutables . addIncludeDirs . (withFltkc (++)) $ pkg_descr)
          new_local_bld_info = local_bld_info { localPkgDescr = new_pkg_descr }
          (libs, nonlibs) = partition
                               (\c -> case c of
                                        (CLibName,_,_) -> True
                                        _ -> False)
                               (componentsConfigs new_local_bld_info)
          lib_lbi = new_local_bld_info {componentsConfigs = libs}
      buildHook simpleUserHooks new_pkg_descr lib_lbi user_hooks bld_flags
      -- reuse the inplace package database that has already been created
      let distPref = fromFlag (buildDistPref bld_flags)
      let dbFile = distPref </> "package.conf.inplace"
      -- copy the temporarily created database into a temp file and add to the list of databases
      -- add that file to the list of files to clean up after the installation is done
      (tempFilePath, tempFileHandle) <- openTempFile distPref "package.conf"
      -- don't need the handle
      hClose tempFileHandle
      copyFile dbFile tempFilePath
      -- recreate the archive
      let verbosity = fromFlag (buildVerbosity bld_flags)
      info verbosity "Relinking archive ..."
      let pref = buildDir local_bld_info
          verbosity = fromFlag (buildVerbosity bld_flags)
      cobjs <- getObjectFileDirContents >>= return . map (\f -> combine objectFileDir f) . filter (\f -> takeExtension f == ".o")
      let with_in_place =  local_bld_info {withPackageDB = withPackageDB local_bld_info ++ [SpecificPackageDB dbFile], componentsConfigs = libs ++ nonlibs}
      let new_pkg_descr = pkg_descr {extraTmpFiles = extraTmpFiles new_pkg_descr ++ [tempFilePath]}
      withAllComponentsInBuildOrder new_pkg_descr with_in_place $ \comp clbi ->
          case comp of
            (CLib lib) -> do
                      info verbosity "Lib ..."
                      hobjs <- getHaskellObjects lib with_in_place pref objExtension True
                      let staticObjectFiles = cobjs ++ hobjs
                      (arProg, _) <- requireProgram verbosity arProgram (withPrograms with_in_place)
                      let vanillaLibFilePath = pref </> (mkLibName $ head $ componentLibraries clbi)
                      Ar.createArLibArchive verbosity with_in_place vanillaLibFilePath staticObjectFiles
                      -- let exe_lbi = new_local_bld_info {withPackageDB = withPackageDB new_local_bld_info ++ [SpecificPackageDB tempFilePath], componentsConfigs = nonlibs}
                      --     exe_pkg_descr = pkg_descr {extraTmpFiles = extraTmpFiles new_pkg_descr ++ [tempFilePath]}
                      -- buildHook simpleUserHooks exe_pkg_descr exe_lbi user_hooks bld_flags exe_pkg_descr exe_lbi user_hooks bld_flags
            (CExe exe) -> do
                      info verbosity "Exe ..."
                      preprocessComponent new_pkg_descr comp with_in_place False verbosity []
                      info verbosity $ "Building executable " ++ exeName exe ++ "..."
                      info verbosity $ show $ clbi
                      info verbosity $ show $ withPackageDB with_in_place
                      info verbosity $ show clbi
                      buildExe verbosity (buildNumJobs bld_flags) new_pkg_descr with_in_place exe clbi
            _ -> return ()

myCleanHook pd _ uh cf = do
  rawSystemExit normal "make" ["clean"]
  cleanHook autoconfUserHooks pd () uh cf
