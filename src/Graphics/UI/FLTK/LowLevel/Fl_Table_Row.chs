{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Table_Row
    (
     TableRowFuncs(..),
     defaultTableRowFuncs,
     tableRowNew,
     tableRowDestroy,
     -- * Inherited from Fl_Widget
     tableRowHandle,
     tableRowParent,
     tableRowSetParent,
     tableRowType_,
     tableRowSetType,
     tableRowDrawLabel,
     tableRowX,
     tableRowY,
     tableRowW,
     tableRowH,
     tableRowSetAlign,
     tableRowAlign,
     tableRowBox,
     tableRowSetBox,
     tableRowColor,
     tableRowSetColor,
     tableRowSetColorWithBgSel,
     tableRowSelectionColor,
     tableRowSetSelectionColor,
     tableRowLabel,
     tableRowCopyLabel,
     tableRowSetLabel,
     tableRowLabeltype,
     tableRowSetLabeltype,
     tableRowLabelcolor,
     tableRowSetLabelcolor,
     tableRowLabelfont,
     tableRowSetLabelfont,
     tableRowLabelsize,
     tableRowSetLabelsize,
     tableRowImage,
     tableRowSetImage,
     tableRowDeimage,
     tableRowSetDeimage,
     tableRowTooltip,
     tableRowCopyTooltip,
     tableRowSetTooltip,
     tableRowWhen,
     tableRowSetWhen,
     tableRowVisible,
     tableRowVisibleR,
     tableRowShow,
     tableRowHide,
     tableRowSetVisible,
     tableRowClearVisible,
     tableRowActive,
     tableRowActiveR,
     tableRowActivate,
     tableRowDeactivate,
     tableRowOutput,
     tableRowSetOutput,
     tableRowClearOutput,
     tableRowTakesevents,
     tableRowSetChanged,
     tableRowClearChanged,
     tableRowTakeFocus,
     tableRowSetVisibleFocus,
     tableRowClearVisibleFocus,
     tableRowModifyVisibleFocus,
     tableRowVisibleFocus,
     tableRowContains,
     tableRowInside,
     tableRowRedraw,
     tableRowRedrawLabel,
     tableRowDamage,
     tableRowClearDamageWithBitmask,
     tableRowClearDamage,
     tableRowDamageWithText,
     tableRowDamageInsideWidget,
     tableRowMeasureLabel,
     tableRowWindow,
     tableRowTopWindow,
     tableRowTopWindowOffset,
     tableRowResize,
     tableRowResizeSuper,
     tableRowSetCallback,
     tableRowBegin,
     tableRowEnd,
     tableRowFind,
     tableRowAdd,
     tableRowInsert,
     tableRowRemoveIndex,
     tableRowRemoveWidget,
     tableRowClear,
     tableRowClearSuper,
     tableRowSetResizable,
     tableRowResizable,
     tableRowAddResizable,
     tableRowInitSizes,
     tableRowChildren,
     tableRowSetClipChildren,
     tableRowClipChildren,
     tableRowFocus,
     tableRowDdfdesignKludge,
     tableRowInsertWithBefore,
     tableRowArray,
     tableRowChild,
     -- * Fl_Table_Row specific
     tableRowSetTableRowBox,
     tableRowTableRowBox,
     tableRowSetRowsSuper,
     tableRowSetRows,
     tableRowRows,
     tableRowSetColsSuper,
     tableRowSetCols,
     tableRowCols,
     tableRowSetVisibleCells,
     tableRowIsInteractiveResize,
     tableRowRowResize,
     tableRowSetRowResize,
     tableRowColResize,
     tableRowSetColResize,
     tableRowColResizeMin,
     tableRowSetColResizeMin,
     tableRowRowResizeMin,
     tableRowSetRowResizeMin,
     tableRowRowHeader,
     tableRowSetRowHeader,
     tableRowColHeader,
     tableRowSetColHeader,
     tableRowSetColHeaderHeight,
     tableRowColHeaderHeight,
     tableRowSetRowHeaderWidth,
     tableRowRowHeaderWidth,
     tableRowSetRowHeaderColor,
     tableRowRowHeaderColor,
     tableRowSetColHeaderColor,
     tableRowColHeaderColor,
     tableRowSetRowHeight,
     tableRowRowHeight,
     tableRowSetColWidth,
     tableRowColWidth,
     tableRowSetRowHeightAll,
     tableRowSetColWidthAll,
     tableRowSetRowPosition,
     tableRowSetColPosition,
     tableRowRowPosition,
     tableRowColPosition,
     tableRowSetTopRow,
     tableRowTopRow,
     tableRowIsSelected,
     tableRowGetSelection,
     tableRowSetSelection,
     tableRowMoveCursor,
     tableRowDraw,
     tableRowDrawSuper,
     tableRowInsertWithWidget,
     tableRowCallbackRow,
     tableRowCallbackCol,
     tableRowCallbackContext,
     tableRowDoCallback,
     tableRowFindCell,
     tableRowAsGroup,
     tableRowAsGroupSuper,
     tableRowAsGlWindow,
     tableRowAsGlWindowSuper,
     tableRowType,
     tableRowSetSelectMode,
     tableRowSelectMode
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Table_RowC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import qualified Graphics.UI.FLTK.LowLevel.Fl_Table as Table
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
data TableRowFuncs a =
    TableRowFuncs
    {
    tableRowDrawCellOverride   :: Maybe (TableDrawCellF a)
    }

tableRowFunctionStruct :: (TableRowFuncs a) -> IO (Ptr ())
tableRowFunctionStruct funcs = do
  p <- mallocBytes {#sizeof fl_Table_Row_Virtual_Funcs #}
  {#set fl_Table_Row_Virtual_Funcs->draw#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->handle#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->resize#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->show#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->hide#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->as_window#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->as_gl_window#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->as_group#} p nullFunPtr
  toTableDrawCellPrim `orNullFunPtr` (tableRowDrawCellOverride funcs) >>=
                         {#set fl_Table_Row_Virtual_Funcs->draw_cell#} p
  {#set fl_Table_Row_Virtual_Funcs->clear#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->set_rows#} p nullFunPtr
  {#set fl_Table_Row_Virtual_Funcs->set_cols#} p nullFunPtr
  return p
defaultTableRowFuncs :: TableRowFuncs a
defaultTableRowFuncs = TableRowFuncs Nothing
{# fun unsafe Fl_OverriddenTable_Row_New as tableRowNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun unsafe Fl_OverriddenTable_Row_New_WithLabel as tableRowNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
tableRowNew :: Rectangle -> Maybe String -> TableRowFuncs a -> IO (TableRow ())
tableRowNew rectangle label' funcs' =
    do
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableRowFunctionStruct funcs'
      case label' of
        (Just l') -> tableRowNewWithLabel' x_pos y_pos width height l' ptr >>= toObject
        Nothing -> tableRowNew' x_pos y_pos width height ptr >>= toObject

{# fun unsafe Fl_Table_Row_Destroy as tableRowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
tableRowDestroy :: TableRow a -> IO ()
tableRowDestroy tableRow = withObject tableRow $ \tableRowPtr -> tableRowDestroy' tableRowPtr
tableRowParent :: TableRow a -> IO (Group ())
tableRowParent = Table.tableParent
tableRowSetParent :: TableRow a -> Group b -> IO ()
tableRowSetParent = Table.tableSetParent
tableRowType_ :: TableRow a  ->  IO (Word8)
tableRowType_ = Table.tableType_
tableRowSetType :: TableRow a  -> Word8 ->  IO (())
tableRowSetType = Table.tableSetType
tableRowDrawLabel :: TableRow a  -> Maybe (Rectangle,AlignType)->  IO (())
tableRowDrawLabel = Table.tableDrawLabel
tableRowX :: TableRow a  ->  IO (Int)
tableRowX = Table.tableX
tableRowY :: TableRow a  ->  IO (Int)
tableRowY = Table.tableY
tableRowW :: TableRow a  ->  IO (Int)
tableRowW = Table.tableW
tableRowH :: TableRow a  ->  IO (Int)
tableRowH = Table.tableH
tableRowSetAlign :: TableRow a  -> AlignType ->  IO (())
tableRowSetAlign = Table.tableSetAlign
tableRowAlign :: TableRow a  ->  IO (AlignType)
tableRowAlign = Table.tableAlign
tableRowBox :: TableRow a  ->  IO (Boxtype)
tableRowBox = Table.tableBox
tableRowSetBox :: TableRow a  -> Boxtype ->  IO (())
tableRowSetBox = Table.tableSetBox
tableRowColor :: TableRow a  ->  IO (Color)
tableRowColor = Table.tableColor
tableRowSetColor :: TableRow a  -> Color ->  IO (())
tableRowSetColor = Table.tableSetColor
tableRowSetColorWithBgSel :: TableRow a  -> Color -> Color ->  IO (())
tableRowSetColorWithBgSel = Table.tableSetColorWithBgSel
tableRowSelectionColor :: TableRow a  ->  IO (Color)
tableRowSelectionColor = Table.tableSelectionColor
tableRowSetSelectionColor :: TableRow a  -> Color ->  IO (())
tableRowSetSelectionColor = Table.tableSetSelectionColor
tableRowLabel :: TableRow a  ->  IO (String)
tableRowLabel = Table.tableLabel
tableRowCopyLabel :: TableRow a  -> String ->  IO (())
tableRowCopyLabel = Table.tableCopyLabel
tableRowSetLabel :: TableRow a  -> String ->  IO (())
tableRowSetLabel = Table.tableSetLabel
tableRowLabeltype :: TableRow a  ->  IO (Labeltype)
tableRowLabeltype = Table.tableLabeltype
tableRowSetLabeltype :: TableRow a  -> Labeltype ->  IO (())
tableRowSetLabeltype = Table.tableSetLabeltype
tableRowLabelcolor :: TableRow a  ->  IO (Color)
tableRowLabelcolor = Table.tableLabelcolor
tableRowSetLabelcolor :: TableRow a  -> Color ->  IO (())
tableRowSetLabelcolor = Table.tableSetLabelcolor
tableRowLabelfont :: TableRow a  ->  IO (Font)
tableRowLabelfont = Table.tableLabelfont
tableRowSetLabelfont :: TableRow a  -> Font ->  IO (())
tableRowSetLabelfont = Table.tableSetLabelfont
tableRowLabelsize :: TableRow a  ->  IO (FontSize)
tableRowLabelsize = Table.tableLabelsize
tableRowSetLabelsize :: TableRow a  -> FontSize ->  IO (())
tableRowSetLabelsize = Table.tableSetLabelsize
tableRowImage :: TableRow a  ->  IO (Image ())
tableRowImage = Table.tableImage
tableRowSetImage :: TableRow a  -> Image b ->  IO (())
tableRowSetImage = Table.tableSetImage
tableRowDeimage :: TableRow a  ->  IO (Image ())
tableRowDeimage = Table.tableDeimage
tableRowSetDeimage :: TableRow a  -> Image b ->  IO (())
tableRowSetDeimage = Table.tableSetDeimage
tableRowTooltip :: TableRow a  ->  IO (String)
tableRowTooltip = Table.tableTooltip
tableRowCopyTooltip :: TableRow a  -> String ->  IO (())
tableRowCopyTooltip = Table.tableCopyTooltip
tableRowSetTooltip :: TableRow a  -> String ->  IO (())
tableRowSetTooltip = Table.tableSetTooltip
tableRowWhen :: TableRow a  ->  IO (When)
tableRowWhen = Table.tableWhen
tableRowSetWhen :: TableRow a  -> Word8 ->  IO (())
tableRowSetWhen = Table.tableSetWhen
tableRowVisible :: TableRow a  ->  IO (Int)
tableRowVisible = Table.tableVisible
tableRowVisibleR :: TableRow a  ->  IO (Int)
tableRowVisibleR = Table.tableVisibleR
tableRowShow :: TableRow a  ->  IO (())
tableRowShow = Table.tableShow
tableRowHide :: TableRow a  ->  IO (())
tableRowHide = Table.tableHide
tableRowSetVisible :: TableRow a  ->  IO (())
tableRowSetVisible = Table.tableSetVisible
tableRowClearVisible :: TableRow a  ->  IO (())
tableRowClearVisible = Table.tableClearVisible
tableRowActive :: TableRow a  ->  IO (Int)
tableRowActive = Table.tableActive
tableRowActiveR :: TableRow a  ->  IO (Int)
tableRowActiveR = Table.tableActiveR
tableRowActivate :: TableRow a  ->  IO (())
tableRowActivate = Table.tableActivate
tableRowDeactivate :: TableRow a  ->  IO (())
tableRowDeactivate = Table.tableDeactivate
tableRowOutput :: TableRow a  ->  IO (Int)
tableRowOutput = Table.tableOutput
tableRowSetOutput :: TableRow a  ->  IO (())
tableRowSetOutput = Table.tableSetOutput
tableRowClearOutput :: TableRow a  ->  IO (())
tableRowClearOutput = Table.tableClearOutput
tableRowTakesevents :: TableRow a  ->  IO (Int)
tableRowTakesevents = Table.tableTakesevents
tableRowSetChanged :: TableRow a  ->  IO (())
tableRowSetChanged = Table.tableSetChanged
tableRowClearChanged :: TableRow a  ->  IO (())
tableRowClearChanged = Table.tableClearChanged
tableRowTakeFocus :: TableRow a  ->  IO (Int)
tableRowTakeFocus = Table.tableTakeFocus
tableRowSetVisibleFocus :: TableRow a  ->  IO (())
tableRowSetVisibleFocus = Table.tableSetVisibleFocus
tableRowClearVisibleFocus :: TableRow a  ->  IO (())
tableRowClearVisibleFocus = Table.tableClearVisibleFocus
tableRowModifyVisibleFocus :: TableRow a  -> Int ->  IO (())
tableRowModifyVisibleFocus = Table.tableModifyVisibleFocus
tableRowVisibleFocus :: TableRow a  ->  IO (Int)
tableRowVisibleFocus = Table.tableVisibleFocus
tableRowContains :: TableRow a  -> Group b  ->  IO (Int)
tableRowContains = Table.tableContains
tableRowInside :: TableRow a  -> Group b  ->  IO (Int)
tableRowInside = Table.tableInside
tableRowRedraw :: TableRow a  ->  IO (())
tableRowRedraw = Table.tableRedraw
tableRowRedrawLabel :: TableRow a  ->  IO (())
tableRowRedrawLabel = Table.tableRedrawLabel
tableRowDamage :: TableRow a  ->  IO (Word8)
tableRowDamage = Table.tableDamage
tableRowClearDamageWithBitmask :: TableRow a  -> Word8 ->  IO (())
tableRowClearDamageWithBitmask = Table.tableClearDamageWithBitmask
tableRowClearDamage :: TableRow a  ->  IO (())
tableRowClearDamage = Table.tableClearDamage
tableRowDamageWithText :: TableRow a  -> Word8 ->  IO (())
tableRowDamageWithText = Table.tableDamageWithText
tableRowDamageInsideWidget :: TableRow a  -> Word8 -> Rectangle ->  IO (())
tableRowDamageInsideWidget = Table.tableDamageInsideWidget
tableRowMeasureLabel :: TableRow a  -> IO (Size)
tableRowMeasureLabel = Table.tableMeasureLabel
tableRowWindow :: TableRow a  ->  IO (Window ())
tableRowWindow = Table.tableWindow
tableRowTopWindow :: TableRow a  ->  IO (Window ())
tableRowTopWindow = Table.tableTopWindow
tableRowTopWindowOffset :: TableRow a -> IO (Position)
tableRowTopWindowOffset = Table.tableTopWindowOffset
tableRowSetCallback :: TableRow a -> (Group b -> IO ()) -> IO (())
tableRowSetCallback = Table.tableSetCallback
tableRowRemoveIndex :: TableRow a  -> Int ->  IO (())
tableRowRemoveIndex = Table.tableRemoveIndex
tableRowRemoveWidget :: TableRow b -> Widget a  ->  IO (())
tableRowRemoveWidget = Table.tableRemoveWidget
tableRowSetResizable :: TableRow b -> Widget a  ->  IO (())
tableRowSetResizable = Table.tableSetResizable
tableRowResizable :: TableRow a  ->  IO (Widget ())
tableRowResizable = Table.tableResizable
tableRowAddResizable :: TableRow b  -> Widget a  ->  IO (())
tableRowAddResizable = Table.tableAddResizable
tableRowSetClipChildren :: TableRow a  -> Int ->  IO (())
tableRowSetClipChildren = Table.tableSetClipChildren
tableRowClipChildren :: TableRow a  ->  IO (Int)
tableRowClipChildren = Table.tableClipChildren
tableRowFocus :: Group b -> Widget a  ->  IO (())
tableRowFocus = Table.tableFocus
tableRowDdfdesignKludge :: TableRow a  ->  IO (Widget ())
tableRowDdfdesignKludge = Table.tableDdfdesignKludge
tableRowInsertWithBefore :: Group b -> Widget a  -> Widget c  ->  IO (())
tableRowInsertWithBefore = Table.tableInsertWithBefore
tableRowSetTableRowBox :: TableRow a -> Boxtype ->  IO ()
tableRowSetTableRowBox = Table.tableSetTableBox
tableRowTableRowBox :: TableRow a  ->  IO (Boxtype)
tableRowTableRowBox = Table.tableTableBox
tableRowSetRows :: TableRow a  -> Int ->  IO ()
tableRowSetRows = Table.tableSetRows
{# fun unsafe Fl_Table_Row_rows as rows' { id `Ptr ()' } -> `Int' #}
tableRowRows :: TableRow a  ->  IO (Int)
tableRowRows tableRow = withObject tableRow $ \tableRowPtr -> rows' tableRowPtr
tableRowSetCols :: TableRow a  -> Int ->  IO ()
tableRowSetCols = Table.tableSetCols
tableRowCols :: TableRow a  ->  IO (Int)
tableRowCols = Table.tableCols
tableRowSetVisibleCells :: TableRow a  -> Ptr CInt -> Ptr CInt -> Ptr CInt -> Ptr CInt ->  IO ()
tableRowSetVisibleCells = Table.tableSetVisibleCells
tableRowIsInteractiveResize :: TableRow a  ->  IO (Int)
tableRowIsInteractiveResize = Table.tableIsInteractiveResize
tableRowRowResize :: TableRow a  ->  IO (Int)
tableRowRowResize = Table.tableRowResize
tableRowSetRowResize :: TableRow a  -> Bool ->  IO ()
tableRowSetRowResize = Table.tableSetRowResize
tableRowColResize :: TableRow a  ->  IO (Int)
tableRowColResize = Table.tableColResize
tableRowSetColResize :: TableRow a  -> Bool ->  IO ()
tableRowSetColResize = Table.tableSetColResize
tableRowColResizeMin :: TableRow a  ->  IO (Int)
tableRowColResizeMin = Table.tableColResizeMin
tableRowSetColResizeMin :: TableRow a  -> Int ->  IO ()
tableRowSetColResizeMin = Table.tableSetColResizeMin
tableRowRowResizeMin :: TableRow a  ->  IO (Int)
tableRowRowResizeMin = Table.tableRowResizeMin
tableRowSetRowResizeMin :: TableRow a  -> Int ->  IO ()
tableRowSetRowResizeMin = Table.tableSetRowResizeMin
tableRowRowHeader :: TableRow a  ->  IO (Int)
tableRowRowHeader = Table.tableRowHeader
tableRowSetRowHeader :: TableRow a  -> Bool ->  IO ()
tableRowSetRowHeader = Table.tableSetRowHeader
tableRowColHeader :: TableRow a  ->  IO (Int)
tableRowColHeader = Table.tableColHeader
tableRowSetColHeader :: TableRow a  -> Bool ->  IO ()
tableRowSetColHeader = Table.tableSetColHeader
tableRowSetColHeaderHeight :: TableRow a  -> Int ->  IO ()
tableRowSetColHeaderHeight = Table.tableSetColHeaderHeight
tableRowColHeaderHeight :: TableRow a  ->  IO (Int)
tableRowColHeaderHeight = Table.tableColHeaderHeight
tableRowSetRowHeaderWidth :: TableRow a  -> Int ->  IO ()
tableRowSetRowHeaderWidth = Table.tableSetRowHeaderWidth
tableRowRowHeaderWidth :: TableRow a  ->  IO (Int)
tableRowRowHeaderWidth = Table.tableRowHeaderWidth
tableRowSetRowHeaderColor :: TableRow a  -> Color ->  IO ()
tableRowSetRowHeaderColor = Table.tableSetRowHeaderColor
tableRowRowHeaderColor :: TableRow a  ->  IO (Color)
tableRowRowHeaderColor = Table.tableRowHeaderColor
tableRowSetColHeaderColor :: TableRow a  -> Color ->  IO ()
tableRowSetColHeaderColor = Table.tableSetColHeaderColor
tableRowColHeaderColor :: TableRow a  ->  IO (Color)
tableRowColHeaderColor = Table.tableColHeaderColor
tableRowSetRowHeight :: TableRow a  -> Int -> Int ->  IO ()
tableRowSetRowHeight = Table.tableSetRowHeight
tableRowRowHeight :: TableRow a  -> Int ->  IO (Int)
tableRowRowHeight = Table.tableRowHeight
tableRowSetColWidth :: TableRow a  -> Int -> Int ->  IO ()
tableRowSetColWidth = Table.tableSetColWidth
tableRowColWidth :: TableRow a  -> Int ->  IO (Int)
tableRowColWidth = Table.tableColWidth
tableRowSetRowHeightAll :: TableRow a  -> Int ->  IO ()
tableRowSetRowHeightAll = Table.tableSetRowHeightAll
tableRowSetColWidthAll :: TableRow a  -> Int ->  IO ()
tableRowSetColWidthAll = Table.tableSetColWidthAll
tableRowSetRowPosition :: TableRow a  -> Int ->  IO ()
tableRowSetRowPosition = Table.tableSetRowPosition
tableRowSetColPosition :: TableRow a  -> Int ->  IO ()
tableRowSetColPosition = Table.tableSetColPosition
tableRowRowPosition :: TableRow a  ->  IO (Int)
tableRowRowPosition = Table.tableRowPosition
tableRowColPosition :: TableRow a  ->  IO (Int)
tableRowColPosition = Table.tableColPosition
tableRowSetTopRow :: TableRow a  -> Int ->  IO ()
tableRowSetTopRow = Table.tableSetTopRow
tableRowTopRow :: TableRow a  ->  IO (Int)
tableRowTopRow = Table.tableTopRow
tableRowIsSelected :: TableRow a  -> Int -> Int ->  IO (Int)
tableRowIsSelected = Table.tableIsSelected
tableRowGetSelection :: TableRow a  -> IO (Position, Position)
tableRowGetSelection = Table.tableGetSelection
tableRowSetSelection :: TableRow a  -> Int -> Int -> Int -> Int ->  IO ()
tableRowSetSelection = Table.tableSetSelection
tableRowMoveCursor :: TableRow a  -> Int -> Int ->  IO (Int)
tableRowMoveCursor = Table.tableMoveCursor
tableRowInitSizes :: TableRow a  ->  IO ()
tableRowInitSizes = Table.tableInitSizes
tableRowAdd :: TableRow a  -> Widget a  ->  IO ()
tableRowAdd = Table.tableAdd
tableRowInsert :: TableRow a  -> Widget a  -> Int ->  IO ()
tableRowInsert = Table.tableInsert
tableRowInsertWithWidget :: TableRow a  -> Widget b  -> Widget c  ->  IO ()
tableRowInsertWithWidget = Table.tableInsertWithWidget
tableRowBegin :: TableRow a  ->  IO ()
tableRowBegin = Table.tableBegin
tableRowEnd :: TableRow a  ->  IO ()
tableRowEnd = Table.tableEnd
tableRowArray :: TableRow a  ->  IO [Widget ()]
tableRowArray = Table.tableArray
tableRowChild :: TableRow a  -> Int ->  IO (Widget ())
tableRowChild = Table.tableChild
tableRowChildren :: TableRow a  ->  IO (Int)
tableRowChildren = Table.tableChildren
tableRowFind :: TableRow a  -> Widget a  ->  IO (Int)
tableRowFind = Table.tableFind
tableRowCallbackRow :: TableRow a  ->  IO (Int)
tableRowCallbackRow = Table.tableCallbackRow
tableRowCallbackCol :: TableRow a  ->  IO (Int)
tableRowCallbackCol = Table.tableCallbackCol
tableRowCallbackContext :: TableRow a  ->  IO (TableContext)
tableRowCallbackContext = Table.tableCallbackContext
tableRowDoCallback :: TableRow a  -> TableContext -> Int -> Int ->  IO ()
tableRowDoCallback = Table.tableDoCallback
tableRowFindCell :: TableRow a  -> TableContext -> Int -> Int -> IO (Maybe Rectangle)
tableRowFindCell = Table.tableFindCell
tableRowDrawSuper :: TableRow a  ->  IO ()
tableRowDrawSuper = Table.tableDrawSuper
tableRowDraw :: TableRow a  ->  IO ()
tableRowDraw = Table.tableDraw
tableRowHandle :: TableRow a  -> Int ->  IO (Int)
tableRowHandle = Table.tableHandle
tableRowResizeSuper :: TableRow a  -> Rectangle ->  IO ()
tableRowResizeSuper = Table.tableResizeSuper
tableRowResize :: TableRow a  -> Rectangle ->  IO ()
tableRowResize = Table.tableResize
tableRowClearSuper :: TableRow a  ->  IO ()
tableRowClearSuper = Table.tableClearSuper
tableRowClear :: TableRow a  ->  IO ()
tableRowClear = Table.tableClear
tableRowAsGroupSuper :: TableRow a  ->  IO (Group ())
tableRowAsGroupSuper = Table.tableAsGroupSuper
tableRowAsGroup :: TableRow a  ->  IO (Group ())
tableRowAsGroup = Table.tableAsGroup
tableRowAsGlWindowSuper :: TableRow a  ->  IO (GlWindow ())
tableRowAsGlWindowSuper = Table.tableAsGlWindowSuper
tableRowAsGlWindow :: TableRow a  ->  IO (GlWindow ())
tableRowAsGlWindow = Table.tableAsGlWindow
tableRowSetRowsSuper :: TableRow a  -> Int ->  IO ()
tableRowSetRowsSuper = Table.tableSetRowsSuper
tableRowSetColsSuper :: TableRow a  -> Int ->  IO ()
tableRowSetColsSuper = Table.tableSetColsSuper
{# fun Fl_Table_Row_set_type as tableRowSetType' { id `Ptr ()', cFromEnum `TableRowSelectMode'} -> `()' #}
tableRowSetSelectMode :: TableRow a -> TableRowSelectMode -> IO ()
tableRowSetSelectMode tableRow selectionMode = withObject tableRow $ \tableRowPtr' -> tableRowSetType' tableRowPtr' selectionMode 
{# fun Fl_Table_Row_type as tableRowType { id `Ptr ()' } -> `TableRowSelectMode' cToEnum  #}
tableRowSelectMode :: TableRow a -> IO TableRowSelectMode
tableRowSelectMode tableRow = withObject tableRow $ \tableRowPtr' -> tableRowType tableRowPtr'
