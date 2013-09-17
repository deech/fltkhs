{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.FL where
#include "Fl_C.h"
import C2HS
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
#c
 enum Option {
   ArrowFocus = OPTION_ARROW_FOCUS,
   VisibleFocus = OPTION_VISIBLE_FOCUS,
   DndText = OPTION_DND_TEXT,
   ShowTooltips = OPTION_SHOW_TOOLTIPS,
   Last = OPTION_LAST
 };
#endc
{#enum Option {} deriving (Show) #}
type LabelDrawF = FunPtr (LabelPtr -> CInt -> CInt -> CInt -> CInt -> Align -> IO ())
type LabelMeasureF = FunPtr (LabelPtr -> Ptr CInt -> Ptr CInt -> IO ())
type BoxDrawF = FunPtr (CInt -> CInt -> CInt -> CInt -> Color -> IO ())
type TimeoutHandler = FunPtr (Ptr () -> IO())
type IdleHandler = FunPtr (Ptr () -> IO())

{# fun unsafe Fl_run as flRun {} -> `()' #}    
