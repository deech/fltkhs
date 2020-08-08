{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Table
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
    , drawTableBase
    , handleTableBase
    , resizeTableBase
    , hideTableBase
    , showWidgetTableBase
    , clearTableBase
    , setRowsTableBase
    , setColsTableBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Table functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TableC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Base.Widget
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

fillCustomTableFunctionStruct :: forall a. (Parent a TableBase) =>
                                  Ptr () ->
                                  Maybe (Ref a -> TableContext -> TableCoordinate -> Rectangle -> IO ()) ->
                                  CustomTableFuncs a ->
                                  IO ()
fillCustomTableFunctionStruct structPtr _drawCell' (CustomTableFuncs _clear' _setRows' _setCols')  = do
   toDrawCellPrim `orNullFunPtr` _drawCell' >>= {#set fl_Table_Virtual_Funcs->draw_cell#} structPtr
   toCallbackPrim `orNullFunPtr` _clear' >>= {#set fl_Table_Virtual_Funcs->clear#} structPtr
   toSetRowsPrim `orNullFunPtr` _setRows' >>= {#set fl_Table_Virtual_Funcs->set_rows#} structPtr
   toSetColumnsPrim `orNullFunPtr` _setCols' >>= {#set fl_Table_Virtual_Funcs->set_cols#} structPtr

defaultCustomTableFuncs :: forall a. (Parent a TableBase) => CustomTableFuncs a
defaultCustomTableFuncs = CustomTableFuncs Nothing Nothing Nothing

{# fun Fl_Table_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}
tableCustomFunctionStruct :: (Parent a WidgetBase,
                              Parent b TableBase) =>
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
{# fun Fl_Table_New_WithLabel as tableNewWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
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
        (Just l') -> copyTextToCString l' >>= \l'' -> tableNewWithLabel' x_pos y_pos width height l'' ptr >>= toRef
        Nothing -> tableNew' x_pos y_pos width height ptr >>= toRef

{# fun Fl_Table_Destroy as tableDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> tableDestroy' tablePtr
{# fun Fl_Table_set_table_box as setTableBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ ( Boxtype ->  IO ())) => Op (SetTableBox ()) TableBase orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setTableBox' tablePtr val
{# fun Fl_Table_table_box as tableBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ (  IO (Boxtype))) => Op (GetTableBox ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> tableBox' tablePtr
{# fun Fl_Table_rows as rows' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Rows))) => Op (GetRows ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rows' tablePtr >>= return . Rows
{# fun Fl_Table_cols as cols' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Columns))) => Op (GetCols ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> cols' tablePtr >>= return . Columns
{# fun Fl_Table_visible_cells as visibleCells' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*} -> `()' #}
instance (impl ~ (IO (TableCoordinate,TableCoordinate))) => Op (GetVisibleCells ()) TableBase orig impl where
  runOp _ _ table =
    withRef table $ \tablePtr ->
    visibleCells' tablePtr >>= \(r1', r2', c1', c2') ->
    return ((TableCoordinate (Row r1') (Column c1')), (TableCoordinate (Row r2') (Column c2')))
{# fun Fl_Table_is_interactive_resize as isInteractiveResize' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (IsInteractiveResize ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> isInteractiveResize' tablePtr
{# fun Fl_Table_row_resize as rowResize' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetRowResize ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowResize' tablePtr
{# fun Fl_Table_set_row_resize as setRowResize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetRowResize ()) TableBase orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setRowResize' tablePtr (cFromBool flag)
{# fun Fl_Table_col_resize as colResize' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetColResize ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colResize' tablePtr
{# fun Fl_Table_set_col_resize as setColResize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetColResize ()) TableBase orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setColResize' tablePtr (cFromBool flag)
{# fun Fl_Table_col_resize_min as colResizeMin' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetColResizeMin ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colResizeMin' tablePtr
{# fun Fl_Table_set_col_resize_min as setColResizeMin' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetColResizeMin ()) TableBase orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setColResizeMin' tablePtr val
{# fun Fl_Table_row_resize_min as rowResizeMin' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetRowResizeMin ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowResizeMin' tablePtr
{# fun Fl_Table_set_row_resize_min as setRowResizeMin' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetRowResizeMin ()) TableBase orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRowResizeMin' tablePtr val
{# fun Fl_Table_row_header as rowHeader' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO Bool)) => Op (GetRowHeader ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowHeader' tablePtr >>= return . cToBool
{# fun Fl_Table_set_row_header as setRowHeader' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetRowHeader ()) TableBase orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setRowHeader' tablePtr (cFromBool flag)
{# fun Fl_Table_col_header as colHeader' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetColHeader ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colHeader' tablePtr
{# fun Fl_Table_set_col_header as setColHeader' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetColHeader ()) TableBase orig impl where
  runOp _ _ table flag = withRef table $ \tablePtr -> setColHeader' tablePtr (cFromBool flag)
{# fun Fl_Table_set_col_header_height as setColHeaderHeight' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetColHeaderHeight ()) TableBase orig impl where
  runOp _ _ table height = withRef table $ \tablePtr -> setColHeaderHeight' tablePtr height
{# fun Fl_Table_col_header_height as colHeaderHeight' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetColHeaderHeight ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colHeaderHeight' tablePtr
{# fun Fl_Table_set_row_header_width as setRowHeaderWidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetRowHeaderWidth ()) TableBase orig impl where
  runOp _ _ table width = withRef table $ \tablePtr -> setRowHeaderWidth' tablePtr width
{# fun Fl_Table_row_header_width as rowHeaderWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (GetRowHeaderWidth ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowHeaderWidth' tablePtr
{# fun Fl_Table_set_row_header_color as setRowHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetRowHeaderColor ()) TableBase orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setRowHeaderColor' tablePtr val
{# fun Fl_Table_row_header_color as rowHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (  IO (Color))) => Op (GetRowHeaderColor ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowHeaderColor' tablePtr
{# fun Fl_Table_set_col_header_color as setColHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ ( Color ->  IO ())) => Op (SetColHeaderColor ()) TableBase orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setColHeaderColor' tablePtr val
{# fun Fl_Table_col_header_color as colHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (  IO (Color))) => Op (GetColHeaderColor ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colHeaderColor' tablePtr
{# fun Fl_Table_set_row_height as setRowHeight' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ ( Row -> Int ->  IO ())) => Op (SetRowHeight ()) TableBase orig impl where
  runOp _ _ table (Row row) height = withRef table $ \tablePtr -> setRowHeight' tablePtr row height
{# fun Fl_Table_row_height as rowHeight' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ ( Row ->  IO (Int))) => Op (GetRowHeight ()) TableBase orig impl where
  runOp _ _ table (Row row) = withRef table $ \tablePtr -> rowHeight' tablePtr row
{# fun Fl_Table_set_col_width as setColWidth' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ ( Column -> Int ->  IO ())) => Op (SetColWidth ()) TableBase orig impl where
  runOp _ _ table (Column col) width = withRef table $ \tablePtr -> setColWidth' tablePtr col width
{# fun Fl_Table_col_width as colWidth' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ ( Column ->  IO (Int))) => Op (GetColWidth ()) TableBase orig impl where
  runOp _ _ table (Column col) = withRef table $ \tablePtr -> colWidth' tablePtr col
{# fun Fl_Table_set_row_height_all as setRowHeightAll' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetRowHeightAll ()) TableBase orig impl where
  runOp _ _ table height = withRef table $ \tablePtr -> setRowHeightAll' tablePtr height
{# fun Fl_Table_set_col_width_all as setColWidthAll' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Int ->  IO ())) => Op (SetColWidthAll ()) TableBase orig impl where
  runOp _ _ table width = withRef table $ \tablePtr -> setColWidthAll' tablePtr width
{# fun Fl_Table_set_row_position as setRowPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Row ->  IO ())) => Op (SetRowPosition ()) TableBase orig impl where
  runOp _ _ table (Row row) = withRef table $ \tablePtr -> setRowPosition' tablePtr row
{# fun Fl_Table_set_col_position as setColPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Column ->  IO ())) => Op (SetColPosition ()) TableBase orig impl where
  runOp _ _ table (Column col) = withRef table $ \tablePtr -> setColPosition' tablePtr col
{# fun Fl_Table_row_position as rowPosition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Row))) => Op (GetRowPosition ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> rowPosition' tablePtr >>= return . Row
{# fun Fl_Table_col_position as colPosition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Column))) => Op (GetColPosition ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> colPosition' tablePtr >>= return . Column
{# fun Fl_Table_set_top_row as setTopRow' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Row ->  IO ())) => Op (SetTopRow ()) TableBase orig impl where
  runOp _ _ table (Row row) = withRef table $ \tablePtr -> setTopRow' tablePtr row
{# fun Fl_Table_top_row as topRow' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Row))) => Op (GetTopRow ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> topRow' tablePtr >>= return . Row
{# fun Fl_Table_is_selected as isSelected' { id `Ptr ()',`Int',`Int' } -> `Bool' cToBool #}
instance (impl ~ (TableCoordinate ->  IO Bool)) => Op (IsSelected ()) TableBase orig impl where
  runOp _ _ table (TableCoordinate (Row r) (Column c)) = withRef table $ \tablePtr -> isSelected' tablePtr r c
{# fun Fl_Table_get_selection as getSelection' { id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
instance (impl ~ IO (TableCoordinate, TableCoordinate)) => Op (GetSelection ()) TableBase orig impl where
  runOp _ _ table =
    withRef table $ \tablePtr ->
        getSelection' tablePtr >>= \(top', left',bottom',right') ->
            return ((TableCoordinate (Row top') (Column left')), (TableCoordinate (Row bottom') (Column right')))
{# fun Fl_Table_set_selection as setSelection' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ ( TableCoordinate -> TableCoordinate ->IO ())) => Op (SetSelection ()) TableBase orig impl where
  runOp _ _ table (TableCoordinate (Row row_top) (Column col_left))
                  (TableCoordinate (Row row_bot) (Column col_right)) =
    withRef table $ \tablePtr -> setSelection' tablePtr row_top col_left row_bot col_right
{# fun Fl_Table_move_cursor as moveCursor' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance (impl ~ ( TableCoordinate ->  IO (Either NoChange ()))) => Op (MoveCursor ()) TableBase orig impl where
  runOp _ _ table (TableCoordinate (Row r) (Column c)) = withRef table $ \tablePtr -> moveCursor' tablePtr r c >>= return . successOrNoChange
{# fun Fl_Table_init_sizes as initSizes' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (InitSizes ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> initSizes' tablePtr
{# fun Fl_Table_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a WidgetBase, impl ~ (Ref a  ->  IO ())) => Op (Add ()) TableBase orig impl where
  runOp _ _ table wgt = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> add' tablePtr wgtPtr
{# fun Fl_Table_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
instance (Parent a WidgetBase, impl ~ (Ref a -> AtIndex ->  IO ())) => Op (Insert ()) TableBase orig impl where
  runOp _ _ table wgt (AtIndex n) = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> insert' tablePtr wgtPtr n
{# fun Fl_Table_insert_with_widget as insertWithWidget' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a WidgetBase, Parent b Widget, impl ~ (Ref a -> Ref b ->  IO ())) => Op (InsertBefore ()) TableBase orig impl where
  runOp _ _ self w before = withRef self $ \selfPtr -> withRef w $ \wPtr -> withRef before $ \beforePtr -> insertWithWidget' selfPtr wPtr beforePtr
{# fun Fl_Table_begin as begin' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Begin ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> begin' tablePtr
{# fun Fl_Table_end as end' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (End ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> end' tablePtr
{# fun Fl_Table_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id #}
instance (impl ~ (  IO [Ref Widget])) => Op (GetArray ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> do
                     childArrayPtr <- array' tablePtr
                     numChildren <- children table
                     arrayToRefs childArrayPtr numChildren
{# fun Fl_Table_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ ( AtIndex ->  IO (Maybe (Ref Widget)))) => Op (GetChild ()) TableBase orig impl where
  runOp _ _ table (AtIndex n) = withRef table $ \tablePtr -> child' tablePtr n >>= toMaybeRef
{# fun Fl_Table_children as children' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Int))) => Op (Children ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> children' tablePtr
{# fun Fl_Table_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a WidgetBase, impl ~ (Ref a ->  IO (Int))) => Op (Find ()) TableBase orig impl where
  runOp _ _ table wgt = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> find' tablePtr wgtPtr
{# fun Fl_Table_callback_row as callbackRow' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Row))) => Op (CallbackRow ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> callbackRow' tablePtr >>= return . Row
{# fun Fl_Table_callback_col as callbackCol' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (  IO (Column))) => Op (CallbackCol ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> callbackCol' tablePtr >>= return . Column
{# fun Fl_Table_callback_context as callbackContext' { id `Ptr ()' } -> `TableContext' cToEnum #}
instance (impl ~ (  IO (TableContext))) => Op (CallbackContext ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> callbackContext' tablePtr
{# fun Fl_Table_do_callback as doCallback' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int' } -> `()' #}
instance (impl ~ ( TableContext -> TableCoordinate ->  IO ())) => Op (DoCallback ()) TableBase orig impl where
  runOp _ _ table tablecontext (TableCoordinate (Row row) (Column col)) = withRef table $ \tablePtr -> doCallback' tablePtr tablecontext row col
{# fun Fl_Table_find_cell as findCell' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `CInt' id #}
instance (impl ~ ( TableContext -> TableCoordinate -> IO (Maybe Rectangle))) => Op (FindCell ()) TableBase orig impl where
  runOp _ _ table context (TableCoordinate (Row r) (Column c))  =
    withRef table $ \tablePtr ->
        findCell' tablePtr context r c >>= \(result, x_pos', y_pos', width', height') -> do
          if (result /= -1)
            then return $ Just $ toRectangle (x_pos', y_pos', width', height')
            else return $ Nothing
{# fun Fl_Table_tab_cell_nav as tabCellNav' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (  IO (Bool))) => Op (GetTabCellNav ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> tabCellNav' tablePtr
{# fun Fl_Table_set_tab_cell_nav as setTabCellNav' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ ( Bool ->  IO ())) => Op (SetTabCellNav ()) TableBase orig impl where
  runOp _ _ table val = withRef table $ \tablePtr -> setTabCellNav' tablePtr val

{# fun Fl_Table_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawTableBase ::  Ref TableBase -> IO ()
drawTableBase table = withRef table $ \tablePtr -> drawSuper' tablePtr
{# fun Fl_Table_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleTableBase :: Ref TableBase -> Event ->  IO (Either UnknownEvent ())
handleTableBase table event = withRef table $ \tablePtr -> handleSuper' tablePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Table_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeTableBase :: Ref TableBase -> Rectangle -> IO ()
resizeTableBase table rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos y_pos width height
{# fun Fl_Table_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideTableBase ::  Ref TableBase -> IO ()
hideTableBase table = withRef table $ \tablePtr -> hideSuper' tablePtr
{# fun Fl_Table_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetTableBase ::  Ref TableBase -> IO ()
showWidgetTableBase table = withRef table $ \tablePtr -> showSuper' tablePtr
{# fun Fl_Table_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
clearTableBase :: Ref Table -> IO ()
clearTableBase table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun Fl_Table_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
setRowsTableBase :: Ref Table -> Rows -> IO ()
setRowsTableBase table (Rows val) = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
setColsTableBase :: Ref Table -> Columns ->  IO ()
setColsTableBase table (Columns val) = withRef table $ \tablePtr -> setColsSuper' tablePtr val

{# fun Fl_Table_draw as draw' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> draw' tablePtr
{# fun Fl_Table_handle as handle' { id `Ptr ()', cFromEnum `Event' } -> `Int' #}
instance (impl ~ ( Event ->  IO( Either UnknownEvent ()))) => Op (Handle ()) TableBase orig impl where
  runOp _ _ table event = withRef table $ \tablePtr -> handle' tablePtr event >>= return  . successOrUnknownEvent
{# fun Fl_Table_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ ( Rectangle ->  IO ())) => Op (Resize ()) TableBase orig impl where
  runOp _ _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun Fl_Table_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Clear ()) TableBase orig impl where
  runOp _ _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) TableBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Table_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Hide ()) TableBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr
{# fun Fl_Table_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Rows ->  IO ())) => Op (SetRows ()) TableBase orig impl where
  runOp _ _ table (Rows val) = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun Fl_Table_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ( Columns ->  IO ())) => Op (SetCols ()) TableBase orig impl where
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
-- @

-- $functions
-- @
-- add:: ('Parent' a 'WidgetBase') => 'Ref' 'TableBase' -> 'Ref' a -> 'IO' ()
--
-- begin :: 'Ref' 'TableBase' -> 'IO' ()
--
-- callbackCol :: 'Ref' 'TableBase' -> 'IO' ('Column')
--
-- callbackContext :: 'Ref' 'TableBase' -> 'IO' ('TableContext')
--
-- callbackRow :: 'Ref' 'TableBase' -> 'IO' ('Row')
--
-- children :: 'Ref' 'TableBase' -> 'IO' ('Int')
--
-- clear :: 'Ref' 'TableBase' -> 'IO' ()
--
-- destroy :: 'Ref' 'TableBase' -> 'IO' ()
--
-- doCallback :: 'Ref' 'TableBase' -> 'TableContext' -> 'TableCoordinate' -> 'IO' ()
--
-- draw :: 'Ref' 'TableBase' -> 'IO' ()
--
-- end :: 'Ref' 'TableBase' -> 'IO' ()
--
-- find:: ('Parent' a 'WidgetBase') => 'Ref' 'TableBase' -> 'Ref' a -> 'IO' ('Int')
--
-- findCell :: 'Ref' 'TableBase' -> 'TableContext' -> 'TableCoordinate' -> 'IO' ('Maybe' 'Rectangle')
--
-- getArray :: 'Ref' 'TableBase' -> 'IO' ['Ref' 'Widget']
--
-- getChild :: 'Ref' 'TableBase' -> 'AtIndex' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- getColHeader :: 'Ref' 'TableBase' -> 'IO' ('Bool')
--
-- getColHeaderColor :: 'Ref' 'TableBase' -> 'IO' ('Color')
--
-- getColHeaderHeight :: 'Ref' 'TableBase' -> 'IO' ('Int')
--
-- getColPosition :: 'Ref' 'TableBase' -> 'IO' ('Column')
--
-- getColResize :: 'Ref' 'TableBase' -> 'IO' ('Bool')
--
-- getColResizeMin :: 'Ref' 'TableBase' -> 'IO' ('Int')
--
-- getColWidth :: 'Ref' 'TableBase' -> 'Column' -> 'IO' ('Int')
--
-- getCols :: 'Ref' 'TableBase' -> 'IO' ('Columns')
--
-- getRowHeader :: 'Ref' 'TableBase' -> 'IO' 'Bool'
--
-- getRowHeaderColor :: 'Ref' 'TableBase' -> 'IO' ('Color')
--
-- getRowHeaderWidth :: 'Ref' 'TableBase' -> 'IO' ('Int')
--
-- getRowHeight :: 'Ref' 'TableBase' -> 'Row' -> 'IO' ('Int')
--
-- getRowPosition :: 'Ref' 'TableBase' -> 'IO' ('Row')
--
-- getRowResize :: 'Ref' 'TableBase' -> 'IO' ('Bool')
--
-- getRowResizeMin :: 'Ref' 'TableBase' -> 'IO' ('Int')
--
-- getRows :: 'Ref' 'TableBase' -> 'IO' ('Rows')
--
-- getSelection :: 'Ref' 'TableBase' -> 'IO' ('TableCoordinate', 'TableCoordinate')
--
-- getTabCellNav :: 'Ref' 'TableBase' -> 'IO' ('Bool')
--
-- getTableBox :: 'Ref' 'TableBase' -> 'IO' ('Boxtype')
--
-- getTopRow :: 'Ref' 'TableBase' -> 'IO' ('Row')
--
-- getVisibleCells :: 'Ref' 'TableBase' -> 'IO' ('TableCoordinate,TableCoordinate')
--
-- handle :: 'Ref' 'TableBase' -> 'Event' -> 'IO'( 'Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TableBase' -> 'IO' ()
--
-- initSizes :: 'Ref' 'TableBase' -> 'IO' ()
--
-- insert:: ('Parent' a 'WidgetBase') => 'Ref' 'TableBase' -> 'Ref' a -> 'AtIndex' -> 'IO' ()
--
-- insertBefore:: ('Parent' a 'WidgetBase', 'Parent' b 'Widget') => 'Ref' 'TableBase' -> 'Ref' a -> 'Ref' b -> 'IO' ()
--
-- isInteractiveResize :: 'Ref' 'TableBase' -> 'IO' ('Bool')
--
-- isSelected :: 'Ref' 'TableBase' -> 'TableCoordinate' -> 'IO' 'Bool'
--
-- moveCursor :: 'Ref' 'TableBase' -> 'TableCoordinate' -> 'IO' ('Either' 'NoChange' ())
--
-- resize :: 'Ref' 'TableBase' -> 'Rectangle' -> 'IO' ()
--
-- setColHeader :: 'Ref' 'TableBase' -> 'Bool' -> 'IO' ()
--
-- setColHeaderColor :: 'Ref' 'TableBase' -> 'Color' -> 'IO' ()
--
-- setColHeaderHeight :: 'Ref' 'TableBase' -> 'Int' -> 'IO' ()
--
-- setColPosition :: 'Ref' 'TableBase' -> 'Column' -> 'IO' ()
--
-- setColResize :: 'Ref' 'TableBase' -> 'Bool' -> 'IO' ()
--
-- setColResizeMin :: 'Ref' 'TableBase' -> 'Int' -> 'IO' ()
--
-- setColWidth :: 'Ref' 'TableBase' -> 'Column' -> 'Int' -> 'IO' ()
--
-- setColWidthAll :: 'Ref' 'TableBase' -> 'Int' -> 'IO' ()
--
-- setCols :: 'Ref' 'TableBase' -> 'Columns' -> 'IO' ()
--
-- setRowHeader :: 'Ref' 'TableBase' -> 'Bool' -> 'IO' ()
--
-- setRowHeaderColor :: 'Ref' 'TableBase' -> 'Color' -> 'IO' ()
--
-- setRowHeaderWidth :: 'Ref' 'TableBase' -> 'Int' -> 'IO' ()
--
-- setRowHeight :: 'Ref' 'TableBase' -> 'Row' -> 'Int' -> 'IO' ()
--
-- setRowHeightAll :: 'Ref' 'TableBase' -> 'Int' -> 'IO' ()
--
-- setRowPosition :: 'Ref' 'TableBase' -> 'Row' -> 'IO' ()
--
-- setRowResize :: 'Ref' 'TableBase' -> 'Bool' -> 'IO' ()
--
-- setRowResizeMin :: 'Ref' 'TableBase' -> 'Int' -> 'IO' ()
--
-- setRows :: 'Ref' 'TableBase' -> 'Rows' -> 'IO' ()
--
-- setSelection :: 'Ref' 'TableBase' -> 'TableCoordinate' -> 'TableCoordinate' ->'IO' ()
--
-- setTabCellNav :: 'Ref' 'TableBase' -> 'Bool' -> 'IO' ()
--
-- setTableBox :: 'Ref' 'TableBase' -> 'Boxtype' -> 'IO' ()
--
-- setTopRow :: 'Ref' 'TableBase' -> 'Row' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TableBase' -> 'IO' ()
-- @
