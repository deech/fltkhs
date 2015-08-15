module Main where
import Generate
import Parser
import Text.Parsec.String
import System.Environment
import System.FilePath
import Types
import System.Console.GetOpt

data Flag = OutputDir FilePath deriving Show
options :: [OptDescr Flag]
options = [Option ['o'] ["output-dir"] (ReqArg OutputDir "DIR") "output DIR"]

main :: IO ()
main =
  let header = "fltkhs-fluid [(-o|--output-dir=) DIR] <fluidfile.fl>\n"
  in do
    args <- getArgs
    case (getOpt Permute options args) of
      ([], _, _) -> putStr $ header ++ "No output directory specified.\n"
      (((OutputDir outDir):_), trailing, errors)
        | (not $ null errors) -> putStr $ header ++ (concat errors)
        | (null trailing) -> putStr $ header ++ "Input Fluid file not specified\n"
        | (length trailing > 1) -> putStr $ header ++ "More than one Fluid input file specified.\n"
        | otherwise -> do
            let fluidFile = head trailing
            parsedFluid <- parseFromFile (uselessHeader >> runnerP) fluidFile
            let moduleName = takeBaseName fluidFile
            case parsedFluid of
              Right output ->
                case (toHs moduleName output) of
                  Left (BadModuleName m) ->
                    error
                      ("Not a valid Haskell module name: " ++
                       m ++
                       "\n" ++
                       "Haskell modules start with a capital letter and contain letters/numbers, " ++
                       "\n" ++
                       "and underscores or apostrophes.\n" ++
                       "Additionally qualified modules eg. A.B.C are not allowed.")
                  Right generatedHaskell ->
                    writeFile (outDir </> (moduleName) ++ [extSeparator] ++ "hs")
                      (concat generatedHaskell)
              Left err -> error ("Could not parse " ++ (show fluidFile) ++ ": " ++ show err)
