{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Table
    (
     CustomTableFuncs(..),
     mkSetInt,
     mkDrawCell,
     toSetIntPrim,
     toDrawCellPrim,
     fillCustomTableFunctionStruct,
     defaultCustomTableFuncs,
     tableCustom,
     tableCustomFunctionStruct
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TableC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

foreign import ccall "wrapper"
        mkSetInt ::  (Ptr () -> CInt -> IO ())-> IO (FunPtr (Ptr () -> CInt -> IO ()))
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

toSetIntPrim :: (Ref a -> Int -> IO ()) -> IO (FunPtr (Ptr () -> CInt -> IO ()))
toSetIntPrim f =
    mkSetInt
    (
     \ptr num' -> do
       pp <- wrapNonNull ptr "Null pointer. toSetIntPrim"
       f (wrapInRef pp) (fromIntegral num')
    )

toDrawCellPrim :: (Ref a -> TableContext -> Int -> Int -> Rectangle -> IO ()) ->
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
           f (wrapInRef pp) (toEnum $ fromIntegral context') (fromIntegral row') (fromIntegral col') rectangle
     )

data CustomTableFuncs a =
    CustomTableFuncs
    {
     drawCellCustom   :: Maybe (Ref a -> TableContext -> Int -> Int -> Rectangle -> IO ())
    ,clearCustom      :: Maybe (Ref a -> IO ())
    ,setRowsCustom    :: Maybe (Ref a -> Int -> IO ())
    ,setColsCustom    :: Maybe (Ref a -> Int -> IO ())
    }

fillCustomTableFunctionStruct :: forall a. (Parent a Table) =>
                                  Ptr () ->
                                  CustomTableFuncs a ->
                                  IO ()
fillCustomTableFunctionStruct structPtr (CustomTableFuncs _drawCell' _clear' _setRows' _setCols')  = do
   toDrawCellPrim `orNullFunPtr` _drawCell' >>= {#set fl_Table_Virtual_Funcs->draw_cell#} structPtr
   toCallbackPrim `orNullFunPtr` _clear' >>= {#set fl_Table_Virtual_Funcs->clear#} structPtr
   toSetIntPrim `orNullFunPtr` _setRows' >>= {#set fl_Table_Virtual_Funcs->set_rows#} structPtr
   toSetIntPrim `orNullFunPtr` _setCols' >>= {#set fl_Table_Virtual_Funcs->set_cols#} structPtr

defaultCustomTableFuncs :: forall a. (Parent a Table) => CustomTableFuncs a
defaultCustomTableFuncs = CustomTableFuncs Nothing Nothing Nothing Nothing

tableCustomFunctionStruct :: (Parent a Widget,
                              Parent b Table) =>
                             CustomWidgetFuncs a ->
                             CustomTableFuncs b ->
                             IO (Ptr ())
tableCustomFunctionStruct customWidgetFuncs' customTableFuncs' =
  do
   ptr <- mallocBytes {#sizeof fl_Table_Virtual_Funcs #}
   fillCustomWidgetFunctionStruct ptr customWidgetFuncs'
   fillCustomTableFunctionStruct ptr customTableFuncs'
   return ptr

{# fun unsafe Fl_Table_New as tableNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun unsafe Fl_Table_New_WithLabel as tableNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
tableCustom :: Rectangle -> Maybe String -> CustomWidgetFuncs Table -> CustomTableFuncs Table -> IO (Ref Table)
tableCustom rectangle label' customWidgetFuncs' customTableFuncs' =
    do
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableCustomFunctionStruct customWidgetFuncs' customTableFuncs'
      case label' of
        (Just l') -> tableNewWithLabel' x_pos y_pos width height l' ptr >>= toRef
        Nothing -> tableNew' x_pos y_pos width height ptr >>= toRef

{# fun unsafe Fl_Table_Destroy as tableDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Table ( IO ()) where
  runOp _ table = withRef table $ \tablePtr -> tableDestroy' tablePtr
{# fun Fl_Table_set_table_box as setTableBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance Op (SetTableBox ()) Table ( Boxtype ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setTableBox' tablePtr val
{# fun unsafe Fl_Table_table_box as tableBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance Op (GetTableBox ()) Table (  IO (Boxtype)) where
  runOp _ table = withRef table $ \tablePtr -> tableBox' tablePtr
{# fun Fl_Table_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRows ()) Table ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setRows' tablePtr val
{# fun unsafe Fl_Table_rows as rows' { id `Ptr ()' } -> `Int' #}
instance Op (GetRows ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> rows' tablePtr
{# fun Fl_Table_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetCols ()) Table ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setCols' tablePtr val
{# fun unsafe Fl_Table_cols as cols' { id `Ptr ()' } -> `Int' #}
instance Op (GetCols ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> cols' tablePtr
{# fun Fl_Table_set_visible_cells as setVisibleCells' { id `Ptr ()',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt' } -> `()' #}
instance Op (SetVisibleCells ()) Table ( Ptr CInt -> Ptr CInt -> Ptr CInt -> Ptr CInt ->  IO ()) where
  runOp _ table r1 r2 c1 c2 = withRef table $ \tablePtr -> setVisibleCells' tablePtr r1 r2 c1 c2
{# fun unsafe Fl_Table_is_interactive_resize as isInteractiveResize' { id `Ptr ()' } -> `Int' #}
instance Op (IsInteractiveResize ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> isInteractiveResize' tablePtr
{# fun unsafe Fl_Table_row_resize as rowResize' { id `Ptr ()' } -> `Int' #}
instance Op (GetRowResize ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> rowResize' tablePtr
{# fun Fl_Table_set_row_resize as setRowResize' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowResize ()) Table ( Bool ->  IO ()) where
  runOp _ table flag = withRef table $ \tablePtr -> setRowResize' tablePtr (cFromBool flag)
{# fun unsafe Fl_Table_col_resize as colResize' { id `Ptr ()' } -> `Int' #}
instance Op (GetColResize ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> colResize' tablePtr
{# fun Fl_Table_set_col_resize as setColResize' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColResize ()) Table ( Bool ->  IO ()) where
  runOp _ table flag = withRef table $ \tablePtr -> setColResize' tablePtr (cFromBool flag)
{# fun unsafe Fl_Table_col_resize_min as colResizeMin' { id `Ptr ()' } -> `Int' #}
instance Op (GetColResizeMin ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> colResizeMin' tablePtr
{# fun Fl_Table_set_col_resize_min as setColResizeMin' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColResizeMin ()) Table ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setColResizeMin' tablePtr val
{# fun unsafe Fl_Table_row_resize_min as rowResizeMin' { id `Ptr ()' } -> `Int' #}
instance Op (GetRowResizeMin ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> rowResizeMin' tablePtr
{# fun Fl_Table_set_row_resize_min as setRowResizeMin' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowResizeMin ()) Table ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setRowResizeMin' tablePtr val
{# fun unsafe Fl_Table_row_header as rowHeader' { id `Ptr ()' } -> `Int' #}
instance Op (GetRowHeader ()) Table (  IO Bool) where
  runOp _ table = withRef table $ \tablePtr -> rowHeader' tablePtr >>= return . cToBool
{# fun Fl_Table_set_row_header as setRowHeader' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowHeader ()) Table ( Bool ->  IO ()) where
  runOp _ table flag = withRef table $ \tablePtr -> setRowHeader' tablePtr (cFromBool flag)
{# fun unsafe Fl_Table_col_header as colHeader' { id `Ptr ()' } -> `Int' #}
instance Op (GetColHeader ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> colHeader' tablePtr
{# fun Fl_Table_set_col_header as setColHeader' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColHeader ()) Table ( Bool ->  IO ()) where
  runOp _ table flag = withRef table $ \tablePtr -> setColHeader' tablePtr (cFromBool flag)
{# fun Fl_Table_set_col_header_height as setColHeaderHeight' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColHeaderHeight ()) Table ( Int ->  IO ()) where
  runOp _ table height = withRef table $ \tablePtr -> setColHeaderHeight' tablePtr height
{# fun unsafe Fl_Table_col_header_height as colHeaderHeight' { id `Ptr ()' } -> `Int' #}
instance Op (GetColHeaderHeight ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> colHeaderHeight' tablePtr
{# fun Fl_Table_set_row_header_width as setRowHeaderWidth' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowHeaderWidth ()) Table ( Int ->  IO ()) where
  runOp _ table width = withRef table $ \tablePtr -> setRowHeaderWidth' tablePtr width
{# fun unsafe Fl_Table_row_header_width as rowHeaderWidth' { id `Ptr ()' } -> `Int' #}
instance Op (GetRowHeaderWidth ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> rowHeaderWidth' tablePtr
{# fun Fl_Table_set_row_header_color as setRowHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance Op (SetRowHeaderColor ()) Table ( Color ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setRowHeaderColor' tablePtr val
{# fun unsafe Fl_Table_row_header_color as rowHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetRowHeaderColor ()) Table (  IO (Color)) where
  runOp _ table = withRef table $ \tablePtr -> rowHeaderColor' tablePtr
{# fun Fl_Table_set_col_header_color as setColHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance Op (SetColHeaderColor ()) Table ( Color ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setColHeaderColor' tablePtr val
{# fun unsafe Fl_Table_col_header_color as colHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetColHeaderColor ()) Table (  IO (Color)) where
  runOp _ table = withRef table $ \tablePtr -> colHeaderColor' tablePtr
{# fun Fl_Table_set_row_height as setRowHeight' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance Op (SetRowHeight ()) Table ( Int -> Int ->  IO ()) where
  runOp _ table row height = withRef table $ \tablePtr -> setRowHeight' tablePtr row height
{# fun unsafe Fl_Table_row_height as rowHeight' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (GetRowHeight ()) Table ( Int ->  IO (Int)) where
  runOp _ table row = withRef table $ \tablePtr -> rowHeight' tablePtr row
{# fun Fl_Table_set_col_width as setColWidth' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance Op (SetColWidth ()) Table ( Int -> Int ->  IO ()) where
  runOp _ table col width = withRef table $ \tablePtr -> setColWidth' tablePtr col width
{# fun unsafe Fl_Table_col_width as colWidth' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (GetColWidth ()) Table ( Int ->  IO (Int)) where
  runOp _ table col = withRef table $ \tablePtr -> colWidth' tablePtr col
{# fun Fl_Table_set_row_height_all as setRowHeightAll' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowHeightAll ()) Table ( Int ->  IO ()) where
  runOp _ table height = withRef table $ \tablePtr -> setRowHeightAll' tablePtr height
{# fun Fl_Table_set_col_width_all as setColWidthAll' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColWidthAll ()) Table ( Int ->  IO ()) where
  runOp _ table width = withRef table $ \tablePtr -> setColWidthAll' tablePtr width
{# fun Fl_Table_set_row_position as setRowPosition' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowPosition ()) Table ( Int ->  IO ()) where
  runOp _ table row = withRef table $ \tablePtr -> setRowPosition' tablePtr row
{# fun Fl_Table_set_col_position as setColPosition' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColPosition ()) Table ( Int ->  IO ()) where
  runOp _ table col = withRef table $ \tablePtr -> setColPosition' tablePtr col
{# fun unsafe Fl_Table_row_position as rowPosition' { id `Ptr ()' } -> `Int' #}
instance Op (GetRowPosition ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> rowPosition' tablePtr
{# fun unsafe Fl_Table_col_position as colPosition' { id `Ptr ()' } -> `Int' #}
instance Op (GetColPosition ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> colPosition' tablePtr
{# fun Fl_Table_set_top_row as setTopRow' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetTopRow ()) Table ( Int ->  IO ()) where
  runOp _ table row = withRef table $ \tablePtr -> setTopRow' tablePtr row
{# fun unsafe Fl_Table_top_row as topRow' { id `Ptr ()' } -> `Int' #}
instance Op (GetTopRow ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> topRow' tablePtr
{# fun unsafe Fl_Table_is_selected as isSelected' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance Op (IsSelected ()) Table ( Int -> Int ->  IO (Int)) where
  runOp _ table r c = withRef table $ \tablePtr -> isSelected' tablePtr r c
{# fun unsafe Fl_Table_get_selection as getSelection' { id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
instance Op (GetSelection ()) Table ( IO (Position, Position)) where
  runOp _ table =
    withRef table $ \tablePtr ->
        getSelection' tablePtr >>= \(rt, cl, rb, cr) ->
            return $ (Position (X rt) (Y cl), Position (X rb) (Y cr))
{# fun Fl_Table_set_selection as setSelection' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (SetSelection ()) Table ( Int -> Int -> Int -> Int ->  IO ()) where
  runOp _ table row_top col_left row_bot col_right = withRef table $ \tablePtr -> setSelection' tablePtr row_top col_left row_bot col_right
{# fun unsafe Fl_Table_move_cursor as moveCursor' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance Op (MoveCursor ()) Table ( Int -> Int ->  IO (Int)) where
  runOp _ table r c = withRef table $ \tablePtr -> moveCursor' tablePtr r c
{# fun unsafe Fl_Table_init_sizes as initSizes' { id `Ptr ()' } -> `()' #}
instance Op (InitSizes ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> initSizes' tablePtr
{# fun unsafe Fl_Table_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget) => Op (Add ()) Table ( Ref a  ->  IO ()) where
  runOp _ table wgt = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> add' tablePtr wgtPtr
{# fun unsafe Fl_Table_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
instance (Parent a Widget) => Op (Insert ()) Table ( Ref a -> Int ->  IO ()) where
  runOp _ table wgt n = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> insert' tablePtr wgtPtr n
{# fun unsafe Fl_Table_insert_with_widget as insertWithWidget' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, Parent b Widget) => Op (InsertWithBefore ()) Table (Ref a -> Ref b ->  IO (())) where
  runOp _ self w before = withRef self $ \selfPtr -> withRef w $ \wPtr -> withRef before $ \beforePtr -> insertWithWidget' selfPtr wPtr beforePtr
{# fun unsafe Fl_Table_begin as begin' { id `Ptr ()' } -> `()' #}
instance Op (Begin ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> begin' tablePtr
{# fun unsafe Fl_Table_end as end' { id `Ptr ()' } -> `()' #}
instance Op (End ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> end' tablePtr
{# fun unsafe Fl_Table_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id #}
instance Op (GetArray ()) Table (  IO [Ref Widget]) where
  runOp _ table = withRef table $ \tablePtr -> do
                     childArrayPtr <- array' tablePtr
                     numChildren <- children table
                     arrayToRefs childArrayPtr numChildren
{# fun unsafe Fl_Table_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance Op (GetChild ()) Table ( Int ->  IO (Ref Widget)) where
  runOp _ table n = withRef table $ \tablePtr -> child' tablePtr n >>= toRef
{# fun unsafe Fl_Table_children as children' { id `Ptr ()' } -> `Int' #}
instance Op (Children ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> children' tablePtr
{# fun unsafe Fl_Table_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget) => Op (Find ()) Table (Ref a ->  IO (Int)) where
  runOp _ table wgt = withRef table $ \tablePtr -> withRef wgt $ \wgtPtr -> find' tablePtr wgtPtr
{# fun unsafe Fl_Table_callback_row as callbackRow' { id `Ptr ()' } -> `Int' #}
instance Op (CallbackRow ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> callbackRow' tablePtr
{# fun unsafe Fl_Table_callback_col as callbackCol' { id `Ptr ()' } -> `Int' #}
instance Op (CallbackCol ()) Table (  IO (Int)) where
  runOp _ table = withRef table $ \tablePtr -> callbackCol' tablePtr
{# fun unsafe Fl_Table_callback_context as callbackContext' { id `Ptr ()' } -> `TableContext' cToEnum #}
instance Op (CallbackContext ()) Table (  IO (TableContext)) where
  runOp _ table = withRef table $ \tablePtr -> callbackContext' tablePtr
{# fun unsafe Fl_Table_do_callback as doCallback' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int' } -> `()' #}
instance Op (DoCallback ()) Table ( TableContext -> Int -> Int ->  IO ()) where
  runOp _ table tablecontext row col = withRef table $ \tablePtr -> doCallback' tablePtr tablecontext row col
{# fun unsafe Fl_Table_find_cell as findCell' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `CInt' id #}
instance Op (FindCell ()) Table ( TableContext -> Int -> Int -> IO (Maybe Rectangle)) where
  runOp _ table context r c  =
    withRef table $ \tablePtr ->
        findCell' tablePtr context r c >>= \(result, x_pos', y_pos', width', height') ->
            if (cToBool result)
            then return $ Just $ toRectangle (x_pos', y_pos', width', height')
            else return $ Nothing
{# fun Fl_Table_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
instance Op (DrawSuper ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> drawSuper' tablePtr
{# fun Fl_Table_draw as draw' { id `Ptr ()' } -> `()' #}
instance Op (Draw ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> draw' tablePtr
{# fun unsafe Fl_Table_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (Handle ()) Table ( Int ->  IO (Int)) where
  runOp _ table event = withRef table $ \tablePtr -> handle' tablePtr event
{# fun unsafe Fl_Table_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (ResizeSuper ()) Table ( Rectangle ->  IO ()) where
  runOp _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resizeSuper' tablePtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Table_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance Op (Resize ()) Table ( Rectangle ->  IO ()) where
  runOp _ table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withRef table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Table_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
instance Op (ClearSuper ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> clearSuper' tablePtr
{# fun unsafe Fl_Table_clear as clear' { id `Ptr ()' } -> `()' #}
instance Op (Clear ()) Table (  IO ()) where
  runOp _ table = withRef table $ \tablePtr -> clear' tablePtr
{# fun Fl_Table_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetRowsSuper ()) Table ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setRowsSuper' tablePtr val
{# fun Fl_Table_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetColsSuper ()) Table ( Int ->  IO ()) where
  runOp _ table val = withRef table $ \tablePtr -> setColsSuper' tablePtr val
{# fun Fl_Table_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) Table ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> showSuper' widgetPtr
{# fun Fl_Table_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) Table ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Table_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) Table ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Table_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) Table ( IO (())) where
  runOp _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr
