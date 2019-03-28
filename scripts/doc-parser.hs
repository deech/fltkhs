#!/bin/runhaskell
{-# LANGUAGE FlexibleContexts #-}
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
import Control.Arrow

parseFunc = do
  char '('
  spaces
  f <- manyTill anyChar (try newline)
  spacesOrNewLines
  return f

parseFuncs = do
  spacesOrNewLines
  fs <- many parseFunc
  return (filter (\f -> not (all ((==) ')') f)) fs)

parseFuncsLine o = do
  let searchString = "type" ++ " " ++ o ++ "Funcs" ++ " " ++ "="
  manyTill anyChar (try (string searchString))
  parseFuncs

spacesOrNewLines =
  skipMany $ (char ' ') <|> (char '\n') <|> crlf

parseInstances = go False (return ([],[]))
  where
    go inIfdef accum = ((try (eof >> accum)) <|>
                        (try (do
                            newline >> string "#if FL_API_VERSION == 10304" >> endOfLine
                            go True accum)) <|>
                        (try (do
                            newline >> string "#endif" >> endOfLine
                            go False accum)) <|>
                        (try (do
                            newline >> string "instance"
                            (soFar, newVersionOnly)<- accum
                            opInstance <- parseInstance
                            go inIfdef
                               (return
                                 (if inIfdef
                                  then (soFar, newVersionOnly ++ [opInstance])
                                  else (soFar ++ [opInstance], newVersionOnly))))) <|>
                        (anyChar >> go inIfdef accum))
parseInstance = do
  spaces
  char '('
  spacesOrNewLines
  constraints <- manyTill anyChar (try (string "impl"))
  spacesOrNewLines
  char '~'
  spacesOrNewLines
  typeSig <- (try
                (do
                   char '('
                   sig <- go (1 :: Int) ""
                   spacesOrNewLines
                   char ')'
                   return sig) <|>
              (go (1 :: Int) ""))
  spacesOrNewLines
  string "=>"
  spacesOrNewLines
  string "Op"
  spacesOrNewLines
  char '('
  methodName <- word
  spacesOrNewLines
  char '('
  spacesOrNewLines
  char ')'
  spacesOrNewLines
  char ')'
  spacesOrNewLines
  widgetType <- word
  return (constraints, typeSig, methodName, widgetType)
  where
    go nesting accum =
      (try $ char '(' >> go (nesting + 1) (accum ++ "(")) <|>
      (try $ lookAhead (char ')') >>
             if (nesting == 0)
               then parserZero
               else if (nesting == 1)
                      then char ')' >> return accum
                      else char ')' >> go (nesting - 1) (accum ++ ")")) <|>
      (do
         bare <- manyTill anyChar ((lookAhead (char ')')) <|> (lookAhead (char '(')))
         go nesting (accum ++ bare))

runHierarchyParser = do
  spaces
  string "type"
  spaces
  widgetType <- word
  spaces
  string "="
  spaces
  _ <- word
  spaces
  parent <- many anyChar
  return (widgetType, parent)
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
    ++ "(" ++ (quoteDatatypes (reverse (drop 2 (reverse c)))) ++ ")" ++ " => "
    ++ "'Ref' '" ++ widgetName
    ++ "'" ++ " -> "
    ++ quoteDatatypes impl

word = manyTill anyChar (try (string " "))

isWidget w ((_,_),_,w') = w == w'
data Command = Functions String | Hierarchy String | Sync

traceHierarchy :: String -> [String] -> [(String,String)] -> [String]
traceHierarchy w accum dict = case (lookup w dict) of
  Nothing -> accum
  (Just w') -> traceHierarchy w' (accum ++ [w]) dict

main = do
  args <- getArgs
  let command =
        case args of
          ("functions":w':[]) -> Just (Functions w')
          ("hierarchy":w':[]) -> Just (Hierarchy w')
          ("sync":[])         -> Just Sync
          _                   -> Nothing
  hierarchyContents <- readFile "../src/Graphics/UI/FLTK/LowLevel/Hierarchy.hs"
  let objs = (
               filter (not . isInfixOf "Funcs") .
               filter (isPrefixOf "type") .
               lines
             ) hierarchyContents
  let readWidgetFile w =
        readFile $
          if (isSuffixOf "Base" w)
          then "../src/Graphics/UI/FLTK/LowLevel/Base/" ++ (reverse . drop 4 . reverse $ w) ++ ".chs"
          else "../src/Graphics/UI/FLTK/LowLevel/" ++ w ++ ".chs"
  let parseWidgetFile contents =
        case (parse parseInstances "" contents) of
          Left err        -> error (show err)
          Right (functions, newVersionOnly) -> (Just functions, Just newVersionOnly)
  let hier' = catMaybes
                (
                  map
                    (\o -> case (parse runHierarchyParser "" o) of
                       Left err -> Nothing
                       Right r  -> Just r)
                    objs
                )
      funcs =
        catMaybes
          (map
            (\(o,_) ->
               case (parse (parseFuncsLine o) "" hierarchyContents) of
                 Left err -> Nothing
                 Right r  -> Just (o,r)
            )
            hier')
  case command of
    Nothing -> error ""
    (Just (Hierarchy w)) -> do
      let trace' = reverse $
            map (\w -> "-- " ++ w) $
              map (\w -> "\"" ++ w ++ "\"") $
                map (\w -> "Graphics.UI.FLTK.LowLevel." ++
                      (if (isSuffixOf "Base" w)
                       then "Base." ++ (reverse . drop 4 . reverse $ w)
                       else w)) $
                  traceHierarchy w [] hier'
      putStr $ concat $ intersperse "\n--  |\n--  v\n" trace'
    (Just (Functions w)) -> do
      contents <- readWidgetFile w
      let (functions, inNewVersionOnly) = parseWidgetFile contents
      let rendered = maybe [] (sort . map (\(c, sig, mName, wType) -> pprint ((c, sig), mName, wType)))
      putStr $ intercalate "\n--\n" (map ((++) "-- ") (rendered functions))
    (Just Sync) ->
      mapM
        (\(w,hierarchyFs) -> do
            contents <- readWidgetFile w
            let (fs, _) = parseWidgetFile contents
            let omitted =
                  case fs of
                    Nothing -> ([],[])
                    Just _fs ->
                      let namesOnly = map (\(_,_,nName,_) -> nName) _fs
                      in
                      if (not $ all (\(_,_,_,w') -> w' == w) _fs)
                      then error (show (w, (map (\(_,_,_,w') -> w') _fs)))
                      else
                        (
                          filter
                            (\f ->
                                 not (elem f namesOnly)
                            )
                            hierarchyFs
                        , filter
                            (\n -> not (elem n hierarchyFs))
                            namesOnly
                        )
            return (w,omitted)
        )
        funcs
       >>= print
      -- putStr "\n"
      -- putStr $ "\n-- Available in FLTK 1.3.4 only: \n"
      -- putStr $ intercalate "\n--\n" (map ((++) "-- ") (rendered inNewVersionOnly))
      -- putStr "\n"
