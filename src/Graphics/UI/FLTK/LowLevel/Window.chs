{-# LANGUAGE CPP, UndecidableInstances, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Window
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
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Widget

import C2HS hiding (cFromEnum, toBool,cToEnum,cToBool)

#c
 enum WindowType {
   SingleWindowType = FL_WINDOWC,
   DoubleWindowType = FL_DOUBLE_WINDOWC
};
#endc
{#enum WindowType {} deriving (Show, Eq) #}

data PositionSpec = ByPosition Position
                  | forall a. (Parent a Widget) => ByWidget (Ref a)

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

fillCustomWindowFunctionStruct :: forall a. (Parent a Window) =>
                                  Ptr () ->
                                  CustomWindowFuncs a ->
                                  IO ()
fillCustomWindowFunctionStruct structPtr (CustomWindowFuncs _flush') =
  toCallbackPrim  `orNullFunPtr` _flush' >>= {#set fl_Window_Virtual_Funcs->flush#} structPtr

defaultCustomWindowFuncs :: forall a. (Parent a Window) => CustomWindowFuncs a
defaultCustomWindowFuncs = CustomWindowFuncs Nothing

{# fun Fl_Window_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}
windowMaker :: forall a b. (Parent a Window, Parent b Widget) =>
               Size ->
               Maybe Position ->
               Maybe String ->
               Maybe (Ref b -> IO ()) ->
               CustomWidgetFuncs b ->
               CustomWindowFuncs a ->
               (Int -> Int -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> String -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> String -> Ptr () -> IO (Ptr ())) ->
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
       case (position, title) of
        (Nothing, Nothing) -> custom' w h p >>= toRef
        (Just (Position (X x) (Y y)), Nothing) -> customXY' x y w h p >>= toRef
        (Just (Position (X x) (Y y)), (Just l')) -> customXYWithLabel' x y w h l' p >>= toRef
        (Nothing, (Just l')) -> customWithLabel' w h l' p >>= toRef

{# fun Fl_OverriddenWindow_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
windowCustom :: Size ->                        -- ^ Size of this window
                Maybe Position ->              -- ^ Optional position of this window
                Maybe String ->                -- ^ Optional label
                Maybe (Ref Window -> IO ()) -> -- ^ Optional table drawing routine
                CustomWidgetFuncs Window ->    -- ^ Custom widget overrides
                CustomWindowFuncs Window ->    -- ^ Custom window overrides
                IO (Ref Window)
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

windowNew :: Size -> Maybe Position -> Maybe String -> IO (Ref Window)
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
instance (impl ~ (IO ())) => Op (Destroy ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (HandleSuper ()) Window orig impl where
  runOp _ _ window event = withRef window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Window orig impl where
  runOp _ _ window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (FlushSuper ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) Window orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{#fun Fl_Window_handle as windowHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Window orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Window orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Window_set_callback as windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}
instance (impl ~ ((Ref orig -> IO ()) -> IO ())) => Op (SetCallback ()) Window orig impl where
  runOp _ _ window callback =
   withRef window $ (\p -> do
                           callbackPtr <- toCallbackPrimWithUserData callback
                           windowSetCallback' (castPtr p) callbackPtr)

{# fun Fl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Window_changed as changed' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (Changed ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> changed' winPtr

{# fun Fl_Window_fullscreen as fullscreen' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeFullscreen ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> fullscreen' winPtr

{# fun Fl_Window_fullscreen_off as fullscreenOff' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_fullscreen_off_with_resize as fullscreenOffWithResize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe Rectangle ->  IO ())) => Op (FullscreenOff ()) Window orig impl where
  runOp _ _ win (Just rectangle) =
    withRef win $ \winPtr ->
        let (x_pos, y_pos, width, height) = fromRectangle rectangle
        in fullscreenOffWithResize' winPtr x_pos y_pos width height
  runOp _ _ win Nothing =
    withRef win $ \winPtr -> fullscreenOff' winPtr

{# fun Fl_Window_set_border as setBorder' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetBorder ()) Window orig impl where
  runOp _ _ win b = withRef win $ \winPtr -> setBorder' winPtr b

{# fun Fl_Window_clear_border as clearBorder' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ClearBorder ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> clearBorder' winPtr

{# fun Fl_Window_border as border' { id `Ptr ()' } -> `Bool' toBool#}
instance (impl ~ ( IO (Bool))) => Op (GetBorder ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> border' winPtr

{# fun Fl_Window_set_override as setOverride' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetOverride ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setOverride' winPtr

{# fun Fl_Window_override as override' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetOverride ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> override' winPtr

{# fun Fl_Window_set_modal as setModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetModal ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setModal' winPtr

{# fun Fl_Window_modal as modal' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetModal ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> modal' winPtr

{# fun Fl_Window_set_non_modal as setNonModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetNonModal ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setNonModal' winPtr

{# fun Fl_Window_non_modal as nonModal' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (NonModal ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> nonModal' winPtr

{# fun Fl_Window_set_menu_window as setMenuWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetMenuWindow ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setMenuWindow' winPtr

{# fun Fl_Window_menu_window as menuWindow' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetMenuWindow ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> menuWindow' winPtr

{# fun Fl_Window_set_tooltip_window as setTooltipWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SetTooltipWindow ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> setTooltipWindow' winPtr

{# fun Fl_Window_tooltip_window as tooltipWindow' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetTooltipWindow ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> tooltipWindow' winPtr

{# fun Fl_Window_hotspot_with_x_y as hotspotWithXY' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_x_y_with_offscreen as hotspotWithXYWithOffscreen' { id `Ptr ()',`Int',`Int', fromBool `Bool' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget as hotspotWithWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget_with_offscreen as hotspotWithWidgetWithOffscreen' { id `Ptr ()',id `Ptr ()',fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (PositionSpec -> Maybe Bool -> IO ())) => Op (HotSpot ()) Window orig impl where
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
instance (impl ~ ( IO ())) => Op (FreePosition ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> freePosition' winPtr

{# fun Fl_Window_size_range as sizeRange' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_size_range_with_args as sizeRangeWithArgs' { id `Ptr ()',`Int',`Int', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int -> Int -> IO ())) => Op (SizeRange ()) Window orig impl where
  runOp _ _ win minw' minh' =
    withRef win $ \winPtr -> sizeRange' winPtr minw' minh'
instance (impl ~ (Int -> Int -> OptionalSizeRangeArgs ->  IO ())) => Op (SizeRangeWithArgs ()) Window orig impl where
  runOp _ _ win minw' minh' args =
    withRef win $ \winPtr -> do
      structPtr <- optionalSizeRangeArgsToStruct args
      sizeRangeWithArgs' winPtr minw' minh' structPtr

{# fun Fl_Window_label as label' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ ( IO (String))) => Op (GetLabel ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> label' winPtr

{# fun Fl_Window_iconlabel as iconlabel' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ ( IO (String))) => Op (GetIconlabel ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> iconlabel' winPtr

{# fun Fl_Window_set_label as setLabel' { id `Ptr ()',unsafeToCString `String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String ->  IO ())) => Op (SetLabel ()) Window orig impl where
  runOp _ _ win l' = withRef win $ \winPtr -> setLabel' winPtr l'

{# fun Fl_Window_set_iconlabel as setIconlabel' { id `Ptr ()',unsafeToCString `String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String ->  IO ())) => Op (SetIconlabel ()) Window orig impl where
  runOp _ _ win l' = withRef win $ \winPtr -> setIconlabel' winPtr l'

{# fun Fl_Window_set_label_with_iconlabel as setLabelWithIconlabel' { id `Ptr ()',unsafeToCString `String',unsafeToCString `String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String -> String ->  IO ())) => Op (SetLabelWithIconlabel ()) Window orig impl where
  runOp _ _ win label iconlabel = withRef win $ \winPtr -> setLabelWithIconlabel' winPtr label iconlabel

{# fun Fl_Window_copy_label as copyLabel' { id `Ptr ()',unsafeToCString `String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String ->  IO ())) => Op (CopyLabel ()) Window orig impl where
  runOp _ _ win a = withRef win $ \winPtr -> copyLabel' winPtr a

{# fun Fl_Window_xclass as xclass' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ ( IO (String))) => Op (GetXclass ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> xclass' winPtr

{# fun Fl_Window_set_xclass as setXclass' { id `Ptr ()',unsafeToCString `String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String ->  IO ())) => Op (SetXclass ()) Window orig impl where
  runOp _ _ win c = withRef win $ \winPtr -> setXclass' winPtr c

{# fun Fl_Window_icon as icon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Image)))) => Op (GetIcon ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> icon' winPtr >>= toMaybeRef

{# fun Fl_Window_set_icon as setIcon' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Maybe( Ref a ) ->  IO ())) => Op (SetIcon ()) Window orig impl where
  runOp _ _ win bitmap = withRef win $ \winPtr -> withMaybeRef bitmap $ \bitmapPtr -> setIcon' winPtr bitmapPtr

{# fun Fl_Window_shown as shown' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (Shown ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> shown' winPtr

{# fun Fl_Window_iconize as iconize' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Iconize ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> iconize' winPtr

{# fun Fl_Window_x_root as xRoot' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetXRoot ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> xRoot' winPtr

{# fun Fl_Window_y_root as yRoot' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetYRoot ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> yRoot' winPtr

{# fun Fl_Window_current as current' {  } -> `Ptr ()' id #}
currentWindow ::  (Parent a Window) => IO (Ref a)
currentWindow = current' >>= toRef

{# fun Fl_Window_make_current as makeCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeCurrent ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> makeCurrent' winPtr

{# fun Fl_Window_set_cursor_with_bg as setCursorWithBg' { id `Ptr ()',cFromEnum `Cursor',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg as setCursorWithFg' { id `Ptr ()',cFromEnum `Cursor',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg_bg as setCursorWithFgBg' { id `Ptr ()',cFromEnum `Cursor',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor as setCursor' { id `Ptr ()',cFromEnum `Cursor' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Cursor -> IO ())) => Op (SetCursor ()) Window orig impl where
  runOp _ _ win cursor =  withRef win $ \winPtr -> setCursor' winPtr cursor
instance (impl ~ (Cursor -> (Maybe Color, Maybe Color) ->  IO ())) => Op (SetCursorWithFgBg ()) Window orig impl where
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
instance (impl ~ (CursorType -> IO ())) => Op (SetDefaultCursor ()) Window orig impl where
  runOp _ _ win cursor = withRef win $ \winPtr -> setDefaultCursor' winPtr cursor
instance (impl ~ (CursorType -> (Maybe Color, Maybe Color) -> IO ())) => Op (SetDefaultCursorWithFgBg ()) Window orig impl where
  runOp _ _ win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withRef win $ \winPtr -> setDefaultCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withRef win $ \winPtr -> setDefaultCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withRef win $ \winPtr -> setDefaultCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withRef win $ \winPtr -> setDefaultCursor' winPtr cursor

{# fun Fl_Window_decorated_w as decoratedW' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetDecoratedW ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> decoratedW' winPtr

{# fun Fl_Window_decorated_h as decoratedH' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetDecoratedH ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> decoratedH' winPtr

{# fun Fl_Window_draw_box as windowDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_tc as windowDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_txywhc as windowDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (DrawBox ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> windowDrawBox' windowPtr
instance (impl ~ (Boxtype -> Color -> Maybe Rectangle -> IO ())) => Op (DrawBoxWithBoxtype ()) Window orig impl where
  runOp _ _ window bx c Nothing =
              withRef window $ \windowPtr -> windowDrawBoxWithTC' windowPtr bx c
  runOp _ _ window bx c (Just r) =
              withRef window $ \windowPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                windowDrawBoxWithTXywhC' windowPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Window_draw_backdrop as windowDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (DrawBackdrop ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> windowDrawBackdrop' windowPtr

{# fun Fl_Window_draw_focus as windowDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_focus_with_txywh as windowDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Boxtype, Rectangle) -> IO ())) => Op (DrawFocus ()) Window orig impl where
  runOp _ _ window Nothing =
                withRef window $ \ windowPtr -> windowDrawFocus' windowPtr
  runOp _ _ window (Just (bx, r)) =
                withRef window $ \windowPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  windowDrawFocusWithTXywh' windowPtr bx x_pos y_pos w_pos h_pos

{# fun Fl_Window_wait_for_expose as waitForExpose' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (WaitForExpose ()) Window orig impl where
  runOp _ _ win = withRef win $ \winPtr -> waitForExpose' winPtr

{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (WindowType ->  IO ())) => Op (SetType ()) Window orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (WindowType)) => Op (GetType_ ()) Window orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Window"
-- @

-- $functions
-- @
-- changed :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- clearBorder :: 'Ref' 'Window' -> 'IO' ()
--
-- copyLabel :: 'Ref' 'Window' -> 'String' -> 'IO' ()
--
-- destroy :: 'Ref' 'Window' -> 'IO' ()
--
-- drawBackdrop :: 'Ref' 'Window' -> 'IO' ()
--
-- drawBox :: 'Ref' 'Window' -> 'IO' ()
--
-- drawBoxWithBoxtype :: 'Ref' 'Window' -> 'Boxtype' -> 'Color' -> 'Maybe' 'Rectangle' -> 'IO' ()
--
-- drawFocus :: 'Ref' 'Window' -> 'Maybe' ('Boxtype', 'Rectangle') -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Window' -> 'IO' ()
--
-- flushSuper :: 'Ref' 'Window' -> 'IO' ()
--
-- freePosition :: 'Ref' 'Window' -> 'IO' ()
--
-- fullscreenOff :: 'Ref' 'Window' -> 'Maybe' 'Rectangle' -> 'IO' ()
--
-- getBorder :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- getDecoratedH :: 'Ref' 'Window' -> 'IO' ('Int')
--
-- getDecoratedW :: 'Ref' 'Window' -> 'IO' ('Int')
--
-- getIcon :: 'Ref' 'Window' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getIconlabel :: 'Ref' 'Window' -> 'IO' ('String')
--
-- getLabel :: 'Ref' 'Window' -> 'IO' ('String')
--
-- getMenuWindow :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- getModal :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- getOverride :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- getTooltipWindow :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- getType_ :: 'Ref' 'Window' -> 'IO' ('WindowType')
--
-- getXRoot :: 'Ref' 'Window' -> 'IO' ('Int')
--
-- getXclass :: 'Ref' 'Window' -> 'IO' ('String')
--
-- getYRoot :: 'Ref' 'Window' -> 'IO' ('Int')
--
-- handle :: 'Ref' 'Window' -> 'Event' -> 'IO' 'Int'
--
-- handleSuper :: 'Ref' 'Window' -> 'Int' -> 'IO' ('Int')
--
-- hide :: 'Ref' 'Window' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Window' -> 'IO' ()
--
-- hotSpot :: 'Ref' 'Window' -> 'PositionSpec' -> 'Maybe' 'Bool' -> 'IO' ()
--
-- iconize :: 'Ref' 'Window' -> 'IO' ()
--
-- makeCurrent :: 'Ref' 'Window' -> 'IO' ()
--
-- makeFullscreen :: 'Ref' 'Window' -> 'IO' ()
--
-- nonModal :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- resize :: 'Ref' 'Window' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Window' -> 'Rectangle' -> 'IO' ()
--
-- setBorder :: 'Ref' 'Window' -> 'Bool' -> 'IO' ()
--
-- setCallback :: 'Ref' 'Window' -> ('Ref' orig -> 'IO' ()) -> 'IO' ()
--
-- setCursor :: 'Ref' 'Window' -> 'Cursor' -> 'IO' ()
--
-- setCursorWithFgBg :: 'Ref' 'Window' -> 'Cursor' -> ('Maybe' 'Color', 'Maybe' 'Color') -> 'IO' ()
--
-- setDefaultCursor :: 'Ref' 'Window' -> 'CursorType' -> 'IO' ()
--
-- setDefaultCursorWithFgBg :: 'Ref' 'Window' -> 'CursorType' -> ('Maybe' 'Color', 'Maybe' 'Color') -> 'IO' ()
--
-- setIcon:: ('Parent' a 'Image') => 'Ref' 'Window' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setIconlabel :: 'Ref' 'Window' -> 'String' -> 'IO' ()
--
-- setLabel :: 'Ref' 'Window' -> 'String' -> 'IO' ()
--
-- setLabelWithIconlabel :: 'Ref' 'Window' -> 'String' -> 'String' -> 'IO' ()
--
-- setMenuWindow :: 'Ref' 'Window' -> 'IO' ()
--
-- setModal :: 'Ref' 'Window' -> 'IO' ()
--
-- setNonModal :: 'Ref' 'Window' -> 'IO' ()
--
-- setOverride :: 'Ref' 'Window' -> 'IO' ()
--
-- setTooltipWindow :: 'Ref' 'Window' -> 'IO' ()
--
-- setType :: 'Ref' 'Window' -> 'WindowType' -> 'IO' ()
--
-- setXclass :: 'Ref' 'Window' -> 'String' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Window' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Window' -> 'IO' ()
--
-- shown :: 'Ref' 'Window' -> 'IO' ('Bool')
--
-- sizeRange :: 'Ref' 'Window' -> 'Int' -> 'Int' -> 'IO' ()
--
-- sizeRangeWithArgs :: 'Ref' 'Window' -> 'Int' -> 'Int' -> 'OptionalSizeRangeArgs' -> 'IO' ()
--
-- waitForExpose :: 'Ref' 'Window' -> 'IO' ()
-- @
