{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Widget
    (
     Widget,
     PositionSpec(..),
     CustomWidgetFuncs(..),
     defaultCustomWidgetFuncs,
     fillCustomWidgetFunctionStruct,
     customWidgetFunctionStruct,
     onWidget,
     -- * Constructor
     widgetNew,
     widgetMaker,
     -- * Fl_Widget specific
     WidgetTransformCallback,
     Callback(..),
     BaseCallback(..),
     GetPointerF,
     WidgetEventHandlerPrim,
     WidgetTransformCallbackPrim,
     RectangleFPrim,
     EventDispatchPrim,
     wrapEventDispatchPrim,
     toRectangleFPrim,
     toEventHandlerPrim,
     toCallbackPrim,
     toCallbackPrimWithUserData,
     toBaseCallbackPrim,
     toWidgetTransformCallbackPrim,
     unwrapEventDispatchPrim
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations hiding (selectionColor)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

type WidgetTransformCallback     = Ref Widget -> IO (Ref Widget)
data Callback                    = forall a. (FindObj a Widget Same) => Callback (Ref a -> IO ())
data BaseCallback                = forall a. (FindObj a Base   Same) => BaseCallback (Ref a -> IO ())
type GetPointerF                 = Ptr () -> IO (Ptr ())
type WidgetEventHandlerPrim      = Ptr () -> CInt -> IO CInt
type WidgetTransformCallbackPrim = Ptr () -> IO (Ptr ())
type RectangleFPrim              = Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ()
type EventDispatchPrim           = CInt -> Ptr () -> IO CInt
data PositionSpec = ByPosition Position
                  | forall a. (FindObj a Widget Same) => ByWidget (Ref a)

foreign import ccall "wrapper"
        mkWidgetTransformCallbackPtr :: WidgetTransformCallbackPrim -> IO (FunPtr WidgetTransformCallbackPrim)
foreign import ccall "wrapper"
        mkWidgetEventHandler :: (Ptr () -> CInt -> IO CInt) -> IO (FunPtr (Ptr () -> CInt -> IO CInt))
foreign import ccall "wrapper"
        mkRectanglePtr :: RectangleFPrim -> IO (FunPtr RectangleFPrim)
foreign import ccall "wrapper"
        mkGetPointerPtr :: GetPointerF -> IO (FunPtr GetPointerF)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim -> IO (FunPtr EventDispatchPrim)
foreign import ccall "dynamic"
        unwrapEventDispatchPrim :: FunPtr EventDispatchPrim -> EventDispatchPrim

toRectangleFPrim ::  (Ref a -> Rectangle -> IO ()) ->
                     IO (FunPtr (Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ()))
toRectangleFPrim f = mkRectanglePtr $ \wPtr x_pos y_pos width height ->
  let rectangle = toRectangle (fromIntegral x_pos,
                               fromIntegral y_pos,
                               fromIntegral width,
                               fromIntegral height)
  in do
  fptr <- wrapNonNull wPtr "Null Pointer. toRectangleFPrim"
  f (wrapInRef fptr) rectangle

toEventHandlerPrim :: (Ref a -> Event -> IO Int) ->
                      IO (FunPtr (Ptr () -> CInt -> IO CInt))
toEventHandlerPrim f = mkWidgetEventHandler $
                       \wPtr eventNumber ->
                            let event = cToEnum (eventNumber :: CInt)
                            in do
                            fptr <- wrapNonNull wPtr "Null Pointer: toEventHandlerPrim"
                            result <- f (wrapInRef fptr) event
                            return $ fromIntegral result

onWidget :: (FindObj a Widget Same) => Ref a -> (Ref a -> IO ()) -> (Ref a -> IO ())
onWidget _ = id

toCallbackPrim :: (Ref a -> IO ()) ->
                  IO (FunPtr (Ptr () -> IO ()))
toCallbackPrim f = mkCallbackPtr $ \ptr -> do
  pp <- wrapNonNull ptr "Null pointer. toCallbackPrim"
  f (castTo (wrapInRef pp))


toCallbackPrimWithUserData :: (Ref a -> IO ()) ->
                              IO (FunPtr (Ptr () -> Ptr () -> IO ()))
toCallbackPrimWithUserData f = mkWidgetCallbackPtr $ \ptr _ -> do
  pp <- wrapNonNull ptr "Null pointer: toWidgetCallbackPrim"
  f (castTo (wrapInRef pp))

toBaseCallbackPrim :: BaseCallback -> IO (FunPtr CallbackPrim)
toBaseCallbackPrim (BaseCallback f) = mkCallbackPtr $ \ptr -> do
  pp <- wrapNonNull ptr "Null pointer: toBaseCallbackPrim"
  f (castTo (wrapInRef pp))

toWidgetTransformCallbackPrim :: (Ref Widget -> IO (Ref Widget))->
                                 IO (FunPtr (Ptr () -> IO (Ptr ())))
toWidgetTransformCallbackPrim f =
    mkWidgetTransformCallbackPtr $ \ptr -> do
      pp <- wrapNonNull ptr "Null pointer. toWidgetTransformCallbackPrim"
      widget <- f (castTo (wrapInRef pp))
      unsafeRefToPtr widget

data CustomWidgetFuncs a =
    CustomWidgetFuncs
    {
     drawCustom   :: Maybe (Ref a -> IO ())
    ,handleCustom :: Maybe (Ref a -> Event -> IO Int)
    ,resizeCustom :: Maybe (Ref a -> Rectangle -> IO ())
    ,showCustom   :: Maybe (Ref a -> IO ())
    ,hideCustom   :: Maybe (Ref a -> IO ())
    }

fillCustomWidgetFunctionStruct :: forall a. (FindObj a Widget Same) =>
                                  Ptr () ->
                                  CustomWidgetFuncs a ->
                                  IO ()
fillCustomWidgetFunctionStruct structPtr (CustomWidgetFuncs _draw' _handle' _resize' _show' _hide') = do
      toCallbackPrim `orNullFunPtr` _draw'       >>= {#set fl_Widget_Virtual_Funcs->draw#} structPtr
      toEventHandlerPrim `orNullFunPtr` _handle' >>= {#set fl_Widget_Virtual_Funcs->handle#} structPtr
      toRectangleFPrim `orNullFunPtr` _resize'   >>= {#set fl_Widget_Virtual_Funcs->resize#} structPtr
      toCallbackPrim `orNullFunPtr` _show'       >>= {#set fl_Widget_Virtual_Funcs->show#} structPtr
      toCallbackPrim `orNullFunPtr` _hide'       >>= {#set fl_Widget_Virtual_Funcs->hide#} structPtr

customWidgetFunctionStruct :: forall a. (FindObj a Widget Same) =>
                              CustomWidgetFuncs a ->
                              IO (Ptr ())
customWidgetFunctionStruct customWidgetFuncs' = do
  p <- mallocBytes {#sizeof fl_Widget_Virtual_Funcs #}
  fillCustomWidgetFunctionStruct p customWidgetFuncs'
  return p


defaultCustomWidgetFuncs :: forall a. (FindObj a Widget Same) => CustomWidgetFuncs a
defaultCustomWidgetFuncs = CustomWidgetFuncs
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing

widgetMaker :: forall a. (FindObj a Widget Same) =>
               Rectangle ->
               Maybe String ->
               Maybe (CustomWidgetFuncs a) ->
               (Int -> Int -> Int -> Int -> IO ( Ptr () )) ->
               (Int -> Int -> Int -> Int -> String -> IO ( Ptr () )) ->
               (Int -> Int -> Int -> Int -> Ptr () -> IO ( Ptr () )) ->
               (Int -> Int -> Int -> Int -> String -> Ptr () -> IO ( Ptr () )) ->
               IO (Ref a)
widgetMaker rectangle _label' customFuncs' new' newWithLabel' newWithCustomFuncs' newWithCustomFuncsLabel' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case (_label', customFuncs') of
        (Nothing,Nothing) -> new' x_pos y_pos width height >>= toRef
        ((Just l), Nothing) -> newWithLabel' x_pos y_pos width height l >>= toRef
        ((Just l), (Just fs)) -> do
          ptr <- customWidgetFunctionStruct fs
          newWithCustomFuncsLabel' x_pos y_pos width height l (castPtr ptr) >>= toRef
        (Nothing, (Just fs)) -> do
          ptr <- customWidgetFunctionStruct fs
          newWithCustomFuncs' x_pos y_pos width height (castPtr ptr) >>= toRef

{# fun Fl_Widget_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Widget_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
widgetNew :: Rectangle -> Maybe String -> Maybe (CustomWidgetFuncs Widget) -> IO (Ref Widget)
widgetNew rectangle l' funcs' =
  widgetMaker
    rectangle
    l'
    funcs'
    widgetNew'
    widgetNewWithLabel'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Widget_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Widget (IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    widgetDestroy' winPtr
    return nullPtr

{#fun Fl_Widget_handle as widgetHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Widget (Event -> IO Int) where
    runOp _ widget event = withRef widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event))

{#fun Fl_Widget_parent as widgetParent' { id `Ptr ()'} -> `Ptr ()' id #}
instance Op (GetParent ()) Widget (IO (Ref Group)) where
    runOp _ widget = withRef widget widgetParent' >>= toRef

{#fun Fl_Widget_set_parent as widgetSetParent' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Group Same) => Op (SetParent ()) Widget (Ref a -> IO ()) where
    runOp _ widget group =
      withRef widget
      (\widgetPtr ->
        withRef group (\groupPtr ->
                        widgetSetParent' widgetPtr groupPtr
                      )
      )
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance Op (GetType_ ()) Widget ( IO (Word8)) where
    runOp _ widget = withRef widget $ \widgetPtr -> type' widgetPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance Op (SetType ()) Widget (Word8 ->  IO (())) where
  runOp _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr t
{# fun Fl_Widget_draw_label as drawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
instance Op (DrawLabel ()) Widget (Maybe (Rectangle,AlignType)->  IO (())) where
  runOp _ widget Nothing = withRef widget $ \widgetPtr -> drawLabel' widgetPtr
  runOp _ widget (Just (rectangle,align_)) = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    drawLabelWithXywhAlignment' widgetPtr x_pos y_pos w_pos h_pos align_

{# fun Fl_Widget_x as x' { id `Ptr ()' } -> `Int' #}
instance Op (GetX ()) Widget (IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> x' widgetPtr
{# fun Fl_Widget_y as y' { id `Ptr ()' } -> `Int' #}
instance Op (GetY ()) Widget (IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> y' widgetPtr
{# fun Fl_Widget_w as w' { id `Ptr ()' } -> `Int' #}
instance Op (GetW ()) Widget (IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> w' widgetPtr
{# fun Fl_Widget_h as h' { id `Ptr ()' } -> `Int' #}
instance Op (GetH ()) Widget (IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> h' widgetPtr
{# fun Fl_Widget_set_align as setAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
instance Op (SetAlign ()) Widget (AlignType ->  IO (())) where
  runOp _ widget _align = withRef widget $ \widgetPtr -> setAlign' widgetPtr _align
{# fun Fl_Widget_align as align' { id `Ptr ()' } -> `AlignType' cToEnum #}
instance Op (GetAlign ()) Widget ( IO (AlignType)) where
  runOp _ widget = withRef widget $ \widgetPtr -> align' widgetPtr
{# fun Fl_Widget_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance Op (GetBox ()) Widget ( IO (Boxtype)) where
  runOp _ widget = withRef widget $ \widgetPtr -> box' widgetPtr
{# fun Fl_Widget_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance Op (SetBox ()) Widget (Boxtype ->  IO (())) where
  runOp _ widget new_box = withRef widget $ \widgetPtr -> setBox' widgetPtr new_box
{# fun Fl_Widget_color as color' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetColor ()) Widget ( IO (Color)) where
  runOp _ widget = withRef widget $ \widgetPtr -> color' widgetPtr
{# fun Fl_Widget_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (SetColor ()) Widget (Color ->  IO (())) where
  runOp _ widget bg = withRef widget $ \widgetPtr -> setColor' widgetPtr bg
{# fun Fl_Widget_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (SetColorWithBgSel ()) Widget (Color -> Color ->  IO (())) where
  runOp _ widget bg a = withRef widget $ \widgetPtr -> setColorWithBgSel' widgetPtr bg a
{# fun Fl_Widget_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (SelectionColor ()) Widget ( IO (Color)) where
  runOp _ widget = withRef widget $ \widgetPtr -> selectionColor' widgetPtr
{# fun Fl_Widget_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (SetSelectionColor ()) Widget (Color ->  IO (())) where
  runOp _ widget a = withRef widget $ \widgetPtr -> setSelectionColor' widgetPtr a
{# fun Fl_Widget_label as label' { id `Ptr ()' } -> `String' #}
instance Op (GetLabel ()) Widget ( IO (String)) where
  runOp _ widget = withRef widget $ \widgetPtr -> label' widgetPtr
{# fun Fl_Widget_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (CopyLabel ()) Widget (String ->  IO (())) where
  runOp _ widget new_label = withRef widget $ \widgetPtr -> copyLabel' widgetPtr new_label
{# fun Fl_Widget_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (SetLabel ()) Widget (String ->  IO (())) where
  runOp _ widget text = withRef widget $ \widgetPtr -> setLabel' widgetPtr text
{# fun Fl_Widget_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
instance Op (GetLabeltype ()) Widget ( IO (Labeltype)) where
  runOp _ widget = withRef widget $ \widgetPtr -> labeltype' widgetPtr
{# fun Fl_Widget_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
instance Op (SetLabeltype ()) Widget (Labeltype ->  IO (())) where
  runOp _ widget a = withRef widget $ \widgetPtr -> setLabeltype' widgetPtr a
{# fun Fl_Widget_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetLabelcolor ()) Widget ( IO (Color)) where
  runOp _ widget = withRef widget $ \widgetPtr -> labelcolor' widgetPtr
{# fun Fl_Widget_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (SetLabelcolor ()) Widget (Color ->  IO (())) where
  runOp _ widget c = withRef widget $ \widgetPtr -> setLabelcolor' widgetPtr c
{# fun Fl_Widget_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance Op (GetLabelfont ()) Widget ( IO (Font)) where
  runOp _ widget = withRef widget $ \widgetPtr -> labelfont' widgetPtr
{# fun Fl_Widget_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
instance Op (SetLabelfont ()) Widget (Font ->  IO (())) where
  runOp _ widget c = withRef widget $ \widgetPtr -> setLabelfont' widgetPtr c
{# fun Fl_Widget_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance Op (GetLabelsize ()) Widget ( IO (FontSize)) where
  runOp _ widget = withRef widget $ \widgetPtr -> labelsize' widgetPtr >>= return . FontSize
{# fun Fl_Widget_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
instance Op (SetLabelsize ()) Widget (FontSize ->  IO (())) where
  runOp _ widget (FontSize pix) = withRef widget $ \widgetPtr -> setLabelsize' widgetPtr pix
{# fun Fl_Widget_image as image' { id `Ptr ()' } -> `(Ref Image)' unsafeToRef #}
instance Op (GetImage ()) Widget ( IO (Ref Image)) where
  runOp _ widget = withRef widget $ \widgetPtr -> image' widgetPtr
{# fun Fl_Widget_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (FindObj a Image Same) => Op (SetImage ()) Widget (Ref a ->  IO (())) where
  runOp _ widget pix = withRef widget $ \widgetPtr -> withRef pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `(Ref Image)' unsafeToRef #}
instance Op (GetDeimage ()) Widget ( IO (Ref Image)) where
  runOp _ widget = withRef widget $ \widgetPtr -> deimage' widgetPtr
{# fun Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (FindObj a Image Same) => Op (SetDeimage ()) Widget (Ref a ->  IO (())) where
  runOp _ widget pix = withRef widget $ \widgetPtr -> withRef pix $ \pixPtr -> setDeimage' widgetPtr pixPtr
{# fun Fl_Widget_tooltip as tooltip' { id `Ptr ()' } -> `String' #}
instance Op (GetTooltip ()) Widget ( IO (String)) where
  runOp _ widget = withRef widget $ \widgetPtr -> tooltip' widgetPtr
{# fun Fl_Widget_copy_tooltip as copyTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (CopyTooltip ()) Widget (String ->  IO (())) where
  runOp _ widget text = withRef widget $ \widgetPtr -> copyTooltip' widgetPtr text
{# fun Fl_Widget_set_tooltip as setTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance Op (SetTooltip ()) Widget (String ->  IO (())) where
  runOp _ widget text = withRef widget $ \widgetPtr -> setTooltip' widgetPtr text
{# fun Fl_Widget_when as when' { id `Ptr ()' } -> `When' cToEnum #}
instance Op (GetWhen ()) Widget ( IO (When)) where
  runOp _ widget = withRef widget $ \widgetPtr -> when' widgetPtr
{# fun Fl_Widget_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance Op (SetWhen ()) Widget (Word8 ->  IO (())) where
  runOp _ widget i = withRef widget $ \widgetPtr -> setWhen' widgetPtr i
{# fun Fl_Widget_visible as visible' { id `Ptr ()' } -> `Int' #}
instance Op (GetVisible ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> visible' widgetPtr
{# fun Fl_Widget_visible_r as visibleR' { id `Ptr ()' } -> `Int' #}
instance Op (GetVisibleR ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> visibleR' widgetPtr
{# fun Fl_Widget_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> showSuper' widgetPtr
{# fun Fl_Widget_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Widget_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Widget_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr
{# fun Fl_Widget_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetVisible ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> setVisible' widgetPtr
{# fun Fl_Widget_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ClearVisible ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> clearVisible' widgetPtr
{# fun Fl_Widget_active as active' { id `Ptr ()' } -> `Int' #}
instance Op (Active ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> active' widgetPtr
{# fun Fl_Widget_active_r as activeR' { id `Ptr ()' } -> `Int' #}
instance Op (ActiveR ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> activeR' widgetPtr
{# fun Fl_Widget_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Activate ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> activate' widgetPtr
{# fun Fl_Widget_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Deactivate ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> deactivate' widgetPtr
{# fun Fl_Widget_output as output' { id `Ptr ()' } -> `Int' #}
instance Op (GetOutput ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> output' widgetPtr
{# fun Fl_Widget_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetOutput ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> setOutput' widgetPtr
{# fun Fl_Widget_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ClearOutput ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> clearOutput' widgetPtr
{# fun Fl_Widget_takesevents as takesevents' { id `Ptr ()' } -> `Int' #}
instance Op (Takesevents ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> takesevents' widgetPtr
{# fun Fl_Widget_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetChanged ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> setChanged' widgetPtr
{# fun Fl_Widget_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (GetClearChanged ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> clearChanged' widgetPtr
{# fun Fl_Widget_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
instance Op (TakeFocus ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> takeFocus' widgetPtr
{# fun Fl_Widget_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetVisibleFocus ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> setVisibleFocus' widgetPtr
{# fun Fl_Widget_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ClearVisibleFocus ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> clearVisibleFocus' widgetPtr
{# fun Fl_Widget_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ModifyVisibleFocus ()) Widget (Int ->  IO (())) where
  runOp _ widget v = withRef widget $ \widgetPtr -> modifyVisibleFocus' widgetPtr v
{# fun Fl_Widget_visible_focus as visibleFocus' { id `Ptr ()' } -> `Int' #}
instance Op (GetVisibleFocus ()) Widget ( IO (Int)) where
  runOp _ widget = withRef widget $ \widgetPtr -> visibleFocus' widgetPtr
{# fun Fl_Widget_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (FindObj a Widget Same) => Op (Contains ()) Widget (Ref a ->  IO (Int)) where
  runOp _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr -> contains' widgetPtr otherWidgetPtr
{# fun Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (FindObj a Widget Same) => Op (Inside ()) Widget (Ref a -> IO (Int)) where
  runOp _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr -> inside' widgetPtr otherWidgetPtr
{# fun Fl_Widget_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Redraw ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> redraw' widgetPtr
{# fun Fl_Widget_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (RedrawLabel ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> redrawLabel' widgetPtr
{# fun Fl_Widget_damage as damage' { id `Ptr ()' } -> `Word8' #}
instance Op (GetDamage ()) Widget ( IO (Word8)) where
  runOp _ widget = withRef widget $ \widgetPtr -> damage' widgetPtr
{# fun Fl_Widget_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance Op (ClearDamageWithBitmask ()) Widget (Word8 ->  IO (())) where
  runOp _ widget c = withRef widget $ \widgetPtr -> clearDamageWithBitmask' widgetPtr c
{# fun Fl_Widget_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ClearDamage ()) Widget ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> clearDamage' widgetPtr
{# fun Fl_Widget_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance Op (GetDamageWithText ()) Widget (Word8 ->  IO (())) where
  runOp _ widget c = withRef widget $ \widgetPtr -> damageWithText' widgetPtr c
{# fun Fl_Widget_damage_inside_widget as damageInsideWidget' { id `Ptr ()',`Word8',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (GetDamageInsideWidget ()) Widget (Word8 -> Rectangle ->  IO (())) where
  runOp _ widget c rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    damageInsideWidget' widgetPtr c x_pos y_pos w_pos h_pos
{# fun Fl_Widget_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
instance Op (MeasureLabel ()) Widget (IO (Size)) where
  runOp _ widget = withRef widget $ \widgetPtr -> measureLabel' widgetPtr >>= \(width, height) -> return $ Size (Width width) (Height height)
{# fun Fl_Widget_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (GetWindow ()) Widget ( IO (Ref Window)) where
  runOp _ widget = withRef widget $ \widgetPtr -> window' widgetPtr >>= toRef
{# fun Fl_Widget_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (GetTopWindow ()) Widget ( IO (Ref Window)) where
  runOp _ widget = withRef widget $ \widgetPtr -> (topWindow' widgetPtr) >>= toRef
{# fun Fl_Widget_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
instance Op (GetTopWindowOffset ()) Widget (IO (Position)) where
  runOp _ widget = withRef widget $ \widgetPtr -> topWindowOffset' widgetPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun Fl_Widget_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) Widget (Rectangle ->  IO (())) where
  runOp _ widget rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resizeSuper' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) Widget (Rectangle -> IO (())) where
  runOp _ widget rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}

instance OpWithOriginal (SetCallback ()) Widget orig ((Ref orig -> IO ())-> IO ()) where
  runOpWithOriginal _ widget _ callback = withRef widget $ \widgetPtr -> do
    ptr <- toCallbackPrimWithUserData callback
    setCallback' widgetPtr (castFunPtr ptr)

{# fun Fl_Widget_draw_box as widgetDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_tc as widgetDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_txywhc as widgetDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (DrawBox ()) Widget (IO ()) where
  runOp _ widget = withRef widget $ \widgetPtr -> widgetDrawBox' widgetPtr
instance Op (DrawBoxWithBoxtype ()) Widget (Boxtype -> Color -> Maybe Rectangle -> IO ()) where
  runOp _ widget bx c Nothing =
    withRef widget $ \widgetPtr -> widgetDrawBoxWithTC' widgetPtr bx c
  runOp _ widget bx c (Just r) =
              withRef widget $ \widgetPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                widgetDrawBoxWithTXywhC' widgetPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Widget_draw_backdrop as widgetDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawBackdrop ()) Widget (IO ()) where
  runOp _ widget = withRef widget $ \widgetPtr -> widgetDrawBackdrop' widgetPtr

{# fun Fl_Widget_draw_focus as widgetDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_focus_with_txywh as widgetDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance Op (DrawFocus ()) Widget (Maybe (Boxtype, Rectangle) -> IO ()) where
  runOp _ widget Nothing =
                withRef widget $ \ widgetPtr -> widgetDrawFocus' widgetPtr
  runOp _ widget (Just (bx, r)) =
                withRef widget $ \widgetPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  widgetDrawFocusWithTXywh' widgetPtr bx x_pos y_pos w_pos h_pos
