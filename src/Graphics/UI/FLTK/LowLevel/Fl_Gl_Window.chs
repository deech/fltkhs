{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Gl_Window
    (
     glWindowNew,
     glWindowCustom
    )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Gl_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

{# fun Fl_Gl_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Gl_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Gl_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Gl_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
glWindowCustom :: Size ->
                  Maybe Position ->
                  Maybe String ->
                  Maybe (CustomWidgetFuncs GlWindow) ->
                  Maybe (CustomWindowFuncs GlWindow) ->
                  IO (Ref GlWindow)
glWindowCustom size position title customWidgetFuncs' customWindowFuncs' =
  windowMaker
    size
    position
    title
    customWidgetFuncs'
    customWindowFuncs'
    windowNew'
    windowNewWithLabel'
    windowNewXY'
    windowNewXYWithLabel'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'
glWindowNew :: Size ->
             Maybe Position ->
             Maybe String ->
             IO (Ref Window)
glWindowNew size position title =
  windowMaker
    size
    position
    title
    (Nothing :: (Maybe (CustomWidgetFuncs Window)))
    (Nothing :: (Maybe (CustomWindowFuncs Window)))
    windowNew'
    windowNewWithLabel'
    windowNewXY'
    windowNewXYWithLabel'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun unsafe Fl_Gl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawSuper ()) GlWindow (  IO (())) where
  runOp _ self = withRef self $ \selfPtr -> drawSuper' selfPtr
{# fun unsafe Fl_Gl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> hideSuper' winPtr
{# fun unsafe Fl_Gl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (FlushSuper ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> flushSuper' winPtr
{# fun unsafe Fl_Gl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Flush ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> flush' winPtr
{# fun unsafe Fl_Gl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> showSuper' winPtr
{# fun unsafe Fl_Gl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) GlWindow ( Int -> Int -> Int -> Int ->  IO (())) where
  runOp _ win x y w h = withRef win $ \winPtr -> resizeSuper' winPtr x y w h
{# fun unsafe Fl_Gl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> hide' winPtr
{# fun unsafe Fl_Gl_Window_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> show' winPtr
{# fun unsafe Fl_Gl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) GlWindow ( Int -> Int -> Int -> Int ->  IO (())) where
  runOp _ win x y w h = withRef win $ \winPtr -> resize' winPtr x y w h
{# fun unsafe Fl_Gl_Window_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (Handle ()) GlWindow ( Int ->  IO (Int)) where
  runOp _ self event = withRef self $ \selfPtr -> handle' selfPtr event
{# fun unsafe Fl_Gl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (HandleSuper ()) GlWindow ( Int ->  IO (Int)) where
  runOp _ self event = withRef self $ \selfPtr -> handleSuper' selfPtr event
{# fun Fl_Gl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) GlWindow ( IO ()) where
  runOp _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun unsafe Fl_Gl_Window_valid as valid' { id `Ptr ()' } -> `Bool' #}
instance Op (GetValid ()) GlWindow (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> valid' winPtr
{# fun unsafe Fl_Gl_Window_set_valid as setValid' { id `Ptr ()', `Bool' } -> `()' supressWarningAboutRes #}
instance Op (SetValid ()) GlWindow ( Bool ->  IO (())) where
  runOp _ win v = withRef win $ \winPtr -> setValid' winPtr v
{# fun unsafe Fl_Gl_Window_invalidate as invalidate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Invalidate ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> invalidate' winPtr
{# fun unsafe Fl_Gl_Window_context_valid as contextValid' { id `Ptr ()' } -> `Bool' toBool #}
instance Op (GetContextValid ()) GlWindow (  IO (Bool)) where
  runOp _ win = withRef win $ \winPtr -> contextValid' winPtr
{# fun unsafe Fl_Gl_Window_set_context_valid as setContextValid' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance Op (SetContextValid ()) GlWindow ( Bool ->  IO (())) where
  runOp _ win v = withRef win $ \winPtr -> setContextValid' winPtr v
{# fun unsafe Fl_Gl_Window_can_do_with_m as canDoWithM' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (CanDoWithM ()) GlWindow ( Int ->  IO (Int)) where
  runOp _ win m = withRef win $ \winPtr -> canDoWithM' winPtr m
{# fun unsafe Fl_Gl_Window_can_do as canDo' { id `Ptr ()' } -> `Int' #}
instance Op (CanDo ()) GlWindow (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> canDo' winPtr
{# fun unsafe Fl_Gl_Window_mode as mode' { id `Ptr ()' } -> `Mode' cToEnum #}
instance Op (GetMode ()) GlWindow (  IO (Mode)) where
  runOp _ win = withRef win $ \winPtr -> mode' winPtr
{# fun unsafe Fl_Gl_Window_set_mode as setMode' { id `Ptr ()',cFromEnum `Mode' } -> `Int' #}
instance Op (SetMode ()) GlWindow ( Mode ->  IO (Int)) where
  runOp _ win a = withRef win $ \winPtr -> setMode' winPtr a
{# fun unsafe Fl_Gl_Window_context as context' { id `Ptr ()' } -> `Ref GlContext' unsafeToRef #}
instance Op (GetContext ()) GlWindow (  IO (Ref GlContext)) where
  runOp _ win = withRef win $ \winPtr -> context' winPtr
{# fun unsafe Fl_Gl_Window_set_context as setContext' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SetContext ()) GlWindow (Ref GlContext ->  IO (())) where
  runOp _ win context = withRef win $ \winPtr -> withRef context $ \contextPtr -> setContext' winPtr contextPtr
{# fun unsafe Fl_Gl_Window_set_context_with_destroy_flag as setContextWithDestroyFlag' { id `Ptr ()',id `Ptr ()', fromBool `Bool'} -> `()' supressWarningAboutRes #}
instance Op (SetContextWithDestroyFlag ()) GlWindow (Ref GlContext ->  Bool -> IO (())) where
  runOp _ win context destroyFlag= withRef win $ \winPtr -> withRef context $ \contextPtr -> setContextWithDestroyFlag' winPtr contextPtr destroyFlag
{# fun unsafe Fl_Gl_Window_swap_buffers as swapBuffers' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (SwapBuffers ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> swapBuffers' winPtr
{# fun unsafe Fl_Gl_Window_ortho as ortho' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Ortho ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> ortho' winPtr
{# fun unsafe Fl_Gl_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
instance Op (CanDoOverlay ()) GlWindow (  IO (Int)) where
  runOp _ win = withRef win $ \winPtr -> canDoOverlay' winPtr
{# fun unsafe Fl_Gl_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (RedrawOverlay ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> redrawOverlay' winPtr
{# fun unsafe Fl_Gl_Window_hide_overlay as hideOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideOverlay ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> hideOverlay' winPtr
{# fun unsafe Fl_Gl_Window_make_overlay_current as makeOverlayCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (MakeOverlayCurrent ()) GlWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> makeOverlayCurrent' winPtr
