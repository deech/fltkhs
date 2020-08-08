{-# LANGUAGE CPP, UndecidableInstances, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.OverlayWindow
  (
    -- * Hierarchy
    --
    -- $hierarchy
  )
where
#include "Fl_C.h"
#include "Fl_Overlay_WindowC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import Foreign
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedOverlay_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) OverlayWindow orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedOverlay_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) OverlayWindow orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{# fun Fl_DerivedOverlay_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) OverlayWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_DerivedOverlay_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) OverlayWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_DerivedOverlay_Window_flush as flush' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Flush ()) OverlayWindow orig impl where
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
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.OverlayWindow"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- flush :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- hide :: 'Ref' 'OverlayWindow' -> 'IO' ()
--
-- resize :: 'Ref' 'OverlayWindow' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'OverlayWindow' -> 'IO' ()
-- @
