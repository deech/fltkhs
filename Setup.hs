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
import System.FilePath ( (</>), (<.>), takeExtension, combine, takeBaseName, takeDirectory)
import qualified Distribution.Simple.GHC  as GHC
import qualified Distribution.Simple.JHC  as JHC
import qualified Distribution.Simple.LHC  as LHC
import qualified Distribution.Simple.UHC  as UHC
import qualified Distribution.Simple.PackageIndex as PackageIndex
import Distribution.PackageDescription as PD
import Distribution.InstalledPackageInfo (extraGHCiLibraries, showInstalledPackageInfo)
import System.Environment (getEnv, setEnv)

main :: IO ()
main = defaultMainWithHooks autoconfUserHooks {
  preConf = myPreConf,
  buildHook = myBuildHook,
  cleanHook = myCleanHook,
  copyHook = copyCBindings,
  regHook = registerHook
  }

myPreConf :: Args -> ConfigFlags -> IO HookedBuildInfo
myPreConf args flags = do
   putStrLn "Running autoconf ..."
   case buildOS of
     Windows -> rawSystemExit normal "sh" ["autoconf"]
     _ -> rawSystemExit normal "autoconf" []
   preConf autoconfUserHooks args flags

fltkcdir :: FilePath
fltkcdir = unsafePerformIO $ do
  d <- getCurrentDirectory
  return (d </> "c-lib")
fltkclib = "fltkc"


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

addToEnvironmentVariable :: String -> String -> IO ()
addToEnvironmentVariable env value = do
  currentLdLibraryPath <- tryIOError (getEnv env)
  setEnv env ((either (const "")
                      (\curr -> curr ++
                               (case buildOS of
                                  Windows -> ";"
                                  _ -> ":"))
                      currentLdLibraryPath) ++ value)

myBuildHook pkg_descr local_bld_info user_hooks bld_flags =
  do let compileC = do
             putStrLn "==Compiling C bindings=="
             case buildOS of
              Windows -> rawSystemExit normal "make" []
              os | os `elem` [FreeBSD, OpenBSD, NetBSD, DragonFly]
                -> rawSystemExit normal "gmake" []
              _ -> rawSystemExit normal "make" []
     cdirexists <- doesDirectoryExist fltkcdir
     if cdirexists
       then
       do
        clibraries <- getDirectoryContents fltkcdir
        when (null $ filter (Data.List.isInfixOf "fltkc") clibraries) compileC
       else compileC
     case buildOS of
       Windows ->
         let rewritePaths :: PackageDescription -> IO PackageDescription
             rewritePaths pkg_descr =
               let lib = library pkg_descr
                   ld_incdirs :: Maybe ([String], [String])
                   ld_incdirs = fmap (\lib' -> (ldOptions (libBuildInfo lib'), includeDirs (libBuildInfo lib')))  lib
                   removeTrailingNewline = head . lines
                   replaceAllInfixes :: String -> String -> String -> String
                   replaceAllInfixes needle subString haystack =
                     concat
                       (unfoldr (\str -> if (null str)
                                         then Nothing
                                         else if (needle `isPrefixOf` str)
                                              then Just (subString, drop (length needle) str)
                                              else Just ([head str], tail str))
                                haystack)
                   stdCppGccPthreadPaths ghcPath =
                      [
                        ((takeDirectory . takeDirectory) ghcPath) </> "mingw" </> "lib" </> "gcc" </> "x86_64-w64-mingw32" </> "5.2.0"
                      , ((takeDirectory . takeDirectory) ghcPath) </> "mingw" </> "x86_64-w64-mingw32" </> "lib"
                      ]
                   cygpath o p = removeTrailingNewline<$>(rawSystemStdout normal "cygpath" [o,  p])
               in
               do
                 fullMingwPath <- cygpath "-m" "/mingw64"
                 ghcPath <- rawSystemStdout normal "sh" ["-c", "which ghc"]
                 cppGccPthreadPaths <- mapM (cygpath "-w") (stdCppGccPthreadPaths ghcPath)
                 let replaceMingw = replaceAllInfixes "/mingw64" fullMingwPath
                 let fixedLib = maybe Nothing
                                     (\(ld, incDirs) ->
                                          fmap (\l' -> l' {
                                                   libBuildInfo =
                                                     (libBuildInfo l') {
                                                        ldOptions = fmap replaceMingw ld,
                                                        includeDirs = fmap replaceMingw incDirs,
                                                        extraLibDirs = cppGccPthreadPaths ++ (extraLibDirs (libBuildInfo l')),
                                                        extraLibs = ["stdc++", "gcc", "pthread"]
                                                     }
                                                })
                                                lib
                                     )
                                     ld_incdirs
                 return (pkg_descr {library = fixedLib})
         in do
           fixedPkgDescr <- rewritePaths pkg_descr >>= return . addFltkcDir
           buildHook autoconfUserHooks fixedPkgDescr local_bld_info user_hooks bld_flags
       Linux -> do
         addToEnvironmentVariable "LD_LIBRARY_PATH" fltkcdir
         addToEnvironmentVariable "LIBRARY_PATH" fltkcdir
         buildHook autoconfUserHooks pkg_descr local_bld_info user_hooks bld_flags
       _ -> do
         addToEnvironmentVariable "DYLD_LIBRARY_PATH" fltkcdir
         addToEnvironmentVariable "LIBRARY_PATH" fltkcdir
         buildHook autoconfUserHooks pkg_descr local_bld_info user_hooks bld_flags


copyCBindings :: PackageDescription -> LocalBuildInfo -> UserHooks -> CopyFlags -> IO ()
copyCBindings pkg_descr lbi uhs flags = do
    (copyHook autoconfUserHooks) pkg_descr lbi uhs flags
    let libPref = libdir . absoluteInstallDirs pkg_descr lbi
                . fromFlag . copyDest
                $ flags
    rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
        [fltkcdir </> "libfltkc.a" , libPref]
    case buildOS of
     OSX -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
              ["c-lib" </> "libfltkc-dyn.dylib", libPref]
     _ -> rawSystemExit (fromFlag $ copyVerbosity flags) "cp"
            ["c-lib" </> "libfltkc-dyn.so", libPref]

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
    let clbi = getComponentLocalBuildInfo lbi CLibName

    installedPkgInfoRaw <- generateRegistrationInfo

                           verbosity pkg lib lbi clbi inplace False distPref packageDb


    let installedPkgInfo = installedPkgInfoRaw {
                                -- this is what this whole register code is all about
                                extraGHCiLibraries =
                                  case buildOS of
                                    Windows -> ["libfltkc-dyn"]
                                    _ -> ["fltkc-dyn"]
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
