{-# LANGUAGE CPP, OverloadedStrings #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.System
import Distribution.Simple.Setup
import Distribution.Simple.Utils
import Distribution.Verbosity
import Data.List
import System.Directory(listDirectory, withCurrentDirectory, doesDirectoryExist, makeAbsolute, doesFileExist, getTemporaryDirectory)
import System.FilePath ( (</>), takeDirectory,takeExtension, takeFileName, takeBaseName)
import Distribution.PackageDescription as PD
import Control.Monad.Extra
import Data.Maybe
import Distribution.Types.LocalBuildInfo
import Distribution.Simple.LocalBuildInfo
import GHC.Stack

main :: HasCallStack => IO ()
main =
  defaultMainWithHooks
    simpleUserHooks
    { buildHook = myBuildHook
    , copyHook = myCopyHook
    , regHook = myRegHook
    , instHook = myInstHook
    }

rebuildPackageDescription  :: HasCallStack => Verbosity -> PackageDescription -> ConfigFlags -> IO PackageDescription
rebuildPackageDescription verbosity pd confFlags = do
  let (libHbi, exesHbi) = (maybe mempty libBuildInfo (library pd), fmap (\e -> (exeName e, buildInfo e)) (executables pd))
  let packageVersion = versionString pd
  newLibHbi <- getNewHbi packageVersion confFlags verbosity libHbi
  let newPd = updatePackageDescription (Just newLibHbi, exesHbi) pd
  pure $
    newPd
    { executables =
        map (\e -> e { buildInfo =
                         (buildInfo e)
                         { ldOptions = filter ((/=) "-static") (ldOptions (buildInfo e))}
                     }
            )
            (executables newPd)
    }

myBuildHook :: HasCallStack => PackageDescription -> LocalBuildInfo -> UserHooks -> BuildFlags -> IO ()
myBuildHook pd lbi uhs bfs = do
  let verbosity = fromFlag (buildVerbosity bfs)
  let packageVersion = versionString pd
  buildFltkAndBindings packageVersion (configFlags lbi) verbosity
  newPd <- rebuildPackageDescription verbosity pd (configFlags lbi)
  (buildHook simpleUserHooks) newPd lbi uhs bfs

copyFluid :: PackageDescription -> LocalBuildInfo -> Verbosity -> ConfigFlags -> Distribution.Simple.Setup.Flag CopyDest -> IO ()
copyFluid pd lbi verbosity confFlags destFlag = do
  tmpDir <- getTemporaryDirectory
  stagingDirectories <-
    getStagingDirectoriesCreateIfMissing (bundledBuild confFlags) (openGLSupport confFlags) verbosity (versionString pd) tmpDir
  let installDirs = (absoluteInstallDirs pd lbi . fromFlag) destFlag
  fluidExe <- windowsFriendlyPaths verbosity ((fltkBundledDir stagingDirectories) </> "bin" </> "fluid")
  createDirectoryIfMissingVerbose verbosity True (bindir installDirs)
  installExecutableFile verbosity fluidExe ((bindir installDirs) </> (takeFileName fluidExe))

myCopyHook :: HasCallStack => PackageDescription -> LocalBuildInfo -> UserHooks -> CopyFlags -> IO ()
myCopyHook pd lbi uhs cfs = do
  let verbosity = fromFlag (copyVerbosity cfs)
  let confFlags = configFlags lbi
  newPd <- rebuildPackageDescription verbosity pd (configFlags lbi)
  (copyHook simpleUserHooks) newPd lbi uhs cfs
  copyFluid pd lbi verbosity confFlags (copyDest cfs)

myInstHook :: HasCallStack => PackageDescription -> LocalBuildInfo -> UserHooks -> InstallFlags -> IO ()
myInstHook pd lbi uhs ifs = do
  let verbosity = fromFlag (installVerbosity ifs)
  newPd <- rebuildPackageDescription verbosity pd (configFlags lbi)
  (instHook simpleUserHooks) newPd lbi uhs ifs
  copyFluid pd lbi verbosity (configFlags lbi) (installDest ifs)

myRegHook :: HasCallStack => PackageDescription -> LocalBuildInfo -> UserHooks -> RegisterFlags -> IO ()
myRegHook pd lbi uhs rfs = do
  let verbosity = fromFlag (regVerbosity rfs)
  newPd <- rebuildPackageDescription verbosity pd (configFlags lbi)
  (regHook simpleUserHooks) newPd lbi uhs rfs

runMake :: HasCallStack => FilePath -> [String] -> IO ()
runMake p args =
  withCurrentDirectory p
    (case buildOS of
    Windows -> rawSystemExit normal "make" args
    os | os `elem` [FreeBSD, OpenBSD, NetBSD, DragonFly]
      -> rawSystemExit normal "gmake" args
    _ -> rawSystemExit normal "make" args)

data LdParts =
  LdParts
  { ldPartsArchives :: [String]
  , ldPartsArchiveLocations :: [FilePath]
  , ldPartsFrameworks :: [String]
  , ldPartsFrameworkPaths :: [FilePath]
  }
  deriving Show

data StagingDirectories =
  StagingDirectories
  { fltkhsBuildDir :: FilePath
  , fltkBundledDir :: FilePath
  , fltkLibDir :: FilePath
  , fltkSource :: FilePath
  , bindingsDir :: FilePath
  , bindingsLibs :: FilePath
  , bindingsSrc :: FilePath
  , fltkBuiltTestPath :: FilePath
  , bindingsBuiltTestPath :: FilePath
  }
  deriving Show

getStagingDirectoriesCreateIfMissing :: HasCallStack => Bool -> Bool -> Verbosity -> String -> FilePath -> IO StagingDirectories
getStagingDirectoriesCreateIfMissing bundled openGl verbosity version tmpDir = do
  let makeIfMissing dir = createDirectoryIfMissingVerbose verbosity True dir >> windowsFriendlyPaths verbosity dir
  fltkhsBuildDir <- makeIfMissing (tmpDir </> ("fltkhs-" ++ version ++ "-third-party-build"))
  fltkBundledDir <- makeIfMissing (fltkhsBuildDir </> (if (bundled && openGl) then "fltk-bundled-opengl" else "fltk-bundled"))
  let fltkSource = fltkBundledDir </> "fltk-master"
  bindingsDir <- makeIfMissing (fltkhsBuildDir </> (if (openGl) then "bindings-opengl" else "bindings"))
  let fltkLibDir = fltkBundledDir </> "lib" </> "renamedLibs"
  let bindingsSrc = bindingsDir </> "c-src"
  let bindingsLibs = bindingsDir </> "c-lib"
  let fltkBuiltTestPath =
        fltkLibDir </>
        ( if (bundled && openGl)
          then "libfltk_gl.a"
          else "libfltk.a"
        )
  let bindingsBuiltTestPath =
        bindingsDir </> "static_object_files" </>
        ( if openGl
          then "glC.o"
          else "Fl_C.o"
        )
  pure $ StagingDirectories
         { fltkhsBuildDir = fltkhsBuildDir
         , fltkBundledDir = fltkBundledDir
         , fltkSource = fltkSource
         , fltkLibDir = fltkLibDir
         , bindingsDir = bindingsDir
         , bindingsSrc = bindingsSrc
         , bindingsLibs = bindingsLibs
         , fltkBuiltTestPath = fltkBuiltTestPath
         , bindingsBuiltTestPath = bindingsBuiltTestPath
         }

copyAndRename :: HasCallStack => Verbosity -> FilePath -> [FilePath] -> (FilePath -> FilePath) -> IO ()
copyAndRename verbosity dir fs renameF = do
  createDirectoryIfMissingVerbose verbosity True dir
  let cp f = copyFileVerbose verbosity f (dir </> (renameF (takeFileName f)))
  mapM_ cp fs

filterDir :: String -> FilePath -> IO [FilePath]
filterDir ext dir = do
  absoluteFs <-
    withCurrentDirectory dir $ do
      fs <- listDirectory dir
      mapM makeAbsolute fs
  pure ( foldl' ( \staticArchives f ->
                    case (takeExtension f) of
                      ext' | ext' == ext -> staticArchives ++ [f]
                           | otherwise -> staticArchives
                )
                []
                absoluteFs
       )

getStaticLibs :: HasCallStack => FilePath -> IO [FilePath]
getStaticLibs = filterDir ".a"

getDynLibs :: FilePath -> IO [FilePath]
getDynLibs dir =
  case buildOS of
    OSX -> filterDir ".dylib" dir
    _ -> filterDir ".so" dir

buildFltk :: HasCallStack => Verbosity -> FilePath -> StagingDirectories -> Bool -> IO ()
buildFltk verbosity projectDir stagingDirectories openGl = do
  unlessM (doesFileExist (fltkBuiltTestPath stagingDirectories)) $ do
    unlessM (doesDirectoryExist (fltkSource stagingDirectories)) $ do
      withCurrentDirectory projectDir (copyFileVerbose verbosity "fltk-master.zip" ((fltkBundledDir stagingDirectories) </> "fltk-master.zip"))
      withCurrentDirectory (fltkBundledDir stagingDirectories)
        (rawSystemExit verbosity "unzip" ["fltk-master.zip"])
    go (fltkSource stagingDirectories) (fltkBundledDir stagingDirectories) openGl
  where
    go :: FilePath -> FilePath -> Bool -> IO ()
    go workingDir installPrefix openGL = do
      let fltkFlags = (if (openGL) then ["--enable-gl"] else ["--disable-gl"]) ++
                      [ "--enable-localjpeg"
                      , "--enable-localzlib"
                      , "--enable-localpng"
                      , "--enable-xft"
                      , "--enable-shared"
                      , "--prefix=" ++ installPrefix
                      ]
      withCurrentDirectory workingDir $ do
        let make = runMake workingDir [] >> runMake workingDir ["install"]
        case buildOS of
          Windows -> do
            rawSystemExit verbosity "sh" ([("." </> "autogen.sh")] ++ fltkFlags)
            make
          OSX -> do
            rawSystemExit verbosity ("." </> "autogen.sh") fltkFlags
            make
          _ -> do
            rawSystemExit verbosity ("." </> "autogen.sh") fltkFlags
            make
        let dir = installPrefix </> "lib"
        staticLibs <- getStaticLibs dir
        copyAndRename verbosity (dir </> "renamedLibs") staticLibs id
        dynLibs <- getDynLibs dir
        let nonSymLinkDynLibs =
              filter
                (\dyn -> elem (takeBaseName dyn) (map takeBaseName staticLibs))
                dynLibs
        copyAndRename verbosity (dir </> "renamedLibs") nonSymLinkDynLibs
           (\f -> (takeBaseName f) ++ "-dyn" ++ (takeExtension f))

buildBindings :: HasCallStack => Verbosity -> FilePath -> StagingDirectories -> ConfigFlags -> IO ()
buildBindings verbosity projectDir stagingDirectories confFlags = do
  unlessM (doesFileExist (bindingsBuiltTestPath stagingDirectories)) $ do
    unlessM (doesDirectoryExist (bindingsLibs stagingDirectories)) $
      withCurrentDirectory projectDir $ do
        case buildOS of
          Windows -> do
            rawSystemExit verbosity "sh" ["autoconf"]
            rawSystemExit verbosity "sh" ([("." </> "configure")] ++ (configConfigureArgs confFlags))
          _ -> do
            rawSystemExit normal "autoconf" []
            rawSystemExit verbosity (projectDir </> "configure") (configConfigureArgs confFlags)
        runMake projectDir []
        copyFileVerbose verbosity "config.h" ((bindingsDir stagingDirectories) </> "config.h")
        copyDirectoryRecursive verbosity "c-src" ((bindingsDir stagingDirectories) </> "c-src")
        copyDirectoryRecursive verbosity "c-lib" ((bindingsDir stagingDirectories) </> "c-lib")
        copyDirectoryRecursive verbosity "static_object_files" ((bindingsDir stagingDirectories) </> "static_object_files")

flagIsSet :: PD.FlagName -> ConfigFlags -> Bool
flagIsSet flag cfs = maybe False id (lookupFlagAssignment flag (configConfigurationsFlags cfs))

bundledBuild :: ConfigFlags -> Bool
bundledBuild flags = flagIsSet (mkFlagName "bundled") flags

openGLSupport :: ConfigFlags -> Bool
openGLSupport flags = flagIsSet (mkFlagName "opengl") flags

fltkConfigPath :: Maybe FilePath -> FilePath
fltkConfigPath dirM =
  maybe "fltk-config" (\d -> d </> "bin" </> "fltk-config") dirM

runFltkConfig :: HasCallStack => FilePath -> Args -> IO String
runFltkConfig fc args =
  case buildOS of
    Windows -> rawSystemStdout normal "sh" ([fc] ++ args)
    _ -> rawSystemStdout normal fc args

getFltkIncludeDir :: HasCallStack => FilePath -> IO [String]
getFltkIncludeDir fc = do
  includeDirL <- words <$> runFltkConfig fc ["--includedir"]
  pure $ filter (not . null) includeDirL

fltkVersion :: HasCallStack => String -> (String,String,String)
fltkVersion version =
  let (major, minorVersion) = break ((==) '.') (unlines (lines version))
      (minor, patchVersion) = break ((==) '.') (drop 1 minorVersion)
      patch = drop 1 patchVersion
  in (major, minor, patch)

getApiVersion :: (String,String,String) -> Int
getApiVersion (major, minor, patch) =
  let majorInt,minorInt,patchInt :: Int
      majorInt = read major
      minorInt = read minor
      patchInt = read patch
  in majorInt * 10000 + minorInt * 100 + patchInt

getFltkVersion :: HasCallStack => FilePath -> IO (String, String, String)
getFltkVersion fc = fltkVersion <$> runFltkConfig fc ["--version"]

cabalFilePath :: ConfigFlags -> FilePath
cabalFilePath confFlags = fromMaybe "." (flagToMaybe (configCabalFilePath confFlags))

buildFltkAndBindings :: HasCallStack => String -> ConfigFlags -> Verbosity -> IO ()
buildFltkAndBindings packageVersion confFlags verbosity = do
  tmpDir <- getTemporaryDirectory
  projectDir <- makeAbsolute (takeDirectory (Main.cabalFilePath confFlags)) >>= windowsFriendlyPaths verbosity
  stagingDirectories <- getStagingDirectoriesCreateIfMissing (bundledBuild confFlags) (openGLSupport confFlags) verbosity packageVersion tmpDir
  info verbosity "==Building FLTK=="
  buildFltk verbosity projectDir stagingDirectories (openGLSupport confFlags)
  info verbosity "==Compiling C bindings=="
  let fltkConfig = fltkConfigPath (if (bundledBuild confFlags) then (Just (fltkBundledDir stagingDirectories)) else Nothing)
  version <- getFltkVersion fltkConfig
  buildBindings verbosity projectDir stagingDirectories (updateConfigFlags version fltkConfig confFlags)
  where
    updateConfigFlags :: (String,String,String) -> FilePath -> ConfigFlags -> ConfigFlags
    updateConfigFlags (major,minor,patch) fc confFlags =
      let newConfFlags =
            (if (openGLSupport confFlags) then ["--enable-gl"] else []) ++
            [ ("--with-fltk-config=" ++ fc)
            , ("--with-fltk-major-version=" ++ major)
            , ("--with-fltk-minor-version=" ++ minor)
            , ("--with-fltk-patch-version=" ++ patch)
            ]
      in confFlags <> mempty { configConfigureArgs = newConfFlags }

getNewHbi :: HasCallStack => String -> ConfigFlags -> Verbosity -> BuildInfo -> IO BuildInfo
getNewHbi packageVersion confFlags verbosity libHbi = do
  tmpDir <- getTemporaryDirectory
  stagingDirectories <- getStagingDirectoriesCreateIfMissing (bundledBuild confFlags) (openGLSupport confFlags) verbosity packageVersion tmpDir
  let fltkConfig = fltkConfigPath (if (bundledBuild confFlags) then (Just (fltkBundledDir stagingDirectories)) else Nothing)
  version <- getFltkVersion fltkConfig
  let fltkApiFlag = "-DFLTK_API_VERSION=" ++ (show (getApiVersion version))
  bindingsArchives <- getStaticLibs (bindingsLibs stagingDirectories)
  ldFlags <- getFltkLdFlags verbosity fltkConfig (openGLSupport confFlags)
  fltkIncludeDirL <- getFltkIncludeDir fltkConfig
  let fltkhsIncludeDirs = [bindingsDir stagingDirectories,bindingsSrc stagingDirectories] ++ fltkIncludeDirL
  fltkArchives <- getStaticLibs (fltkLibDir stagingDirectories)
  fltkDynLibs <- getDynLibs (fltkLibDir stagingDirectories)
  let addArchive bi' ar=
        bi'
        <> mempty { extraLibDirs = [takeDirectory ar] }
        <> mempty { extraLibs = [drop 3 (takeBaseName ar)] }
  let newLibHbi =
        libHbi
        <> splitLdFlags mempty ldFlags
        <> foldl addArchive mempty (bindingsArchives ++ fltkArchives)
        <> mempty { includeDirs = fltkhsIncludeDirs }
        <> mempty { ccOptions = [fltkApiFlag], cppOptions = [fltkApiFlag] }
  pure newLibHbi
  where
    splitLdFlags :: BuildInfo -> [String] -> BuildInfo
    splitLdFlags bi (f:flags) | isPrefixOf "-l" f = splitLdFlags (bi <> mempty { extraLibs = [drop 2 f], extraGHCiLibs = [drop 2 f] }) flags
    splitLdFlags bi (f:flags) | isPrefixOf "-L" f = splitLdFlags (bi <> mempty { extraLibDirs = [drop 2 f] }) flags
    splitLdFlags bi ("-framework":f:flags) = splitLdFlags (bi <> mempty { frameworks = [f] }) flags
    splitLdFlags bi ("-framework-path":f:flags) = splitLdFlags (bi <> mempty { extraFrameworkDirs = [f] }) flags
    splitLdFlags bi (f:flags) =
      case (takeDirectory f, takeFileName f) of
        (d,f) | not (null d) -> splitLdFlags bi flags
              | otherwise -> splitLdFlags (bi <> mempty { ldOptions = [f] }) flags
    splitLdFlags bi [] = bi

    getFltkLdFlags :: Verbosity -> FilePath -> Bool -> IO [String]
    getFltkLdFlags verbosity fc openGl = do
      fltkLdFlags <-
        runFltkConfig fc $
          if openGl
          then ["--ldstaticflags","--use-gl","--use-glut","--use-images","--use-forms"]
          else ["--ldstaticflags","--use-images","--use-forms"]
      let adjustPath possiblePath =
            if (null (takeDirectory possiblePath))
            then pure possiblePath
            else windowsFriendlyPaths verbosity possiblePath
      mapM adjustPath (words (fltkLdFlags ++ " -lstdc++"))

windowsFriendlyPaths :: Verbosity -> String -> IO String
windowsFriendlyPaths verbosity s =
  case buildOS of
    Windows -> (head . lines) <$> (rawSystemStdout verbosity "cygpath" ["-m",  s])
    _ -> pure s

versionString :: PackageDescription -> String
versionString pd = intercalate "." (map show (versionNumbers ((pkgVersion . package ) pd)))
