import Data.Maybe(fromJust)
import Data.List(partition, isPrefixOf)
import Distribution.Simple.Compiler
import Distribution.Simple.LocalBuildInfo
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.System
import Distribution.Simple.Setup
import Distribution.Simple.Utils
import Distribution.Verbosity
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
import System.IO.Unsafe (unsafePerformIO)
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
import qualified Distribution.InstalledPackageInfo as Installed
import System.Environment (getEnv)

main :: IO ()
main = defaultMainWithHooks defaultUserHooks {
  preConf = case buildOS of
              Windows -> myCMakePreConf
              _ -> myPreConf,
  buildHook = myBuildHook,
  cleanHook = myCleanHook,
  copyHook = copyCBindings
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
       if (null $ filter ((==) "libfltkc.a") libs)
        then runCMake
        else return ()
       return ()
    preConf defaultUserHooks args flags

fltkcdir = unsafePerformIO getCurrentDirectory ++ "/c-lib"
fltkclib = "fltkc"

withFltkc op pd =
  let lib = (fromJust . library) pd
      bi = libBuildInfo lib
      elds = extraLibDirs bi
      els = extraLibs bi
      bi' = bi {extraLibs = els `op` [fltkclib], extraLibDirs = elds `op` [fltkcdir]}
      lib' = lib {libBuildInfo = bi'}
  in
    pd {library = Just lib'}

myBuildHook pkg_descr local_bld_info user_hooks bld_flags =
  do let compileC = do
             putStrLn "==Compiling C bindings=="
             rawSystemExit normal "make" []
     cdirexists <- doesDirectoryExist fltkcdir
     if cdirexists
       then
       do
        clibraries <- getDirectoryContents fltkcdir
        when (null $ filter (Data.List.isInfixOf "fltkc") clibraries) compileC
       else compileC
     let new_pkg_descr = withFltkc (++) pkg_descr
     buildHook defaultUserHooks new_pkg_descr local_bld_info user_hooks bld_flags

copyCBindings :: PackageDescription -> LocalBuildInfo -> UserHooks -> CopyFlags -> IO ()
copyCBindings pkg_descr lbi uhs flags = do
    (copyHook defaultUserHooks) pkg_descr lbi uhs flags
    let libPref = libdir . absoluteInstallDirs pkg_descr lbi
                . fromFlag . copyDest
                $ flags
    rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
        ["c-lib/libfltkc.a", libPref]
    case buildOS of
     Linux -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
              ["c-lib/libfltkcdyn.so", libPref]

myCleanHook pd x uh cf = do
  rawSystemExit normal "make" ["clean"]
  cleanHook defaultUserHooks pd x uh cf
