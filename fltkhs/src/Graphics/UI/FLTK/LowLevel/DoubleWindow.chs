{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.DoubleWindow
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

{# fun Fl_DerivedDouble_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) DoubleWindow orig impl where
  runOp _ _ win = withRef win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_DerivedDouble_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_DerivedDouble_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) DoubleWindow orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{#fun Fl_DerivedDouble_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) DoubleWindow orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedDouble_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) DoubleWindow orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedDouble_Window_flush as flush' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Flush ()) DoubleWindow orig impl where
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
-- "Graphics.UI.FLTK.LowLevel.DoubleWindow"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- flush :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- handle :: 'Ref' 'DoubleWindow' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'DoubleWindow' -> 'IO' ()
--
-- resize :: 'Ref' 'DoubleWindow' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'DoubleWindow' -> 'IO' ()
-- @
