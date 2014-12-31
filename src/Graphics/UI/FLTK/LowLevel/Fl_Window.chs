{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Window
    (
     CustomWindowFuncs(..),
     OptionalSizeRangeArgs(..),
     defaultCustomWindowFuncs,
     fillCustomWidgetFunctionStruct,
     defaultOptionalSizeRangeArgs,
     windowCustom,
     windowNew,
     windowMaker,
     currentWindow
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
import Graphics.UI.FLTK.LowLevel.Fl_Widget

import C2HS hiding (cFromEnum, toBool,cToEnum)

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

fillCustomWindowFunctionStruct :: forall a. (FindObj a Window Same) =>
                                  Ptr () ->
                                  CustomWindowFuncs a ->
                                  IO ()
fillCustomWindowFunctionStruct structPtr (CustomWindowFuncs _flush') =
  toCallbackPrim  `orNullFunPtr` _flush' >>= {#set fl_Window_Virtual_Funcs->flush#} structPtr

defaultCustomWindowFuncs :: forall a. (FindObj a Window Same) => CustomWindowFuncs a
defaultCustomWindowFuncs = CustomWindowFuncs Nothing

windowMaker :: forall a b. (FindObj a Window Same, FindObj b Widget Same) =>
               Size ->
               Maybe Position ->
               Maybe String ->
               Maybe ( CustomWidgetFuncs b ) ->
               Maybe ( CustomWindowFuncs a ) ->
               (Int -> Int -> IO (Ptr ())) ->
               (Int -> Int -> String -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> String -> IO (Ptr ())) ->
               (Int -> Int -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> String -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> Ptr () -> IO (Ptr ())) ->
               (Int -> Int -> Int -> Int -> String -> Ptr () -> IO (Ptr ())) ->
               IO (Ref a)
windowMaker (Size (Width w) (Height h))
            position
            title
            customWidgetFuncs'
            customWindowFuncs'
            new'
            newWithLabel'
            newXY'
            newXYWithLabel'
            custom'
            customWithLabel'
            customXY'
            customXYWithLabel' =
    case (position, title, customWidgetFuncs', customWindowFuncs') of
     (Nothing,Nothing,Nothing,Nothing) -> new' w h >>= toRef
     (Just (Position (X x) (Y y)), Nothing, Nothing, Nothing) ->  newXY' x y w h >>= toRef
     (Just (Position (X x) (Y y)), (Just l'), Nothing, Nothing) -> newXYWithLabel' x y w h l' >>= toRef
     (Nothing, (Just l'), Nothing, Nothing) -> newWithLabel' w h l' >>= toRef
     (_position, _title, widgetFuncs', windowFuncs') -> do
       p <- mallocBytes {#sizeof fl_Window_Virtual_Funcs #}
       case (widgetFuncs', windowFuncs') of
        (Just widgetfs, Just windowfs) -> do
          fillCustomWidgetFunctionStruct p widgetfs
          fillCustomWindowFunctionStruct p windowfs
        (Just widgetfs, Nothing) -> fillCustomWidgetFunctionStruct p widgetfs
        (Nothing, Just windowfs) -> fillCustomWindowFunctionStruct p windowfs
        (Nothing, Nothing) -> return ()
       case (_position, _title) of
        (Nothing, Nothing) -> custom' w h p >>= toRef
        (Just (Position (X x) (Y y)), Nothing) -> customXY' x y w h p >>= toRef
        (Just (Position (X x) (Y y)), (Just l')) -> customXYWithLabel' x y w h l' p >>= toRef
        (Nothing, (Just l')) -> customWithLabel' w h l' p >>= toRef

{# fun Fl_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
windowCustom :: Size ->
                Maybe Position ->
                Maybe String ->
                Maybe (CustomWidgetFuncs Window) ->
                Maybe (CustomWindowFuncs Window) ->
                IO (Ref Window)
windowCustom size position title customWidgetFuncs' customWindowFuncs' =
  windowMaker
    size
    position
    title
    customWidgetFuncs'
    customWindowFuncs'
    windowNew'
    windowNewWithLabel'
    windowNewXY'
    windowNewXYWithLabel'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

windowNew :: Size ->
             Maybe Position ->
             Maybe String ->
             IO (Ref Window)
windowNew size position title =
  windowMaker
    size
    position
    title
    (Nothing :: (Maybe (CustomWidgetFuncs Window)))
    (Nothing :: (Maybe (CustomWindowFuncs Window)))
    windowNew'
    windowNewWithLabel'
    windowNewXY'
    windowNewXYWithLabel'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun Fl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Window ( IO ()) where
  runOp _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawSuper ()) Window (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (HandleSuper ()) Window ( Int ->  IO (Int)) where
  runOp _ window event = withRef window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) Window ( Rectangle -> IO (())) where
  runOp _ window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) Window (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) Window (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (FlushSuper ()) Window (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) Window ( IO ()) where
  runOp _ window = withRef window (\p -> windowShow' p)

{#fun Fl_Window_handle as windowHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Window ( Event -> IO Int) where
  runOp _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) Window ( Rectangle -> IO (())) where
  runOp _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Window_set_callback as windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}
instance OpWithOriginal (SetCallback ()) Window orig ((Ref orig -> IO ())-> IO ()) where
  runOpWithOriginal _ window _ callback =
   withRef window $ (\p -> do
                           callbackPtr <- toCallbackPrimWithUserData callback
                           windowSetCallback' (castPtr p) callbackPtr)

{# fun Fl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) Window (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Window_changed as changed' { id `Ptr ()' } -> `Int' #}
instance Op (Changed ()) Window (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> changed' winPtr

{# fun Fl_Window_fullscreen as fullscreen' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (MakeFullscreen ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> fullscreen' winPtr

{# fun Fl_Window_fullscreen_off as fullscreenOff' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_fullscreen_off_with_resize as fullscreenOffWithResize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (FullscreenOff ()) Window ( Maybe Rectangle ->  IO (())) where
  runOp _ win (Just rectangle) =
    withRef win $ \winPtr ->
        let (x_pos, y_pos, width, height) = fromRectangle rectangle
        in fullscreenOffWithResize' winPtr x_pos y_pos width height
  runOp _ win Nothing =
    withRef win $ \winPtr -> fullscreenOff' winPtr

{# fun Fl_Window_set_border as setBorder' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance Op (SetBorder ()) Window ( Bool ->  IO (())) where
  runOp _ win b = withRef win $ \winPtr -> setBorder' winPtr b

{# fun Fl_Window_clear_border as clearBorder' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ClearBorder ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> clearBorder' winPtr

{# fun Fl_Window_border as border' { id `Ptr ()' } -> `Bool' toBool#}
instance Op (GetBorder ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> border' winPtr

{# fun Fl_Window_set_override as setOverride' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetOverride ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> setOverride' winPtr

{# fun Fl_Window_override as override' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (GetOverride ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> override' winPtr

{# fun Fl_Window_set_modal as setModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetModal ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> setModal' winPtr

{# fun Fl_Window_modal as modal' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (GetModal ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> modal' winPtr

{# fun Fl_Window_set_non_modal as setNonModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetNonModal ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> setNonModal' winPtr

{# fun Fl_Window_non_modal as nonModal' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (NonModal ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> nonModal' winPtr

{# fun Fl_Window_set_menu_window as setMenuWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetMenuWindow ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> setMenuWindow' winPtr

{# fun Fl_Window_menu_window as menuWindow' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (GetMenuWindow ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> menuWindow' winPtr

{# fun Fl_Window_set_tooltip_window as setTooltipWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetTooltipWindow ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> setTooltipWindow' winPtr

{# fun Fl_Window_tooltip_window as tooltipWindow' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (GetTooltipWindow ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> tooltipWindow' winPtr

{# fun Fl_Window_hotspot_with_x_y as hotspotWithXY' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_x_y_with_offscreen as hotspotWithXYWithOffscreen' { id `Ptr ()',`Int',`Int', fromBool `Bool' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget as hotspotWithWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget_with_offscreen as hotspotWithWidgetWithOffscreen' { id `Ptr ()',id `Ptr ()',fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance Op (HotSpot ()) Window ( PositionSpec -> Maybe Bool -> IO ()) where
  runOp _ win positionSpec offscreen =
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
instance Op (FreePosition ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> freePosition' winPtr

{# fun Fl_Window_size_range as sizeRange' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_size_range_with_args as sizeRangeWithArgs' { id `Ptr ()',`Int',`Int', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SizeRange ()) Window ( Int -> Int -> IO (())) where
  runOp _ win minw' minh' =
    withRef win $ \winPtr -> sizeRange' winPtr minw' minh'
instance Op (SizeRangeWithArgs ()) Window ( Int -> Int -> OptionalSizeRangeArgs ->  IO (())) where
  runOp _ win minw' minh' args =
    withRef win $ \winPtr -> do
      structPtr <- optionalSizeRangeArgsToStruct args
      sizeRangeWithArgs' winPtr minw' minh' structPtr

{# fun Fl_Window_label as label' { id `Ptr ()' } -> `String' #}
instance Op (GetLabel ()) Window (  IO (String)) where
  runOp _ win = withRef win $ \winPtr -> label' winPtr

{# fun Fl_Window_iconlabel as iconlabel' { id `Ptr ()' } -> `String' #}
instance Op (GetIconlabel ()) Window (  IO (String)) where
  runOp _ win = withRef win $ \winPtr -> iconlabel' winPtr

{# fun Fl_Window_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (SetLabel ()) Window ( String ->  IO (())) where
  runOp _ win l' = withRef win $ \winPtr -> setLabel' winPtr l'

{# fun Fl_Window_set_iconlabel as setIconlabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (SetIconlabel ()) Window ( String ->  IO (())) where
  runOp _ win l' = withRef win $ \winPtr -> setIconlabel' winPtr l'

{# fun Fl_Window_set_label_with_iconlabel as setLabelWithIconlabel' { id `Ptr ()',`String',`String' } -> `()' supressWarningAboutRes #}
instance Op (SetLabelWithIconlabel ()) Window ( String -> String ->  IO (())) where
  runOp _ win label iconlabel = withRef win $ \winPtr -> setLabelWithIconlabel' winPtr label iconlabel

{# fun Fl_Window_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (CopyLabel ()) Window ( String ->  IO (())) where
  runOp _ win a = withRef win $ \winPtr -> copyLabel' winPtr a

{# fun Fl_Window_xclass as xclass' { id `Ptr ()' } -> `String' #}
instance Op (GetXclass ()) Window (  IO (String)) where
  runOp _ win = withRef win $ \winPtr -> xclass' winPtr

{# fun Fl_Window_set_xclass as setXclass' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (SetXclass ()) Window ( String ->  IO (())) where
  runOp _ win c = withRef win $ \winPtr -> setXclass' winPtr c

{# fun Fl_Window_icon as icon' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (GetIcon ()) Window (  IO (Ptr ())) where
  runOp _ win = withRef win $ \winPtr -> icon' winPtr

{# fun Fl_Window_set_icon as setIcon' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetIcon ()) Window ( Ptr () ->  IO (())) where
  runOp _ win bitmap = withRef win $ \winPtr -> setIcon' winPtr bitmap

{# fun Fl_Window_shown as shown' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (Shown ()) Window (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> shown' winPtr

{# fun Fl_Window_iconize as iconize' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Iconize ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> iconize' winPtr

{# fun Fl_Window_x_root as xRoot' { id `Ptr ()' } -> `Int' #}
instance Op (GetXRoot ()) Window (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> xRoot' winPtr

{# fun Fl_Window_y_root as yRoot' { id `Ptr ()' } -> `Int' #}
instance Op (GetYRoot ()) Window (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> yRoot' winPtr

{# fun Fl_Window_current as current' {  } -> `Ptr ()' id #}
currentWindow ::  (FindObj a Window Same) => IO (Ref a)
currentWindow = current' >>= toRef

{# fun Fl_Window_make_current as makeCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (MakeCurrent ()) Window (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> makeCurrent' winPtr

{# fun Fl_Window_set_cursor_with_bg as setCursorWithBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg as setCursorWithFg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg_bg as setCursorWithFgBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor as setCursor' { id `Ptr ()',cFromEnum `CursorType' } -> `()' supressWarningAboutRes #}
instance Op (SetCursor ()) Window ( CursorType -> IO ()) where
  runOp _ win cursor =  withRef win $ \winPtr -> setCursor' winPtr cursor
instance Op (SetCursorWithFgBg ()) Window ( CursorType -> (Maybe Color, Maybe Color) ->  IO (())) where
  runOp _ win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withRef win $ \winPtr -> setCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withRef win $ \winPtr -> setCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withRef win $ \winPtr -> setCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withRef win $ \winPtr -> setCursor' winPtr cursor

{# fun Fl_Window_set_default_cursor_with_bg as setDefaultCursorWithBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor_with_fg as setDefaultCursorWithFg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor_with_fg_bg as setDefaultCursorWithFgBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor as setDefaultCursor' { id `Ptr ()',cFromEnum `CursorType' } -> `()' supressWarningAboutRes #}
instance Op (SetDefaultCursor ()) Window ( CursorType ->  IO (())) where
  runOp _ win cursor = withRef win $ \winPtr -> setDefaultCursor' winPtr cursor
instance Op (SetDefaultCursorWithFgBg ()) Window ( CursorType -> (Maybe Color, Maybe Color) ->  IO (())) where
  runOp _ win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withRef win $ \winPtr -> setDefaultCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withRef win $ \winPtr -> setDefaultCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withRef win $ \winPtr -> setDefaultCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withRef win $ \winPtr -> setDefaultCursor' winPtr cursor

{# fun Fl_Window_decorated_w as decoratedW' { id `Ptr ()' } -> `Int' #}
instance Op (GetDecoratedW ()) Window (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> decoratedW' winPtr

{# fun Fl_Window_decorated_h as decoratedH' { id `Ptr ()' } -> `Int' #}
instance Op (GetDecoratedH ()) Window (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> decoratedH' winPtr

{# fun Fl_Window_draw_box as windowDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_tc as windowDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_txywhc as windowDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (DrawBox ()) Window ( IO ()) where
  runOp _ window = withRef window $ \windowPtr -> windowDrawBox' windowPtr
instance Op (DrawBoxWithBoxtype ()) Window ( Boxtype -> Color -> Maybe Rectangle -> IO ()) where
  runOp _ window bx c Nothing =
              withRef window $ \windowPtr -> windowDrawBoxWithTC' windowPtr bx c
  runOp _ window bx c (Just r) =
              withRef window $ \windowPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                windowDrawBoxWithTXywhC' windowPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Window_draw_backdrop as windowDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawBackdrop ()) Window ( IO ()) where
  runOp _ window = withRef window $ \windowPtr -> windowDrawBackdrop' windowPtr

{# fun Fl_Window_draw_focus as windowDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_focus_with_txywh as windowDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance Op (DrawFocus ()) Window ( Maybe (Boxtype, Rectangle) -> IO ()) where
  runOp _ window Nothing =
                withRef window $ \ windowPtr -> windowDrawFocus' windowPtr
  runOp _ window (Just (bx, r)) =
                withRef window $ \windowPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  windowDrawFocusWithTXywh' windowPtr bx x_pos y_pos w_pos h_pos

{# fun Fl_Window_wait_for_expose as waitForExpose' { id `Ptr ()' } -> `()' #}
instance Op (WaitForExpose ()) Window (  IO ()) where
  runOp _ win = withRef win $ \winPtr -> waitForExpose' winPtr
