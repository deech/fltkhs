{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.OverlayWindow
    (
     overlayWindowNew
   , resizeOverlayWindowBase
   , hideOverlayWindowBase
   , showWidgetOverlayWindowBase
   , flushOverlayWindowBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_C.h"
#include "Fl_Overlay_WindowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Base.Widget
import qualified Data.Text as T

{# fun Fl_Overlay_Window_New_WithLabel as windowNewWithLabel' { `Int', `Int', `CString', id `FunPtr CallbackPrim',id `FunPtr DestroyCallbacksPrim'  } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_New as windowNew' { `Int', `Int', id `FunPtr CallbackPrim',id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_NewXY_WithLabel as windowNewWithXYLabel' { `Int', `Int', `Int', `Int', `CString', id `FunPtr CallbackPrim', id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_NewXY as windowNewWithXY' { `Int', `Int', `Int', `Int', id `FunPtr CallbackPrim', id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}

overlayWindowNew :: forall a. (Parent a OverlayWindowBase) => Size -> Maybe T.Text -> Maybe Position -> (Ref a -> IO ()) -> IO (Ref OverlayWindow)
overlayWindowNew (Size (Width width') (Height height')) title' position' callback' =
  do
    fptr <- toCallbackPrim callback'
    destroyFptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
    ref <- case (title', position') of
            (Just t, Just (Position (X x') (Y y'))) -> copyTextToCString t >>= \t' -> windowNewWithXYLabel' width' height' x' y' t' fptr destroyFptr >>= toRef
            (Nothing, Just (Position (X x') (Y y'))) -> windowNewWithXY' width' height' x' y' fptr destroyFptr >>= toRef
            (Just t, Nothing) -> copyTextToCString t >>= \t' -> windowNewWithLabel' width' height' t' fptr destroyFptr >>= toRef
            (Nothing, Nothing) -> windowNew' width' height' fptr destroyFptr >>= toRef
    setFlag ref WidgetFlagCopiedLabel
    setFlag ref WidgetFlagCopiedTooltip
    return ref
{# fun Fl_Overlay_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) OverlayWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Overlay_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Bool))) => Op (CanDoOverlay ()) OverlayWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDoOverlay' winPtr >>= return . cToBool
{# fun Fl_Overlay_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (RedrawOverlay ()) OverlayWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> redrawOverlay' winPtr

{# fun Fl_Overlay_Window_resize as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeOverlayWindowBase :: Ref OverlayWindowBase -> Rectangle -> IO ()
resizeOverlayWindowBase adjuster rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef adjuster $ \adjusterPtr -> resizeSuper' adjusterPtr x_pos y_pos width height
{# fun Fl_Overlay_Window_hide as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideOverlayWindowBase ::  Ref OverlayWindowBase -> IO ()
hideOverlayWindowBase adjuster = withRef adjuster $ \adjusterPtr -> hideSuper' adjusterPtr
{# fun Fl_Overlay_Window_show as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetOverlayWindowBase ::  Ref OverlayWindowBase -> IO ()
showWidgetOverlayWindowBase adjuster = withRef adjuster $ \adjusterPtr -> showSuper' adjusterPtr
{# fun Fl_Overlay_Window_flush as flushSuper' { id `Ptr ()' } -> `()' #}
flushOverlayWindowBase :: Ref OverlayWindowBase -> IO ()
flushOverlayWindowBase window = withRef window $ \windowPtr -> flush' windowPtr

{# fun Fl_DerivedOverlay_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) OverlayWindowBase orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedOverlay_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) OverlayWindowBase orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{# fun Fl_DerivedOverlay_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) OverlayWindowBase orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_DerivedOverlay_Window_flush as flush' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Flush ()) OverlayWindowBase orig impl where
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
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.DoubleWindow"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.OverlayWindow"
-- @

-- $functions
-- @
-- canDoOverlay :: 'Ref' 'OverlayWindowBase' -> 'IO' ('Bool')
--
-- destroy :: 'Ref' 'OverlayWindowBase' -> 'IO' ()
--
-- flush :: 'Ref' 'OverlayWindowBase' -> 'IO' ()
--
-- hide :: 'Ref' 'OverlayWindowBase' -> 'IO' ()
--
-- redrawOverlay :: 'Ref' 'OverlayWindowBase' -> 'IO' ()
--
-- resize :: 'Ref' 'OverlayWindowBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'OverlayWindowBase' -> 'IO' ()
-- @
