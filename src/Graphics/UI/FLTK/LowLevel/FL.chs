{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}

module Graphics.UI.FLTK.LowLevel.FL
    (
     Option(..),
     ClipboardContents(..),
     PasteSource(..),
     scrollbarSize,
     setScrollbarSize,
     selectionOwner,
     setSelectionOwner,
     run,
     replRun,
     check,
     ready,
     option,
     setOption,
     addAwakeHandler_,
     getAwakeHandler_,
     display,
     ownColormap,
     getSystemColors,
     foreground,
     background,
     background2,
     setScheme,
     getScheme,
     reloadScheme,
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
#if !defined(__APPLE__) && defined(GLSUPPORT)
     glVisual,
     glVisualWithAlist,
#endif
     wait,
     setWait,
     waitFor,
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
     setFontToString,
     setFontToFont,
     setFonts,
     -- * File Descriptor Callbacks
     addFd,
     addFdWhen,
     removeFd,
     removeFdWhen,
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
     eventClipboardContents,
#if FLTK_API_VERSION >= 10304
     setBoxColor,
     boxColor,
     abiVersion,
     apiVersion,
     abiCheck,
     localCtrl,
     localMeta,
     localAlt,
     localShift
#ifdef GLSUPPORT
     , useHighResGL
     , setUseHighResGL
#endif
#endif
    )
where
#include "Fl_C.h"
import C2HS hiding (cFromEnum, cToBool,cToEnum,cFromBool)
import Data.IORef

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
                                                   display,
                                                   setScrollbarSize
                                                  )
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import qualified Data.Text.Foreign as TF
import qualified System.IO.Unsafe as Unsafe (unsafePerformIO)
import Control.Exception(catch, throw, AsyncException(UserInterrupt))
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

-- | Contents of the clipboard following a copy or cut. Can be either an <./Graphics-UI-FLTK-LowLevel-Image.html Image> or plain 'T.Text'.
data ClipboardContents =
  ClipboardContentsImage (Maybe (Ref Image))
  | ClipboardContentsPlainText (Maybe T.Text)

data PasteSource =
  PasteSourceSelectionBuffer
  | PasteSourceClipboardPlainText
  | PasteSourceClipboardImage

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
addAwakeHandler_ :: GlobalCallback -> IO (Either AwakeRingFull ())
addAwakeHandler_ awakeHandler =
    do
      callbackPtr <-  toGlobalCallbackPrim awakeHandler
      res <- addAwakeHandler' callbackPtr nullPtr
      return (successOrAwakeRingFull res)

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
  {} -> `T.Text' unsafeFromCString #}

display :: T.Text -> IO ()
display text = TF.withCStringLen text $ \(str,_) -> {#call Fl_display as fl_display #} str
{# fun Fl_visual as visual
  {cFromEnum `Mode'} -> `Bool' cToBool #}
#if !defined(__APPLE__) && defined(GLSUPPORT)
-- | Only available if on a non OSX platform and if the 'opengl' flag is set (stack build --flag fltkhs:opengl).
{# fun Fl_gl_visual as glVisual
  {cFromEnum `Mode'} -> `Bool' cToBool #}
-- | Only available if on a non OSX platform and if the 'opengl' flag is set (stack build --flag fltkhs:opengl).
{# fun Fl_gl_visual_with_alist as glVisualWithAlist
  {cFromEnum `Mode', id `Ptr CInt'} -> `Bool' cToBool #}
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
{# fun pure Fl_scheme as getScheme
  {} -> `T.Text' unsafeFromCString #}
setScheme :: T.Text -> IO Int
setScheme sch = TF.withCStringLen sch $ \(str,_) -> {#call Fl_set_scheme as fl_set_scheme #} str >>= return . fromIntegral
{# fun pure Fl_reload_scheme as reloadScheme {} -> `Int' #}
isScheme :: T.Text -> IO Bool
isScheme sch = TF.withCStringLen sch $ \(str,_) -> {#call Fl_is_scheme as fl_is_scheme #} str >>= return . toBool
{# fun Fl_wait as wait
       {  } -> `Int' #}
{# fun Fl_set_wait as waitFor
       { `Double' } -> `Double' #}

setWait :: Double -> IO Double
setWait = waitFor
{# fun Fl_scrollbar_size as scrollbarSize
       {  } -> `Int' #}
{# fun Fl_set_scrollbar_size as setScrollbarSize
       { `Int' } -> `()' #}

{# fun Fl_readqueue as readqueue
       {  } -> `Maybe (Ref Widget)' unsafeToMaybeRef #}
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
       {  } -> `Maybe (Ref Window)' unsafeToMaybeRef #}
{# fun Fl_set_first_window as setFirstWindow'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setFirstWindow :: (Parent a Window) => Ref a -> IO ()
setFirstWindow wp =
    withRef wp setFirstWindow'
{# fun Fl_next_window as nextWindow'
       { id `Ptr ()' } -> `Maybe (Ref Window)' unsafeToMaybeRef #}
nextWindow :: (Parent a Window) => Ref a -> IO (Maybe (Ref Window))
nextWindow currWindow =
    withRef currWindow nextWindow'
{# fun Fl_modal as modal
       {  } -> `Maybe (Ref Window)' unsafeToMaybeRef #}
{# fun Fl_grab as grab
       {  } -> `Maybe (Ref Window)' unsafeToMaybeRef #}
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

{# fun Fl_event_button as eventButton'
       {  } -> `Int' #}
eventButton :: IO (Maybe MouseButton)
eventButton = do
  mb <- eventButton'
  case mb of
    mb' | mb' == (fromEnum Mouse_Left) -> return (Just Mouse_Left)
    mb' | mb' == (fromEnum Mouse_Middle) -> return (Just Mouse_Right)
    mb' | mb' == (fromEnum Mouse_Right) -> return (Just Mouse_Middle)
    _ -> return Nothing

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
       {  } -> `T.Text' unsafeFromCString #}
{# fun Fl_event_length as eventLength
       {  } -> `Int' #}

{# fun Fl_event_clipboard as flEventClipboard' { } -> `Ptr ()' #}
{# fun Fl_event_clipboard_type as flEventClipboardType' { } -> `T.Text' unsafeFromCString #}
eventClipboardContents :: IO (Maybe ClipboardContents)
eventClipboardContents = do
  typeString <- flEventClipboardType'
  if (T.length typeString == 0)
  then return Nothing
  else case typeString of
         s | (T.unpack s == "Fl::clipboard_image") -> do
             stringContents <- flEventClipboard' >>= cStringToText . castPtr
             return (if (T.length stringContents == 0)
                     then (Just (ClipboardContentsPlainText Nothing))
                     else (Just (ClipboardContentsPlainText (Just stringContents))))
         s | (T.unpack s == "Fl::clipboard_plain_text") -> do
             imageRef <- flEventClipboard' >>= toMaybeRef
             return (Just (ClipboardContentsImage imageRef))
         _ -> error "eventClipboardContents :: The type of the clipboard contents must be either the string \"Fl::clipboard_image\" or \"Fl::clipboard_plain_image\"."

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
handle :: (Parent a Window) =>  Event -> Ref a -> IO (Either UnknownEvent ())
handle e wp =
    withRef wp (handle' (cFromEnum e)) >>= return . successOrUnknownEvent
{# fun Fl_handle_ as handle_'
       { `Int',id `Ptr ()' } -> `Int' #}
handle_ :: (Parent a Window) =>  Event -> Ref a -> IO (Either UnknownEvent ())
handle_ e wp =
    withRef wp (handle_' (cFromEnum e)) >>= return . successOrUnknownEvent
{# fun Fl_belowmouse as belowmouse
       {  } -> `Maybe (Ref Widget)' unsafeToMaybeRef #}
{# fun Fl_set_belowmouse as setBelowmouse'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setBelowmouse :: (Parent a Widget) => Ref a -> IO ()
setBelowmouse wp = withRef wp setBelowmouse'
{# fun Fl_pushed as pushed'
       {  } -> `Ptr ()' #}
pushed :: IO (Maybe (Ref Widget))
pushed = pushed' >>= toMaybeRef
{# fun Fl_set_pushed as setPushed'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setPushed :: (Parent a Widget) => Ref a -> IO ()
setPushed wp = withRef wp setPushed'
{# fun Fl_focus as focus
       {  } -> `Maybe (Ref Widget)' unsafeToMaybeRef #}
{# fun Fl_set_focus as setFocus'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setFocus :: (Parent a Widget) => Ref a -> IO ()
setFocus wp = withRef wp setFocus'
{# fun Fl_selection_owner as selectionOwner
       {  } -> `Maybe (Ref Widget)' unsafeToMaybeRef #}
{# fun Fl_set_selection_owner as setSelection_Owner'
       { id `Ptr ()' } -> `()' supressWarningAboutRes #}
setSelectionOwner :: (Parent a Widget) => Ref a -> IO ()
setSelectionOwner wp = withRef wp setSelection_Owner'
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
eventDispatch :: (Parent a Widget) =>
   IO (Event -> Ref a -> IO (Either UnknownEvent ()))
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
                            return . successOrUnknownEvent . fromIntegral
                    )
             )

setEventDispatch ::
    (Parent a Widget) =>
    (Event -> Ref a -> IO (Either UnknownEvent ())) -> IO ()
setEventDispatch ed = do
    do
      let toPrim = (\e ptr ->
                      let eventEnum = toEnum $ fromIntegral e
                      in do
                      obj <- toRef ptr
                      result <- ed eventEnum obj
                      case result of
                        Left _ -> return 0
                        _ -> return 1
                    )
      callbackPtr <-  wrapEventDispatchPrim toPrim
      ptrToCallbackPtr <- new callbackPtr
      poke ptrToCallbackPtr callbackPtr
      setEventDispatch' ptrToCallbackPtr
{# fun Fl_copy as copy
       { unsafeToCString `T.Text',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_copy_with_destination as copyWithDestination
       { unsafeToCString `T.Text',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_paste_with_source as pasteWithSource
       { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_paste_with_source_type as pasteWithSourceType
       { id `Ptr ()',`Int', unsafeToCString `T.Text' } -> `()' supressWarningAboutRes #}
paste :: (Parent a Widget) => Ref a -> PasteSource -> IO ()
paste widget PasteSourceSelectionBuffer = withRef widget (\widgetPtr -> pasteWithSource widgetPtr 0)
paste widget PasteSourceClipboardPlainText =
  withRef widget (\widgetPtr -> pasteWithSourceType widgetPtr 1 (T.pack "Fl::clipboard_plain_text"))
paste widget PasteSourceClipboardImage =
  withRef widget (\widgetPtr -> pasteWithSourceType widgetPtr 1 (T.pack "Fl::clipboard_image"))

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

setColorRgb :: Color -> Word8 -> Word8 -> Word8 -> IO ()
setColorRgb c r g b = {#call Fl_set_color_rgb as fl_set_color_rgb #}
                        (cFromColor c)
                        (fromIntegral r)
                        (fromIntegral g)
                        (fromIntegral b)
{# fun Fl_set_color as setColor
       { cFromColor `Color',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_get_color as getColor
       { cFromColor `Color' } -> `Int' #}
{# fun Fl_get_color_rgb as getColorRgb'
       {
         cFromColor `Color',
         alloca- `CUChar' peekIntConv*,
         alloca- `CUChar' peekIntConv*,
         alloca- `CUChar' peekIntConv*
       } -> `()' supressWarningAboutRes #}
getColorRgb :: Color -> IO RGB
getColorRgb c = do
   (_,r,g,b) <- getColorRgb' c
   return (r,g,b)

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
       { cFromFont `Font' } -> `T.Text' unsafeFromCString #}
{# fun Fl_get_font_name_with_attributes as getFontNameWithAttributes'
       { cFromFont `Font', alloca- `Maybe FontAttribute' toAttribute* } -> `T.Text' unsafeFromCString #}
toAttribute :: Ptr CInt -> IO (Maybe FontAttribute)
toAttribute ptr =
        do
          attributeCode <- peekIntConv ptr
          return $ cToFontAttribute attributeCode
getFontName :: Font -> IO (T.Text, Maybe FontAttribute)
getFontName f = getFontNameWithAttributes' f
{# fun Fl_get_font_sizes as getFontSizes'
       { cFromFont `Font', id `Ptr (Ptr CInt)' } -> `CInt' #}
getFontSizes :: Font -> IO [FontSize]
getFontSizes font = do
   arrPtr <- (newArray [] :: IO (Ptr (Ptr CInt)))
   arrLength <- getFontSizes' font arrPtr
   zeroth <- peekElemOff arrPtr 0
   if (arrLength == 0) then return []
   else do
     (sizes :: [CInt]) <-
         mapM
           (
            \offset -> do
               size <- peek (advancePtr zeroth offset)
               return size
           )
           [0 .. ((fromIntegral arrLength) - 1)]
     return (map FontSize sizes)

{# fun Fl_set_font_by_string as setFontToString
       { cFromFont `Font', unsafeToCString `T.Text' } -> `()' supressWarningAboutRes #}
{# fun Fl_set_font_by_font as setFontToFont
       { cFromFont `Font',cFromFont `Font' } -> `()' supressWarningAboutRes #}
{# fun Fl_set_fonts as setFonts'
       {  } -> `Int' #}
{# fun Fl_set_fonts_with_string as setFontsWithString'
       { id `Ptr CChar' } -> `Int' #}
setFonts :: Maybe T.Text -> IO Int
setFonts (Just xstarName) = withText xstarName (\starNamePtr -> setFontsWithString' starNamePtr)
setFonts Nothing = setFonts'

{# fun Fl_add_fd_with_when as addFdWhen'
       {
         `CInt',
         `CInt',
         id `FunPtr FDHandlerPrim'
       } -> `()' #}

addFdWhen :: CInt -> [FdWhen] -> FDHandler -> IO ()
addFdWhen fd fdWhens handler = do
  fPtr <- toFDHandlerPrim handler
  addFdWhen' fd (fromIntegral . combine $ fdWhens) fPtr

{# fun Fl_add_fd as addFd'
       {
         `CInt',
         id `FunPtr FDHandlerPrim'
       } -> `()' #}

addFd :: CInt -> FDHandler -> IO ()
addFd fd handler = do
  fPtr <- toFDHandlerPrim handler
  addFd' fd fPtr

{# fun Fl_remove_fd_with_when as removeFdWhen' { `CInt', `CInt'} -> `()' #}
removeFdWhen :: CInt -> [FdWhen] -> IO ()
removeFdWhen fd fdWhens =
  removeFdWhen' fd (fromIntegral . combine $ fdWhens)

{# fun Fl_remove_fd as removeFd' { `CInt' } -> `()' #}
removeFd :: CInt -> IO ()
removeFd fd = removeFd' fd

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
setVisibleFocus :: Bool -> IO ()
setVisibleFocus = {#call Fl_set_visible_focus as fl_set_visible_focus #} . cFromBool
visibleFocus :: IO Bool
visibleFocus = {#call Fl_visible_focus as fl_visible_focus #} >>= return . cToBool
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
#if FLTK_API_VERSION >= 10304
-- | Only available on FLTK version 1.3.4 and above.
setBoxColor :: Color -> IO ()
setBoxColor c = {#call Fl_set_box_color as fl_set_box_color #} (cFromColor c)
-- | Only available on FLTK version 1.3.4 and above.
boxColor :: Color -> IO Color
boxColor c = {#call Fl_box_color as fl_box_color #} (cFromColor c) >>= return . cToColor
-- | Only available on FLTK version 1.3.4 and above.
abiVersion :: IO Int
abiVersion = {#call Fl_abi_version as fl_abi_version #} >>= return . fromIntegral
-- | Only available on FLTK version 1.3.4 and above.
abiCheck :: Int -> IO Int
abiCheck v = {#call Fl_abi_check as fl_abi_check #} (fromIntegral v) >>= return . fromIntegral
-- | Only available on FLTK version 1.3.4 and above.
apiVersion :: IO Int
apiVersion = {#call Fl_abi_version as fl_abi_version #} >>= return . fromIntegral
-- | Only available on FLTK version 1.3.4 and above.
localCtrl :: IO T.Text
localCtrl = {#call Fl_local_ctrl as fl_local_ctrl #} >>= cStringToText
-- | Only available on FLTK version 1.3.4 and above.
localAlt :: IO T.Text
localAlt = {#call Fl_local_alt as fl_local_alt #} >>= cStringToText
-- | Only available on FLTK version 1.3.4 and above.
localMeta :: IO T.Text
localMeta = {#call Fl_local_meta as fl_local_meta #} >>= cStringToText
-- | Only available on FLTK version 1.3.4 and above.
localShift :: IO T.Text
localShift = {#call Fl_local_shift as fl_local_shift #} >>= cStringToText
#ifdef GLSUPPORT
-- | Only available on FLTK version 1.3.4 and above if GL is enabled with 'stack build --flag fltkhs:opengl'
useHighResGL :: IO Bool
useHighResGL = {#call Fl_use_high_res_GL as fl_use_high_res_GL #} >>= return . cToBool
-- | Only available on FLTK version 1.3.4 and above if GL is enabled with 'stack build --flag fltkhs:opengl'
setUseHighResGL :: Bool -> IO ()
setUseHighResGL use' = {#call Fl_set_use_high_res_GL as fl_set_use_high_res_GL #} (cFromBool use')
#endif
#endif


-- | Use this function to run a GUI in GHCi.
replRun :: IO ()
replRun = do
  flush
  w <- firstWindow
  case w of
    Just w' ->
      catch (waitFor 0 >> replRun)
            (\e -> if (e == UserInterrupt)
                   then do
                     allToplevelWindows [] (Just w') >>= mapM_ deleteWidget
                     flush
                   else throw e)
    Nothing -> return ()
  where
    allToplevelWindows :: [Ref Window] -> Maybe (Ref Window) -> IO [Ref Window]
    allToplevelWindows ws (Just w) = nextWindow w >>= allToplevelWindows (w:ws)
    allToplevelWindows ws Nothing = return ws
