{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.FL where
#include "Fl_C.h"
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Foreign.Ptr
import Foreign.C.Types
import Foreign
import Foreign.C.String
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
type LabelDrawF = FunPtr (LabelPtr ->
     		          CInt ->
			  CInt ->
			  CInt ->
			  CInt ->
			  Align ->
			  IO ())
type LabelMeasureF = FunPtr (LabelPtr -> Ptr CInt -> Ptr CInt -> IO ())
type BoxDrawF = FunPtr (CInt -> CInt -> CInt -> CInt -> Color -> IO ())
type AwakeHandler = FunPtr (Ptr () -> IO())
type TimeoutHandler = FunPtr (Ptr () -> IO())
type IdleHandler = FunPtr (Ptr () -> IO())
type OldIdleHandler = FunPtr (IO ())
type FDHandler = FunPtr (Socket -> Ptr () -> IO ())
type EventHandler = FunPtr (Event -> IO ())
type AtCloseHandler = FunPtr(WindowPtr -> Ptr ())
type EventDispatch = FunPtr (Event -> WindowPtr -> CInt)
{# fun Fl_run as flRun {} -> `()' #}
{# fun unsafe Fl_wait_with_args as flWaitWithArgs {`Double'} -> `Double' #}
{# fun unsafe Fl_check as flCheck {} -> `Int' #}
{# fun unsafe Fl_ready as flReady {} -> `Int' #}
{# fun unsafe Fl_option as flOption {cFromEnum `Option'} -> `Int' #}
{# fun unsafe Fl_add_awake_handler_ as
              flAddAwakeHandler_ {id `AwakeHandler', id `(Ptr ())'} -> `Int' #}
{# fun unsafe Fl_get_awake_handler_ as
              flGetAwakeHandler_ {id `AwakeHandler', id `(Ptr ())'} -> `Int' #}
{# fun pure unsafe Fl_version as flVersion {} -> `Double' #}
{# fun unsafe Fl_help as flHelp {} -> `String' #}
{# fun unsafe Fl_display as flDisplay {`String'} -> `()' #}
{# fun unsafe Fl_visual as flVisual {cFromEnum `Mode'} -> `Int' #}
{# fun unsafe Fl_gl_visual as flGlVisual {cFromEnum `Mode'} -> `Int' #}
{# fun unsafe Fl_gl_visual_with_alist as
              flGlVisualWithAlist {cFromEnum `Mode', id `Ptr CInt'} -> `Int' #}
{# fun unsafe Fl_own_colormap as flOwnColormap {} -> `()' #}
{# fun unsafe Fl_get_system_colors as flGetSystemColors {} -> `()' #}
{# fun unsafe Fl_foreground as
              flForeground_ {id `CUChar' , id `CUChar' , id `CUChar'} -> `()' #}
flForeground :: RGB -> IO ()
flForeground (r,g,b) = flForeground_ r g b
{# fun unsafe Fl_background as
              flBackground_ {id `CUChar' , id `CUChar' , id `CUChar'} -> `()' #}
flBackground :: RGB -> IO ()
flBackground (r,g,b) = flBackground_ r g b
{# fun unsafe Fl_background2 as
              flBackground2_ {id `CUChar' , id `CUChar' , id `CUChar'} -> `()' #}
flBackground2 :: RGB -> IO ()
flBackground2 (r,g,b) = flBackground2_ r g b
{# fun pure unsafe Fl_scheme as flScheme {} -> `String' #}
{# fun unsafe Fl_set_scheme as flSetScheme {`String'} -> `()' #}
