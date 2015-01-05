{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
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
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

type WidgetTransformCallback     = Ref Widget -> IO (Ref Widget)
data Callback                    = forall a. (Parent a Widget) => Callback (Ref a -> IO ())
data BaseCallback                = forall a. (Parent a Base  ) => BaseCallback (Ref a -> IO ())
type WidgetEventHandlerPrim      = Ptr () -> CInt -> IO CInt
type WidgetTransformCallbackPrim = Ptr () -> IO (Ptr ())
type RectangleFPrim              = Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ()
type EventDispatchPrim           = CInt -> Ptr () -> IO CInt
data PositionSpec = ByPosition Position
                  | forall a. (Parent a Widget) => ByWidget (Ref a)

foreign import ccall "wrapper"
        mkWidgetTransformCallbackPtr :: WidgetTransformCallbackPrim -> IO (FunPtr WidgetTransformCallbackPrim)
foreign import ccall "wrapper"
        mkWidgetEventHandler :: (Ptr () -> CInt -> IO CInt) -> IO (FunPtr (Ptr () -> CInt -> IO CInt))
foreign import ccall "wrapper"
        mkRectanglePtr :: RectangleFPrim -> IO (FunPtr RectangleFPrim)
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

onWidget :: (Parent a Widget) => Ref a -> (Ref a -> IO ()) -> (Ref a -> IO ())
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

fillCustomWidgetFunctionStruct :: forall a. (Parent a Widget) =>
                                  Ptr () ->
                                  CustomWidgetFuncs a ->
                                  IO ()
fillCustomWidgetFunctionStruct structPtr (CustomWidgetFuncs _draw' _handle' _resize' _show' _hide') = do
      toCallbackPrim `orNullFunPtr` _draw'       >>= {#set fl_Widget_Virtual_Funcs->draw#} structPtr
      toEventHandlerPrim `orNullFunPtr` _handle' >>= {#set fl_Widget_Virtual_Funcs->handle#} structPtr
      toRectangleFPrim `orNullFunPtr` _resize'   >>= {#set fl_Widget_Virtual_Funcs->resize#} structPtr
      toCallbackPrim `orNullFunPtr` _show'       >>= {#set fl_Widget_Virtual_Funcs->show#} structPtr
      toCallbackPrim `orNullFunPtr` _hide'       >>= {#set fl_Widget_Virtual_Funcs->hide#} structPtr

customWidgetFunctionStruct :: forall a. (Parent a Widget) =>
                              CustomWidgetFuncs a ->
                              IO (Ptr ())
customWidgetFunctionStruct customWidgetFuncs' = do
  p <- mallocBytes {#sizeof fl_Widget_Virtual_Funcs #}
  fillCustomWidgetFunctionStruct p customWidgetFuncs'
  return p


defaultCustomWidgetFuncs :: forall a. (Parent a Widget) => CustomWidgetFuncs a
defaultCustomWidgetFuncs = CustomWidgetFuncs
                            Nothing
                            Nothing
                            Nothing
                            Nothing
                            Nothing

widgetMaker :: forall a. (Parent a Widget) =>
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
instance (impl ~  IO ()) => Op (Destroy ()) Widget orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    widgetDestroy' winPtr
    return nullPtr

{#fun Fl_Widget_handle as widgetHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Widget orig impl where
  runOp _ _ widget event = withRef widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event))

{#fun Fl_Widget_parent as widgetParent' { id `Ptr ()'} -> `Ptr ()' id #}
instance (impl ~  IO (Ref Group)) => Op (GetParent ()) Widget orig impl where
  runOp _ _ widget = withRef widget widgetParent' >>= toRef

{#fun Fl_Widget_set_parent as widgetSetParent' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Group, impl ~ (Ref a -> IO ())) => Op (SetParent ()) Widget orig impl where
  runOp _ _ widget group =
      withRef widget
      (\widgetPtr ->
        withRef group (\groupPtr ->
                        widgetSetParent' widgetPtr groupPtr
                      )
      )
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (Word8)) => Op (GetType_ ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Word8 ->  IO ())) => Op (SetType ()) Widget orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr t
{# fun Fl_Widget_draw_label as drawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Rectangle,AlignType)->  IO ())) => Op (DrawLabel ()) Widget orig impl where
  runOp _ _ widget Nothing = withRef widget $ \widgetPtr -> drawLabel' widgetPtr
  runOp _ _ widget (Just (rectangle,align_)) = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    drawLabelWithXywhAlignment' widgetPtr x_pos y_pos w_pos h_pos align_

{# fun Fl_Widget_x as x' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Int)) => Op (GetX ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> x' widgetPtr
{# fun Fl_Widget_y as y' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Int)) => Op (GetY ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> y' widgetPtr
{# fun Fl_Widget_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Int)) => Op (GetW ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> w' widgetPtr
{# fun Fl_Widget_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Int)) => Op (GetH ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> h' widgetPtr
{# fun Fl_Widget_set_align as setAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
instance (impl ~ (AlignType ->  IO ())) => Op (SetAlign ()) Widget orig impl where
  runOp _ _ widget _align = withRef widget $ \widgetPtr -> setAlign' widgetPtr _align
{# fun Fl_Widget_align as align' { id `Ptr ()' } -> `AlignType' cToEnum #}
instance (impl ~ IO (AlignType)) => Op (GetAlign ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> align' widgetPtr
{# fun Fl_Widget_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ IO (Boxtype)) => Op (GetBox ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> box' widgetPtr
{# fun Fl_Widget_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetBox ()) Widget orig impl where
  runOp _ _ widget new_box = withRef widget $ \widgetPtr -> setBox' widgetPtr new_box
{# fun Fl_Widget_color as color' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ IO (Color)) => Op (GetColor ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> color' widgetPtr
{# fun Fl_Widget_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color ->  IO ())) => Op (SetColor ()) Widget orig impl where
  runOp _ _ widget bg = withRef widget $ \widgetPtr -> setColor' widgetPtr bg
{# fun Fl_Widget_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color -> Color ->  IO ())) => Op (SetColorWithBgSel ()) Widget orig impl where
  runOp _ _ widget bg a = withRef widget $ \widgetPtr -> setColorWithBgSel' widgetPtr bg a
{# fun Fl_Widget_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ IO (Color)) => Op (GetSelectionColor ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> selectionColor' widgetPtr
{# fun Fl_Widget_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color ->  IO ())) => Op (SetSelectionColor ()) Widget orig impl where
  runOp _ _ widget a = withRef widget $ \widgetPtr -> setSelectionColor' widgetPtr a
{# fun Fl_Widget_label as label' { id `Ptr ()' } -> `String' #}
instance (impl ~ IO (String)) => Op (GetLabel ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> label' widgetPtr
{# fun Fl_Widget_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String ->  IO ())) => Op (CopyLabel ()) Widget orig impl where
  runOp _ _ widget new_label = withRef widget $ \widgetPtr -> copyLabel' widgetPtr new_label
{# fun Fl_Widget_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( String -> IO ())) => Op (SetLabel ()) Widget orig impl where
  runOp _ _ widget text = withRef widget $ \widgetPtr -> setLabel' widgetPtr text
{# fun Fl_Widget_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
instance (impl ~ (IO (Labeltype))) => Op (GetLabeltype ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labeltype' widgetPtr
{# fun Fl_Widget_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Labeltype ->  IO ())) => Op (SetLabeltype ()) Widget orig impl where
  runOp _ _ widget a = withRef widget $ \widgetPtr -> setLabeltype' widgetPtr a
{# fun Fl_Widget_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelcolor ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labelcolor' widgetPtr
{# fun Fl_Widget_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Color ->  IO ())) => Op (SetLabelcolor ()) Widget orig impl where
  runOp _ _ widget c = withRef widget $ \widgetPtr -> setLabelcolor' widgetPtr c
{# fun Fl_Widget_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ (IO (Font))) => Op (GetLabelfont ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labelfont' widgetPtr
{# fun Fl_Widget_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Font ->  IO ())) => Op (SetLabelfont ()) Widget orig impl where
  runOp _ _ widget c = withRef widget $ \widgetPtr -> setLabelfont' widgetPtr c
{# fun Fl_Widget_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ (IO (FontSize))) => Op (GetLabelsize ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labelsize' widgetPtr >>= return . FontSize
{# fun Fl_Widget_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( FontSize ->  IO ())) => Op (SetLabelsize ()) Widget orig impl where
  runOp _ _ widget (FontSize pix) = withRef widget $ \widgetPtr -> setLabelsize' widgetPtr pix
{# fun Fl_Widget_image as image' { id `Ptr ()' } -> `(Ref Image)' unsafeToRef #}
instance (impl ~ (IO (Ref Image))) => Op (GetImage ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> image' widgetPtr
{# fun Fl_Widget_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Ref a ->  IO ())) => Op (SetImage ()) Widget orig impl where
  runOp _ _ widget pix = withRef widget $ \widgetPtr -> withRef pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `(Ref Image)' unsafeToRef #}
instance (impl ~ (IO (Ref Image))) => Op (GetDeimage ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> deimage' widgetPtr
{# fun Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Ref a ->  IO ())) => Op (SetDeimage ()) Widget orig impl where
  runOp _ _ widget pix = withRef widget $ \widgetPtr -> withRef pix $ \pixPtr -> setDeimage' widgetPtr pixPtr
{# fun Fl_Widget_tooltip as tooltip' { id `Ptr ()' } -> `String' #}
instance (impl ~ (IO (String))) => Op (GetTooltip ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> tooltip' widgetPtr
{# fun Fl_Widget_copy_tooltip as copyTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( String ->  IO ())) => Op (CopyTooltip ()) Widget orig impl where
  runOp _ _ widget text = withRef widget $ \widgetPtr -> copyTooltip' widgetPtr text
{# fun Fl_Widget_set_tooltip as setTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( String ->  IO ())) => Op (SetTooltip ()) Widget orig impl where
  runOp _ _ widget text = withRef widget $ \widgetPtr -> setTooltip' widgetPtr text
{# fun Fl_Widget_when as when' { id `Ptr ()' } -> `When' cToEnum #}
instance (impl ~ (IO (When))) => Op (GetWhen ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> when' widgetPtr
{# fun Fl_Widget_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( When ->  IO ())) => Op (SetWhen ()) Widget orig impl where
  runOp _ _ widget i = withRef widget $ \widgetPtr -> setWhen' widgetPtr (fromIntegral $ fromEnum i)
{# fun Fl_Widget_visible as visible' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetVisible ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> visible' widgetPtr
{# fun Fl_Widget_visible_r as visibleR' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetVisibleR ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> visibleR' widgetPtr
{# fun Fl_Widget_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidgetSuper ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> showSuper' widgetPtr
{# fun Fl_Widget_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Widget_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (HideSuper ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Widget_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr
{# fun Fl_Widget_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetVisible ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setVisible' widgetPtr
{# fun Fl_Widget_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearVisible ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearVisible' widgetPtr
{# fun Fl_Widget_active as active' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (Active ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> active' widgetPtr
{# fun Fl_Widget_active_r as activeR' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (ActiveR ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> activeR' widgetPtr
{# fun Fl_Widget_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Activate ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> activate' widgetPtr
{# fun Fl_Widget_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Deactivate ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> deactivate' widgetPtr
{# fun Fl_Widget_output as output' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetOutput ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> output' widgetPtr
{# fun Fl_Widget_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetOutput ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setOutput' widgetPtr
{# fun Fl_Widget_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearOutput ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearOutput' widgetPtr
{# fun Fl_Widget_takesevents as takesevents' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (Takesevents ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> takesevents' widgetPtr
{# fun Fl_Widget_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetChanged ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setChanged' widgetPtr
{# fun Fl_Widget_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (GetClearChanged ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearChanged' widgetPtr
{# fun Fl_Widget_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (TakeFocus ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> takeFocus' widgetPtr
{# fun Fl_Widget_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetVisibleFocus ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setVisibleFocus' widgetPtr
{# fun Fl_Widget_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearVisibleFocus ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearVisibleFocus' widgetPtr
{# fun Fl_Widget_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Int ->  IO ())) => Op (ModifyVisibleFocus ()) Widget orig impl where
  runOp _ _ widget v = withRef widget $ \widgetPtr -> modifyVisibleFocus' widgetPtr v
{# fun Fl_Widget_visible_focus as visibleFocus' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetVisibleFocus ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> visibleFocus' widgetPtr
{# fun Fl_Widget_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~  (Ref a ->  IO Int)) => Op (Contains ()) Widget orig impl where
  runOp _ _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr -> contains' widgetPtr otherWidgetPtr
{# fun Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Ref a -> IO (Int))) => Op (Inside ()) Widget orig impl where
  runOp _ _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr -> inside' widgetPtr otherWidgetPtr
{# fun Fl_Widget_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Redraw ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> redraw' widgetPtr
{# fun Fl_Widget_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (RedrawLabel ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> redrawLabel' widgetPtr
{# fun Fl_Widget_damage as damage' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ (IO (Word8))) => Op (GetDamage ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> damage' widgetPtr
{# fun Fl_Widget_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Word8 ->  IO ())) => Op (ClearDamageWithBitmask ()) Widget orig impl where
  runOp _ _ widget c = withRef widget $ \widgetPtr -> clearDamageWithBitmask' widgetPtr c
{# fun Fl_Widget_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearDamage ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearDamage' widgetPtr
{# fun Fl_Widget_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Word8 ->  IO ())) => Op (GetDamageWithText ()) Widget orig impl where
  runOp _ _ widget c = withRef widget $ \widgetPtr -> damageWithText' widgetPtr c
{# fun Fl_Widget_damage_inside_widget as damageInsideWidget' { id `Ptr ()',`Word8',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Word8 -> Rectangle ->  IO ())) => Op (GetDamageInsideWidget ()) Widget orig impl where
  runOp _ _ widget c rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    damageInsideWidget' widgetPtr c x_pos y_pos w_pos h_pos
{# fun Fl_Widget_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
instance (impl ~ ( IO (Size))) => Op (MeasureLabel ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> measureLabel' widgetPtr >>= \(width, height) -> return $ Size (Width width) (Height height)
{# fun Fl_Widget_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ref Window))) => Op (GetWindow ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> window' widgetPtr >>= toRef
{# fun Fl_Widget_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ref Window))) => Op (GetTopWindow ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> (topWindow' widgetPtr) >>= toRef
{# fun Fl_Widget_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
instance (impl ~ ( IO (Position))) => Op (GetTopWindowOffset ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> topWindowOffset' widgetPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun Fl_Widget_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle ->  IO ())) => Op (ResizeSuper ()) Widget orig impl where
  runOp _ _ widget rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resizeSuper' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) Widget orig impl where
  runOp _ _ widget rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}

instance (impl ~ ((Ref orig -> IO ()) -> IO ())) => Op (SetCallback ()) Widget orig impl where
  runOp _ _ widget callback = withRef widget $ \widgetPtr -> do
    ptr <- toCallbackPrimWithUserData callback
    setCallback' widgetPtr (castFunPtr ptr)

{# fun Fl_Widget_draw_box as widgetDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_tc as widgetDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_txywhc as widgetDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawBox ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> widgetDrawBox' widgetPtr
instance (impl ~ ( Boxtype -> Color -> Maybe Rectangle -> IO ())) => Op (DrawBoxWithBoxtype ()) Widget orig impl where
  runOp _ _ widget bx c Nothing =
    withRef widget $ \widgetPtr -> widgetDrawBoxWithTC' widgetPtr bx c
  runOp _ _ widget bx c (Just r) =
              withRef widget $ \widgetPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                widgetDrawBoxWithTXywhC' widgetPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Widget_draw_backdrop as widgetDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawBackdrop ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> widgetDrawBackdrop' widgetPtr

{# fun Fl_Widget_draw_focus as widgetDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_focus_with_txywh as widgetDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Maybe (Boxtype, Rectangle) -> IO ())) => Op (DrawFocus ()) Widget orig impl where
  runOp _ _ widget Nothing =
                withRef widget $ \ widgetPtr -> widgetDrawFocus' widgetPtr
  runOp _ _ widget (Just (bx, r)) =
                withRef widget $ \widgetPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  widgetDrawFocusWithTXywh' widgetPtr bx x_pos y_pos w_pos h_pos
