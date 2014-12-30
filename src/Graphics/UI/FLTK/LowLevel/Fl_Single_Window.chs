{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Single_Window
  (
    singleWindowNew,
    singleWindowCustom
  )
where
#include "Fl_C.h"
#include "Fl_Single_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

{# fun Fl_Single_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Single_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Single_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Single_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
singleWindowCustom :: Size -> Maybe Position -> Maybe String -> Maybe (CustomWidgetFuncs SingleWindow) -> Maybe (CustomWindowFuncs SingleWindow) -> IO (Ref SingleWindow)
singleWindowCustom size position title customWidgetFuncs' customWindowFuncs' =
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

singleWindowNew :: Size -> Maybe Position -> Maybe String -> IO (Ref SingleWindow)
singleWindowNew size position title =
  windowMaker
    size
    position
    title
    (Nothing :: (Maybe (CustomWidgetFuncs SingleWindow)))
    (Nothing :: (Maybe (CustomWindowFuncs SingleWindow)))
    windowNew'
    windowNewWithLabel'
    windowNewXY'
    windowNewXYWithLabel'
    overriddenWindowNew'
    overriddenWindowNewWithLabel'
    overriddenWindowNewXY'
    overriddenWindowNewXYWithLabel'

{# fun Fl_Single_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) SingleWindow ( IO ()) where
  runOp _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Single_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawSuper ()) SingleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Single_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (HandleSuper ()) SingleWindow ( Int ->  IO (Int)) where
  runOp _ window event = withRef window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Single_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) SingleWindow ( Rectangle -> IO (())) where
  runOp _ window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Single_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) SingleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Single_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) SingleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Single_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) SingleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Single_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (FlushSuper ()) SingleWindow (  IO (())) where
  runOp _ window = withRef window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Single_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) SingleWindow ( IO ()) where
  runOp _ window = withRef window (\p -> windowShow' p)

{#fun Fl_Single_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) SingleWindow ( Event -> IO Int) where
  runOp _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Single_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) SingleWindow ( Rectangle -> IO (())) where
  runOp _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos


{# fun Fl_Single_Window_make_current as makeCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (MakeCurrent ()) SingleWindow (  IO (())) where
  runOp _ win = withRef win $ \winPtr -> makeCurrent' winPtr
