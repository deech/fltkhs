{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.FL where
#include "Fl_C.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool)
import Control.Concurrent.STM
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import System.IO.Unsafe (unsafePerformIO)
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
		   AlignType ->
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

type HandlerPrim = Ptr() -> IO ()

type FDHandlerPrim = (Socket ->
                      Ptr () ->
                      IO ())
foreign import ccall "wrapper"
        wrapFDHandlerPrim :: FDHandlerPrim ->
                             IO (FunPtr FDHandlerPrim)
type FDHandler = Socket -> IO ()

ptrToGlobalEventHandler :: TVar (FunPtr EventHandlerPrim)
ptrToGlobalEventHandler = unsafePerformIO $ do
                            initialHandler <- wrapEventHandlerPrim (\_ -> return (0 :: CInt))
                            newTVarIO initialHandler

type EventHandlerPrim = (CInt ->
                         IO CInt)
foreign import ccall "wrapper"
        wrapEventHandlerPrim :: EventHandlerPrim ->
                                IO (FunPtr EventHandlerPrim)
type EventHandler = (Event ->
                     IO Int)

type EventDispatchPrim = (CInt ->
                          Ptr () ->
                          IO CInt)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim ->
                                 IO (FunPtr EventDispatchPrim)
foreign import ccall "dynamic"
        unwrapEventDispatchPrim :: FunPtr EventDispatchPrim -> EventDispatchPrim

type EventDispatch = (Event ->
                      WindowPtr ->
                      IO Int)

{# fun unsafe Fl_run as flRun'
  {} -> `()' #}
flRun :: IO ()
flRun = flRun'
{# fun unsafe Fl_check as flCheck'
  {} -> `Int' #}
flCheck :: IO Int
flCheck = flCheck'
{# fun unsafe Fl_ready as flReady'
  {} -> `Int' #}
flReady :: IO Int
flReady = flReady'
{# fun unsafe Fl_option as flOption'
  {cFromEnum `Option'} -> `Int' #}
flOption :: Option -> IO Int
flOption opt = flOption' opt

toUserDataHandlerPrim :: Callback -> FunPtr HandlerPrim
toUserDataHandlerPrim cb =
    unsafePerformIO $ do
      ptr <- mkCallbackPtr cb
      return $ castFunPtr ptr

unsafeMkCallbackPtr :: Callback -> FunPtr Callback
unsafeMkCallbackPtr = unsafePerformIO . mkCallbackPtr
unsafeCastPtrToWidget :: Ptr () -> WidgetPtr
unsafeCastPtrToWidget = unsafePerformIO . castPtrToWidget
unsafeCastPtrToWindow :: Ptr () -> WindowPtr
unsafeCastPtrToWindow = unsafePerformIO . castPtrToWindow

{# fun unsafe Fl_add_awake_handler_ as flAddAwakeHandler'
  {id `FunPtr HandlerPrim', id `(Ptr ())'} -> `Int' #}
flAddAwakeHandler :: Callback -> IO Int
flAddAwakeHandler awakeHandler =
    do
      callbackPtr <-  mkCallbackPtr awakeHandler
      flAddAwakeHandler' (castFunPtr callbackPtr) nullPtr

{# fun unsafe Fl_get_awake_handler_ as flGetAwakeHandler_'
  {id `Ptr (FunPtr HandlerPrim)', id `Ptr (Ptr ())'} -> `Int' #}
flGetAwakeHandler_ :: IO Callback
flGetAwakeHandler_ =
    alloca $ \ptrToFunPtr ->
        alloca $ \ptrToUD -> do
          _ <- flGetAwakeHandler_' ptrToFunPtr ptrToUD
          funPtr <- peek ptrToFunPtr
          return $ unwrapCallbackPtr $ castFunPtr funPtr

{# fun unsafe Fl_version as flVersion
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
{# fun unsafe Fl_foreground as flForeground
  {
    fromIntegral `Int' ,
    fromIntegral `Int' ,
    fromIntegral `Int'
  } -> `()' #}
{# fun unsafe Fl_background as flBackground
  {
    fromIntegral `Int' ,
    fromIntegral `Int' ,
    fromIntegral `Int'
  } -> `()' #}
{# fun unsafe Fl_background2 as flBackground2
  {
    fromIntegral `Int' ,
    fromIntegral `Int' ,
    fromIntegral `Int'
  } -> `()' #}
{# fun pure unsafe Fl_scheme as flScheme
  {} -> `String' #}
{# fun unsafe Fl_set_scheme as flSetScheme
  {`String'} -> `()' #}
{# fun unsafe Fl_wait as wait
       {  } -> `Int' #}
{# fun unsafe Fl_set_wait as setWait
       { `Double' } -> `Double' #}
{# fun unsafe Fl_readqueue as readqueue
       {  } -> `WidgetPtr' castPtrToWidget* #}
{# fun unsafe Fl_add_timeout as addTimeout
       { `Double', toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_repeat_timeout as repeatTimeout
       { `Double',toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_has_timeout as hasTimeout
       { toUserDataHandlerPrim `Callback' } -> `Int' #}
{# fun unsafe Fl_remove_timeout as removeTimeout
       { toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_add_check as addCheck
       { toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_has_check as hasCheck
       { toUserDataHandlerPrim `Callback' } -> `Int' #}
{# fun unsafe Fl_remove_check as removeCheck
       { toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_add_fd_with_when as addFdWithWhen
       { `Int',`Int',id `FunPtr FDHandlerPrim' } -> `()' #}
{# fun unsafe Fl_add_fd as addFd
       { `Int',id `FunPtr FDHandlerPrim'} -> `()' #}
{# fun unsafe Fl_remove_fd_with_when as removeFdWithWhen
       { `Int',`Int' } -> `()' #}
{# fun unsafe Fl_remove_fd as removeFd
       { `Int' } -> `()' #}
{# fun unsafe Fl_add_idle as addIdle
       { toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_has_idle as hasIdle
       { toUserDataHandlerPrim `Callback' } -> `Int' #}
{# fun unsafe Fl_remove_idle as removeIdle
       { toUserDataHandlerPrim `Callback' } -> `()' #}
{# fun unsafe Fl_damage as damage
       {  } -> `Int' #}
{# fun unsafe Fl_redraw as redraw
       {  } -> `()' #}
{# fun unsafe Fl_flush as flush
       {  } -> `()' #}
{# fun unsafe Fl_first_window as firstWindow
       {  } -> `WindowPtr' castPtrToWindow* #}
{# fun unsafe Fl_set_first_window as setFirstWindow'
       { id `Ptr ()' } -> `()' #}
setFirstWindow :: WindowPtr -> IO ()
setFirstWindow wp =
    withForeignPtr wp (\ptr -> setFirstWindow' (castPtr ptr))
{# fun unsafe Fl_next_window as nextWindow'
       { id `Ptr ()' } -> `Ptr ()' id #}
nextWindow :: WindowPtr -> IO WindowPtr
nextWindow currWindow =
    withForeignPtr currWindow
                       (\ptr -> do
                          nw <- nextWindow' (castPtr ptr)
                          newForeignPtr_ $ castPtr nw)
{# fun unsafe Fl_modal as modal'
       {  } -> `WindowPtr' castPtrToWindow* #}
{# fun unsafe Fl_grab as grab'
       {  } -> `WindowPtr' castPtrToWindow* #}
{# fun unsafe Fl_set_grab as setGrab'
       { id `Ptr ()' } -> `()' #}
setGrab :: WindowPtr -> IO ()
setGrab wp = withForeignPtr wp (\ptr -> setGrab' (castPtr ptr))
{# fun unsafe Fl_event as event
       {  } -> `Int' #}
{# fun unsafe Fl_event_x as eventX
       {  } -> `Int' #}
{# fun unsafe Fl_event_y as eventY
       {  } -> `Int' #}
{# fun unsafe Fl_event_x_root as eventXRoot
       {  } -> `Int' #}
{# fun unsafe Fl_event_y_root as eventYRoot
       {  } -> `Int' #}
{# fun unsafe Fl_event_dx as eventDx
       {  } -> `Int' #}
{# fun unsafe Fl_event_dy as eventDy
       {  } -> `Int' #}
{# fun unsafe Fl_get_mouse as getMouse'
   {
     alloca- `Int' peekIntConv* ,
     alloca- `Int' peekIntConv*
   } -> `()' #}
getMouse :: IO Position
getMouse = do
  (x_pos,y_pos) <- getMouse'
  return $ (Position (X x_pos) (Y y_pos))
{# fun unsafe Fl_event_clicks as eventClicks
       {  } -> `Int' #}
{# fun unsafe Fl_set_event_clicks as setEventClicks
       { `Int' } -> `()' #}
{# fun unsafe Fl_event_is_click as eventIsClick
       {  } -> `Int' #}
{# fun unsafe Fl_set_event_is_click as setEventIsClick
       { `Int' } -> `()' #}
{# fun unsafe Fl_event_button as eventButton
       {  } -> `Int' #}
{# fun unsafe Fl_event_state as eventState
       {  } -> `Int' #}
{# fun unsafe Fl_set_event_state as eventSetState
       { `Int' } -> `Int' #}
{# fun unsafe Fl_event_key as eventKey
       {  } -> `Int' #}
{# fun unsafe Fl_event_original_key as eventOriginalKey
       {  } -> `Int' #}
{# fun unsafe Fl_set_event_key as setEventKey
       { `Int' } -> `Int' #}
{# fun unsafe Fl_get_key as getKey
       { `Int' } -> `Int' #}
{# fun unsafe Fl_event_text as eventText
       {  } -> `String' #}
{# fun unsafe Fl_event_length as eventLength
       {  } -> `Int' #}
{# fun unsafe Fl_compose as compose
       { alloca- `Int' peekIntConv* } -> `Bool' cToBool #}
{# fun unsafe Fl_compose_reset as composeReset
       {  } -> `()' #}
{# fun unsafe Fl_event_inside_region as eventInsideRegion'
       { `Int',`Int',`Int',`Int' } -> `Int' #}
eventInsideRegion :: Rectangle -> IO Event
eventInsideRegion (Rectangle (X x_pos) (Y y_pos) (Width width) (Height height)) =
    do
      eventNum <- eventInsideRegion' x_pos y_pos width height
      return $ toEnum eventNum
{# fun unsafe Fl_event_inside_widget as eventInsideWidget'
       { id `Ptr ()' } -> `Int' #}
eventInsideWidget :: WidgetPtr -> IO Event
eventInsideWidget wp =
    withForeignPtr wp (\ptr -> do
                         eventNum <- eventInsideWidget' (castPtr ptr)
                         return $ toEnum eventNum)
{# fun unsafe Fl_test_shortcut as testShortcut
       { id `FlShortcut' } -> `Int' #}
{# fun unsafe Fl_handle as handle'
       { `Int',id `Ptr ()' } -> `Int' #}
handle :: Event -> WindowPtr -> IO Int
handle e wp =
    withForeignPtr wp (\ptr -> do
                         result <- handle' (cFromEnum e) (castPtr ptr)
                         return result)

{# fun unsafe Fl_handle_ as handle_'
       { `Int',id `Ptr ()' } -> `Int' #}
handle_ :: Event -> WindowPtr -> IO Int
handle_ e wp =
    withForeignPtr wp (\ptr -> do
                         result <- handle_' (cFromEnum e) (castPtr ptr)
                         return result)
{# fun unsafe Fl_belowmouse as belowmouse'
       {  } -> `WidgetPtr' castPtrToWidget* #}
{# fun unsafe Fl_set_belowmouse as setBelowmouse'
       { id `Ptr ()' } -> `()' #}
setBelowmouse :: WidgetPtr -> IO ()
setBelowmouse wp = withForeignPtr wp (\ptr -> setBelowmouse' (castPtr ptr))
{# fun unsafe Fl_pushed as pushed
       {  } -> `WidgetPtr' castPtrToWidget* #}
{# fun unsafe Fl_set_pushed as setPushed'
       { id `Ptr ()' } -> `()' #}
setPushed :: WidgetPtr -> IO ()
setPushed wp = withForeignPtr wp (\ptr -> setPushed' (castPtr ptr))
{# fun unsafe Fl_focus as focus
       {  } -> `WidgetPtr' castPtrToWidget* #}
{# fun unsafe Fl_set_focus as setFocus'
       { id `Ptr ()' } -> `()' #}
setFocus :: WidgetPtr -> IO ()
setFocus wp = withForeignPtr wp (\ptr -> setFocus' (castPtr ptr))
{# fun unsafe Fl_add_handler as addHandler'
       { id `FunPtr EventHandlerPrim' } -> `()' #}
{# fun unsafe Fl_remove_handler as removeHandler'
       { id `FunPtr EventHandlerPrim' } -> `()' #}
setHandler :: EventHandler -> IO ()
setHandler eh = do
  let toPrim = (\e ->
                    let eventEnum = toEnum $ fromIntegral e
                    in
                      eh eventEnum >>= return . fromIntegral)
  newEventHandler <- wrapEventHandlerPrim toPrim
  curr <- atomically $ do
                  old <- readTVar ptrToGlobalEventHandler
                  writeTVar ptrToGlobalEventHandler newEventHandler
                  return old
  removeHandler' curr
  addHandler' newEventHandler

{# fun unsafe Fl_set_event_dispatch as setEventDispatch'
       { id `Ptr (FunPtr EventDispatchPrim)' } -> `()' #}
{# fun unsafe Fl_event_dispatch as eventDispatch'
       {  } -> `FunPtr EventDispatchPrim' id #}
eventDispatch :: IO EventDispatch
eventDispatch =
    do
      funPtr <- eventDispatch'
      return (\e windowPtr ->
                  withForeignPtr
                    windowPtr
                    (\ptr ->
                         let eventNum = fromIntegral (fromEnum e)
                             fun = unwrapEventDispatchPrim funPtr
                         in fun eventNum (castPtr ptr) >>=
                            return . fromIntegral
                    )
             )

setEventDispatch :: EventDispatch -> IO ()
setEventDispatch ed = do
    do
      let toPrim = (\e ptr ->
                      let eventEnum = toEnum $ fromIntegral e
                      in
                      do
                        newPtr <- newForeignPtr_ (castPtr ptr)
                        ed eventEnum newPtr >>= return . fromIntegral
                    )
      callbackPtr <-  wrapEventDispatchPrim toPrim
      ptrToCallbackPtr <- new callbackPtr
      poke ptrToCallbackPtr callbackPtr
      setEventDispatch' ptrToCallbackPtr
{# fun unsafe Fl_copy as copy
       { `String',`Int' } -> `()' #}
{# fun unsafe Fl_copy_with_destination as copyWithDestination
       { `String',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_paste_with_source as pasteWithSource
       { id `Ptr ()',`Int' } -> `()' #}
paste :: WidgetPtr -> Maybe Int -> IO ()
paste widget (Just clipboard) = withForeignPtr widget (\p -> pasteWithSource (castPtr p) clipboard)
paste widget Nothing          = withForeignPtr widget (\p -> pasteWithSource (castPtr p)  0)

{# fun unsafe Fl_dnd as dnd
       {  } -> `Int' #}
{# fun unsafe Fl_x as x
       {  } -> `Int' #}
{# fun unsafe Fl_y as y
       {  } -> `Int' #}
{# fun unsafe Fl_w as w
       {  } -> `Int' #}
{# fun unsafe Fl_h as h
       {  } -> `Int' #}
{# fun unsafe Fl_screen_count as screenCount
       {  } -> `Int' #}

{# fun unsafe Fl_screen_xywh as screenXYWH
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv*
       } -> `()' #}
{# fun unsafe Fl_screen_xywh_with_mxmy as screenXYWYWithMXMY
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int',
         `Int'
       } -> `()' #}
{# fun unsafe Fl_screen_xywh_with_n as screenXYWNWithN
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int'
       } -> `()' #}
{# fun unsafe Fl_screen_xywh_with_mxmymwmh as screenXYWHWithNMXMYMWMH
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int',
         `Int',
         `Int',
         `Int'
       } -> `()' #}

toRectangle :: (Int,Int,Int,Int) -> Rectangle
toRectangle (x_pos, y_pos, width, height) = Rectangle (X (fromIntegral x_pos))
                                                      (Y (fromIntegral y_pos))
                                                      (Width (fromIntegral width))
                                                      (Height (fromIntegral height))

screen :: Maybe ScreenLocation -> IO Rectangle
screen location =
    case location of
      (Just (Intersect (Rectangle (X x_pos) (Y y_pos) (Width width) (Height height)))) ->
          screenXYWHWithNMXMYMWMH x_pos y_pos width height >>= return . toRectangle
      (Just (ScreenPosition (Position (X x_pos) (Y y_pos)))) ->
          screenXYWYWithMXMY x_pos y_pos >>= return . toRectangle
      (Just (ScreenNumber n)) ->
          screenXYWNWithN n >>= return . toRectangle
      Nothing ->
          screenXYWH >>= return . toRectangle

{# fun unsafe Fl_screen_dpi as screenDpi'
       { alloca- `Float' peekFloatConv*,
         alloca- `Float' peekFloatConv* }
           -> `()' #}
{# fun unsafe Fl_screen_dpi_with_n as screenDpiWithN'
       { alloca- `Float' peekFloatConv*,
         alloca- `Float' peekFloatConv*,
                 `Int' }
           -> `()' #}

screenDPI :: Maybe Int -> IO DPI
screenDPI (Just n) = do
  (dpiX, dpiY) <- screenDpiWithN' n
  return $ DPI dpiX dpiY
screenDPI Nothing = do
  (dpiX, dpiY) <- screenDpi'
  return $ DPI dpiX dpiY

{# fun unsafe Fl_screen_work_area_with_mx_my as screenWorkAreaWithMXMY'
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int',
         `Int'
       }
         -> `()' #}
{# fun unsafe Fl_screen_work_area_with_n as screenWorkAreaWithN'
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int'
       }
        -> `()' #}
{# fun unsafe Fl_screen_work_area as screenWorkArea'
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv*
       }
        -> `()' #}
screenWorkArea :: Maybe ScreenLocation -> IO Rectangle
screenWorkArea location =
    case location of
      (Just (Intersect (Rectangle (X x_pos) (Y y_pos) _ _))) ->
          screenWorkAreaWithMXMY' x_pos y_pos >>= return . toRectangle
      (Just (ScreenPosition (Position (X x_pos) (Y y_pos)))) ->
          screenWorkAreaWithMXMY' x_pos y_pos >>= return . toRectangle
      (Just (ScreenNumber n)) ->
          screenWorkAreaWithN' n >>= return . toRectangle
      Nothing ->
          screenWorkArea' >>= return . toRectangle

{# fun unsafe Fl_set_color_rgb as setColorRgb
       { cFromColor `Color',`Int',`Int',`Int'} -> `()' #}
{# fun unsafe Fl_set_color as setColor
       { cFromColor `Color',`Int' } -> `()' #}
{# fun unsafe Fl_get_color as getColor
       { cFromColor `Color' } -> `Int' #}
{# fun unsafe Fl_get_color_rgb as getColorRgb
       {
         cFromColor `Color',
         alloca- `Word8' peekIntConv*,
         alloca- `Word8' peekIntConv*,
         alloca- `Word8' peekIntConv*
       } -> `()' #}
{# fun unsafe Fl_free_color as freeColor
       { cFromColor `Color' } -> `()' #}
{# fun unsafe Fl_free_color_with_overlay as freeColorWithOverlay
       { cFromColor `Color',`Int' } -> `()' #}
{# fun unsafe Fl_get_font as getFont
       { cFromFont `Font' } -> `String' #}
{# fun unsafe Fl_get_font_name as getFontName
       { cFromFont `Font' } -> `String' #}
{# fun unsafe Fl_get_font_name_with_attributes as getFontNameWithAttributes
       { cFromFont `Font',id `Ptr CInt' } -> `String' #}
{# fun unsafe Fl_get_font_sizes as getFontSizes
       { cFromFont `Font',id `Ptr CInt' } -> `Int' #}
{# fun unsafe Fl_set_font_by_string as setFontByString
       { cFromFont `Font',`String' } -> `()' #}
{# fun unsafe Fl_set_font_by_font as setFontByFont
       { cFromFont `Font',cFromFont `Font' } -> `()' #}
{# fun unsafe Fl_set_fonts as setFonts
       {  } -> `Font' cToFont #}
{# fun unsafe Fl_set_fonts_with_string as setFontsWithString
       { `String' } -> `Font' cToFont #}
{# fun unsafe Fl_set_labeltype as setLabeltype
       {
         cFromEnum `Labeltype',
         id `FunPtr LabelDrawFPrim',
         id `FunPtr LabelMeasureFPrim'
       } -> `()' #}
{# fun unsafe Fl_get_boxtype as getBoxtype
       { cFromEnum `Boxtype' } -> `FunPtr BoxDrawFPrim' id #}
{# fun unsafe Fl_set_boxtype as setBoxtype
       {
         cFromEnum `Boxtype',
         id `FunPtr BoxDrawFPrim',
         `Word8',
         `Word8',
         `Word8',
         `Word8'
       } -> `()' #}
{# fun unsafe Fl_set_boxtype_by_boxtype as setBoxtypeByBoxtype
       {
         cFromEnum `Boxtype',
         cFromEnum `Boxtype'
       } -> `()' #}
{# fun unsafe Fl_box_dx as boxDx
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_box_dy as boxDy
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_box_dw as boxDw
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_box_dh as boxDh
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_draw_box_active as drawBoxActive
       {  } -> `Int' #}
{# fun unsafe Fl_event_shift as eventShift
       {  } -> `Int' #}
{# fun unsafe Fl_event_ctrl as eventCtrl
       {  } -> `Int' #}
{# fun unsafe Fl_event_command as eventCommand
       {  } -> `Int' #}
{# fun unsafe Fl_event_alt as eventAlt
       {  } -> `Int' #}
{# fun unsafe Fl_event_buttons as eventButtons
       {  } -> `Int' #}
{# fun unsafe Fl_event_button1 as eventButton1
       {  } -> `Int' #}
{# fun unsafe Fl_event_button2 as eventButton2
       {  } -> `Int' #}
{# fun unsafe Fl_event_button3 as eventButton3
       {  } -> `Int' #}
{# fun unsafe Fl_set_idle as setIdle
       { unsafeMkCallbackPtr `Callback' } -> `()' #}
{# fun unsafe Fl_release as release
       {  } -> `()' #}
{# fun unsafe Fl_set_visible_focus as setVisibleFocus
       { `Int' } -> `()' #}
{# fun unsafe Fl_visible_focus as visibleFocus
       {  } -> `Int' #}
{# fun unsafe Fl_set_dnd_text_ops as setDndTextOps
       { fromBool `Bool' } -> `()' #}
{# fun unsafe Fl_dnd_text_ops as dndTextOps'
       {  } -> `Int'  #}
dndTextOps :: IO Option
dndTextOps = do
  result <- dndTextOps'
  return $ Graphics.UI.FLTK.LowLevel.Utils.cToEnum result

{# fun unsafe Fl_delete_widget as deleteWidget'
       { id `Ptr ()' } -> `()' #}
deleteWidget :: WidgetPtr -> IO ()
deleteWidget wptr = withForeignPtr wptr $ deleteWidget' . castPtr
{# fun unsafe Fl_do_widget_deletion as doWidgetDeletion
       {  } -> `()' #}
{# fun unsafe Fl_watch_widget_pointer as watchWidgetPointer'
       {id `Ptr ()' } -> `()' #}
watchWidgetPointer :: WidgetPtr -> IO ()
watchWidgetPointer wptr = withForeignPtr wptr $ watchWidgetPointer' . castPtr
{# fun unsafe Fl_release_widget_pointer as releaseWidgetPointer'
       { id `Ptr ()' } -> `()' #}
releaseWidgetPointer :: WidgetPtr -> IO ()
releaseWidgetPointer wp = withForeignPtr wp (\ptr -> releaseWidgetPointer' (castPtr ptr))
{# fun unsafe Fl_clear_widget_pointer as clearWidgetPointer'
       { id `Ptr ()' } -> `()' #}
clearWidgetPointer :: WidgetPtr -> IO ()
clearWidgetPointer wp = withForeignPtr wp (\ptr -> clearWidgetPointer' (castPtr ptr))
