{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Value_Output
    (
     -- * Constructor
     valueOutputNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_OutputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Value_Output_New as valueOutputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Output_New_WithLabel as valueOutputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueOutputNew :: Rectangle -> Maybe String -> IO (Ref ValueOutput)
valueOutputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueOutputNew' x_pos y_pos width height >>=
                             toRef
        Just l -> valueOutputNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Value_Output_Destroy as valueOutputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) ValueOutput ( IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    valueOutputDestroy' winPtr
    return nullPtr

{#fun Fl_Value_Output_handle as valueOutputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) ValueOutput ( Event -> IO Int) where
  runOp _ valueOutput event = withRef valueOutput (\p -> valueOutputHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Value_Output_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
instance Op (GetSoft ()) ValueOutput (  IO (Bool)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun unsafe Fl_Value_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (Resize ()) ValueOutput ( Rectangle ->  IO ()) where
  runOp _ value_input rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef value_input $ \value_inputPtr -> resize' value_inputPtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Value_Output_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance Op (SetSoft ()) ValueOutput ( Bool->  IO ()) where
  runOp _ value_input s = withRef value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun unsafe Fl_Value_Output_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance Op (GetTextfont ()) ValueOutput (  IO (Font)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun unsafe Fl_Value_Output_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetTextfont ()) ValueOutput ( Int ->  IO ()) where
  runOp _ value_input v = withRef value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun unsafe Fl_Value_Output_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance Op (GetTextsize ()) ValueOutput (  IO (FontSize)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun unsafe Fl_Value_Output_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
instance Op (SetTextsize ()) ValueOutput ( FontSize ->  IO ()) where
  runOp _ value_input (FontSize v) = withRef value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun unsafe Fl_Value_Output_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetTextcolor ()) ValueOutput (  IO (Color)) where
  runOp _ value_input = withRef value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun unsafe Fl_Value_Output_set_textcolor as setTextcolor' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetTextcolor ()) ValueOutput ( Int ->  IO ()) where
  runOp _ value_input v = withRef value_input $ \value_inputPtr -> setTextcolor' value_inputPtr v
