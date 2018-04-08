{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Widget
    (
     -- * Constructor
     widgetCustom,
     widgetMaker,
     -- * Custom
     CustomWidgetFuncs(..),
     defaultCustomWidgetFuncs,
     fillCustomWidgetFunctionStruct,
     customWidgetFunctionStruct,
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Widget Functions
     --
     -- $widgetfunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy

type RectangleFPrim              = Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ()

foreign import ccall "wrapper"
        mkWidgetEventHandler :: (Ptr () -> CInt -> IO CInt) -> IO (FunPtr (Ptr () -> CInt -> IO CInt))
foreign import ccall "wrapper"
        mkRectanglePtr :: RectangleFPrim -> IO (FunPtr RectangleFPrim)

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

toEventHandlerPrim :: (Ref a -> Event -> IO (Either UnknownEvent ())) ->
                      IO (FunPtr (Ptr () -> CInt -> IO CInt))
toEventHandlerPrim f = mkWidgetEventHandler $
                       \wPtr eventNumber ->
                            let event = cToEnum (eventNumber :: CInt)
                            in do
                            fptr <- wrapNonNull wPtr "Null Pointer: toEventHandlerPrim"
                            result <- f (wrapInRef fptr) event
                            return (either (\_ -> fromIntegral (0::CInt)) (const (fromIntegral (1::CInt))) result)

-- | Overrideable 'Widget' functions
-- | Do not create this directly. Instead use `defaultWidgetCustomFuncs`
data CustomWidgetFuncs a =
    CustomWidgetFuncs
    {
     -- | See <http://www.fltk.org/doc-1.3/classFl__Widget.html#a9cb17cc092697dfd05a3fab55856d218 Fl_Widget::handle>
    handleCustom :: Maybe (Ref a -> Event -> IO (Either UnknownEvent ()))
     -- | See <http://www.fltk.org/doc-1.3/classFl__Widget.html#aca98267e7a9b94f699ebd27d9f59e8bb Fl_Widget::resize>
    ,resizeCustom :: Maybe (Ref a -> Rectangle -> IO ())
     -- | See <http://www.fltk.org/doc-1.3/classFl__Widget.html#ab572c6fbc922bf3268b72cf9e2939606 Fl_Widget::show>
    ,showCustom   :: Maybe (Ref a -> IO ())
     -- | See <http://www.fltk.org/doc-1.3/classFl__Widget.html#a1fe8405b86da29d147dc3b5841cf181c Fl_Widget::hide>
    ,hideCustom   :: Maybe (Ref a -> IO ())
    }

-- | Fill up a struct with pointers to functions on the Haskell side that will get called instead of the default ones.
--
-- Fill up the 'Widget' part the function pointer struct.
--
-- Only of interest to 'Widget' contributors
fillCustomWidgetFunctionStruct :: forall a. (Parent a Widget) =>
                                  Ptr () ->
                                  Maybe (Ref a -> IO ()) ->
                                  CustomWidgetFuncs a ->
                                  IO ()
fillCustomWidgetFunctionStruct structPtr _draw' (CustomWidgetFuncs _handle' _resize' _show' _hide') = do
      toCallbackPrim `orNullFunPtr` _draw'       >>= {#set fl_Widget_Virtual_Funcs->draw#} structPtr
      toEventHandlerPrim `orNullFunPtr` _handle' >>= {#set fl_Widget_Virtual_Funcs->handle#} structPtr
      toRectangleFPrim `orNullFunPtr` _resize'   >>= {#set fl_Widget_Virtual_Funcs->resize#} structPtr
      toCallbackPrim `orNullFunPtr` _show'       >>= {#set fl_Widget_Virtual_Funcs->show#} structPtr
      toCallbackPrim `orNullFunPtr` _hide'       >>= {#set fl_Widget_Virtual_Funcs->hide#} structPtr

{# fun Fl_Widget_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}

-- | Given a record of functions, return a pointer to a struct with function pointers back to those functions.
--
-- Only of interest to 'Widget' contributors.
customWidgetFunctionStruct :: forall a. (Parent a Widget) =>
                              Maybe (Ref a -> IO ()) ->
                              CustomWidgetFuncs a ->
                              IO (Ptr ())
customWidgetFunctionStruct draw' customWidgetFuncs' = do
  p <- virtualFuncs'
  fillCustomWidgetFunctionStruct p draw' customWidgetFuncs'
  return p

-- | An empty set of functions to pass to 'widgetCustom'.
defaultCustomWidgetFuncs :: forall a. (Parent a Widget) => CustomWidgetFuncs a
defaultCustomWidgetFuncs =
  CustomWidgetFuncs
    Nothing
    Nothing
    Nothing
    Nothing

-- | Lots of 'Widget' subclasses have the same constructor parameters. This function consolidates them.
--
-- Only of interest to 'Widget' contributors.
widgetMaker :: forall a. (Parent a Widget) =>
               Rectangle                                                          -- ^ Position and size
               -> Maybe T.Text                                                    -- ^ Title
               -> Maybe (Ref a -> IO ())                                          -- ^ Custom drawing function
               -> Maybe (CustomWidgetFuncs a)                                     -- ^ Custom functions
               -> (Int -> Int -> Int -> Int -> Ptr () -> IO (Ptr ()))             -- ^ Foreign constructor to call if only custom functions are given
               -> (Int -> Int -> Int -> Int -> T.Text -> Ptr () -> IO (Ptr ()))   -- ^ Foreign constructor to call if both title and custom functions are given
               -> IO (Ref a)                                                      -- ^ Reference to the widget
widgetMaker rectangle _label' draw' customFuncs' newWithCustomFuncs' newWithCustomFuncsLabel' =
  do
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    ptr <- customWidgetFunctionStruct draw' (maybe defaultCustomWidgetFuncs id customFuncs')
    widget <- maybe (newWithCustomFuncs' x_pos y_pos width height (castPtr ptr))
                    (\l -> newWithCustomFuncsLabel' x_pos y_pos width height l (castPtr ptr))
                    _label'
    toRef widget

{# fun Fl_OverriddenWidget_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
-- | Widget constructor.
widgetCustom :: Rectangle                   -- ^ The bounds of this widget
                -> Maybe T.Text             -- ^ The widget label
                -> (Ref Widget -> IO ())    -- ^ Custom drawing function
                -> CustomWidgetFuncs Widget -- ^ Other custom functions
                -> IO (Ref Widget)
widgetCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    (Just draw')
    (Just funcs')
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Widget_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (Destroy ()) Widget orig impl where
  runOp _ _ win = liftIO $ swapRef win $ \winPtr -> do
    widgetDestroy' winPtr
    return nullPtr

{#fun Fl_Widget_handle as widgetHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> m (Either UnknownEvent ())), MonadIO m) => Op (Handle ()) Widget orig impl where
  runOp _ _ widget event = liftIO $ withRef widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{#fun Fl_Widget_parent as widgetParent' { id `Ptr ()'} -> `Ptr ()' id #}
instance (impl ~ m (Maybe (Ref Group)), MonadIO m) => Op (GetParent ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget widgetParent' >>= toMaybeRef

{#fun Fl_Widget_set_parent as widgetSetParent' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Group, impl ~ (Maybe (Ref a) -> m ()), MonadIO m) => Op (SetParent ()) Widget orig impl where
  runOp _ _ widget group =
      liftIO $ withRef widget
      (\widgetPtr ->
        withMaybeRef group (\groupPtr ->
                        widgetSetParent' widgetPtr groupPtr
                      )
      )
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ m Word8, MonadIO m) => Op (GetType_ ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> type' widgetPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Word8 -> m ()), MonadIO m) => Op (SetType ()) Widget orig impl where
  runOp _ _ widget t = liftIO $ withRef widget $ \widgetPtr -> setType' widgetPtr t
{# fun Fl_Widget_draw_label as drawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Rectangle,Alignments) -> m ()), MonadIO m) => Op (DrawLabel ()) Widget orig impl where
  runOp _ _ widget Nothing = liftIO $ withRef widget $ \widgetPtr -> drawLabel' widgetPtr
  runOp _ _ widget (Just (rectangle,align_)) = liftIO $ withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    drawLabelWithXywhAlignment' widgetPtr x_pos y_pos w_pos h_pos (alignmentsToInt align_)

{# fun Fl_Widget_x as x' { id `Ptr ()' } -> `Int' #}
instance (impl ~ m Int, MonadIO m) => Op (GetX ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> x' widgetPtr
{# fun Fl_Widget_y as y' { id `Ptr ()' } -> `Int' #}
instance (impl ~ m Int, MonadIO m) => Op (GetY ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> y' widgetPtr
{# fun Fl_Widget_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ m Int, MonadIO m) => Op (GetW ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> w' widgetPtr
{# fun Fl_Widget_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ m Int, MonadIO m) => Op (GetH ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> h' widgetPtr
instance (
         Match obj ~ FindOp orig orig (GetX ()),
         Match obj ~ FindOp orig orig (GetY ()),
         Match obj ~ FindOp orig orig (GetW ()),
         Match obj ~ FindOp orig orig (GetH ()),
         Op (GetX ()) obj orig (m Int),
         Op (GetY ()) obj orig (m Int),
         Op (GetW ()) obj orig (m Int),
         Op (GetH ()) obj orig (m Int),
         impl ~ m Rectangle,
         MonadIO m
         )
         =>
         Op (GetRectangle ()) Widget orig impl where
   runOp _ _ widget = do
     _x <- getX (castTo widget :: Ref orig)
     _y <- getY (castTo widget :: Ref orig)
     _w <- getW (castTo widget :: Ref orig)
     _h <- getH (castTo widget :: Ref orig)
     return (toRectangle (_x,_y,_w,_h))
{# fun Fl_Widget_set_align as setAlign' { id `Ptr ()', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Alignments -> m ()), MonadIO m) => Op (SetAlign ()) Widget orig impl where
  runOp _ _ widget _align = liftIO $ withRef widget $ \widgetPtr -> setAlign' widgetPtr (alignmentsToInt _align)
{# fun Fl_Widget_align as align' { id `Ptr ()' } -> `CUInt' id #}
instance (impl ~ m Alignments, MonadIO m) => Op (GetAlign ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> align' widgetPtr >>= return . intToAlignments . fromIntegral
{# fun Fl_Widget_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ m Boxtype, MonadIO m) => Op (GetBox ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> box' widgetPtr
{# fun Fl_Widget_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Boxtype -> m ()), MonadIO m) => Op (SetBox ()) Widget orig impl where
  runOp _ _ widget new_box = liftIO $ withRef widget $ \widgetPtr -> setBox' widgetPtr new_box
{# fun Fl_Widget_color as color' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ m Color, MonadIO m) => Op (GetColor ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> color' widgetPtr
{# fun Fl_Widget_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color -> m ()), MonadIO m) => Op (SetColor ()) Widget orig impl where
  runOp _ _ widget bg = liftIO $ withRef widget $ \widgetPtr -> setColor' widgetPtr bg
{# fun Fl_Widget_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color -> Color -> m ()), MonadIO m) => Op (SetColorWithBgSel ()) Widget orig impl where
  runOp _ _ widget bg a = liftIO $ withRef widget $ \widgetPtr -> setColorWithBgSel' widgetPtr bg a
{# fun Fl_Widget_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ m Color, MonadIO m) => Op (GetSelectionColor ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> selectionColor' widgetPtr
{# fun Fl_Widget_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color -> m ()), MonadIO m) => Op (SetSelectionColor ()) Widget orig impl where
  runOp _ _ widget a = liftIO $ withRef widget $ \widgetPtr -> setSelectionColor' widgetPtr a
{# fun Fl_Widget_label as label' { id `Ptr ()' } -> `T.Text' unsafeFromCString #}
instance (impl ~ m T.Text, MonadIO m) => Op (GetLabel ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> label' widgetPtr
{# fun Fl_Widget_copy_label as copyLabel' { id `Ptr ()', unsafeToCString `T.Text' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text -> m ()), MonadIO m) => Op (CopyLabel ()) Widget orig impl where
  runOp _ _ widget new_label = liftIO $ withRef widget $ \widgetPtr -> copyLabel' widgetPtr new_label
{# fun Fl_Widget_set_label as setLabel' { id `Ptr ()', unsafeToCString `T.Text' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text -> m ()), MonadIO m) => Op (SetLabel ()) Widget orig impl where
  runOp _ _ widget text = liftIO $ withRef widget $ \widgetPtr -> setLabel' widgetPtr text
{# fun Fl_Widget_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
instance (impl ~ m Labeltype, MonadIO m) => Op (GetLabeltype ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> labeltype' widgetPtr
{# fun Fl_Widget_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Labeltype -> m ()), MonadIO m) => Op (SetLabeltype ()) Widget orig impl where
  runOp _ _ widget a = liftIO $ withRef widget $ \widgetPtr -> setLabeltype' widgetPtr a
{# fun Fl_Widget_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ m Color, MonadIO m) => Op (GetLabelcolor ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> labelcolor' widgetPtr
{# fun Fl_Widget_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color -> m ()), MonadIO m) => Op (SetLabelcolor ()) Widget orig impl where
  runOp _ _ widget c = liftIO $ withRef widget $ \widgetPtr -> setLabelcolor' widgetPtr c
{# fun Fl_Widget_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ m Font, MonadIO m) => Op (GetLabelfont ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> labelfont' widgetPtr
{# fun Fl_Widget_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Font -> m ()), MonadIO m) => Op (SetLabelfont ()) Widget orig impl where
  runOp _ _ widget c = liftIO $ withRef widget $ \widgetPtr -> setLabelfont' widgetPtr c
{# fun Fl_Widget_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ m FontSize, MonadIO m) => Op (GetLabelsize ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> labelsize' widgetPtr >>= return . FontSize
{# fun Fl_Widget_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
instance (impl ~ (FontSize -> m ()), MonadIO m) => Op (SetLabelsize ()) Widget orig impl where
  runOp _ _ widget (FontSize pix) = liftIO $ withRef widget $ \widgetPtr -> setLabelsize' widgetPtr pix
{# fun Fl_Widget_image as image' { id `Ptr ()' } -> `Maybe (Ref Image)' unsafeToMaybeRef #}
instance (impl ~ m (Maybe (Ref Image)), MonadIO m) => Op (GetImage ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> image' widgetPtr
{# fun Fl_Widget_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Maybe (Ref a) -> m ()), MonadIO m) => Op (SetImage ()) Widget orig impl where
  runOp _ _ widget pix = liftIO $ withRef widget $ \widgetPtr -> withMaybeRef pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `Maybe (Ref Image)' unsafeToMaybeRef #}
instance (impl ~ m (Maybe (Ref Image)), MonadIO m) => Op (GetDeimage ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> deimage' widgetPtr
{# fun Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Maybe (Ref a) -> m ()), MonadIO m) => Op (SetDeimage ()) Widget orig impl where
  runOp _ _ widget pix = liftIO $ withRef widget $ \widgetPtr -> withMaybeRef pix $ \pixPtr -> setDeimage' widgetPtr pixPtr
{# fun Fl_Widget_tooltip as tooltip' { id `Ptr ()' } -> `T.Text' unsafeFromCString #}
instance (impl ~ m T.Text, MonadIO m) => Op (GetTooltip ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> tooltip' widgetPtr
{# fun Fl_Widget_copy_tooltip as copyTooltip' { id `Ptr ()', unsafeToCString `T.Text' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text -> m ()), MonadIO m) => Op (CopyTooltip ()) Widget orig impl where
  runOp _ _ widget text = liftIO $ withRef widget $ \widgetPtr -> copyTooltip' widgetPtr text
{# fun Fl_Widget_set_tooltip as setTooltip' { id `Ptr ()', unsafeToCString `T.Text' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text -> m ()), MonadIO m) => Op (SetTooltip ()) Widget orig impl where
  runOp _ _ widget text = liftIO $ withRef widget $ \widgetPtr -> setTooltip' widgetPtr text
{# fun Fl_Widget_when as when' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ m [When], MonadIO m) => Op (GetWhen ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr ->
      when' widgetPtr >>= return . extract allWhen
{# fun Fl_Widget_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ([When] -> m ()), MonadIO m) => Op (SetWhen ()) Widget orig impl where
  runOp _ _ widget i = liftIO $ withRef widget $ \widgetPtr ->
    setWhen' widgetPtr (fromIntegral . combine $ i)
{# fun Fl_Widget_do_callback as do_callback' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (DoCallback ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> do_callback' widgetPtr
{# fun Fl_Widget_visible as visible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (GetVisible ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> visible' widgetPtr
{# fun Fl_Widget_visible_r as visibleR' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (GetVisibleR ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> visibleR' widgetPtr
{# fun Fl_Widget_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ShowWidgetSuper ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> showSuper' widgetPtr
{# fun Fl_Widget_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ShowWidget ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Widget_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (HideSuper ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Widget_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (Hide ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> hide' widgetPtr
{# fun Fl_Widget_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (SetVisible ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> setVisible' widgetPtr
{# fun Fl_Widget_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ClearVisible ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> clearVisible' widgetPtr
{# fun Fl_Widget_active as active' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (Active ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> active' widgetPtr
{# fun Fl_Widget_active_r as activeR' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (ActiveR ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> activeR' widgetPtr
{# fun Fl_Widget_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (Activate ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> activate' widgetPtr
{# fun Fl_Widget_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (Deactivate ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> deactivate' widgetPtr
{# fun Fl_Widget_output as output' { id `Ptr ()' } -> `Int' #}
instance (impl ~ m Int, MonadIO m) => Op (GetOutput ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> output' widgetPtr
{# fun Fl_Widget_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (SetOutput ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> setOutput' widgetPtr
{# fun Fl_Widget_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ClearOutput ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> clearOutput' widgetPtr
{# fun Fl_Widget_takesevents as takesevents' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (Takesevents ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> takesevents' widgetPtr
{# fun Fl_Widget_set_active as setActive' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (SetActive ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> setActive' widgetPtr
{# fun Fl_Widget_clear_active as clearActive' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ClearActive ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> clearActive' widgetPtr
{# fun Fl_Widget_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (SetChanged ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> setChanged' widgetPtr
{# fun Fl_Widget_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ClearChanged ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> clearChanged' widgetPtr
{# fun Fl_Widget_changed as changed' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (Changed ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> changed' widgetPtr
{# fun Fl_Widget_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
instance (impl ~ m (Either NoChange ()), MonadIO m) => Op (TakeFocus ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> takeFocus' widgetPtr >>= return . successOrNoChange
{# fun Fl_Widget_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (SetVisibleFocus ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> setVisibleFocus' widgetPtr
{# fun Fl_Widget_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ClearVisibleFocus ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> clearVisibleFocus' widgetPtr
{# fun Fl_Widget_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int -> m ()), MonadIO m) => Op (ModifyVisibleFocus ()) Widget orig impl where
  runOp _ _ widget v = liftIO $ withRef widget $ \widgetPtr -> modifyVisibleFocus' widgetPtr v
{# fun Fl_Widget_visible_focus as visibleFocus' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ m Bool, MonadIO m) => Op (GetVisibleFocus ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> visibleFocus' widgetPtr
{# fun Fl_Widget_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Ref a -> m Bool), MonadIO m) => Op (Contains ()) Widget orig impl where
  runOp _ _ widget otherWidget = liftIO $ withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr ->
    contains' widgetPtr otherWidgetPtr >>= return . cToBool
{# fun Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Ref a -> m Bool), MonadIO m) => Op (Inside ()) Widget orig impl where
  runOp _ _ widget otherWidget = liftIO $ withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr ->
    inside' widgetPtr otherWidgetPtr >>= return . cToBool
{# fun Fl_Widget_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (Redraw ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> redraw' widgetPtr
{# fun Fl_Widget_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (RedrawLabel ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> redrawLabel' widgetPtr
{# fun Fl_Widget_damage as damage' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ m [Damage], MonadIO m) => Op (GetDamage ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> do
    d <- damage' widgetPtr
    return (extract allDamages (fromIntegral d))
{# fun Fl_Widget_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ([Damage] -> m ()), MonadIO m) => Op (ClearDamageExcept ()) Widget orig impl where
  runOp _ _ widget damages = liftIO $ withRef widget $ \widgetPtr -> clearDamageWithBitmask' widgetPtr (fromIntegral (combine damages))
{# fun Fl_Widget_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (ClearDamage ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> clearDamage' widgetPtr
{# fun Fl_Widget_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ([Damage] -> m ()), MonadIO m) => Op (SetDamage ()) Widget orig impl where
  runOp _ _ widget damages = liftIO $ withRef widget $ \widgetPtr -> damageWithText' widgetPtr (fromIntegral (combine damages))
{# fun Fl_Widget_damage_inside_widget as damageInsideWidget' { id `Ptr ()',`Word8',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ([Damage] -> Rectangle -> m ()), MonadIO m) => Op (SetDamageInside ()) Widget orig impl where
  runOp _ _ widget damages rectangle = liftIO $ withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    damageInsideWidget' widgetPtr (fromIntegral (combine damages)) x_pos y_pos w_pos h_pos
{# fun Fl_Widget_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
instance (impl ~ m Size, MonadIO m) => Op (MeasureLabel ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> measureLabel' widgetPtr >>= \(width, height) -> return $ Size (Width width) (Height height)
{# fun Fl_Widget_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ m (Maybe (Ref Window)), MonadIO m) => Op (GetWindow ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> window' widgetPtr >>= toMaybeRef
{# fun Fl_Widget_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ m (Maybe (Ref Window)), MonadIO m) => Op (GetTopWindow ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> (topWindow' widgetPtr) >>= toMaybeRef
{# fun Fl_Widget_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
instance (impl ~ m Position, MonadIO m) => Op (GetTopWindowOffset ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> topWindowOffset' widgetPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun Fl_Widget_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> m ()), MonadIO m) => Op (ResizeSuper ()) Widget orig impl where
  runOp _ _ widget rectangle = liftIO $ withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resizeSuper' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> m ()), MonadIO m) => Op (Resize ()) Widget orig impl where
  runOp _ _ widget rectangle = liftIO $ withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}
instance (impl ~ ((Ref orig -> IO ()) -> IO ())) => Op (SetCallback ()) Widget orig impl where
  runOp _ _ widget callback = withRef widget $ \widgetPtr -> do
    ptr <- toCallbackPrimWithUserData callback
    setCallback' widgetPtr (castFunPtr ptr)

{# fun Fl_Widget_has_callback as hasCallback' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ m Bool, MonadIO m) => Op (HasCallback ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> do
    res <- hasCallback' widgetPtr
    return $ if (res == 0) then False else True
{# fun Fl_Widget_draw_box as widgetDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_tc as widgetDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_txywhc as widgetDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (DrawBox ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> widgetDrawBox' widgetPtr
instance (impl ~ (Boxtype -> Color -> Maybe Rectangle -> m ()), MonadIO m) => Op (DrawBoxWithBoxtype ()) Widget orig impl where
  runOp _ _ widget bx c Nothing =
    liftIO $ withRef widget $ \widgetPtr -> widgetDrawBoxWithTC' widgetPtr bx c
  runOp _ _ widget bx c (Just r) =
              liftIO $ withRef widget $ \widgetPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                widgetDrawBoxWithTXywhC' widgetPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Widget_draw_backdrop as widgetDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ m (), MonadIO m) => Op (DrawBackdrop ()) Widget orig impl where
  runOp _ _ widget = liftIO $ withRef widget $ \widgetPtr -> widgetDrawBackdrop' widgetPtr

{# fun Fl_Widget_draw_focus as widgetDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_focus_with_txywh as widgetDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Boxtype, Rectangle) -> m ()), MonadIO m) => Op (DrawFocus ()) Widget orig impl where
  runOp _ _ widget Nothing =
                liftIO $ withRef widget $ \ widgetPtr -> widgetDrawFocus' widgetPtr
  runOp _ _ widget (Just (bx, r)) =
                liftIO $ withRef widget $ \widgetPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  widgetDrawFocusWithTXywh' widgetPtr bx x_pos y_pos w_pos h_pos

-- $widgetfunctions
-- @
-- activate :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- active :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- activeR :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- changed :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- clearActive :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- clearChanged :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- clearDamage :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- clearDamageExcept :: MonadIO m => 'Ref' 'Widget' -> ['Damage'] -> m ()
--
-- clearOutput :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- clearVisible :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- clearVisibleFocus :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- contains :: ('Parent' a 'Widget', MonadIO m) => 'Ref' 'Widget' -> 'Ref' a -> m 'Bool'
--
-- copyLabel :: MonadIO m => 'Ref' 'Widget' -> 'T.Text' -> m ()
--
-- copyTooltip :: MonadIO m => 'Ref' 'Widget' -> 'T.Text' -> m ()
--
-- deactivate :: MonadiO m => 'Ref' 'Widget' -> m ()
--
-- destroy :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- doCallback :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- drawBackdrop :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- drawBox :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- drawBoxWithBoxtype :: MonadIO m => 'Ref' 'Widget' -> 'Boxtype' -> 'Color' -> 'Maybe' 'Rectangle' -> m ()
--
-- drawFocus :: MonadIO m => 'Ref' 'Widget' -> 'Maybe' ('Boxtype', 'Rectangle') -> m ()
--
-- drawLabel :: 'Ref' 'Widget' -> 'Maybe' ('Rectangle,Alignments') -> 'IO' ()
--
-- getAlign :: MonadIO m => 'Ref' 'Widget' -> m 'Alignments'
--
-- getBox :: MonadIO m => 'Ref' 'Widget' -> m 'Boxtype'
--
-- getColor :: MonadIO m => 'Ref' 'Widget' -> m 'Color'
--
-- getDamage :: MonadIO m => 'Ref' 'Widget' -> m ['Damage')
--
-- getDeimage :: MonadIO m => 'Ref' 'Widget' -> m ('Maybe' ('Ref' 'Image'))
--
-- getH :: MonadIO m => 'Ref' 'Widget' -> m 'Int'
--
-- getImage :: MonadIO m => 'Ref' 'Widget' -> m ('Maybe' ('Ref' 'Image'))
--
-- getLabel :: MonadIO m => 'Ref' 'Widget' -> m 'T.Text'
--
-- getLabelcolor :: MonadIO m => 'Ref' 'Widget' -> m 'Color'
--
-- getLabelfont :: MonadIO m => 'Ref' 'Widget' -> m 'Font'
--
-- getLabelsize :: MonadIO m => 'Ref' 'Widget' -> m 'FontSize'
--
-- getLabeltype :: MonadIO m => 'Ref' 'Widget' -> m 'Labeltype'
--
-- getOutput :: MonadIO m => 'Ref' 'Widget' -> m 'Int'
--
-- getParent :: MonadIO m => 'Ref' 'Widget' -> m ('Maybe' ('Ref' 'Group'))
--
-- getRectangle:: ('Match' obj ~ 'FindOp' orig orig ('GetX' ()), 'Match' obj ~ 'FindOp' orig orig ('GetY' ()), 'Match' obj ~ 'FindOp' orig orig ('GetW' ()), 'Match' obj ~ 'FindOp' orig orig ('GetH' ()), 'Op' ('GetX' ()) obj orig (m 'Int'), 'Op' ('GetY' ()) obj orig (m 'Int'), 'Op' ('GetW' ()) obj orig (m 'Int'), 'Op' ('GetH' ()) obj orig (m 'Int'), MonadIO m) => 'Ref' 'Widget' -> m 'Rectangle'
--
-- getSelectionColor :: MonadIO m => 'Ref' 'Widget' -> m 'Color'
--
-- getTooltip :: MonadIO m => 'Ref' 'Widget' -> m 'T.Text'
--
-- getTopWindow :: MonadIO m => 'Ref' 'Widget' -> m ('Maybe' ('Ref' 'Window'))
--
-- getTopWindowOffset :: MonadIO m => 'Ref' 'Widget' -> m 'Position'
--
-- getType_ :: MonadIO m => 'Ref' 'Widget' -> m 'Word8'
--
-- getVisible :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- getVisibleFocus :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- getVisibleR :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- getW :: MonadIO m => 'Ref' 'Widget' -> m 'Int'
--
-- getWhen :: MonadIO m => 'Ref' 'Widget' -> m ['When']
--
-- getWindow :: MonadIO m => 'Ref' 'Widget' -> m ('Maybe' ('Ref' 'Window'))
--
-- getX :: MonadIO m => 'Ref' 'Widget' -> m 'Int'
--
-- getY :: MonadIO m => 'Ref' 'Widget' -> m 'Int'
--
-- handle :: 'Ref' 'Widget' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hasCallback :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
--
-- hide :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- hideSuper :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- inside :: ('Parent' a 'Widget', MonadIO m) => 'Ref' 'Widget' -> 'Ref' a -> m 'Bool'
--
-- measureLabel :: MonadIO m => 'Ref' 'Widget' -> m 'Size'
--
-- modifyVisibleFocus :: MonadIO m => 'Ref' 'Widget' -> 'Int' -> m ()
--
-- redraw :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- redrawLabel :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- resize :: MonadIO m => 'Ref' 'Widget' -> 'Rectangle' -> m ()
--
-- resizeSuper :: MonadIO m => 'Ref' 'Widget' -> 'Rectangle' -> m ()
--
-- setActive :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- setAlign :: MonadIO m => 'Ref' 'Widget' -> 'Alignments' -> m ()
--
-- setBox :: MonadIO m => 'Ref' 'Widget' -> 'Boxtype' -> m ()
--
-- setCallback :: 'Ref' 'Widget' -> ('Ref' orig -> IO ()) -> IO ()
--
-- setChanged :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- setColor :: MonadIO m => 'Ref' 'Widget' -> 'Color' -> m ()
--
-- setColorWithBgSel :: MonadIO m => 'Ref' 'Widget' -> 'Color' -> 'Color' -> m ()
--
-- setDamage :: MonadIO m => 'Ref' 'Widget' -> ['Damage'] -> m ()
--
-- setDamageInside :: MonadIO m => 'Ref' 'Widget' -> ['Damage'] -> 'Rectangle' -> m ()
--
-- setDeimage :: MonadIO m => ('Parent' a 'Image') => 'Ref' 'Widget' -> 'Maybe'( 'Ref' a ) -> m ()
--
-- setImage :: MonadIO m => ('Parent' a 'Image') => 'Ref' 'Widget' -> 'Maybe'( 'Ref' a ) -> m ()
--
-- setLabel :: MonadIO m => 'Ref' 'Widget' -> 'T.Text' -> m ()
--
-- setLabelcolor :: MonadIO m => 'Ref' 'Widget' -> 'Color' -> m ()
--
-- setLabelfont :: MonadIO m => 'Ref' 'Widget' -> 'Font' -> m ()
--
-- setLabelsize :: MonadIO m => 'Ref' 'Widget' -> 'FontSize' -> m ()
--
-- setLabeltype :: MonadIO m => 'Ref' 'Widget' -> 'Labeltype' -> m ()
--
-- setOutput :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- setParent:: MonadIO m => ('Parent' a 'Group') => 'Ref' 'Widget' -> 'Maybe' ('Ref' a) -> m ()
--
-- setSelectionColor :: MonadIO m => 'Ref' 'Widget' -> 'Color' -> m ()
--
-- setTooltip :: MonadIO m => 'Ref' 'Widget' -> 'T.Text' -> m ()
--
-- setType :: MonadIO m => 'Ref' 'Widget' -> 'Word8' -> m ()
--
-- setVisible :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- setVisibleFocus :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- setWhen :: MonadIO m => 'Ref' 'Widget' -> ['When'] -> m ()
--
-- showWidget :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- showWidgetSuper :: MonadIO m => 'Ref' 'Widget' -> m ()
--
-- takeFocus :: MonadIO m => 'Ref' 'Widget' -> m ('Either' 'NoChange' ())
--
-- takesevents :: MonadIO m => 'Ref' 'Widget' -> m 'Bool'
-- @


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
-- @
