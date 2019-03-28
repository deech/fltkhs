{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.TableRow
    (
     tableRowNew,
     TableRowSelectFlag(..)
    , drawTableRowBase
    , handleTableRowBase
    , resizeTableRowBase
    , hideTableRowBase
    , showWidgetTableRowBase
    , clearTableRowBase
    , setRowsTableRowBase
    , setColsTableRowBase
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

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Base.Table
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

data TableRowSelectFlag = TableRowSelect | TableRowDeselect | TableRowToggle

{# fun Fl_OverriddenTable_Row_New as tableRowNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenTable_Row_New_WithLabel as tableRowNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
tableRowNew :: Rectangle -> Maybe T.Text -> Maybe (Ref TableRow -> IO ()) -> (Ref TableRow -> TableContext -> TableCoordinate -> Rectangle -> IO ()) -> CustomWidgetFuncs TableRow -> CustomTableFuncs TableRow -> IO (Ref TableRow)
tableRowNew rectangle label' draw' drawCell' customWidgetFuncs' customTableFuncs' =
    do
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableCustomFunctionStruct draw' (Just drawCell') customWidgetFuncs' customTableFuncs'
      case label' of
        (Just l') -> copyTextToCString l' >>= \l'' -> tableRowNewWithLabel' x_pos y_pos width height l'' ptr >>= toRef
        Nothing -> do
          ref <- tableRowNew' x_pos y_pos width height ptr >>= toRef
          setFlag ref WidgetFlagCopiedLabel
          setFlag ref WidgetFlagCopiedTooltip
          return ref

{# fun Fl_Table_Row_Destroy as tableRowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TableRowBase orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> tableRowDestroy' tableRowPtr
{# fun Fl_Table_Row_rows as rows' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Rows))) => Op (GetRows ()) TableRowBase orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> rows' tableRowPtr >>= return . Rows
{# fun Fl_Table_Row_set_type as tableRowSetType' { id `Ptr ()', cFromEnum `TableRowSelectMode'} -> `()' #}
instance (impl ~ (TableRowSelectMode -> IO ())) => Op (SetType ()) TableRowBase orig impl where
  runOp _ _ tableRow selectionMode = withRef tableRow $ \tableRowPtr' -> tableRowSetType' tableRowPtr' selectionMode
{# fun Fl_Table_Row_type as tableRowType { id `Ptr ()' } -> `TableRowSelectMode' cToEnum  #}
instance (impl ~ (IO TableRowSelectMode)) => Op (GetType_ ()) TableRowBase orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr' -> tableRowType tableRowPtr'
{# fun Fl_Table_Row_row_selected as rowSelected' { id `Ptr ()', `Int'} -> `CInt' id #}
instance (impl ~ ( Row -> IO (Either OutOfRange Bool))) => Op (GetRowSelected ()) TableRowBase orig impl where
  runOp _ _ table (Row idx') = withRef table $ \tablePtr -> do
    ret' <- rowSelected' tablePtr idx'
    if ret' == -1 then (return $ Left OutOfRange) else (return $ Right $ cToBool ret')
{# fun Fl_Table_Row_select_all_rows_with_flag as selectAllRows' {id `Ptr ()', `Int'} -> `()' #}
instance (impl ~ ( TableRowSelectFlag -> IO ())) => Op (SelectAllRows ()) TableRowBase orig impl where
  runOp _ _ table flag' = withRef table $
                          \tablePtr ->
                             case flag' of
                              TableRowSelect -> selectAllRows' tablePtr 1
                              TableRowDeselect -> selectAllRows' tablePtr 0
                              TableRowToggle -> selectAllRows' tablePtr 2

{# fun Fl_Table_Row_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawTableRowBase ::  Ref TableRowBase -> IO ()
drawTableRowBase table = withRef table $ \tablePtr -> drawSuper' tablePtr
{# fun Fl_Table_Row_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleTableRowBase :: Ref TableRowBase -> Event ->  IO (Either UnknownEvent ())
handleTableRowBase table event = withRef table $ \tablePtr -> handleSuper' tablePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Table_Row_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeTableRowBase :: Ref TableRowBase -> Rectangle -> IO ()
resizeTableRowBase table rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos y_pos width height
{# fun Fl_Table_Row_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideTableRowBase ::  Ref TableRowBase -> IO ()
hideTableRowBase table = withRef table $ \tablePtr -> hideSuper' tablePtr
{# fun Fl_Table_Row_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetTableRowBase ::  Ref TableRowBase -> IO ()
showWidgetTableRowBase table = withRef table $ \tablePtr -> showSuper' tablePtr
{# fun Fl_Table_Row_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
clearTableRowBase :: Ref Table -> IO ()
clearTableRowBase table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun Fl_Table_Row_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
setRowsTableRowBase :: Ref Table -> Rows -> IO ()
setRowsTableRowBase table (Rows val) = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_Row_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
setColsTableRowBase :: Ref Table -> Columns ->  IO ()
setColsTableRowBase table (Columns val) = withRef table $ \tablePtr -> setColsSuper' tablePtr val

{# fun Fl_Table_Row_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Columns ->  IO ())) => Op (SetCols ()) TableRowBase orig impl where
  runOp _ _ table (Columns val) = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun Fl_Table_Row_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Rows ->  IO ())) => Op (SetRows ()) TableRowBase orig impl where
  runOp _ _ table (Rows val) = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_Row_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TableRowBase orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> draw'' tableRowPtr
{# fun Fl_Table_Row_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TableRowBase orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> hide' tableRowPtr
{# fun Fl_Table_Row_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TableRowBase orig impl where
  runOp _ _ tableRow = withRef tableRow $ \tableRowPtr -> show' tableRowPtr
{# fun Fl_Table_Row_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (Resize ()) TableRowBase orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_Row_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) TableRowBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_Row_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ (Event ->  IO(Either UnknownEvent ()))) => Op (Handle ()) TableRowBase orig impl where
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
-- @

-- $functions
-- @
-- clear :: 'Ref' 'TableRowBase' -> 'IO' ()
--
-- destroy :: 'Ref' 'TableRowBase' -> 'IO' ()
--
-- draw :: 'Ref' 'TableRowBase' -> 'IO' ()
--
-- getRowSelected :: 'Ref' 'TableRowBase' -> 'Row' -> 'IO' ('Either' 'OutOfRange' 'Bool')
--
-- getRows :: 'Ref' 'TableRowBase' -> 'IO' ('Rows')
--
-- getType_ :: 'Ref' 'TableRowBase' -> 'IO' 'TableRowSelectMode'
--
-- handle :: 'Ref' 'TableRowBase' -> 'Event' -> 'IO(Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TableRowBase' -> 'IO' ()
--
-- resize :: 'Ref' 'TableRowBase' -> 'Rectangle' -> 'IO' ()
--
-- selectAllRows :: 'Ref' 'TableRowBase' -> 'TableRowSelectFlag' -> 'IO' ()
--
-- setCols :: 'Ref' 'TableRowBase' -> 'Columns' -> 'IO' ()
--
-- setRows :: 'Ref' 'TableRowBase' -> 'Rows' -> 'IO' ()
--
-- setType :: 'Ref' 'TableRowBase' -> 'TableRowSelectMode' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TableRowBase' -> 'IO' ()
-- @
