{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.GlWindow
where
#include "Fl_C.h"
#include "Fl_Gl_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedGl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Flush ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> flush' winPtr
{# fun Fl_DerivedGl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> hide' winPtr
{# fun Fl_DerivedGl_Window_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> show' winPtr
{# fun Fl_DerivedGl_Window_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO(Either UnknownEvent ()))) => Op (Handle ()) GlWindow orig impl where
  runOp _ _ self event = withRef self $ \selfPtr -> handle' selfPtr event >>= return  . successOrUnknownEvent
{# fun Fl_DerivedGl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) GlWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr
{# fun Fl_DerivedGl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) GlWindow orig impl where
  runOp _ _ win rectangle' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle' in
    withRef win $ \winPtr -> resize' winPtr x_pos' y_pos' width' height'

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
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.GlWindow"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- flush :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- handle :: 'Ref' 'GlWindow' -> 'Event' -> 'IO(Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'GlWindow' -> 'IO' ()
--
-- resize :: 'Ref' 'GlWindow' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'GlWindow' -> 'IO' ()
-- @
