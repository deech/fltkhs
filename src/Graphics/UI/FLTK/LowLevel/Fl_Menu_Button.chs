{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Menu_Button
    (
     -- * Constructor
     menuButtonNew,
     menuButtonDestroy,
     -- * Fl_Widget specific
     menuButtonHandle,
     menuButtonParent,
     menuButtonSetParent,
     menuButtonType_,
     menuButtonSetType,
     menuButtonAsWindow,
     menuButtonX,
     menuButtonY,
     menuButtonW,
     menuButtonH,
     menuButtonSetAlign,
     menuButtonAlign,
     menuButtonBox,
     menuButtonSetBox,
     menuButtonColor,
     menuButtonSetColor,
     menuButtonSetColorWithBgSel,
     menuButtonSelectionColor,
     menuButtonSetSelectionColor,
     menuButtonLabel,
     menuButtonCopyLabel,
     menuButtonSetLabel,
     menuButtonLabeltype,
     menuButtonSetLabeltype,
     menuButtonLabelcolor,
     menuButtonSetLabelcolor,
     menuButtonLabelfont,
     menuButtonSetLabelfont,
     menuButtonLabelsize,
     menuButtonSetLabelsize,
     menuButtonImage,
     menuButtonSetImage,
     menuButtonDeimage,
     menuButtonSetDeimage,
     menuButtonTooltip,
     menuButtonCopyTooltip,
     menuButtonSetTooltip,
     menuButtonWhen,
     menuButtonSetWhen,
     menuButtonVisible,
     menuButtonVisibleR,
     menuButtonShow,
     menuButtonHide,
     menuButtonSetVisible,
     menuButtonClearVisible,
     menuButtonActive,
     menuButtonActiveR,
     menuButtonActivate,
     menuButtonDeactivate,
     menuButtonOutput,
     menuButtonSetOutput,
     menuButtonClearOutput,
     menuButtonTakesevents,
     menuButtonSetChanged,
     menuButtonClearChanged,
     menuButtonTakeFocus,
     menuButtonSetVisibleFocus,
     menuButtonClearVisibleFocus,
     menuButtonModifyVisibleFocus,
     menuButtonVisibleFocus,
     menuButtonContains,
     menuButtonInside,
     menuButtonRedraw,
     menuButtonRedrawLabel,
     menuButtonDamage,
     menuButtonClearDamageWithBitmask,
     menuButtonClearDamage,
     menuButtonDamageWithText,
     menuButtonDamageInsideWidget,
     menuButtonMeasureLabel,
     menuButtonWindow,
     menuButtonTopWindow,
     menuButtonTopWindowOffset,
     menuButtonAsGroup,
     menuButtonAsGlWindow,
     menuButtonResize,
     menuButtonSetCallback,
     menuButtonDrawLabel,
     menuButtonValue,
     menuButtonSetValue,
     menuButtonClear,
     menuButtonSetShortcut,
     menuButtonDownBox,
     menuButtonSetDownBox,
     menuButtonDownColor,
     menuButtonSetDownColor,
     menuButtonDrawBox,
     menuButtonDrawBoxWithBoxtype,
     menuButtonDrawBackdrop,
     menuButtonDrawFocus,
     menuButtonItemPathnameWithFinditem,
     menuButtonItemPathname,
     menuButtonPicked,
     menuButtonFind,
     menuButtonTestShortcut,
     menuButtonGlobal,
     menuButtonMenu,
     menuButtonsetMenu,
     menuButtonCopy,
     menuButtonInsert,
     menuButtonAdd,
     menuButtonSize,
     menuButtonSetSize,
     menuButtonClearSubmenu,
     menuButtonReplace,
     menuButtonRemove,
     menuButtonSetMode,
     menuButtonMode,
     menuButtonMvalue,
     menuButtonText,
     menuButtonTextWithIndex,
     menuButtonTextfont,
     menuButtonSetTextfont,
     menuButtonTextsize,
     menuButtonSetTextsize,
     menuButtonTextcolor,
     menuButtonSetTextcolor,
     menuButtonPopup
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Menu_
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Menu_Button_New as menuButtonNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Button_New_WithLabel as menuButtonNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
menuButtonNew :: Rectangle -> Maybe String -> IO (ValueInput ())
menuButtonNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> menuButtonNew' x_pos y_pos width height >>=
                             toObject
        Just l -> menuButtonNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Menu_Button_Destroy as menuButtonDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
menuButtonDestroy :: ValueInput a -> IO ()
menuButtonDestroy win = swapObject win $ \winPtr -> do
                                        menuButtonDestroy' winPtr
                                        return nullPtr

menuButtonAsGroup :: MenuButton a  ->  IO (Group ())
menuButtonAsGroup = menu_AsGroup
menuButtonAsGlWindow :: MenuButton a  ->  IO (GlWindow())
menuButtonAsGlWindow = menu_AsGlWindow
menuButtonResize :: MenuButton a  -> Rectangle -> IO (())
menuButtonResize = menu_Resize
menuButtonAsWindow :: MenuButton a  ->  IO (Window())
menuButtonAsWindow = menu_AsWindow
menuButtonHide :: MenuButton a  ->  IO (())
menuButtonHide = menu_Hide
menuButtonShow :: MenuButton a -> IO ()
menuButtonShow = menu_Show
menuButtonDrawBox :: MenuButton a -> IO ()
menuButtonDrawBox = menu_DrawBox
menuButtonDrawBoxWithBoxtype :: MenuButton a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
menuButtonDrawBoxWithBoxtype = menu_DrawBoxWithBoxtype
menuButtonDrawBackdrop :: MenuButton a -> IO ()
menuButtonDrawBackdrop = menu_DrawBackdrop
menuButtonDrawFocus :: MenuButton a -> Maybe (Boxtype, Rectangle) -> IO ()
menuButtonDrawFocus = menu_DrawFocus
menuButtonSetCallback :: MenuButton a -> (MenuButton b -> IO ()) -> IO (())
menuButtonSetCallback = menu_SetCallback
menuButtonParent :: MenuButton a -> IO (Group ())
menuButtonParent = menu_Parent
menuButtonSetParent :: MenuButton a -> Group b -> IO ()
menuButtonSetParent = menu_SetParent
menuButtonType_ :: MenuButton a  ->  IO (Word8)
menuButtonType_ = menu_Type_
menuButtonSetType :: MenuButton a  -> Word8 ->  IO (())
menuButtonSetType = menu_SetType
menuButtonDrawLabel :: MenuButton a  -> Maybe (Rectangle,AlignType)->  IO (())
menuButtonDrawLabel = menu_DrawLabel
menuButtonX :: MenuButton a  ->  IO (Int)
menuButtonX = menu_X
menuButtonY :: MenuButton a  ->  IO (Int)
menuButtonY = menu_Y
menuButtonW :: MenuButton a  ->  IO (Int)
menuButtonW = menu_W
menuButtonH :: MenuButton a  ->  IO (Int)
menuButtonH = menu_H
menuButtonSetAlign :: MenuButton a  -> AlignType ->  IO (())
menuButtonSetAlign = menu_SetAlign
menuButtonAlign :: MenuButton a  ->  IO (AlignType)
menuButtonAlign = menu_Align
menuButtonBox :: MenuButton a  ->  IO (Boxtype)
menuButtonBox = menu_Box
menuButtonSetBox :: MenuButton a  -> Boxtype ->  IO (())
menuButtonSetBox = menu_SetBox
menuButtonColor :: MenuButton a  ->  IO (Color)
menuButtonColor = menu_Color
menuButtonSetColor :: MenuButton a  -> Color ->  IO (())
menuButtonSetColor = menu_SetColor
menuButtonSetColorWithBgSel :: MenuButton a  -> Color -> Color ->  IO (())
menuButtonSetColorWithBgSel = menu_SetColorWithBgSel
menuButtonSelectionColor :: MenuButton a  ->  IO (Color)
menuButtonSelectionColor = menu_SelectionColor
menuButtonSetSelectionColor :: MenuButton a  -> Color ->  IO (())
menuButtonSetSelectionColor = menu_SetSelectionColor
menuButtonLabel :: MenuButton a  ->  IO (String)
menuButtonLabel = menu_Label
menuButtonCopyLabel :: MenuButton a  -> String ->  IO (())
menuButtonCopyLabel = menu_CopyLabel
menuButtonSetLabel :: MenuButton a  -> String ->  IO (())
menuButtonSetLabel = menu_SetLabel
menuButtonLabeltype :: MenuButton a  ->  IO (Labeltype)
menuButtonLabeltype = menu_Labeltype
menuButtonSetLabeltype :: MenuButton a  -> Labeltype ->  IO (())
menuButtonSetLabeltype = menu_SetLabeltype
menuButtonLabelcolor :: MenuButton a  ->  IO (Color)
menuButtonLabelcolor = menu_Labelcolor
menuButtonSetLabelcolor :: MenuButton a  -> Color ->  IO (())
menuButtonSetLabelcolor = menu_SetLabelcolor
menuButtonLabelfont :: MenuButton a  ->  IO (Font)
menuButtonLabelfont = menu_Labelfont
menuButtonSetLabelfont :: MenuButton a  -> Font ->  IO (())
menuButtonSetLabelfont = menu_SetLabelfont
menuButtonLabelsize :: MenuButton a  ->  IO (FontSize)
menuButtonLabelsize = menu_Labelsize
menuButtonSetLabelsize :: MenuButton a  -> FontSize ->  IO (())
menuButtonSetLabelsize = menu_SetLabelsize
menuButtonImage :: MenuButton a  ->  IO (Image ())
menuButtonImage = menu_Image
menuButtonSetImage :: MenuButton a  -> Image b ->  IO (())
menuButtonSetImage = menu_SetImage
menuButtonDeimage :: MenuButton a  ->  IO (Image ())
menuButtonDeimage = menu_Deimage
menuButtonSetDeimage :: MenuButton a  -> Image b ->  IO (())
menuButtonSetDeimage = menu_SetDeimage
menuButtonTooltip :: MenuButton a  ->  IO (String)
menuButtonTooltip = menu_Tooltip
menuButtonCopyTooltip :: MenuButton a  -> String ->  IO (())
menuButtonCopyTooltip = menu_CopyTooltip
menuButtonSetTooltip :: MenuButton a  -> String ->  IO (())
menuButtonSetTooltip = menu_SetTooltip
menuButtonWhen :: MenuButton a  ->  IO (When)
menuButtonWhen = menu_When
menuButtonSetWhen :: MenuButton a  -> Word8 ->  IO (())
menuButtonSetWhen = menu_SetWhen
menuButtonVisible :: MenuButton a  ->  IO (Int)
menuButtonVisible = menu_Visible
menuButtonVisibleR :: MenuButton a  ->  IO (Int)
menuButtonVisibleR = menu_VisibleR
menuButtonSetVisible :: MenuButton a  ->  IO (())
menuButtonSetVisible = menu_SetVisible
menuButtonClearVisible :: MenuButton a  ->  IO (())
menuButtonClearVisible = menu_ClearVisible
menuButtonActive :: MenuButton a  ->  IO (Int)
menuButtonActive = menu_Active
menuButtonActiveR :: MenuButton a  ->  IO (Int)
menuButtonActiveR = menu_ActiveR
menuButtonActivate :: MenuButton a  ->  IO (())
menuButtonActivate = menu_Activate
menuButtonDeactivate :: MenuButton a  ->  IO (())
menuButtonDeactivate = menu_Deactivate
menuButtonOutput :: MenuButton a  ->  IO (Int)
menuButtonOutput = menu_Output
menuButtonSetOutput :: MenuButton a  ->  IO (())
menuButtonSetOutput = menu_SetOutput
menuButtonClearOutput :: MenuButton a  ->  IO (())
menuButtonClearOutput = menu_ClearOutput
menuButtonTakesevents :: MenuButton a  ->  IO (Int)
menuButtonTakesevents = menu_Takesevents
menuButtonSetChanged :: MenuButton a  ->  IO (())
menuButtonSetChanged = menu_SetChanged
menuButtonClearChanged :: MenuButton a  ->  IO (())
menuButtonClearChanged = menu_ClearChanged
menuButtonTakeFocus :: MenuButton a  ->  IO (Int)
menuButtonTakeFocus = menu_TakeFocus
menuButtonSetVisibleFocus :: MenuButton a  ->  IO (())
menuButtonSetVisibleFocus = menu_SetVisibleFocus
menuButtonClearVisibleFocus :: MenuButton a  ->  IO (())
menuButtonClearVisibleFocus = menu_ClearVisibleFocus
menuButtonModifyVisibleFocus :: MenuButton a  -> Int ->  IO (())
menuButtonModifyVisibleFocus = menu_ModifyVisibleFocus
menuButtonVisibleFocus :: MenuButton a  ->  IO (Int)
menuButtonVisibleFocus = menu_VisibleFocus
menuButtonContains :: MenuButton a  -> Widget b  ->  IO (Int)
menuButtonContains = menu_Contains
menuButtonInside :: MenuButton a  -> MenuButton a  ->  IO (Int)
menuButtonInside = menu_Inside
menuButtonRedraw :: MenuButton a  ->  IO (())
menuButtonRedraw = menu_Redraw
menuButtonRedrawLabel :: MenuButton a  ->  IO (())
menuButtonRedrawLabel = menu_RedrawLabel
menuButtonDamage :: MenuButton a  ->  IO (Word8)
menuButtonDamage = menu_Damage
menuButtonClearDamageWithBitmask :: MenuButton a  -> Word8 ->  IO (())
menuButtonClearDamageWithBitmask = menu_ClearDamageWithBitmask
menuButtonClearDamage :: MenuButton a  ->  IO (())
menuButtonClearDamage = menu_ClearDamage
menuButtonDamageWithText :: MenuButton a  -> Word8 ->  IO (())
menuButtonDamageWithText = menu_DamageWithText
menuButtonDamageInsideWidget :: MenuButton a  -> Word8 -> Rectangle ->  IO (())
menuButtonDamageInsideWidget = menu_DamageInsideWidget
menuButtonMeasureLabel :: MenuButton a  -> IO (Size)
menuButtonMeasureLabel = menu_MeasureLabel
menuButtonWindow :: MenuButton a  ->  IO (Window ())
menuButtonWindow = menu_Window
menuButtonTopWindow :: MenuButton a  ->  IO (Window ())
menuButtonTopWindow = menu_TopWindow
menuButtonTopWindowOffset :: MenuButton a -> IO (Position)
menuButtonTopWindowOffset = menu_TopWindowOffset
menuButtonItemPathnameWithFinditem :: MenuButton a  -> String -> Int -> MenuItem b  ->  IO (Int)
menuButtonItemPathnameWithFinditem = menu_ItemPathnameWithFinditem
menuButtonItemPathname :: MenuButton a  -> String -> Int ->  IO (Int)
menuButtonItemPathname = menu_ItemPathname
menuButtonPicked :: MenuButton a  -> MenuItem b ->  IO (MenuItem b)
menuButtonPicked = menu_Picked
menuButtonFind :: MenuButton a -> MenuItemLocator b -> IO (Int)
menuButtonFind = menu_Find
menuButtonTestShortcut :: MenuButton a  ->  IO (MenuItem b)
menuButtonTestShortcut = menu_TestShortcut
menuButtonGlobal :: MenuButton a  ->  IO ()
menuButtonGlobal = menu_Global
menuButtonMenu :: MenuButton a  ->  IO (MenuButton a)
menuButtonMenu = menu_Menu
menuButtonsetMenu :: MenuButton a -> [MenuItem b] -> IO ()
menuButtonsetMenu = menu_setMenu
menuButtonCopy :: MenuButton a  -> MenuItem b  ->  IO ()
menuButtonCopy = menu_Copy
menuButtonInsert :: MenuButton a -> Int -> String -> Maybe Shortcut -> (MenuButton a -> IO ()) -> [MenuProps] -> IO (Int)
menuButtonInsert = menu_Insert
menuButtonAdd :: MenuItem a -> String -> Maybe Shortcut -> (MenuButton b -> IO ()) -> [MenuProps] -> IO (Int)
menuButtonAdd = menu_Add
menuButtonSize :: MenuButton a  ->  IO (Int)
menuButtonSize = menu_Size
menuButtonSetSize :: MenuButton a  -> Int -> Int ->  IO ()
menuButtonSetSize = menu_SetSize
menuButtonClear :: MenuButton a  ->  IO ()
menuButtonClear = menu_Clear
menuButtonClearSubmenu :: MenuButton a  -> Int ->  IO (Int)
menuButtonClearSubmenu = menu_ClearSubmenu
menuButtonReplace :: MenuButton a  -> Int -> String ->  IO ()
menuButtonReplace = menu_Replace
menuButtonRemove :: MenuButton a  -> Int  ->  IO ()
menuButtonRemove = menu_Remove
menuButtonSetShortcut :: MenuButton a  -> Int -> ShortcutKeySequence ->  IO ()
menuButtonSetShortcut = menu_SetShortcut
menuButtonSetMode :: MenuButton a  -> Int -> Int ->  IO ()
menuButtonSetMode = menu_SetMode
menuButtonMode :: MenuButton a  -> Int ->  IO (Int)
menuButtonMode = menu_Mode
menuButtonMvalue :: MenuButton a  -> IO (MenuItem b)
menuButtonMvalue = menu_Mvalue
menuButtonValue :: MenuButton a  ->  IO (Int)
menuButtonValue = menu_Value
menuButtonSetValue :: MenuButton a -> MenuItemReference b -> IO (Int)
menuButtonSetValue = menu_SetValue
menuButtonText :: MenuButton a  ->  IO (String)
menuButtonText = menu_Text
menuButtonTextWithIndex :: MenuButton a  -> Int ->  IO (String)
menuButtonTextWithIndex = menu_TextWithIndex
menuButtonTextfont :: MenuButton a  ->  IO (Font)
menuButtonTextfont = menu_Textfont
menuButtonSetTextfont :: MenuButton a  -> Font ->  IO ()
menuButtonSetTextfont = menu_SetTextfont
menuButtonTextsize :: MenuButton a  ->  IO (FontSize)
menuButtonTextsize = menu_Textsize
menuButtonSetTextsize :: MenuButton a  -> FontSize ->  IO ()
menuButtonSetTextsize = menu_SetTextsize
menuButtonTextcolor :: MenuButton a  ->  IO (Color)
menuButtonTextcolor = menu_Textcolor
menuButtonSetTextcolor :: MenuButton a  -> Color ->  IO ()
menuButtonSetTextcolor = menu_SetTextcolor
menuButtonDownBox :: MenuButton a  ->  IO (Boxtype)
menuButtonDownBox = menu_DownBox
menuButtonSetDownBox :: MenuButton a  -> Boxtype ->  IO ()
menuButtonSetDownBox = menu_SetDownBox
menuButtonDownColor :: MenuButton a  ->  IO (Color)
menuButtonDownColor = menu_DownColor
menuButtonSetDownColor :: MenuButton a  -> Int ->  IO ()
menuButtonSetDownColor = menu_SetDownColor
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
menuButtonHandle :: MenuButton a -> Event -> IO Int
menuButtonHandle menu_bar event = withObject menu_bar (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event))
{#fun Fl_Menu_Button_popup as menuButtonPopup' { id `Ptr ()' } -> `Ptr ()' id #}
menuButtonPopup :: MenuButton a -> IO (MenuItem ())
menuButtonPopup menu_bar = withObject menu_bar (\p -> menuButtonPopup' p >>= toObject)
