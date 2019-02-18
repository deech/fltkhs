{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.OverlayWindow
    (
     overlayWindowNew
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
import Graphics.UI.FLTK.LowLevel.Widget
import qualified Data.Text as T

{# fun Fl_Overlay_Window_New_WithLabel as windowNewWithLabel' { `Int', `Int', `CString', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_New as windowNew' { `Int', `Int', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_NewXY_WithLabel as windowNewWithXYLabel' { `Int', `Int', `Int', `Int', `CString', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_NewXY as windowNewWithXY' { `Int', `Int', `Int', `Int', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}

overlayWindowNew :: forall a. (Parent a OverlayWindow) => Size -> Maybe T.Text -> Maybe Position -> (Ref a -> IO ()) -> IO (Ref OverlayWindow)
overlayWindowNew (Size (Width width') (Height height')) title' position' callback' =
    do
      fptr <- toCallbackPrim callback'
      ref <- case (title', position') of
              (Just t, Just (Position (X x') (Y y'))) -> copyTextToCString t >>= \t' -> windowNewWithXYLabel' width' height' x' y' t' fptr >>= toRef
              (Nothing, Just (Position (X x') (Y y'))) -> windowNewWithXY' width' height' x' y' fptr >>= toRef
              (Just t, Nothing) -> copyTextToCString t >>= \t' -> windowNewWithLabel' width' height' t' fptr >>= toRef
              (Nothing, Nothing) -> windowNew' width' height' fptr >>= toRef
      setFlag ref WidgetFlagCopiedLabel
      setFlag ref WidgetFlagCopiedTooltip
      return ref
{# fun Fl_Overlay_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) OverlayWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun Fl_Overlay_Window_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) OverlayWindow orig impl where
  runOp _ _ window = withRef window (\p -> show' p)
{# fun Fl_Overlay_Window_flush as flush' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Flush ()) OverlayWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> flush' windowPtr
{# fun Fl_Overlay_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) OverlayWindow orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun Fl_Overlay_Window_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Hide ()) OverlayWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr
{# fun Fl_Overlay_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Bool))) => Op (CanDoOverlay ()) OverlayWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDoOverlay' winPtr >>= return . cToBool
{# fun Fl_Overlay_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (RedrawOverlay ()) OverlayWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> redrawOverlay' winPtr

-- $functions
-- @
--
-- canDoOverlay :: 'Ref' 'OverlayWindow' -> 'IO' ('Bool')
--
-- destroy :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- flush :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- hide :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- redrawOverlay :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- resize :: 'Ref' 'OverlayWindow' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'OverlayWindow' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Window"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.DoubleWindow"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.OverlayWindow"
-- @
