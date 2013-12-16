{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.FL
    (
     Option(..),
     LabelDrawF,
     LabelMeasureF,
     EventHandlerF,
     EventDispatchF,
     run,
     check,
     ready,
     option,
     toUserDataHandlerPrim,
     addAwakeHandler,
     getAwakeHandler_,
     display,
     ownColormap,
     getSystemColors,
     foreground,
     background,
     background2,
     setScheme,
     setFirstWindow,
     nextWindow,
     setGrab,
     getMouse,
     validKeyboardStates,
     extractModifiers,
     foldModifiers,
     eventInsideRegion,
     eventInsideWidget,
     handle,
     handle_,
     belowmouse,
     setBelowmouse,
     setPushed,
     setFocus,
     setHandler,
     eventDispatch,
     setEventDispatch,
     paste,
     toRectangle,
     screenBounds,
     screenDPI,
     screenWorkArea,
     setColorRgb,
     toAttribute,
     getFontName,
     setIdle,
     release,
     setVisibleFocus,
     visibleFocus,
     setDndTextOps,
     dndTextOps,
     deleteWidget,
     doWidgetDeletion,
     watchWidgetPointer,
     releaseWidgetPointer,
     clearWidgetPointer,
     version,
     help,
     visual,
     glVisual,
     glVisualWithAlist,
     scheme,
     wait,
     setWait,
     readqueue,
     addTimeout,
     repeatTimeout,
     hasTimeout,
     removeTimeout,
     addCheck,
     hasCheck,
     removeCheck,
     addIdle,
     hasIdle,
     removeIdle,
     damage,
     redraw,
     flush,
     firstWindow,
     modal,
     grab,
     event,
     eventX,
     eventY,
     eventXRoot,
     eventYRoot,
     eventDx,
     eventDy,
     eventClicks,
     setEventClicks,
     eventIsClick,
     setEventIsClick,
     eventButton,
     eventState,
     containsEventState,
     eventKey,
     eventOriginalKey,
     eventKeyPressed,
     getKey,
     eventText,
     eventLength,
     compose,
     composeReset,
     testShortcut,
     pushed,
     focus,
     copy,
     copyWithDestination,
     pasteWithSource,
     dnd,
     x,
     y,
     w,
     h,
     screenCount,
     setColor,
     getColor,
     getColorRgb,
     removeFromColormap,
     getFont,
     getFontSizes,
     setFontByString,
     setFontByFont,
     setFonts,
     setFontsWithString,
     setLabeltype,
     getBoxtype,
     setBoxtype,
     boxDx,
     boxDy,
     boxDw,
     boxDh,
     drawBoxActive,
     eventShift,
     eventCtrl,
     eventCommand,
     eventAlt,
     eventButtons,
     eventButton1,
     eventButton2,
     eventButton3,
    )
where
#include "Fl_C.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cToBool,cToEnum)
import Control.Concurrent.STM hiding (check)
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

type LabelDrawFPrim = (Ptr () ->
     		       CInt ->
		       CInt ->
		       CInt ->
		       CInt ->
		       FlAlign -> -- Align
		       IO ())
foreign import ccall "wrapper"
        wrapLabelDrawFPrim :: LabelDrawFPrim ->
                              IO (FunPtr LabelDrawFPrim)


type LabelDrawF a = (Label a ->
                     Rectangle ->
		     AlignType ->
		     IO ())

type LabelMeasureFPrim = (Ptr () ->
                          Ptr CInt ->
                          Ptr CInt ->
                          IO ())
foreign import ccall "wrapper"
        wrapLabelMeasureFPrim :: LabelMeasureFPrim ->
                                 IO (FunPtr LabelMeasureFPrim)
type LabelMeasureF a = (Label a -> IO RectangleSize)

type BoxDrawFPrim = (CInt ->
                     CInt ->
                     CInt ->
                     CInt ->
                     FlColor ->
                     IO ())
foreign import ccall "wrapper"
        wrapBoxDrawFPrim :: BoxDrawFPrim ->
                            IO (FunPtr BoxDrawFPrim)

foreign import ccall "dynamic"
        unwrapBoxDrawFPrim :: FunPtr BoxDrawFPrim ->
                              BoxDrawFPrim
type BoxDrawF = Rectangle -> Color -> IO ()

type HandlerPrim = Ptr() -> IO ()

ptrToGlobalEventHandler :: TVar (FunPtr EventHandlerPrim)
ptrToGlobalEventHandler = unsafePerformIO $ do
                            initialHandler <- wrapEventHandlerPrim (\_ -> return (0 :: CInt))
                            newTVarIO initialHandler

type EventHandlerPrim = (CInt ->
                         IO CInt)
foreign import ccall "wrapper"
        wrapEventHandlerPrim :: EventHandlerPrim ->
                                IO (FunPtr EventHandlerPrim)
type EventHandlerF = (Event ->
                     IO Int)

type EventDispatchPrim = (CInt ->
                          Ptr () ->
                          IO CInt)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim ->
                                 IO (FunPtr EventDispatchPrim)
foreign import ccall "dynamic"
        unwrapEventDispatchPrim :: FunPtr EventDispatchPrim -> EventDispatchPrim

type EventDispatchF a = (Event ->
                        Window a ->
                        IO Int)
run :: IO Int
run = {#call unsafe Fl_run as fl_run #} >>= return . fromIntegral

check :: IO Int
check = {#call unsafe Fl_check as fl_check #} >>= return . fromIntegral

ready :: IO Int
ready = {#call unsafe Fl_ready as fl_ready #} >>= return . fromIntegral


option :: Option -> IO Int
option o = {#call unsafe Fl_option as fl_option #} (cFromEnum o) >>= return . fromIntegral

toUserDataHandlerPrim :: Callback -> FunPtr HandlerPrim
toUserDataHandlerPrim cb =
    unsafePerformIO $ do
      ptr <- mkCallbackPtr cb
      return $ castFunPtr ptr

{# fun unsafe Fl_add_awake_handler_ as addAwakeHandler'
  {id `FunPtr HandlerPrim', id `(Ptr ())'} -> `Int' #}
addAwakeHandler :: Callback -> IO Int
addAwakeHandler awakeHandler =
    do
      callbackPtr <-  mkCallbackPtr awakeHandler
      addAwakeHandler' (castFunPtr callbackPtr) nullPtr

{# fun unsafe Fl_get_awake_handler_ as getAwakeHandler_'
  {id `Ptr (FunPtr HandlerPrim)', id `Ptr (Ptr ())'} -> `Int' #}
getAwakeHandler_ :: IO Callback
getAwakeHandler_ =
    alloca $ \ptrToFunPtr ->
        alloca $ \ptrToUD -> do
          _ <- getAwakeHandler_' ptrToFunPtr ptrToUD
          funPtr <- peek ptrToFunPtr
          return $ unwrapCallbackPtr $ castFunPtr funPtr

{# fun unsafe Fl_version as version
  {} -> `Double' #}
{# fun unsafe Fl_help as help
  {} -> `String' #}

display :: String -> IO ()
display text = withCString text $ \str -> {#call unsafe Fl_display as fl_display #} str
{# fun unsafe Fl_visual as visual
  {cFromEnum `Mode'} -> `Int' #}
{# fun unsafe Fl_gl_visual as glVisual
  {cFromEnum `Mode'} -> `Int' #}
{# fun unsafe Fl_gl_visual_with_alist as glVisualWithAlist
  {cFromEnum `Mode', id `Ptr CInt'} -> `Int' #}

ownColormap :: IO ()
ownColormap = {#call unsafe Fl_own_colormap as fl_own_colormap #}

getSystemColors :: IO ()
getSystemColors = {#call unsafe Fl_get_system_colors as fl_get_system_colors #}

foreground :: RGB -> IO ()
foreground (r,g,b) = {#call unsafe Fl_foreground as fl_foreground #}
                    (fromIntegral r)
                    (fromIntegral g)
                    (fromIntegral b)
background :: RGB -> IO ()
background (r,g,b) = {#call unsafe Fl_background as fl_background #}
                    (fromIntegral r)
                    (fromIntegral g)
                    (fromIntegral b)
background2 :: RGB -> IO ()
background2 (r,g,b) = {#call unsafe Fl_background2 as fl_background2 #}
                    (fromIntegral r)
                    (fromIntegral g)
                    (fromIntegral b)
{# fun pure unsafe Fl_scheme as scheme
  {} -> `String' #}
setScheme :: String -> IO Int
setScheme sch = withCString sch $ \str -> {#call unsafe Fl_set_scheme as fl_set_scheme #} str >>= return . fromIntegral
{# fun unsafe Fl_wait as wait
       {  } -> `Int' #}
{# fun unsafe Fl_set_wait as setWait
       { `Double' } -> `Double' #}
{# fun unsafe Fl_readqueue as readqueue
       {  } -> `Widget ()' toWidget #}
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
       {  } -> `Window ()' toWidget #}
{# fun unsafe Fl_set_first_window as setFirstWindow'
       { id `Ptr ()' } -> `()' #}
setFirstWindow :: Window a -> IO ()
setFirstWindow wp =
    withWidget wp setFirstWindow'
{# fun unsafe Fl_next_window as nextWindow'
       { id `Ptr ()' } -> `Window ()' toWidget #}
nextWindow :: Window a -> IO (Window ())
nextWindow currWindow =
    withWidget currWindow nextWindow'
{# fun unsafe Fl_modal as modal
       {  } -> `Window ()' toWidget #}
{# fun unsafe Fl_grab as grab
       {  } -> `Window ()' toWidget #}
{# fun unsafe Fl_set_grab as setGrab'
       { id `Ptr ()' } -> `()' #}
setGrab :: Window a -> IO ()
setGrab wp = withWidget wp setGrab'
{# fun unsafe Fl_event as event
       {  } -> `Int' #}
{# fun unsafe Fl_event_x as eventX
       {  } -> `Event' cToEnum #}
{# fun unsafe Fl_event_y as eventY
       {  } -> `Event' cToEnum #}
{# fun unsafe Fl_event_x_root as eventXRoot
       {  } -> `Event' cToEnum #}
{# fun unsafe Fl_event_y_root as eventYRoot
       {  } -> `Int' #}
{# fun unsafe Fl_event_dx as eventDx
       {  } -> `Int' #}
{# fun unsafe Fl_event_dy as eventDy
       {  } ->  `Int' #}
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
       {  } -> `Int'#}
{# fun unsafe Fl_set_event_clicks as setEventClicks
       { `Int' } -> `()' #}
{# fun unsafe Fl_event_is_click as eventIsClick
       {  } -> `Bool' toBool #}
{# fun unsafe Fl_set_event_is_click as setEventIsClick
       { `Int' } -> `()' #}
{# fun unsafe Fl_event_button as eventButton
       {  } -> `MouseButton' cToEnum #}
validKeyboardStates :: [KeyboardCode]
validKeyboardStates = [ Kb_Shift
                      , Kb_CapsLock
                      , Kb_Ctrl
                      , Kb_Alt
                      , Kb_NumLock
                      , Kb_Meta
                      , Kb_ScrollLock
                      , Kb_Button1
                      , Kb_Button2
                      , Kb_Button3
                      ]
extractModifiers :: (Enum a) => [a] -> CInt -> [a]
extractModifiers allCodes compoundCode 
    = map cToEnum $
      filter (masks compoundCode) $
      map cFromEnum allCodes
unmaskKeysyms :: CInt -> [KeyboardCode]
unmaskKeysyms = extractModifiers validKeyboardStates
foldModifiers :: [KeyboardCode] -> CInt
foldModifiers codes =
    let validKeysyms = map cFromEnum (filter (\c -> c `elem` validKeyboardStates) codes)
    in
      case validKeysyms of
        [] -> (-1)
        (k:ks) -> foldl (\accum k' -> accum .&. k') k ks
{# fun unsafe Fl_event_state as eventState
       {  } -> `[KeyboardCode]' unmaskKeysyms #}
{# fun unsafe Fl_contains_event_state as containsEventState
       {cFromEnum `KeyboardCode' } -> `Bool' cToBool #}
{# fun unsafe Fl_event_key as eventKey
       {  } -> `KeyboardCode' cToEnum #}
{# fun unsafe Fl_event_original_key as eventOriginalKey
       {  } -> `KeyboardCode' cToEnum #}
{# fun unsafe Fl_event_key_pressed as eventKeyPressed
       {cFromEnum `KeyboardCode' } -> `Bool' cToBool #}
{# fun unsafe Fl_get_key as getKey
       {cFromEnum `KeyboardCode' } -> `Bool' cToBool #}
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
eventInsideRegion (Rectangle
                   (Position
                    (X x_pos)
                    (Y y_pos))
                   (RectangleSize
                    (Width width)
                    (Height height))) =
    do
      eventNum <- eventInsideRegion' x_pos y_pos width height
      return $ toEnum eventNum
{# fun unsafe Fl_event_inside_widget as eventInsideWidget'
       { id `Ptr ()' } -> `Int' #}
eventInsideWidget :: Widget a -> IO Event
eventInsideWidget wp =
    withWidget wp  (\ptr -> do
                      eventNum <- eventInsideWidget' (castPtr ptr)
                      return $ toEnum eventNum)
{# fun unsafe Fl_test_shortcut as testShortcut
       { id `FlShortcut' } -> `Int' #}
{# fun unsafe Fl_handle as handle'
       { `Int',id `Ptr ()' } -> `Int' #}
handle :: Event -> Window a -> IO Int
handle e wp =
    withWidget wp (handle' (cFromEnum e))
{# fun unsafe Fl_handle_ as handle_'
       { `Int',id `Ptr ()' } -> `Int' #}
handle_ :: Event -> Window a -> IO Int
handle_ e wp =
    withWidget wp (handle_' (cFromEnum e))
{# fun unsafe Fl_belowmouse as belowmouse
       {  } -> `Widget ()' toWidget #}
{# fun unsafe Fl_set_belowmouse as setBelowmouse'
       { id `Ptr ()' } -> `()' #}
setBelowmouse :: Widget a -> IO ()
setBelowmouse wp = withWidget wp setBelowmouse'
{# fun unsafe Fl_pushed as pushed
       {  } -> `Widget ()' toWidget #}
{# fun unsafe Fl_set_pushed as setPushed'
       { id `Ptr ()' } -> `()' #}
setPushed :: Widget a -> IO ()
setPushed wp = withWidget wp setPushed'
{# fun unsafe Fl_focus as focus
       {  } -> `Widget ()' toWidget #}
{# fun unsafe Fl_set_focus as setFocus'
       { id `Ptr ()' } -> `()' #}
setFocus :: Widget a -> IO ()
setFocus wp = withWidget wp setFocus'
{# fun unsafe Fl_add_handler as addHandler'
       { id `FunPtr EventHandlerPrim' } -> `()' #}
{# fun unsafe Fl_remove_handler as removeHandler'
       { id `FunPtr EventHandlerPrim' } -> `()' #}
setHandler :: EventHandlerF -> IO ()
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
eventDispatch :: IO (EventDispatchF a)
eventDispatch =
    do
      funPtr <- eventDispatch'
      return (\e window ->
                  withWidget
                   window
                    (\ptr ->
                         let eventNum = fromIntegral (fromEnum e)
                             fun = unwrapEventDispatchPrim funPtr
                         in fun eventNum (castPtr ptr) >>=
                            return . fromIntegral
                    )
             )

setEventDispatch :: (EventDispatchF a) -> IO ()
setEventDispatch ed = do
    do
      let toPrim = (\e ptr ->
                      let eventEnum = toEnum $ fromIntegral e
                      in
                        ed eventEnum (toWidget (castPtr ptr)) >>= return . fromIntegral
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
paste :: Widget a -> Maybe Int -> IO ()
paste widget (Just clipboard) = withWidget widget ((flip pasteWithSource) clipboard)
paste widget Nothing          = withWidget widget ((flip pasteWithSource) 0)

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
toRectangle (x_pos, y_pos, width, height) =
    Rectangle (Position
               (X x_pos)
               (Y y_pos))
              (RectangleSize
               (Width width)
               (Height height))

fromRectangle ::  Rectangle -> (Int,Int,Int,Int)
fromRectangle (Rectangle (Position
                          (X x_pos)
                          (Y y_pos))
                         (RectangleSize
                          (Width width)
                          (Height height))) =
              (x_pos, y_pos, width, height)
screenBounds :: Maybe ScreenLocation -> IO Rectangle
screenBounds location =
    case location of
      (Just (Intersect (Rectangle (Position (X x_pos) (Y y_pos)) (RectangleSize (Width width) (Height height))))) ->
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
        -> `()' id- #}
screenWorkArea :: Maybe ScreenLocation -> IO Rectangle
screenWorkArea location =
    case location of
      (Just (Intersect (Rectangle (Position (X x_pos) (Y y_pos)) _))) ->
          screenWorkAreaWithMXMY' x_pos y_pos >>= return . toRectangle
      (Just (ScreenPosition (Position (X x_pos) (Y y_pos)))) ->
          screenWorkAreaWithMXMY' x_pos y_pos >>= return . toRectangle
      (Just (ScreenNumber n)) ->
          screenWorkAreaWithN' n >>= return . toRectangle
      Nothing ->
          screenWorkArea' >>= return . toRectangle

setColorRgb :: Color -> Int -> Int -> Int -> IO ()
setColorRgb c r g b = {#call unsafe Fl_set_color_rgb as fl_set_color_rgb #}
                        (cFromColor c)
                        (fromIntegral r)
                        (fromIntegral g)
                        (fromIntegral b)
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
{# fun unsafe Fl_free_color as freeColor'
      { cFromColor `Color' } -> `()' #}
{# fun unsafe Fl_free_color_with_overlay as freeColorWithOverlay'
       { cFromColor `Color', `Int' } -> `()' #}
removeFromColormap :: Maybe Int -> Color -> IO ()
removeFromColormap (Just overlay) c = freeColorWithOverlay' c overlay
removeFromColormap Nothing c = freeColor' c
{# fun unsafe Fl_get_font as getFont
       { cFromFont `Font' } -> `String' #}
{# fun unsafe Fl_get_font_name_with_attributes as getFontNameWithAttributes'
       { cFromFont `Font', alloca- `Maybe FontAttribute' toAttribute* } -> `String' #}
toAttribute :: Ptr CInt -> IO (Maybe FontAttribute)
toAttribute ptr =
        do
          attributeCode <- peekIntConv ptr
          return $ cToFontAttribute attributeCode
getFontName :: Font -> IO (String, Maybe FontAttribute)
getFontName f = getFontNameWithAttributes' f
{# fun unsafe Fl_get_font_sizes as getFontSizes
       { cFromFont `Font', alloca- `Int' peekIntConv* } -> `Int' #}
{# fun unsafe Fl_set_font_by_string as setFontByString
       { cFromFont `Font',`String' } -> `()' #}
{# fun unsafe Fl_set_font_by_font as setFontByFont
       { cFromFont `Font',cFromFont `Font' } -> `()' #}
{# fun unsafe Fl_set_fonts as setFonts
       {  } -> `Font' cToFont #}
{# fun unsafe Fl_set_fonts_with_string as setFontsWithString
       { `String' } -> `Font' cToFont #}
{# fun unsafe Fl_set_labeltype as setLabeltype'
       {
         cFromEnum `Labeltype',
         id `FunPtr LabelDrawFPrim',
         id `FunPtr LabelMeasureFPrim'
       } -> `()' #}
setLabeltype :: Labeltype ->
                LabelDrawF a ->
                LabelMeasureF a ->
                IO ()
setLabeltype label drawF measureF =
    let drawFPrim = (\rawPtr xPrim yPrim wPrim hPrim alignPrim ->
                         let rectangle = toRectangle (fromIntegral xPrim,
                                                      fromIntegral yPrim,
                                                      fromIntegral wPrim,
                                                      fromIntegral hPrim)
                             alignType = cToEnum alignPrim
                         in drawF (toWidget rawPtr) rectangle alignType)
        measureFPrim = (\rawPtr wPtr hPtr -> do
                          (RectangleSize (Width width) (Height height)) <- measureF (toWidget rawPtr)
                          poke wPtr (fromIntegral width)
                          poke hPtr (fromIntegral height))
    in
      do
        wrappedDrawFPrim <- wrapLabelDrawFPrim drawFPrim
        wrappedMeasureFPrim <- wrapLabelMeasureFPrim measureFPrim
        setLabeltype' label wrappedDrawFPrim wrappedMeasureFPrim

{# fun unsafe Fl_get_boxtype as getBoxtype'
       { cFromEnum `Boxtype' } -> `FunPtr BoxDrawFPrim' id #}
toBoxDrawF :: BoxDrawFPrim -> BoxDrawF
toBoxDrawF boxDrawPrim =
    (\r c ->
       let (x_pos,y_pos,width,height) = fromRectangle r
           colorPrim = cFromColor c
       in
         boxDrawPrim ((fromIntegral x_pos) :: CInt)
                     ((fromIntegral y_pos) :: CInt)
                     ((fromIntegral width) :: CInt)
                     ((fromIntegral height) :: CInt)
                     colorPrim
    )
toBoxDrawFPrim :: BoxDrawF -> BoxDrawFPrim
toBoxDrawFPrim f =
    (\xPrim yPrim wPrim hPrim colorPrim ->
       let r = toRectangle (fromIntegral xPrim,
                            fromIntegral yPrim,
                            fromIntegral wPrim,
                            fromIntegral hPrim)
           c = cToColor colorPrim
       in
           f r c)

getBoxtype :: Boxtype -> IO BoxDrawF
getBoxtype bt = do
  wrappedFunPtr <- getBoxtype' bt
  let boxDrawPrim = unwrapBoxDrawFPrim wrappedFunPtr
  return $ toBoxDrawF boxDrawPrim

{# fun unsafe Fl_set_boxtype as setBoxtype'
       {
         cFromEnum `Boxtype',
         id `FunPtr BoxDrawFPrim',
         `Word8',
         `Word8',
         `Word8',
         `Word8'
       } -> `()' #}
{# fun unsafe Fl_set_boxtype_by_boxtype as setBoxtypeByBoxtype'
       {
         cFromEnum `Boxtype',
         cFromEnum `Boxtype'
       } -> `()' #}

data BoxtypeSpec = FromSpec BoxDrawF Word8 Word8 Word8 Word8
                 | FromBoxtype Boxtype
setBoxtype :: Boxtype -> BoxtypeSpec -> IO ()
setBoxtype bt (FromSpec f dx dy dw dh) =
    do
      funPtr <- wrapBoxDrawFPrim (toBoxDrawFPrim f)
      setBoxtype' bt funPtr dx dy dw dh
setBoxtype bt (FromBoxtype template) =
    setBoxtypeByBoxtype' bt template

{# fun unsafe Fl_box_dx as boxDx
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_box_dy as boxDy
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_box_dw as boxDw
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_box_dh as boxDh
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun unsafe Fl_draw_box_active as drawBoxActive
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_shift as eventShift
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_ctrl as eventCtrl
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_command as eventCommand
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_alt as eventAlt
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_buttons as eventButtons
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_button1 as eventButton1
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_button2 as eventButton2
       {  } -> `Bool' cToBool #}
{# fun unsafe Fl_event_button3 as eventButton3
      {  } -> `Bool' cToBool #}
setIdle :: Callback -> IO ()
setIdle cb = mkCallbackPtr cb >>= {#call unsafe Fl_set_idle as fl_set_idle #}
release :: IO ()
release = {#call unsafe Fl_release as fl_release #}
setVisibleFocus :: Int -> IO ()
setVisibleFocus = {#call Fl_set_visible_focus as fl_set_visible_focus #} . fromIntegral
visibleFocus :: IO Int
visibleFocus = {#call Fl_visible_focus as fl_visible_focus #} >>= return . fromIntegral
setDndTextOps :: Bool -> IO ()
setDndTextOps =  {#call unsafe Fl_set_dnd_text_ops as fl_set_dnd_text_ops #} . fromBool
dndTextOps :: IO Option
dndTextOps = {#call unsafe Fl_dnd_text_ops as fl_dnd_text_ops #} >>= return . cToEnum
deleteWidget :: Widget a -> IO ()
deleteWidget wptr = withWidget wptr {#call Fl_delete_widget as fl_delete_widget #}
doWidgetDeletion :: IO ()
doWidgetDeletion = {#call unsafe Fl_do_widget_deletion as fl_do_widget_deletion #}
watchWidgetPointer :: Widget a -> IO ()
watchWidgetPointer wp = withWidget wp {#call unsafe Fl_watch_widget_pointer as fl_Watch_widget_Pointer #}
releaseWidgetPointer :: Widget a -> IO ()
releaseWidgetPointer wp = withWidget wp {#call unsafe Fl_release_widget_pointer as fl_release_widget_pointer #}
clearWidgetPointer :: Widget a -> IO ()
clearWidgetPointer wp = withWidget wp {#call unsafe Fl_clear_widget_pointer as fl_Clear_Widget_Pointer #}
