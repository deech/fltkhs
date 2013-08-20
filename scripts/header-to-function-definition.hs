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

outputDefaultImplementation (fn,args) =
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

extractTypeName arg@(x:[]) = (x,"")
extractTypeName arg@(x:xs) = ((intercalate " " . init $ arg),(last arg))
extractTypeName []         = ("","")

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
extractClassName' functionName@(x1:xs) accum | (x1 == "")  = extractClassName' xs (accum ++ "_")
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
                                       drop (length $ className ++ "_") functionName
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
                              arguments <- parseArgList `sepBy` (char ',') >>=
                                           return . map (uncurry (makeArgument className) . extractTypeName)
                              spaces
                              char ')'
                              return arguments

parseTypeSignature = do spaces
                        typeName <- parseTypeName
                        arguments <- parseArguments (className typeName)
                        char ';'
                        spaces
                        return (typeName, arguments)

replaceSquareBrackets = map translateSquareBracket
                        where
                          translateSquareBracket '[' = '('
                          translateSquareBracket ']' = ')'
                          translateSquareBracket x = x
main = do (argType:arg:args) <- getArgs
          case argType of
            "string" ->
                case parse parseTypeSignature "" arg of
                  Right output ->  putStrLn (outputDefaultImplementation output)
                  Left err -> error (show err)
            -- "file-cpp" ->
            --     case parseFromFile parseImplementation arg of
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

test = mapM_ (\a -> putStrLn $ printImplementation a) testSet

testSet = [  "FL_EXPORT_C(fl_Align,     Fl_Window_align)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_position)(fl_Window win, int X, int Y);",
  "FL_EXPORT_C(size,         Fl_Window_size)(fl_Window win, int W, int H);",
  "FL_EXPORT_C(int,          Fl_Window_x)(fl_Window win);",
  "FL_EXPORT_C(int,          Fl_Window_y)(fl_Window win);",
  "FL_EXPORT_C(int,          Fl_Window_w)(fl_Window win);",
  "FL_EXPORT_C(int,          Fl_Window_h)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_box)(fl_Window win, fl_Boxtype new_box);",
  "FL_EXPORT_C(fl_Boxtype,   Fl_Window_box)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_type)(fl_Window win, uchar t);",
  "FL_EXPORT_C(void,         Fl_Window_set_color)(fl_Window win, fl_Color bg);",
  "FL_EXPORT_C(fl_Color,     Fl_Window_color)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_selection_color)(fl_Window win, fl_Color a);",
  "FL_EXPORT_C(fl_Color,     Fl_Window_selection_color)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_background_and_selection_color)(fl_Window win,fl_Color bg, fl_Color a);",
  "FL_EXPORT_C(const char*,  Fl_Window_label)(fl_Window win);",
  "FL_EXPORT_C(const char*,  Fl_Window_set_label)(fl_Window win, const char* text);",
  "FL_EXPORT_C(const char*,  Fl_Window_set_text_and_type_label)(fl_Window win, fl_Labeltype a, const char* b);",
  "FL_EXPORT_C(fl_Labeltype, Fl_Window_labeltype)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_labeltype)(fl_Window win, fl_Labeltype a);",
  "FL_EXPORT_C(fl_Color,     Fl_Window_labelcolor)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_labelcolor)(fl_Window win, fl_Color c);",
  "FL_EXPORT_C(fl_Font,      Fl_Window_labelfont)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_labelfont)(fl_Window win, fl_Font c);",
  "FL_EXPORT_C(fl_Fontsize,  Fl_Window_labelsize)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_labelsize)(fl_Window win, fl_Fontsize pix);",
  "FL_EXPORT_C(void,         Fl_Window_copy_label)(fl_Window win, const char* new_label);",
  "FL_EXPORT_C(fl_Image,     Fl_Window_image)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_image)(fl_Window win, fl_Image pix);",
  "FL_EXPORT_C(uchar,        Fl_Window_type)(fl_Window win);",
  "FL_EXPORT_C(fl_Image,     Fl_Window_deimage)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_deimage)(fl_Window win, fl_Image pix);",
  "FL_EXPORT_C(const char*,  Fl_Window_tooltip)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_tooltip)(fl_Window win, const char* text);",
  "FL_EXPORT_C(void,         Fl_Window_copy_tooltip)(fl_Window win, const char* text);",
  "FL_EXPORT_C(fl_Callback,  Fl_Window_callback)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_callback_and_user_data)(fl_Window win, fl_Callback cb, void* p);",
  "FL_EXPORT_C(void,         Fl_Window_set_callback)(fl_Window win, fl_Callback cb);",
  "FL_EXPORT_C(void*,        Fl_Window_user_data)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_user_data)(fl_Window win, void* v);",
  "FL_EXPORT_C(long,         Fl_Window_argument)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_argument)(fl_Window win, long v);",
  "FL_EXPORT_C(fl_When,      Fl_Window_when)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_when)(fl_Window win, uchar i);",
  "FL_EXPORT_C(unsigned int, Fl_Window_visible)(fl_Window win);",
  "FL_EXPORT_C(int,          Fl_Window_visible_r)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_visible)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_clear_visible)(fl_Window win);",
  "FL_EXPORT_C(unsigned int, Fl_Window_active)(fl_Window win);",
  "FL_EXPORT_C(int,          Fl_Window_active_r)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_activate)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_deactivate)(fl_Window win);",
  "FL_EXPORT_C(unsigned int, Fl_Window_output)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_output)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_clear_output)(fl_Window win);",
  "FL_EXPORT_C(unsigned int, Fl_Window_takesevents)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_changed)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_clear_changed)(fl_Window win);",
  "FL_EXPORT_C(int,          Fl_Window_take_focus)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_visible_focus)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_clear_visible_focus)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_modify_visible_focus)(fl_Window win, int v);",
  "FL_EXPORT_C(unsigned int, Fl_Window_visible_focus)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_do_callback)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_do_callback_with_widget_and_user_data)(fl_Window win, fl_Widget w, long arg);",
  "FL_EXPORT_C(void,         Fl_Window_do_callback_with_widget_and_default_user_data)(fl_Window win, fl_Widget w);",
  "FL_EXPORT_C(int,          Fl_Window_contains)(fl_Window win, fl_Widget w);",
  "FL_EXPORT_C(int,          Fl_Window_inside)(fl_Window win, fl_Widget w);",
  "FL_EXPORT_C(void,         Fl_Window_redraw)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_redraw_label)(fl_Window win);",
  "FL_EXPORT_C(uchar,        Fl_Window_damage)(fl_Window win);",
  "FL_EXPORT_C(uchar,        Fl_Window_clear_damage)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_clear_damage_with_bitmask)(fl_Window win, uchar c);",
  "FL_EXPORT_C(void,         Fl_Window_clear_damage)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_damage_with_text)(fl_Window win, uchar c);",
  "FL_EXPORT_C(void,         Fl_Window_damage_inside_widget)(fl_Window win, uchar c, int x , int y , int w, int h);",
  "FL_EXPORT_C(void,         Fl_Window_draw_label)(fl_Window win, int x , int y , int w, int h, fl_Align alignment);",
  "FL_EXPORT_C(void,         Fl_Window_measure_label)(fl_Window win, int& ww , int& hh);",
  "FL_EXPORT_C(fl_Group,     Fl_Window_as_group)(fl_Window win);",
  "FL_EXPORT_C(fl_Gl_Window, Fl_Window_as_gl_window)(fl_Window win);",
  "FL_EXPORT_C(unsigned int, Fl_Window_changed)(fl_Window win);",
  "FL_EXPORT_C(fl_Group,     Fl_Window_parent)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_set_parent)(fl_Window win, fl_Group win);",
  "FL_EXPORT_C(void,         Fl_Window_fullscreen)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_fullscreen_off)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_fullscreen_off_with_resize)(fl_Window win,int X,int Y,int W,int H);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_New_WithLabel)(int x, int y, const char* title);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_New)(int x, int y);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_NewWH_WithTitle)(int x, int y, int w, int h, const char* title);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_NewWH)(int x, int y, int w, int h);",
  "FL_EXPORT_C(void,         Fl_Window_hide)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_show)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_show_with_args)(fl_Window win, int argc, char** argv);",
  "FL_EXPORT_C(void,         Fl_Window_destroy)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_resize)(fl_Window win, int X, int Y, int W, int H);",
  "FL_EXPORT_C(void,         Fl_Window_iconize)(fl_Window win);"]
testSet1 =
  ["FL_EXPORT_C(fl_Group,Fl_Table_parent)(fl_Table table){ \
    \return (static_cast<Fl_DerivedTable*>(table))->parent(); \
  \}",
  "FL_EXPORT_C(void,Fl_Table_set_parent)(fl_Table table,fl_Group grp){ \
    \(static_cast<Fl_DerivedTable*>(table))->parent((static_cast<Fl_Group*>(grp)));\
  \}",
  "FL_EXPORT_C(void,Fl_Table_do_callback)(fl_Table table, TableContextC tableContext, int row, int col){ \
    \Fl_Table::TableContext c = (Fl_Table::TableContext)-1;\
    \switch(tableContext){\
    \case CONTEXT_NONEC:      {c = Fl_Table::CONTEXT_NONE;      break;}\
    \case CONTEXT_STARTPAGEC: {c = Fl_Table::CONTEXT_STARTPAGE; break;}\
    \case CONTEXT_ENDPAGEC:   {c = Fl_Table::CONTEXT_ENDPAGE;   break;}\
    \case CONTEXT_ROW_HEADERC:{c = Fl_Table::CONTEXT_ROW_HEADER;break;}\
    \case CONTEXT_COL_HEADERC:{c = Fl_Table::CONTEXT_COL_HEADER;break;}\
    \case CONTEXT_CELLC:      {c = Fl_Table::CONTEXT_CELL;      break;}\
    \case CONTEXT_TABLEC:     {c = Fl_Table::CONTEXT_TABLE;     break;}\
    \case CONTEXT_RC_RESIZEC: {c = Fl_Table::CONTEXT_RC_RESIZE; break;}\
    \default:                 {c = (Fl_Table::TableContext)-1;  break;}\
    \}\
    \(static_cast<Fl_DerivedTable*>(table))->do_callback(c, row, col);\
  \}"]
