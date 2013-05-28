#!/bin/runhaskell
import Control.Monad
import Text.Parsec
import Data.List
import System.Environment
import Data.Char

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

exportMacro = "FL_EXPORT_C"

getArgumentType (Normal s) = s
getArgumentType (Self s) = s
isSelf (Self _) = True
isSelf _ = False

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
                 (Normal t, Just self) -> "{" ++ "\n" ++ "  " ++
                             return ++ " " ++ "(static_cast<" ++ className fn ++ "*>" ++
                             "(" ++ self ++ ")" ++ ")" ++ "->" ++ (realName fn) ++ "(" ++ intercalate "," (map castIfNecessary (tail args)) ++ ");" ++ "\n" ++
                              "}"
                 (Normal t, Nothing) ->  "{" ++ "\n" ++ "  " ++
                             return ++ " " ++ className fn ++ "::" ++ (realName fn) ++ "(" ++ intercalate "," (map castIfNecessary args) ++ ");" ++ "\n" ++
                              "}"

                 _ -> "dunno"
    in
      header ++ body
extractTypeName arg@(x1:x2:x3:xs) = ((intercalate " " . reverse . tail . reverse $ arg),
                                     (last arg))
extractTypeName (x1:x2:xs) = (x1,x2)
extractTypeName _ = ("","")
upcase = map toUpper
makeArgument className argType argName =
    case ((upcase argType == upcase className), (isPrefixOf "fl_" argType)) of
      (True, True) -> Argument (Self argType) argName ("F" ++ (tail argType))
      (True, False) -> Argument (Self argType) argName argType
      (False, True) -> Argument (Normal argType) argName ("F" ++ (tail argType))
      (False, False) -> Argument (Normal argType) argName argType

parseArgList = (many (letter <|> char '_' <|> char '*' <|> char '&')) `sepBy` (skipMany1 space) >>= return . filter (/= "")

parseName = (many letter) `sepBy` (char '_')

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
main = do (arg:args) <- getArgs
          case parse parseTypeSignature "" arg of
            Right output ->  putStrLn (outputDefaultImplementation output)
            Left err -> error (show err)

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
  "FL_EXPORT_C(fl_Window,    Fl_Window_New_WithTitle)(int x, int y, const char* title);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_New)(int x, int y);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_NewWH_WithTitle)(int x, int y, int w, int h, const char* title);",
  "FL_EXPORT_C(fl_Window,    Fl_Window_NewWH)(int x, int y, int w, int h);",
  "FL_EXPORT_C(void,         Fl_Window_hide)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_show)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_show_with_args)(fl_Window win, int argc, char** argv);",
  "FL_EXPORT_C(void,         Fl_Window_destroy)(fl_Window win);",
  "FL_EXPORT_C(void,         Fl_Window_resize)(fl_Window win, int X, int Y, int W, int H);",
  "FL_EXPORT_C(void,         Fl_Window_iconize)(fl_Window win);"]
