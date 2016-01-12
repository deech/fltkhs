{-# LANGUAGE ScopedTypeVariables, BangPatterns #-}
module Parser where
import Text.Parsec
import Data.Char
import Text.Parsec.Language
import Text.Parsec.Token
import Debug.Trace
import Control.Monad.Identity
import Types
import Data.List

println :: (Monad m)
        => String -> m ()
println msg = trace (show msg) $ return ()

functionName
  :: ParsecT String a Identity (HaskellIdentifier,FunctionArgs)
functionName =
  between (char '{')
          (char '}')
          (do spaces
              (try (do name <-
                         manyTill anyChar (char '(')
                       args <- go (1 :: Int) ""
                       return ((toHaskellIdentifier name)
                              ,if (not (null args))
                                  then (FunctionArgs $ Just args)
                                  else FunctionArgs Nothing)) <|>
               (return (UnidentifiedFunction ,(FunctionArgs Nothing)))))
  where
    go :: Int -> String -> ParsecT String a Identity String
    go nesting accum =
      (try $ char '(' >> go (nesting + 1) (accum ++ "(")) <|>
      (try $ lookAhead (char ')') >>
             if (nesting == 0)
               then parserZero
               else if (nesting == 1)
                    then char ')' >> return accum
                    else char ')' >> go (nesting - 1) (accum ++ ")")
      ) <|>
      (do bare <-
            manyTill anyChar ((lookAhead (char ')')) <|> (lookAhead (char '(')))
          go nesting (accum ++ bare)
      )
quotedP
  :: ParsecT String a Identity BracedStringParts
quotedP =
  let charCodeP :: Char -> Char -> ParsecT String a Identity BracedStringParts
      charCodeP c code = (char c) >> return (QuotedCharCode code)
  in foldl1 (<|>)
            ((map try
                  [charCodeP 'a' '\a'
                  ,charCodeP 'b' '\b'
                  ,charCodeP 'a' '\a'
                  ,charCodeP 'b' '\b'
                  ,charCodeP 'f' '\f'
                  ,charCodeP '\n' '\n'
                  ,charCodeP 'r' '\r'
                  ,charCodeP 't' '\t'
                  ,charCodeP 'v' '\v'
                  ,((char 'x') >> hexP >>= return . QuotedHex)
                  ,(octalP >>= return . QuotedOctal)]) ++
             [(anyChar >>=
               \c ->
                 return (QuotedChar (['\\'] ++ [c])))])

bracedContentsP
  :: ParsecT String () Identity [BracedStringParts]
bracedContentsP = char '{' >> go (0 :: Int) []
  where go nesting accum =
          (try $
           do _ <- char '\\'
              quoted <- quotedP
              go nesting (accum ++ [quoted])) <|>
          (try $
           char '{' >>
           go (nesting + 1)
              (accum ++ [BareString "{"])) <|>
          (try $
           lookAhead (char '}') >>
           if (nesting == 0)
              then parserZero
              else char '}' >>
                   go (nesting - 1)
                      (accum ++ [BareString "}"])) <|>
          (try $ (trimAfter $ char '}') >> return accum) <|>
          (do bare <-
                manyTill anyChar
                         ((lookAhead $ char '\\') <|> (lookAhead $ char '{') <|>
                          (lookAhead $ char '}'))
              go nesting (accum ++ [BareString bare]))

unbrokenString
  :: ParsecT String a Identity [Char]
unbrokenString =
  manyTill anyChar (char ' ' <|> endOfLine)

toEndOfLine :: ParsecT String a Identity [Char]
toEndOfLine = manyTill anyChar endOfLine

spacesOrNewLines :: ParsecT String a Identity ()
spacesOrNewLines =
  skipMany $ (char ' ') <|> (char '\n') <|> crlf

trimAfter
  :: ParsecT String () Identity a -> ParsecT String () Identity a
trimAfter p =
  do result <- p
     spacesOrNewLines
     return result

chTrim :: Char -> ParsecT String () Identity Char
chTrim c = trimAfter (char c)

-- presentState :: ParsecT String u Identity ()
-- presentState =
--   do s <- getParserState
--      println (stateInput s)

-- presentStateN
--   :: Int -> ParsecT String u Identity ()
-- presentStateN n =
--   do s <- getParserState
--      let out = take n (stateInput s)
--      println out

untilP :: ParsecT String a Identity b
       -> ParsecT String a Identity c
       -> ParsecT String a Identity [b]
untilP keepGoingP stopP = go []
  where go accum =
          (try $ stopP >> return accum) <|>
          (do r <- keepGoingP
              go (accum ++ [r]))

-- printWithIndent endPs msg = println (concat (map (const "-") endPs) ++ msg)

-- nodeP openerP innerP enderP moreOfP endPs = do
--   _ <- openerP
--   let allEnds = [(ignore enderP, ignore (moreOfP endPs))] ++ endPs
--       allEndsP =  tryAllEnds allEnds
--   body <- untilP (innerP allEnds) (lookAhead enderP >> lookAhead allEndsP)
--   _ <- enderP
--   return body

codeP :: String
      -> ([BracedStringParts] -> Attribute)
      -> ParsecT String () Identity Attribute
codeP name cons =
  do _ <- trimAfter $ string name
     body <- bracedContentsP
     return (cons body)

codeOrCallP
  :: String
  -> (UnbrokenOrBraced -> Attribute)
  -> ParsecT String () Identity Attribute
codeOrCallP name cons =
  do _ <- trimAfter $ string name
     body <- literal
     return (cons body)

attrP :: String
      -> (a -> Attribute)
      -> ParsecT String () Identity a
      -> ParsecT String () Identity Attribute
attrP name cons p =
  do _ <- trimAfter $ string name
     body <- p
     return (cons body)

literal
  :: ParsecT String () Identity UnbrokenOrBraced
literal =
  (try $ bracedContentsP >>= return . BracedString) <|>
  (unbrokenString >>= return . UnbrokenString)

langDef :: GenTokenParser String a Control.Monad.Identity.Identity
langDef = makeTokenParser haskellDef

integerP :: ParsecT String a Identity Integer
integerP = integer langDef

numberP :: ParsecT String a Identity Integer
numberP = decimal langDef

floatP :: ParsecT String a Identity Double
floatP = float langDef

hexP :: ParsecT String a Identity Integer
hexP = hexadecimal langDef

octalP :: ParsecT String a Identity Integer
octalP = octal langDef

sequenceParsers :: [(ParsecT String u Identity (),ParsecT String u Identity a)]
                -> ParsecT String u Identity ()
sequenceParsers ps =
  try $
  ignore $
  do foldl (>>)
           (return ())
           (map fst ps)
     case ps of
       [] -> parserZero
       _ -> ignore (snd (last ps))

tryAllEnds :: [(ParsecT String () Identity (),ParsecT String () Identity a)]
           -> ParsecT String () Identity ()
tryAllEnds ps =
  foldl1 (<|>) ((map sequenceParsers (inits ps)) ++ [parserZero])

num :: ParsecT String a Identity Int
num =
  integerP >>=
  \n -> return ((fromIntegral n) :: Int)

floatOrInteger
  :: ParsecT String a Identity Double
floatOrInteger =
  (try $ floatP) <|>
  (do i <- integerP
      return ((fromIntegral i) :: Double))

numFourTuple
  :: ParsecT String () Identity (Int,Int,Int,Int)
numFourTuple =
  do _ <- trimAfter (char '{')
     x <- trimAfter numberP
     y <- trimAfter numberP
     w <- trimAfter numberP
     h <- trimAfter numberP
     _ <- trimAfter (char '}')
     return (fromIntegral x,fromIntegral y,fromIntegral w,fromIntegral h)

attrPs :: [ParsecT String () Identity Attribute]
attrPs =
  (map try
       [(codeP "code0" Code0)
       ,(codeP "code1" Code1)
       ,(codeP "code2" Code2)
       ,(codeP "code3" Code3)
       ,(attrP "labelfont" Labelfont num)
       ,(attrP "labelsize" Labelsize num)
       ,(attrP "labeltype" Labeltype unbrokenString)
       ,(attrP "labelcolor" Labelcolor num)
       ,(attrP "label" Label literal)
       ,(codeOrCallP "callback" Callback)
       ,(attrP "xywh" XYWH numFourTuple)
       ,(attrP "color" Color num)
       ,(attrP "maximum" Maximum num)
       ,(attrP "value" Value literal)
       ,(attrP "down_box" DownBox unbrokenString)
       ,(attrP "box" Box unbrokenString)
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
       ,(attrP "class" DerivedFromClass unbrokenString)
       ,(attrP "shortcut" Shortcut unbrokenString)
       ,(attrP "after" AfterCode literal)
       ,(attrP ":" Inherits unbrokenString)
       ,(attrP "#" LineComment toEndOfLine)
       ,(attrP "filename" Filename literal)
       ,(string "local" >> return Local)
       ,(string "global" >> return Global)
       ,(string "deactivate" >> return Deactivate)
       ,(string "public" >> return Public)
       ,(string "divider" >> return Divider)]) ++
  [(attrP "size_range" SizeRange numFourTuple)]

innardsP :: ParsecT String () Identity Attribute
innardsP =
  do spacesOrNewLines
     res <- trimAfter (choice (attrPs))
     return res

ignore :: Monad m
       => m a -> m ()
ignore p = p >> return ()

groupTypes
  :: [ParsecT String a Identity String]
groupTypes =
  (map try
     [ (string "Fl_Window")
     , (string "Fl_Group")
     , (string "Fl_Wizard")
     , (string "Fl_Pack")
     , (string "Fl_Table")
     , (string "Fl_Scroll")
     ]) ++
  [(string "Fl_Tabs")]

menuTypes
  :: [ParsecT String a Identity String]
menuTypes =
  (map try
     [ (string "Fl_Menu_Bar")
     , (string "Fl_Menu_Button")
     , (string "Fl_Choice")
     , (string "Fl_Input_Choice")
     ]) ++
  [(string "Submenu")]

componentTypes
  :: [ParsecT String a Identity String]
componentTypes =
  (map try
     [ (string "Fl_Slider")
     , (string "Fl_Value_Slider")
     , (string "Fl_Roller")
     , (string "Fl_Box")
     , (string "Fl_Scrollbar")
     , (string "Fl_Adjuster")
     , (string "Fl_Counter")
     , (string "Fl_Roller")
     , (string "Fl_Value_Input")
     , (string "Fl_Value_Output")
     , (string "Fl_Spinner")
     , (string "Fl_Dial")
     , (string "Fl_Button")
     , (string "Fl_Output")
     , (string "MenuItem")
     , (string "Fl_Input")
     , (string "Fl_Clock")
     , (string "Fl_Return_Button")
     , (string "Fl_Light_Button")
     , (string "Fl_Check_Button")
     , (string "Fl_Repeat_Button")
     , (string "Fl_Round_Button")
     , (string "Fl_Help_View")
     , (string "Fl_Browser")
     , (string "Fl_Check_Browser")
     , (string "Fl_File_Browser")
     , (string "Fl_Tree")
     , (string "Fl_Progress")
     ])

testIdentifier :: String
               -> (Char -> Bool)
               -> cons
               -> (String -> cons)
               -> (String -> cons)
               -> cons
testIdentifier idName testFirst unidentifiedCons invalidCons validCons =
  case idName of
    [] -> unidentifiedCons
    (c:_) ->
      if (not (isAlpha c))
        then invalidCons idName
        else if (not (testFirst c))
               then invalidCons idName
               else if (any
                          (\_c -> not
                                    ((_c == '\'') ||
                                     (isAlphaNum _c) ||
                                     (_c == '_')))
                          idName)
                      then invalidCons idName
                      else validCons idName

toHaskellIdentifier :: String -> HaskellIdentifier
toHaskellIdentifier idName =
  testIdentifier idName isLower Unidentified InvalidHaskell ValidHaskell

toModuleIdentifier :: String -> Maybe ModuleIdentifier
toModuleIdentifier modName =
  testIdentifier modName isUpper Nothing (Just . InvalidModule) (Just . ValidModule)

componentsP
  :: ParsecT String () Identity WidgetTree
componentsP =
  do cType <- trimAfter $ choice componentTypes
     name <-
       trimAfter $
       (try $ string "{}" >> return Unidentified) <|>
       (unbrokenString >>= return . toHaskellIdentifier)
     _ <- trimAfter (char '{')
     attrs <-
       manyTill innardsP (trimAfter $ char '}')
     return $ Component cType name attrs

containersP
  :: (Type -> HaskellIdentifier -> [Attribute] -> [WidgetTree] -> WidgetTree) -> [ParsecT String () Identity String] -> ParsecT String () Identity WidgetTree
containersP cons containerTypes =
  do cType <- trimAfter $ choice containerTypes
     name <-
       trimAfter $
       (try $ string "{}" >> return Unidentified) <|>
       (unbrokenString >>= return . toHaskellIdentifier)
     _ <- trimAfter (char '{')
     attrs <-
       manyTill innardsP (trimAfter $ char '}')
     _ <- trimAfter (char '{')
     body <-
       manyTill widgetTreeP (trimAfter $ char '}')
     return $ cons cType name attrs body

menusP :: ParsecT String () Identity WidgetTree
menusP = containersP Menu menuTypes

groupsP :: ParsecT String () Identity WidgetTree
groupsP = containersP Group groupTypes

codeBlockP
  :: ParsecT String () Identity WidgetTree
codeBlockP =
  do _ <- trimAfter $ string "codeblock"
     opener <- literal
     _ <- trimAfter (char '{')
     attrs <-
       manyTill innardsP (trimAfter $ char '}')
     _ <- trimAfter (char '{')
     body <-
       manyTill widgetTreeP (trimAfter $ char '}')
     return $ CodeBlock opener attrs body

argsBodyP :: String
          -> ([Attribute] -> UnbrokenOrBraced -> a)
          -> ParsecT String () Identity a
argsBodyP n cons =
  do _ <- trimAfter $ string n
     body <- literal
     _ <- trimAfter (char '{')
     attrs <-
       manyTill innardsP (trimAfter $ char '}')
     return (cons attrs body)

justArgsP
  :: String
  -> (String -> [Attribute] -> FluidBlock)
  -> ParsecT String () Identity FluidBlock
justArgsP n cons =
  do _ <- trimAfter $ string n
     name <- trimAfter unbrokenString
     _ <- trimAfter (char '{')
     attrs <-
       manyTill innardsP (trimAfter $ char '}')
     return (cons name attrs)

versionP :: ParsecT String () Identity WidgetTree
versionP =
  do _ <- trimAfter $ string "version"
     body <- unbrokenString
     return (Version body)

widgetTreeP
  :: ParsecT String () Identity WidgetTree
widgetTreeP =
  (try $ groupsP) <|> (try $ menusP) <|> (try $ codeBlockP) <|> (try $ componentsP) <|>
  (try $ argsBodyP "code" Code) <|>
  (try $ argsBodyP "comment" StandAloneComment) <|>
  versionP

functionP :: ParsecT String () Identity Function
functionP =
  do _ <- trimAfter $ string "Function"
     (name,args) <- trimAfter (try (string "{}" >> return (UnidentifiedFunction, FunctionArgs Nothing)) <|> functionName)
     _ <- trimAfter (char '{')
     attributes <-
       manyTill innardsP (trimAfter $ char '}')
     _ <- trimAfter (char '{')
     body <-
       manyTill widgetTreeP (trimAfter $ char '}')
     return (Function name args attributes body)

classP :: ParsecT String () Identity Class
classP =
  do _ <-
       trimAfter $ (try $ string "class") <|> (string "widget_class")
     name <- trimAfter unbrokenString
     _ <- trimAfter (char '{')
     otherArgs <-
       manyTill innardsP (trimAfter $ char '}')
     _ <- trimAfter (char '{')
     body <-
       manyTill fluidP (trimAfter $ char '}')
     return (Class (InvalidHaskell name) otherArgs body)
declBlockP
  :: ParsecT String () Identity FluidBlock
declBlockP =
  do _ <- trimAfter $ string "declblock"
     opener <- literal
     _ <- trimAfter (char '{')
     attrs <-
       manyTill innardsP (trimAfter $ char '}')
     _ <- trimAfter (char '{')
     body <-
       manyTill fluidP (trimAfter $ char '}')
     return (DeclBlock attrs opener body)

fluidP :: ParsecT String () Identity FluidBlock
fluidP =
  (try classP >>= return . FluidClass) <|>
  (try functionP >>= return . FluidFunction) <|>
  (try declBlockP) <|>
  (try $ argsBodyP "decl" Decl) <|>
  (justArgsP "data" Data)

runnerP
  :: ParsecT String () Identity [FluidBlock]
runnerP = untilP fluidP (lookAhead eof)

dontCare
  :: String -> ParsecT String a Identity ()
dontCare l =
  do _ <- string l
     _ <- manyTill anyChar endOfLine
     return ()

uselessHeader :: forall u.
                 ParsecT String u Identity ()
uselessHeader =
  dontCare "#" >> dontCare "version" >> dontCare "header_name" >>
  dontCare "code_name"
