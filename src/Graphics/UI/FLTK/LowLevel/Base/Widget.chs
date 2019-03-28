{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Widget
    (
     -- * Constructor
     widgetCustom,
     widgetMaker,
     -- * Custom
     CustomWidgetFuncs(..),
     defaultCustomWidgetFuncs,
     fillCustomWidgetFunctionStruct,
     customWidgetFunctionStruct,
     WidgetFlag(..),
     defaultDestroyCallbacks,
     defaultDestroyWidgetCallbacks
  , handleWidgetBase
  , resizeWidgetBase
  , hideWidgetBase
  , showWidgetWidgetBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Widget Functions
     --
     -- $functions
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
import Data.Maybe

#c
enum WidgetFlag {
    WidgetFlagInactive = INACTIVE,
    WidgetFlagInvisible = INVISIBLE,
    WidgetFlagOutput = OUTPUT,
    WidgetFlagNoBorder = NOBORDER,
    WidgetFlagForcePosition = FORCE_POSITION,
    WidgetFlagNonModal = NON_MODAL,
    WidgetFlagShortcutLabel = SHORTCUT_LABEL,
    WidgetFlagChanged = CHANGED,
    WidgetFlagOverride = OVERRIDE,
    WidgetFlagVisibleFocus = VISIBLE_FOCUS,
    WidgetFlagCopiedLabel = COPIED_LABEL,
    WidgetFlagClipChildren = CLIP_CHILDREN,
    WidgetFlagMenuWindow = MENU_WINDOW,
    WidgetFlagTooltipWindow = TOOLTIP_WINDOW,
    WidgetFlagModal = MODAL,
    WidgetFlagNoOverlay = NO_OVERLAY,
    WidgetFlagGroupRelative = GROUP_RELATIVE,
    WidgetFlagCopiedTooltip = COPIED_TOOLTIP,
    WidgetFlagFullscreen = FULLSCREEN,
    WidgetFlagMacUseAccentsMenu = MAC_USE_ACCENTS_MENU,
    WidgetFlagNeedsKeyboard = NEEDS_KEYBOARD,
    WidgetFlagUserFlag3 = USERFLAG3,
    WidgetFlagUserFlag2 = USERFLAG2,
    WidgetFlagUserFlag1 = USERFLAG1
};
#endc
{#enum WidgetFlag {} deriving (Show, Eq) #}
allWidgetFlags :: [WidgetFlag]
allWidgetFlags =
  [
    WidgetFlagInactive,
    WidgetFlagInvisible,
    WidgetFlagOutput,
    WidgetFlagNoBorder,
    WidgetFlagForcePosition,
    WidgetFlagNonModal,
    WidgetFlagShortcutLabel,
    WidgetFlagChanged,
    WidgetFlagOverride,
    WidgetFlagVisibleFocus,
    WidgetFlagCopiedLabel,
    WidgetFlagClipChildren,
    WidgetFlagMenuWindow,
    WidgetFlagTooltipWindow,
    WidgetFlagModal,
    WidgetFlagNoOverlay,
    WidgetFlagGroupRelative,
    WidgetFlagCopiedTooltip,
    WidgetFlagFullscreen,
    WidgetFlagMacUseAccentsMenu,
    WidgetFlagNeedsKeyboard,
    WidgetFlagUserFlag3,
    WidgetFlagUserFlag2,
    WidgetFlagUserFlag1
  ]

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
     -- | Free callbacks created on the Haskell side before a widget is destroyed.
    ,destroyCallbacksCustom :: Maybe (Ref a -> [Maybe (FunPtr (IO ()))] -> IO ())
    }

-- | Fill up a struct with pointers to functions on the Haskell side that will get called instead of the default ones.
--
-- Fill up the 'Widget' part the function pointer struct.
--
-- Only of interest to 'Widget' contributors
fillCustomWidgetFunctionStruct :: forall a. (Parent a WidgetBase) =>
                                  Ptr () ->
                                  Maybe (Ref a -> IO ()) ->
                                  CustomWidgetFuncs a ->
                                  IO ()
fillCustomWidgetFunctionStruct structPtr _draw' (CustomWidgetFuncs _handle' _resize' _show' _hide' _destroyCallbacks') = do
      toCallbackPrim `orNullFunPtr` _draw'       >>= {#set fl_Widget_Virtual_Funcs->draw#} structPtr
      toEventHandlerPrim `orNullFunPtr` _handle' >>= {#set fl_Widget_Virtual_Funcs->handle#} structPtr
      toRectangleFPrim `orNullFunPtr` _resize'   >>= {#set fl_Widget_Virtual_Funcs->resize#} structPtr
      toCallbackPrim `orNullFunPtr` _show'       >>= {#set fl_Widget_Virtual_Funcs->show#} structPtr
      toCallbackPrim `orNullFunPtr` _hide'       >>= {#set fl_Widget_Virtual_Funcs->hide#} structPtr
      toDestroyCallbacksPrim `orNullFunPtr` _destroyCallbacks' >>= {#set fl_Widget_Virtual_Funcs->destroy_data#} structPtr

{# fun Fl_Widget_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}

-- | Given a record of functions, return a pointer to a struct with function pointers back to those functions.
--
-- Only of interest to 'Widget' contributors.
customWidgetFunctionStruct :: forall a. (Parent a WidgetBase) =>
                              Maybe (Ref a -> IO ()) ->
                              CustomWidgetFuncs a ->
                              IO (Ptr ())
customWidgetFunctionStruct draw' customWidgetFuncs' = do
  p <- virtualFuncs'
  fillCustomWidgetFunctionStruct p draw' customWidgetFuncs'
  return p

defaultDestroyCallbacks :: Ref a -> [Maybe (FunPtr (IO ()))] -> IO ()
defaultDestroyCallbacks _ = mapM_ freeHaskellFunPtr . catMaybes

defaultDestroyWidgetCallbacks :: (Parent a WidgetBase) => Ref a -> [Maybe (FunPtr (IO ()))] -> IO ()
defaultDestroyWidgetCallbacks = defaultDestroyCallbacks

-- | An empty set of functions to pass to 'widgetCustom'.
defaultCustomWidgetFuncs :: forall a. (Parent a WidgetBase) => CustomWidgetFuncs a
defaultCustomWidgetFuncs =
  CustomWidgetFuncs
    Nothing
    Nothing
    Nothing
    Nothing
    (Just defaultDestroyWidgetCallbacks)


-- | Lots of 'Widget' subclasses have the same constructor parameters. This function consolidates them.
--
-- Only of interest to 'Widget' contributors.
widgetMaker :: forall a. (Parent a WidgetBase) =>
               Rectangle                                                          -- ^ Position and size
               -> Maybe T.Text                                                    -- ^ Title
               -> Maybe (Ref a -> IO ())                                          -- ^ Custom drawing function
               -> Maybe (CustomWidgetFuncs a)                                     -- ^ Custom functions
               -> (Int -> Int -> Int -> Int -> Ptr () -> IO ( Ptr () ))           -- ^ Foreign constructor to call if only custom functions are given
               -> (Int -> Int -> Int -> Int -> CString -> Ptr () -> IO ( Ptr () )) -- ^ Foreign constructor to call if both title and custom functions are given
               -> IO (Ref a)                                                      -- ^ Reference to the widget
widgetMaker rectangle _label' draw' customFuncs' newWithCustomFuncs' newWithCustomFuncsLabel' =
  do
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    ptr <- customWidgetFunctionStruct draw' (maybe defaultCustomWidgetFuncs id customFuncs')
    widget <- maybe (newWithCustomFuncs' x_pos y_pos width height (castPtr ptr))
                    (\l -> copyTextToCString l >>= \l' -> newWithCustomFuncsLabel' x_pos y_pos width height l' (castPtr ptr))
                    _label'
    ref <- toRef widget
    setFlag (safeCast ref :: Ref WidgetBase) WidgetFlagCopiedLabel
    setFlag (safeCast ref :: Ref WidgetBase) WidgetFlagCopiedTooltip
    return ref

{# fun Fl_OverriddenWidget_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
-- | Widget constructor.
widgetCustom :: Rectangle                   -- ^ The bounds of this widget
                -> Maybe T.Text             -- ^ The widget label
                -> (Ref Widget -> IO ())    -- ^ Custom drawing function
                -> CustomWidgetFuncs Widget -- ^ Other custom functions
                -> IO (Ref Widget)
widgetCustom rectangle label' draw' funcs' = do
  ref <- widgetMaker
           rectangle
           label'
           (Just draw')
           (Just funcs')
           overriddenWidgetNew'
           overriddenWidgetNewWithLabel'
  setFlag ref WidgetFlagCopiedLabel
  setFlag ref WidgetFlagCopiedTooltip
  return ref

{# fun Fl_Widget_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~  IO ()) => Op (Destroy ()) WidgetBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    widgetDestroy' winPtr
    return nullPtr

{#fun Fl_Widget_parent as widgetParent' { id `Ptr ()'} -> `Ptr ()' id #}
instance (impl ~  IO (Maybe (Ref GroupBase))) => Op (GetParent ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget widgetParent' >>= toMaybeRef

{#fun Fl_Widget_set_parent as widgetSetParent' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a GroupBase, impl ~ (Maybe (Ref a) -> IO ())) => Op (SetParent ()) WidgetBase orig impl where
  runOp _ _ widget group =
      withRef widget
      (\widgetPtr ->
        withMaybeRef group (\groupPtr ->
                        widgetSetParent' widgetPtr groupPtr
                      )
      )
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (Word8)) => Op (GetType_ ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Word8 ->  IO ())) => Op (SetType ()) WidgetBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr t
{# fun Fl_Widget_draw_label as drawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Rectangle,Alignments) ->  IO ())) => Op (DrawLabel ()) WidgetBase orig impl where
  runOp _ _ widget Nothing = withRef widget $ \widgetPtr -> drawLabel' widgetPtr
  runOp _ _ widget (Just (rectangle,align_)) = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    drawLabelWithXywhAlignment' widgetPtr x_pos y_pos w_pos h_pos (alignmentsToInt align_)

{# fun Fl_Widget_x as x' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (X)) => Op (GetX ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> x' widgetPtr >>= return . X
{# fun Fl_Widget_y as y' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Y)) => Op (GetY ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> y' widgetPtr >>= return . Y
{# fun Fl_Widget_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Width)) => Op (GetW ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> w' widgetPtr >>= return . Width
{# fun Fl_Widget_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Height)) => Op (GetH ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> h' widgetPtr >>= return . Height
instance (
         Match obj ~ FindOp orig orig (GetX ()),
         Match obj ~ FindOp orig orig (GetY ()),
         Match obj ~ FindOp orig orig (GetW ()),
         Match obj ~ FindOp orig orig (GetH ()),
         Op (GetX ()) obj orig (IO X),
         Op (GetY ()) obj orig (IO Y),
         Op (GetW ()) obj orig (IO Width),
         Op (GetH ()) obj orig (IO Height),
         impl ~ IO Rectangle
         )
         =>
         Op (GetRectangle ()) WidgetBase orig impl where
   runOp _ _ widget = do
     _x <- getX (castTo widget :: Ref orig)
     _y <- getY (castTo widget :: Ref orig)
     _w <- getW (castTo widget :: Ref orig)
     _h <- getH (castTo widget :: Ref orig)
     return (Rectangle (Position _x _y) (Size _w _h))
{# fun Fl_Widget_set_align as setAlign' { id `Ptr ()', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Alignments ->  IO ())) => Op (SetAlign ()) WidgetBase orig impl where
  runOp _ _ widget _align = withRef widget $ \widgetPtr -> setAlign' widgetPtr (alignmentsToInt _align)
{# fun Fl_Widget_align as align' { id `Ptr ()' } -> `CUInt' id #}
instance (impl ~ IO Alignments) => Op (GetAlign ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> align' widgetPtr >>= return . intToAlignments . fromIntegral
{# fun Fl_Widget_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ IO (Boxtype)) => Op (GetBox ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> box' widgetPtr
{# fun Fl_Widget_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetBox ()) WidgetBase orig impl where
  runOp _ _ widget new_box = withRef widget $ \widgetPtr -> setBox' widgetPtr new_box
{# fun Fl_Widget_color as color' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ IO (Color)) => Op (GetColor ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> color' widgetPtr
{# fun Fl_Widget_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color ->  IO ())) => Op (SetColor ()) WidgetBase orig impl where
  runOp _ _ widget bg = withRef widget $ \widgetPtr -> setColor' widgetPtr bg
{# fun Fl_Widget_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color -> Color ->  IO ())) => Op (SetColorWithBgSel ()) WidgetBase orig impl where
  runOp _ _ widget bg a = withRef widget $ \widgetPtr -> setColorWithBgSel' widgetPtr bg a
{# fun Fl_Widget_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ IO (Color)) => Op (GetSelectionColor ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> selectionColor' widgetPtr
{# fun Fl_Widget_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Color ->  IO ())) => Op (SetSelectionColor ()) WidgetBase orig impl where
  runOp _ _ widget a = withRef widget $ \widgetPtr -> setSelectionColor' widgetPtr a
{# fun Fl_Widget_label as label' { id `Ptr ()' } -> `CString' #}
instance (impl ~ IO T.Text) => Op (GetLabel ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> label' widgetPtr >>= cStringToText
{# fun Fl_Widget_copy_label as copyLabel' { id `Ptr ()', `CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( T.Text -> IO ())) => Op (SetLabel ()) WidgetBase orig impl where
  runOp _ _ widget text =
     withRef widget $ \widgetPtr -> withCString (T.unpack text) (\sPtr -> copyLabel' widgetPtr sPtr)
{# fun Fl_Widget_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
instance (impl ~ (IO (Labeltype))) => Op (GetLabeltype ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labeltype' widgetPtr
{# fun Fl_Widget_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Labeltype ->  ResolveImageLabelConflict -> IO ())) => Op (SetLabeltype ()) WidgetBase orig impl where
  runOp _ _ widget a resolve = withRef widget $ \widgetPtr -> do
    lt <- getLabeltype widget
    case (lt, resolve) of
      (ImageLabelType, ResolveImageLabelDoNothing) -> return ()
      (ImageLabelType, ResolveImageLabelOverwrite) -> do
         setLabeltype' widgetPtr a
         copyLabel' widgetPtr nullPtr
      (MultiLabelType, ResolveImageLabelDoNothing) -> return ()
      (MultiLabelType, ResolveImageLabelOverwrite) -> do
         setLabeltype' widgetPtr a
         copyLabel' widgetPtr nullPtr
      (_,_) -> setLabeltype' widgetPtr a
{# fun Fl_Widget_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelcolor ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labelcolor' widgetPtr
{# fun Fl_Widget_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Color ->  IO ())) => Op (SetLabelcolor ()) WidgetBase orig impl where
  runOp _ _ widget c = withRef widget $ \widgetPtr -> setLabelcolor' widgetPtr c
{# fun Fl_Widget_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ (IO (Font))) => Op (GetLabelfont ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labelfont' widgetPtr
{# fun Fl_Widget_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Font ->  IO ())) => Op (SetLabelfont ()) WidgetBase orig impl where
  runOp _ _ widget c = withRef widget $ \widgetPtr -> setLabelfont' widgetPtr c
{# fun Fl_Widget_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ (IO (FontSize))) => Op (GetLabelsize ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> labelsize' widgetPtr >>= return . FontSize
{# fun Fl_Widget_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( FontSize ->  IO ())) => Op (SetLabelsize ()) WidgetBase orig impl where
  runOp _ _ widget (FontSize pix) = withRef widget $ \widgetPtr -> setLabelsize' widgetPtr pix
{# fun Fl_Widget_image as image' { id `Ptr ()' } -> `Ptr ()' #}
instance (impl ~ (IO (Maybe (Ref Image)))) => Op (GetImage ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> image' widgetPtr >>= toMaybeRef
{# fun Fl_Widget_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Maybe( Ref a ) ->  IO ())) => Op (SetImage ()) WidgetBase orig impl where
  runOp _ _ widget pix = withRef widget $ \widgetPtr -> withMaybeRef pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `Ptr ()' #}
instance (impl ~ (IO (Maybe (Ref Image)))) => Op (GetDeimage ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> deimage' widgetPtr >>= toMaybeRef
{# fun Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (Parent a Image, impl ~ (Maybe( Ref a ) ->  IO ())) => Op (SetDeimage ()) WidgetBase orig impl where
  runOp _ _ widget pix = withRef widget $ \widgetPtr -> withMaybeRef pix $ \pixPtr -> setDeimage' widgetPtr pixPtr
{# fun Fl_Widget_tooltip as tooltip' { id `Ptr ()' } -> `CString' #}
instance (impl ~ (IO T.Text)) => Op (GetTooltip ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> tooltip' widgetPtr >>= cStringToText
{# fun Fl_Widget_copy_tooltip as copyTooltip' { id `Ptr ()', `CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( T.Text ->  IO ())) => Op (CopyTooltip ()) WidgetBase orig impl where
  runOp _ _ widget text = withRef widget $ \widgetPtr -> withText text (\t -> copyTooltip' widgetPtr t)
{# fun Fl_Widget_set_tooltip as setTooltip' { id `Ptr ()', `CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( T.Text ->  IO ())) => Op (SetTooltip ()) WidgetBase orig impl where
  runOp _ _ widget text = withRef widget $ \widgetPtr -> withText text (copyTooltip' widgetPtr)
{# fun Fl_Widget_when as when' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ IO [When]) => Op (GetWhen ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr ->
      when' widgetPtr >>= return . extract allWhen
{# fun Fl_Widget_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( [When] ->  IO ())) => Op (SetWhen ()) WidgetBase orig impl where
  runOp _ _ widget i = withRef widget $ \widgetPtr ->
    setWhen' widgetPtr (fromIntegral . combine $ i)
{# fun Fl_Widget_do_callback as do_callback' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (DoCallback ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> do_callback' widgetPtr
{# fun Fl_Widget_visible as visible' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO Bool)) => Op (GetVisible ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> visible' widgetPtr
{# fun Fl_Widget_visible_r as visibleR' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO Bool)) => Op (GetVisibleR ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> visibleR' widgetPtr
{# fun Fl_Widget_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetVisible ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setVisible' widgetPtr
{# fun Fl_Widget_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearVisible ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearVisible' widgetPtr
{# fun Fl_Widget_active as active' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (Active ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> active' widgetPtr
{# fun Fl_Widget_active_r as activeR' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (ActiveR ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> activeR' widgetPtr
{# fun Fl_Widget_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Activate ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> activate' widgetPtr
{# fun Fl_Widget_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Deactivate ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> deactivate' widgetPtr
{# fun Fl_Widget_output as output' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetOutput ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> output' widgetPtr
{# fun Fl_Widget_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetOutput ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setOutput' widgetPtr
{# fun Fl_Widget_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearOutput ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearOutput' widgetPtr
{# fun Fl_Widget_takesevents as takesevents' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (Takesevents ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> takesevents' widgetPtr
{# fun Fl_Widget_set_active as setActive' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetActive ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setActive' widgetPtr
{# fun Fl_Widget_clear_active as clearActive' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearActive ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearActive' widgetPtr
{# fun Fl_Widget_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetChanged ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setChanged' widgetPtr
{# fun Fl_Widget_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearChanged ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearChanged' widgetPtr
{# fun Fl_Widget_changed as changed' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (Changed ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> changed' widgetPtr
{# fun Fl_Widget_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Either NoChange ()))) => Op (TakeFocus ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> takeFocus' widgetPtr >>= return . successOrNoChange
{# fun Fl_Widget_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (SetVisibleFocus ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> setVisibleFocus' widgetPtr
{# fun Fl_Widget_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearVisibleFocus ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearVisibleFocus' widgetPtr
{# fun Fl_Widget_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',cFromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Bool ->  IO ())) => Op (ModifyVisibleFocus ()) WidgetBase orig impl where
  runOp _ _ widget v = withRef widget $ \widgetPtr -> modifyVisibleFocus' widgetPtr v
{# fun Fl_Widget_visible_focus as visibleFocus' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (GetVisibleFocus ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> visibleFocus' widgetPtr
{# fun Fl_Widget_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a WidgetBase, impl ~  (Ref a ->  IO Bool)) => Op (Contains ()) WidgetBase orig impl where
  runOp _ _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr ->
    contains' widgetPtr otherWidgetPtr >>= return . cToBool
{# fun Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a WidgetBase, impl ~ (Ref a -> IO (Bool))) => Op (Inside ()) WidgetBase orig impl where
  runOp _ _ widget otherWidget = withRef widget $ \widgetPtr -> withRef otherWidget $ \otherWidgetPtr ->
    inside' widgetPtr otherWidgetPtr >>= return . cToBool
{# fun Fl_Widget_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Redraw ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> redraw' widgetPtr
{# fun Fl_Widget_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (RedrawLabel ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> redrawLabel' widgetPtr
{# fun Fl_Widget_damage as damage' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ (IO ([Damage]))) => Op (GetDamage ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> do
    d <- damage' widgetPtr
    return (extract allDamages (fromIntegral d))
{# fun Fl_Widget_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( [Damage] ->  IO ())) => Op (ClearDamageThenSet ()) WidgetBase orig impl where
  runOp _ _ widget damages = withRef widget $ \widgetPtr -> clearDamageWithBitmask' widgetPtr (fromIntegral (combine damages))
{# fun Fl_Widget_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ClearDamage ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> clearDamage' widgetPtr
{# fun Fl_Widget_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( [Damage] ->  IO ())) => Op (SetDamage ()) WidgetBase orig impl where
  runOp _ _ widget damages = withRef widget $ \widgetPtr -> damageWithText' widgetPtr (fromIntegral (combine damages))
{# fun Fl_Widget_damage_inside_widget as damageInsideWidget' { id `Ptr ()',`Word8',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( [Damage] -> Rectangle ->  IO ())) => Op (SetDamageInside ()) WidgetBase orig impl where
  runOp _ _ widget damages rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    damageInsideWidget' widgetPtr (fromIntegral (combine damages)) x_pos y_pos w_pos h_pos
{# fun Fl_Widget_measure_label as measureLabel' {id `Ptr ()',id `Ptr CInt', id `Ptr CInt'} -> `()' #}
instance (impl ~ ( Maybe Width -> IO (Size))) => Op (MeasureLabel ()) WidgetBase orig impl where
  runOp _ _ widget wrap =
    withRef widget
      $ \widgetPtr ->
      alloca $ \widthPtr ->
      alloca $ \heightPtr -> do
        poke widthPtr (maybe 0 (\(Width w) -> fromIntegral w) wrap)
        poke heightPtr 0
        measureLabel' widgetPtr widthPtr heightPtr
        w <- peekIntConv widthPtr
        h <- peekIntConv heightPtr
        return (Size (Width w) (Height h))
{# fun Fl_Widget_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref WindowBase)))) => Op (GetWindow ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> window' widgetPtr >>= toMaybeRef
{# fun Fl_Widget_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref WindowBase)))) => Op (GetTopWindow ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> (topWindow' widgetPtr) >>= toMaybeRef
{# fun Fl_Widget_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
instance (impl ~ ( IO (Position))) => Op (GetTopWindowOffset ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> topWindowOffset' widgetPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)

{# fun Fl_Widget_callback as getCallback' { id `Ptr ()' } -> `FunPtr CallbackWithUserDataPrim' id #}
instance (impl ~ (IO (FunPtr CallbackWithUserDataPrim))) => Op (GetCallback ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> getCallback' widgetPtr

{# fun Fl_Widget_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `FunPtr CallbackWithUserDataPrim' id #}
instance (impl ~ ((Ref orig -> IO ()) -> IO ())) => Op (SetCallback ()) WidgetBase orig impl where
  runOp _ _ widget callback = withRef widget $ \widgetPtr -> do
    ptr <- toCallbackPrimWithUserData callback
    oldCb <- setCallback' widgetPtr ptr
    if (oldCb == nullFunPtr)
    then return ()
    else freeHaskellFunPtr oldCb

{# fun Fl_Widget_has_callback as hasCallback' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ (IO (Bool))) => Op (HasCallback ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> do
    res <- hasCallback' widgetPtr
    return $ if (res == 0) then False else True
{# fun Fl_Widget_draw_box as widgetDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_tc as widgetDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_box_with_txywhc as widgetDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawBox ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> widgetDrawBox' widgetPtr
instance (impl ~ ( Boxtype -> Color -> Maybe Rectangle -> IO ())) => Op (DrawBoxWithBoxtype ()) WidgetBase orig impl where
  runOp _ _ widget bx c Nothing =
    withRef widget $ \widgetPtr -> widgetDrawBoxWithTC' widgetPtr bx c
  runOp _ _ widget bx c (Just r) =
              withRef widget $ \widgetPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                widgetDrawBoxWithTXywhC' widgetPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Widget_draw_backdrop as widgetDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawBackdrop ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> widgetDrawBackdrop' widgetPtr

{# fun Fl_Widget_draw_focus as widgetDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_focus_with_txywh as widgetDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Maybe (Boxtype, Rectangle) -> IO ())) => Op (DrawFocus ()) WidgetBase orig impl where
  runOp _ _ widget Nothing =
                withRef widget $ \ widgetPtr -> widgetDrawFocus' widgetPtr
  runOp _ _ widget (Just (bx, r)) =
                withRef widget $ \widgetPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  widgetDrawFocusWithTXywh' widgetPtr bx x_pos y_pos w_pos h_pos

{# fun Fl_Widget_set_flag as setFlag' { id `Ptr ()', cFromEnum `WidgetFlag' } -> `()' #}
{# fun Fl_Widget_clear_flag as clearFlag' { id `Ptr ()', cFromEnum `WidgetFlag' } -> `()' #}
{# fun Fl_Widget_flags as flags' { id `Ptr ()' } -> `CUInt' #}

instance (impl ~ (WidgetFlag -> IO ())) => Op (SetFlag ()) WidgetBase orig impl where
  runOp _ _ widget flag = withRef widget (\widgetPtr -> setFlag' widgetPtr flag)

instance (impl ~ (WidgetFlag -> IO ())) => Op (ClearFlag ()) WidgetBase orig impl where
  runOp _ _ widget flag = withRef widget (\widgetPtr -> clearFlag' widgetPtr flag)

instance (impl ~ (IO [WidgetFlag])) => Op (Flags ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget (\widgetPtr -> do
                        flagsUInt <- flags' widgetPtr
                        return (extract allWidgetFlags (fromIntegral flagsUInt)))

{# fun Fl_Widget_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleWidgetBase :: Ref WidgetBase -> Event ->  IO (Either UnknownEvent ())
handleWidgetBase widget event = withRef widget $ \widgetPtr -> handleSuper' widgetPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Widget_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeWidgetBase :: Ref WidgetBase -> Rectangle -> IO ()
resizeWidgetBase widget rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef widget $ \widgetPtr -> resizeSuper' widgetPtr x_pos y_pos width height
{# fun Fl_Widget_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideWidgetBase ::  Ref WidgetBase -> IO ()
hideWidgetBase widget = withRef widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Widget_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetWidgetBase ::  Ref WidgetBase -> IO ()
showWidgetWidgetBase widget = withRef widget $ \widgetPtr -> showSuper' widgetPtr

{# fun Fl_DerivedWidget_draw as draw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Draw ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> draw' widgetPtr

{#fun Fl_DerivedWidget_handle as widgetHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) WidgetBase orig impl where
  runOp _ _ widget event = withRef widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedWidget_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> show' widgetPtr

{# fun Fl_DerivedWidget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) WidgetBase orig impl where
  runOp _ _ widget rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' widgetPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedWidget_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) WidgetBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
-- @

-- $functions
-- @
-- activate :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- active :: 'Ref' 'WidgetBase' -> 'IO' ('Bool')
--
-- activeR :: 'Ref' 'WidgetBase' -> 'IO' ('Bool')
--
-- changed :: 'Ref' 'WidgetBase' -> 'IO' ('Bool')
--
-- clearActive :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- clearChanged :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- clearDamage :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- clearDamageThenSet :: 'Ref' 'WidgetBase' -> ['Damage'] -> 'IO' ()
--
-- clearFlag :: 'Ref' 'WidgetBase' -> 'WidgetFlag' -> 'IO' ()
--
-- clearOutput :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- clearVisible :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- clearVisibleFocus :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- contains:: ('Parent' a 'WidgetBase') => 'Ref' 'WidgetBase' -> 'Ref' a -> 'IO' 'Bool'
--
-- copyTooltip :: 'Ref' 'WidgetBase' -> 'T.Text' -> 'IO' ()
--
-- deactivate :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- destroy :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- doCallback :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- draw :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- drawBackdrop :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- drawBox :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- drawBoxWithBoxtype :: 'Ref' 'WidgetBase' -> 'Boxtype' -> 'Color' -> 'Maybe' 'Rectangle' -> 'IO' ()
--
-- drawFocus :: 'Ref' 'WidgetBase' -> 'Maybe' ('Boxtype', 'Rectangle') -> 'IO' ()
--
-- drawLabel :: 'Ref' 'WidgetBase' -> 'Maybe' ('Rectangle,Alignments') -> 'IO' ()
--
-- flags :: 'Ref' 'WidgetBase' -> 'IO' ['WidgetFlag']
--
-- getAlign :: 'Ref' 'WidgetBase' -> 'IO' 'Alignments'
--
-- getBox :: 'Ref' 'WidgetBase' -> 'IO' ('Boxtype')
--
-- getCallback :: 'Ref' 'WidgetBase' -> 'IO' ('FunPtr' 'CallbackWithUserDataPrim')
--
-- getColor :: 'Ref' 'WidgetBase' -> 'IO' ('Color')
--
-- getDamage :: 'Ref' 'WidgetBase' -> 'IO' (['Damage')]
--
-- getDeimage :: 'Ref' 'WidgetBase' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getH :: 'Ref' 'WidgetBase' -> 'IO' ('Height')
--
-- getImage :: 'Ref' 'WidgetBase' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getLabel :: 'Ref' 'WidgetBase' -> 'IO' 'T.Text'
--
-- getLabelcolor :: 'Ref' 'WidgetBase' -> 'IO' ('Color')
--
-- getLabelfont :: 'Ref' 'WidgetBase' -> 'IO' ('Font')
--
-- getLabelsize :: 'Ref' 'WidgetBase' -> 'IO' ('FontSize')
--
-- getLabeltype :: 'Ref' 'WidgetBase' -> 'IO' ('Labeltype')
--
-- getOutput :: 'Ref' 'WidgetBase' -> 'IO' ('Int')
--
-- getParent :: 'Ref' 'WidgetBase' -> 'IO' ('Maybe' ('Ref' 'GroupBase'))
--
-- getRectangle:: ('Match' obj ~ 'FindOp' orig orig ('GetX' ()), 'Match' obj ~ 'FindOp' orig orig ('GetY' ()), 'Match' obj ~ 'FindOp' orig orig ('GetW' ()), 'Match' obj ~ 'FindOp' orig orig ('GetH' ()), 'Op' ('GetX' ()) obj orig ('IO' 'X',) 'Op' ('GetY' ()) obj orig ('IO' 'Y',) 'Op' ('GetW' ()) obj orig ('IO' 'Width',) 'Op' ('GetH' ()) obj orig ('IO' 'Height',)) => 'Ref' 'WidgetBase' -> 'IO' 'Rectangle'
--
-- getSelectionColor :: 'Ref' 'WidgetBase' -> 'IO' ('Color')
--
-- getTooltip :: 'Ref' 'WidgetBase' -> 'IO' 'T.Text'
--
-- getTopWindow :: 'Ref' 'WidgetBase' -> 'IO' ('Maybe' ('Ref' 'WindowBase'))
--
-- getTopWindowOffset :: 'Ref' 'WidgetBase' -> 'IO' ('Position')
--
-- getType_ :: 'Ref' 'WidgetBase' -> 'IO' ('Word8')
--
-- getVisible :: 'Ref' 'WidgetBase' -> 'IO' 'Bool'
--
-- getVisibleFocus :: 'Ref' 'WidgetBase' -> 'IO' ('Bool')
--
-- getVisibleR :: 'Ref' 'WidgetBase' -> 'IO' 'Bool'
--
-- getW :: 'Ref' 'WidgetBase' -> 'IO' ('Width')
--
-- getWhen :: 'Ref' 'WidgetBase' -> 'IO' ['When']
--
-- getWindow :: 'Ref' 'WidgetBase' -> 'IO' ('Maybe' ('Ref' 'WindowBase'))
--
-- getX :: 'Ref' 'WidgetBase' -> 'IO' ('X')
--
-- getY :: 'Ref' 'WidgetBase' -> 'IO' ('Y')
--
-- handle :: 'Ref' 'WidgetBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hasCallback :: 'Ref' 'WidgetBase' -> 'IO' ('Bool')
--
-- hide :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- inside:: ('Parent' a 'WidgetBase') => 'Ref' 'WidgetBase' -> 'Ref' a -> 'IO' ('Bool')
--
-- measureLabel :: 'Ref' 'WidgetBase' -> 'Maybe' 'Width' -> 'IO' ('Size')
--
-- modifyVisibleFocus :: 'Ref' 'WidgetBase' -> 'Bool' -> 'IO' ()
--
-- redraw :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- redrawLabel :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- resize :: 'Ref' 'WidgetBase' -> 'Rectangle' -> 'IO' ()
--
-- setActive :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- setAlign :: 'Ref' 'WidgetBase' -> 'Alignments' -> 'IO' ()
--
-- setBox :: 'Ref' 'WidgetBase' -> 'Boxtype' -> 'IO' ()
--
-- setCallback :: 'Ref' 'WidgetBase' -> ('Ref' orig -> 'IO' ()) -> 'IO' ()
--
-- setChanged :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- setColor :: 'Ref' 'WidgetBase' -> 'Color' -> 'IO' ()
--
-- setColorWithBgSel :: 'Ref' 'WidgetBase' -> 'Color' -> 'Color' -> 'IO' ()
--
-- setDamage :: 'Ref' 'WidgetBase' -> ['Damage'] -> 'IO' ()
--
-- setDamageInside :: 'Ref' 'WidgetBase' -> ['Damage'] -> 'Rectangle' -> 'IO' ()
--
-- setDeimage:: ('Parent' a 'Image') => 'Ref' 'WidgetBase' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setFlag :: 'Ref' 'WidgetBase' -> 'WidgetFlag' -> 'IO' ()
--
-- setImage:: ('Parent' a 'Image') => 'Ref' 'WidgetBase' -> 'Maybe'( 'Ref' a ) -> 'IO' ()
--
-- setLabel :: 'Ref' 'WidgetBase' -> 'T.Text' -> 'IO' ()
--
-- setLabelcolor :: 'Ref' 'WidgetBase' -> 'Color' -> 'IO' ()
--
-- setLabelfont :: 'Ref' 'WidgetBase' -> 'Font' -> 'IO' ()
--
-- setLabelsize :: 'Ref' 'WidgetBase' -> 'FontSize' -> 'IO' ()
--
-- setLabeltype :: 'Ref' 'WidgetBase' -> 'Labeltype' -> 'ResolveImageLabelConflict' -> 'IO' ()
--
-- setOutput :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- setParent:: ('Parent' a 'GroupBase') => 'Ref' 'WidgetBase' -> 'Maybe' ('Ref' a) -> 'IO' ()
--
-- setSelectionColor :: 'Ref' 'WidgetBase' -> 'Color' -> 'IO' ()
--
-- setTooltip :: 'Ref' 'WidgetBase' -> 'T.Text' -> 'IO' ()
--
-- setType :: 'Ref' 'WidgetBase' -> 'Word8' -> 'IO' ()
--
-- setVisible :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- setVisibleFocus :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- setWhen :: 'Ref' 'WidgetBase' -> ['When'] -> 'IO' ()
--
-- showWidget :: 'Ref' 'WidgetBase' -> 'IO' ()
--
-- takeFocus :: 'Ref' 'WidgetBase' -> 'IO' ('Either' 'NoChange' ())
--
-- takesevents :: 'Ref' 'WidgetBase' -> 'IO' ('Bool')
-- @
