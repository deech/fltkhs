{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Table
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Widget Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TableC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Table_draw as draw' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> draw' tablePtr
{# fun Fl_Table_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ ( Event ->  IO( Either UnknownEvent ()))) => Op (Handle ()) Table orig impl where
  runOp _ _ table event = withRef table $ \tablePtr -> handle' tablePtr event >>= return  . successOrUnknownEvent
{# fun Fl_Table_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ ( Rectangle ->  IO ())) => Op (Resize ()) Table orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Clear ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) Table orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Table_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) Table orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr
{# fun Fl_Table_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Rows ->  IO ())) => Op (SetRows ()) Table orig impl where
  runOp _ _ table (Rows val) = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Columns ->  IO ())) => Op (SetCols ()) Table orig impl where
  runOp _ _ table (Columns val) = withRef table $ \tablePtr -> setCols' tablePtr val

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Table"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Table"
-- @

-- $functions
-- @
-- clear :: 'Ref' 'Table' -> 'IO' ()
--
-- draw :: 'Ref' 'Table' -> 'IO' ()
--
-- handle :: 'Ref' 'Table' -> 'Event' -> 'IO'( 'Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Table' -> 'IO' ()
--
-- resize :: 'Ref' 'Table' -> 'Rectangle' -> 'IO' ()
--
-- setCols :: 'Ref' 'Table' -> 'Columns' -> 'IO' ()
--
-- setRows :: 'Ref' 'Table' -> 'Rows' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Table' -> 'IO' ()
-- @
