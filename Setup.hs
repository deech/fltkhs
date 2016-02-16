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
import Distribution.Simple.Program
  ( Program(..), ConfiguredProgram(..), programPath
   , requireProgram, requireProgramVersion
   , rawSystemProgramConf, rawSystemProgram
   , greencardProgram, cpphsProgram, hsc2hsProgram, c2hsProgram
   , happyProgram, alexProgram, ghcProgram, gccProgram, requireProgram, arProgram)
import Distribution.Simple.Program.Db
import Distribution.Simple.PreProcess
import Distribution.Simple.Register ( generateRegistrationInfo, registerPackage )
import System.IO.Unsafe (unsafePerformIO)
import System.IO.Error
import qualified Distribution.Simple.Program.Ar    as Ar
import qualified Distribution.ModuleName as ModuleName
import Distribution.Simple.BuildPaths
import System.Directory(getCurrentDirectory, getDirectoryContents, doesDirectoryExist)
import System.FilePath ( (</>), (<.>), takeExtension, combine, takeBaseName)
import qualified Distribution.Simple.GHC  as GHC
import qualified Distribution.Simple.JHC  as JHC
import qualified Distribution.Simple.LHC  as LHC
import qualified Distribution.Simple.UHC  as UHC
import qualified Distribution.Simple.PackageIndex as PackageIndex
import Distribution.PackageDescription as PD
import Distribution.InstalledPackageInfo (extraGHCiLibraries, showInstalledPackageInfo)
import System.Environment (getEnv, setEnv)

main :: IO ()
main = defaultMainWithHooks defaultUserHooks {
  preConf = case buildOS of
              Windows -> myCMakePreConf
              _ -> myPreConf,
  buildHook = myBuildHook,
  cleanHook = myCleanHook,
  copyHook = copyCBindings,
  regHook = registerHook
  }

myPreConf :: Args -> ConfigFlags -> IO HookedBuildInfo
myPreConf args flags = do
   putStrLn "Running autoconf ..."
   rawSystemExit normal "autoconf" []
   preConf defaultUserHooks args flags

myCMakePreConf :: Args -> ConfigFlags -> IO HookedBuildInfo
myCMakePreConf args flags =
  do
    let runCMake = do
        fltkHome <- getEnv "FLTK_HOME"
        putStrLn "Running cmake ..."
        rawSystemExit verbose "cmake" [".", "-G", "MSYS Makefiles", "-DFLTK_HOME=" ++ fltkHome]
    clibExists <- doesDirectoryExist fltkcdir
    if (not clibExists)
     then runCMake
     else do
       libs <- getDirectoryContents fltkcdir
       if (null $ filter ((==) "libfltkc.dll") libs)
        then runCMake
        else return ()
       return ()
    preConf defaultUserHooks args flags

fltkcdir = unsafePerformIO getCurrentDirectory ++ "/c-lib"
fltkclib = "fltkc"

addToEnvironmentVariable :: String -> String -> IO ()
addToEnvironmentVariable env value = do
  currentLdLibraryPath <- tryIOError (getEnv env)
  setEnv env ((either (const "") (\curr -> curr ++ ":") currentLdLibraryPath) ++ value)

myBuildHook pkg_descr local_bld_info user_hooks bld_flags =
  do let compileC = do
             putStrLn "==Compiling C bindings=="
             case buildOS of
              Windows -> rawSystemExit normal "make" []
              _ -> rawSystemExit normal "make" []
     cdirexists <- doesDirectoryExist fltkcdir
     if cdirexists
       then
       do
        clibraries <- getDirectoryContents fltkcdir
        when (null $ filter (Data.List.isInfixOf "fltkc") clibraries) compileC
       else compileC
     case buildOS of
       Windows -> addToEnvironmentVariable "PATH" fltkcdir
       Linux -> do
         addToEnvironmentVariable "LD_LIBRARY_PATH" fltkcdir
         addToEnvironmentVariable "LIBRARY_PATH" fltkcdir
       _ -> do
         addToEnvironmentVariable "DYLD_LIBRARY_PATH" fltkcdir
         addToEnvironmentVariable "LIBRARY_PATH" fltkcdir
     buildHook defaultUserHooks pkg_descr local_bld_info user_hooks bld_flags

copyCBindings :: PackageDescription -> LocalBuildInfo -> UserHooks -> CopyFlags -> IO ()
copyCBindings pkg_descr lbi uhs flags = do
    (copyHook defaultUserHooks) pkg_descr lbi uhs flags
    let libPref = libdir . absoluteInstallDirs pkg_descr lbi
                . fromFlag . copyDest
                $ flags
    rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
        ["c-lib/libfltkc.a", libPref]
    print buildOS
    case buildOS of
     Linux -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
              ["c-lib/libfltkc-dyn.so", libPref]
     OSX -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
              ["c-lib/libfltkc-dyn.dylib", libPref]
     Windows ->
            rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
              ["c-lib" </> "libfltkc-dyn.dll", libPref]

myCleanHook pd x uh cf = do
  rawSystemExit normal "make" ["clean"]
  cleanHook defaultUserHooks pd x uh cf

-- Based on code in "Gtk2HsSetup.hs" from "gtk" package
registerHook pkg_descr localbuildinfo _ flags =
    if hasLibs pkg_descr
    then register pkg_descr localbuildinfo flags
    else setupMessage verbosity
           "Package contains no library to register:" (packageId pkg_descr)
  where verbosity = fromFlag (regVerbosity flags)

register :: PackageDescription -> LocalBuildInfo -> RegisterFlags -> IO ()
register pkg@PackageDescription { library = Just lib } lbi regFlags = do
    let clbi = getComponentLocalBuildInfo lbi CLibName

    installedPkgInfoRaw <- generateRegistrationInfo

                           verbosity pkg lib lbi clbi inplace False distPref packageDb


    let installedPkgInfo = installedPkgInfoRaw {
                                -- this is what this whole register code is all about
                                extraGHCiLibraries = ["fltkc-dyn"] }

     -- Three different modes:
    case () of
     _ | modeGenerateRegFile   -> writeRegistrationFile installedPkgInfo
       | modeGenerateRegScript -> die "Generate Reg Script not supported"
       | otherwise             -> registerPackage verbosity
                                    installedPkgInfo pkg lbi inplace packageDbs
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
