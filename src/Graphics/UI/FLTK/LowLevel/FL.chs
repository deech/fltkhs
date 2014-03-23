{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.FL
    (
     Option(..),
     LabelDrawF,
     LabelMeasureF,
     run,
     check,
     ready,
     option,
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
     handle,
     handle_,
     belowmouse,
     setBelowmouse,
     setPushed,
     setFocus,
     setHandler,
     paste,
     toRectangle,
     fromRectangle,
     screenBounds,
     screenDPI,
     screenWorkArea,
     setColorRgb,
     toAttribute,
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
     getKey,
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
     setLabeltype,
     -- * Box
     BoxtypeSpec,
     getBoxtype,
     setBoxtype,
     boxDx,
     boxDy,
     boxDw,
     boxDh,
     drawBoxActive,
     -- * Fonts
     getFontName,
     getFont,
     getFontSizes,
     setFontByString,
     setFontByFont,
     setFonts,
     setFontsWithString,
     -- * Events
     EventDispatchF,
     event,
     eventShift,
     eventCtrl,
     eventCommand,
     eventAlt,
     eventButtons,
     eventButton1,
     eventButton2,
     eventButton3,
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
     eventInsideRegion,
     eventInsideWidget,
     eventDispatch,
     setEventDispatch,
     eventText,
     eventLength,
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
type LabelMeasureF a = (Label a -> IO Size)

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

ptrToGlobalEventHandler :: TVar (FunPtr GlobalEventHandlerPrim)
ptrToGlobalEventHandler = unsafePerformIO $ do
                            initialHandler <- toGlobalEventHandlerPrim (\_ -> return (-1))
                            newTVarIO initialHandler

type EventDispatchPrim = (CInt ->
                          Ptr () ->
                          IO CInt)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim ->
                                 IO (FunPtr EventDispatchPrim)
foreign import ccall "dynamic"
        unwrapEventDispatchPrim :: FunPtr EventDispatchPrim -> EventDispatchPrim

type EventDispatchF a = (Event ->
                         Widget a ->
                         IO Int)

run :: IO Int
run = {#call Fl_run as fl_run #} >>= return . fromIntegral

check :: IO Int
check = {#call Fl_check as fl_check #} >>= return . fromIntegral

ready :: IO Int
ready = {#call Fl_ready as fl_ready #} >>= return . fromIntegral


option :: Option -> IO Int
option o = {#call Fl_option as fl_option #} (cFromEnum o) >>= return . fromIntegral

unsafeToCallbackPrim :: GlobalCallback -> FunPtr CallbackPrim
unsafeToCallbackPrim = unsafePerformIO . toGlobalCallbackPrim

{# fun Fl_add_awake_handler_ as addAwakeHandler'
  {id `FunPtr CallbackPrim', id `(Ptr ())'} -> `Int' #}
addAwakeHandler :: GlobalCallback -> IO Int
addAwakeHandler awakeHandler =
    do
      callbackPtr <-  toGlobalCallbackPrim awakeHandler
      addAwakeHandler' callbackPtr nullPtr

{# fun Fl_get_awake_handler_ as getAwakeHandler_'
  {id `Ptr (FunPtr CallbackPrim)', id `Ptr (Ptr ())'} -> `Int' #}
getAwakeHandler_ :: IO GlobalCallback
getAwakeHandler_ =
    alloca $ \ptrToFunPtr ->
        alloca $ \ptrToUD -> do
          _ <- getAwakeHandler_' ptrToFunPtr ptrToUD
          funPtr <- peek ptrToFunPtr
          return $ unwrapGlobalCallbackPtr $ castFunPtr funPtr

{# fun Fl_version as version
  {} -> `Double' #}
{# fun Fl_help as help
  {} -> `String' #}

display :: String -> IO ()
display text = withCString text $ \str -> {#call Fl_display as fl_display #} str
{# fun Fl_visual as visual
  {cFromEnum `Mode'} -> `Int' #}
{# fun Fl_gl_visual as glVisual
  {cFromEnum `Mode'} -> `Int' #}
{# fun Fl_gl_visual_with_alist as glVisualWithAlist
  {cFromEnum `Mode', id `Ptr CInt'} -> `Int' #}

ownColormap :: IO ()
ownColormap = {#call Fl_own_colormap as fl_own_colormap #}

getSystemColors :: IO ()
getSystemColors = {#call Fl_get_system_colors as fl_get_system_colors #}

foreground :: RGB -> IO ()
foreground (r,g,b) = {#call Fl_foreground as fl_foreground #}
                    (fromIntegral r)
                    (fromIntegral g)
                    (fromIntegral b)
background :: RGB -> IO ()
background (r,g,b) = {#call Fl_background as fl_background #}
                    (fromIntegral r)
                    (fromIntegral g)
                    (fromIntegral b)
background2 :: RGB -> IO ()
background2 (r,g,b) = {#call Fl_background2 as fl_background2 #}
                    (fromIntegral r)
                    (fromIntegral g)
                    (fromIntegral b)
{# fun pure Fl_scheme as scheme
  {} -> `String' #}
setScheme :: String -> IO Int
setScheme sch = withCString sch $ \str -> {#call Fl_set_scheme as fl_set_scheme #} str >>= return . fromIntegral
{# fun Fl_wait as wait
       {  } -> `Int' #}
{# fun Fl_set_wait as setWait
       { `Double' } -> `Double' #}
{# fun Fl_readqueue as readqueue
       {  } -> `Widget ()' unsafeToObject #}
{# fun Fl_add_timeout as addTimeout
       { `Double', unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_repeat_timeout as repeatTimeout
      { `Double',unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_has_timeout as hasTimeout
       { unsafeToCallbackPrim `GlobalCallback' } -> `Int' #}
{# fun Fl_remove_timeout as removeTimeout
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_add_check as addCheck
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_has_check as hasCheck
       { unsafeToCallbackPrim `GlobalCallback' } -> `Int' #}
{# fun Fl_remove_check as removeCheck
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_add_idle as addIdle
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_has_idle as hasIdle
       { unsafeToCallbackPrim `GlobalCallback' } -> `Int' #}
{# fun Fl_remove_idle as removeIdle
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' #}
{# fun Fl_damage as damage
       {  } -> `Int' #}
{# fun Fl_redraw as redraw
       {  } -> `()' #}
{# fun Fl_flush as flush
       {  } -> `()' #}
{# fun Fl_first_window as firstWindow
       {  } -> `Window ()' unsafeToObject #}
{# fun Fl_set_first_window as setFirstWindow'
       { id `Ptr ()' } -> `()' #}
setFirstWindow :: Window a -> IO ()
setFirstWindow wp =
    withObject wp setFirstWindow'
{# fun Fl_next_window as nextWindow'
       { id `Ptr ()' } -> `Window ()' unsafeToObject #}
nextWindow :: Window a -> IO (Window ())
nextWindow currWindow =
    withObject currWindow nextWindow'
{# fun Fl_modal as modal
       {  } -> `Window ()' unsafeToObject #}
{# fun Fl_grab as grab
       {  } -> `Window ()' unsafeToObject #}
{# fun Fl_set_grab as setGrab'
       { id `Ptr ()' } -> `()' #}
setGrab :: Window a -> IO ()
setGrab wp = withObject wp setGrab'
{# fun Fl_event as event
       {  } -> `Event' cToEnum #}
{# fun Fl_event_x as eventX
       {  } -> `Int'#}
{# fun Fl_event_y as eventY
       {  } -> `Int'#}
{# fun Fl_event_x_root as eventXRoot
       {  } -> `Int' #}
{# fun Fl_event_y_root as eventYRoot
       {  } -> `Int' #}
{# fun Fl_event_dx as eventDx
       {  } -> `Int' #}
{# fun Fl_event_dy as eventDy
       {  } ->  `Int' #}
{# fun Fl_get_mouse as getMouse'
   {
     alloca- `Int' peekIntConv* ,
     alloca- `Int' peekIntConv*
   } -> `()' #}
getMouse :: IO Position
getMouse = do
  (x_pos,y_pos) <- getMouse'
  return $ (Position (X x_pos) (Y y_pos))
{# fun Fl_event_clicks as eventClicks
       {  } -> `Int'#}
{# fun Fl_set_event_clicks as setEventClicks
       { `Int' } -> `()' #}
{# fun Fl_event_is_click as eventIsClick
       {  } -> `Bool' toBool #}
{# fun Fl_set_event_is_click as setEventIsClick
       { `Int' } -> `()' #}
{# fun Fl_event_button as eventButton
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
-- foldModifiers :: [KeyboardCode] -> CInt
-- foldModifiers codes =
--     let validKeysyms = map cFromEnum (filter (\c -> c `elem` validKeyboardStates) codes)
--     in
--       case validKeysyms of
--         [] -> (-1)
--         (k:ks) -> foldl (\accum k' -> accum .&. k') k ks
{# fun Fl_event_state as eventState
       {  } -> `[KeyboardCode]' unmaskKeysyms #}
{# fun Fl_contains_event_state as containsEventState
       {cFromEnum `KeyboardCode' } -> `Bool' toBool #}
{# fun Fl_event_key as eventKey
       {  } -> `KeyboardCode' cToEnum #}
{# fun Fl_event_original_key as eventOriginalKey
       {  } -> `KeyboardCode' cToEnum #}
{# fun Fl_event_key_pressed as eventKeyPressed
       {cFromEnum `KeyboardCode' } -> `Bool' toBool #}
{# fun Fl_get_key as getKey
       {cFromEnum `KeyboardCode' } -> `Bool' toBool #}
{# fun Fl_event_text as eventText
       {  } -> `String' #}
{# fun Fl_event_length as eventLength
       {  } -> `Int' #}
{# fun Fl_compose as compose
       { alloca- `Int' peekIntConv* } -> `Bool' toBool #}
{# fun Fl_compose_reset as composeReset
       {  } -> `()' #}
{# fun Fl_event_inside_region as eventInsideRegion'
       { `Int',`Int',`Int',`Int' } -> `Int' #}
eventInsideRegion :: Rectangle -> IO Event
eventInsideRegion (Rectangle
                   (Position
                    (X x_pos)
                    (Y y_pos))
                   (Size
                    (Width width)
                    (Height height))) =
    do
      eventNum <- eventInsideRegion' x_pos y_pos width height
      return $ toEnum eventNum
{# fun Fl_event_inside_widget as eventInsideWidget'
       { id `Ptr ()' } -> `Int' #}
eventInsideWidget :: Widget a -> IO Event
eventInsideWidget wp =
    withObject wp  (\ptr -> do
                      eventNum <- eventInsideWidget' (castPtr ptr)
                      return $ toEnum eventNum)
{# fun Fl_test_shortcut as testShortcut
       { id `FlShortcut' } -> `Bool' toBool #}
{# fun Fl_handle as handle'
       { `Int',id `Ptr ()' } -> `Int' #}
handle :: Event -> Window a -> IO Int
handle e wp =
    withObject wp (handle' (cFromEnum e))
{# fun Fl_handle_ as handle_'
       { `Int',id `Ptr ()' } -> `Int' #}
handle_ :: Event -> Window a -> IO Int
handle_ e wp =
    withObject wp (handle_' (cFromEnum e))
{# fun Fl_belowmouse as belowmouse
       {  } -> `Widget ()' unsafeToObject #}
{# fun Fl_set_belowmouse as setBelowmouse'
       { id `Ptr ()' } -> `()' #}
setBelowmouse :: Widget a -> IO ()
setBelowmouse wp = withObject wp setBelowmouse'
{# fun Fl_pushed as pushed
       {  } -> `Widget ()' unsafeToObject #}
{# fun Fl_set_pushed as setPushed'
       { id `Ptr ()' } -> `()' #}
setPushed :: Widget a -> IO ()
setPushed wp = withObject wp setPushed'
{# fun Fl_focus as focus
       {  } -> `Widget ()' unsafeToObject #}
{# fun Fl_set_focus as setFocus'
       { id `Ptr ()' } -> `()' #}
setFocus :: Widget a -> IO ()
setFocus wp = withObject wp setFocus'
{# fun Fl_add_handler as addHandler'
       { id `FunPtr GlobalEventHandlerPrim' } -> `()' #}
{# fun Fl_remove_handler as removeHandler'
       { id `FunPtr GlobalEventHandlerPrim' } -> `()' #}
setHandler :: GlobalEventHandlerF -> IO ()
setHandler eh = do
  newGlobalEventHandler <- toGlobalEventHandlerPrim eh
  curr <- atomically $ do
                  old <- readTVar ptrToGlobalEventHandler
                  writeTVar ptrToGlobalEventHandler newGlobalEventHandler
                  return old
  removeHandler' curr
  addHandler' newGlobalEventHandler

{# fun Fl_set_event_dispatch as setEventDispatch'
       { id `Ptr (FunPtr EventDispatchPrim)' } -> `()' #}
{# fun Fl_event_dispatch as eventDispatch'
       {  } -> `FunPtr EventDispatchPrim' id #}
eventDispatch :: IO (EventDispatchF a)
eventDispatch =
    do
      funPtr <- eventDispatch'
      return (\e window ->
                  withObject
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
                      in do
                      obj <- toObject ptr
                      result <- ed eventEnum obj
                      return $ fromIntegral result
                    )
      callbackPtr <-  wrapEventDispatchPrim toPrim
      ptrToCallbackPtr <- new callbackPtr
      poke ptrToCallbackPtr callbackPtr
      setEventDispatch' ptrToCallbackPtr
{# fun Fl_copy as copy
       { `String',`Int' } -> `()' #}
{# fun Fl_copy_with_destination as copyWithDestination
       { `String',`Int',`Int' } -> `()' #}
{# fun Fl_paste_with_source as pasteWithSource
       { id `Ptr ()',`Int' } -> `()' #}
paste :: Widget a -> Maybe Int -> IO ()
paste widget (Just clipboard) = withObject widget ((flip pasteWithSource) clipboard)
paste widget Nothing          = withObject widget ((flip pasteWithSource) 0)

{# fun Fl_dnd as dnd
       {  } -> `Int' #}
{# fun Fl_x as x
       {  } -> `Int' #}
{# fun Fl_y as y
       {  } -> `Int' #}
{# fun Fl_w as w
       {  } -> `Int' #}
{# fun Fl_h as h
       {  } -> `Int' #}
{# fun Fl_screen_count as screenCount
       {  } -> `Int' #}

{# fun Fl_screen_xywh as screenXYWH
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv*
       } -> `()' #}
{# fun Fl_screen_xywh_with_mxmy as screenXYWYWithMXMY
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int',
         `Int'
       } -> `()' #}
{# fun Fl_screen_xywh_with_n as screenXYWNWithN
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int'
       } -> `()' #}
{# fun Fl_screen_xywh_with_mxmymwmh as screenXYWHWithNMXMYMWMH
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

screenBounds :: Maybe ScreenLocation -> IO Rectangle
screenBounds location =
    case location of
      (Just (Intersect (Rectangle (Position (X x_pos) (Y y_pos)) (Size (Width width) (Height height))))) ->
          screenXYWHWithNMXMYMWMH x_pos y_pos width height >>= return . toRectangle
      (Just (ScreenPosition (Position (X x_pos) (Y y_pos)))) ->
          screenXYWYWithMXMY x_pos y_pos >>= return . toRectangle
      (Just (ScreenNumber n)) ->
          screenXYWNWithN n >>= return . toRectangle
      Nothing ->
          screenXYWH >>= return . toRectangle

{# fun Fl_screen_dpi as screenDpi'
       { alloca- `Float' peekFloatConv*,
         alloca- `Float' peekFloatConv* }
           -> `()' #}
{# fun Fl_screen_dpi_with_n as screenDpiWithN'
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

{# fun Fl_screen_work_area_with_mx_my as screenWorkAreaWithMXMY'
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int',
         `Int'
       }
         -> `()' #}
{# fun Fl_screen_work_area_with_n as screenWorkAreaWithN'
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int'
       }
        -> `()' #}
{# fun Fl_screen_work_area as screenWorkArea'
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
setColorRgb c r g b = {#call Fl_set_color_rgb as fl_set_color_rgb #}
                        (cFromColor c)
                        (fromIntegral r)
                        (fromIntegral g)
                        (fromIntegral b)
{# fun Fl_set_color as setColor
       { cFromColor `Color',`Int' } -> `()' #}
{# fun Fl_get_color as getColor
       { cFromColor `Color' } -> `Int' #}
{# fun Fl_get_color_rgb as getColorRgb
       {
         cFromColor `Color',
         alloca- `Word8' peekIntConv*,
         alloca- `Word8' peekIntConv*,
         alloca- `Word8' peekIntConv*
       } -> `()' #}
{# fun Fl_free_color as freeColor'
      { cFromColor `Color' } -> `()' #}
{# fun Fl_free_color_with_overlay as freeColorWithOverlay'
       { cFromColor `Color', `Int' } -> `()' #}
removeFromColormap :: Maybe Int -> Color -> IO ()
removeFromColormap (Just overlay) c = freeColorWithOverlay' c overlay
removeFromColormap Nothing c = freeColor' c
{# fun Fl_get_font as getFont
       { cFromFont `Font' } -> `String' #}
{# fun Fl_get_font_name_with_attributes as getFontNameWithAttributes'
       { cFromFont `Font', alloca- `Maybe FontAttribute' toAttribute* } -> `String' #}
toAttribute :: Ptr CInt -> IO (Maybe FontAttribute)
toAttribute ptr =
        do
          attributeCode <- peekIntConv ptr
          return $ cToFontAttribute attributeCode
getFontName :: Font -> IO (String, Maybe FontAttribute)
getFontName f = getFontNameWithAttributes' f
{# fun Fl_get_font_sizes as getFontSizes
       { cFromFont `Font', alloca- `Int' peekIntConv* } -> `Int' #}
{# fun Fl_set_font_by_string as setFontByString
       { cFromFont `Font',`String' } -> `()' #}
{# fun Fl_set_font_by_font as setFontByFont
       { cFromFont `Font',cFromFont `Font' } -> `()' #}
{# fun Fl_set_fonts as setFonts
       {  } -> `Font' cToFont #}
{# fun Fl_set_fonts_with_string as setFontsWithString
       { `String' } -> `Font' cToFont #}
{# fun Fl_set_labeltype as setLabeltype'
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
                         in do
                         obj <- toObject rawPtr
                         drawF obj rectangle alignType
                     )
        measureFPrim = (\rawPtr wPtr hPtr ->
                          do
                           obj <- toObject rawPtr
                           (Size (Width width) (Height height)) <- measureF obj
                           poke wPtr (fromIntegral width)
                           poke hPtr (fromIntegral height)
                       )
    in
      do
        wrappedDrawFPrim <- wrapLabelDrawFPrim drawFPrim
        wrappedMeasureFPrim <- wrapLabelMeasureFPrim measureFPrim
        setLabeltype' label wrappedDrawFPrim wrappedMeasureFPrim

{# fun Fl_get_boxtype as getBoxtype'
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

{# fun Fl_set_boxtype as setBoxtype'
       {
         cFromEnum `Boxtype',
         id `FunPtr BoxDrawFPrim',
         `Word8',
         `Word8',
         `Word8',
         `Word8'
       } -> `()' #}
{# fun Fl_set_boxtype_by_boxtype as setBoxtypeByBoxtype'
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

{# fun Fl_box_dx as boxDx
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun Fl_box_dy as boxDy
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun Fl_box_dw as boxDw
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun Fl_box_dh as boxDh
       { cFromEnum `Boxtype' } -> `Int' #}
{# fun Fl_draw_box_active as drawBoxActive
       {  } -> `Bool' toBool #}
{# fun Fl_event_shift as eventShift
       {  } -> `Bool' toBool #}
{# fun Fl_event_ctrl as eventCtrl
       {  } -> `Bool' toBool #}
{# fun Fl_event_command as eventCommand
       {  } -> `Bool' toBool #}
{# fun Fl_event_alt as eventAlt
       {  } -> `Bool' toBool #}
{# fun Fl_event_buttons as eventButtons
       {  } -> `Bool' toBool #}
{# fun Fl_event_button1 as eventButton1
       {  } -> `Bool' toBool #}
{# fun Fl_event_button2 as eventButton2
       {  } -> `Bool' toBool #}
{# fun Fl_event_button3 as eventButton3
      {  } -> `Bool' toBool #}
release :: IO ()
release = {#call Fl_release as fl_release #}
setVisibleFocus :: Int -> IO ()
setVisibleFocus = {#call Fl_set_visible_focus as fl_set_visible_focus #} . fromIntegral
visibleFocus :: IO Int
visibleFocus = {#call Fl_visible_focus as fl_visible_focus #} >>= return . fromIntegral
setDndTextOps :: Bool -> IO ()
setDndTextOps =  {#call Fl_set_dnd_text_ops as fl_set_dnd_text_ops #} . fromBool
dndTextOps :: IO Option
dndTextOps = {#call Fl_dnd_text_ops as fl_dnd_text_ops #} >>= return . cToEnum
deleteWidget :: Widget a -> IO ()
deleteWidget wptr = withObject wptr {#call Fl_delete_widget as fl_delete_widget #}
doWidgetDeletion :: IO ()
doWidgetDeletion = {#call Fl_do_widget_deletion as fl_do_widget_deletion #}
watchWidgetPointer :: Widget a -> IO ()
watchWidgetPointer wp = withObject wp {#call Fl_watch_widget_pointer as fl_Watch_widget_Pointer #}
releaseWidgetPointer :: Widget a -> IO ()
releaseWidgetPointer wp = withObject wp {#call Fl_release_widget_pointer as fl_release_widget_pointer #}
clearWidgetPointer :: Widget a -> IO ()
clearWidgetPointer wp = withObject wp {#call Fl_clear_widget_pointer as fl_Clear_Widget_Pointer #}
