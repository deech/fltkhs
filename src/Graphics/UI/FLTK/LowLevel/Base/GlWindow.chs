{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.GlWindow
    (
     glWindowNew,
     glWindowCustom,
     glWindowCanDo
    , drawGlWindowBase
   , handleGlWindowBase
   , resizeGlWindowBase
   , hideGlWindowBase
   , showWidgetGlWindowBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * GlWindow functions
     --
     -- $functions
    )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Gl_WindowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Window
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Base.Window
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenGl_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
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
drawGlWindowBase ::  Ref GlWindowBase -> IO ()
drawGlWindowBase glWindow = withRef glWindow $ \glWindowPtr -> drawSuper' glWindowPtr
{# fun Fl_Gl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleGlWindowBase :: Ref GlWindowBase -> Event ->  IO (Either UnknownEvent ())
handleGlWindowBase glWindow event = withRef glWindow $ \glWindowPtr -> handleSuper' glWindowPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Gl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeGlWindowBase :: Ref GlWindowBase -> Rectangle -> IO ()
resizeGlWindowBase glWindow rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef glWindow $ \glWindowPtr -> resizeSuper' glWindowPtr x_pos y_pos width height
{# fun Fl_Gl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideGlWindowBase ::  Ref GlWindowBase -> IO ()
hideGlWindowBase glWindow = withRef glWindow $ \glWindowPtr -> hideSuper' glWindowPtr
{# fun Fl_Gl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetGlWindowBase ::  Ref GlWindowBase -> IO ()
showWidgetGlWindowBase glWindow = withRef glWindow $ \glWindowPtr -> showSuper' glWindowPtr


{# fun Fl_DerivedGl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Flush ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> flush' winPtr
{# fun Fl_DerivedGl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hide' winPtr
{# fun Fl_DerivedGl_Window_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> show' winPtr
{# fun Fl_DerivedGl_Window_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO(Either UnknownEvent ()))) => Op (Handle ()) GlWindowBase orig impl where
  runOp _ _ self event = withRef self $ \selfPtr -> handle' selfPtr event >>= return  . successOrUnknownEvent
{# fun Fl_DerivedGl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun Fl_DerivedGl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) GlWindowBase orig impl where
  runOp _ _ win rectangle' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle' in
    withRef win $ \winPtr -> resize' winPtr x_pos' y_pos' width' height'

{# fun Fl_Gl_Window_valid as valid' { id `Ptr ()' } -> `Bool' #}
instance (impl ~ ( IO (Bool))) => Op (GetValid ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> valid' winPtr
{# fun Fl_Gl_Window_set_valid as setValid' { id `Ptr ()', `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetValid ()) GlWindowBase orig impl where
  runOp _ _ win v = withRef win $ \winPtr -> setValid' winPtr v
{# fun Fl_Gl_Window_invalidate as invalidate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Invalidate ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> invalidate' winPtr
{# fun Fl_Gl_Window_context_valid as contextValid' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetContextValid ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> contextValid' winPtr
{# fun Fl_Gl_Window_set_context_valid as setContextValid' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetContextValid ()) GlWindowBase orig impl where
  runOp _ _ win v = withRef win $ \winPtr -> setContextValid' winPtr v
{# fun Fl_Gl_Window_can_do as canDo' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (CanDo ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDo' winPtr
{# fun Fl_Gl_Window_mode as mode' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Mode))) => Op (GetMode ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> mode' winPtr >>= return . toEnum
{# fun Fl_Gl_Window_set_mode as setMode' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Modes ->  IO ())) => Op (SetMode ()) GlWindowBase orig impl where
  runOp _ _ win a = withRef win $ \winPtr -> setMode' winPtr (modesToInt a) >> return ()
{# fun Fl_Gl_Window_context as context' { id `Ptr ()' } -> `Ptr ()'  #}
instance (impl ~ ( IO (Ref FlGlContext))) => Op (GetContext ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> context' winPtr >>= toRef
{# fun Fl_Gl_Window_set_context as setContext' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Ref FlGlContext ->  IO ())) => Op (SetContext ()) GlWindowBase orig impl where
  runOp _ _ win context = withRef win $ \winPtr -> withRef context $ \contextPtr -> setContext' winPtr contextPtr
{# fun Fl_Gl_Window_set_context_with_destroy_flag as setContextWithDestroyFlag' { id `Ptr ()',id `Ptr ()', fromBool `Bool'} -> `()' supressWarningAboutRes #}
instance (impl ~ ( Ref FlGlContext ->  Bool -> IO ())) => Op (SetContextWithDestroyFlag ()) GlWindowBase orig impl where
  runOp _ _ win context destroyFlag= withRef win $ \winPtr -> withRef context $ \contextPtr -> setContextWithDestroyFlag' winPtr contextPtr destroyFlag
{# fun Fl_Gl_Window_swap_buffers as swapBuffers' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SwapBuffers ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> swapBuffers' winPtr
{# fun Fl_Gl_Window_ortho as ortho' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Ortho ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> ortho' winPtr
{# fun Fl_Gl_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (CanDoOverlay ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDoOverlay' winPtr
{# fun Fl_Gl_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (RedrawOverlay ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> redrawOverlay' winPtr
{# fun Fl_Gl_Window_hide_overlay as hideOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideOverlay ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hideOverlay' winPtr
{# fun Fl_Gl_Window_make_overlay_current as makeOverlayCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeOverlayCurrent ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> makeOverlayCurrent' winPtr
{# fun Fl_Gl_Window_pixels_per_unit as pixelsPerUnit' { id `Ptr ()'} -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (PixelsPerUnit ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> pixelsPerUnit' winPtr
{# fun Fl_Gl_Window_pixel_h as pixelH' { id `Ptr ()'} -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (PixelH ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> pixelH' winPtr
{# fun Fl_Gl_Window_pixel_w as pixelW' { id `Ptr ()'} -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (PixelW ()) GlWindowBase orig impl where
  runOp _ _ win = withRef win $ \winPtr -> pixelW' winPtr


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
-- "Graphics.UI.FLTK.LowLevel.Base.GlWindow"
-- @

-- $functions
-- @
-- canDo :: 'Ref' 'GlWindowBase' -> 'IO' ('Bool')
--
-- canDoOverlay :: 'Ref' 'GlWindowBase' -> 'IO' ('Bool')
--
-- destroy :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- flush :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- getContext :: 'Ref' 'GlWindowBase' -> 'IO' ('Ref' 'FlGlContext')
--
-- getContextValid :: 'Ref' 'GlWindowBase' -> 'IO' ('Bool')
--
-- getMode :: 'Ref' 'GlWindowBase' -> 'IO' ('Mode')
--
-- getValid :: 'Ref' 'GlWindowBase' -> 'IO' ('Bool')
--
-- handle :: 'Ref' 'GlWindowBase' -> 'Event' -> 'IO(Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- hideOverlay :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- invalidate :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- makeOverlayCurrent :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- ortho :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- pixelH :: 'Ref' 'GlWindowBase' -> 'IO' ('Int')
--
-- pixelW :: 'Ref' 'GlWindowBase' -> 'IO' ('Int')
--
-- pixelsPerUnit :: 'Ref' 'GlWindowBase' -> 'IO' ('Float')
--
-- redrawOverlay :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- resize :: 'Ref' 'GlWindowBase' -> 'Rectangle' -> 'IO' ()
--
-- setContext :: 'Ref' 'GlWindowBase' -> 'Ref' 'FlGlContext' -> 'IO' ()
--
-- setContextValid :: 'Ref' 'GlWindowBase' -> 'Bool' -> 'IO' ()
--
-- setContextWithDestroyFlag :: 'Ref' 'GlWindowBase' -> 'Ref' 'FlGlContext' -> 'Bool' -> 'IO' ()
--
-- setMode :: 'Ref' 'GlWindowBase' -> 'Modes' -> 'IO' ()
--
-- setValid :: 'Ref' 'GlWindowBase' -> 'Bool' -> 'IO' ()
--
-- showWidget :: 'Ref' 'GlWindowBase' -> 'IO' ()
--
-- swapBuffers :: 'Ref' 'GlWindowBase' -> 'IO' ()
-- @
