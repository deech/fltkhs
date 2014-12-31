{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Table_Row
    (
     tableRowNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Table_RowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Table
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

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
instance Op (Destroy ()) TableRow ( IO ()) where
  runOp _ tableRow = withRef tableRow $ \tableRowPtr -> tableRowDestroy' tableRowPtr
{# fun unsafe Fl_Table_Row_rows as rows' { id `Ptr ()' } -> `Int' #}
instance Op (GetRows ()) TableRow (  IO (Int)) where
  runOp _ tableRow = withRef tableRow $ \tableRowPtr -> rows' tableRowPtr
{# fun Fl_Table_Row_set_type as tableRowSetType' { id `Ptr ()', cFromEnum `TableRowSelectMode'} -> `()' #}
instance Op (SetType ()) TableRow ( TableRowSelectMode -> IO ()) where
  runOp _ tableRow selectionMode = withRef tableRow $ \tableRowPtr' -> tableRowSetType' tableRowPtr' selectionMode
{# fun Fl_Table_Row_type as tableRowType { id `Ptr ()' } -> `TableRowSelectMode' cToEnum  #}
instance Op (GetType ()) TableRow ( IO TableRowSelectMode) where
  runOp _ tableRow = withRef tableRow $ \tableRowPtr' -> tableRowType tableRowPtr'
{# fun Fl_Table_Row_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRows ()) TableRow ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_Row_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetCols ()) TableRow ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun unsafe Fl_Table_Row_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
instance Op (ClearSuper ()) TableRow (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun unsafe Fl_Table_Row_clear as clear' { id `Ptr ()' } -> `()' #}
instance Op (Clear ()) TableRow (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_Row_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowsSuper ()) TableRow ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_Row_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColsSuper ()) TableRow ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setColsSuper' tablePtr val
{# fun unsafe Fl_Table_Row_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (Handle ()) TableRow ( Int ->  IO (Int)) where
  runOp _ table event = withRef table $ \tablePtr -> handle' tablePtr event
{# fun unsafe Fl_Table_Row_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (ResizeSuper ()) TableRow ( Rectangle ->  IO ()) where
  runOp _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Table_Row_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (Resize ()) TableRow ( Rectangle ->  IO ()) where
  runOp _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
