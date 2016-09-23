{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TableRow
    (
     tableRowNew,
     TableRowSelectFlag(..)
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Table_RowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Table
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

data TableRowSelectFlag = TableRowSelect | TableRowDeselect | TableRowToggle

{# fun Fl_OverriddenTable_Row_New as tableRowNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenTable_Row_New_WithLabel as tableRowNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
tableRowNew :: Rectangle -> Maybe String -> Maybe (Ref TableRow -> IO ()) -> (Ref TableRow -> TableContext -> TableCoordinate -> Rectangle -> IO ()) -> CustomWidgetFuncs TableRow -> CustomTableFuncs TableRow -> IO (Ref TableRow)
tableRowNew rectangle label' draw' drawCell' customWidgetFuncs' customTableFuncs' =
    do
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableCustomFunctionStruct draw' (Just drawCell') customWidgetFuncs' customTableFuncs'
      case label' of
        (Just l') -> tableRowNewWithLabel' x_pos y_pos width height l' ptr >>= toRef
        Nothing -> tableRowNew' x_pos y_pos width height ptr >>= toRef

{# fun Fl_Table_Row_Destroy as tableRowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> tableRowDestroy' tableRowPtr
{# fun Fl_Table_Row_rows as rows' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetRows ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> rows' tableRowPtr
{# fun Fl_Table_Row_set_type as tableRowSetType' { id `Ptr ()', cFromEnum `TableRowSelectMode'} -> `()' #}
instance (impl ~ (TableRowSelectMode -> IO ())) => Op (SetType ()) TableRow orig impl where
  runOp _ _ tableRow selectionMode = withRef tableRow $ \tableRowPtr' -> tableRowSetType' tableRowPtr' selectionMode
{# fun Fl_Table_Row_type as tableRowType { id `Ptr ()' } -> `TableRowSelectMode' cToEnum  #}
instance (impl ~ (IO TableRowSelectMode)) => Op (GetType_ ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr' -> tableRowType tableRowPtr'
{# fun Fl_Table_Row_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetRows ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_Row_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetCols ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun Fl_Table_Row_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (ClearSuper ()) TableRow orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun Fl_Table_Row_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) TableRow orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_Row_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetRowsSuper ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_Row_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetColsSuper ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setColsSuper' tablePtr val
{# fun Fl_Table_Row_handle_super as handleSuper' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO (Int))) => Op (HandleSuper ()) TableRow orig impl where
   runOp _ _ table event = withRef table $ \tablePtr -> handleSuper' tablePtr event
{# fun Fl_Table_Row_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO (Int))) => Op (Handle ()) TableRow orig impl where
  runOp _ _ table event = withRef table $ \tablePtr -> handle' tablePtr event
{# fun Fl_Table_Row_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (ResizeSuper ()) TableRow orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_Row_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) TableRow orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_Row_row_selected as rowSelected' { id `Ptr ()', `Int'} -> `CInt' id #}
instance (impl ~ ( Int -> IO (Either OutOfRange Bool))) => Op (GetRowSelected ()) TableRow orig impl where
  runOp _ _ table idx' = withRef table $ \tablePtr -> do
    ret' <- rowSelected' tablePtr idx'
    if ret' == -1 then (return $ Left OutOfRange) else (return $ Right $ cToBool ret')
{# fun Fl_Table_Row_select_all_rows_with_flag as selectAllRows' {id `Ptr ()', `Int'} -> `()' #}
instance (impl ~ ( TableRowSelectFlag -> IO ())) => Op (SelectAllRows ()) TableRow orig impl where
  runOp _ _ table flag' = withRef table $
                          \tablePtr ->
                             case flag' of
                              TableRowSelect -> selectAllRows' tablePtr 1
                              TableRowDeselect -> selectAllRows' tablePtr 0
                              TableRowToggle -> selectAllRows' tablePtr 2

-- $functions
-- @
-- clear :: 'Ref' 'TableRow' -> 'IO' ()
--
-- clearSuper :: 'Ref' 'TableRow' -> 'IO' ()
--
-- destroy :: 'Ref' 'TableRow' -> 'IO' ()
--
-- getRowSelected :: 'Ref' 'TableRow' -> 'Int' -> 'IO' ('Either' 'OutOfRange' 'Bool')
--
-- getRows :: 'Ref' 'TableRow' -> 'IO' ('Int')
--
-- getType_ :: 'Ref' 'TableRow' -> 'IO' 'TableRowSelectMode'
--
-- handle :: 'Ref' 'TableRow' -> 'Event' -> 'IO' ('Int')
--
-- handleSuper :: 'Ref' 'TableRow' -> 'Event' -> 'IO' ('Int')
--
-- resize :: 'Ref' 'TableRow' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'TableRow' -> 'Rectangle' -> 'IO' ()
--
-- selectAllRows :: 'Ref' 'TableRow' -> 'TableRowSelectFlag' -> 'IO' ()
--
-- setCols :: 'Ref' 'TableRow' -> 'Int' -> 'IO' ()
--
-- setColsSuper :: 'Ref' 'TableRow' -> 'Int' -> 'IO' ()
--
-- setRows :: 'Ref' 'TableRow' -> 'Int' -> 'IO' ()
--
-- setRowsSuper :: 'Ref' 'TableRow' -> 'Int' -> 'IO' ()
--
-- setType :: 'Ref' 'TableRow' -> 'TableRowSelectMode' -> 'IO' ()
--
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Table"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TableRow"
-- @
