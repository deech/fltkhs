{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Table
    (
     TableCoordinate(..),
     Row(..),
     Column(..),
     CustomTableFuncs(..),
     mkSetInt,
     mkDrawCell,
     toSetRowsPrim,
     toSetColumnsPrim,
     toDrawCellPrim,
     fillCustomTableFunctionStruct,
     defaultCustomTableFuncs,
     tableCustom,
     tableCustomFunctionStruct
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Table functions
     --
     -- $Tablefunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TableC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
data Row = Row Int
data Column = Column Int
data TableCoordinate = TableCoordinate Row Column
foreign import ccall "wrapper"
        mkDrawCell :: (Ptr () ->
                       CInt ->
                       CInt -> CInt ->
                       CInt -> CInt -> CInt -> CInt ->
                       IO ())
                       ->
                       IO (FunPtr (Ptr () ->
                                   CInt ->
                                   CInt -> CInt ->
                                   CInt -> CInt -> CInt -> CInt ->
                                   IO ()))

toSetRowsPrim :: (Ref a -> Rows -> IO ()) -> IO (FunPtr (Ptr () -> CInt -> IO ()))
toSetRowsPrim f =
    mkSetInt
    (
     \ptr num' -> do
       pp <- wrapNonNull ptr "Null pointer. toSetRowsPrim"
       f (wrapInRef pp) (Rows (fromIntegral num'))
    )

toSetColumnsPrim :: (Ref a -> Columns -> IO ()) -> IO (FunPtr (Ptr () -> CInt -> IO ()))
toSetColumnsPrim f =
    mkSetInt
    (
     \ptr num' -> do
       pp <- wrapNonNull ptr "Null pointer. toSetColumnsPrim"
       f (wrapInRef pp) (Columns (fromIntegral num'))
    )

toDrawCellPrim :: (Ref a -> TableContext -> TableCoordinate -> Rectangle -> IO ()) ->
                       IO (FunPtr (Ptr () ->
                                   CInt ->
                                   CInt -> CInt ->
                                   CInt -> CInt -> CInt -> CInt ->
                                   IO ()))
toDrawCellPrim f =
    mkDrawCell
     (
      \ptr context' row' col' x_pos y_pos width height ->
          let rectangle = toRectangle (fromIntegral x_pos,
                                       fromIntegral y_pos,
                                       fromIntegral width,
                                       fromIntegral height)
          in
          do
           pp <- wrapNonNull ptr "Null pointer. toDrawCellPrim"
           f (wrapInRef pp) (toEnum $ fromIntegral context') (TableCoordinate (Row (fromIntegral row')) (Column (fromIntegral col'))) rectangle
     )

data CustomTableFuncs a =
    CustomTableFuncs
    {
    clearCustom      :: Maybe (Ref a -> IO ())
    ,setRowsCustom    :: Maybe (Ref a -> Rows -> IO ())
    ,setColsCustom    :: Maybe (Ref a -> Columns -> IO ())
    }

fillCustomTableFunctionStruct :: forall a. (Parent a Table) =>
                                  Ptr () ->
                                  Maybe (Ref a -> TableContext -> TableCoordinate -> Rectangle -> IO ()) ->
                                  CustomTableFuncs a ->
                                  IO ()
fillCustomTableFunctionStruct structPtr _drawCell' (CustomTableFuncs _clear' _setRows' _setCols')  = do
   toDrawCellPrim `orNullFunPtr` _drawCell' >>= {#set fl_Table_Virtual_Funcs->draw_cell#} structPtr
   toCallbackPrim `orNullFunPtr` _clear' >>= {#set fl_Table_Virtual_Funcs->clear#} structPtr
   toSetRowsPrim `orNullFunPtr` _setRows' >>= {#set fl_Table_Virtual_Funcs->set_rows#} structPtr
   toSetColumnsPrim `orNullFunPtr` _setCols' >>= {#set fl_Table_Virtual_Funcs->set_cols#} structPtr

defaultCustomTableFuncs :: forall a. (Parent a Table) => CustomTableFuncs a
defaultCustomTableFuncs = CustomTableFuncs Nothing Nothing Nothing

{# fun Fl_Table_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}
tableCustomFunctionStruct :: (Parent a Widget,
                              Parent b Table) =>
                             Maybe (Ref a -> IO ()) ->
                             Maybe (Ref b -> TableContext -> TableCoordinate -> Rectangle -> IO ()) ->
                             CustomWidgetFuncs a ->
                             CustomTableFuncs b ->
                             IO (Ptr ())
tableCustomFunctionStruct draw'' drawCell' customWidgetFuncs' customTableFuncs' =
  do
   ptr <- virtualFuncs'
   fillCustomWidgetFunctionStruct ptr draw'' customWidgetFuncs'
   fillCustomTableFunctionStruct ptr drawCell' customTableFuncs'
   return ptr

{# fun Fl_Table_New as tableNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_Table_New_WithLabel as tableNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
tableCustom :: Rectangle                                                            -- ^ Bounds of this table
            -> Maybe T.Text                                                         -- ^ Optional label
            -> Maybe (Ref Table -> IO ())                                           -- ^ Optional custom table drawing function
            -> (Ref Table -> TableContext -> TableCoordinate -> Rectangle -> IO ()) -- ^ Custom table cell drawing function
            -> CustomWidgetFuncs Table                                              -- ^ Widget overrides
            -> CustomTableFuncs Table                                               -- ^ Table overrides
            -> IO (Ref Table)
tableCustom rectangle label' draw'' drawCell' customWidgetFuncs' customTableFuncs' =
    do
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableCustomFunctionStruct draw'' (Just drawCell') customWidgetFuncs' customTableFuncs'
      case label' of
        (Just l') -> tableNewWithLabel' x_pos y_pos width height l' ptr >>= toRef
        Nothing -> tableNew' x_pos y_pos width height ptr >>= toRef

{# fun Fl_Table_Destroy as tableDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> tableDestroy' tablePtr
{# fun Fl_Table_set_table_box as setTableBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ ( Boxtype ->  IO ())) => Op (SetTableBox ()) Table orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setTableBox' tablePtr val
{# fun Fl_Table_table_box as tableBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ (  IO (Boxtype))) => Op (GetTableBox ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> tableBox' tablePtr
{# fun Fl_Table_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Rows ->  IO ())) => Op (SetRows ()) Table orig impl where
  runOp _ _ table (Rows val) = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_rows as rows' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Rows))) => Op (GetRows ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rows' tablePtr >>= return . Rows
{# fun Fl_Table_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Columns ->  IO ())) => Op (SetCols ()) Table orig impl where
  runOp _ _ table (Columns val) = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun Fl_Table_cols as cols' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Columns))) => Op (GetCols ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> cols' tablePtr >>= return . Columns
{# fun Fl_Table_visible_cells as visibleCells' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*} -> `()' #}
instance (impl ~ (IO (TableCoordinate,TableCoordinate))) => Op (GetVisibleCells ()) Table orig impl where
  runOp _ _ table =
    withRef table $ \tablePtr ->
    visibleCells' tablePtr >>= \(r1', r2', c1', c2') ->
    return ((TableCoordinate (Row r1') (Column c1')), (TableCoordinate (Row r2') (Column c2')))
{# fun Fl_Table_is_interactive_resize as isInteractiveResize' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (IsInteractiveResize ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> isInteractiveResize' tablePtr
{# fun Fl_Table_row_resize as rowResize' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetRowResize ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowResize' tablePtr
{# fun Fl_Table_set_row_resize as setRowResize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetRowResize ()) Table orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setRowResize' tablePtr (cFromBool flag)
{# fun Fl_Table_col_resize as colResize' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetColResize ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colResize' tablePtr
{# fun Fl_Table_set_col_resize as setColResize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetColResize ()) Table orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setColResize' tablePtr (cFromBool flag)
{# fun Fl_Table_col_resize_min as colResizeMin' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetColResizeMin ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colResizeMin' tablePtr
{# fun Fl_Table_set_col_resize_min as setColResizeMin' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetColResizeMin ()) Table orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setColResizeMin' tablePtr val
{# fun Fl_Table_row_resize_min as rowResizeMin' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetRowResizeMin ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowResizeMin' tablePtr
{# fun Fl_Table_set_row_resize_min as setRowResizeMin' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetRowResizeMin ()) Table orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRowResizeMin' tablePtr val
{# fun Fl_Table_row_header as rowHeader' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO Bool)) => Op (GetRowHeader ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowHeader' tablePtr >>= return . cToBool
{# fun Fl_Table_set_row_header as setRowHeader' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetRowHeader ()) Table orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setRowHeader' tablePtr (cFromBool flag)
{# fun Fl_Table_col_header as colHeader' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetColHeader ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colHeader' tablePtr
{# fun Fl_Table_set_col_header as setColHeader' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetColHeader ()) Table orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setColHeader' tablePtr (cFromBool flag)
{# fun Fl_Table_set_col_header_height as setColHeaderHeight' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetColHeaderHeight ()) Table orig impl where
  runOp _ _ table height = withRef table $ \tablePtr -> setColHeaderHeight' tablePtr height
{# fun Fl_Table_col_header_height as colHeaderHeight' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetColHeaderHeight ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colHeaderHeight' tablePtr
{# fun Fl_Table_set_row_header_width as setRowHeaderWidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetRowHeaderWidth ()) Table orig impl where
  runOp _ _ table width = withRef table $ \tablePtr -> setRowHeaderWidth' tablePtr width
{# fun Fl_Table_row_header_width as rowHeaderWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetRowHeaderWidth ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowHeaderWidth' tablePtr
{# fun Fl_Table_set_row_header_color as setRowHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetRowHeaderColor ()) Table orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRowHeaderColor' tablePtr val
{# fun Fl_Table_row_header_color as rowHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (  IO (Color))) => Op (GetRowHeaderColor ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowHeaderColor' tablePtr
{# fun Fl_Table_set_col_header_color as setColHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetColHeaderColor ()) Table orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setColHeaderColor' tablePtr val
{# fun Fl_Table_col_header_color as colHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (  IO (Color))) => Op (GetColHeaderColor ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colHeaderColor' tablePtr
{# fun Fl_Table_set_row_height as setRowHeight' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ ( Row -> Int ->  IO ())) => Op (SetRowHeight ()) Table orig impl where
  runOp _ _ table (Row row) height = withRef table $ \tablePtr -> setRowHeight' tablePtr row height
{# fun Fl_Table_row_height as rowHeight' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ ( Row ->  IO (Int))) => Op (GetRowHeight ()) Table orig impl where
  runOp _ _ table (Row row) = withRef table $ \tablePtr -> rowHeight' tablePtr row
{# fun Fl_Table_set_col_width as setColWidth' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ ( Column -> Int ->  IO ())) => Op (SetColWidth ()) Table orig impl where
  runOp _ _ table (Column col) width = withRef table $ \tablePtr -> setColWidth' tablePtr col width
{# fun Fl_Table_col_width as colWidth' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ ( Column ->  IO (Int))) => Op (GetColWidth ()) Table orig impl where
  runOp _ _ table (Column col) = withRef table $ \tablePtr -> colWidth' tablePtr col
{# fun Fl_Table_set_row_height_all as setRowHeightAll' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetRowHeightAll ()) Table orig impl where
  runOp _ _ table height = withRef table $ \tablePtr -> setRowHeightAll' tablePtr height
{# fun Fl_Table_set_col_width_all as setColWidthAll' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetColWidthAll ()) Table orig impl where
  runOp _ _ table width = withRef table $ \tablePtr -> setColWidthAll' tablePtr width
{# fun Fl_Table_set_row_position as setRowPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Row ->  IO ())) => Op (SetRowPosition ()) Table orig impl where
  runOp _ _ table (Row row) = withRef table $ \tablePtr -> setRowPosition' tablePtr row
{# fun Fl_Table_set_col_position as setColPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Column ->  IO ())) => Op (SetColPosition ()) Table orig impl where
  runOp _ _ table (Column col) = withRef table $ \tablePtr -> setColPosition' tablePtr col
{# fun Fl_Table_row_position as rowPosition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Row))) => Op (GetRowPosition ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowPosition' tablePtr >>= return . Row
{# fun Fl_Table_col_position as colPosition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Column))) => Op (GetColPosition ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colPosition' tablePtr >>= return . Column
{# fun Fl_Table_set_top_row as setTopRow' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Row ->  IO ())) => Op (SetTopRow ()) Table orig impl where
  runOp _ _ table (Row row) = withRef table $ \tablePtr -> setTopRow' tablePtr row
{# fun Fl_Table_top_row as topRow' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Row))) => Op (GetTopRow ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> topRow' tablePtr >>= return . Row
{# fun Fl_Table_is_selected as isSelected' { id `Ptr ()',`Int',`Int' } -> `Bool' cToBool #}
instance (impl ~ (TableCoordinate ->  IO Bool)) => Op (IsSelected ()) Table orig impl where
  runOp _ _ table (TableCoordinate (Row r) (Column c)) = withRef table $ \tablePtr -> isSelected' tablePtr r c
{# fun Fl_Table_get_selection as getSelection' { id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
instance (impl ~ IO (TableCoordinate, TableCoordinate)) => Op (GetSelection ()) Table orig impl where
  runOp _ _ table =
    withRef table $ \tablePtr ->
        getSelection' tablePtr >>= \(top', left',bottom',right') ->
            return ((TableCoordinate (Row top') (Column left')), (TableCoordinate (Row bottom') (Column right')))
{# fun Fl_Table_set_selection as setSelection' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ ( TableCoordinate -> TableCoordinate ->IO ())) => Op (SetSelection ()) Table orig impl where
  runOp _ _ table (TableCoordinate (Row row_top) (Column col_left))
                  (TableCoordinate (Row row_bot) (Column col_right)) =
    withRef table $ \tablePtr -> setSelection' tablePtr row_top col_left row_bot col_right
{# fun Fl_Table_move_cursor as moveCursor' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance (impl ~ ( TableCoordinate ->  IO (Either NoChange ()))) => Op (MoveCursor ()) Table orig impl where
  runOp _ _ table (TableCoordinate (Row r) (Column c)) = withRef table $ \tablePtr -> moveCursor' tablePtr r c >>= return . successOrNoChange
{# fun Fl_Table_init_sizes as initSizes' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (InitSizes ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> initSizes' tablePtr
{# fun Fl_Table_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, impl ~ (Ref a  ->  IO ())) => Op (Add ()) Table orig impl where
  runOp _ _ table wgt = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> add' tablePtr wgtPtr
{# fun Fl_Table_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
instance (Parent a Widget, impl ~ (Ref a -> AtIndex ->  IO ())) => Op (Insert ()) Table orig impl where
  runOp _ _ table wgt (AtIndex n) = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> insert' tablePtr wgtPtr n
{# fun Fl_Table_insert_with_widget as insertWithWidget' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, Parent b Widget, impl ~ (Ref a -> Ref b ->  IO ())) => Op (InsertBefore ()) Table orig impl where
  runOp _ _ self w before = withRef self $ \selfPtr -> withRef w $ \wPtr -> withRef before $ \beforePtr -> insertWithWidget' selfPtr wPtr beforePtr
{# fun Fl_Table_begin as begin' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Begin ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> begin' tablePtr
{# fun Fl_Table_end as end' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (End ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> end' tablePtr
{# fun Fl_Table_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id #}
instance (impl ~ (  IO [Ref Widget])) => Op (GetArray ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> do
                     childArrayPtr <- array' tablePtr
                     numChildren <- children table
                     arrayToRefs childArrayPtr numChildren
{# fun Fl_Table_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ ( AtIndex ->  IO (Maybe (Ref Widget)))) => Op (GetChild ()) Table orig impl where
  runOp _ _ table (AtIndex n) = withRef table $ \tablePtr -> child' tablePtr n >>= toMaybeRef
{# fun Fl_Table_children as children' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (Children ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> children' tablePtr
{# fun Fl_Table_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Ref a ->  IO (Int))) => Op (Find ()) Table orig impl where
  runOp _ _ table wgt = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> find' tablePtr wgtPtr
{# fun Fl_Table_callback_row as callbackRow' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Row))) => Op (CallbackRow ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> callbackRow' tablePtr >>= return . Row
{# fun Fl_Table_callback_col as callbackCol' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Column))) => Op (CallbackCol ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> callbackCol' tablePtr >>= return . Column
{# fun Fl_Table_callback_context as callbackContext' { id `Ptr ()' } -> `TableContext' cToEnum #}
instance (impl ~ (  IO (TableContext))) => Op (CallbackContext ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> callbackContext' tablePtr
{# fun Fl_Table_do_callback as doCallback' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int' } -> `()' #}
instance (impl ~ ( TableContext -> TableCoordinate ->  IO ())) => Op (DoCallback ()) Table orig impl where
  runOp _ _ table tablecontext (TableCoordinate (Row row) (Column col)) = withRef table $ \tablePtr -> doCallback' tablePtr tablecontext row col
{# fun Fl_Table_find_cell as findCell' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `CInt' id #}
instance (impl ~ ( TableContext -> TableCoordinate -> IO (Maybe Rectangle))) => Op (FindCell ()) Table orig impl where
  runOp _ _ table context (TableCoordinate (Row r) (Column c))  =
    withRef table $ \tablePtr ->
        findCell' tablePtr context r c >>= \(result, x_pos', y_pos', width', height') -> do
          if (result /= -1)
            then return $ Just $ toRectangle (x_pos', y_pos', width', height')
            else return $ Nothing
{# fun Fl_Table_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (DrawSuper ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> drawSuper' tablePtr
{# fun Fl_Table_draw as draw' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> draw' tablePtr
{# fun Fl_Table_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ ( Event ->  IO( Either UnknownEvent ()))) => Op (Handle ()) Table orig impl where
  runOp _ _ table event = withRef table $ \tablePtr -> handle' tablePtr event >>= return  . successOrUnknownEvent
{# fun Fl_Table_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ ( Rectangle ->  IO ())) => Op (ResizeSuper ()) Table orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ ( Rectangle ->  IO ())) => Op (Resize ()) Table orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ClearSuper ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun Fl_Table_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Clear ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Rows ->  IO ())) => Op (SetRowsSuper ()) Table orig impl where
  runOp _ _ table (Rows val) = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Columns ->  IO ())) => Op (SetColsSuper ()) Table orig impl where
  runOp _ _ table (Columns val) = withRef table $ \tablePtr -> setColsSuper' tablePtr val
{# fun Fl_Table_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Table orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> showSuper' widgetPtr
{# fun Fl_Table_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) Table orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Table_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Table orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Table_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) Table orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr

{# fun Fl_Table_tab_cell_nav as tabCellNav' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetTabCellNav ()) Table orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> tabCellNav' tablePtr
{# fun Fl_Table_set_tab_cell_nav as setTabCellNav' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetTabCellNav ()) Table orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setTabCellNav' tablePtr val

-- $Tablefunctions
-- @
-- add:: ('Parent' a 'Widget') => 'Ref' 'Table' -> 'Ref' a -> 'IO' ()
--
-- begin :: 'Ref' 'Table' -> 'IO' ()
--
-- callbackCol :: 'Ref' 'Table' -> 'IO' ('Column')
--
-- callbackContext :: 'Ref' 'Table' -> 'IO' ('TableContext')
--
-- callbackRow :: 'Ref' 'Table' -> 'IO' ('Row')
--
-- children :: 'Ref' 'Table' -> 'IO' ('Int')
--
-- clear :: 'Ref' 'Table' -> 'IO' ()
--
-- clearSuper :: 'Ref' 'Table' -> 'IO' ()
--
-- destroy :: 'Ref' 'Table' -> 'IO' ()
--
-- doCallback :: 'Ref' 'Table' -> 'TableContext' -> 'TableCoordinate' -> 'IO' ()
--
-- draw :: 'Ref' 'Table' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Table' -> 'IO' ()
--
-- end :: 'Ref' 'Table' -> 'IO' ()
--
-- find:: ('Parent' a 'Widget') => 'Ref' 'Table' -> 'Ref' a -> 'IO' ('Int')
--
-- findCell :: 'Ref' 'Table' -> 'TableContext' -> 'TableCoordinate' -> 'IO' ('Maybe' 'Rectangle')
--
-- getArray :: 'Ref' 'Table' -> 'IO' ['Ref' 'Widget']
--
-- getChild :: 'Ref' 'Table' -> 'AtIndex' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- getColHeader :: 'Ref' 'Table' -> 'IO' ('Bool')
--
-- getColHeaderColor :: 'Ref' 'Table' -> 'IO' ('Color')
--
-- getColHeaderHeight :: 'Ref' 'Table' -> 'IO' ('Int')
--
-- getColPosition :: 'Ref' 'Table' -> 'IO' ('Column')
--
-- getColResize :: 'Ref' 'Table' -> 'IO' ('Bool')
--
-- getColResizeMin :: 'Ref' 'Table' -> 'IO' ('Int')
--
-- getColWidth :: 'Ref' 'Table' -> 'Column' -> 'IO' ('Int')
--
-- getCols :: 'Ref' 'Table' -> 'IO' ('Columns')
--
-- getRowHeader :: 'Ref' 'Table' -> 'IO' 'Bool'
--
-- getRowHeaderColor :: 'Ref' 'Table' -> 'IO' ('Color')
--
-- getRowHeaderWidth :: 'Ref' 'Table' -> 'IO' ('Int')
--
-- getRowHeight :: 'Ref' 'Table' -> 'Row' -> 'IO' ('Int')
--
-- getRowPosition :: 'Ref' 'Table' -> 'IO' ('Row')
--
-- getRowResize :: 'Ref' 'Table' -> 'IO' ('Bool')
--
-- getRowResizeMin :: 'Ref' 'Table' -> 'IO' ('Int')
--
-- getRows :: 'Ref' 'Table' -> 'IO' ('Rows')
--
-- getSelection :: 'Ref' 'Table' -> 'IO' ('TableCoordinate', 'TableCoordinate')
--
-- getTabCellNav :: 'Ref' 'Table' -> 'IO' ('Bool')
--
-- getTableBox :: 'Ref' 'Table' -> 'IO' ('Boxtype')
--
-- getTopRow :: 'Ref' 'Table' -> 'IO' ('Row')
--
-- getVisibleCells :: 'Ref' 'Table' -> 'IO' ('TableCoordinate,TableCoordinate')
--
-- handle :: 'Ref' 'Table' -> 'Event' -> 'IO'( 'Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Table' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Table' -> 'IO' ()
--
-- initSizes :: 'Ref' 'Table' -> 'IO' ()
--
-- insert:: ('Parent' a 'Widget') => 'Ref' 'Table' -> 'Ref' a -> 'AtIndex' -> 'IO' ()
--
-- insertBefore:: ('Parent' a 'Widget', 'Parent' b 'Widget') => 'Ref' 'Table' -> 'Ref' a -> 'Ref' b -> 'IO' ()
--
-- isInteractiveResize :: 'Ref' 'Table' -> 'IO' ('Bool')
--
-- isSelected :: 'Ref' 'Table' -> 'TableCoordinate' -> 'IO' 'Bool'
--
-- moveCursor :: 'Ref' 'Table' -> 'TableCoordinate' -> 'IO' ('Either' 'NoChange' ())
--
-- resize :: 'Ref' 'Table' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Table' -> 'Rectangle' -> 'IO' ()
--
-- setColHeader :: 'Ref' 'Table' -> 'Bool' -> 'IO' ()
--
-- setColHeaderColor :: 'Ref' 'Table' -> 'Color' -> 'IO' ()
--
-- setColHeaderHeight :: 'Ref' 'Table' -> 'Int' -> 'IO' ()
--
-- setColPosition :: 'Ref' 'Table' -> 'Column' -> 'IO' ()
--
-- setColResize :: 'Ref' 'Table' -> 'Bool' -> 'IO' ()
--
-- setColResizeMin :: 'Ref' 'Table' -> 'Int' -> 'IO' ()
--
-- setColWidth :: 'Ref' 'Table' -> 'Column' -> 'Int' -> 'IO' ()
--
-- setColWidthAll :: 'Ref' 'Table' -> 'Int' -> 'IO' ()
--
-- setCols :: 'Ref' 'Table' -> 'Columns' -> 'IO' ()
--
-- setColsSuper :: 'Ref' 'Table' -> 'Columns' -> 'IO' ()
--
-- setRowHeader :: 'Ref' 'Table' -> 'Bool' -> 'IO' ()
--
-- setRowHeaderColor :: 'Ref' 'Table' -> 'Color' -> 'IO' ()
--
-- setRowHeaderWidth :: 'Ref' 'Table' -> 'Int' -> 'IO' ()
--
-- setRowHeight :: 'Ref' 'Table' -> 'Row' -> 'Int' -> 'IO' ()
--
-- setRowHeightAll :: 'Ref' 'Table' -> 'Int' -> 'IO' ()
--
-- setRowPosition :: 'Ref' 'Table' -> 'Row' -> 'IO' ()
--
-- setRowResize :: 'Ref' 'Table' -> 'Bool' -> 'IO' ()
--
-- setRowResizeMin :: 'Ref' 'Table' -> 'Int' -> 'IO' ()
--
-- setRows :: 'Ref' 'Table' -> 'Rows' -> 'IO' ()
--
-- setRowsSuper :: 'Ref' 'Table' -> 'Rows' -> 'IO' ()
--
-- setSelection :: 'Ref' 'Table' -> 'TableCoordinate' -> 'TableCoordinate' ->'IO' ()
--
-- setTabCellNav :: 'Ref' 'Table' -> 'Bool' -> 'IO' ()
--
-- setTableBox :: 'Ref' 'Table' -> 'Boxtype' -> 'IO' ()
--
-- setTopRow :: 'Ref' 'Table' -> 'Row' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Table' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Table' -> 'IO' ()
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
-- @
