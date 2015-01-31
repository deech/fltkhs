{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Input
    (
     FlInputType,
     -- * Constructor
     inputNew
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Input
     --
     -- $Input
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_InputC.h"
#include "Fl_Input_C.h"
#include "Fl_Int_InputC.h"
#include "Fl_Float_InputC.h"
#include "Fl_Secret_InputC.h"
#include "Fl_Multiline_InputC.h"
#include "Fl_OutputC.h"
#include "Fl_Multiline_OutputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
#c
enum FlInputType {
  FlNormalInput = FL_NORMAL_INPUT,
  FlFloatInput = FL_FLOAT_INPUT,
  FlIntInput = FL_INT_INPUT,
  FlMultilineInput = FL_MULTILINE_INPUT,
  FlSecretInput = FL_SECRET_INPUT,
  FlNormalOutput = FL_NORMAL_OUTPUT,
  FlMultilineOutput = FL_MULTILINE_OUTPUT
};
#endc
{#enum FlInputType {}#}
{# fun Fl_Input_New as inputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Input_New_WithLabel as inputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Multiline_Input_New as multilineInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Multiline_Input_New_WithLabel as multilineInputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Float_Input_New as floatInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Float_Input_New_WithLabel as floatInputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Int_Input_New as intInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Int_Input_New_WithLabel as intInputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Secret_Input_New as secretInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Secret_Input_New_WithLabel as secretInputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Output_New as outputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Output_New_WithLabel as outputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Multiline_Output_New as multilineOutputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Multiline_Output_New_WithLabel as multilineOutputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
inputNew :: Maybe FlInputType -> Rectangle -> Maybe String -> IO (Ref Input)
inputNew flInputType rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
        constructor = case flInputType of
                       Just FlNormalInput -> maybe inputNew' (\l -> (\x y w h -> inputNewWithLabel' x y w h l)) l'
                       Just FlFloatInput -> maybe floatInputNew' (\l -> (\x y w h -> floatInputNewWithLabel' x y w h l)) l'
                       Just FlIntInput -> maybe intInputNew'  (\l -> (\x y w h -> intInputNewWithLabel' x y w h l)) l'
                       Just FlMultilineInput -> maybe multilineInputNew'  (\l -> (\x y w h -> multilineInputNewWithLabel' x y w h l)) l'
                       Just FlSecretInput -> maybe secretInputNew' (\l -> (\x y w h -> secretInputNewWithLabel' x y w h l)) l'
                       Just FlNormalOutput -> maybe outputNew' (\l -> (\x y w h -> outputNewWithLabel' x y w h l)) l'
                       Just FlMultilineOutput -> maybe multilineOutputNew' (\l -> (\x y w h -> multilineOutputNewWithLabel' x y w h l)) l'
                       Nothing -> inputNew'
    in
    constructor x_pos y_pos width height >>= toRef

{# fun Fl_Input_Destroy as inputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Input orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    inputDestroy' winPtr
    return nullPtr

{#fun Fl_Input_handle as inputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
{#fun Fl_Secret_Input_handle as secretInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Input orig impl where
  runOp _ _ input event =
    withRef
      input
      (\p -> do
          t <- getInputType input
          case (toEnum (fromIntegral t)) of
           FlSecretInput -> secretInputHandle' p (fromIntegral . fromEnum $ event)
           _             -> inputHandle' p (fromIntegral . fromEnum $ event)
      )
{# fun unsafe Fl_Input_set_value as setValue' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Input_set_value_with_length as setValueWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
instance (impl ~ (String -> Maybe Int -> IO (Int))) => Op (SetValue ()) Input orig impl where
  runOp _ _ input text l' =
    case l' of
     Nothing -> withRef input $ \inputPtr -> setValue' inputPtr text
     Just l -> withRef input $ \inputPtr -> setValueWithLength' inputPtr text l
{# fun unsafe Fl_Input_static_value as staticValue' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Input_static_value_with_length as staticValueWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
instance (impl ~ (String -> Maybe Int ->  IO (Either NoChange ()))) => Op (StaticValue ()) Input orig impl where
  runOp _ _ input text l'= do
    status' <- case l' of
      Nothing -> withRef input $ \inputPtr -> staticValue' inputPtr text
      Just l -> withRef input $ \inputPtr -> staticValueWithLength' inputPtr text l
    return $ statusToEither status'
{# fun unsafe Fl_Input_value as value' { id `Ptr ()' } -> `String' #}
instance (impl ~ ( IO (String))) => Op (GetValue ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> value' inputPtr
{# fun unsafe Fl_Input_index as index' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Char))) => Op (Index ()) Input orig impl where
  runOp _ _ input i = withRef input $ \inputPtr -> index' inputPtr i >>= return . toEnum
{# fun unsafe Fl_Input_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Size ->  IO ())) => Op (SetSize ()) Input orig impl where
  runOp _ _ input (Size (Width w') (Height h')) = withRef input $ \inputPtr -> setSize' inputPtr w' h'
{# fun unsafe Fl_Input_maximum_size as maximumSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetMaximumSize ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> maximumSize' inputPtr
{# fun unsafe Fl_Input_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> size' inputPtr
{# fun unsafe Fl_Input_set_maximum_size as setMaximumSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetMaximumSize ()) Input orig impl where
  runOp _ _ input m = withRef input $ \inputPtr -> setMaximumSize' inputPtr m
{# fun unsafe Fl_Input_position as position' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetPosition ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> position' inputPtr
{# fun unsafe Fl_Input_mark as mark' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetMark ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> mark' inputPtr
{# fun unsafe Fl_Input_set_position_with_cursor_mark as setPositionWithCursorMark' { id `Ptr ()',`Int',`Int' } -> `Int' #}
{# fun unsafe Fl_Input_set_position_n_n as setPositionNN' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int -> Maybe Int -> IO (Either NoChange ()))) => Op (SetPosition ()) Input orig impl where
  runOp _ _ input point mark = do
   status' <- case mark of
      Just m ->  withRef input $ \inputPtr -> setPositionWithCursorMark' inputPtr point m
      Nothing -> withRef input $ \inputPtr -> setPositionNN' inputPtr point
   return $ statusToEither status'
{# fun unsafe Fl_Input_set_mark as setMark' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Either NoChange ()))) => Op (SetMark ()) Input orig impl where
  runOp _ _ input m = withRef input $ \inputPtr -> setMark' inputPtr m >>= return . statusToEither
{# fun unsafe Fl_Input_replace as replace' { id `Ptr ()',`Int',`Int',`String' } -> `Int' #}
instance (impl ~ (Int -> Int -> String ->  IO (Either NoChange ()))) => Op (Replace ()) Input orig impl where
  runOp _ _ input b e text = withRef input $ \inputPtr -> replace' inputPtr b e  text >>= return . statusToEither
{# fun unsafe Fl_Input_cut as cut' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (Cut ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> cut' inputPtr >>= return . statusToEither
{# fun unsafe Fl_Input_cut_bytes as cutBytes' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Either NoChange ()))) => Op (CutFromCursor ()) Input orig impl where
  runOp _ _ input n = withRef input $ \inputPtr -> cutBytes' inputPtr n >>= return . statusToEither
{# fun unsafe Fl_Input_cut_range as cutRange' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance (impl ~ (Int -> Int ->  IO (Either NoChange ()))) => Op (CutRange ()) Input orig impl where
  runOp _ _ input a b = withRef input $ \inputPtr -> cutRange' inputPtr a b >>= return . statusToEither
{# fun unsafe Fl_Input_insert as insert' { id `Ptr ()',`String' } -> `Int' #}
instance (impl ~ (String ->  IO (Either NoChange ()))) => Op (Insert ()) Input orig impl where
  runOp _ _ input t = withRef input $ \inputPtr -> insert' inputPtr t >>= return . statusToEither
{# fun unsafe Fl_Input_insert_with_length as insertWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
instance (impl ~ (String -> Int ->  IO (Either NoChange ()))) => Op (InsertWithLength ()) Input orig impl where
  runOp _ _ input t l = withRef input $ \inputPtr -> insertWithLength' inputPtr t l >>= return . statusToEither
{# fun unsafe Fl_Input_copy as copy' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Clipboard ->  IO (Either NoChange ()))) => Op (Copy ()) Input orig impl where
  runOp _ _ input clipboard = do
    status' <- case clipboard of
      InternalClipboard -> withRef input $ \inputPtr -> copy' inputPtr 1
      SharedClipboard -> withRef input $ \inputPtr -> copy' inputPtr 0
    return $ statusToEither status'
{# fun unsafe Fl_Input_undo as undo' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (Undo ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> undo' inputPtr >>= return . statusToEither
{# fun unsafe Fl_Input_copy_cuts as copyCuts' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (CopyCuts ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> copyCuts' inputPtr >>= return . statusToEither
{# fun unsafe Fl_Input_shortcut as shortcut' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetShortcut ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> shortcut' inputPtr
{# fun unsafe Fl_Input_set_shortcut as setShortcut' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetShortcut ()) Input orig impl where
  runOp _ _ input s = withRef input $ \inputPtr -> setShortcut' inputPtr s
{# fun unsafe Fl_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> textfont' inputPtr
{# fun unsafe Fl_Input_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) Input orig impl where
  runOp _ _ input s = withRef input $ \inputPtr -> setTextfont' inputPtr s
{# fun unsafe Fl_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> textsize' inputPtr >>= return . FontSize
{# fun unsafe Fl_Input_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) Input orig impl where
  runOp _ _ input (FontSize s) = withRef input $ \inputPtr -> setTextsize' inputPtr s
{# fun unsafe Fl_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> textcolor' inputPtr
{# fun unsafe Fl_Input_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) Input orig impl where
  runOp _ _ input n = withRef input $ \inputPtr -> setTextcolor' inputPtr n
{# fun unsafe Fl_Input_cursor_color as cursorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetCursorColor ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> cursorColor' inputPtr
{# fun unsafe Fl_Input_set_cursor_color as setCursorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetCursorColor ()) Input orig impl where
  runOp _ _ input n = withRef input $ \inputPtr -> setCursorColor' inputPtr n
{# fun unsafe Fl_Input_input_type as inputType' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetInputType ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> inputType' inputPtr
{# fun unsafe Fl_Input_set_input_type as setInputType' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetInputType ()) Input orig impl where
  runOp _ _ input t = withRef input $ \inputPtr -> setInputType' inputPtr t
{# fun unsafe Fl_Input_readonly as readonly' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetReadonly ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> readonly' inputPtr
{# fun unsafe Fl_Input_set_readonly as setReadonly' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetReadonly ()) Input orig impl where
  runOp _ _ input b = withRef input $ \inputPtr -> setReadonly' inputPtr b
{# fun unsafe Fl_Input_wrap as wrap' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetWrap ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> wrap' inputPtr
{# fun unsafe Fl_Input_set_wrap as setWrap' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetWrap ()) Input orig impl where
  runOp _ _ input b = withRef input $ \inputPtr -> setWrap' inputPtr b
{# fun unsafe Fl_Input_tab_nav as tabNav' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (GetTabNav ()) Input orig impl where
  runOp _ _ input val = withRef input $ \inputPtr -> tabNav' inputPtr val
{# fun unsafe Fl_Input_set_tab_nav as setTabNav' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (SetTabNav ()) Input orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> setTabNav' inputPtr

-- $Input
-- @
--
-- copy :: 'Ref' 'Input' -> 'Clipboard' -> 'IO' ('Either' 'NoChange' ())
--
-- copyCuts :: 'Ref' 'Input' -> 'IO' ('Either' 'NoChange' ())
--
-- cut :: 'Ref' 'Input' -> 'IO' ('Either' 'NoChange' ())
--
-- cutFromCursor :: 'Ref' 'Input' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- cutRange :: 'Ref' 'Input' -> 'Int' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- destroy :: 'Ref' 'Input' -> 'IO' ()
--
-- getCursorColor :: 'Ref' 'Input' -> 'IO' 'Color'
--
-- getInputType :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getMark :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getMaximumSize :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getPosition :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getReadonly :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getShortcut :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getSize :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- getTabNav :: 'Ref' 'Input' -> 'Int' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'Input' -> 'IO' 'Color'
--
-- getTextfont :: 'Ref' 'Input' -> 'IO' 'Font'
--
-- getTextsize :: 'Ref' 'Input' -> 'IO' 'FontSize'
--
-- getValue :: 'Ref' 'Input' -> 'IO' 'String'
--
-- getWrap :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- handle :: 'Ref' 'Input' -> 'Event' -> 'IO' 'Int'
--
-- index :: 'Ref' 'Input' -> 'Int' -> 'IO' 'Char'
--
-- insert :: 'Ref' 'Input' -> 'String' -> 'IO' ('Either' 'NoChange' ())
--
-- insertWithLength :: 'Ref' 'Input' -> 'String' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- replace :: 'Ref' 'Input' -> 'Int' -> 'Int' -> 'String' -> 'IO' ('Either' 'NoChange' ())
--
-- setCursorColor :: 'Ref' 'Input' -> 'Color' -> 'IO' ()
--
-- setInputType :: 'Ref' 'Input' -> 'Int' -> 'IO' ()
--
-- setMark :: 'Ref' 'Input' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- setMaximumSize :: 'Ref' 'Input' -> 'Int' -> 'IO' ()
--
-- setPosition :: 'Ref' 'Input' -> 'Int' -> 'Maybe' 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- setReadonly :: 'Ref' 'Input' -> 'Int' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'Input' -> 'Int' -> 'IO' ()
--
-- setSize :: 'Ref' 'Input' -> 'Size' -> 'IO' ()
--
-- setTabNav :: 'Ref' 'Input' -> 'IO' 'Int'
--
-- setTextcolor :: 'Ref' 'Input' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'Input' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'Input' -> 'FontSize' -> 'IO' ()
--
-- setValue :: 'Ref' 'Input' -> 'String' -> 'Maybe' 'Int' -> 'IO' 'Int'
--
-- setWrap :: 'Ref' 'Input' -> 'Int' -> 'IO' ()
--
-- staticValue :: 'Ref' 'Input' -> 'String' -> 'Maybe' 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- undo :: 'Ref' 'Input' -> 'IO' ('Either' 'NoChange' ())
--
-- @


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Input"
-- @