{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Double_Window
  (
    DoubleWindowFuncs(..),
    defaultDoubleWindowFuncs,
    singleWindowNew
  )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

data DoubleWindowFuncs =
    DoubleWindowFuncs
    {
     singleWindowDrawOverride       :: Maybe WidgetCallback
    ,singleWindowHandleOverride     :: Maybe WidgetEventHandler
    ,singleWindowResizeOverride     :: Maybe RectangleF
    ,singleWindowShowOverride       :: Maybe WidgetCallback
    ,singleWindowHideOverride       :: Maybe WidgetCallback
    ,singleWindowAsWindowOverride   :: Maybe GetWindowF
    ,singleWindowAsGlWindowOverride :: Maybe GetGlWindowF
    ,singleWindowAsGroupOverride    :: Maybe GetGroupF
    ,singleWindowFlushOverride      :: Maybe WidgetCallback
    }

singleWindowFunctionStruct :: DoubleWindowFuncs -> IO (Ptr ())
singleWindowFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Double_Window_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (singleWindowDrawOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (singleWindowHandleOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (singleWindowResizeOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (singleWindowShowOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (singleWindowHideOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (singleWindowAsWindowOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (singleWindowAsGlWindowOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (singleWindowAsGroupOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->as_group#} p
      toCallbackPrim  `orNullFunPtr` (singleWindowFlushOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->flush#} p
      {#set fl_Double_Window_Virtual_Funcs->destroy_data #} p nullFunPtr
      return p

defaultDoubleWindowFuncs :: DoubleWindowFuncs
defaultDoubleWindowFuncs = DoubleWindowFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{# fun Fl_Double_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Double_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Double_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Double_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
singleWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe DoubleWindowFuncs -> IO (Ref DoubleWindow)
singleWindowNew (Size (Width w) (Height h)) position title funcs' =
    case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= toRef
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= toRef
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= toRef
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= toRef
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= toRef
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= toRef
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= toRef
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= toRef

{# fun Fl_Double_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) DoubleWindow ( IO ()) where
  runOp _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Double_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawSuper ()) DoubleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Double_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (HandleSuper ()) DoubleWindow ( Int ->  IO (Int)) where
  runOp _ window event = withRef window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Double_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) DoubleWindow ( Rectangle -> IO (())) where
  runOp _ window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Double_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) DoubleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Double_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) DoubleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Double_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) DoubleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Double_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (FlushSuper ()) DoubleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Double_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Ref Window' unsafeToRef #}
instance Op (AsWindowSuper ()) DoubleWindow (  IO (Ref Window)) where
  runOp _ window = withRef window $ \windowPtr -> asWindowSuper' windowPtr

{# fun Fl_Double_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `Ref GlWindow' unsafeToRef #}
instance Op (AsGlWindowSuper ()) DoubleWindow (  IO (Ref GlWindow)) where
  runOp _ window = withRef window $ \windowPtr -> asGlWindowSuper' windowPtr

{# fun Fl_Double_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Ref Group' unsafeToRef #}
instance Op (AsGroupSuper ()) DoubleWindow (  IO (Ref Group)) where
  runOp _ window = withRef window $ \windowPtr -> asGroupSuper' windowPtr

{# fun Fl_Double_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) DoubleWindow ( IO ()) where
  runOp _ window = withRef window (\p -> windowShow' p)

{#fun Fl_Double_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) DoubleWindow ( Event -> IO Int) where
  runOp _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Double_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) DoubleWindow ( Rectangle -> IO (())) where
  runOp _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Double_Window_as_window as asWindow' { id `Ptr ()' } -> `Ref Window' unsafeToRef #}
instance Op (AsWindow ()) DoubleWindow (  IO (Ref Window)) where
  runOp _ window = withRef window $ \windowPtr -> asWindow' windowPtr

{# fun Fl_Double_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Ref GlWindow' unsafeToRef #}
instance Op (AsGlWindow ()) DoubleWindow (  IO (Ref GlWindow)) where
  runOp _ window = withRef window $ \windowPtr -> asGlWindow' windowPtr

{# fun Fl_Double_Window_as_group as asGroup' { id `Ptr ()' } -> `Ref Group' unsafeToRef #}
instance Op (AsGroup ()) DoubleWindow (  IO (Ref Group)) where
  runOp _ window = withRef window $ \windowPtr -> asGroup' windowPtr
