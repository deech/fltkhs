{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TableRow
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
#include "Fl_Table_RowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Table_Row_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Columns ->  IO ())) => Op (SetCols ()) TableRow orig impl where
  runOp _ _ table (Columns val) = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun Fl_Table_Row_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Rows ->  IO ())) => Op (SetRows ()) TableRow orig impl where
  runOp _ _ table (Rows val) = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_Row_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> draw'' tableRowPtr
{# fun Fl_Table_Row_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> hide' tableRowPtr
{# fun Fl_Table_Row_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> show' tableRowPtr
{# fun Fl_Table_Row_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) TableRow orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_Row_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) TableRow orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_Row_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO(Either UnknownEvent ()))) => Op (Handle ()) TableRow orig impl where
  runOp _ _ table event = withRef table $ \tablePtr -> handle' tablePtr event >>= return  . successOrUnknownEvent

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
-- "Graphics.UI.FLTK.LowLevel.Base.TableRow"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TableRow"
-- @

-- $functions
-- @
-- clear :: 'Ref' 'TableRow' -> 'IO' ()
--
-- draw :: 'Ref' 'TableRow' -> 'IO' ()
--
-- handle :: 'Ref' 'TableRow' -> 'Event' -> 'IO(Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TableRow' -> 'IO' ()
--
-- resize :: 'Ref' 'TableRow' -> 'Rectangle' -> 'IO' ()
--
-- setCols :: 'Ref' 'TableRow' -> 'Columns' -> 'IO' ()
--
-- setRows :: 'Ref' 'TableRow' -> 'Rows' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TableRow' -> 'IO' ()
-- @
