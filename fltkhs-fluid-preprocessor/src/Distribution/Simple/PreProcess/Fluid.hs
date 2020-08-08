module Distribution.Simple.PreProcess.Fluid where

import Distribution.Simple.PreProcess
import Distribution.Simple.Program
import Distribution.Simple.LocalBuildInfo
import Distribution.Simple.Utils
import Distribution.PackageDescription
import System.FilePath

ppFluidToHaskell :: BuildInfo -> LocalBuildInfo -> ComponentLocalBuildInfo -> PreProcessor
ppFluidToHaskell _ lbi _ =
  PreProcessor
    { platformIndependent = True
    , runPreProcessor = \(inBaseDir, inRelativeFile) (outBaseDir, _) verbosity -> do
        (fluidToHaskellProg, _) <- requireProgram verbosity fluidToHaskellProgram (withPrograms lbi)
        rawSystemExit verbosity (programId fluidToHaskellProg)
          ["--output-dir=" ++ outBaseDir, inBaseDir </> inRelativeFile]
    }
  where
    fluidToHaskellProgram :: Program
    fluidToHaskellProgram =
      (simpleProgram "fltkhs-fluidtohs") { programFindVersion = (\_ _ -> return Nothing) }
