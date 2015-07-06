{-# LANGUAGE ScopedTypeVariables, BangPatterns #-}
module Fluid.Parser where
import Control.Monad
import Text.Parsec
import Text.Parsec.String
import Text.Parsec.Token
import Data.List
import System.Environment
import Data.Char
import Text.Parsec.Language
import Text.Parsec.Prim
import Text.Parsec.Token
import Text.Printf
import Debug.Trace
import Data.Functor.Identity
import Fluid.Types
import Data.List

println msg = trace (show msg) $ return ()

functionName = between (char '{') (char '}')
               (do
                 spaces
                 (<|>)
                   (try $ do
                      name <- manyTill (alphaNum <|> oneOf "_") (char '(')
                      many (noneOf ")")
                      char ')'
                      return name)
                   (return [])
               )

quotedP =
  let charCodeP c code = (char c) >> return (QuotedCharCode code) in
  foldl1 (<|>) ((map try [ charCodeP 'a' '\a'
                         , charCodeP 'b' '\b'
                         , charCodeP 'a' '\a'
                         , charCodeP 'b' '\b'
                         , charCodeP 'f' '\f'
                         , charCodeP '\n' '\n'
                         , charCodeP 'r' '\r'
                         , charCodeP 't' '\t'
                         , charCodeP 'v' '\v'
                         , ((char 'x' ) >> hexP >>= return . QuotedHex)
                         ,(octalP >>= return . QuotedOctal)
                       ]) ++ [(anyChar >>= \c -> return (QuotedChar (['\\'] ++ [c])))])

bracedContentsP = char '{' >> go 0 []
  where
    go nesting accum =
        (try $ do
             _ <- char '\\'
             quoted <- quotedP
             go nesting (accum ++ [quoted]))
        <|> (try $ char '{' >> go (nesting + 1) (accum ++ [BareString "{"]) )
        <|> (try $ lookAhead (char '}') >>
                   if (nesting == 0)
                   then parserZero
                   else char '}' >>
                        go (nesting - 1) (accum ++ [BareString "}"]))
        <|> (try $ (trimAfter $ char '}') >> return accum)
        <|> (do
           bare <- manyTill anyChar ((lookAhead $ char '\\') <|> (lookAhead $ char '{') <|> (lookAhead $ char '}'))
           go nesting (accum ++ [BareString bare]))

unbrokenString = manyTill anyChar (char ' ' <|> endOfLine)

toEndOfLine = manyTill anyChar endOfLine

spacesOrNewLines = skipMany $ (char ' ') <|> (char '\n') <|> crlf

trimAfter p = do
    result <- p
    spacesOrNewLines
    return result

chTrim c = trimAfter (char c)

presentState :: ParsecT String u Identity ()
presentState = do
  s <- getParserState
  println (stateInput s)

presentStateN :: Int -> ParsecT String u Identity ()
presentStateN n = do
  s <- getParserState
  let out = take n (stateInput s)
  println out

untilP keepGoingP stopP = go []
  where
    go accum = (try $ stopP >> return accum)
               <|>
               (do
                 r <- keepGoingP
                 go (accum ++ [r])
               )

printWithIndent endPs msg = println (concat (map (const "-") endPs) ++ msg)

nodeP openerP innerP enderP moreOfP endPs = do
  openerP
  let allEnds = [(ignore enderP, ignore (moreOfP endPs))] ++ endPs
      allEndsP =  tryAllEnds allEnds
  body <- untilP (innerP allEnds) (lookAhead enderP >> lookAhead allEndsP)
  enderP
  return body

codeP name  cons = do
  _ <- trimAfter $ string name
  body <- bracedContentsP
  return (cons body)

codeOrCallP name  cons = do
  _ <- trimAfter $ string name
  body <- literal
  return (cons body)

attrP name cons p = do
  _ <- trimAfter $ string name
  body <- p
  return (cons body)

literal  =
  (try $ bracedContentsP >>= return . BracedString)
  <|>
  (unbrokenString >>= return . UnbrokenString)

langDef = makeTokenParser haskellDef

integerP = integer langDef

numberP = decimal langDef

floatP = float langDef

hexP = hexadecimal langDef

octalP = octal langDef
sequenceParsers ps = try $ ignore $ do
  foldl (>>) (return ()) (map fst ps)
  case ps of
    [] -> parserZero
    _ -> ignore (snd (last ps))

tryAllEnds ps = foldl1 (<|>) ((map sequenceParsers (inits ps)) ++ [parserZero])

num = integerP >>= \n -> return ((fromIntegral n) :: Int)

floatOrInteger =
  (try $ floatP)
  <|>
  (do
    i <- integerP
    return ((fromIntegral i) :: Double))

numFourTuple = do {
        _ <- trimAfter (char '{');
        x <- trimAfter numberP;
        y <- trimAfter numberP;
        w <- trimAfter numberP;
        h <- trimAfter numberP;
        _ <- trimAfter (char '}');
        return (fromIntegral x,fromIntegral y,fromIntegral w,fromIntegral h);
        }

attrPs  =
  (map try [
       (codeP "code0"  Code0)
       ,(codeP "code1"  Code1)
       ,(codeP "code2"  Code2)
       ,(codeP "code3"  Code3)
       ,(attrP "labelfont" Labelfont num)
       ,(attrP "labelsize" Labelsize num)
       ,(attrP "labeltype" Labeltype literal)
       ,(attrP "labelcolor" Labelcolor num)
       ,(attrP "label" Label literal)
       ,(codeOrCallP "callback"  Callback)
       ,(attrP "xywh" XYWH numFourTuple)
       ,(attrP "color" Color num)
       ,(attrP "maximum" Maximum num)
       ,(attrP "value" Value literal)
       ,(attrP "down_box" DownBox literal)
       ,(attrP "box" Box literal)
       ,(string "resizable" >> return Resizable)
       ,(string "visible" >> return Visible)
       ,(attrP "align" Align num)
       ,(attrP "minimum" Minimum num)
       ,(attrP "step" Step floatOrInteger)
       ,(attrP "selection_color" SelectionColor num)
       ,(string "open" >> return Open)
       ,(string "hide" >> return Hide)
       ,(string "in_source" >> return InSource)
       ,(string "in_header" >> return InHeader)
       ,(attrP "return_type" ReturnType literal)
       ,(attrP "type" WidgetType literal)
       ,(string "private" >> return Private)
       ,(attrP "user_data_type" UserDataType literal)
       ,(attrP "user_data" UserData literal)
       ,(attrP "tooltip" Tooltip literal)
       ,(attrP "comment" Comment literal)
       ,(attrP "when" When num)
       ,(string "hotspot" >> return Hotspot)
       ,(string "modal" >> return Modal)
       ,(string "selected" >> return Selected)
       ,(attrP "textfont" TextFont num)
       ,(attrP "textsize" TextSize num)
       ,(attrP "textcolor" TextColor num)
       ,(attrP "slider_size" SliderSize floatOrInteger)
       ,(attrP "downbox" DownBox literal)
       ,(attrP "class" DerivedFromClass unbrokenString)
       ,(attrP "shortcut" Shortcut literal)
       ,(attrP "after" AfterCode literal)
       ,(attrP ":" Inherits unbrokenString)
       ,(attrP "#" LineComment toEndOfLine)
       ,(attrP "filename" Filename literal)
       ,(string "local" >> return Local)
       ,(string "global" >> return Global)
       ,(string "deactivate" >> return Deactivate)
       ,(string "public" >> return Public)
       ]) ++
  [(attrP "size_range" SizeRange numFourTuple)]

innardsP  = do
  spacesOrNewLines
  res <- trimAfter (choice (attrPs ))
  return res

ignore p = p >> return ()

containerTypes =
  (map try [(string "Fl_Window"),
            (string "Fl_Group"),
            (string "Fl_Wizard"),
            (string "Fl_Pack"),
            (string "Fl_Table"),
            (string "Fl_Scroll"),
            (string "Fl_Menu_Bar"),
            (string "Fl_Menu_Button"),
            (string "Fl_Choice"),
            (string "SubMenu")
           ])
  ++ [(string "Fl_Tabs")]

componentTypes =
  (map try [(string "Fl_Slider"),
            (string "Fl_Value_Slider"),
            (string "Fl_Roller"),
            (string "Fl_Box"),
            (string "Fl_Scrollbar"),
            (string "Fl_Adjuster"),
            (string "Fl_Counter"),
            (string "Fl_Roller"),
            (string "Fl_Value_Input"),
            (string "Fl_Value_Output"),
            (string "Fl_Spinner"),
            (string "Fl_Dial"),
            (string "Fl_Button"),
            (string "Fl_Output"),
            (string "MenuItem"),
            (string "Fl_Input"),
            (string "Fl_Clock"),
            (string "Fl_Return_Button"),
            (string "Fl_Light_Button"),
            (string "Fl_Check_Button"),
            (string "Fl_Repeat_Button"),
            (string "Fl_Round_Button")
           ])

componentsP  = do
  cType <- trimAfter $ choice componentTypes
  name <- trimAfter $ (try $ string "{}" >> return Nothing) <|> (unbrokenString >>= return . Just)
  _ <- trimAfter (char '{')
  attrs <- manyTill innardsP (trimAfter $ char '}')
  return $ Component cType name attrs

containersP  = do
  cType <- trimAfter $ choice containerTypes
  name <- trimAfter $ (try $ string "{}" >> return Nothing) <|> (unbrokenString >>= return . Just)
  _ <- trimAfter (char '{')
  attrs <- manyTill innardsP (trimAfter $ char '}')
  _ <- trimAfter (char '{')
  body <- manyTill widgetTreeP (trimAfter $ char '}')
  return $ Container cType name attrs body

codeBlockP = do
  _ <- trimAfter $ string "codeblock"
  opener <- literal
  _ <- trimAfter (char '{')
  attrs <- manyTill innardsP (trimAfter $ char '}')
  _ <- trimAfter (char '{')
  body <- manyTill widgetTreeP (trimAfter $ char '}')
  return $ CodeBlock opener attrs body

argsBodyP n cons = do
  _ <- trimAfter $ string n
  body <- literal
  _ <- trimAfter (char '{')
  attrs <- manyTill innardsP (trimAfter $ char '}')
  return (cons attrs body)

justArgsP n cons = do
  _ <- trimAfter $ string n
  name <- trimAfter unbrokenString
  _ <- trimAfter (char '{')
  attrs <- manyTill innardsP (trimAfter $ char '}')
  return (cons name attrs)

versionP = do
  _ <- trimAfter $ string "version"
  body <- unbrokenString
  return (Version body)

widgetTreeP  = do
  (try $ containersP )
  <|> (try $ codeBlockP)
  <|> (try $ componentsP )
  <|> (try $ argsBodyP "code" Code)
  <|> (try $ argsBodyP "comment" StandAloneComment)
  <|> versionP

functionP  = do
  _ <- trimAfter $ string "Function"
  name <- trimAfter functionName
  _ <- trimAfter (char '{')
  otherArgs <- manyTill innardsP (trimAfter $ char '}')
  _ <- trimAfter (char '{')
  body <- manyTill widgetTreeP (trimAfter $ char '}')
  return (Function (if (null name) then Nothing else Just name) otherArgs body)

classP  = do
  _ <- trimAfter $ (try $ string "class") <|> (string "widget_class")
  name <- trimAfter unbrokenString
  _ <- trimAfter (char '{')
  otherArgs <- manyTill innardsP (trimAfter $ char '}')
  _ <- trimAfter (char '{')
  body <- manyTill fluidP (trimAfter $ char '}')
  return (Class name otherArgs body)

declBlockP = do
  _ <- trimAfter $ string "declblock"
  opener <- literal
  _ <- trimAfter (char '{')
  attrs <- manyTill innardsP (trimAfter $ char '}')
  _ <- trimAfter (char '{')
  body <- manyTill fluidP (trimAfter $ char '}')
  return (DeclBlock attrs opener body)

fluidP  =
  (try classP >>= return . FluidClass)
  <|> (try functionP >>= return . FluidFunction)
  <|> (try declBlockP)
  <|> (try $ argsBodyP "decl" Decl)
  <|> (justArgsP "data" Data)

runnerP = untilP fluidP (lookAhead eof)

dontCare l = do
  _ <- string l
  _ <- manyTill anyChar endOfLine
  return ()

uselessHeader = dontCare "#" >> dontCare "version" >> dontCare "header_name" >> dontCare "code_name"

main = do
  (file:args) <- getArgs
  result <- parseFromFile (uselessHeader >> runnerP) file
  case result of
    Right output -> print output
    Left err -> error (show err)
