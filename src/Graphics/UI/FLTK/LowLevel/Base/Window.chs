{-# LANGUAGE CPP, UndecidableInstances, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Window
    (
     CustomWindowFuncs(..),
     OptionalSizeRangeArgs(..),
     PositionSpec(..),
     WindowType(..),
     defaultCustomWindowFuncs,
     fillCustomWidgetFunctionStruct,
     defaultOptionalSizeRangeArgs,
     windowCustom,
     windowNew,
     windowMaker,
     currentWindow
   , handleWindowBase
   , resizeWindowBase
   , hideWindowBase
   , showWidgetWindowBase
   , flushWindowBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_C.h"
#include "Fl_WindowC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.Widget

#c
 enum WindowType {
   SingleWindowType = FL_WINDOWC,
   DoubleWindowType = FL_DOUBLE_WINDOWC
};
#endc
{#enum WindowType {} deriving (Show, Eq) #}

data PositionSpec = ByPosition Position
                  | forall a. (Parent a WidgetBase) => ByWidget (Ref a)

data CustomWindowFuncs a =
    CustomWindowFuncs {
      flushCustom :: Maybe (Ref a -> IO ())
    }

data OptionalSizeRangeArgs = OptionalSizeRangeArgs {
      maxw :: Maybe Int,
      maxh :: Maybe Int,
      dw :: Maybe Int,
      dh :: Maybe Int,
      aspect :: Maybe Bool
    }

optionalSizeRangeArgsToStruct :: OptionalSizeRangeArgs -> IO (Ptr ())
optionalSizeRangeArgsToStruct args = do
  p <- mallocBytes {#sizeof fl_Window_size_range_args #}
  {#set fl_Window_size_range_args->maxw #} p $ maybe 0 fromIntegral (maxw args)
  {#set fl_Window_size_range_args->maxh #} p $ maybe 0 fromIntegral (maxh args)
  {#set fl_Window_size_range_args->dw #} p $ maybe 0 fromIntegral (dw args)
  {#set fl_Window_size_range_args->dh #} p $ maybe 0 fromIntegral (dh args)
  {#set fl_Window_size_range_args->aspect #} p $ maybe 0 fromBool (aspect args)
  return p

defaultOptionalSizeRangeArgs :: OptionalSizeRangeArgs
defaultOptionalSizeRangeArgs = OptionalSizeRangeArgs Nothing Nothing Nothing Nothing Nothing

fillCustomWindowFunctionStruct :: forall a. (Parent a WindowBase) =>
                                  Ptr () ->
                                  CustomWindowFuncs a ->
                                  IO ()
fillCustomWindowFunctionStruct structPtr (CustomWindowFuncs _flush') =
  toCallbackPrim  `orNullFunPtr` _flush' >>= {#set fl_Window_Virtual_Funcs->flush#} structPtr

defaultCustomWindowFuncs :: forall a. (Parent a WindowBase) => CustomWindowFuncs a
defaultCustomWindowFuncs = CustomWindowFuncs Nothing

{# fun Fl_Window_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}
windowMaker :: forall a b. (Parent a WindowBase, Parent b WidgetBase) =>
               Size ->
               Maybe Position ->
               Maybe T.Text ->
               Maybe (Ref b -> IO ()) ->
               CustomWidgetFuncs b ->
               CustomWindowFuncs a ->
               (Int -> Int -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> CString -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> CString -> Ptr () -> IO (Ptr ())) ->
               IO (Ref a)
windowMaker (Size (Width w) (Height h))
            position
            title
            draw'
            customWidgetFuncs'
            customWindowFuncs'
            custom'
            customWithLabel'
            customXY'
            customXYWithLabel' =
     do
       p <- virtualFuncs'
       fillCustomWidgetFunctionStruct p draw' customWidgetFuncs'
       fillCustomWindowFunctionStruct p customWindowFuncs'
       ref <- case (position, title) of
                (Nothing, Nothing) -> custom' w h p >>= toRef
                (Just (Position (X x) (Y y)), Nothing) -> customXY' x y w h p >>= toRef
                (Just (Position (X x) (Y y)), (Just l')) -> copyTextToCString l' >>= \l'' -> customXYWithLabel' x y w h l'' p >>= toRef
                (Nothing, (Just l')) -> copyTextToCString l' >>= \l'' -> customWithLabel' w h l'' p >>= toRef
       setFlag (safeCast ref :: Ref WindowBase) WidgetFlagCopiedLabel
       setFlag (safeCast ref :: Ref WindowBase) WidgetFlagCopiedTooltip
       return ref

{# fun Fl_OverriddenWindow_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
windowCustom :: Size                        -- ^ Size of this window
             -> Maybe Position              -- ^ Optional position of this window
             -> Maybe T.Text                -- ^ Optional label
             -> Maybe (Ref Window -> IO ()) -- ^ Optional table drawing routine
             -> CustomWidgetFuncs Window    -- ^ Custom widget overrides
             -> CustomWindowFuncs Window    -- ^ Custom window overrides
             -> IO (Ref Window)
windowCustom size position title draw' customWidgetFuncs' customWindowFuncs' =
  windowMaker
    size
    position
    title
    draw'
    customWidgetFuncs'
    customWindowFuncs'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

windowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref Window)
windowNew size position title =
  windowMaker
    size
    position
    title
    Nothing
    (defaultCustomWidgetFuncs :: CustomWidgetFuncs Window)
    (defaultCustomWindowFuncs :: CustomWindowFuncs Window)
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun Fl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Window_set_callback as windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackWithUserDataPrim'} -> `FunPtr CallbackWithUserDataPrim' id #}
instance (impl ~ ((Ref orig -> IO ()) -> IO ())) => Op (SetCallback ()) WindowBase orig impl where
  runOp _ _ window callback =
   withRef window $ (\p -> do
     callbackPtr <- toCallbackPrimWithUserData callback
     oldCb <- windowSetCallback' (castPtr p) callbackPtr
     if (oldCb == nullFunPtr)
     then return ()
     else freeHaskellFunPtr oldCb)

{# fun Fl_Window_changed as changed' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (Changed ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> changed' winPtr

{# fun Fl_Window_fullscreen as fullscreen' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeFullscreen ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> fullscreen' winPtr

{# fun Fl_Window_fullscreen_off as fullscreenOff' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_fullscreen_off_with_resize as fullscreenOffWithResize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe Rectangle ->  IO ())) => Op (FullscreenOff ()) WindowBase orig impl where
  runOp _ _ win (Just rectangle) =
    withRef win $ \winPtr ->
        let (x_pos, y_pos, width, height) = fromRectangle rectangle
        in fullscreenOffWithResize' winPtr x_pos y_pos width height
  runOp _ _ win Nothing =
    withRef win $ \winPtr -> fullscreenOff' winPtr

{# fun Fl_Window_set_border as setBorder' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetBorder ()) WindowBase orig impl where
  runOp _ _ win b = withRef win $ \winPtr -> setBorder' winPtr b

{# fun Fl_Window_clear_border as clearBorder' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ClearBorder ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> clearBorder' winPtr

{# fun Fl_Window_border as border' { id `Ptr ()' } -> `Bool' toBool#}
instance (impl ~ ( IO (Bool))) => Op (GetBorder ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> border' winPtr

{# fun Fl_Window_set_override as setOverride' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetOverride ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setOverride' winPtr

{# fun Fl_Window_override as override' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetOverride ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> override' winPtr

{# fun Fl_Window_set_modal as setModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetModal ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setModal' winPtr

{# fun Fl_Window_modal as modal' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetModal ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> modal' winPtr

{# fun Fl_Window_set_non_modal as setNonModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetNonModal ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setNonModal' winPtr

{# fun Fl_Window_non_modal as nonModal' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (NonModal ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> nonModal' winPtr

{# fun Fl_Window_set_menu_window as setMenuWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetMenuWindow ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setMenuWindow' winPtr

{# fun Fl_Window_menu_window as menuWindow' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetMenuWindow ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> menuWindow' winPtr

{# fun Fl_Window_set_tooltip_window as setTooltipWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetTooltipWindow ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setTooltipWindow' winPtr

{# fun Fl_Window_tooltip_window as tooltipWindow' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetTooltipWindow ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> tooltipWindow' winPtr

{# fun Fl_Window_hotspot_with_x_y as hotspotWithXY' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_x_y_with_offscreen as hotspotWithXYWithOffscreen' { id `Ptr ()',`Int',`Int', fromBool `Bool' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget as hotspotWithWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget_with_offscreen as hotspotWithWidgetWithOffscreen' { id `Ptr ()',id `Ptr ()',fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (PositionSpec -> Maybe Bool -> IO ())) => Op (HotSpot ()) WindowBase orig impl where
  runOp _ _ win positionSpec offscreen =
    withRef win $ \winPtr ->
            case (positionSpec, offscreen) of
              ((ByPosition (Position (X x) (Y y))), (Just offscreen')) ->
                  hotspotWithXYWithOffscreen' winPtr x y offscreen'
              ((ByPosition (Position (X x) (Y y))), Nothing) -> hotspotWithXY' winPtr x y
              ((ByWidget templateWidget), (Just offscreen')) ->
                  withRef templateWidget $ \templatePtr ->
                      hotspotWithWidgetWithOffscreen' winPtr templatePtr offscreen'
              ((ByWidget templateWidget), Nothing) ->
                  withRef templateWidget $ \templatePtr ->
                      hotspotWithWidget' winPtr templatePtr
{# fun Fl_Window_free_position as freePosition' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (FreePosition ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> freePosition' winPtr

{# fun Fl_Window_size_range as sizeRange' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_size_range_with_args as sizeRangeWithArgs' { id `Ptr ()',`Int',`Int', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Size -> IO ())) => Op (SizeRange ()) WindowBase orig impl where
  runOp _ _ win (Size (Width minw') (Height minh')) =
    withRef win $ \winPtr -> sizeRange' winPtr minw' minh'
instance (impl ~ (Size -> OptionalSizeRangeArgs ->  IO ())) => Op (SizeRangeWithArgs ()) WindowBase orig impl where
  runOp _ _ win (Size (Width minw') (Height minh')) args =
    withRef win $ \winPtr -> do
      structPtr <- optionalSizeRangeArgsToStruct args
      sizeRangeWithArgs' winPtr minw' minh' structPtr

{# fun Fl_Window_label as label' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetLabel ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> label' winPtr >>= cStringToText

{# fun Fl_Window_iconlabel as iconlabel' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetIconlabel ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> iconlabel' winPtr >>= cStringToText

{# fun Fl_Window_set_label as setLabel' { id `Ptr ()',`CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetLabel ()) WindowBase orig impl where
  runOp _ _ win l' = withRef win $ \winPtr -> copyTextToCString l' >>= setLabel' winPtr

{# fun Fl_Window_set_iconlabel as setIconlabel' { id `Ptr ()',`CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetIconlabel ()) WindowBase orig impl where
  runOp _ _ win l' = withRef win $ \winPtr -> copyTextToCString l' >>= setIconlabel' winPtr

{# fun Fl_Window_set_label_with_iconlabel as setLabelWithIconlabel' { id `Ptr ()',`CString',`CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text -> T.Text ->  IO ())) => Op (SetLabelWithIconlabel ()) WindowBase orig impl where
  runOp _ _ win label iconlabel = withRef win $ \winPtr -> do
    l' <- copyTextToCString label
    il' <- copyTextToCString iconlabel
    setLabelWithIconlabel' winPtr l' il'

{# fun Fl_Window_copy_label as copyLabel' { id `Ptr ()',`CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text ->  IO ())) => Op (CopyLabel ()) WindowBase orig impl where
  runOp _ _ win a = withRef win $ \winPtr -> withText a (copyLabel' winPtr)

{# fun Fl_Window_xclass as xclass' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetXclass ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> xclass' winPtr >>= cStringToText

{# fun Fl_Window_set_xclass as setXclass' { id `Ptr ()',`CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetXclass ()) WindowBase orig impl where
  runOp _ _ win c = withRef win $ \winPtr -> copyTextToCString c >>= setXclass' winPtr

{# fun Fl_Window_icon as icon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image)))) => Op (GetIcon ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> icon' winPtr >>= toMaybeRef

{# fun Fl_Window_set_icon as setIcon' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Maybe( Ref a ) ->  IO ())) => Op (SetIcon ()) WindowBase orig impl where
  runOp _ _ win bitmap = withRef win $ \winPtr -> withMaybeRef bitmap $ \bitmapPtr -> setIcon' winPtr bitmapPtr

{# fun Fl_Window_shown as shown' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (Shown ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> shown' winPtr

{# fun Fl_Window_iconize as iconize' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Iconize ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> iconize' winPtr

{# fun Fl_Window_x_root as xRoot' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (X))) => Op (GetXRoot ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> xRoot' winPtr >>= return . X

{# fun Fl_Window_y_root as yRoot' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Y))) => Op (GetYRoot ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> yRoot' winPtr >>= return . Y

{# fun Fl_Window_current as current' {  } -> `Ptr ()' id #}
currentWindow ::  (Parent a WindowBase) => IO (Ref a)
currentWindow = current' >>= toRef

{# fun Fl_Window_make_current as makeCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeCurrent ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> makeCurrent' winPtr

{# fun Fl_Window_set_cursor_with_bg as setCursorWithBg' { id `Ptr ()',cFromEnum `Cursor',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg as setCursorWithFg' { id `Ptr ()',cFromEnum `Cursor',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg_bg as setCursorWithFgBg' { id `Ptr ()',cFromEnum `Cursor',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor as setCursor' { id `Ptr ()',cFromEnum `Cursor' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Cursor -> IO ())) => Op (SetCursor ()) WindowBase orig impl where
  runOp _ _ win cursor =  withRef win $ \winPtr -> setCursor' winPtr cursor
instance (impl ~ (Cursor -> (Maybe Color, Maybe Color) ->  IO ())) => Op (SetCursorWithFgBg ()) WindowBase orig impl where
  runOp _ _ win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withRef win $ \winPtr -> setCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withRef win $ \winPtr -> setCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withRef win $ \winPtr -> setCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withRef win $ \winPtr -> setCursor' winPtr cursor

{# fun Fl_Window_set_default_cursor_with_bg as setDefaultCursorWithBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor_with_fg as setDefaultCursorWithFg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor_with_fg_bg as setDefaultCursorWithFgBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor as setDefaultCursor' { id `Ptr ()',cFromEnum `CursorType' } -> `()' supressWarningAboutRes #}
instance (impl ~ (CursorType -> IO ())) => Op (SetDefaultCursor ()) WindowBase orig impl where
  runOp _ _ win cursor = withRef win $ \winPtr -> setDefaultCursor' winPtr cursor
instance (impl ~ (CursorType -> (Maybe Color, Maybe Color) -> IO ())) => Op (SetDefaultCursorWithFgBg ()) WindowBase orig impl where
  runOp _ _ win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withRef win $ \winPtr -> setDefaultCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withRef win $ \winPtr -> setDefaultCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withRef win $ \winPtr -> setDefaultCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withRef win $ \winPtr -> setDefaultCursor' winPtr cursor

{# fun Fl_Window_decorated_w as decoratedW' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetDecoratedW ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> decoratedW' winPtr

{# fun Fl_Window_decorated_h as decoratedH' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetDecoratedH ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> decoratedH' winPtr

{# fun Fl_Window_draw_box as windowDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_tc as windowDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_txywhc as windowDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (DrawBox ()) WindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> windowDrawBox' windowPtr
instance (impl ~ (Boxtype -> Color -> Maybe Rectangle -> IO ())) => Op (DrawBoxWithBoxtype ()) WindowBase orig impl where
  runOp _ _ window bx c Nothing =
              withRef window $ \windowPtr -> windowDrawBoxWithTC' windowPtr bx c
  runOp _ _ window bx c (Just r) =
              withRef window $ \windowPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                windowDrawBoxWithTXywhC' windowPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Window_draw_backdrop as windowDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (DrawBackdrop ()) WindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> windowDrawBackdrop' windowPtr

{# fun Fl_Window_draw_focus as windowDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_focus_with_txywh as windowDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Boxtype, Rectangle) -> IO ())) => Op (DrawFocus ()) WindowBase orig impl where
  runOp _ _ window Nothing =
                withRef window $ \ windowPtr -> windowDrawFocus' windowPtr
  runOp _ _ window (Just (bx, r)) =
                withRef window $ \windowPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  windowDrawFocusWithTXywh' windowPtr bx x_pos y_pos w_pos h_pos

{# fun Fl_Window_wait_for_expose as waitForExpose' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (WaitForExpose ()) WindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> waitForExpose' winPtr

{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (WindowType ->  IO ())) => Op (SetType ()) WindowBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (WindowType)) => Op (GetType_ ()) WindowBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

{# fun Fl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleWindowBase :: Ref WindowBase -> Event ->  IO (Either UnknownEvent ())
handleWindowBase adjuster event = withRef adjuster $ \adjusterPtr -> handleSuper' adjusterPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeWindowBase :: Ref WindowBase -> Rectangle -> IO ()
resizeWindowBase adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideWindowBase ::  Ref WindowBase -> IO ()
hideWindowBase adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetWindowBase ::  Ref WindowBase -> IO ()
showWidgetWindowBase adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr
{# fun Fl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' #}
flushWindowBase :: Ref WindowBase -> IO ()
flushWindowBase window = withRef window $ \windowPtr -> flush' windowPtr

{#fun Fl_DerivedWindow_handle as windowHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) WindowBase orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedWindow_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) WindowBase orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedWindow_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) WindowBase orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{# fun Fl_DerivedWindow_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) WindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Flush ()) WindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> flush' windowPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Window"
-- @

-- $functions
-- @
-- changed :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- clearBorder :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- copyLabel :: 'Ref' 'WindowBase' -> 'T.Text' -> 'IO' ()
--
-- destroy :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- drawBackdrop :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- drawBox :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- drawBoxWithBoxtype :: 'Ref' 'WindowBase' -> 'Boxtype' -> 'Color' -> 'Maybe' 'Rectangle' -> 'IO' ()
--
-- drawFocus :: 'Ref' 'WindowBase' -> 'Maybe' ('Boxtype', 'Rectangle') -> 'IO' ()
--
-- flush :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- freePosition :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- fullscreenOff :: 'Ref' 'WindowBase' -> 'Maybe' 'Rectangle' -> 'IO' ()
--
-- getBorder :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- getDecoratedH :: 'Ref' 'WindowBase' -> 'IO' ('Int')
--
-- getDecoratedW :: 'Ref' 'WindowBase' -> 'IO' ('Int')
--
-- getIcon :: 'Ref' 'WindowBase' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getIconlabel :: 'Ref' 'WindowBase' -> 'IO' 'T.Text'
--
-- getLabel :: 'Ref' 'WindowBase' -> 'IO' 'T.Text'
--
-- getMenuWindow :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- getModal :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- getOverride :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- getTooltipWindow :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- getType_ :: 'Ref' 'WindowBase' -> 'IO' ('WindowType')
--
-- getXRoot :: 'Ref' 'WindowBase' -> 'IO' ('X')
--
-- getXclass :: 'Ref' 'WindowBase' -> 'IO' 'T.Text'
--
-- getYRoot :: 'Ref' 'WindowBase' -> 'IO' ('Y')
--
-- handle :: 'Ref' 'WindowBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- hotSpot :: 'Ref' 'WindowBase' -> 'PositionSpec' -> 'Maybe' 'Bool' -> 'IO' ()
--
-- iconize :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- makeCurrent :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- makeFullscreen :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- nonModal :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- resize :: 'Ref' 'WindowBase' -> 'Rectangle' -> 'IO' ()
--
-- setBorder :: 'Ref' 'WindowBase' -> 'Bool' -> 'IO' ()
--
-- setCallback :: 'Ref' 'WindowBase' -> ('Ref' orig -> 'IO' ()) -> 'IO' ()
--
-- setCursor :: 'Ref' 'WindowBase' -> 'Cursor' -> 'IO' ()
--
-- setCursorWithFgBg :: 'Ref' 'WindowBase' -> 'Cursor' -> ('Maybe' 'Color', 'Maybe' 'Color') -> 'IO' ()
--
-- setDefaultCursor :: 'Ref' 'WindowBase' -> 'CursorType' -> 'IO' ()
--
-- setDefaultCursorWithFgBg :: 'Ref' 'WindowBase' -> 'CursorType' -> ('Maybe' 'Color', 'Maybe' 'Color') -> 'IO' ()
--
-- setIcon:: ('Parent' a 'Image') => 'Ref' 'WindowBase' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setIconlabel :: 'Ref' 'WindowBase' -> 'T.Text' -> 'IO' ()
--
-- setLabel :: 'Ref' 'WindowBase' -> 'T.Text' -> 'IO' ()
--
-- setLabelWithIconlabel :: 'Ref' 'WindowBase' -> 'T.Text' -> 'T.Text' -> 'IO' ()
--
-- setMenuWindow :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- setModal :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- setNonModal :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- setOverride :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- setTooltipWindow :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- setType :: 'Ref' 'WindowBase' -> 'WindowType' -> 'IO' ()
--
-- setXclass :: 'Ref' 'WindowBase' -> 'T.Text' -> 'IO' ()
--
-- showWidget :: 'Ref' 'WindowBase' -> 'IO' ()
--
-- shown :: 'Ref' 'WindowBase' -> 'IO' ('Bool')
--
-- sizeRange :: 'Ref' 'WindowBase' -> 'Size' -> 'IO' ()
--
-- sizeRangeWithArgs :: 'Ref' 'WindowBase' -> 'Size' -> 'OptionalSizeRangeArgs' -> 'IO' ()
--
-- waitForExpose :: 'Ref' 'WindowBase' -> 'IO' ()
-- @
