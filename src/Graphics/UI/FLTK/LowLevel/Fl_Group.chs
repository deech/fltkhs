{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Group
    (
     groupNew,
     groupDestroy,
     -- * Inherited from Fl_Widget
     groupHandle,
     groupParent,
     groupSetParent,
     groupType_,
     groupSetType,
     groupDrawLabel,
     groupX,
     groupY,
     groupW,
     groupH,
     groupSetAlign,
     groupAlign,
     groupBox,
     groupSetBox,
     groupColor,
     groupSetColor,
     groupSetColorWithBgSel,
     groupSelectionColor,
     groupSetSelectionColor,
     groupLabel,
     groupCopyLabel,
     groupSetLabel,
     groupLabeltype,
     groupSetLabeltype,
     groupLabelcolor,
     groupSetLabelcolor,
     groupLabelfont,
     groupSetLabelfont,
     groupLabelsize,
     groupSetLabelsize,
     groupImage,
     groupSetImage,
     groupDeimage,
     groupSetDeimage,
     groupTooltip,
     groupCopyTooltip,
     groupSetTooltip,
     groupWhen,
     groupSetWhen,
     groupVisible,
     groupVisibleR,
     groupShowSuper,
     groupShow,
     groupHideSuper,
     groupHide,
     groupSetVisible,
     groupClearVisible,
     groupActive,
     groupActiveR,
     groupActivate,
     groupDeactivate,
     groupOutput,
     groupSetOutput,
     groupClearOutput,
     groupTakesevents,
     groupSetChanged,
     groupClearChanged,
     groupTakeFocus,
     groupSetVisibleFocus,
     groupClearVisibleFocus,
     groupModifyVisibleFocus,
     groupVisibleFocus,
     groupContains,
     groupInside,
     groupRedraw,
     groupRedrawLabel,
     groupDamage,
     groupClearDamageWithBitmask,
     groupClearDamage,
     groupDamageWithText,
     groupDamageInsideWidget,
     groupMeasureLabel,
     groupWindow,
     groupTopWindow,
     groupTopWindowOffset,
     groupAsGroupSuper,
     groupAsGroup,
     groupAsGlWindowSuper,
     groupAsGlWindow,
     groupResizeSuper,
     groupResize,
     groupSetCallback,
     -- * Fl_Group specific
     groupBegin,
     groupEnd,
     groupFind,
     groupAdd,
     groupInsert,
     groupRemoveIndex,
     groupRemoveWidget,
     groupClear,
     groupSetResizable,
     groupResizable,
     groupAddResizable,
     groupInitSizes,
     groupChildren,
     groupSetClipChildren,
     groupClipChildren,
     groupFocus,
     groupDdfdesignKludge,
     groupInsertWithBefore,
     groupArray,
     groupChild
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
{# fun Fl_Group_New as groupNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Group_New_WithLabel as groupNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
groupNew :: Rectangle -> Maybe String -> IO (Group ())
groupNew rectangle label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case label' of
        (Just l') -> groupNewWithLabel' x_pos y_pos width height l' >>= toObject
        Nothing -> groupNew' x_pos y_pos width height >>= toObject
{# fun Fl_Group_Destroy as groupDestroy' { id `Ptr ()' } -> `()' #}
groupDestroy :: Group a -> IO ()
groupDestroy group = withObject group $ \groupPtr -> groupDestroy' groupPtr
groupHandle :: Group a -> Event -> IO Int
groupHandle = widgetHandle

groupParent :: Group a -> IO (Group ())
groupParent = widgetParent


groupSetParent :: Group a -> Group b -> IO ()
groupSetParent = widgetSetParent


groupType_ :: Group a  ->  IO (Word8)
groupType_ = widgetType_


groupSetType :: Group a  -> Word8 ->  IO (())
groupSetType = widgetSetType


groupDrawLabel :: Group a  -> Maybe (Rectangle,AlignType)->  IO (())
groupDrawLabel = widgetDrawLabel


groupX :: Group a  ->  IO (Int)
groupX = widgetX


groupY :: Group a  ->  IO (Int)
groupY = widgetY


groupW :: Group a  ->  IO (Int)
groupW = widgetW


groupH :: Group a  ->  IO (Int)
groupH = widgetH


groupSetAlign :: Group a  -> AlignType ->  IO (())
groupSetAlign = widgetSetAlign

groupAlign :: Group a  ->  IO (AlignType)
groupAlign = widgetAlign


groupBox :: Group a  ->  IO (Boxtype)
groupBox = widgetBox


groupSetBox :: Group a  -> Boxtype ->  IO (())
groupSetBox = widgetSetBox


groupColor :: Group a  ->  IO (Color)
groupColor = widgetColor


groupSetColor :: Group a  -> Color ->  IO (())
groupSetColor = widgetSetColor


groupSetColorWithBgSel :: Group a  -> Color -> Color ->  IO (())
groupSetColorWithBgSel = widgetSetColorWithBgSel


groupSelectionColor :: Group a  ->  IO (Color)
groupSelectionColor = widgetSelectionColor


groupSetSelectionColor :: Group a  -> Color ->  IO (())
groupSetSelectionColor = widgetSetSelectionColor


groupLabel :: Group a  ->  IO (String)
groupLabel = widgetLabel


groupCopyLabel :: Group a  -> String ->  IO (())
groupCopyLabel = widgetCopyLabel


groupSetLabel :: Group a  -> String ->  IO (())
groupSetLabel = widgetSetLabel


groupLabeltype :: Group a  ->  IO (Labeltype)
groupLabeltype = widgetLabeltype


groupSetLabeltype :: Group a  -> Labeltype ->  IO (())
groupSetLabeltype = widgetSetLabeltype


groupLabelcolor :: Group a  ->  IO (Color)
groupLabelcolor = widgetLabelcolor


groupSetLabelcolor :: Group a  -> Color ->  IO (())
groupSetLabelcolor = widgetSetLabelcolor


groupLabelfont :: Group a  ->  IO (Font)
groupLabelfont = widgetLabelfont


groupSetLabelfont :: Group a  -> Font ->  IO (())
groupSetLabelfont = widgetSetLabelfont


groupLabelsize :: Group a  ->  IO (FontSize)
groupLabelsize = widgetLabelsize


groupSetLabelsize :: Group a  -> FontSize ->  IO (())
groupSetLabelsize = widgetSetLabelsize


groupImage :: Group a  ->  IO (Image ())
groupImage = widgetImage


groupSetImage :: Group a  -> Image b ->  IO (())
groupSetImage = widgetSetImage


groupDeimage :: Group a  ->  IO (Image ())
groupDeimage = widgetDeimage


groupSetDeimage :: Group a  -> Image b ->  IO (())
groupSetDeimage = widgetSetDeimage


groupTooltip :: Group a  ->  IO (String)
groupTooltip = widgetTooltip


groupCopyTooltip :: Group a  -> String ->  IO (())
groupCopyTooltip = widgetCopyTooltip


groupSetTooltip :: Group a  -> String ->  IO (())
groupSetTooltip = widgetSetTooltip


groupWhen :: Group a  ->  IO (When)
groupWhen = widgetWhen


groupSetWhen :: Group a  -> Word8 ->  IO (())
groupSetWhen = widgetSetWhen


groupVisible :: Group a  ->  IO (Int)
groupVisible = widgetVisible


groupVisibleR :: Group a  ->  IO (Int)
groupVisibleR = widgetVisibleR


groupShowSuper :: Group a  ->  IO (())
groupShowSuper = widgetShowSuper


groupShow :: Group a  ->  IO (())
groupShow = widgetShow


groupHideSuper :: Group a  ->  IO (())
groupHideSuper = widgetHideSuper


groupHide :: Group a  ->  IO (())
groupHide = widgetHide


groupSetVisible :: Group a  ->  IO (())
groupSetVisible = widgetSetVisible


groupClearVisible :: Group a  ->  IO (())
groupClearVisible = widgetClearVisible


groupActive :: Group a  ->  IO (Int)
groupActive = widgetActive


groupActiveR :: Group a  ->  IO (Int)
groupActiveR = widgetActiveR


groupActivate :: Group a  ->  IO (())
groupActivate = widgetActivate


groupDeactivate :: Group a  ->  IO (())
groupDeactivate = widgetDeactivate


groupOutput :: Group a  ->  IO (Int)
groupOutput = widgetOutput


groupSetOutput :: Group a  ->  IO (())
groupSetOutput = widgetSetOutput


groupClearOutput :: Group a  ->  IO (())
groupClearOutput = widgetClearOutput


groupTakesevents :: Group a  ->  IO (Int)
groupTakesevents = widgetTakesevents


groupSetChanged :: Group a  ->  IO (())
groupSetChanged = widgetSetChanged


groupClearChanged :: Group a  ->  IO (())
groupClearChanged = widgetClearChanged


groupTakeFocus :: Group a  ->  IO (Int)
groupTakeFocus = widgetTakeFocus


groupSetVisibleFocus :: Group a  ->  IO (())
groupSetVisibleFocus = widgetSetVisibleFocus


groupClearVisibleFocus :: Group a  ->  IO (())
groupClearVisibleFocus = widgetClearVisibleFocus


groupModifyVisibleFocus :: Group a  -> Int ->  IO (())
groupModifyVisibleFocus = widgetModifyVisibleFocus


groupVisibleFocus :: Group a  ->  IO (Int)
groupVisibleFocus = widgetVisibleFocus


groupContains :: Group a  -> Group a  ->  IO (Int)
groupContains = widgetContains


groupInside :: Group a  -> Group a  ->  IO (Int)
groupInside = widgetInside


groupRedraw :: Group a  ->  IO (())
groupRedraw = widgetRedraw


groupRedrawLabel :: Group a  ->  IO (())
groupRedrawLabel = widgetRedrawLabel


groupDamage :: Group a  ->  IO (Word8)
groupDamage = widgetDamage


groupClearDamageWithBitmask :: Group a  -> Word8 ->  IO (())
groupClearDamageWithBitmask = widgetClearDamageWithBitmask


groupClearDamage :: Group a  ->  IO (())
groupClearDamage = widgetClearDamage


groupDamageWithText :: Group a  -> Word8 ->  IO (())
groupDamageWithText = widgetDamageWithText


groupDamageInsideWidget :: Group a  -> Word8 -> Rectangle ->  IO (())
groupDamageInsideWidget = widgetDamageInsideWidget


groupMeasureLabel :: Group a  -> IO (Size)
groupMeasureLabel = widgetMeasureLabel


groupWindow :: Group a  ->  IO (Window ())
groupWindow = widgetWindow


groupTopWindow :: Group a  ->  IO (Window ())
groupTopWindow = widgetTopWindow


groupTopWindowOffset :: Group a -> IO (Position)
groupTopWindowOffset = widgetTopWindowOffset


groupAsGroupSuper :: Group a  ->  IO (Group ())
groupAsGroupSuper = widgetAsGroupSuper


groupAsGroup :: Group a  ->  IO (Group ())
groupAsGroup = widgetAsGroup


groupAsGlWindowSuper :: Group a  ->  IO (GlWindow ())
groupAsGlWindowSuper = widgetAsGlWindowSuper


groupAsGlWindow :: Group a  ->  IO (GlWindow ())
groupAsGlWindow = widgetAsGlWindow


groupResizeSuper :: Group a  -> Rectangle ->  IO (())
groupResizeSuper = widgetResizeSuper


groupResize :: Group a  -> Rectangle -> IO (())
groupResize = widgetResize


groupSetCallback :: Group a -> (WidgetCallback b) -> IO (())
groupSetCallback = widgetSetCallback

{# fun Fl_Group_begin as begin' { id `Ptr ()' } -> `()' #}
groupBegin :: Group a  ->  IO (())
groupBegin group = withObject group $ \groupPtr -> begin' groupPtr

{# fun Fl_Group_end as end' { id `Ptr ()' } -> `()' #}
groupEnd :: Group a  ->  IO (())
groupEnd group = withObject group $ \groupPtr -> end' groupPtr

{# fun Fl_Group_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
groupFind :: Group a  -> Widget a  ->  IO (Int)
groupFind group w = withObject group $ \groupPtr -> withObject w $ \wPtr -> find' groupPtr wPtr

{# fun Fl_Group_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' #}
groupAdd :: Group a  -> Widget a  ->  IO (())
groupAdd group w = withObject group $ \groupPtr -> withObject w $ \wPtr -> add' groupPtr wPtr

{# fun Fl_Group_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
groupInsert :: Group a  -> Widget a  -> Int ->  IO (())
groupInsert group w i = withObject group $ \groupPtr -> withObject w $ \wPtr -> insert' groupPtr wPtr i

{# fun Fl_Group_remove_index as removeIndex' { id `Ptr ()',`Int' } -> `()' #}
groupRemoveIndex :: Group a  -> Int ->  IO (())
groupRemoveIndex group index = withObject group $ \groupPtr -> removeIndex' groupPtr index

{# fun Fl_Group_remove_widget as removeWidget' { id `Ptr ()',id `Ptr ()' } -> `()' #}
groupRemoveWidget :: Group a  -> Widget a  ->  IO (())
groupRemoveWidget group w = withObject group $ \groupPtr -> withObject w $ \wPtr -> removeWidget' groupPtr wPtr

{# fun Fl_Group_clear as clear' { id `Ptr ()' } -> `()' #}
groupClear :: Group a  ->  IO (())
groupClear group = withObject group $ \groupPtr -> clear' groupPtr

{# fun Fl_Group_set_resizable as setResizable' { id `Ptr ()',id `Ptr ()' } -> `()' #}
groupSetResizable :: Group a  -> Widget a  ->  IO (())
groupSetResizable group o = withObject group $ \groupPtr -> withObject o $ \oPtr -> setResizable' groupPtr oPtr

{# fun Fl_Group_resizable as resizable' { id `Ptr ()' } -> `Ptr ()' id #}
groupResizable :: Group a  ->  IO (Widget ())
groupResizable group = withObject group $ \groupPtr -> resizable' groupPtr >>= toObject

{# fun Fl_Group_add_resizable as addResizable' { id `Ptr ()',id `Ptr ()' } -> `()' #}
groupAddResizable :: Group a  -> Widget a  ->  IO (())
groupAddResizable group o = withObject group $ \groupPtr -> withObject o $ \oPtr -> addResizable' groupPtr oPtr

{# fun Fl_Group_init_sizes as initSizes' { id `Ptr ()' } -> `()' #}
groupInitSizes :: Group a  ->  IO (())
groupInitSizes group = withObject group $ \groupPtr -> initSizes' groupPtr

{# fun Fl_Group_children as children' { id `Ptr ()' } -> `Int' #}
groupChildren :: Group a  ->  IO (Int)
groupChildren group = withObject group $ \groupPtr -> children' groupPtr

{# fun Fl_Group_set_clip_children as setClipChildren' { id `Ptr ()',`Int' } -> `()' #}
groupSetClipChildren :: Group a  -> Int ->  IO (())
groupSetClipChildren group c = withObject group $ \groupPtr -> setClipChildren' groupPtr c

{# fun Fl_Group_clip_children as clipChildren' { id `Ptr ()' } -> `Int' #}
groupClipChildren :: Group a  ->  IO (Int)
groupClipChildren group = withObject group $ \groupPtr -> clipChildren' groupPtr

{# fun Fl_Group_focus as focus' { id `Ptr ()',id `Ptr ()' } -> `()' #}
groupFocus :: Group a  -> Widget a  ->  IO (())
groupFocus group w = withObject group $ \groupPtr -> withObject w $ \wPtr -> focus' groupPtr wPtr

{# fun Fl_Group__ddfdesign_kludge as ddfdesignKludge' { id `Ptr ()' } -> `Ptr ()' id #}
groupDdfdesignKludge :: Group a  ->  IO (Widget ())
groupDdfdesignKludge group = withObject group $ \groupPtr -> ddfdesignKludge' groupPtr >>= toObject

{# fun Fl_Group_insert_with_before as insertWithBefore' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' #}
groupInsertWithBefore :: Group a  -> Widget a  -> Widget a  ->  IO (())
groupInsertWithBefore self w before = withObject self $ \selfPtr -> withObject w $ \wPtr -> withObject before $ \beforePtr -> insertWithBefore' selfPtr wPtr beforePtr

{# fun Fl_Group_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id#}
groupArray :: Group a  ->  IO [Widget ()]
groupArray group = withObject group $ \groupPtr -> do
                    childArrayPtr <- array' groupPtr
                    numChildren <- groupChildren group
                    arrayToObjects childArrayPtr numChildren

{# fun Fl_Group_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
groupChild :: Group a  -> Int ->  IO (Widget ())
groupChild self n = withObject self $ \selfPtr -> child' selfPtr n >>= toObject
