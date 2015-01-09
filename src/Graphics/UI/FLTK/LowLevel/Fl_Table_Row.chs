{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Table_Row
    (
     tableRowNew,
     TableRowSelectFlag
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Table_RowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Table
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

data TableRowSelectFlag = TableRowSelect | TableRowDeselect | TableRowToggle

{# fun unsafe Fl_OverriddenTable_Row_New as tableRowNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun unsafe Fl_OverriddenTable_Row_New_WithLabel as tableRowNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
tableRowNew :: Rectangle -> Maybe String -> CustomWidgetFuncs TableRow -> CustomTableFuncs TableRow -> IO (Ref TableRow)
tableRowNew rectangle label' customWidgetFuncs' customTableFuncs' =
    do
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableCustomFunctionStruct customWidgetFuncs' customTableFuncs'
      case label' of
        (Just l') -> tableRowNewWithLabel' x_pos y_pos width height l' ptr >>= toRef
        Nothing -> tableRowNew' x_pos y_pos width height ptr >>= toRef

{# fun unsafe Fl_Table_Row_Destroy as tableRowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> tableRowDestroy' tableRowPtr
{# fun unsafe Fl_Table_Row_rows as rows' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetRows ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> rows' tableRowPtr
{# fun Fl_Table_Row_set_type as tableRowSetType' { id `Ptr ()', cFromEnum `TableRowSelectMode'} -> `()' #}
instance (impl ~ (TableRowSelectMode -> IO ())) => Op (SetType ()) TableRow orig impl where
  runOp _ _ tableRow selectionMode = withRef tableRow $ \tableRowPtr' -> tableRowSetType' tableRowPtr' selectionMode
{# fun Fl_Table_Row_type as tableRowType { id `Ptr ()' } -> `TableRowSelectMode' cToEnum  #}
instance (impl ~ (IO TableRowSelectMode)) => Op (GetType ()) TableRow orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr' -> tableRowType tableRowPtr'
{# fun Fl_Table_Row_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetRows ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_Row_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetCols ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun unsafe Fl_Table_Row_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (ClearSuper ()) TableRow orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun unsafe Fl_Table_Row_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) TableRow orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_Row_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetRowsSuper ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_Row_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetColsSuper ()) TableRow orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setColsSuper' tablePtr val
{# fun unsafe Fl_Table_Row_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO (Int))) => Op (Handle ()) TableRow orig impl where
  runOp _ _ table event = withRef table $ \tablePtr -> handle' tablePtr event
{# fun unsafe Fl_Table_Row_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (ResizeSuper ()) TableRow orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Table_Row_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) TableRow orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_Row_row_selected as rowSelected' { id `Ptr ()', `Int'} -> `Bool' cToBool #}
instance (impl ~ ( Int -> IO (Bool))) => Op (GetRowSelected ()) TableRow orig impl where
  runOp _ _ table idx' = withRef table $ \tablePtr -> rowSelected' tablePtr idx'
{# fun Fl_Table_Row_select_all_rows_with_flag as selectAllRows' {id `Ptr ()', `Int'} -> `()' #}
instance (impl ~ ( TableRowSelectFlag -> IO ())) => Op (SelectAllRows ()) TableRow orig impl where
  runOp _ _ table flag' = withRef table $
                          \tablePtr ->
                             case flag' of
                              TableRowSelect -> selectAllRows' tablePtr 1
                              TableRowDeselect -> selectAllRows' tablePtr 0
                              TableRowToggle -> selectAllRows' tablePtr 2
