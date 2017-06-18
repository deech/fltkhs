{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.GlWindow
    (
     glWindowNew,
     glWindowCustom,
     glWindowCanDo
     -- * Hierarchy
     --
     -- $hierarchy

     -- * GlWindow functions
     --
     -- $GlWindowfunctions
    )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Gl_WindowC.h"
import Foreign
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Window
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenGl_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
glWindowCustom :: Size                           -- ^ The size of this window
               -> Maybe Position                 -- ^ The position of this window
               -> Maybe T.Text                   -- ^ The window label
               -> Maybe (Ref GlWindow -> IO ())  -- ^ Optional custom drawing function
               -> CustomWidgetFuncs GlWindow     -- ^ other custom widget functions
               -> CustomWindowFuncs GlWindow     -- ^ Other custom window functions
               -> IO (Ref GlWindow)
glWindowCustom size position title draw' customWidgetFuncs' customWindowFuncs' =
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
glWindowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref GlWindow)
glWindowNew size position title =
  windowMaker
    size
    position
    title
    Nothing
    (defaultCustomWidgetFuncs :: CustomWidgetFuncs GlWindow)
    (defaultCustomWindowFuncs :: CustomWindowFuncs GlWindow)
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun Fl_Gl_Window_can_do_with_m as canDoWithM' { `Int'} -> `Bool' cToBool #}
glWindowCanDo :: Mode -> IO Bool
glWindowCanDo m = canDoWithM' (fromEnum m)
{# fun Fl_Gl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) GlWindow orig impl where
  runOp _ _ self = withRef self $ \selfPtr -> drawSuper' selfPtr
{# fun Fl_Gl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hideSuper' winPtr
{# fun Fl_Gl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (FlushSuper ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> flushSuper' winPtr
{# fun Fl_Gl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Flush ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> flush' winPtr
{# fun Fl_Gl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> showSuper' winPtr
{# fun Fl_Gl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle ->  IO ())) => Op (ResizeSuper ()) GlWindow orig impl where
  runOp _ _ win rectangle' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle' in
    withRef win $ \winPtr -> resizeSuper' winPtr x_pos' y_pos' width' height'
{# fun Fl_Gl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hide' winPtr
{# fun Fl_Gl_Window_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> show' winPtr
{# fun Fl_Gl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) GlWindow orig impl where
  runOp _ _ win rectangle' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle' in
    withRef win $ \winPtr -> resize' winPtr x_pos' y_pos' width' height'
{# fun Fl_Gl_Window_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO(Either UnknownEvent ()))) => Op (Handle ()) GlWindow orig impl where
  runOp _ _ self event = withRef self $ \selfPtr -> handle' selfPtr event >>= return  . successOrUnknownEvent
{# fun Fl_Gl_Window_handle_super as handleSuper' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) GlWindow orig impl where
  runOp _ _ self event = withRef self $ \selfPtr -> handleSuper' selfPtr event >>= return . successOrUnknownEvent
{# fun Fl_Gl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun Fl_Gl_Window_valid as valid' { id `Ptr ()' } -> `Bool' #}
instance (impl ~ ( IO (Bool))) => Op (GetValid ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> valid' winPtr
{# fun Fl_Gl_Window_set_valid as setValid' { id `Ptr ()', `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetValid ()) GlWindow orig impl where
  runOp _ _ win v = withRef win $ \winPtr -> setValid' winPtr v
{# fun Fl_Gl_Window_invalidate as invalidate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Invalidate ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> invalidate' winPtr
{# fun Fl_Gl_Window_context_valid as contextValid' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetContextValid ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> contextValid' winPtr
{# fun Fl_Gl_Window_set_context_valid as setContextValid' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetContextValid ()) GlWindow orig impl where
  runOp _ _ win v = withRef win $ \winPtr -> setContextValid' winPtr v
{# fun Fl_Gl_Window_can_do as canDo' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (CanDo ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDo' winPtr
{# fun Fl_Gl_Window_mode as mode' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Mode))) => Op (GetMode ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> mode' winPtr >>= return . toEnum
{# fun Fl_Gl_Window_set_mode as setMode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Modes ->  IO ())) => Op (SetMode ()) GlWindow orig impl where
  runOp _ _ win a = withRef win $ \winPtr -> setMode' winPtr (modesToInt a) >> return ()
{# fun Fl_Gl_Window_context as context' { id `Ptr ()' } -> `Ref GlContext' unsafeToRef #}
instance (impl ~ ( IO (Ref GlContext))) => Op (GetContext ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> context' winPtr
{# fun Fl_Gl_Window_set_context as setContext' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Ref GlContext ->  IO ())) => Op (SetContext ()) GlWindow orig impl where
  runOp _ _ win context = withRef win $ \winPtr -> withRef context $ \contextPtr -> setContext' winPtr contextPtr
{# fun Fl_Gl_Window_set_context_with_destroy_flag as setContextWithDestroyFlag' { id `Ptr ()',id `Ptr ()', fromBool `Bool'} -> `()' supressWarningAboutRes #}
instance (impl ~ ( Ref GlContext ->  Bool -> IO ())) => Op (SetContextWithDestroyFlag ()) GlWindow orig impl where
  runOp _ _ win context destroyFlag= withRef win $ \winPtr -> withRef context $ \contextPtr -> setContextWithDestroyFlag' winPtr contextPtr destroyFlag
{# fun Fl_Gl_Window_swap_buffers as swapBuffers' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SwapBuffers ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> swapBuffers' winPtr
{# fun Fl_Gl_Window_ortho as ortho' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Ortho ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> ortho' winPtr
{# fun Fl_Gl_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (CanDoOverlay ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDoOverlay' winPtr
{# fun Fl_Gl_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (RedrawOverlay ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> redrawOverlay' winPtr
{# fun Fl_Gl_Window_hide_overlay as hideOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideOverlay ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hideOverlay' winPtr
{# fun Fl_Gl_Window_make_overlay_current as makeOverlayCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeOverlayCurrent ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> makeOverlayCurrent' winPtr
{# fun Fl_Gl_Window_pixels_per_unit as pixelsPerUnit' { id `Ptr ()'} -> `Float' #}
#if FLTK_API_VERSION == 10304
instance (impl ~ ( IO (Float))) => Op (PixelsPerUnit ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> pixelsPerUnit' winPtr
{# fun Fl_Gl_Window_pixel_h as pixelH' { id `Ptr ()'} -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (PixelH ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> pixelH' winPtr
{# fun Fl_Gl_Window_pixel_w as pixelW' { id `Ptr ()'} -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (PixelW ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> pixelW' winPtr
#endif
-- $GlWindowfunctions
-- @
-- canDo :: 'Ref' 'GlWindow' -> 'IO' ('Bool')
--
-- canDoOverlay :: 'Ref' 'GlWindow' -> 'IO' ('Bool')
--
-- destroy :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- flush :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- flushSuper :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- getContext :: 'Ref' 'GlWindow' -> 'IO' ('Ref' 'GlContext')
--
-- getContextValid :: 'Ref' 'GlWindow' -> 'IO' ('Bool')
--
-- getMode :: 'Ref' 'GlWindow' -> 'IO' ('Mode')
--
-- getValid :: 'Ref' 'GlWindow' -> 'IO' ('Bool')
--
-- handle :: 'Ref' 'GlWindow' -> 'Event' -> 'IO(Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'GlWindow' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- hideOverlay :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- invalidate :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- makeOverlayCurrent :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- ortho :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- redrawOverlay :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- resize :: 'Ref' 'GlWindow' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'GlWindow' -> 'Rectangle' -> 'IO' ()
--
-- setContext :: 'Ref' 'GlWindow' -> 'Ref' 'GlContext' -> 'IO' ()
--
-- setContextValid :: 'Ref' 'GlWindow' -> 'Bool' -> 'IO' ()
--
-- setContextWithDestroyFlag :: 'Ref' 'GlWindow' -> 'Ref' 'GlContext' -> 'Bool' -> 'IO' ()
--
-- setMode :: 'Ref' 'GlWindow' -> 'Modes' -> 'IO' ()
--
-- setValid :: 'Ref' 'GlWindow' -> 'Bool' -> 'IO' ()
--
-- showWidget :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- swapBuffers :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- Available in FLTK 1.3.4 only:
--
-- pixelH :: 'Ref' 'GlWindow' -> 'IO' ('Int')
--
-- pixelW :: 'Ref' 'GlWindow' -> 'IO' ('Int')
--
-- pixelsPerUnit :: 'Ref' 'GlWindow' -> 'IO' ('Float')
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
-- "Graphics.UI.FLTK.LowLevel.GlWindow"
-- @
