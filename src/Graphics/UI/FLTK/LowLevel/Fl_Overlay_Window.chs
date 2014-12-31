{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Overlay_Window
    (
     overlayWindowNew
    )
where
#include "Fl_C.h"
#include "Fl_Overlay_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

{# fun Fl_Overlay_Window_New_WithLabel as windowNewWithLabel' { `Int', `Int', `String', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_New as windowNew' { `Int', `Int', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_NewXY_WithLabel as windowNewWithXYLabel' { `Int', `Int', `Int', `Int', `String', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}
{# fun Fl_Overlay_Window_NewXY as windowNewWithXY' { `Int', `Int', `Int', `Int', id `FunPtr CallbackPrim' } -> `Ptr ()' id #}

overlayWindowNew :: forall a. (Parent a OverlayWindow) => Size -> Maybe String -> Maybe Position -> (Ref a -> IO ()) -> IO (Ref OverlayWindow)
overlayWindowNew (Size (Width width') (Height height')) title' position' callback' =
    do
      fptr <- toCallbackPrim callback'
      case (title', position') of
        (Just t, Just (Position (X x') (Y y'))) -> windowNewWithXYLabel' width' height' x' y' t fptr >>= toRef
        (Nothing, Just (Position (X x') (Y y'))) -> windowNewWithXY' width' height' x' y' fptr >>= toRef
        (Just t, Nothing) -> windowNewWithLabel' width' height' t fptr >>= toRef
        (Nothing, Nothing) -> windowNew' width' height' fptr >>= toRef

{# fun Fl_Overlay_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' #}
instance Op (Destroy ()) OverlayWindow ( IO ()) where
  runOp _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun unsafe Fl_Overlay_Window_show as show' { id `Ptr ()' } -> `()' #}
instance Op (ShowWidget ()) OverlayWindow ( IO ()) where
  runOp _ window = withRef window (\p -> show' p)
{# fun unsafe Fl_Overlay_Window_flush as flush' { id `Ptr ()' } -> `()' #}
instance Op (Flush ()) OverlayWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> flush' windowPtr
{# fun unsafe Fl_Overlay_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (Resize ()) OverlayWindow ( Rectangle -> IO (())) where
  runOp _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun unsafe Fl_Overlay_Window_hide as hide' { id `Ptr ()' } -> `()' #}
instance Op (Hide ()) OverlayWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hide' windowPtr
{# fun unsafe Fl_Overlay_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
instance Op (CanDoOverlay ()) OverlayWindow (IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> canDoOverlay' winPtr
{# fun unsafe Fl_Overlay_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' #}
instance Op (RedrawOverlay ()) OverlayWindow (IO ()) where
  runOp _ win = withRef win $ \winPtr -> redrawOverlay' winPtr
