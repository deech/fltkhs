#!/bin/runhaskell
import Control.Monad
import Text.Parsec
import Text.Parsec.String
import Data.List
import System.Environment
import Data.Char
import Data.List
import Text.Printf
import Control.Monad
import Debug.Trace
import System.Process
import Data.Maybe

data ConstraintsImpl = Constraints [String] String
parseConstraints = do
  spaces
  constraints <- manyTill anyChar (try (string "(~) * impl ("))
  state' <- getParserState
  impl <- manyTill anyChar (try $ string $ ") => Op ")
  spaces
  return (constraints,impl)
runImplParser = do
  constraints <- parseConstraints
  manyTill anyChar (try (string "("))
  methodDatatype <- manyTill anyChar (try (string " ()) "))
  widgetName <- manyTill anyChar (try (string " "))
  return (constraints, methodDatatype, widgetName)

runHierarchyParser = do
  spaces
  char '*'
  spaces
  word
  klazz <- word
  char '='
  spaces
  word
  parent <- many anyChar
  return (klazz,parent)
className = "Op"

lowerFirst m = [(toLower $ head m)] ++ (tail m)
quoteDatatypes l =
  unwords $
  map
  (\w -> let (quoted, quoteBeginning) =
               if (any isUpper w)
               then let (non, w') = span (not . isUpper) w
                    in
                     (True, non ++ "'" ++ w')
               else (False, w)
         in
          if quoted
          then
            let (non, rw') = span (not . isAlphaNum) (reverse quoteBeginning)
            in
             reverse rw' ++ "'" ++ non
          else w
  )
  (words l)
pprint r = case r of
  (("",impl), methodDatatype, widgetName) ->
    (lowerFirst methodDatatype)
    ++ " :: "
    ++ "'Ref' '" ++ widgetName
    ++ "'" ++ " -> "
    ++ quoteDatatypes impl
  ((c ,impl), methodDatatype, widgetName) ->
    (lowerFirst methodDatatype) ++
    "::" ++ " "
    ++ "(" ++ (quoteDatatypes (tail (reverse (drop 2 (reverse c))))) ++ ")" ++ " => "
    ++ "'Ref' '" ++ widgetName
    ++ "'" ++ " -> "
    ++ quoteDatatypes impl

word = manyTill anyChar (try (string " "))

isWidget w ((_,_),_,w') = w == w'
data Command = Functions String | Hierarchy String

traceHierarchy :: String -> [String] -> [(String,String)] -> [String]
traceHierarchy w accum dict = case (lookup w dict) of
  Nothing -> accum
  (Just w') -> traceHierarchy w' (accum ++ [w]) dict

main = do
  args <- getArgs
  let command = case args of
        ("functions":w':[]) -> Just (Functions w')
        ("hierarchy":w':[]) -> Just (Hierarchy w')
        _ -> Nothing

  ls <- readProcess "html2text" ["-width", "1000", "../dist/doc/html/fltkhs/Graphics-UI-FLTK-LowLevel-Dispatch.html" ] "" >>= return . filter (isInfixOf ("=> " ++ className)) . lines
  objs <- readProcess "html2text" ["-width", "1000", "../dist/doc/html/fltkhs/Graphics-UI-FLTK-LowLevel-Hierarchy.html"] "" >>= return . filter (isInfixOf ("    * type")) . lines
  let ppLines = map (\l -> case (parse runImplParser "" l) of
                        Left err -> Nothing
                        Right r -> Just r
                    )
                ls
  let hier' = map (\o -> case (parse runHierarchyParser "" o) of
                      Left err -> trace (show  err) $ Nothing
                      Right r -> Just r
                  )
              objs
  case command of
    Nothing -> error ""
    (Just (Hierarchy w)) -> do
      let trace' = reverse $
                   map (\w -> "-- " ++ w) $
                   map (\w -> "\"" ++ w ++ "\"") $
                   map (\w -> "Graphics.UI.FLTK.LowLevel." ++ w) $
                   traceHierarchy w [] (catMaybes hier')
      putStr $ concat $ intersperse "\n--  |\n--  v\n" trace'
      putStr "\n"
    (Just (Functions w)) -> do
      let filteredByWidget = map (maybe "" pprint) $
                             filter (\ppl -> case ppl of
                                        Nothing -> False
                                        Just ppl' -> isWidget w ppl'
                                    ) ppLines
      putStr $ intercalate "\n--\n" (map ((++) "-- ")  (sort  filteredByWidget))
      putStr "\n"
