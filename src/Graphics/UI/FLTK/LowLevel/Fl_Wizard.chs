{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Wizard
    (
     wizardNew,
     wizardDestroy,
     -- * Inherited from Fl_Widget
     wizardHandle,
     wizardParent,
     wizardSetParent,
     wizardType_,
     wizardSetType,
     wizardDrawLabel,
     wizardX,
     wizardY,
     wizardW,
     wizardH,
     wizardSetAlign,
     wizardAlign,
     wizardBox,
     wizardSetBox,
     wizardColor,
     wizardSetColor,
     wizardSetColorWithBgSel,
     wizardSelectionColor,
     wizardSetSelectionColor,
     wizardLabel,
     wizardCopyLabel,
     wizardSetLabel,
     wizardLabeltype,
     wizardSetLabeltype,
     wizardLabelcolor,
     wizardSetLabelcolor,
     wizardLabelfont,
     wizardSetLabelfont,
     wizardLabelsize,
     wizardSetLabelsize,
     wizardImage,
     wizardSetImage,
     wizardDeimage,
     wizardSetDeimage,
     wizardTooltip,
     wizardCopyTooltip,
     wizardSetTooltip,
     wizardWhen,
     wizardSetWhen,
     wizardVisible,
     wizardVisibleR,
     wizardShow,
     wizardHide,
     wizardSetVisible,
     wizardClearVisible,
     wizardActive,
     wizardActiveR,
     wizardActivate,
     wizardDeactivate,
     wizardOutput,
     wizardSetOutput,
     wizardClearOutput,
     wizardTakesevents,
     wizardSetChanged,
     wizardClearChanged,
     wizardTakeFocus,
     wizardSetVisibleFocus,
     wizardClearVisibleFocus,
     wizardModifyVisibleFocus,
     wizardVisibleFocus,
     wizardContains,
     wizardInside,
     wizardRedraw,
     wizardRedrawLabel,
     wizardDamage,
     wizardClearDamageWithBitmask,
     wizardClearDamage,
     wizardDamageWithText,
     wizardDamageInsideWidget,
     wizardMeasureLabel,
     wizardWindow,
     wizardTopWindow,
     wizardTopWindowOffset,
     wizardAsGroup,
     wizardAsGlWindow,
     wizardResize,
     wizardSetCallback,
     wizardBegin,
     wizardEnd,
     wizardFind,
     wizardAdd,
     wizardInsert,
     wizardRemoveIndex,
     wizardRemoveWidget,
     wizardClear,
     wizardSetResizable,
     wizardResizable,
     wizardAddResizable,
     wizardInitSizes,
     wizardChildren,
     wizardSetClipChildren,
     wizardClipChildren,
     wizardFocus,
     wizardDdfdesignKludge,
     wizardInsertWithBefore,
     wizardArray,
     wizardChild,
     -- * Fl_Wizard specific
     wizardPrev,
     wizardNext,
     wizardValue,
     wizardSetValue
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WizardC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Group
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Wizard_New as wizardNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Wizard_New_WithLabel as wizardNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
wizardNew :: Rectangle -> Maybe String -> IO (Wizard ())
wizardNew rectangle label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case label' of
        (Just l') -> wizardNewWithLabel' x_pos y_pos width height l' >>= toObject
        Nothing -> wizardNew' x_pos y_pos width height >>= toObject
{# fun Fl_Wizard_Destroy as wizardDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
wizardDestroy :: Wizard a -> IO ()
wizardDestroy wizard = withObject wizard $ \wizardPtr -> wizardDestroy' wizardPtr
wizardHandle :: Wizard a -> Event -> IO Int
wizardHandle = groupHandle

wizardParent :: Wizard a -> IO (Group ())
wizardParent = groupParent


wizardSetParent :: Wizard a -> Group b -> IO ()
wizardSetParent = groupSetParent


wizardType_ :: Wizard a  ->  IO (Word8)
wizardType_ = groupType_


wizardSetType :: Wizard a  -> Word8 ->  IO (())
wizardSetType = groupSetType


wizardDrawLabel :: Wizard a  -> Maybe (Rectangle,AlignType)->  IO (())
wizardDrawLabel = groupDrawLabel


wizardX :: Wizard a  ->  IO (Int)
wizardX = groupX


wizardY :: Wizard a  ->  IO (Int)
wizardY = groupY


wizardW :: Wizard a  ->  IO (Int)
wizardW = groupW


wizardH :: Wizard a  ->  IO (Int)
wizardH = groupH


wizardSetAlign :: Wizard a  -> AlignType ->  IO (())
wizardSetAlign = groupSetAlign

wizardAlign :: Wizard a  ->  IO (AlignType)
wizardAlign = groupAlign


wizardBox :: Wizard a  ->  IO (Boxtype)
wizardBox = groupBox


wizardSetBox :: Wizard a  -> Boxtype ->  IO (())
wizardSetBox = groupSetBox


wizardColor :: Wizard a  ->  IO (Color)
wizardColor = groupColor


wizardSetColor :: Wizard a  -> Color ->  IO (())
wizardSetColor = groupSetColor


wizardSetColorWithBgSel :: Wizard a  -> Color -> Color ->  IO (())
wizardSetColorWithBgSel = groupSetColorWithBgSel


wizardSelectionColor :: Wizard a  ->  IO (Color)
wizardSelectionColor = groupSelectionColor


wizardSetSelectionColor :: Wizard a  -> Color ->  IO (())
wizardSetSelectionColor = groupSetSelectionColor


wizardLabel :: Wizard a  ->  IO (String)
wizardLabel = groupLabel


wizardCopyLabel :: Wizard a  -> String ->  IO (())
wizardCopyLabel = groupCopyLabel


wizardSetLabel :: Wizard a  -> String ->  IO (())
wizardSetLabel = groupSetLabel


wizardLabeltype :: Wizard a  ->  IO (Labeltype)
wizardLabeltype = groupLabeltype


wizardSetLabeltype :: Wizard a  -> Labeltype ->  IO (())
wizardSetLabeltype = groupSetLabeltype


wizardLabelcolor :: Wizard a  ->  IO (Color)
wizardLabelcolor = groupLabelcolor


wizardSetLabelcolor :: Wizard a  -> Color ->  IO (())
wizardSetLabelcolor = groupSetLabelcolor


wizardLabelfont :: Wizard a  ->  IO (Font)
wizardLabelfont = groupLabelfont


wizardSetLabelfont :: Wizard a  -> Font ->  IO (())
wizardSetLabelfont = groupSetLabelfont


wizardLabelsize :: Wizard a  ->  IO (FontSize)
wizardLabelsize = groupLabelsize


wizardSetLabelsize :: Wizard a  -> FontSize ->  IO (())
wizardSetLabelsize = groupSetLabelsize


wizardImage :: Wizard a  ->  IO (Image ())
wizardImage = groupImage


wizardSetImage :: Wizard a  -> Image b ->  IO (())
wizardSetImage = groupSetImage


wizardDeimage :: Wizard a  ->  IO (Image ())
wizardDeimage = groupDeimage


wizardSetDeimage :: Wizard a  -> Image b ->  IO (())
wizardSetDeimage = groupSetDeimage


wizardTooltip :: Wizard a  ->  IO (String)
wizardTooltip = groupTooltip


wizardCopyTooltip :: Wizard a  -> String ->  IO (())
wizardCopyTooltip = groupCopyTooltip


wizardSetTooltip :: Wizard a  -> String ->  IO (())
wizardSetTooltip = groupSetTooltip


wizardWhen :: Wizard a  ->  IO (When)
wizardWhen = groupWhen


wizardSetWhen :: Wizard a  -> Word8 ->  IO (())
wizardSetWhen = groupSetWhen


wizardVisible :: Wizard a  ->  IO (Int)
wizardVisible = groupVisible


wizardVisibleR :: Wizard a  ->  IO (Int)
wizardVisibleR = groupVisibleR




wizardShow :: Wizard a  ->  IO (())
wizardShow = groupShow




wizardHide :: Wizard a  ->  IO (())
wizardHide = groupHide


wizardSetVisible :: Wizard a  ->  IO (())
wizardSetVisible = groupSetVisible


wizardClearVisible :: Wizard a  ->  IO (())
wizardClearVisible = groupClearVisible


wizardActive :: Wizard a  ->  IO (Int)
wizardActive = groupActive


wizardActiveR :: Wizard a  ->  IO (Int)
wizardActiveR = groupActiveR


wizardActivate :: Wizard a  ->  IO (())
wizardActivate = groupActivate


wizardDeactivate :: Wizard a  ->  IO (())
wizardDeactivate = groupDeactivate


wizardOutput :: Wizard a  ->  IO (Int)
wizardOutput = groupOutput


wizardSetOutput :: Wizard a  ->  IO (())
wizardSetOutput = groupSetOutput


wizardClearOutput :: Wizard a  ->  IO (())
wizardClearOutput = groupClearOutput


wizardTakesevents :: Wizard a  ->  IO (Int)
wizardTakesevents = groupTakesevents


wizardSetChanged :: Wizard a  ->  IO (())
wizardSetChanged = groupSetChanged


wizardClearChanged :: Wizard a  ->  IO (())
wizardClearChanged = groupClearChanged


wizardTakeFocus :: Wizard a  ->  IO (Int)
wizardTakeFocus = groupTakeFocus


wizardSetVisibleFocus :: Wizard a  ->  IO (())
wizardSetVisibleFocus = groupSetVisibleFocus


wizardClearVisibleFocus :: Wizard a  ->  IO (())
wizardClearVisibleFocus = groupClearVisibleFocus


wizardModifyVisibleFocus :: Wizard a  -> Int ->  IO (())
wizardModifyVisibleFocus = groupModifyVisibleFocus


wizardVisibleFocus :: Wizard a  ->  IO (Int)
wizardVisibleFocus = groupVisibleFocus


wizardContains :: Wizard a  -> Group b  ->  IO (Int)
wizardContains = groupContains


wizardInside :: Wizard a  -> Group b  ->  IO (Int)
wizardInside = groupInside


wizardRedraw :: Wizard a  ->  IO (())
wizardRedraw = groupRedraw


wizardRedrawLabel :: Wizard a  ->  IO (())
wizardRedrawLabel = groupRedrawLabel

wizardDamage :: Wizard a  ->  IO (Word8)
wizardDamage = groupDamage

wizardClearDamageWithBitmask :: Wizard a  -> Word8 ->  IO (())
wizardClearDamageWithBitmask = groupClearDamageWithBitmask

wizardClearDamage :: Wizard a  ->  IO (())
wizardClearDamage = groupClearDamage

wizardDamageWithText :: Wizard a  -> Word8 ->  IO (())
wizardDamageWithText = groupDamageWithText

wizardDamageInsideWidget :: Wizard a  -> Word8 -> Rectangle ->  IO (())
wizardDamageInsideWidget = groupDamageInsideWidget

wizardMeasureLabel :: Wizard a  -> IO (Size)
wizardMeasureLabel = groupMeasureLabel

wizardWindow :: Wizard a  ->  IO (Window ())
wizardWindow = groupWindow

wizardTopWindow :: Wizard a  ->  IO (Window ())
wizardTopWindow = groupTopWindow

wizardTopWindowOffset :: Wizard a -> IO (Position)
wizardTopWindowOffset = groupTopWindowOffset

wizardAsGroup :: Wizard a  ->  IO (Group ())
wizardAsGroup = groupAsGroup

wizardAsGlWindow :: Wizard a  ->  IO (GlWindow ())
wizardAsGlWindow = groupAsGlWindow

wizardResize :: Wizard a  -> Rectangle -> IO (())
wizardResize = groupResize


wizardSetCallback :: Wizard a -> (Group b -> IO ()) -> IO (())
wizardSetCallback = groupSetCallback

wizardBegin :: Wizard a  ->  IO (())
wizardBegin = groupBegin

wizardEnd :: Wizard a  ->  IO (())
wizardEnd = groupEnd

wizardFind :: Wizard b -> Widget a  ->  IO (Int)
wizardFind = groupFind

wizardAdd :: Wizard b -> Widget a  ->  IO (())
wizardAdd = groupAdd

wizardInsert :: Wizard b -> Widget a  -> Int ->  IO (())
wizardInsert = groupInsert

wizardRemoveIndex :: Wizard a  -> Int ->  IO (())
wizardRemoveIndex = groupRemoveIndex

wizardRemoveWidget :: Wizard b -> Widget a  ->  IO (())
wizardRemoveWidget = groupRemoveWidget

wizardClear :: Wizard a  ->  IO (())
wizardClear = groupClear

wizardSetResizable :: Wizard b -> Widget a  ->  IO (())
wizardSetResizable = groupSetResizable

wizardResizable :: Wizard a  ->  IO (Widget ())
wizardResizable = groupResizable

wizardAddResizable :: Wizard b  -> Widget a  ->  IO (())
wizardAddResizable = groupAddResizable

wizardInitSizes :: Wizard a  ->  IO (())
wizardInitSizes = groupInitSizes

wizardChildren :: Wizard a  ->  IO (Int)
wizardChildren = groupChildren

wizardSetClipChildren :: Wizard a  -> Int ->  IO (())
wizardSetClipChildren = groupSetClipChildren

wizardClipChildren :: Wizard a  ->  IO (Int)
wizardClipChildren = groupClipChildren

wizardFocus :: Group b -> Widget a  ->  IO (())
wizardFocus = groupFocus
wizardDdfdesignKludge :: Wizard a  ->  IO (Widget ())
wizardDdfdesignKludge = groupDdfdesignKludge
wizardInsertWithBefore :: Group b -> Widget a  -> Widget c  ->  IO (())
wizardInsertWithBefore = groupInsertWithBefore

wizardArray :: Wizard a  ->  IO [Widget ()]
wizardArray = groupArray

wizardChild :: Wizard a  -> Int ->  IO (Widget ())
wizardChild = groupChild

{# fun unsafe Fl_Wizard_next as wizardNext' { id `Ptr ()' } -> `()' #}              
wizardNext :: Wizard a -> IO ()
wizardNext wizard = withObject wizard $ \wizardPtr -> wizardNext' wizardPtr  
{# fun unsafe Fl_Wizard_prev as wizardPrev' { id `Ptr ()' } -> `()' #}              
wizardPrev :: Wizard a -> IO ()
wizardPrev wizard = withObject wizard $ \wizardPtr -> wizardPrev' wizardPtr  
{# fun unsafe Fl_Wizard_set_value as wizardSetValue' { id `Ptr ()', id `Ptr ()' } -> `()' #}                                                      
wizardSetValue :: Wizard a -> Widget b -> IO ()
wizardSetValue wizard widget = 
  withObject wizard $ \wizardPtr -> 
    withObject widget $ \widgetPtr -> 
      wizardSetValue' wizardPtr widgetPtr
{# fun unsafe Fl_Wizard_value as wizardValue' {id `Ptr ()'} -> `Ptr ()' id #}      
wizardValue :: Wizard a -> IO (Widget ())
wizardValue wizard = 
  withObject wizard $ \wizardPtr -> wizardValue' wizardPtr >>= toObject
