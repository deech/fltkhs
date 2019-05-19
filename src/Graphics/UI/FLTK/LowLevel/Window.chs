{-# LANGUAGE CPP, UndecidableInstances, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ExistentialQuantification #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Window
  (
    -- * Hierarchy
    --
    -- $hierarchy

    -- * Functions
    --
    -- $functions
  )
where
#include "Fl_C.h"
#include "Fl_WindowC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{#fun Fl_DerivedWindow_handle as windowHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Window orig impl where
  runOp _ _ window event = withRef window (\p -> windowHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedWindow_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Window orig impl where
  runOp _ _ window rectangle = withRef window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedWindow_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) Window orig impl where
  runOp _ _ window = withRef window (\p -> windowShow' p)

{# fun Fl_DerivedWindow_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) Window orig impl where
  runOp _ _ window = withRef window $ \windowPtr -> hide' windowPtr

{# fun Fl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Flush ()) Window orig impl where
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
-- "Graphics.UI.FLTK.LowLevel.Window"
-- @

-- $functions
-- @
-- flush :: 'Ref' 'Window' -> 'IO' ()
--
-- handle :: 'Ref' 'Window' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Window' -> 'IO' ()
--
-- resize :: 'Ref' 'Window' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Window' -> 'IO' ()
-- @
