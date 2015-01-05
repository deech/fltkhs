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
import C2HS hiding (cFromEnum, toBool,cToEnum)

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
instance (impl ~ ( IO ())) => Op (DrawSuper ()) GlWindow orig impl where
  runOp _ _ self = withRef self $ \selfPtr -> drawSuper' selfPtr
{# fun unsafe Fl_Gl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hideSuper' winPtr
{# fun unsafe Fl_Gl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (FlushSuper ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> flushSuper' winPtr
{# fun unsafe Fl_Gl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Flush ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> flush' winPtr
{# fun unsafe Fl_Gl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> showSuper' winPtr
{# fun unsafe Fl_Gl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int -> Int -> Int -> Int ->  IO ())) => Op (ResizeSuper ()) GlWindow orig impl where
  runOp _ _ win x y w h = withRef win $ \winPtr -> resizeSuper' winPtr x y w h
{# fun unsafe Fl_Gl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hide' winPtr
{# fun unsafe Fl_Gl_Window_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> show' winPtr
{# fun unsafe Fl_Gl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int -> Int -> Int -> Int ->  IO ())) => Op (Resize ()) GlWindow orig impl where
  runOp _ _ win x y w h = withRef win $ \winPtr -> resize' winPtr x y w h
{# fun unsafe Fl_Gl_Window_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (Handle ()) GlWindow orig impl where
  runOp _ _ self event = withRef self $ \selfPtr -> handle' selfPtr event
{# fun unsafe Fl_Gl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (HandleSuper ()) GlWindow orig impl where
  runOp _ _ self event = withRef self $ \selfPtr -> handleSuper' selfPtr event
{# fun Fl_Gl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun unsafe Fl_Gl_Window_valid as valid' { id `Ptr ()' } -> `Bool' #}
instance (impl ~ ( IO (Bool))) => Op (GetValid ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> valid' winPtr
{# fun unsafe Fl_Gl_Window_set_valid as setValid' { id `Ptr ()', `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetValid ()) GlWindow orig impl where
  runOp _ _ win v = withRef win $ \winPtr -> setValid' winPtr v
{# fun unsafe Fl_Gl_Window_invalidate as invalidate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Invalidate ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> invalidate' winPtr
{# fun unsafe Fl_Gl_Window_context_valid as contextValid' { id `Ptr ()' } -> `Bool' toBool #}
instance (impl ~ ( IO (Bool))) => Op (GetContextValid ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> contextValid' winPtr
{# fun unsafe Fl_Gl_Window_set_context_valid as setContextValid' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetContextValid ()) GlWindow orig impl where
  runOp _ _ win v = withRef win $ \winPtr -> setContextValid' winPtr v
{# fun unsafe Fl_Gl_Window_can_do_with_m as canDoWithM' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (CanDoWithM ()) GlWindow orig impl where
  runOp _ _ win m = withRef win $ \winPtr -> canDoWithM' winPtr m
{# fun unsafe Fl_Gl_Window_can_do as canDo' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (CanDo ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDo' winPtr
{# fun unsafe Fl_Gl_Window_mode as mode' { id `Ptr ()' } -> `Mode' cToEnum #}
instance (impl ~ ( IO (Mode))) => Op (GetMode ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> mode' winPtr
{# fun unsafe Fl_Gl_Window_set_mode as setMode' { id `Ptr ()',cFromEnum `Mode' } -> `Int' #}
instance (impl ~ (Mode ->  IO (Int))) => Op (SetMode ()) GlWindow orig impl where
  runOp _ _ win a = withRef win $ \winPtr -> setMode' winPtr a
{# fun unsafe Fl_Gl_Window_context as context' { id `Ptr ()' } -> `Ref GlContext' unsafeToRef #}
instance (impl ~ ( IO (Ref GlContext))) => Op (GetContext ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> context' winPtr
{# fun unsafe Fl_Gl_Window_set_context as setContext' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Ref GlContext ->  IO ())) => Op (SetContext ()) GlWindow orig impl where
  runOp _ _ win context = withRef win $ \winPtr -> withRef context $ \contextPtr -> setContext' winPtr contextPtr
{# fun unsafe Fl_Gl_Window_set_context_with_destroy_flag as setContextWithDestroyFlag' { id `Ptr ()',id `Ptr ()', fromBool `Bool'} -> `()' supressWarningAboutRes #}
instance (impl ~ ( Ref GlContext ->  Bool -> IO ())) => Op (SetContextWithDestroyFlag ()) GlWindow orig impl where
  runOp _ _ win context destroyFlag= withRef win $ \winPtr -> withRef context $ \contextPtr -> setContextWithDestroyFlag' winPtr contextPtr destroyFlag
{# fun unsafe Fl_Gl_Window_swap_buffers as swapBuffers' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (SwapBuffers ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> swapBuffers' winPtr
{# fun unsafe Fl_Gl_Window_ortho as ortho' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Ortho ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> ortho' winPtr
{# fun unsafe Fl_Gl_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (CanDoOverlay ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> canDoOverlay' winPtr
{# fun unsafe Fl_Gl_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (RedrawOverlay ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> redrawOverlay' winPtr
{# fun unsafe Fl_Gl_Window_hide_overlay as hideOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideOverlay ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hideOverlay' winPtr
{# fun unsafe Fl_Gl_Window_make_overlay_current as makeOverlayCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (MakeOverlayCurrent ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> makeOverlayCurrent' winPtr
