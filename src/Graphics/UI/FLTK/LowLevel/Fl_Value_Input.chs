{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Value_Input
    (
     -- * Constructor
     valueInputNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Value_Input_New as valueInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Input_New_WithLabel as valueInputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueInputNew :: Rectangle -> Maybe String -> IO (Ref ValueInput)
valueInputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueInputNew' x_pos y_pos width height >>=
                             toRef
        Just l -> valueInputNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Value_Input_Destroy as valueInputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) ValueInput ( IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    valueInputDestroy' winPtr
    return nullPtr
{#fun Fl_Value_Input_handle as valueInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) ValueInput ( Event -> IO Int) where
  runOp _ valueInput event = withRef valueInput (\p -> valueInputHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Value_Input_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance Op (GetSoft ()) ValueInput (  IO (Bool)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun unsafe Fl_Value_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (Resize ()) ValueInput ( Rectangle ->  IO ()) where
  runOp _ value_input rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef value_input $ \value_inputPtr -> resize' value_inputPtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Value_Input_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance Op (SetSoft ()) ValueInput ( Bool->  IO ()) where
  runOp _ value_input s = withRef value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun unsafe Fl_Value_Input_shortcut as shortcut' { id `Ptr ()' } -> `Int' #}
instance Op (GetShortcut ()) ValueInput (  IO (Int)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> shortcut' value_inputPtr
{# fun unsafe Fl_Value_Input_set_shortcut as setShortcut' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetShortcut ()) ValueInput ( Int ->  IO ()) where
  runOp _ value_input v = withRef value_input $ \value_inputPtr -> setShortcut' value_inputPtr v
{# fun unsafe Fl_Value_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance Op (GetTextfont ()) ValueInput (  IO (Font)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun unsafe Fl_Value_Input_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetTextfont ()) ValueInput ( Int ->  IO ()) where
  runOp _ value_input v = withRef value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun unsafe Fl_Value_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance Op (GetTextsize ()) ValueInput (  IO (FontSize)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun unsafe Fl_Value_Input_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance Op (SetTextsize ()) ValueInput ( FontSize ->  IO ()) where
  runOp _ value_input (FontSize v) = withRef value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun unsafe Fl_Value_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetTextcolor ()) ValueInput (  IO (Color)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun unsafe Fl_Value_Input_set_textcolor as setTextcolor' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetTextcolor ()) ValueInput ( Int ->  IO ()) where
  runOp _ value_input v = withRef value_input $ \value_inputPtr -> setTextcolor' value_inputPtr v
