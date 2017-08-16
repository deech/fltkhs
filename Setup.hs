{-# LANGUAGE CPP #-}
import Data.Maybe(fromJust, isJust, fromMaybe, maybeToList)
import Distribution.Simple.Compiler
import Distribution.Simple.LocalBuildInfo
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.System
import Distribution.Simple.Setup
import Distribution.Simple.Utils
import Distribution.Verbosity
import Distribution.Text ( display )
import Control.Monad
import Data.List
import Control.Applicative((<$>))
import Distribution.Simple.Program
  ( Program(..), ConfiguredProgram(..), programPath
   , requireProgram, requireProgramVersion
   , rawSystemProgramConf, rawSystemProgram
   , greencardProgram, cpphsProgram, hsc2hsProgram, c2hsProgram
   , happyProgram, alexProgram, ghcProgram, gccProgram, requireProgram, arProgram)
import Distribution.Simple.Program.Db
import Distribution.Simple.PreProcess
import Distribution.Simple.Register ( generateRegistrationInfo, registerPackage )
import Distribution.Simple.InstallDirs (fromPathTemplate)
import System.IO.Unsafe (unsafePerformIO)
import System.IO.Error
import qualified Distribution.Simple.Program.Ar    as Ar
import qualified Distribution.ModuleName as ModuleName
import Distribution.Simple.BuildPaths
import System.Directory(getCurrentDirectory, getDirectoryContents, withCurrentDirectory, doesDirectoryExist, makeAbsolute, doesFileExist)
import System.FilePath ( (</>), (<.>), takeExtension, combine, takeBaseName, takeDirectory)
import qualified Distribution.Simple.GHC  as GHC
import qualified Distribution.Simple.JHC  as JHC
import qualified Distribution.Simple.LHC  as LHC
import qualified Distribution.Simple.UHC  as UHC
import qualified Distribution.Simple.PackageIndex as PackageIndex
import Distribution.PackageDescription as PD
import Distribution.InstalledPackageInfo (ldOptions, extraGHCiLibraries, showInstalledPackageInfo, libraryDynDirs, libraryDirs)
import System.Environment (getEnv, setEnv)

main :: IO ()
main = defaultMainWithHooks autoconfUserHooks {
  preConf = myPreConf,
  postConf = myPostConf,
  buildHook = myBuildHook,
  cleanHook = myCleanHook,
  copyHook = copyCBindingsAndBundledExecutables,
  regHook = registerHook
  }

fltkSource = "fltk-1.3.4-1"

runMake :: [String] -> IO ()
runMake args =
  case buildOS of
    Windows -> rawSystemExit normal "make" args
    os | os `elem` [FreeBSD, OpenBSD, NetBSD, DragonFly]
      -> rawSystemExit normal "gmake" args
    _ -> rawSystemExit normal "make" args

buildFltk :: IO FilePath -> Bool -> IO ()
buildFltk prefix openGL = do
  rawSystemExit normal "tar" ["-zxf", fltkSource ++ "-source.tar.gz"]
  projectRoot <- getCurrentDirectory
  prefix' <- prefix
  let fltkDir = projectRoot </>  fltkSource
      fltkFlags = (if (openGL) then ["--enable-gl"] else ["--disable-gl"]) ++
                  [
                   "--enable-shared",
                   "--enable-localjpeg",
                   "--enable-localzlib",
                   "--enable-localpng",
                   ("--prefix=" ++ prefix')
                  ]
  withCurrentDirectory
    fltkDir
    (
      let make = runMake [] >> runMake ["install"]
      in
      case buildOS of
        Windows -> do
          rawSystemExit normal "sh" ([(fltkDir </> "configure")] ++ fltkFlags)
          make
          updateEnv "PATH" (windowsFriendlyPaths (prefix' </> "bin"))
        _ -> do
          rawSystemExit normal (fltkDir </> "configure") fltkFlags
          make
          updateEnv "PATH" (prefix' </> "bin")
    )

myPreConf :: Args -> ConfigFlags -> IO HookedBuildInfo
myPreConf args flags = do
   if (bundledBuild flags)
    then do
      putStrLn "Building bundled FLTK"
      prefix <- bundlePrefix flags ""
      fltkBuilt <- doesDirectoryExist prefix
      if (not fltkBuilt)
        then do
          buildFltk (case buildOS of { Windows -> cygpath "-u" prefix; _ -> return prefix;}) (openGLSupport flags)
          case buildOS of
            Windows -> updateEnv "PATH" (windowsFriendlyPaths (prefix </> "bin"))
            _ -> updateEnv "PATH" (prefix </> "bin")
        else putStrLn "FLTK already built."
      else return ()
   putStrLn "Running autoconf ..."
   case buildOS of
     Windows -> rawSystemExit normal "sh" ["autoconf"]
     _ -> rawSystemExit normal "autoconf" []
   fltkPathAdded <-
     if (bundledBuild flags)
     then do
       prefix <- bundlePrefix flags ""
       return flags{ configProgramPaths = [("fltk-config", prefix </> "bin" </> "fltk-config")] ++ (configProgramPaths flags)}
     else return flags
   preConf autoconfUserHooks args fltkPathAdded

myPostConf :: Args -> ConfigFlags -> PackageDescription -> LocalBuildInfo -> IO ()
myPostConf args flags pd lbi = do
  let confFlags = if (openGLSupport flags)
                  then (flags{ configConfigureArgs = (configConfigureArgs flags) ++ ["--enable-gl"]})
                  else flags
  (major, minor, patch) <- getFltkVersion
  apiVersion <- getApiVersion
  let confFlagsWithVersion =
        confFlags
        {
          configConfigureArgs = (configConfigureArgs confFlags) ++ [
                   ("--with-fltk-major-version=" ++ major),
                   ("--with-fltk-minor-version=" ++ minor),
                   ("--with-fltk-patch-version=" ++ patch)
                 ]
        }
  postConf autoconfUserHooks args confFlagsWithVersion (addApiVersion pd apiVersion) lbi

fltkcdir :: FilePath
fltkcdir = unsafePerformIO $ do
  d <- getCurrentDirectory
  return (d </> "c-lib")
fltkclib = "fltkc"

getFltkVersion :: IO (String, String, String)
getFltkVersion = do
  versionString <- (case buildOS of
                      Windows -> rawSystemStdout normal "sh" ["fltk-config", "--version"]
                      _ -> rawSystemStdout normal "fltk-config" ["--version"])
  return (fltkVersion versionString)

fltkVersion :: String -> (String,String,String)
fltkVersion version =
  let (major, minorVersion) = break ((==) '.') (unlines (lines version))
      (minor, patchVersion) = break ((==) '.') (drop 1 minorVersion)
      patch = drop 1 patchVersion
  in (major, minor, patch)

flagIsSet :: PD.FlagName -> ConfigFlags -> Bool
flagIsSet flag configFlags = maybe False id (lookup flag (configConfigurationsFlags configFlags))

addFltkcDir :: PackageDescription -> PackageDescription
addFltkcDir pkg_descr =
  pkg_descr {
     library = fmap (\l' -> l' {
                              libBuildInfo =
                                 (libBuildInfo l') {
                                    extraLibDirs = (extraLibDirs (libBuildInfo l')) ++ [fltkcdir]
                                 }
                            }
                    )
                    (library pkg_descr)
  }

updateEnv :: String -> String -> IO ()
updateEnv env value = do
  old <- tryIOError (getEnv env)
  setEnv env ((either (const value)
                      (\old' -> value ++
                               (case buildOS of
                                  Windows -> ";"
                                  _ -> ":") ++
                               old'
                      )
                      old))


replaceAllInfixes :: String -> String -> String -> String
replaceAllInfixes needle subString haystack =
  concat
    (unfoldr (\str -> if (null str)
                      then Nothing
                      else if (needle `isPrefixOf` str)
                           then Just (subString, drop (length needle) str)
                           else Just ([head str], tail str))
             haystack)

bundledBuild flags = flagIsSet (FlagName "bundled") flags
openGLSupport flags = flagIsSet (FlagName "opengl") flags

bundlePrefix flags dir =
  let (Distribution.Simple.Setup.Flag prefixTemplate) = libdir (configInstallDirs flags)
  in
  makeAbsolute ((fromPathTemplate prefixTemplate) </> "fltk-bundled" </> dir)

cygpath o p =
  let removeTrailingNewline = head . lines  in
  removeTrailingNewline<$>(rawSystemStdout normal "cygpath" [o,  p])

windowsFriendlyPaths s =
  if (isPrefixOf "/" s)
  then unsafePerformIO (cygpath "-m" s)
  else s

getApiVersion :: IO Int
getApiVersion = do
  (major, minor, patch) <- getFltkVersion
  return ((((read major) :: Int) * 10000) +
            (((read minor) :: Int) * 100) +
            ((read patch) :: Int))

addApiVersion :: PackageDescription -> Int -> PackageDescription
addApiVersion pkg_descr apiVersion =
  let fixedLib =
        do
          l <- library pkg_descr
          let cpp = cppOptions (libBuildInfo l)
              -- have to add to ccOptions as well otherwise c2hs won't see it.
              cc = ccOptions (libBuildInfo l)
              fltkApiFlag = "-DFLTK_API_VERSION=" ++ (show apiVersion)
          return (l {
                      libBuildInfo =
                        (libBuildInfo l) {
                           cppOptions = cpp ++ [fltkApiFlag],
                           ccOptions = cc ++ [fltkApiFlag]
                        }
                   })
  in
  pkg_descr{ library = fixedLib }

myBuildHook pkg_descr local_bld_info user_hooks bld_flags = do
     let confFlags = configFlags local_bld_info
     if (bundledBuild confFlags)
     then bundlePrefix confFlags "bin" >>=
          case buildOS of
            Windows -> updateEnv "PATH" . windowsFriendlyPaths
            _ -> updateEnv "PATH"
     else return ()
     let compileC = putStrLn "==Compiling C bindings==" >> runMake []
     cdirexists <- doesDirectoryExist fltkcdir
     if cdirexists
       then
       do
        clibraries <- getDirectoryContents fltkcdir
        when (null $ filter (Data.List.isInfixOf "fltkc") clibraries) compileC
       else compileC
     apiVersion <- getApiVersion
     let apiVersionAddedPkgDescription = addApiVersion pkg_descr apiVersion
     case buildOS of
       Windows ->
         let rewritePaths :: PackageDescription -> IO PackageDescription
             rewritePaths pkg_descr =
               let lib = library pkg_descr
                   ld_incdirs :: Maybe ([String], [String])
                   ld_incdirs = fmap (\lib' -> (PD.ldOptions (libBuildInfo lib'), includeDirs (libBuildInfo lib')))  lib
                   stdCppGccPthreadPaths ghcPath =
                      [
                        ((takeDirectory . takeDirectory) ghcPath) </> "mingw" </> "lib" </> "gcc" </> "x86_64-w64-mingw32" </> "5.2.0"
                      , ((takeDirectory . takeDirectory) ghcPath) </> "mingw" </> "x86_64-w64-mingw32" </> "lib"
                      ]
               in
               do
                 ghcPath <- rawSystemStdout normal "sh" ["-c", "which ghc"]
                 cppGccPthreadPaths <- mapM (cygpath "-w") (stdCppGccPthreadPaths ghcPath)
                 bundledInclude <- if (bundledBuild confFlags)
                                   then (bundlePrefix confFlags) "include" >>= \p -> return [p]
                                   else return []
                 bundledLib <- if (bundledBuild confFlags)
                               then (bundlePrefix confFlags) "lib" >>= \p -> return [p]
                               else return []
                 let fixedLib = maybe Nothing
                                     (\(ld, incDirs) ->
                                          fmap (\l' -> l' {
                                                   libBuildInfo =
                                                     (libBuildInfo l') {
                                                        PD.ldOptions = fmap windowsFriendlyPaths ld,
                                                        includeDirs = fmap windowsFriendlyPaths (incDirs ++ bundledInclude),
                                                        extraLibDirs = cppGccPthreadPaths ++ (extraLibDirs (libBuildInfo l')) ++ bundledLib,
                                                        extraLibs = ["stdc++", "gcc", "pthread"]
                                                     }
                                                })
                                                lib
                                     )
                                     ld_incdirs
                 return (pkg_descr {library = fixedLib})
         in do
           fixedPkgDescr <- rewritePaths apiVersionAddedPkgDescription >>= return . addFltkcDir
           buildHook autoconfUserHooks fixedPkgDescr local_bld_info user_hooks bld_flags
       Linux -> do
         updateEnv "LIBRARY_PATH" fltkcdir
         buildHook autoconfUserHooks (addFltkcDir apiVersionAddedPkgDescription) local_bld_info user_hooks bld_flags
       _ -> do
         updateEnv "DYLD_LIBRARY_PATH" fltkcdir
         updateEnv "LIBRARY_PATH" fltkcdir
         buildHook autoconfUserHooks apiVersionAddedPkgDescription local_bld_info user_hooks bld_flags

copyCBindingsAndBundledExecutables :: PackageDescription -> LocalBuildInfo -> UserHooks -> CopyFlags -> IO ()
copyCBindingsAndBundledExecutables pkg_descr lbi uhs flags = do
    (copyHook autoconfUserHooks) pkg_descr lbi uhs flags
    let installDirs = absoluteInstallDirs pkg_descr lbi
                      . fromFlag . copyDest
                      $ flags
        libPref = libdir installDirs
    rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
        [fltkcdir </> "libfltkc.a" , libPref]
    case buildOS of
     OSX -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
              ["c-lib" </> "libfltkc-dyn.dylib", libPref]
     _ -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
            ["c-lib" </> "libfltkc.so", libPref]
    if (bundledBuild (configFlags lbi))
    then do
      executableDir <- (bundlePrefix (configFlags lbi)) "bin"
      projectRoot <- getCurrentDirectory
      let binPref = bindir installDirs
      let fltkDir = projectRoot </>  fltkSource
      fluidExists <- doesFileExist (binPref </> "fluid")
      fltkConfigExists <- doesFileExist (binPref </> "fltk-config")
      if (not fluidExists)
      then rawSystemExit
               (fromFlag $ copyVerbosity flags) "cp"
               [(executableDir </> "fluid"), binPref]
      else return ()
      if (not fltkConfigExists)
      then rawSystemExit
               (fromFlag $ copyVerbosity flags) "cp"
               [(executableDir </> "fltk-config"), binPref]
      else return ()
    else return ()

myCleanHook pd x uh cf = do
  case buildOS of
   os | os `elem` [FreeBSD, OpenBSD, NetBSD, DragonFly]
     -> rawSystemExit normal "gmake" ["clean"]
   _ -> rawSystemExit normal "make" ["clean"]
  cleanHook autoconfUserHooks pd x uh cf

-- Based on code in "Gtk2HsSetup.hs" from "gtk" package
registerHook pkg_descr localbuildinfo _ flags =
    if hasLibs pkg_descr
    then register pkg_descr localbuildinfo flags
    else setupMessage verbosity
           "Package contains no library to register:" (packageId pkg_descr)
  where verbosity = fromFlag (regVerbosity flags)

register :: PackageDescription -> LocalBuildInfo -> RegisterFlags -> IO ()
register pkg@PackageDescription { library = Just lib } lbi regFlags = do
    putStrLn "registering ..."
    let clbi = getComponentLocalBuildInfo lbi CLibName
    installedPkgInfoRaw' <- generateRegistrationInfo verbosity pkg lib lbi clbi inplace False distPref packageDb
    let installedPkgInfoRaw =
         case buildOS of
           Windows -> installedPkgInfoRaw' { Distribution.InstalledPackageInfo.ldOptions = fmap windowsFriendlyPaths (Distribution.InstalledPackageInfo.ldOptions installedPkgInfoRaw') }
           _ -> installedPkgInfoRaw'
    let installedPkgInfo = installedPkgInfoRaw {
                                libraryDynDirs = (libraryDynDirs installedPkgInfoRaw) ++ (libraryDirs installedPkgInfoRaw),
                                -- this is what this whole register code is all about
                                extraGHCiLibraries =
                                  case buildOS of
                                    Windows -> ["libfltkc"]
                                    _ -> ["fltkc"]
                                }

     -- Three different modes:
    case () of
     _ | modeGenerateRegFile   -> writeRegistrationFile installedPkgInfo
       | modeGenerateRegScript -> die "Generate Reg Script not supported"
       | otherwise             ->
          registerPackage verbosity (compiler lbi) (withPrograms lbi) False {- multiinstance -} packageDbs installedPkgInfo
  where
    modeGenerateRegFile = isJust (flagToMaybe (regGenPkgConf regFlags))
    regFile             = fromMaybe (display (packageId pkg) <.> "conf")
                                    (fromFlag (regGenPkgConf regFlags))
    modeGenerateRegScript = fromFlag (regGenScript regFlags)
    inplace   = fromFlag (regInPlace regFlags)
    packageDbs = nub $ withPackageDB lbi
                    ++ maybeToList (flagToMaybe  (regPackageDB regFlags))
    packageDb = registrationPackageDB packageDbs
    distPref  = fromFlag (regDistPref regFlags)
    verbosity = fromFlag (regVerbosity regFlags)

    writeRegistrationFile installedPkgInfo = do
      notice verbosity ("Creating package registration file: " ++ regFile)
      writeUTF8File regFile (showInstalledPackageInfo installedPkgInfo)
