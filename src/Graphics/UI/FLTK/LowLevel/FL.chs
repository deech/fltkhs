{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.FL where
#include "Fl_C.h"
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Foreign.Ptr
import Foreign.C.Types
import Foreign
import Foreign.C.String
import C2HS hiding (cFromEnum)
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

type LabelDrawFPrim = (Ptr (Ptr ()) ->
     		       CInt ->
		       CInt ->
		       CInt ->
		       CInt ->
		       FlAlign -> -- Align
		       IO ())
foreign import ccall "wrapper"
        wrapLabelDrawFPrim :: LabelDrawFPrim ->
                              IO (FunPtr LabelDrawFPrim)
type LabelDrawF=  (LabelPtr ->
     		   CInt ->
		   CInt ->
		   CInt ->
		   CInt ->
		   Align ->
		   IO ())

type LabelMeasureFPrim = (Ptr(Ptr ()) ->
                          Ptr CInt ->
                          Ptr CInt ->
                          IO ())
foreign import ccall "wrapper"
        wrapLabelMeasureFPrim :: LabelMeasureFPrim ->
                                 IO (FunPtr LabelMeasureFPrim)
type LabelMeasureF = (LabelPtr ->
                          Ptr CInt ->
                          Ptr CInt ->
                          IO ())

type BoxDrawFPrim = (CInt ->
                     CInt ->
                     CInt ->
                     CInt ->
                     FlColor ->
                     IO ())
foreign import ccall "wrapper"
        wrapBoxDrawFPrim :: BoxDrawFPrim ->
                            IO (FunPtr BoxDrawFPrim)

type AwakeHandlerPrim = (Ptr () ->
                         IO())
foreign import ccall "wrapper"
        wrapAwakeHandlerPrim :: AwakeHandlerPrim ->
                                IO (FunPtr AwakeHandlerPrim)

type TimeoutHandlerPrim = (Ptr () ->
                           IO())
foreign import ccall "wrapper"
        wrapTimeoutHandlerPrim :: TimeoutHandlerPrim ->
                                  IO (FunPtr TimeoutHandlerPrim)

type IdleHandlerPrim = (Ptr () ->
                        IO())
foreign import ccall "wrapper"
        wrapIdleHandlerPrim :: IdleHandlerPrim ->
                               IO (FunPtr IdleHandlerPrim)

type OldIdleHandlerPrim = (IO ())
foreign import ccall "wrapper"
        wrapOldIdleHandlerPrim :: OldIdleHandlerPrim ->
                                  IO (FunPtr OldIdleHandlerPrim)

type FDHandlerPrim = (Socket ->
                      Ptr () ->
                      IO ())
foreign import ccall "wrapper"
        wrapFDHandlerPrim :: FDHandlerPrim ->
                             IO (FunPtr FDHandlerPrim)

type EventHandlerPrim = (CInt ->
                         IO CInt)
foreign import ccall "wrapper"
        wrapEventHandlerPrim :: EventHandlerPrim ->
                                IO (FunPtr EventHandlerPrim)
type EventHandler= (Event ->
                    IO ())

type AtCloseHandlerPrim = (Ptr () ->
                           Ptr () ->
                           IO ())
foreign import ccall "wrapper"
        wrapAtCloseHandlerPrim :: AtCloseHandlerPrim ->
                                  IO (FunPtr AtCloseHandlerPrim)
type AtCloseHandler= (WindowPtr ->
                      Ptr () -> 
                      IO ())

type EventDispatchPrim = (CInt ->
                          Ptr () ->
                          IO CInt)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim ->
                                 IO (FunPtr EventDispatchPrim)
type EventDispatch = (Event ->
                      WindowPtr ->
                      IO CInt)

{# fun unsafe Fl_run as flRun
  {} -> `()' #}
{# fun unsafe Fl_wait_with_args as flWaitWithArgs
  {`Double'} -> `Double' #}
{# fun unsafe Fl_check as flCheck
  {} -> `Int' #}
{# fun unsafe Fl_ready as flReady
  {} -> `Int' #}
{# fun unsafe Fl_option as flOption
  {cFromEnum `Option'} -> `Int' #}
{# fun unsafe Fl_add_awake_handler_ as flAddAwakeHandler_
  {id `FunPtr AwakeHandlerPrim', id `(Ptr ())'}
                                           -> `Int' #}
{# fun unsafe Fl_get_awake_handler_ as flGetAwakeHandler_
  {id `FunPtr AwakeHandlerPrim', id `(Ptr ())'} -> `Int' #}
{# fun pure unsafe Fl_version as flVersion
  {} -> `Double' #}
{# fun unsafe Fl_help as flHelp
  {} -> `String' #}
{# fun unsafe Fl_display as flDisplay
  {`String'} -> `()' #}
{# fun unsafe Fl_visual as flVisual
  {cFromEnum `Mode'} -> `Int' #}
{# fun unsafe Fl_gl_visual as flGlVisual
  {cFromEnum `Mode'} -> `Int' #}
{# fun unsafe Fl_gl_visual_with_alist as flGlVisualWithAlist
  {cFromEnum `Mode', id `Ptr CInt'} -> `Int' #}
{# fun unsafe Fl_own_colormap as flOwnColormap
  {} -> `()' #}
{# fun unsafe Fl_get_system_colors as flGetSystemColors
  {} -> `()' #}
{# fun unsafe Fl_foreground as flForeground_
  {id `CUChar' ,id `CUChar' , id `CUChar'} -> `()' #}
{# fun unsafe Fl_background as flBackground_
  {id `CUChar' , id `CUChar' , id `CUChar'} -> `()' #}
{# fun unsafe Fl_background2 as flBackground2_
  {id `CUChar' , id `CUChar' , id `CUChar'} -> `()' #}
{# fun pure unsafe Fl_scheme as flScheme
  {} -> `String' #}
{# fun unsafe      Fl_set_scheme as flSetScheme
  {`String'} -> `()' #}

flBackground :: RGB -> IO ()
flBackground (r,g,b) = flBackground_ r g b
flBackground2 :: RGB -> IO ()
flBackground2 (r,g,b) = flBackground2_ r g b
flForeground :: RGB -> IO ()
flForeground (r,g,b) = flForeground_ r g b
flAddAwakeHandler :: AwakeHandlerPrim -> Ptr () -> IO Int
flAddAwakeHandler handler p = do
  funPtr <- wrapAwakeHandlerPrim handler
  flAddAwakeHandler_ funPtr p
flGetAwakeHandler :: AwakeHandlerPrim -> Ptr () -> IO Int
flGetAwakeHandler handler p = do
  funPtr <- wrapAwakeHandlerPrim handler
  flGetAwakeHandler_ funPtr p

{# fun unsafe Fl_wait as wait {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_set_wait as setWait { `Double' } -> `Double' #}
 {- double -> double -}
{# fun unsafe Fl_readqueue as readqueue {  } -> `Ptr ()' id #}
 {- fl_Widget -}
{# fun unsafe Fl_add_timeout as addTimeout { `Double',id `FunPtr TimeoutHandlerPrim' } -> `()' #}
 {- double -> fl_Timeout_Handler -> void -}
{# fun unsafe Fl_repeat_timeout as repeatTimeout { `Double',id `FunPtr TimeoutHandlerPrim' } -> `()' #}
 {- double -> fl_Timeout_Handler -> void -}
{# fun unsafe Fl_repeat_timeout_with_userdata as repeatTimeoutWithUserdata { `Double',id `FunPtr TimeoutHandlerPrim',id `Ptr ()' } -> `()' #}
 {- double -> fl_Timeout_Handler -> void* -> void -}
{# fun unsafe Fl_has_timeout as hasTimeout { id `FunPtr TimeoutHandlerPrim' } -> `Int' #}
 {- fl_Timeout_Handler -> int -}
{# fun unsafe Fl_has_timeout_with_userdata as hasTimeoutWithUserdata { id `FunPtr TimeoutHandlerPrim',id `Ptr ()' } -> `Int' #}
 {- fl_Timeout_Handler -> void* -> int -}
{# fun unsafe Fl_remove_timeout as removeTimeout { id `FunPtr TimeoutHandlerPrim' } -> `()' #}
 {- fl_Timeout_Handler -> void -}
{# fun unsafe Fl_remove_timeout_with_userdata as removeTimeoutWithUserdata { id `FunPtr TimeoutHandlerPrim',id `Ptr ()' } -> `()' #}
 {- fl_Timeout_Handler -> void* -> void -}
{# fun unsafe Fl_add_check as addCheck { id `FunPtr TimeoutHandlerPrim' } -> `()' #}
 {- fl_Timeout_Handler -> void -}
{# fun unsafe Fl_add_check_with_userdata as addCheckWithUserdata { id `FunPtr TimeoutHandlerPrim',id `Ptr ()' } -> `()' #}
 {- fl_Timeout_Handler -> void* -> void -}
{# fun unsafe Fl_has_check as hasCheck { id `FunPtr TimeoutHandlerPrim' } -> `Int' #}
 {- fl_Timeout_Handler -> int -}
{# fun unsafe Fl_has_check_with_userdata as hasCheckWithUserdata { id `FunPtr TimeoutHandlerPrim',id `Ptr ()' } -> `Int' #}
 {- fl_Timeout_Handler -> void* -> int -}
{# fun unsafe Fl_remove_check as removeCheck { id `FunPtr TimeoutHandlerPrim' } -> `()' #}
 {- fl_Timeout_Handler -> void -}
{# fun unsafe Fl_remove_check_with_userdata as removeCheckWithUserdata { id `FunPtr TimeoutHandlerPrim',id `Ptr ()' } -> `()' #}
 {- fl_Timeout_Handler -> void* -> void -}
{# fun unsafe Fl_add_fd_with_when as addFdWithWhen { `Int',`Int',id `FunPtr FDHandlerPrim' } -> `()' #}
 {- int -> int -> fl_FD_Handler -> void -}
{# fun unsafe Fl_add_fd_with_when_userdata as addFdWithWhenUserdata { `Int',`Int',id `FunPtr FDHandlerPrim',id `Ptr ()' } -> `()' #}
 {- int -> int -> fl_FD_Handler -> void* -> void -}
{# fun unsafe Fl_add_fd as addFd { `Int',id `FunPtr FDHandlerPrim' } -> `()' #}
 {- int -> fl_FD_Handler -> void -}
{# fun unsafe Fl_add_fd_with_userdata as addFdWithUserdata { `Int',id `FunPtr FDHandlerPrim',id `Ptr ()' } -> `()' #}
 {- int -> fl_FD_Handler -> void* -> void -}
{# fun unsafe Fl_remove_fd_with_when as removeFdWithWhen { `Int',`Int' } -> `()' #}
 {- int -> int -> void -}
{# fun unsafe Fl_remove_fd as removeFd { `Int' } -> `()' #}
 {- int -> void -}
{# fun unsafe Fl_add_idle as addIdle { id `FunPtr IdleHandlerPrim' } -> `()' #}
 {- fl_Idle_Handler -> void -}
{# fun unsafe Fl_add_idle_with_userdata as addIdleWithUserdata { id `FunPtr IdleHandlerPrim',id `Ptr ()' } -> `()' #}
 {- fl_Idle_Handler -> void* -> void -}
{# fun unsafe Fl_has_idle as hasIdle { id `FunPtr IdleHandlerPrim' } -> `Int' #}
 {- fl_Idle_Handler -> int -}
{# fun unsafe Fl_has_idle_with_userdata as hasIdleWithUserdata { id `FunPtr IdleHandlerPrim',id `Ptr ()' } -> `Int' #}
 {- fl_Idle_Handler -> void* -> int -}
{# fun unsafe Fl_remove_idle as removeIdle { id `FunPtr IdleHandlerPrim' } -> `()' #}
 {- fl_Idle_Handler -> void -}
{# fun unsafe Fl_remove_idle_with_userdata as removeIdleWithUserdata { id `FunPtr IdleHandlerPrim',id `Ptr ()' } -> `()' #}
 {- fl_Idle_Handler -> void* -> void -}
{# fun unsafe Fl_damage as damage {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_redraw as redraw {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_flush as flush {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_first_window as firstWindow {  } -> `Ptr ()' id #}
 {- fl_Window -}
{# fun unsafe Fl_set_first_window as setFirstWindow { id `Ptr ()' } -> `()' #}
 {- fl_Window -> void -}
{# fun unsafe Fl_next_window as nextWindow { id `Ptr ()' } -> `Ptr ()' id #}
 {- fl_Window -> fl_Window -}
{# fun unsafe Fl_modal as modal {  } -> `Ptr ()' id #}
 {- fl_Window -}
{# fun unsafe Fl_grab as grab {  } -> `Ptr ()' id #}
 {- fl_Window -}
{# fun unsafe Fl_set_grab as setGrab { id `Ptr ()' } -> `()' #}
 {- fl_Window -> void -}
{# fun unsafe Fl_event as event {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_x as eventX {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_y as eventY {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_x_root as eventXRoot {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_y_root as eventYRoot {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_dx as eventDx {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_dy as eventDy {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_get_mouse as getMouse { id `Ptr CInt',id `Ptr CInt' } -> `()' #}
 {- int* -> int* -> void -}
{# fun unsafe Fl_event_clicks as eventClicks {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_set_clicks as eventSetClicks { `Int' } -> `()' #}
 {- int -> void -}
{# fun unsafe Fl_event_is_click as eventIsClick {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_set_is_click as eventSetIsClick { `Int' } -> `()' #}
 {- int -> void -}
{# fun unsafe Fl_event_button as eventButton {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_state as eventState {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_set_state as eventSetState { `Int' } -> `Int' #}
 {- int -> int -}
{# fun unsafe Fl_event_key as eventKey {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_original_key as eventOriginalKey {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_set_event_key as setEventKey { `Int' } -> `Int' #}
 {- int -> int -}
{# fun unsafe Fl_get_key as getKey { `Int' } -> `Int' #}
 {- int -> int -}
{# fun unsafe Fl_event_text as eventText {  } -> `String' #}
 {- const char* -}
{# fun unsafe Fl_event_length as eventLength {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_compose as compose { id `Ptr CInt' } -> `Int' #}
 {- int* -> int -}
{# fun unsafe Fl_compose_reset as composeReset {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_event_inside_region as eventInsideRegion { `Int',`Int',`Int',`Int' } -> `Int' #}
 {- int -> int -> int -> int -> int -}
{# fun unsafe Fl_event_inside_widget as eventInsideWidget { id `Ptr ()' } -> `Int' #}
 {- fl_Widget -> int -}
{# fun unsafe Fl_test_shortcut as testShortcut { id `FlShortcut' } -> `Int' #}
 {- Fl_Shortcut -> int -}
{# fun unsafe Fl_handle as handle { `Int',id `Ptr ()' } -> `Int' #}
 {- int -> fl_Window -> int -}
{# fun unsafe Fl_handle_ as handle_ { `Int',id `Ptr ()' } -> `Int' #}
 {- int -> fl_Window -> int -}
{# fun unsafe Fl_belowmouse as belowmouse {  } -> `Ptr ()' id #}
 {- fl_Widget -}
{# fun unsafe Fl_set_belowmouse as setBelowmouse { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_pushed as pushed {  } -> `Ptr ()' id #}
 {- fl_Widget -}
{# fun unsafe Fl_set_pushed as setPushed {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_focus as focus {  } -> `Ptr ()' id #}
 {- fl_Widget -}
{# fun unsafe Fl_set_focus as setFocus { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_add_handler as addHandler { id `FunPtr EventHandlerPrim' } -> `()' #}
 {- fl_Event_Handler -> void -}
{# fun unsafe Fl_remove_handler as removeHandler { id `FunPtr EventHandlerPrim' } -> `()' #}
 {- fl_Event_Handler -> void -}
{# fun unsafe Fl_event_set_dispatch as eventSetDispatch { id `Ptr (FunPtr EventDispatchPrim)' } -> `()' #}
 {- fl_Event_Dispatch* -> void -}
{# fun unsafe Fl_event_dispatch as eventDispatch {  } -> `FunPtr EventDispatchPrim' id #}
 {- fl_Event_Dispatch -}
{# fun unsafe Fl_copy as copy { `String',`Int' } -> `()' #}
 {- const char* -> int -> void -}
{# fun unsafe Fl_copy_with_destination as copyWithDestination { `String',`Int',`Int' } -> `()' #}
 {- const char* -> int -> int -> void -}
{# fun unsafe Fl_paste_with_source as pasteWithSource { id `Ptr ()',`Int' } -> `()' #}
 {- fl_Widget -> int -> void -}
{# fun unsafe Fl_dnd as dnd {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_selection_owner as selectionOwner {  } -> `Ptr ()' id #}
 {- fl_Widget -}
{# fun unsafe Fl_set_selection_owner as setSelectionOwner { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_selection as selection { id `Ptr ()',`String',`Int' } -> `()' #}
 {- fl_Widget -> const char* -> int -> void -}
{# fun unsafe Fl_paste as paste { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_x as x {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_y as y {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_w as w {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_h as h {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_screen_count as screenCount {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_screen_xywh as screenXywh { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt' } -> `()' #}
 {- int* -> int* -> int* -> int* -> void -}
{# fun unsafe Fl_screen_xywh_with_mx_my as screenXywhWithMxMy { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',`Int',`Int' } -> `()' #}
 {- int* -> int* -> int* -> int* -> int -> int -> void -}
{# fun unsafe Fl_screen_xywh_with_n as screenXywhWithN { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',`Int' } -> `()' #}
 {- int* -> int* -> int* -> int* -> int -> void -}
{# fun unsafe Fl_screen_xywh_with_n_mx_my as screenXywhWithNMxMy { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',`Int',`Int',`Int',`Int' } -> `()' #}
 {- int* -> int* -> int* -> int* -> int -> int -> int -> int -> void -}
{# fun unsafe Fl_screen_dpi as screenDpi { id `Ptr CFloat',id `Ptr CFloat' } -> `()' #}
 {- float* -> float* -> void -}
{# fun unsafe Fl_screen_dpi_with_n as screenDpiWithN { id `Ptr CFloat',id `Ptr CFloat',`Int' } -> `()' #}
 {- float* -> float* -> int -> void -}
{# fun unsafe Fl_screen_work_area_with_mx_my as screenWorkAreaWithMxMy { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',`Int',`Int' } -> `()' #}
 {- int* -> int* -> int* -> int* -> int -> int -> void -}
{# fun unsafe Fl_screen_work_area_with_n as screenWorkAreaWithN { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',`Int' } -> `()' #}
 {- int* -> int* -> int* -> int* -> int -> void -}
{# fun unsafe Fl_screen_work_area as screenWorkArea { id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt' } -> `()' #}
 {- int* -> int* -> int* -> int* -> void -}
{# fun unsafe Fl_set_color_rgb as setColorRgb { cFromColor `Color',`Word8',`Word8',`Word8' } -> `()' #}
 {- Fl_Color -> uchar -> uchar -> uchar -> void -}
{# fun unsafe Fl_set_color as setColor { cFromColor `Color',`Int' } -> `()' #}
 {- Fl_Color -> unsigned -> void -}
{# fun unsafe Fl_get_color as getColor { cFromColor `Color' } -> `Int' #}
 {- Fl_Color -> unsigned -}
{# fun unsafe Fl_get_color_rgb as getColorRgb { cFromColor `Color',`Word8',`Word8',`Word8' } -> `()' #}
 {- Fl_Color -> uchar -> uchar -> uchar -> void -}
{# fun unsafe Fl_free_color as freeColor { cFromColor `Color' } -> `()' #}
 {- Fl_Color -> void -}
{# fun unsafe Fl_free_color_with_overlay as freeColorWithOverlay { cFromColor `Color',`Int' } -> `()' #}
 {- Fl_Color -> int -> void -}
{# fun unsafe Fl_get_font as getFont { cFromFont `Font' } -> `String' #}
 {- Fl_Font -> const char* -}
{# fun unsafe Fl_get_font_name as getFontName { cFromFont `Font' } -> `String' #}
 {- Fl_Font -> const char* -}
{# fun unsafe Fl_get_font_name_with_attributes as getFontNameWithAttributes { cFromFont `Font',id `Ptr CInt' } -> `String' #}
 {- Fl_Font -> int* -> const char* -}
{# fun unsafe Fl_get_font_sizes as getFontSizes { cFromFont `Font',id `Ptr CInt' } -> `Int' #}
 {- Fl_Font -> int* -> int -}
{# fun unsafe Fl_set_font_by_string as setFontByString { cFromFont `Font',`String' } -> `()' #}
 {- Fl_Font -> const char* -> void -}
{# fun unsafe Fl_set_font_by_font as setFontByFont { cFromFont `Font',cFromFont `Font' } -> `()' #}
 {- Fl_Font -> Fl_Font -> void -}
{# fun unsafe Fl_set_fonts as setFonts {  } -> `Font' cToFont #}
 {- Fl_Font -}
{# fun unsafe Fl_set_fonts_with_string as setFontsWithString { `String' } -> `Font' cToFont #}
 {- const char* -> Fl_Font -}
{# fun unsafe Fl_set_labeltype as setLabeltype { cFromEnum `Labeltype',id `FunPtr LabelDrawFPrim',id `FunPtr LabelMeasureFPrim' } -> `()' #}
 {- Fl_Labeltype -> fl_Label_Draw_F* -> fl_Label_Measure_F* -> void -}
{# fun unsafe Fl_get_boxtype as getBoxtype { cFromEnum `Boxtype' } -> `FunPtr BoxDrawFPrim' id #}
 {- Fl_Boxtype -> fl_Box_Draw_F* -}
{# fun unsafe Fl_set_boxtype as setBoxtype { cFromEnum `Boxtype',id `FunPtr BoxDrawFPrim',`Word8',`Word8',`Word8',`Word8' } -> `()' #}
 {- Fl_Boxtype -> fl_Box_Draw_F* -> uchar -> uchar -> uchar -> uchar -> void -}
{# fun unsafe Fl_set_boxtype_by_boxtype as setBoxtypeByBoxtype { cFromEnum `Boxtype',cFromEnum `Boxtype' } -> `()' #}
 {- Fl_Boxtype -> Fl_Boxtype -> void -}
{# fun unsafe Fl_box_dx as boxDx { cFromEnum `Boxtype' } -> `Int' #}
 {- Fl_Boxtype -> int -}
{# fun unsafe Fl_box_dy as boxDy { cFromEnum `Boxtype' } -> `Int' #}
 {- Fl_Boxtype -> int -}
{# fun unsafe Fl_box_dw as boxDw { cFromEnum `Boxtype' } -> `Int' #}
 {- Fl_Boxtype -> int -}
{# fun unsafe Fl_box_dh as boxDh { cFromEnum `Boxtype' } -> `Int' #}
 {- Fl_Boxtype -> int -}
{# fun unsafe Fl_draw_box_active as drawBoxActive {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_default_atclose as defaultAtclose { id `Ptr ()',id `Ptr ()' } -> `()' #}
 {- fl_Window -> void* -> void -}
{# fun unsafe Fl_set_atclose as setAtclose { id `Ptr (FunPtr AtCloseHandlerPrim)' } -> `()' #}
 {- fl_Atclose_Handler* -> void -}
{# fun unsafe Fl_event_shift as eventShift {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_ctrl as eventCtrl {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_command as eventCommand {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_alt as eventAlt {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_buttons as eventButtons {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_button1 as eventButton1 {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_button2 as eventButton2 {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_event_button3 as eventButton3 {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_set_idle as setIdle { id `FunPtr OldIdleHandlerPrim' } -> `()' #}
 {- fl_Old_Idle_Handler -> void -}
{# fun unsafe Fl_release as release {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_set_visible_focus as setVisibleFocus { `Int' } -> `()' #}
 {- int -> void -}
{# fun unsafe Fl_visible_focus as visibleFocus {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_dnd_set_text_ops as dndSetTextOps { `Int' } -> `()' #}
 {- int -> void -}
{# fun unsafe Fl_dnd_text_ops as dndTextOps {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_lock as lock {  } -> `Int' #}
 {- int -}
{# fun unsafe Fl_unlock as unlock {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_awake as awake {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_awake_with_message as awakeWithMessage { id `Ptr ()' } -> `()' #}
 {- void* -> void -}
{# fun unsafe Fl_awake_with_cb as awakeWithCb { id `FunPtr AwakeHandlerPrim' } -> `Int' #}
 {- fl_Awake_Handler -> int -}
{# fun unsafe Fl_awake_with_cb_message as awakeWithCbMessage { id `FunPtr AwakeHandlerPrim',id `Ptr ()' } -> `Int' #}
 {- fl_Awake_Handler -> void* -> int -}
{# fun unsafe Fl_thread_message as threadMessage {  } -> `Ptr ()' id #}
 {- void* -}
{# fun unsafe Fl_delete_widget as deleteWidget { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_do_widget_deletion as doWidgetDeletion {  } -> `()' #}
 {- void -}
{# fun unsafe Fl_watch_widget_pointer as watchWidgetPointer { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_release_widget_pointer as releaseWidgetPointer { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
{# fun unsafe Fl_Fl_clear_widget_pointer as clearWidgetPointer { id `Ptr ()' } -> `()' #}
 {- fl_Widget -> void -}
