#!/bin/runhaskell
import Control.Monad
import Text.Parsec
import Text.Parsec.String
import Data.List
import System.Environment
import Data.Char
import Text.Printf
import Debug.Trace

data ArgumentType = Normal String | Self String deriving Show
data Argument = Argument {
      argumentType :: ArgumentType,
      argumentName :: String,
      realArgumentType :: String
    } deriving Show
data FunctionName = FunctionName {
      realName :: String,
      className :: String,
      argument :: Argument
    } deriving Show

ppArgument :: String -> Argument -> String
ppArgument seperator argument = (getArgumentType . argumentType $ argument) ++ seperator ++ (argumentName argument)
ppCPPArgument seperator argument = (realArgumentType $ argument) ++ seperator ++ (argumentName argument)
exportMacro = "FL_EXPORT_C"

getArgumentType (Normal s) = s
getArgumentType (Self s) = s
isSelf (Self _) = True
isSelf _ = False

needsCasting argument = not ((isSelf $ argumentType argument) || ((getArgumentType $ argumentType argument) ==  realArgumentType argument))
cast argument variable = "(static_cast<" ++ realArgumentType argument ++ "*>" ++ "(" ++ variable ++ "))"
backCast argument variable = "(" ++ (getArgumentType . argumentType $ argument) ++ ")" ++ " " ++ variable
castIfNecessary argument | (isSelf $ argumentType argument) = argumentName argument
castIfNecessary argument | ((getArgumentType $ argumentType argument) ==  (realArgumentType argument)) = argumentName argument
castIfNecessary argument = "(static_cast<" ++ realArgumentType argument ++ "*>" ++ "(" ++ argumentName argument ++ "))"

getSelfArgument args = case filter (\arg -> case (argumentType arg) of
                                              (Self _) -> True
                                              _ -> False)
                                   args of
                         (x:xs) -> Just(argumentName x)
                         [] -> Nothing

outputDefaultImplementation (CPP (fn,args)) =
    let header = exportMacro ++ "(" ++ ppArgument "," (argument fn) ++ ")"
                 ++ "("
                 ++ intercalate "," (map (ppArgument " ") args)
                 ++ ")"
        return = if ("void" == (getArgumentType . argumentType . argument $ fn))
                 then
                     ""
                 else
                     "return"
        body = case ((argumentType . argument $ fn), getSelfArgument args) of
                 (Normal t, Just self) -> (printf "{\n %s (static_cast<%s*>(%s))->%s(%s);\n}"
                                                   return
                                                   (className fn)
                                                   self
                                                   (realName fn)
                                                   (intercalate "," (map castIfNecessary (tail args))))
                 (Normal t, Nothing) ->  (printf "{\n %s %s::%s(%s);\n}"
                                                    return
                                                   (className fn)
                                                   (realName fn)
                                                   (intercalate "," (map castIfNecessary args)))
                 (Self t, Just self) -> (printf "{\n %s (%s)(static_cast<%s*>(%s))->%s(%s);\n}"
                                                return
                                                t
                                                (className fn)
                                                self
                                                (realName fn)
                                                (intercalate "," (map castIfNecessary (tail args))))
                 _ -> "dunno"
    in
      header ++ body

extractTypeName arg@(x:xs) = ((intercalate " " . init $ arg),(last arg))
extractTypeName []         = ("","")


valueOrMe key table = case (lookup key table) of
                        Just v -> v
                        Nothing -> key

toHaskell prefix (CPP (function, arguments)) =
   let oldTypeName = getArgumentType . argumentType
       name = toHaskellName (realName function)
                            (\f -> if (isPrefixOf "Fl_" f)
                                   then (drop 3 f)
                                   else f)
       returnType = (valueOrMe (oldTypeName . argument $ function) simpleTypeMap, oldTypeName (argument function))
       haskellArgs = map (\a -> ((argumentName a), (valueOrMe (oldTypeName a) simpleTypeMap, oldTypeName a)))
                         arguments
       oldName = if (className function /= "")
                 then (className function) ++ "_" ++ (realName function)
                 else (realName function)
   in Haskell (prefix, oldName, name,returnType,haskellArgs)

toHaskellName name firstPartFunc
    = case parse parseName "" name of
        Right (part:parts) ->
            let processedParts' =
                    map (\p -> if (not $ null p)
                               then ((upcase $ [head p]) ++
                                              (tail p))
                               else p)
                        parts
                surroundedByEmpty as = not (null as) && (null (head as)) && (null (last as))
                headEmpty as  = not (null as) && null (head as)
                lastEmpty as  = not (null as) && null (last as)
                setLast x as | not (null as) = take (length as - 1) as ++ [x]
                setLast x _ = [x]
                setHead x as | not (null as) = [x] ++ drop 1 as
                setHead x _ = [x]
                ifDo p f xs = if (p xs) then f xs else xs
                processedParts = ifDo lastEmpty (setLast "_")
                                 (ifDo headEmpty (setHead "_") processedParts')
                processFirstThing = firstPartFunc part
            in
              intercalate "" ([processFirstThing] ++ processedParts)
        Left _ -> error "shouldn't happen"

withMarshaller marshaller a =
    if (isPrefixOf "Ptr" a || isPrefixOf "FunPtr" a)
    then (Just "id")
    else
        lookup a marshaller
type Arg = (String, (String,String))
data RectangleOrStandalone = Rectangle Arg Arg Arg Arg
                           | StandAlone Arg
                           | Position Arg Arg
                           | ByX Arg
                           | ByY Arg
                           | ByXY Arg Arg
                           | ReturnSize Arg Arg
                           | ReturnRectangle Arg Arg Arg Arg
                           | RGB Arg Arg Arg
                           | Style Arg
printHaskell (Haskell (prefix, oldName, name, returnType, haskellArgs)) =
    let addInMarshaller arg =
            case withMarshaller inMarshallMap arg of
              Just m -> m ++ " `" ++ arg ++ "'"
              Nothing -> "`" ++ arg ++ "'"
        addOutMarshaller arg =
            case withMarshaller outMarshallMap arg of
              Just m -> "`" ++ arg ++ "' " ++ m
              Nothing -> "`" ++ arg ++ "'"
        comment hArg cppArg = if (hArg == "Ptr ()")
                              then "{- " ++ cppArg ++ " -}"
                              else ""
        cppNameToHaskellName = map toLower
        nameToPtrName n = (cppNameToHaskellName n) ++ "Ptr"
        haskellFunction hArg =
            if ((fst . snd $ hArg) == "Ptr ()")
            then ("withObject " ++ (cppNameToHaskellName (fst hArg))
                                    ++ " $ \\" ++ (nameToPtrName (fst hArg)) ++ " -> ")
            else ""
        toHaskellType arg = case (lookup arg haskellEquivalent) of
                              Just a -> a ++ " a "
                              Nothing -> case (lookup arg simpleTypeMap) of
                                           Just a' -> a'
                                           Nothing -> arg
        haskellFunctionName = case prefix of
                               (Just p) -> p ++ [(toUpper . head $ name)] ++ (tail name)
                               Nothing -> name
        detectRectangleOrPosition (x@("X",(_,"int*")):y@("Y",(_,"int*")):w@("W",(_,"int*")):h@("H",(_,"int*")):args) =
           [ReturnRectangle x y w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("x",(_,"int*")):y@("y",(_,"int*")):w@("w",(_,"int*")):h@("h",(_,"int*")):args) =
           [ReturnRectangle x y w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("dx",(_,"int*")):y@("dy",(_,"int*")):w@("w",(_,"int*")):h@("h",(_,"int*")):args) =
           [ReturnRectangle x y w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (w@("w",(_,"int*")):h@("h",(_,"int*")):args) =
           [ReturnSize w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (w@("x",(_,"int*")):h@("y",(_,"int*")):args) =
           [ReturnSize w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("X",(_,_)):y@("Y",(_,_)):w@("W",(_,_)):h@("H",(_,_)):args) =
           [Rectangle x y w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("x",(_,_)):y@("y",(_,_)):w@("w",(_,_)):h@("h",(_,_)):args) =
           [Rectangle x y w h] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("x",(_,"int")):y@("y",(_,"int")):args) =
           [Position x y] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("X",(_,"int")):y@("Y",(_,"int")):args) =
           [Position x y] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("x",(_,"double")):y@("y",(_,"double")):args) =
           [ByXY x y] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("X",(_,"double")):y@("Y",(_,"double")):args) =
           [ByXY x y] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("x",(_,"double")):args) =
           [ByX x] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (x@("X",(_,"double")):args) =
           [ByX x] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (y@("y",(_,"double")):args) =
           [ByY y] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (y@("Y",(_,"double")):args) =
           [ByY y] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (r@("r",(_,"uchar")):g@("g",(_,"uchar")):b@("b", (_, "uchar")):args) =
           [RGB r g b] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (style@("style",(_,"int")):args) =
           [Style style] ++ detectRectangleOrPosition args
        detectRectangleOrPosition (arg:args) = [StandAlone arg] ++ detectRectangleOrPosition args
        detectRectangleOrPosition [] = []
        parsedArgs = detectRectangleOrPosition haskellArgs
        addRectangle ((Rectangle x y w h):args) = "let (x_pos', y_pos', width', height') = fromRectangle rectangle in\n"
        addRectangle _ = ""
        hasAllocated =
            any
             (\a -> case a of
                        ReturnRectangle _ _ _ _ -> True
                        ReturnSize _ _ -> True
                        _ -> False)
             parsedArgs
        allocatedReturn =
            (concat
             (map
              (\a -> case a of
                       ReturnRectangle _ _ _ _ -> ["Rectangle"]
                       ReturnSize _ _ -> ["Size"]
                       _ -> [])
              parsedArgs
             )
            )
    in
    printf "{# fun unsafe %s as %s { %s } -> %s #}\n%s\n%s"
           oldName
           (name ++ "'")
           (intercalate ","
            (concat
              (map
                (\a -> case a of
                         StandAlone (_,(hArg,_)) -> [(addInMarshaller hArg)]
                         Position (_,(hArg1,_)) (_,(hArg2,_)) -> [(addInMarshaller hArg1),
                                                                  (addInMarshaller hArg2)]
                         RGB (_,(hArg1,_)) (_,(hArg2,_))(_,(hArg3,_))
                             -> [(addInMarshaller hArg1),
                                 (addInMarshaller hArg2),
                                 (addInMarshaller hArg3)]
                         Style (_, (style,_))
                             -> [(addInMarshaller style)]
                         ByX (_,(hArg,_)) -> [(addInMarshaller hArg)]
                         ByY (_,(hArg,_)) -> [(addInMarshaller hArg)]
                         ByXY (_,(hArg1,_)) (_,(hArg2,_)) ->
                             [(addInMarshaller hArg1),
                              (addInMarshaller hArg2)]
                         Rectangle (_,(hArg1,_))(_,(hArg2,_))(_,(hArg3,_))(_,(hArg4,_)) ->
                             [(addInMarshaller hArg1),
                              (addInMarshaller hArg2),
                              (addInMarshaller hArg3),
                              (addInMarshaller hArg4)]
                         ReturnSize _ _ ->
                             [("alloca- `Int' peekIntConv*"),
                              ("alloca- `Int' peekIntConv*")]
                         ReturnRectangle _ _ _ _ ->
                             [("alloca- `Int' peekIntConv*"),
                              ("alloca- `Int' peekIntConv*"),
                              ("alloca- `Int' peekIntConv*"),
                              ("alloca- `Int' peekIntConv*")]

                )
               parsedArgs
              )
            )
           )
           (addOutMarshaller (fst returnType))
           (haskellFunctionName ++
            " :: " ++
            (intercalate
             " -> "
             ((map
               (
                \a -> case a of
                        StandAlone arg -> (toHaskellType . snd . snd) $ arg
                        Position _ _ -> "Position"
                        ByX _ -> "ByX"
                        ByY _ -> "ByY"
                        ByXY _ _ -> "ByXY"
                        Rectangle _ _ _ _ -> "Rectangle"
                        Style _ -> "LineStyle"
                        RGB _ _ _ -> "RGB"
                        ReturnSize _ _ -> ""
                        ReturnRectangle _ _ _ _ -> ""
               )
               parsedArgs) ++
              [" IO (" ++
               (intercalate
                ","
                (if (fst returnType == "()")
                 then allocatedReturn
                 else [(fst returnType)] ++ allocatedReturn)
               ) ++
               ")"
              ]
             )
            )
           )
           (haskellFunctionName
            ++ " "
            ++ (intercalate " " (map
                                 (
                                  \a -> case a of
                                          StandAlone arg -> (cppNameToHaskellName . fst) arg
                                          Position _ _ -> "(Position (X x_pos') (Y y_pos'))"
                                          ByX _ -> "(ByX by_x')"
                                          ByY _ -> "(ByY by_y')"
                                          ByXY _ _ -> "(ByXY by_x' by_y')"
                                          RGB _ _ _ -> "(r', g' , b')"
                                          Style _ -> "style"
                                          ReturnSize _ _ -> ""
                                          ReturnRectangle _ _ _ _ -> ""
                                          Rectangle x y w h -> "rectangle"
                                 )
                                 parsedArgs))
            ++ " = "
            ++ (concat (map
                        (\a -> case a of
                                 Rectangle _ _ _ _ -> "let (x_pos', y_pos', width', height') = fromRectangle rectangle in "
                                 _ -> ""
                        )
                        parsedArgs))
            ++ (concat (map haskellFunction haskellArgs))
            ++ (name ++ "'") ++ " "
            ++ (intercalate " " (map
                                 (
                                  \hArg -> case hArg of
                                             StandAlone arg ->
                                                 if ((fst . snd $ arg) == "Ptr ()")
                                                 then (nameToPtrName (fst arg))
                                                 else (cppNameToHaskellName (fst arg))
                                             ByX _ -> "by_x'"
                                             ByY _ -> "by_y'"
                                             ByXY _ _ -> "by_x' by_y'"
                                             Position _ _ -> "x_pos' y_pos'"
                                             Style _ -> ""
                                             RGB _ _ _ -> "r' g' b'"
                                             ReturnSize _ _ -> ""
                                             ReturnRectangle _ _ _ _ -> ""
                                             Rectangle _ _ _ _ -> "x_pos' y_pos' width' height'"
                                 )
                                 parsedArgs
                                )
               )
            ++ (
                if hasAllocated
                then
                    let allocatedArgs =
                            map (\a -> case a of
                                         "Rectangle" -> ("rectangle'", "toRectangle")
                                         "Size" -> ("size'", "toSize")
                                         _ -> ("","")
                                )
                            allocatedReturn
                    in
                    if (fst returnType == "()")
                    then ">>= \\(" ++ (intercalate "," (map fst allocatedArgs)) ++ ") -> return $ (" ++ (intercalate "," (map (\a -> (snd a) ++ " " ++ (fst a)) allocatedArgs)) ++ ")"
                    else ">>= \\(result, " ++ (intercalate "," (map fst allocatedArgs)) ++ ") -> return $ (result, " ++ (intercalate "," (map (\a -> (snd a) ++ " " ++ (fst a)) allocatedArgs)) ++ ")"
                else ""
               )
           )



inMarshallMap =
    [
     ("Boxtype", "cFromEnum")
    ,("Labeltype", "cFromEnum")
    ,("AlignType", "cFromEnum")
    ,("Color", "cFromColor")
    ,("CUInt", "id")
    ,("FlShortcut", "id")
    ,("When", "cFromEnum")
    ,("Mode", "cFromEnum")
    ,("Cursor", "cFromEnum")
    ,("LineStyle", "cFromEnum")
    ,("Font", "cFromFont")
    ,("FontAttribute", "cFromFontAttribute")
    ,("Fontsize", "cFromFontsize")
    ]
outMarshallMap =
    [
     ("Boxtype", "cToEnum")
    ,("Labeltype", "cToEnum")
    ,("Color", "cToColor")
    ,("Font", "cToFont")
    ,("FontAttribute", "cToFontAttribute")
    ,("Fontsize", "cToFontsize")
    ,("When", "cToEnum")
    ,("FlShortcut", "id")
    ,("AlignType", "cToEnum")
    ,("Mode", "cToEnum")
    ,("Cursor", "cToEnum")
    ,("LineStyle", "cToEnum")
    ,("Region", "unsafeToObject")
    ]
simpleTypeMap =
    [
     ("void", "()")
    ,("int", "Int")
    ,("void*", "Ptr ()")
    ,("double", "Double")
    ,("int*", "Ptr CInt")
    ,("char*", "String")
    ,("const char*", "String")
    ,("char* const*", "String")
    ,("const char* const*", "String")
    ,("float", "Float")
    ,("uchar", "Word8")
    ,("float*", "Ptr CFloat")
    ,("unsigned", "Int")
    ,("unsigned int", "Int")
    ,("fl_Region", "Ptr ()")
    ,("Fl_Boxtype", "Boxtype")
    ,("Fl_Mode", "Mode")
    ,("fl_Widget", "Ptr ()")
    ,("fl_Window", "Ptr ()")
    ,("fl_Group", "Ptr ()")
    ,("fl_Button", "Ptr ()")
    ,("fl_Valuator", "Ptr ()")
    ,("fl_Slider", "Ptr ()")
    ,("fl_Menu_Item", "Ptr ()")
    ,("fl_Menu_", "Ptr ()")
    ,("fl_Image", "Ptr ()")
    ,("fl_Bitmap", "Ptr ()")
    ,("Fl_Color", "Color")
    ,("Fl_Font", "Font")
    ,("Fl_Fontsize", "Fontsize")
    ,("Fl_FontAttribute", "FontAttribute")
    ,("Fl_Align", "AlignType")
    ,("Fl_Cursor", "Cursor")
    ,("Fl_Shortcut", "FlShortcut")
    ,("Fl_Labeltype", "Labeltype")
    ,("fl_Label_Draw_F*", "FunPtr LabelDrawFPrim")
    ,("fl_Label_Measure_F*", "FunPtr LabelMeasureFPrim")
    ,("fl_Box_Draw_F*", "FunPtr BoxDrawFPrim")
    ,("fl_Awake_Handler", "FunPtr AwakeHandlerPrim")
    ,("fl_Event_Handler", "FunPtr EventHandlerPrim")
    ,("fl_Timeout_Handler", "FunPtr TimeoutHandlerPrim")
    ,("fl_Abort_Handler", "FunPtr AbortHandlerPrim")
    ,("fl_Args_Handler", "FunPtr ArgsHandlerPrim")
    ,("fl_Atclose_Handler", "FunPtr AtCloseHandlerPrim")
    ,("fl_Atclose_Handler*", "Ptr (FunPtr AtCloseHandlerPrim)")
    ,("fl_Event_Dispatch*", "Ptr (FunPtr EventDispatchPrim)")
    ,("fl_Event_Dispatch",  "FunPtr EventDispatchPrim")
    ,("fl_FD_Handler", "FunPtr FDHandlerPrim")
    ,("fl_Idle_Handler", "FunPtr IdleHandlerPrim")
    ,("fl_Old_Idle_Handler", "FunPtr OldIdleHandlerPrim")
    ,("fl_Event_Dispatch*", "Ptr (FunPtr EventDispatchPrim)")
    ,("Fl_Shortcut", "CUInt")
    ,("fl_Atclose_Handler*", "Ptr (FunPtr AtCloseHandler)")
    ,("fl_When", "When")
    ,("fl_Gl_Window", "Ptr ()")
    ]
haskellEquivalent =
    [
     ("fl_Region"    , "Region"),
     ("fl_Widget"    , "Widget"),
     ("fl_Window"    , "Window"),
     ("fl_Group"     , "Group"),
     ("fl_Gl_Window" , "GlWindow"),
     ("fl_Image"     , "Image"),
     ("fl_Button"    , "Button"),
     ("fl_Valuator"  , "Valuator"),
     ("fl_Slider"    , "Slider"),
     ("fl_Image"     , "Image"),
     ("fl_Menu_Item" , "MenuItem"),
     ("fl_Menu_"     , "MenuPrim"),
     ("fl_Bitmap"     , "Bitmap")
    ]
upcase = map toUpper
makeArgument className argType argName =
    case ((upcase argType == upcase className), (isPrefixOf "fl_" argType)) of
      (True, True) -> Argument (Self argType) argName ("F" ++ (tail argType))
      (True, False) -> Argument (Self argType) argName argType
      (False, True) -> Argument (Normal argType) argName ("F" ++ (tail argType))
      (False, False) -> Argument (Normal argType) argName argType

parseArgList = (many (letter <|> digit <|> char '_' <|> char '*' <|> char '&')) `sepBy` (skipMany1 space) >>= return . filter (/= "")

parseName = (many (letter <|> digit)) `sepBy` (char '_')

extractClassName' functionName@(x:xs) accum | (x == "Fl") = extractClassName' xs x
extractClassName' functionName@(x1:x2:xs) accum | (x1 == "") && (x2 /= "") = accum ++ x1 ++ "_"
extractClassName' functionName@(x:xs) accum | (x == "") && (null xs) = accum
extractClassName' functionName@(x:xs) accum | (x == "")  = extractClassName' xs (accum ++ "_")
extractClassName' functionName@(x:xs) accum | (x /= "") && (isUpper(head x))= extractClassName' xs (accum ++ "_" ++ x)
extractClassName' functionName@(x:xs) accum = extractClassName' xs accum
extractClassName' [] accum = accum

extractClassName functionName = extractClassName' functionName ""

parseTypeName = do string exportMacro
                   char '('
                   spaces
                   typeString <- parseArgList >>= return . intercalate " "
                   spaces
                   char ','
                   spaces
                   (className, functionName) <- parseName >>=
                                                return . (\f -> (extractClassName f,
                                                                 intercalate "_" f))
                   spaces
                   char ')'
                   let realName =  if ((not $ isInfixOf "New" functionName) &&
                                        isPrefixOf className functionName)
                                   then
                                       if (length className == 0)
                                       then functionName
                                       else drop (length $ className ++ "_") functionName
                                   else functionName
                   return $ FunctionName realName
                                         className
                                         (makeArgument className typeString functionName)
inBlock start end accumulatedInput level levelp p parsed =
    do { try (char start);
         inBlock' start end accumulatedInput level levelp p parsed
       }

inBlock' start end accumulatedInput level levelp p parsed =
      do { try (char end);
           if (levelp level)
           then
               case parse p "" accumulatedInput of
                 Right parsed -> return (Just parsed)
                 Left err -> return Nothing
           else return Nothing
         }
  <|> do { x <- inBlock start end accumulatedInput (level + 1) levelp p parsed;
           inBlock' start end "" level levelp p x
         }
  <|> do { x <- if (levelp level)
                then many (noneOf [start,end])
                else skipMany (noneOf [start,end]) >> return "";
           inBlock' start end (accumulatedInput ++ x) level levelp p parsed
         }

parseImplementation = do
  functionSignature <- parseTypeName
  spaces
  arguments <- parseArguments (className functionSignature)
  spaces
  actualFunctionName <- case functionSignature of
                          FunctionName _ _ (Argument (Self _) _ _) ->
                              do {skipFunctionBody; return Nothing}
                          FunctionName _ _ (Argument (Normal _) _ _) ->
                              (inBlock '{' '}' "" 0 (== 0) grabFlCall Nothing)
                             <|>
                             do { skipFunctionBody; return Nothing}
  case actualFunctionName of
    Just n -> return (arguments,functionSignature {realName = n})
    Nothing -> return (arguments, functionSignature)
  where
    skipFunctionBody = inBlock '{' '}' "" 0 (== 0) (many anyChar) Nothing
    grabFlCall = do
      manyTill (noneOf "{}") (string "static_cast");
      manyTill (noneOf "\n") (string "->")
      name <- manyTill (noneOf "{}") (try (string "("))
      return name

ignoreUntil e p = scan
    where
      scan = try (do {x <- e; return x})
             <|>
             do {p; x <- scan; return x}

parseCPP = do
  manyTill anyChar (try (string "EXPORT {"))
  impls <- many (try (ignoreUntil parseImplementation (noneOf "{}")))
  manyTill anyChar (char '}')
  return impls

parseArguments className = do char '('
                              spaces
                              arguments <- do
                                args <- parseArgList `sepBy` (char ',')
                                if (not (null (head args)))
                                then return $ map (uncurry (makeArgument className) . extractTypeName) args
                                else return []
                              spaces
                              char ')'
                              return arguments

parseTypeSignature = do spaces
                        typeName <- parseTypeName
                        arguments <- parseArguments (className typeName)
                        char ';'
                        spaces
                        return $ CPP (typeName, arguments)

replaceSquareBrackets = map translateSquareBracket
                        where
                          translateSquareBracket '[' = '('
                          translateSquareBracket ']' = ')'
                          translateSquareBracket x = x

parseAndProcess parser input f =
    case parse parser "" input of
      Right output -> f output
      Left err -> error (show err)
data ParseOutputType = Haskell (Maybe String, String, String,(String,String),[(String, (String,String))]) |
                       CPP (FunctionName, [Argument]) deriving Show

main = do (argType:arg:args) <- getArgs
          case argType of
            "string" ->
                parseAndProcess parseTypeSignature arg (putStrLn . outputDefaultImplementation)
            "" ->
                parseAndProcess parseTypeSignature arg (printHaskell . (toHaskell Nothing))
            prefix ->
                parseAndProcess parseTypeSignature arg (printHaskell . (toHaskell (Just prefix)))
testHaskellName input =
                parseAndProcess parseTypeSignature input (printHaskell . (toHaskell (Just "test")))
generateFunctionPointers :: [([Argument],FunctionName)] -> String
generateFunctionPointers impls = printf "struct blah {\n%s\n};" (intercalate ";\n" (map generateFunctionPointer impls))
generateFunctionPointer :: ([Argument], FunctionName) -> String
generateFunctionPointer (args, FunctionName _ _ name@(Argument argType argName argRealType)) = printf "%s (*%s)(%s)" (getArgumentType argType) ("f" ++ (tail argName)) (intercalate "," (map (ppArgument " ") args))
generateDerivedMethod :: ([Argument], FunctionName) -> String
generateDerivedMethod impl =
          let returnType = getArgumentType (argumentType . argument . snd $ impl)
              cppReturnType = if (isPrefixOf "fl" returnType)
                              then "F" ++ (tail returnType) ++ "*"
                              else returnType
              functionName = realName (snd impl)
              cppClass = className $ snd impl
              makeArgList prettyPrinter args = intercalate "," (map prettyPrinter args)
              cppArgList prettyPrinter = makeArgList prettyPrinter (case (fst impl) of
                                                                      ((Argument (Self _) _ _):args) -> args
                                                                      _ -> (fst impl))
              cppArgListSignature = cppArgList (ppCPPArgument " ")
              cppArgListPassing = cppArgList argumentName
              functionPointerArgList = case (fst impl) of
                                         ((Argument (Self s) _ _):args) ->
                                             case (makeArgList (\arg -> if (needsCasting arg)
                                                                        then backCast arg (argumentName arg)
                                                                        else (argumentName arg))
                                                   args) of
                                               as@(x:xs) -> "(" ++ s ++ ") this," ++ as
                                               _ ->"(" ++ s ++ ") this"
                                         _ -> makeArgList argumentName (fst impl)
              functionPointer = "f" ++ (tail (argumentName . argument . snd $ impl))
              callFunctionPointer :: String
              callFunctionPointer = printf "this->overriddenFuncs->%s(%s)" functionPointer functionPointerArgList
              returnResult :: String
              returnResult = if (returnType /= "void")
                             then
                                 printf "%s result = %s;\n return %s;"
                                        returnType
                                        callFunctionPointer
                                        (if (needsCasting (argument . snd $ impl))
                                         then cast (argument . snd $ impl) "result"
                                         else "result")
                             else
                                 printf "%s;" callFunctionPointer
              in
                printf "%s %s::%s(%s){\n if (this->overriddenFuncs->%s != NULL) {\n %s \n}\nelse {\n %s::%s(%s);\n}\n}\n" cppReturnType (cppClass ++ "Derived") functionName cppArgListSignature functionPointer returnResult cppClass functionName cppArgListPassing

printImplementation sig =  case parse parseTypeSignature "" sig of
                             Right output ->  outputDefaultImplementation output
                             Left err -> show err
