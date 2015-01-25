{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
module Graphics.UI.FLTK.LowLevel.FL
    (
     Option(..),
     run,
     check,
     ready,
     option,
     setOption,
     addAwakeHandler,
     getAwakeHandler_,
     display,
     ownColormap,
     getSystemColors,
     foreground,
     background,
     background2,
     setScheme,
     isScheme,
     setFirstWindow,
     nextWindow,
     setGrab,
     getMouse,
     eventStates,
     extract,
     extractEventStates,
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
#if !defined(__APPLE__)
     glVisual,
     glVisualWithAlist,
#endif
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
     enableIm,
     disableIm,
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
#if !defined(__APPLE__)
     removeFromColormap,
#endif
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
import C2HS hiding (cFromEnum, cToBool,cToEnum)
import Data.IORef
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy hiding (
                                                   setVisibleFocus,
                                                   handle,
                                                   redraw,
                                                   flush,
                                                   testShortcut,
                                                   copy,
                                                   setColor,
                                                   getColor,
                                                   focus,
                                                   display
                                                  )
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified System.IO.Unsafe as Unsafe (unsafePerformIO)
#c
 enum Option {
   OptionArrowFocus = OPTION_ARROW_FOCUS,
   OptionVisibleFocus = OPTION_VISIBLE_FOCUS,
   OptionDndText = OPTION_DND_TEXT,
   OptionShowTooltips = OPTION_SHOW_TOOLTIPS,
   OptionLast = OPTION_LAST
 };
#endc

{#enum Option {} deriving (Show) #}

ptrToGlobalEventHandler :: IORef (FunPtr GlobalEventHandlerPrim)
ptrToGlobalEventHandler = Unsafe.unsafePerformIO $ do
                            initialHandler <- toGlobalEventHandlerPrim (\_ -> return (-1))
                            newIORef initialHandler

type EventDispatchPrim = (CInt ->
                          Ptr () ->
                          IO CInt)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim ->
                                 IO (FunPtr EventDispatchPrim)
foreign import ccall "dynamic"
        unwrapEventDispatchPrim :: FunPtr EventDispatchPrim -> EventDispatchPrim

run :: IO Int
run = {#call Fl_run as fl_run #} >>= return . fromIntegral

check :: IO Int
check = {#call Fl_check as fl_check #} >>= return . fromIntegral

ready :: IO Int
ready = {#call Fl_ready as fl_ready #} >>= return . fromIntegral


option :: Option -> IO Bool
option o = {#call Fl_option as fl_option #} (cFromEnum o) >>= \(c::CInt) -> return $ cToBool $ ((fromIntegral c) :: Int)

setOption :: Option -> Bool -> IO ()
setOption o t = {#call Fl_set_option as fl_set_option #} (cFromEnum o) (Graphics.UI.FLTK.LowLevel.Utils.cFromBool t)

unsafeToCallbackPrim :: GlobalCallback -> FunPtr CallbackPrim
unsafeToCallbackPrim = (Unsafe.unsafePerformIO) . toGlobalCallbackPrim

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
#if !defined(__APPLE__)
{# fun Fl_gl_visual as glVisual
  {cFromEnum `Mode'} -> `Int' #}
{# fun Fl_gl_visual_with_alist as glVisualWithAlist
  {cFromEnum `Mode', id `Ptr CInt'} -> `Int' #}
#endif

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
-- | In the function below marked `pure`, c2hs uses `unsafePerformIO` unqualified causing
-- | a compile error if it imported qualifed. This is a workaround.
unsafePerformIO :: IO a -> a
unsafePerformIO = Unsafe.unsafePerformIO
{# fun pure Fl_scheme as scheme
  {} -> `String' #}
setScheme :: String -> IO Int
setScheme sch = withCString sch $ \str -> {#call Fl_set_scheme as fl_set_scheme #} str >>= return . fromIntegral
isScheme :: String -> IO Bool
isScheme sch = withCString sch $ \str -> {#call Fl_is_scheme as fl_is_scheme #} str >>= return . toBool
{# fun Fl_wait as wait
       {  } -> `Int' #}
{# fun Fl_set_wait as setWait
       { `Double' } -> `Double' #}
{# fun Fl_readqueue as readqueue
       {  } -> `Ref Widget' unsafeToRef #}
{# fun Fl_add_timeout as addTimeout
       { `Double', unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_repeat_timeout as repeatTimeout
      { `Double',unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_has_timeout as hasTimeout
       { unsafeToCallbackPrim `GlobalCallback' } -> `Int' #}
{# fun Fl_remove_timeout as removeTimeout
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_add_check as addCheck
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_has_check as hasCheck
       { unsafeToCallbackPrim `GlobalCallback' } -> `Int' #}
{# fun Fl_remove_check as removeCheck
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_add_idle as addIdle
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_has_idle as hasIdle
       { unsafeToCallbackPrim `GlobalCallback' } -> `Int' #}
{# fun Fl_remove_idle as removeIdle
       { unsafeToCallbackPrim `GlobalCallback' } -> `()' supressWarningAboutRes #}
{# fun Fl_damage as damage
       {  } -> `Int' #}
{# fun Fl_redraw as redraw
       {  } -> `()' supressWarningAboutRes #}
{# fun Fl_flush as flush
       {  } -> `()' supressWarningAboutRes #}
{# fun Fl_first_window as firstWindow
       {  } -> `Ref Window' unsafeToRef #}
{# fun Fl_set_first_window as setFirstWindow'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setFirstWindow :: (Parent a Window) => Ref a -> IO ()
setFirstWindow wp =
    withRef wp setFirstWindow'
{# fun Fl_next_window as nextWindow'
       { id `Ptr ()' } -> `Ref Window' unsafeToRef #}
nextWindow :: (Parent a Window) => Ref a -> IO (Ref Window)
nextWindow currWindow =
    withRef currWindow nextWindow'
{# fun Fl_modal as modal
       {  } -> `Ref Window' unsafeToRef #}
{# fun Fl_grab as grab
       {  } -> `Ref Window' unsafeToRef #}
{# fun Fl_set_grab as setGrab'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setGrab :: (Parent a Window) => Ref a -> IO ()
setGrab wp = withRef wp setGrab'
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
       { `Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_event_is_click as eventIsClick
       {  } -> `Bool' toBool #}
{# fun Fl_set_event_is_click as setEventIsClick
       { `Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_event_button as eventButton
       {  } -> `MouseButton' cToEnum #}
eventStates :: [EventState]
eventStates = [
               Kb_ShiftState,
               Kb_CapsLockState,
               Kb_CtrlState,
               Kb_AltState,
               Kb_NumLockState,
               Kb_MetaState,
               Kb_ScrollLockState,
               Mouse_Button1State,
               Mouse_Button2State,
               Mouse_Button3State
              ]
extractEventStates :: CInt -> [EventState]
extractEventStates = extract eventStates
-- foldModifiers :: [KeyboardCode] -> CInt
-- foldModifiers codes =
--     let validKeysyms = map cFromEnum (filter (\c -> c `elem` validKeyboardStates) codes)
--     in
--       case validKeysyms of
--         [] -> (-1)
--         (k:ks) -> foldl (\accum k' -> accum .&. k') k ks
{# fun Fl_event_state as eventState
       {  } -> `[EventState]' extractEventStates #}
{# fun Fl_contains_event_state as containsEventState
       {cFromEnum `EventState' } -> `Bool' toBool #}
{# fun Fl_event_key as eventKey
       {  } -> `KeyType' cToKeyType #}
{# fun Fl_event_original_key as eventOriginalKey
       {  } -> `KeyType' cToKeyType #}
{# fun Fl_event_key_pressed as eventKeyPressed
       {cFromKeyType `KeyType' } -> `Bool' toBool #}
{# fun Fl_get_key as getKey
       {cFromKeyType `KeyType' } -> `Bool' toBool #}
{# fun Fl_event_text as eventText
       {  } -> `String' #}
{# fun Fl_event_length as eventLength
       {  } -> `Int' #}
{# fun Fl_compose as compose
       { alloca- `Int' peekIntConv* } -> `Bool' toBool #}
{# fun Fl_compose_reset as composeReset
       {  } -> `()' supressWarningAboutRes #}
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
eventInsideWidget :: (Parent a Widget) => Ref a -> IO Event
eventInsideWidget wp =
    withRef wp  (\ptr -> do
                      eventNum <- eventInsideWidget' (castPtr ptr)
                      return $ toEnum eventNum)
{# fun Fl_test_shortcut as testShortcut
       { id `FlShortcut' } -> `Bool' toBool #}
{# fun Fl_enable_im as enableIm
       {} -> `()' supressWarningAboutRes #}
{# fun Fl_disable_im as disableIm
       {} -> `()' supressWarningAboutRes #}
{# fun Fl_handle as handle'
       { `Int',id `Ptr ()' } -> `Int' #}
handle :: (Parent a Window) =>  Event -> Ref a -> IO Int
handle e wp =
    withRef wp (handle' (cFromEnum e))
{# fun Fl_handle_ as handle_'
       { `Int',id `Ptr ()' } -> `Int' #}
handle_ :: (Parent a Window) =>  Event -> Ref a -> IO Int
handle_ e wp =
    withRef wp (handle_' (cFromEnum e))
{# fun Fl_belowmouse as belowmouse
       {  } -> `Ref Widget' unsafeToRef #}
{# fun Fl_set_belowmouse as setBelowmouse'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setBelowmouse :: (Parent a Widget) => Ref a -> IO ()
setBelowmouse wp = withRef wp setBelowmouse'
{# fun Fl_pushed as pushed
       {  } -> `Ref Widget' unsafeToRef #}
{# fun Fl_set_pushed as setPushed'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setPushed :: (Parent a Widget) => Ref a -> IO ()
setPushed wp = withRef wp setPushed'
{# fun Fl_focus as focus
       {  } -> `Ref Widget' unsafeToRef #}
{# fun Fl_set_focus as setFocus'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setFocus :: (Parent a Widget) => Ref a -> IO ()
setFocus wp = withRef wp setFocus'
{# fun Fl_add_handler as addHandler'
       { id `FunPtr GlobalEventHandlerPrim' } -> `()' supressWarningAboutRes #}
{# fun Fl_remove_handler as removeHandler'
       { id `FunPtr GlobalEventHandlerPrim' } -> `()' supressWarningAboutRes #}
setHandler :: GlobalEventHandlerF -> IO ()
setHandler eh = do
  newGlobalEventHandler <- toGlobalEventHandlerPrim eh
  curr <- do
    old <- readIORef ptrToGlobalEventHandler
    writeIORef ptrToGlobalEventHandler newGlobalEventHandler
    return old
  removeHandler' curr
  addHandler' newGlobalEventHandler

{# fun Fl_set_event_dispatch as setEventDispatch'
       { id `Ptr (FunPtr EventDispatchPrim)' } -> `()' supressWarningAboutRes #}
{# fun Fl_event_dispatch as eventDispatch'
       {  } -> `FunPtr EventDispatchPrim' id #}
eventDispatch :: (Parent a Widget) => IO (Event -> Ref a -> IO (Int))
eventDispatch =
    do
      funPtr <- eventDispatch'
      return (\e window ->
                  withRef
                   window
                    (\ptr ->
                         let eventNum = fromIntegral (fromEnum e)
                             fun = unwrapEventDispatchPrim funPtr
                         in fun eventNum (castPtr ptr) >>=
                            return . fromIntegral
                    )
             )

setEventDispatch :: (Parent a Widget) => (Event -> Ref a -> IO Int) -> IO ()
setEventDispatch ed = do
    do
      let toPrim = (\e ptr ->
                      let eventEnum = toEnum $ fromIntegral e
                      in do
                      obj <- toRef ptr
                      result <- ed eventEnum obj
                      return $ fromIntegral result
                    )
      callbackPtr <-  wrapEventDispatchPrim toPrim
      ptrToCallbackPtr <- new callbackPtr
      poke ptrToCallbackPtr callbackPtr
      setEventDispatch' ptrToCallbackPtr
{# fun Fl_copy as copy
       { `String',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_copy_with_destination as copyWithDestination
       { `String',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_paste_with_source as pasteWithSource
       { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
paste :: (Parent a Widget) => Ref a -> Maybe Int -> IO ()
paste widget (Just clipboard) = withRef widget ((flip pasteWithSource) clipboard)
paste widget Nothing          = withRef widget ((flip pasteWithSource) 0)

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
       } -> `()'  #}
{# fun Fl_screen_xywh_with_mxmy as screenXYWYWithMXMY
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int',
         `Int'
       } -> `()'  #}
{# fun Fl_screen_xywh_with_n as screenXYWNWithN
       {
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         alloca- `Int' peekIntConv* ,
         `Int'
       } -> `()'  #}
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
       { cFromColor `Color',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_get_color as getColor
       { cFromColor `Color' } -> `Int' #}
{# fun Fl_get_color_rgb as getColorRgb
       {
         cFromColor `Color',
         alloca- `Word8' peekIntConv*,
         alloca- `Word8' peekIntConv*,
         alloca- `Word8' peekIntConv*
       } -> `()' supressWarningAboutRes #}

#if !defined(__APPLE__)
{# fun Fl_free_color as freeColor'
      { cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_free_color_with_overlay as freeColorWithOverlay'
       { cFromColor `Color', `Int' } -> `()' supressWarningAboutRes #}
removeFromColormap :: Maybe Int -> Color -> IO ()
removeFromColormap (Just overlay) c = freeColorWithOverlay' c overlay
removeFromColormap Nothing c = freeColor' c
#endif
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
       { cFromFont `Font',`String' } -> `()' supressWarningAboutRes #}
{# fun Fl_set_font_by_font as setFontByFont
       { cFromFont `Font',cFromFont `Font' } -> `()' supressWarningAboutRes #}
{# fun Fl_set_fonts as setFonts
       {  } -> `Font' cToFont #}
{# fun Fl_set_fonts_with_string as setFontsWithString
       { `String' } -> `Font' cToFont #}
{# fun Fl_get_boxtype as getBoxtype'
       { cFromEnum `Boxtype' } -> `FunPtr BoxDrawFPrim' id #}

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
       } -> `()' supressWarningAboutRes #}
{# fun Fl_set_boxtype_by_boxtype as setBoxtypeByBoxtype'
       {
         cFromEnum `Boxtype',
         cFromEnum `Boxtype'
       } -> `()' supressWarningAboutRes #}

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
deleteWidget :: (Parent a Widget) => Ref a -> IO ()
deleteWidget wptr =
  swapRef wptr $ \ptr -> do
    {#call Fl_delete_widget as fl_delete_widget #} ptr
    return nullPtr
doWidgetDeletion :: IO ()
doWidgetDeletion = {#call Fl_do_widget_deletion as fl_do_widget_deletion #}
watchWidgetPointer :: (Parent a Widget) => Ref a -> IO ()
watchWidgetPointer wp = withRef wp {#call Fl_watch_widget_pointer as fl_Watch_widget_Pointer #}
releaseWidgetPointer :: (Parent a Widget) => Ref a -> IO ()
releaseWidgetPointer wp = withRef wp {#call Fl_release_widget_pointer as fl_release_widget_pointer #}
clearWidgetPointer :: (Parent a Widget) => Ref a -> IO ()
clearWidgetPointer wp = withRef wp {#call Fl_clear_widget_pointer as fl_Clear_Widget_Pointer #}
