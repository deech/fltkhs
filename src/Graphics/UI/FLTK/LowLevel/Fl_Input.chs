{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Input
    (
     FlInputType,
     -- * Constructor
     inputNew
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
instance Op (Destroy ()) Input ( IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    inputDestroy' winPtr
    return nullPtr

{#fun Fl_Input_handle as inputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
{#fun Fl_Secret_Input_handle as secretInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Input ( Event -> IO Int) where
  runOp _ input event =
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
instance Op (SetValue ()) Input ( String -> Maybe Int -> IO (Int)) where
  runOp _ input text l' =
    case l' of
     Nothing -> withRef input $ \inputPtr -> setValue' inputPtr text
     Just l -> withRef input $ \inputPtr -> setValueWithLength' inputPtr text l
{# fun unsafe Fl_Input_static_value as staticValue' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Input_static_value_with_length as staticValueWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
instance Op (StaticValue ()) Input ( String -> Maybe Int ->  IO (Int)) where
  runOp _ input text l'=
    case l' of
     Nothing -> withRef input $ \inputPtr -> staticValue' inputPtr text
     Just l -> withRef input $ \inputPtr -> staticValueWithLength' inputPtr text l
{# fun unsafe Fl_Input_value as value' { id `Ptr ()' } -> `String' #}
instance Op (GetValue ()) Input (  IO (String)) where
  runOp _ input = withRef input $ \inputPtr -> value' inputPtr
{# fun unsafe Fl_Input_index as index' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (Index ()) Input ( Int ->  IO (Char)) where
  runOp _ input i = withRef input $ \inputPtr -> index' inputPtr i >>= return . toEnum
{# fun unsafe Fl_Input_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance Op (SetSize ()) Input ( Size ->  IO ()) where
  runOp _ input (Size (Width w') (Height h')) = withRef input $ \inputPtr -> setSize' inputPtr w' h'
{# fun unsafe Fl_Input_maximum_size as maximumSize' { id `Ptr ()' } -> `Int' #}
instance Op (GetMaximumSize ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> maximumSize' inputPtr
{# fun unsafe Fl_Input_size as size' { id `Ptr ()' } -> `Int' #}
instance Op (GetSize ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> size' inputPtr
{# fun unsafe Fl_Input_set_maximum_size as setMaximumSize' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetMaximumSize ()) Input ( Int ->  IO ()) where
  runOp _ input m = withRef input $ \inputPtr -> setMaximumSize' inputPtr m
{# fun unsafe Fl_Input_position as position' { id `Ptr ()' } -> `Int' #}
instance Op (GetPosition ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> position' inputPtr
{# fun unsafe Fl_Input_mark as mark' { id `Ptr ()' } -> `Int' #}
instance Op (GetMark ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> mark' inputPtr
{# fun unsafe Fl_Input_set_position_with_cursor_mark as setPositionWithCursorMark' { id `Ptr ()',`Int',`Int' } -> `Int' #}
{# fun unsafe Fl_Input_set_position_n_n as setPositionNN' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (SetPosition ()) Input ( Int -> Maybe Int -> IO (Int)) where
  runOp _ input point mark =
   case mark of
      Just m ->  withRef input $ \inputPtr -> setPositionWithCursorMark' inputPtr point m
      Nothing -> withRef input $ \inputPtr -> setPositionNN' inputPtr point
{# fun unsafe Fl_Input_set_mark as setMark' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (SetMark ()) Input ( Int ->  IO (Int)) where
  runOp _ input m = withRef input $ \inputPtr -> setMark' inputPtr m
{# fun unsafe Fl_Input_replace as replace' { id `Ptr ()',`Int',`Int',`String' } -> `Int' #}
instance Op (Replace ()) Input ( Int -> Int -> String ->  IO (Int)) where
  runOp _ input b e text = withRef input $ \inputPtr -> replace' inputPtr b e  text
{# fun unsafe Fl_Input_cut as cut' { id `Ptr ()' } -> `Int' #}
instance Op (Cut ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> cut' inputPtr
{# fun unsafe Fl_Input_cut_bytes as cutBytes' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (CutFromCursor ()) Input ( Int ->  IO (Int)) where
  runOp _ input n = withRef input $ \inputPtr -> cutBytes' inputPtr n
{# fun unsafe Fl_Input_cut_range as cutRange' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance Op (CutRange ()) Input ( Int -> Int ->  IO (Int)) where
  runOp _ input a b = withRef input $ \inputPtr -> cutRange' inputPtr a b
{# fun unsafe Fl_Input_insert as insert' { id `Ptr ()',`String' } -> `Int' #}
instance Op (Insert ()) Input ( String ->  IO (Int)) where
  runOp _ input t = withRef input $ \inputPtr -> insert' inputPtr t
{# fun unsafe Fl_Input_insert_with_length as insertWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
instance Op (InsertWithLength ()) Input ( String -> Int ->  IO (Int)) where
  runOp _ input t l = withRef input $ \inputPtr -> insertWithLength' inputPtr t l
{# fun unsafe Fl_Input_copy as copy' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (Copy ()) Input ( Clipboard ->  IO (Int)) where
  runOp _ input clipboard =
    case clipboard of
     InternalClipboard -> withRef input $ \inputPtr -> copy' inputPtr 1
     SharedClipboard -> withRef input $ \inputPtr -> copy' inputPtr 0
{# fun unsafe Fl_Input_undo as undo' { id `Ptr ()' } -> `Int' #}
instance Op (Undo ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> undo' inputPtr
{# fun unsafe Fl_Input_copy_cuts as copyCuts' { id `Ptr ()' } -> `Int' #}
instance Op (CopyCuts ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> copyCuts' inputPtr
{# fun unsafe Fl_Input_shortcut as shortcut' { id `Ptr ()' } -> `Int' #}
instance Op (GetShortcut ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> shortcut' inputPtr
{# fun unsafe Fl_Input_set_shortcut as setShortcut' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetShortcut ()) Input ( Int ->  IO ()) where
  runOp _ input s = withRef input $ \inputPtr -> setShortcut' inputPtr s
{# fun unsafe Fl_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance Op (GetTextfont ()) Input (  IO (Font)) where
  runOp _ input = withRef input $ \inputPtr -> textfont' inputPtr
{# fun unsafe Fl_Input_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance Op (SetTextfont ()) Input ( Font ->  IO ()) where
  runOp _ input s = withRef input $ \inputPtr -> setTextfont' inputPtr s
{# fun unsafe Fl_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance Op (GetTextsize ()) Input (  IO (FontSize)) where
  runOp _ input = withRef input $ \inputPtr -> textsize' inputPtr >>= return . FontSize
{# fun unsafe Fl_Input_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance Op (SetTextsize ()) Input ( FontSize ->  IO ()) where
  runOp _ input (FontSize s) = withRef input $ \inputPtr -> setTextsize' inputPtr s
{# fun unsafe Fl_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetTextcolor ()) Input (  IO (Color)) where
  runOp _ input = withRef input $ \inputPtr -> textcolor' inputPtr
{# fun unsafe Fl_Input_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance Op (SetTextcolor ()) Input ( Color ->  IO ()) where
  runOp _ input n = withRef input $ \inputPtr -> setTextcolor' inputPtr n
{# fun unsafe Fl_Input_cursor_color as cursorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetCursorColor ()) Input (  IO (Color)) where
  runOp _ input = withRef input $ \inputPtr -> cursorColor' inputPtr
{# fun unsafe Fl_Input_set_cursor_color as setCursorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance Op (SetCursorColor ()) Input ( Color ->  IO ()) where
  runOp _ input n = withRef input $ \inputPtr -> setCursorColor' inputPtr n
{# fun unsafe Fl_Input_input_type as inputType' { id `Ptr ()' } -> `Int' #}
instance Op (GetInputType ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> inputType' inputPtr
{# fun unsafe Fl_Input_set_input_type as setInputType' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetInputType ()) Input ( Int ->  IO ()) where
  runOp _ input t = withRef input $ \inputPtr -> setInputType' inputPtr t
{# fun unsafe Fl_Input_readonly as readonly' { id `Ptr ()' } -> `Int' #}
instance Op (GetReadonly ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> readonly' inputPtr
{# fun unsafe Fl_Input_set_readonly as setReadonly' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetReadonly ()) Input ( Int ->  IO ()) where
  runOp _ input b = withRef input $ \inputPtr -> setReadonly' inputPtr b
{# fun unsafe Fl_Input_wrap as wrap' { id `Ptr ()' } -> `Int' #}
instance Op (GetWrap ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> wrap' inputPtr
{# fun unsafe Fl_Input_set_wrap as setWrap' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetWrap ()) Input ( Int ->  IO ()) where
  runOp _ input b = withRef input $ \inputPtr -> setWrap' inputPtr b
{# fun unsafe Fl_Input_tab_nav as tabNav' { id `Ptr ()',`Int' } -> `()' #}
instance Op (GetTabNav ()) Input ( Int ->  IO ()) where
  runOp _ input val = withRef input $ \inputPtr -> tabNav' inputPtr val
{# fun unsafe Fl_Input_set_tab_nav as setTabNav' { id `Ptr ()' } -> `Int' #}
instance Op (SetTabNav ()) Input (  IO (Int)) where
  runOp _ input = withRef input $ \inputPtr -> setTabNav' inputPtr
