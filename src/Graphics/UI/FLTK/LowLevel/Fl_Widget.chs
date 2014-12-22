{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Widget
    (
     Widget,
     PositionSpec(..),
     WidgetFuncs(..),
     defaultWidgetFuncs,
     -- * Constructor
     widgetNew,
     -- * Fl_Widget specific
     WidgetTransformCallback,
     WidgetCallback(..),
     RectangleF,
     GetWindowF,
     GetGlWindowF,
     GetGroupF,
     GetPointerF,
     WidgetEventHandler,
     WidgetEventHandlerPrim,
     WidgetTransformCallbackPrim,
     RectangleFPrim,
     TableDrawCellF,
     TableDrawCellFPrim,
     TableSetIntF,
     TableSetIntFPrim,
     EventDispatchPrim,
     EventDispatchF,
     mkEventHandlerPtr,
     wrapEventDispatchPrim,
     toRectangleFPrim,
     toEventHandlerPrim,
     toCallbackPrim,
     toWidgetCallbackPrim,
     toWidgetTransformCallbackPrim,
     toTableSetIntFPrim,
     toTableDrawCellPrim,
     toGetWindowFPrim,
     toGetGlWindowFPrim,
     toGetGroupFPrim,
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

data WidgetFuncs =
    WidgetFuncs
    {
     widgetDrawOverride       :: Maybe WidgetCallback
    ,widgetHandleOverride     :: Maybe WidgetEventHandler
    ,widgetResizeOverride     :: Maybe RectangleF
    ,widgetShowOverride       :: Maybe WidgetCallback
    ,widgetHideOverride       :: Maybe WidgetCallback
    ,widgetAsWindowOverride   :: Maybe GetWindowF
    ,widgetAsGlWindowOverride :: Maybe GetGlWindowF
    ,widgetAsGroupOverride    :: Maybe GetGroupF
    }

widgetFunctionStruct :: WidgetFuncs -> IO (Ptr ())
widgetFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Widget_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (widgetDrawOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (widgetHandleOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (widgetResizeOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (widgetShowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (widgetHideOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (widgetAsWindowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (widgetAsGlWindowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (widgetAsGroupOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_group#} p
      return p
defaultWidgetFuncs :: WidgetFuncs
defaultWidgetFuncs = WidgetFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

type WidgetTransformCallback     = Ref Widget -> IO (Ref Widget)
data WidgetCallback              = forall a. (FindObj a Widget Same) => WidgetCallback(Ref a -> IO ())
data RectangleF                  = forall a. (FindObj a Widget Same) => RectangleF (Ref a -> Rectangle -> IO ())
data GetWindowF                  = forall a. (FindObj a Widget Same) => GetWindowF (Ref a -> IO (Ref Window))
data GetGlWindowF                = forall a. (FindObj a Widget Same) => GetGlWindowF (Ref a -> IO (Ref GlWindow))
data GetGroupF                   = forall a. (FindObj a Window Same) => GetGroupF (Ref a -> IO (Ref Group))
type GetPointerF                 = Ptr () -> IO (Ptr ())
data WidgetEventHandler          = forall a. (FindObj a Widget Same) => WidgetEventHandler (Ref a -> Event -> IO Int)
type WidgetEventHandlerPrim      = Ptr () -> CInt -> IO CInt
type WidgetTransformCallbackPrim = Ptr () -> IO (Ptr ())
type RectangleFPrim              = Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ()
type TableDrawCellF              = Ref Table -> TableContext -> Int -> Int -> Rectangle -> IO ()
type TableDrawCellFPrim          = Ptr () -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> IO ()
type TableSetIntF                = Ref Table -> Int -> IO ()
type TableSetIntFPrim            = Ptr () -> CInt -> IO ()
type EventDispatchPrim           = CInt -> Ptr () -> IO CInt
data EventDispatchF              = forall a. (FindObj a Widget Same) => EventDispatchF (Event -> Ref a -> IO Int)
data PositionSpec = ByPosition Position
                  | forall a. (FindObj a Widget Same) => ByWidget (Ref a)

foreign import ccall "wrapper"
        mkWidgetTransformCallbackPtr :: WidgetTransformCallbackPrim -> IO (FunPtr WidgetTransformCallbackPrim)
foreign import ccall "wrapper"
        mkEventHandlerPtr :: WidgetEventHandlerPrim -> IO (FunPtr WidgetEventHandlerPrim)
foreign import ccall "wrapper"
        wrapWidgetEventHandlerPrim :: WidgetEventHandlerPrim -> IO (FunPtr WidgetEventHandlerPrim)
foreign import ccall "wrapper"
        mkRectanglePtr :: RectangleFPrim -> IO (FunPtr RectangleFPrim)
foreign import ccall "wrapper"
        mkGetPointerPtr :: GetPointerF -> IO (FunPtr GetPointerF)
foreign import ccall "wrapper"
        mkTableSetInt :: TableSetIntFPrim -> IO (FunPtr TableSetIntFPrim)
foreign import ccall "wrapper"
        mkTableDrawCellF :: TableDrawCellFPrim -> IO (FunPtr TableDrawCellFPrim)
foreign import ccall "wrapper"
        wrapEventDispatchPrim :: EventDispatchPrim -> IO (FunPtr EventDispatchPrim)
foreign import ccall "dynamic"
        unwrapEventDispatchPrim :: FunPtr EventDispatchPrim -> EventDispatchPrim

toRectangleFPrim ::  RectangleF -> IO (FunPtr RectangleFPrim)
toRectangleFPrim (RectangleF f) = mkRectanglePtr
                     (\wPtr x_pos y_pos width height ->
                          let rectangle = toRectangle (fromIntegral x_pos,
                                                       fromIntegral y_pos,
                                                       fromIntegral width,
                                                       fromIntegral height)
                          in do
                          fptr <- wrapNonNull wPtr "Null Pointer. toRectangleFPrim"
                          f (wrapInRef fptr) rectangle
                     )
toEventHandlerPrim :: WidgetEventHandler -> IO (FunPtr WidgetEventHandlerPrim)
toEventHandlerPrim (WidgetEventHandler f) = wrapWidgetEventHandlerPrim
                       (\wPtr eventNumber ->
                            let event = cToEnum (eventNumber :: CInt)
                            in do
                            fptr <- wrapNonNull wPtr "Null Pointer: toEventHandlerPrim"
                            result <- f (wrapInRef fptr) event
                            return $ fromIntegral result
                       )
toCallbackPrim :: WidgetCallback -> IO (FunPtr CallbackPrim)
toCallbackPrim (WidgetCallback f) = mkCallbackPtr (\ptr ->
                                    wrapNonNull ptr "Null pointer. toCallbackPrim" >>=
                                    \pp -> f (castTo (wrapInRef pp))
                                 )

toWidgetCallbackPrim :: WidgetCallback -> IO (FunPtr CallbackWithUserDataPrim)
toWidgetCallbackPrim (WidgetCallback f) = mkWidgetCallbackPtr
                                    (\ptr _ -> wrapNonNull ptr "Null pointer: toWidgetCallbackPrim" >>=
                                               \pp -> f (castTo (wrapInRef pp))
                                    )
toWidgetTransformCallbackPrim :: WidgetTransformCallback -> IO (FunPtr WidgetTransformCallbackPrim)
toWidgetTransformCallbackPrim f =
    mkWidgetTransformCallbackPtr
    (\ptr ->
         wrapNonNull ptr "Null pointer. toWidgetTransformCallbackPrim" >>= \pp ->
         do
           widget <- f (castTo (wrapInRef pp))
           unsafeRefToPtr widget
    )
toTableSetIntFPrim :: TableSetIntF -> IO (FunPtr TableSetIntFPrim)
toTableSetIntFPrim f =
    mkTableSetInt
    (
     \ptr num' -> do
       pp <- wrapNonNull ptr "Null pointer. toTableSetInt"
       f (wrapInRef pp) (fromIntegral num')
    )
toTableDrawCellPrim :: TableDrawCellF -> IO (FunPtr TableDrawCellFPrim)
toTableDrawCellPrim f =
    mkTableDrawCellF
     (
      \ptr context' row' col' x_pos y_pos width height ->
          let rectangle = toRectangle (fromIntegral x_pos,
                                       fromIntegral y_pos,
                                       fromIntegral width,
                                       fromIntegral height)
          in
          do
           pp <- wrapNonNull ptr "Null pointer. toTableDrawCellFPrim"
           f (wrapInRef pp) (toEnum $ fromIntegral context') (fromIntegral row') (fromIntegral col') rectangle
     )
toGetWindowFPrim :: GetWindowF -> IO (FunPtr GetPointerF)
toGetWindowFPrim (GetWindowF f) = mkGetPointerPtr (\ptr -> runPointerF f ptr "Null pointer: toGetWindowFPrim")
toGetGlWindowFPrim :: GetGlWindowF -> IO (FunPtr GetPointerF)
toGetGlWindowFPrim (GetGlWindowF f) = mkGetPointerPtr (\ptr -> runPointerF f ptr "Null pointer: toGetGlWindowFPrim")
toGetGroupFPrim :: GetGroupF -> IO (FunPtr GetPointerF)
toGetGroupFPrim (GetGroupF f) = mkGetPointerPtr (\ptr -> runPointerF f ptr "Null pointer: toGetGroupFPrim")

{# fun Fl_Widget_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Widget_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
widgetNew :: Rectangle -> Maybe String -> Maybe WidgetFuncs -> IO (Ref Widget)
widgetNew rectangle l' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case (l', funcs') of
        (Nothing,Nothing) -> widgetNew' x_pos y_pos width height >>=
                             toRef
        ((Just l), Nothing) -> widgetNewWithLabel' x_pos y_pos width height l >>=
                               toRef
        ((Just l), (Just fs)) -> do
                               ptr <- widgetFunctionStruct fs
                               overriddenWidgetNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             toRef
        (Nothing, (Just fs)) -> do
                               ptr <- widgetFunctionStruct fs
                               overriddenWidgetNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    toRef

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
instance Op (SetParent ()) Widget (Ref Group -> IO ()) where
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
instance Op (SetImage ()) Widget (Ref Image ->  IO (())) where
  runOp _ widget pix = withRef widget $ \widgetPtr -> withRef pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `(Ref Image)' unsafeToRef #}
instance Op (GetDeimage ()) Widget ( IO (Ref Image)) where
  runOp _ widget = withRef widget $ \widgetPtr -> deimage' widgetPtr
{# fun Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance Op (SetDeimage ()) Widget (Ref Image ->  IO (())) where
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
instance Op (Contains ()) Widget (Ref Widget  ->  IO (Int)) where
  runOp _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr -> contains' widgetPtr otherWidgetPtr
{# fun Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance Op (Inside ()) Widget (Ref Widget -> IO (Int)) where
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
{# fun Fl_Widget_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (AsGroupSuper ()) Widget ( IO (Ref Group)) where
  runOp _ widget = withRef widget $ \widgetPtr -> asGroupSuper' widgetPtr >>= toRef
{# fun Fl_Widget_as_group as asGroup' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (AsGroup ()) Widget ( IO (Ref Group)) where
  runOp _ widget = withRef widget $ \widgetPtr -> asGroup' widgetPtr >>= toRef
{# fun Fl_Widget_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `(Ref GlWindow)' unsafeToRef #}
instance Op (AsGlWindowSuper ()) Widget ( IO (Ref GlWindow)) where
  runOp _ widget = withRef widget $ \widgetPtr -> asGlWindowSuper' widgetPtr
{# fun Fl_Widget_as_gl_window as asGlWindow' { id `Ptr ()' } -> `(Ref GlWindow)' unsafeToRef #}
instance Op (AsGlWindow ()) Widget ( IO (Ref GlWindow)) where
  runOp _ widget = withRef widget $ \widgetPtr -> asGlWindow' widgetPtr
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
instance Op (SetCallback ()) Widget (WidgetCallback -> IO (())) where
  runOp _ widget callback = withRef widget $ \widgetPtr -> do
    ptr <- toWidgetCallbackPrim callback
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
