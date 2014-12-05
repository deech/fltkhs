{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Choice
    (
     -- * Constructor
     choiceNew,
     choiceDestroy,
     -- * Fl_Widget specific
     choiceHandle,
     choiceParent,
     choiceSetParent,
     choiceType_,
     choiceSetType,
     choiceAsWindow,
     choiceX,
     choiceY,
     choiceW,
     choiceH,
     choiceSetAlign,
     choiceAlign,
     choiceBox,
     choiceSetBox,
     choiceColor,
     choiceSetColor,
     choiceSetColorWithBgSel,
     choiceSelectionColor,
     choiceSetSelectionColor,
     choiceLabel,
     choiceCopyLabel,
     choiceSetLabel,
     choiceLabeltype,
     choiceSetLabeltype,
     choiceLabelcolor,
     choiceSetLabelcolor,
     choiceLabelfont,
     choiceSetLabelfont,
     choiceLabelsize,
     choiceSetLabelsize,
     choiceImage,
     choiceSetImage,
     choiceDeimage,
     choiceSetDeimage,
     choiceTooltip,
     choiceCopyTooltip,
     choiceSetTooltip,
     choiceWhen,
     choiceSetWhen,
     choiceVisible,
     choiceVisibleR,
     choiceShow,
     choiceHide,
     choiceSetVisible,
     choiceClearVisible,
     choiceActive,
     choiceActiveR,
     choiceActivate,
     choiceDeactivate,
     choiceOutput,
     choiceSetOutput,
     choiceClearOutput,
     choiceTakesevents,
     choiceSetChanged,
     choiceClearChanged,
     choiceTakeFocus,
     choiceSetVisibleFocus,
     choiceClearVisibleFocus,
     choiceModifyVisibleFocus,
     choiceVisibleFocus,
     choiceContains,
     choiceInside,
     choiceRedraw,
     choiceRedrawLabel,
     choiceDamage,
     choiceClearDamageWithBitmask,
     choiceClearDamage,
     choiceDamageWithText,
     choiceDamageInsideWidget,
     choiceMeasureLabel,
     choiceWindow,
     choiceTopWindow,
     choiceTopWindowOffset,
     choiceAsGroup,
     choiceAsGlWindow,
     choiceResize,
     choiceSetCallback,
     choiceDrawLabel,
     choiceValue,
     choiceSetValue,
     choiceClear,
     choiceSetShortcut,
     choiceDownBox,
     choiceSetDownBox,
     choiceDownColor,
     choiceSetDownColor,
     choiceDrawBox,
     choiceDrawBoxWithBoxtype,
     choiceDrawBackdrop,
     choiceDrawFocus,
     choiceItemPathnameWithFinditem,
     choiceItemPathname,
     choicePicked,
     choiceFind,
     choiceTestShortcut,
     choiceGlobal,
     choiceMenu,
     choicesetMenu,
     choiceCopy,
     choiceInsert,
     choiceAdd,
     choiceSize,
     choiceSetSize,
     choiceClearSubmenu,
     choiceReplace,
     choiceRemove,
     choiceSetMode,
     choiceMode,
     choiceMvalue,
     choiceText,
     choiceTextWithIndex,
     choiceTextfont,
     choiceSetTextfont,
     choiceTextsize,
     choiceSetTextsize,
     choiceTextcolor,
     choiceSetTextcolor,
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ChoiceC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Menu_
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Choice_New as choiceNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Choice_New_WithLabel as choiceNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
choiceNew :: Rectangle -> Maybe String -> IO (ValueInput ())
choiceNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> choiceNew' x_pos y_pos width height >>=
                             toObject
        Just l -> choiceNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Choice_Destroy as choiceDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
choiceDestroy :: ValueInput a -> IO ()
choiceDestroy win = swapObject win $ \winPtr -> do
                                        choiceDestroy' winPtr
                                        return nullPtr

choiceAsGroup :: Choice a  ->  IO (Group ())
choiceAsGroup = menu_AsGroup
choiceAsGlWindow :: Choice a  ->  IO (GlWindow())
choiceAsGlWindow = menu_AsGlWindow
choiceResize :: Choice a  -> Rectangle -> IO (())
choiceResize = menu_Resize
choiceAsWindow :: Choice a  ->  IO (Window())
choiceAsWindow = menu_AsWindow
choiceHide :: Choice a  ->  IO (())
choiceHide = menu_Hide
choiceShow :: Choice a -> IO ()
choiceShow = menu_Show
choiceDrawBox :: Choice a -> IO ()
choiceDrawBox = menu_DrawBox
choiceDrawBoxWithBoxtype :: Choice a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
choiceDrawBoxWithBoxtype = menu_DrawBoxWithBoxtype
choiceDrawBackdrop :: Choice a -> IO ()
choiceDrawBackdrop = menu_DrawBackdrop
choiceDrawFocus :: Choice a -> Maybe (Boxtype, Rectangle) -> IO ()
choiceDrawFocus = menu_DrawFocus
choiceSetCallback :: Choice a -> (Choice b -> IO ()) -> IO (())
choiceSetCallback = menu_SetCallback
choiceParent :: Choice a -> IO (Group ())
choiceParent = menu_Parent
choiceSetParent :: Choice a -> Group b -> IO ()
choiceSetParent = menu_SetParent
choiceType_ :: Choice a  ->  IO (Word8)
choiceType_ = menu_Type_
choiceSetType :: Choice a  -> Word8 ->  IO (())
choiceSetType = menu_SetType
choiceDrawLabel :: Choice a  -> Maybe (Rectangle,AlignType)->  IO (())
choiceDrawLabel = menu_DrawLabel
choiceX :: Choice a  ->  IO (Int)
choiceX = menu_X
choiceY :: Choice a  ->  IO (Int)
choiceY = menu_Y
choiceW :: Choice a  ->  IO (Int)
choiceW = menu_W
choiceH :: Choice a  ->  IO (Int)
choiceH = menu_H
choiceSetAlign :: Choice a  -> AlignType ->  IO (())
choiceSetAlign = menu_SetAlign
choiceAlign :: Choice a  ->  IO (AlignType)
choiceAlign = menu_Align
choiceBox :: Choice a  ->  IO (Boxtype)
choiceBox = menu_Box
choiceSetBox :: Choice a  -> Boxtype ->  IO (())
choiceSetBox = menu_SetBox
choiceColor :: Choice a  ->  IO (Color)
choiceColor = menu_Color
choiceSetColor :: Choice a  -> Color ->  IO (())
choiceSetColor = menu_SetColor
choiceSetColorWithBgSel :: Choice a  -> Color -> Color ->  IO (())
choiceSetColorWithBgSel = menu_SetColorWithBgSel
choiceSelectionColor :: Choice a  ->  IO (Color)
choiceSelectionColor = menu_SelectionColor
choiceSetSelectionColor :: Choice a  -> Color ->  IO (())
choiceSetSelectionColor = menu_SetSelectionColor
choiceLabel :: Choice a  ->  IO (String)
choiceLabel = menu_Label
choiceCopyLabel :: Choice a  -> String ->  IO (())
choiceCopyLabel = menu_CopyLabel
choiceSetLabel :: Choice a  -> String ->  IO (())
choiceSetLabel = menu_SetLabel
choiceLabeltype :: Choice a  ->  IO (Labeltype)
choiceLabeltype = menu_Labeltype
choiceSetLabeltype :: Choice a  -> Labeltype ->  IO (())
choiceSetLabeltype = menu_SetLabeltype
choiceLabelcolor :: Choice a  ->  IO (Color)
choiceLabelcolor = menu_Labelcolor
choiceSetLabelcolor :: Choice a  -> Color ->  IO (())
choiceSetLabelcolor = menu_SetLabelcolor
choiceLabelfont :: Choice a  ->  IO (Font)
choiceLabelfont = menu_Labelfont
choiceSetLabelfont :: Choice a  -> Font ->  IO (())
choiceSetLabelfont = menu_SetLabelfont
choiceLabelsize :: Choice a  ->  IO (FontSize)
choiceLabelsize = menu_Labelsize
choiceSetLabelsize :: Choice a  -> FontSize ->  IO (())
choiceSetLabelsize = menu_SetLabelsize
choiceImage :: Choice a  ->  IO (Image ())
choiceImage = menu_Image
choiceSetImage :: Choice a  -> Image b ->  IO (())
choiceSetImage = menu_SetImage
choiceDeimage :: Choice a  ->  IO (Image ())
choiceDeimage = menu_Deimage
choiceSetDeimage :: Choice a  -> Image b ->  IO (())
choiceSetDeimage = menu_SetDeimage
choiceTooltip :: Choice a  ->  IO (String)
choiceTooltip = menu_Tooltip
choiceCopyTooltip :: Choice a  -> String ->  IO (())
choiceCopyTooltip = menu_CopyTooltip
choiceSetTooltip :: Choice a  -> String ->  IO (())
choiceSetTooltip = menu_SetTooltip
choiceWhen :: Choice a  ->  IO (When)
choiceWhen = menu_When
choiceSetWhen :: Choice a  -> Word8 ->  IO (())
choiceSetWhen = menu_SetWhen
choiceVisible :: Choice a  ->  IO (Int)
choiceVisible = menu_Visible
choiceVisibleR :: Choice a  ->  IO (Int)
choiceVisibleR = menu_VisibleR
choiceSetVisible :: Choice a  ->  IO (())
choiceSetVisible = menu_SetVisible
choiceClearVisible :: Choice a  ->  IO (())
choiceClearVisible = menu_ClearVisible
choiceActive :: Choice a  ->  IO (Int)
choiceActive = menu_Active
choiceActiveR :: Choice a  ->  IO (Int)
choiceActiveR = menu_ActiveR
choiceActivate :: Choice a  ->  IO (())
choiceActivate = menu_Activate
choiceDeactivate :: Choice a  ->  IO (())
choiceDeactivate = menu_Deactivate
choiceOutput :: Choice a  ->  IO (Int)
choiceOutput = menu_Output
choiceSetOutput :: Choice a  ->  IO (())
choiceSetOutput = menu_SetOutput
choiceClearOutput :: Choice a  ->  IO (())
choiceClearOutput = menu_ClearOutput
choiceTakesevents :: Choice a  ->  IO (Int)
choiceTakesevents = menu_Takesevents
choiceSetChanged :: Choice a  ->  IO (())
choiceSetChanged = menu_SetChanged
choiceClearChanged :: Choice a  ->  IO (())
choiceClearChanged = menu_ClearChanged
choiceTakeFocus :: Choice a  ->  IO (Int)
choiceTakeFocus = menu_TakeFocus
choiceSetVisibleFocus :: Choice a  ->  IO (())
choiceSetVisibleFocus = menu_SetVisibleFocus
choiceClearVisibleFocus :: Choice a  ->  IO (())
choiceClearVisibleFocus = menu_ClearVisibleFocus
choiceModifyVisibleFocus :: Choice a  -> Int ->  IO (())
choiceModifyVisibleFocus = menu_ModifyVisibleFocus
choiceVisibleFocus :: Choice a  ->  IO (Int)
choiceVisibleFocus = menu_VisibleFocus
choiceContains :: Choice a  -> Widget b  ->  IO (Int)
choiceContains = menu_Contains
choiceInside :: Choice a  -> Choice a  ->  IO (Int)
choiceInside = menu_Inside
choiceRedraw :: Choice a  ->  IO (())
choiceRedraw = menu_Redraw
choiceRedrawLabel :: Choice a  ->  IO (())
choiceRedrawLabel = menu_RedrawLabel
choiceDamage :: Choice a  ->  IO (Word8)
choiceDamage = menu_Damage
choiceClearDamageWithBitmask :: Choice a  -> Word8 ->  IO (())
choiceClearDamageWithBitmask = menu_ClearDamageWithBitmask
choiceClearDamage :: Choice a  ->  IO (())
choiceClearDamage = menu_ClearDamage
choiceDamageWithText :: Choice a  -> Word8 ->  IO (())
choiceDamageWithText = menu_DamageWithText
choiceDamageInsideWidget :: Choice a  -> Word8 -> Rectangle ->  IO (())
choiceDamageInsideWidget = menu_DamageInsideWidget
choiceMeasureLabel :: Choice a  -> IO (Size)
choiceMeasureLabel = menu_MeasureLabel
choiceWindow :: Choice a  ->  IO (Window ())
choiceWindow = menu_Window
choiceTopWindow :: Choice a  ->  IO (Window ())
choiceTopWindow = menu_TopWindow
choiceTopWindowOffset :: Choice a -> IO (Position)
choiceTopWindowOffset = menu_TopWindowOffset
choiceItemPathnameWithFinditem :: Choice a  -> String -> Int -> MenuItem b  ->  IO (Int)
choiceItemPathnameWithFinditem = menu_ItemPathnameWithFinditem
choiceItemPathname :: Choice a  -> String -> Int ->  IO (Int)
choiceItemPathname = menu_ItemPathname
choicePicked :: Choice a  -> MenuItem b ->  IO (MenuItem b)
choicePicked = menu_Picked
choiceFind :: Choice a -> MenuItemLocator b -> IO (Int)
choiceFind = menu_Find
choiceTestShortcut :: Choice a  ->  IO (MenuItem b)
choiceTestShortcut = menu_TestShortcut
choiceGlobal :: Choice a  ->  IO ()
choiceGlobal = menu_Global
choiceMenu :: Choice a  ->  IO (Choice a)
choiceMenu = menu_Menu
choicesetMenu :: Choice a -> [MenuItem b] -> IO ()
choicesetMenu = menu_setMenu
choiceCopy :: Choice a  -> MenuItem b  ->  IO ()
choiceCopy = menu_Copy
choiceInsert :: Choice a -> Int -> String -> Maybe Shortcut -> (Choice a -> IO ()) -> [MenuProps] -> IO (Int)
choiceInsert = menu_Insert
choiceAdd :: MenuItem a -> String -> Maybe Shortcut -> (Choice b -> IO ()) -> [MenuProps] -> IO (Int)
choiceAdd = menu_Add
choiceSize :: Choice a  ->  IO (Int)
choiceSize = menu_Size
choiceSetSize :: Choice a  -> Int -> Int ->  IO ()
choiceSetSize = menu_SetSize
choiceClear :: Choice a  ->  IO ()
choiceClear = menu_Clear
choiceClearSubmenu :: Choice a  -> Int ->  IO (Int)
choiceClearSubmenu = menu_ClearSubmenu
choiceReplace :: Choice a  -> Int -> String ->  IO ()
choiceReplace = menu_Replace
choiceRemove :: Choice a  -> Int  ->  IO ()
choiceRemove = menu_Remove
choiceSetShortcut :: Choice a  -> Int -> ShortcutKeySequence ->  IO ()
choiceSetShortcut = menu_SetShortcut
choiceSetMode :: Choice a  -> Int -> Int ->  IO ()
choiceSetMode = menu_SetMode
choiceMode :: Choice a  -> Int ->  IO (Int)
choiceMode = menu_Mode
choiceMvalue :: Choice a  -> IO (MenuItem b)
choiceMvalue = menu_Mvalue
choiceValue :: Choice a  ->  IO (Int)
choiceValue = menu_Value
choiceText :: Choice a  ->  IO (String)
choiceText = menu_Text
choiceTextWithIndex :: Choice a  -> Int ->  IO (String)
choiceTextWithIndex = menu_TextWithIndex
choiceTextfont :: Choice a  ->  IO (Font)
choiceTextfont = menu_Textfont
choiceSetTextfont :: Choice a  -> Font ->  IO ()
choiceSetTextfont = menu_SetTextfont
choiceTextsize :: Choice a  ->  IO (FontSize)
choiceTextsize = menu_Textsize
choiceSetTextsize :: Choice a  -> FontSize ->  IO ()
choiceSetTextsize = menu_SetTextsize
choiceTextcolor :: Choice a  ->  IO (Color)
choiceTextcolor = menu_Textcolor
choiceSetTextcolor :: Choice a  -> Color ->  IO ()
choiceSetTextcolor = menu_SetTextcolor
choiceDownBox :: Choice a  ->  IO (Boxtype)
choiceDownBox = menu_DownBox
choiceSetDownBox :: Choice a  -> Boxtype ->  IO ()
choiceSetDownBox = menu_SetDownBox
choiceDownColor :: Choice a  ->  IO (Color)
choiceDownColor = menu_DownColor
choiceSetDownColor :: Choice a  -> Int ->  IO ()
choiceSetDownColor = menu_SetDownColor
{#fun Fl_Choice_handle as choiceHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
choiceHandle :: Choice a -> Event -> IO Int
choiceHandle menu_bar event = withObject menu_bar (\p -> choiceHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Choice_set_value_with_item as valueWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
{# fun unsafe Fl_Choice_set_value_with_index as valueWithIndex' { id `Ptr ()',`Int' } -> `Int' #}
choiceSetValue :: MenuPrim a -> MenuItemReference b -> IO (Int)
choiceSetValue choice choiceitem_reference =
    withObject choice $ \choicePtr ->
        case choiceitem_reference of
          (MenuItemIndexReference (MenuItemIndex index)) -> valueWithIndex' choicePtr index
          (MenuItemPointerReference (MenuItemPointer choiceitem)) ->
              withObject choiceitem $ \choiceitemPtr ->
                  valueWithItem' choicePtr choiceitemPtr
