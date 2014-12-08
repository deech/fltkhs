{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Table
    (
     TableFuncs(..),
     defaultTableFuncs,
     tableNew,
     tableDestroy,
     -- * Inherited from Fl_Widget
     tableHandle,
     tableParent,
     tableSetParent,
     tableType_,
     tableSetType,
     tableDrawLabel,
     tableX,
     tableY,
     tableW,
     tableH,
     tableSetAlign,
     tableAlign,
     tableBox,
     tableSetBox,
     tableColor,
     tableSetColor,
     tableSetColorWithBgSel,
     tableSelectionColor,
     tableSetSelectionColor,
     tableLabel,
     tableCopyLabel,
     tableSetLabel,
     tableLabeltype,
     tableSetLabeltype,
     tableLabelcolor,
     tableSetLabelcolor,
     tableLabelfont,
     tableSetLabelfont,
     tableLabelsize,
     tableSetLabelsize,
     tableImage,
     tableSetImage,
     tableDeimage,
     tableSetDeimage,
     tableTooltip,
     tableCopyTooltip,
     tableSetTooltip,
     tableWhen,
     tableSetWhen,
     tableVisible,
     tableVisibleR,
     tableShow,
     tableHide,
     tableSetVisible,
     tableClearVisible,
     tableActive,
     tableActiveR,
     tableActivate,
     tableDeactivate,
     tableOutput,
     tableSetOutput,
     tableClearOutput,
     tableTakesevents,
     tableSetChanged,
     tableClearChanged,
     tableTakeFocus,
     tableSetVisibleFocus,
     tableClearVisibleFocus,
     tableModifyVisibleFocus,
     tableVisibleFocus,
     tableContains,
     tableInside,
     tableRedraw,
     tableRedrawLabel,
     tableDamage,
     tableClearDamageWithBitmask,
     tableClearDamage,
     tableDamageWithText,
     tableDamageInsideWidget,
     tableMeasureLabel,
     tableWindow,
     tableTopWindow,
     tableTopWindowOffset,
     tableResize,
     tableResizeSuper,
     tableSetCallback,
     tableBegin,
     tableEnd,
     tableFind,
     tableAdd,
     tableInsert,
     tableRemoveIndex,
     tableRemoveWidget,
     tableClear,
     tableClearSuper,
     tableSetResizable,
     tableResizable,
     tableAddResizable,
     tableInitSizes,
     tableChildren,
     tableSetClipChildren,
     tableClipChildren,
     tableFocus,
     tableDdfdesignKludge,
     tableInsertWithBefore,
     tableArray,
     tableChild,
     -- * Fl_Table specific
     tableSetTableBox,
     tableTableBox,
     tableSetRowsSuper,
     tableSetRows,
     tableRows,
     tableSetColsSuper,
     tableSetCols,
     tableCols,
     tableSetVisibleCells,
     tableIsInteractiveResize,
     tableRowResize,
     tableSetRowResize,
     tableColResize,
     tableSetColResize,
     tableColResizeMin,
     tableSetColResizeMin,
     tableRowResizeMin,
     tableSetRowResizeMin,
     tableRowHeader,
     tableSetRowHeader,
     tableColHeader,
     tableSetColHeader,
     tableSetColHeaderHeight,
     tableColHeaderHeight,
     tableSetRowHeaderWidth,
     tableRowHeaderWidth,
     tableSetRowHeaderColor,
     tableRowHeaderColor,
     tableSetColHeaderColor,
     tableColHeaderColor,
     tableSetRowHeight,
     tableRowHeight,
     tableSetColWidth,
     tableColWidth,
     tableSetRowHeightAll,
     tableSetColWidthAll,
     tableSetRowPosition,
     tableSetColPosition,
     tableRowPosition,
     tableColPosition,
     tableSetTopRow,
     tableTopRow,
     tableIsSelected,
     tableGetSelection,
     tableSetSelection,
     tableMoveCursor,
     tableDraw,
     tableDrawSuper,
     tableInsertWithWidget,
     tableCallbackRow,
     tableCallbackCol,
     tableCallbackContext,
     tableDoCallback,
     tableFindCell,
     tableAsGroup,
     tableAsGroupSuper,
     tableAsGlWindow,
     tableAsGlWindowSuper
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TableC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Group
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
data TableFuncs a =
    TableFuncs
    {
     tableDrawOverride       :: Maybe (WidgetCallback a)
    ,tableHandleOverride     :: Maybe (WidgetEventHandler a)
    ,tableResizeOverride     :: Maybe (RectangleF a)
    ,tableShowOverride       :: Maybe (WidgetCallback a)
    ,tableHideOverride       :: Maybe (WidgetCallback a)
    ,tableAsWindowOverride   :: Maybe (GetWindowF a)
    ,tableAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,tableAsGroupOverride    :: Maybe (GetGroupF a)
    ,tableDrawCellOverride   :: Maybe (TableDrawCellF a)
    ,tableClearOverride      :: Maybe (WidgetCallback a)
    ,tableSetRowsOverride    :: Maybe (TableSetIntF a)
    ,tableSetColsOverride    :: Maybe (TableSetIntF a)
    }

tableFunctionStruct :: (TableFuncs a) -> IO (Ptr ())
tableFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Table_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (tableDrawOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (tableHandleOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (tableResizeOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (tableShowOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (tableHideOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (tableAsWindowOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (tableAsGlWindowOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (tableAsGroupOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->as_group#} p
      toTableDrawCellPrim `orNullFunPtr` (tableDrawCellOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->draw_cell#} p
      toCallbackPrim `orNullFunPtr` (tableClearOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->clear#} p
      toTableSetIntFPrim `orNullFunPtr` (tableSetRowsOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->set_rows#} p 
      toTableSetIntFPrim `orNullFunPtr` (tableSetColsOverride funcs) >>=
                             {#set fl_Table_Virtual_Funcs->set_cols#} p
      return p
defaultTableFuncs :: TableFuncs a
defaultTableFuncs = TableFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{# fun unsafe Fl_Table_New as tableNew' {  `Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun unsafe Fl_Table_New_WithLabel as tableNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
tableNew :: Rectangle -> Maybe String -> TableFuncs a -> IO (Table ())
tableNew rectangle label' funcs' =
    do 
      let (x_pos, y_pos, width, height) = fromRectangle rectangle
      ptr <- tableFunctionStruct funcs'
      case label' of
        (Just l') -> tableNewWithLabel' x_pos y_pos width height l' ptr >>= toObject
        Nothing -> tableNew' x_pos y_pos width height ptr >>= toObject

{# fun unsafe Fl_Table_Destroy as tableDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
tableDestroy :: Table a -> IO ()
tableDestroy table = withObject table $ \tablePtr -> tableDestroy' tablePtr
tableParent :: Table a -> IO (Group ())
tableParent = groupParent
tableSetParent :: Table a -> Group b -> IO ()
tableSetParent = groupSetParent
tableType_ :: Table a  ->  IO (Word8)
tableType_ = groupType_
tableSetType :: Table a  -> Word8 ->  IO (())
tableSetType = groupSetType
tableDrawLabel :: Table a  -> Maybe (Rectangle,AlignType)->  IO (())
tableDrawLabel = groupDrawLabel
tableX :: Table a  ->  IO (Int)
tableX = groupX
tableY :: Table a  ->  IO (Int)
tableY = groupY
tableW :: Table a  ->  IO (Int)
tableW = groupW
tableH :: Table a  ->  IO (Int)
tableH = groupH
tableSetAlign :: Table a  -> AlignType ->  IO (())
tableSetAlign = groupSetAlign
tableAlign :: Table a  ->  IO (AlignType)
tableAlign = groupAlign
tableBox :: Table a  ->  IO (Boxtype)
tableBox = groupBox
tableSetBox :: Table a  -> Boxtype ->  IO (())
tableSetBox = groupSetBox
tableColor :: Table a  ->  IO (Color)
tableColor = groupColor
tableSetColor :: Table a  -> Color ->  IO (())
tableSetColor = groupSetColor
tableSetColorWithBgSel :: Table a  -> Color -> Color ->  IO (())
tableSetColorWithBgSel = groupSetColorWithBgSel
tableSelectionColor :: Table a  ->  IO (Color)
tableSelectionColor = groupSelectionColor
tableSetSelectionColor :: Table a  -> Color ->  IO (())
tableSetSelectionColor = groupSetSelectionColor
tableLabel :: Table a  ->  IO (String)
tableLabel = groupLabel
tableCopyLabel :: Table a  -> String ->  IO (())
tableCopyLabel = groupCopyLabel
tableSetLabel :: Table a  -> String ->  IO (())
tableSetLabel = groupSetLabel
tableLabeltype :: Table a  ->  IO (Labeltype)
tableLabeltype = groupLabeltype
tableSetLabeltype :: Table a  -> Labeltype ->  IO (())
tableSetLabeltype = groupSetLabeltype
tableLabelcolor :: Table a  ->  IO (Color)
tableLabelcolor = groupLabelcolor
tableSetLabelcolor :: Table a  -> Color ->  IO (())
tableSetLabelcolor = groupSetLabelcolor
tableLabelfont :: Table a  ->  IO (Font)
tableLabelfont = groupLabelfont
tableSetLabelfont :: Table a  -> Font ->  IO (())
tableSetLabelfont = groupSetLabelfont
tableLabelsize :: Table a  ->  IO (FontSize)
tableLabelsize = groupLabelsize
tableSetLabelsize :: Table a  -> FontSize ->  IO (())
tableSetLabelsize = groupSetLabelsize
tableImage :: Table a  ->  IO (Image ())
tableImage = groupImage
tableSetImage :: Table a  -> Image b ->  IO (())
tableSetImage = groupSetImage
tableDeimage :: Table a  ->  IO (Image ())
tableDeimage = groupDeimage
tableSetDeimage :: Table a  -> Image b ->  IO (())
tableSetDeimage = groupSetDeimage
tableTooltip :: Table a  ->  IO (String)
tableTooltip = groupTooltip
tableCopyTooltip :: Table a  -> String ->  IO (())
tableCopyTooltip = groupCopyTooltip
tableSetTooltip :: Table a  -> String ->  IO (())
tableSetTooltip = groupSetTooltip
tableWhen :: Table a  ->  IO (When)
tableWhen = groupWhen
tableSetWhen :: Table a  -> Word8 ->  IO (())
tableSetWhen = groupSetWhen
tableVisible :: Table a  ->  IO (Int)
tableVisible = groupVisible
tableVisibleR :: Table a  ->  IO (Int)
tableVisibleR = groupVisibleR
tableShow :: Table a  ->  IO (())
tableShow = groupShow
tableHide :: Table a  ->  IO (())
tableHide = groupHide
tableSetVisible :: Table a  ->  IO (())
tableSetVisible = groupSetVisible
tableClearVisible :: Table a  ->  IO (())
tableClearVisible = groupClearVisible
tableActive :: Table a  ->  IO (Int)
tableActive = groupActive
tableActiveR :: Table a  ->  IO (Int)
tableActiveR = groupActiveR
tableActivate :: Table a  ->  IO (())
tableActivate = groupActivate
tableDeactivate :: Table a  ->  IO (())
tableDeactivate = groupDeactivate
tableOutput :: Table a  ->  IO (Int)
tableOutput = groupOutput
tableSetOutput :: Table a  ->  IO (())
tableSetOutput = groupSetOutput
tableClearOutput :: Table a  ->  IO (())
tableClearOutput = groupClearOutput
tableTakesevents :: Table a  ->  IO (Int)
tableTakesevents = groupTakesevents
tableSetChanged :: Table a  ->  IO (())
tableSetChanged = groupSetChanged
tableClearChanged :: Table a  ->  IO (())
tableClearChanged = groupClearChanged
tableTakeFocus :: Table a  ->  IO (Int)
tableTakeFocus = groupTakeFocus
tableSetVisibleFocus :: Table a  ->  IO (())
tableSetVisibleFocus = groupSetVisibleFocus
tableClearVisibleFocus :: Table a  ->  IO (())
tableClearVisibleFocus = groupClearVisibleFocus
tableModifyVisibleFocus :: Table a  -> Int ->  IO (())
tableModifyVisibleFocus = groupModifyVisibleFocus
tableVisibleFocus :: Table a  ->  IO (Int)
tableVisibleFocus = groupVisibleFocus
tableContains :: Table a  -> Group b  ->  IO (Int)
tableContains = groupContains
tableInside :: Table a  -> Group b  ->  IO (Int)
tableInside = groupInside
tableRedraw :: Table a  ->  IO (())
tableRedraw = groupRedraw
tableRedrawLabel :: Table a  ->  IO (())
tableRedrawLabel = groupRedrawLabel
tableDamage :: Table a  ->  IO (Word8)
tableDamage = groupDamage
tableClearDamageWithBitmask :: Table a  -> Word8 ->  IO (())
tableClearDamageWithBitmask = groupClearDamageWithBitmask
tableClearDamage :: Table a  ->  IO (())
tableClearDamage = groupClearDamage
tableDamageWithText :: Table a  -> Word8 ->  IO (())
tableDamageWithText = groupDamageWithText
tableDamageInsideWidget :: Table a  -> Word8 -> Rectangle ->  IO (())
tableDamageInsideWidget = groupDamageInsideWidget
tableMeasureLabel :: Table a  -> IO (Size)
tableMeasureLabel = groupMeasureLabel
tableWindow :: Table a  ->  IO (Window ())
tableWindow = groupWindow
tableTopWindow :: Table a  ->  IO (Window ())
tableTopWindow = groupTopWindow
tableTopWindowOffset :: Table a -> IO (Position)
tableTopWindowOffset = groupTopWindowOffset
tableSetCallback :: Table a -> (Group b -> IO ()) -> IO (())
tableSetCallback = groupSetCallback
tableRemoveIndex :: Table a  -> Int ->  IO (())
tableRemoveIndex = groupRemoveIndex
tableRemoveWidget :: Table b -> Widget a  ->  IO (())
tableRemoveWidget = groupRemoveWidget
tableSetResizable :: Table b -> Widget a  ->  IO (())
tableSetResizable = groupSetResizable
tableResizable :: Table a  ->  IO (Widget ())
tableResizable = groupResizable
tableAddResizable :: Table b  -> Widget a  ->  IO (())
tableAddResizable = groupAddResizable
tableSetClipChildren :: Table a  -> Int ->  IO (())
tableSetClipChildren = groupSetClipChildren
tableClipChildren :: Table a  ->  IO (Int)
tableClipChildren = groupClipChildren
tableFocus :: Group b -> Widget a  ->  IO (())
tableFocus = groupFocus
tableDdfdesignKludge :: Table a  ->  IO (Widget ())
tableDdfdesignKludge = groupDdfdesignKludge
tableInsertWithBefore :: Group b -> Widget a  -> Widget c  ->  IO (())
tableInsertWithBefore = groupInsertWithBefore
{# fun Fl_Table_set_table_box as setTableBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
tableSetTableBox :: Table a -> Boxtype ->  IO ()
tableSetTableBox table val = withObject table $ \tablePtr -> setTableBox' tablePtr val
{# fun unsafe Fl_Table_table_box as tableBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
tableTableBox :: Table a  ->  IO (Boxtype)
tableTableBox table = withObject table $ \tablePtr -> tableBox' tablePtr
{# fun Fl_Table_set_rows as setRows' { id `Ptr ()',`Int' } -> `()' #}
tableSetRows :: Table a  -> Int ->  IO ()
tableSetRows table val = withObject table $ \tablePtr -> setRows' tablePtr val
{# fun unsafe Fl_Table_rows as rows' { id `Ptr ()' } -> `Int' #}
tableRows :: Table a  ->  IO (Int)
tableRows table = withObject table $ \tablePtr -> rows' tablePtr
{# fun Fl_Table_set_cols as setCols' { id `Ptr ()',`Int' } -> `()' #}
tableSetCols :: Table a  -> Int ->  IO ()
tableSetCols table val = withObject table $ \tablePtr -> setCols' tablePtr val
{# fun unsafe Fl_Table_cols as cols' { id `Ptr ()' } -> `Int' #}
tableCols :: Table a  ->  IO (Int)
tableCols table = withObject table $ \tablePtr -> cols' tablePtr
{# fun Fl_Table_set_visible_cells as setVisibleCells' { id `Ptr ()',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt',id `Ptr CInt' } -> `()' #}
tableSetVisibleCells :: Table a  -> Ptr CInt -> Ptr CInt -> Ptr CInt -> Ptr CInt ->  IO ()
tableSetVisibleCells table r1 r2 c1 c2 = withObject table $ \tablePtr -> setVisibleCells' tablePtr r1 r2 c1 c2
{# fun unsafe Fl_Table_is_interactive_resize as isInteractiveResize' { id `Ptr ()' } -> `Int' #}
tableIsInteractiveResize :: Table a  ->  IO (Int)
tableIsInteractiveResize table = withObject table $ \tablePtr -> isInteractiveResize' tablePtr
{# fun unsafe Fl_Table_row_resize as rowResize' { id `Ptr ()' } -> `Int' #}
tableRowResize :: Table a  ->  IO (Int)
tableRowResize table = withObject table $ \tablePtr -> rowResize' tablePtr
{# fun Fl_Table_set_row_resize as setRowResize' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowResize :: Table a  -> Bool ->  IO ()
tableSetRowResize table flag = withObject table $ \tablePtr -> setRowResize' tablePtr (cFromBool flag)
{# fun unsafe Fl_Table_col_resize as colResize' { id `Ptr ()' } -> `Int' #}
tableColResize :: Table a  ->  IO (Int)
tableColResize table = withObject table $ \tablePtr -> colResize' tablePtr
{# fun Fl_Table_set_col_resize as setColResize' { id `Ptr ()',`Int' } -> `()' #}
tableSetColResize :: Table a  -> Bool ->  IO ()
tableSetColResize table flag = withObject table $ \tablePtr -> setColResize' tablePtr (cFromBool flag)
{# fun unsafe Fl_Table_col_resize_min as colResizeMin' { id `Ptr ()' } -> `Int' #}
tableColResizeMin :: Table a  ->  IO (Int)
tableColResizeMin table = withObject table $ \tablePtr -> colResizeMin' tablePtr
{# fun Fl_Table_set_col_resize_min as setColResizeMin' { id `Ptr ()',`Int' } -> `()' #}
tableSetColResizeMin :: Table a  -> Int ->  IO ()
tableSetColResizeMin table val = withObject table $ \tablePtr -> setColResizeMin' tablePtr val
{# fun unsafe Fl_Table_row_resize_min as rowResizeMin' { id `Ptr ()' } -> `Int' #}
tableRowResizeMin :: Table a  ->  IO (Int)
tableRowResizeMin table = withObject table $ \tablePtr -> rowResizeMin' tablePtr
{# fun Fl_Table_set_row_resize_min as setRowResizeMin' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowResizeMin :: Table a  -> Int ->  IO ()
tableSetRowResizeMin table val = withObject table $ \tablePtr -> setRowResizeMin' tablePtr val
{# fun unsafe Fl_Table_row_header as rowHeader' { id `Ptr ()' } -> `Int' #}
tableRowHeader :: Table a  ->  IO (Int)
tableRowHeader table = withObject table $ \tablePtr -> rowHeader' tablePtr
{# fun Fl_Table_set_row_header as setRowHeader' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowHeader :: Table a  -> Bool ->  IO ()
tableSetRowHeader table flag = withObject table $ \tablePtr -> setRowHeader' tablePtr (cFromBool flag)
{# fun unsafe Fl_Table_col_header as colHeader' { id `Ptr ()' } -> `Int' #}
tableColHeader :: Table a  ->  IO (Int)
tableColHeader table = withObject table $ \tablePtr -> colHeader' tablePtr
{# fun Fl_Table_set_col_header as setColHeader' { id `Ptr ()',`Int' } -> `()' #}
tableSetColHeader :: Table a  -> Bool ->  IO ()
tableSetColHeader table flag = withObject table $ \tablePtr -> setColHeader' tablePtr (cFromBool flag)
{# fun Fl_Table_set_col_header_height as setColHeaderHeight' { id `Ptr ()',`Int' } -> `()' #}
tableSetColHeaderHeight :: Table a  -> Int ->  IO ()
tableSetColHeaderHeight table height = withObject table $ \tablePtr -> setColHeaderHeight' tablePtr height
{# fun unsafe Fl_Table_col_header_height as colHeaderHeight' { id `Ptr ()' } -> `Int' #}
tableColHeaderHeight :: Table a  ->  IO (Int)
tableColHeaderHeight table = withObject table $ \tablePtr -> colHeaderHeight' tablePtr
{# fun Fl_Table_set_row_header_width as setRowHeaderWidth' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowHeaderWidth :: Table a  -> Int ->  IO ()
tableSetRowHeaderWidth table width = withObject table $ \tablePtr -> setRowHeaderWidth' tablePtr width
{# fun unsafe Fl_Table_row_header_width as rowHeaderWidth' { id `Ptr ()' } -> `Int' #}
tableRowHeaderWidth :: Table a  ->  IO (Int)
tableRowHeaderWidth table = withObject table $ \tablePtr -> rowHeaderWidth' tablePtr
{# fun Fl_Table_set_row_header_color as setRowHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
tableSetRowHeaderColor :: Table a  -> Color ->  IO ()
tableSetRowHeaderColor table val = withObject table $ \tablePtr -> setRowHeaderColor' tablePtr val
{# fun unsafe Fl_Table_row_header_color as rowHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
tableRowHeaderColor :: Table a  ->  IO (Color)
tableRowHeaderColor table = withObject table $ \tablePtr -> rowHeaderColor' tablePtr
{# fun Fl_Table_set_col_header_color as setColHeaderColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
tableSetColHeaderColor :: Table a  -> Color ->  IO ()
tableSetColHeaderColor table val = withObject table $ \tablePtr -> setColHeaderColor' tablePtr val
{# fun unsafe Fl_Table_col_header_color as colHeaderColor' { id `Ptr ()' } -> `Color' cToColor #}
tableColHeaderColor :: Table a  ->  IO (Color)
tableColHeaderColor table = withObject table $ \tablePtr -> colHeaderColor' tablePtr
{# fun Fl_Table_set_row_height as setRowHeight' { id `Ptr ()',`Int',`Int' } -> `()' #}
tableSetRowHeight :: Table a  -> Int -> Int ->  IO ()
tableSetRowHeight table row height = withObject table $ \tablePtr -> setRowHeight' tablePtr row height
{# fun unsafe Fl_Table_row_height as rowHeight' { id `Ptr ()',`Int' } -> `Int' #}
tableRowHeight :: Table a  -> Int ->  IO (Int)
tableRowHeight table row = withObject table $ \tablePtr -> rowHeight' tablePtr row
{# fun Fl_Table_set_col_width as setColWidth' { id `Ptr ()',`Int',`Int' } -> `()' #}
tableSetColWidth :: Table a  -> Int -> Int ->  IO ()
tableSetColWidth table col width = withObject table $ \tablePtr -> setColWidth' tablePtr col width
{# fun unsafe Fl_Table_col_width as colWidth' { id `Ptr ()',`Int' } -> `Int' #}
tableColWidth :: Table a  -> Int ->  IO (Int)
tableColWidth table col = withObject table $ \tablePtr -> colWidth' tablePtr col
{# fun Fl_Table_set_row_height_all as setRowHeightAll' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowHeightAll :: Table a  -> Int ->  IO ()
tableSetRowHeightAll table height = withObject table $ \tablePtr -> setRowHeightAll' tablePtr height
{# fun Fl_Table_set_col_width_all as setColWidthAll' { id `Ptr ()',`Int' } -> `()' #}
tableSetColWidthAll :: Table a  -> Int ->  IO ()
tableSetColWidthAll table width = withObject table $ \tablePtr -> setColWidthAll' tablePtr width
{# fun Fl_Table_set_row_position as setRowPosition' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowPosition :: Table a  -> Int ->  IO ()
tableSetRowPosition table row = withObject table $ \tablePtr -> setRowPosition' tablePtr row
{# fun Fl_Table_set_col_position as setColPosition' { id `Ptr ()',`Int' } -> `()' #}
tableSetColPosition :: Table a  -> Int ->  IO ()
tableSetColPosition table col = withObject table $ \tablePtr -> setColPosition' tablePtr col
{# fun unsafe Fl_Table_row_position as rowPosition' { id `Ptr ()' } -> `Int' #}
tableRowPosition :: Table a  ->  IO (Int)
tableRowPosition table = withObject table $ \tablePtr -> rowPosition' tablePtr
{# fun unsafe Fl_Table_col_position as colPosition' { id `Ptr ()' } -> `Int' #}
tableColPosition :: Table a  ->  IO (Int)
tableColPosition table = withObject table $ \tablePtr -> colPosition' tablePtr
{# fun Fl_Table_set_top_row as setTopRow' { id `Ptr ()',`Int' } -> `()' #}
tableSetTopRow :: Table a  -> Int ->  IO ()
tableSetTopRow table row = withObject table $ \tablePtr -> setTopRow' tablePtr row
{# fun unsafe Fl_Table_top_row as topRow' { id `Ptr ()' } -> `Int' #}
tableTopRow :: Table a  ->  IO (Int)
tableTopRow table = withObject table $ \tablePtr -> topRow' tablePtr
{# fun unsafe Fl_Table_is_selected as isSelected' { id `Ptr ()',`Int',`Int' } -> `Int' #}
tableIsSelected :: Table a  -> Int -> Int ->  IO (Int)
tableIsSelected table r c = withObject table $ \tablePtr -> isSelected' tablePtr r c
{# fun unsafe Fl_Table_get_selection as getSelection' { id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
tableGetSelection :: Table a  -> IO (Position, Position)
tableGetSelection table = 
    withObject table $ \tablePtr -> 
        getSelection' tablePtr >>= \(rt, cl, rb, cr) -> 
            return $ (Position (X rt) (Y cl), Position (X rb) (Y cr))
{# fun Fl_Table_set_selection as setSelection' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
tableSetSelection :: Table a  -> Int -> Int -> Int -> Int ->  IO ()
tableSetSelection table row_top col_left row_bot col_right = withObject table $ \tablePtr -> setSelection' tablePtr row_top col_left row_bot col_right
{# fun unsafe Fl_Table_move_cursor as moveCursor' { id `Ptr ()',`Int',`Int' } -> `Int' #}
tableMoveCursor :: Table a  -> Int -> Int ->  IO (Int)
tableMoveCursor table r c = withObject table $ \tablePtr -> moveCursor' tablePtr r c
{# fun unsafe Fl_Table_init_sizes as initSizes' { id `Ptr ()' } -> `()' #}
tableInitSizes :: Table a  ->  IO ()
tableInitSizes table = withObject table $ \tablePtr -> initSizes' tablePtr
{# fun unsafe Fl_Table_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' #}
tableAdd :: Table a  -> Widget b  ->  IO ()
tableAdd table wgt = withObject table $ \tablePtr -> withObject wgt $ \wgtPtr -> add' tablePtr wgtPtr
{# fun unsafe Fl_Table_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
tableInsert :: Table a  -> Widget b  -> Int ->  IO ()
tableInsert table wgt n = withObject table $ \tablePtr -> withObject wgt $ \wgtPtr -> insert' tablePtr wgtPtr n
{# fun unsafe Fl_Table_insert_with_widget as insertWithWidget' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' #}
tableInsertWithWidget :: Table a  -> Widget b  -> Widget c  ->  IO ()
tableInsertWithWidget table wgt w2 = withObject table $ \tablePtr -> withObject wgt $ \wgtPtr -> withObject w2 $ \w2Ptr -> insertWithWidget' tablePtr wgtPtr w2Ptr
{# fun unsafe Fl_Table_begin as begin' { id `Ptr ()' } -> `()' #}
tableBegin :: Table a  ->  IO ()
tableBegin table = withObject table $ \tablePtr -> begin' tablePtr
{# fun unsafe Fl_Table_end as end' { id `Ptr ()' } -> `()' #}
tableEnd :: Table a  ->  IO ()
tableEnd table = withObject table $ \tablePtr -> end' tablePtr
{# fun unsafe Fl_Table_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id #}
tableArray :: Table a  ->  IO [Widget ()]
tableArray table = withObject table $ \tablePtr -> do
                     childArrayPtr <- array' tablePtr
                     numChildren <- tableChildren table
                     arrayToObjects childArrayPtr numChildren
{# fun unsafe Fl_Table_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
tableChild :: Table a  -> Int ->  IO (Widget ())
tableChild table n = withObject table $ \tablePtr -> child' tablePtr n >>= toObject
{# fun unsafe Fl_Table_children as children' { id `Ptr ()' } -> `Int' #}
tableChildren :: Table a  ->  IO (Int)
tableChildren table = withObject table $ \tablePtr -> children' tablePtr
{# fun unsafe Fl_Table_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
tableFind :: Table a  -> Widget b  ->  IO (Int)
tableFind table wgt = withObject table $ \tablePtr -> withObject wgt $ \wgtPtr -> find' tablePtr wgtPtr
{# fun unsafe Fl_Table_callback_row as callbackRow' { id `Ptr ()' } -> `Int' #}
tableCallbackRow :: Table a  ->  IO (Int)
tableCallbackRow table = withObject table $ \tablePtr -> callbackRow' tablePtr
{# fun unsafe Fl_Table_callback_col as callbackCol' { id `Ptr ()' } -> `Int' #}
tableCallbackCol :: Table a  ->  IO (Int)
tableCallbackCol table = withObject table $ \tablePtr -> callbackCol' tablePtr
{# fun unsafe Fl_Table_callback_context as callbackContext' { id `Ptr ()' } -> `TableContext' cToEnum #}
tableCallbackContext :: Table a  ->  IO (TableContext)
tableCallbackContext table = withObject table $ \tablePtr -> callbackContext' tablePtr
{# fun unsafe Fl_Table_do_callback as doCallback' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int' } -> `()' #}
tableDoCallback :: Table a  -> TableContext -> Int -> Int ->  IO ()
tableDoCallback table tablecontext row col = withObject table $ \tablePtr -> doCallback' tablePtr tablecontext row col
{# fun unsafe Fl_Table_find_cell as findCell' { id `Ptr ()',cFromEnum `TableContext',`Int',`Int',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `CInt' id #}
tableFindCell :: Table a  -> TableContext -> Int -> Int -> IO (Maybe Rectangle)
tableFindCell table context r c  = 
    withObject table $ \tablePtr -> 
        findCell' tablePtr context r c >>= \(result, x_pos', y_pos', width', height') -> 
            if (cToBool result)
            then return $ Just $ toRectangle (x_pos', y_pos', width', height')
            else return $ Nothing
{# fun Fl_Table_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
tableDrawSuper :: Table a  ->  IO ()
tableDrawSuper table = withObject table $ \tablePtr -> drawSuper' tablePtr
{# fun Fl_Table_draw as draw' { id `Ptr ()' } -> `()' #}
tableDraw :: Table a  ->  IO ()
tableDraw table = withObject table $ \tablePtr -> draw' tablePtr                       
{# fun unsafe Fl_Table_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
tableHandle :: Table a  -> Int ->  IO (Int)
tableHandle table event = withObject table $ \tablePtr -> handle' tablePtr event                               
{# fun unsafe Fl_Table_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
tableResizeSuper :: Table a  -> Rectangle ->  IO ()
tableResizeSuper table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withObject table $ \tablePtr -> resizeSuper' tablePtr x_pos' y_pos' width' height'                          
{# fun unsafe Fl_Table_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
tableResize :: Table a  -> Rectangle ->  IO ()
tableResize table rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withObject table $ \tablePtr -> resize' tablePtr x_pos' y_pos' width' height'                                                                           
{# fun unsafe Fl_Table_clear_super as clearSuper' { id `Ptr ()' } -> `()' #}
tableClearSuper :: Table a  ->  IO ()
tableClearSuper table = withObject table $ \tablePtr -> clearSuper' tablePtr                                                                      
{# fun unsafe Fl_Table_clear as clear' { id `Ptr ()' } -> `()' #}
tableClear :: Table a  ->  IO ()
tableClear table = withObject table $ \tablePtr -> clear' tablePtr                        
{# fun unsafe Fl_Table_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Ptr ()' id #}
tableAsGroupSuper :: Table a  ->  IO (Group ())
tableAsGroupSuper table = withObject table $ \tablePtr -> asGroupSuper' tablePtr >>= toObject                      
{# fun unsafe Fl_Table_as_group as asGroup' { id `Ptr ()' } -> `Ptr ()' id #}
tableAsGroup :: Table a  ->  IO (Group ())
tableAsGroup table = withObject table $ \tablePtr -> asGroup' tablePtr >>= toObject                          
{# fun unsafe Fl_Table_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `Ptr ()' id #}
tableAsGlWindowSuper :: Table a  ->  IO (GlWindow ())
tableAsGlWindowSuper table = withObject table $ \tablePtr -> asGlWindowSuper' tablePtr >>= toObject                     
{# fun unsafe Fl_Table_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Ptr ()' id #}
tableAsGlWindow :: Table a  ->  IO (GlWindow ())
tableAsGlWindow table = withObject table $ \tablePtr -> asGlWindow' tablePtr >>= toObject                             
{# fun Fl_Table_set_rows_super as setRowsSuper' { id `Ptr ()',`Int' } -> `()' #}
tableSetRowsSuper :: Table a  -> Int ->  IO ()
tableSetRowsSuper table val = withObject table $ \tablePtr -> setRowsSuper' tablePtr val                        
{# fun Fl_Table_set_cols_super as setColsSuper' { id `Ptr ()',`Int' } -> `()' #}
tableSetColsSuper :: Table a  -> Int ->  IO ()
tableSetColsSuper table val = withObject table $ \tablePtr -> setColsSuper' tablePtr val                         
                              
