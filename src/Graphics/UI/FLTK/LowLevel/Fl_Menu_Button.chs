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

menuButtonAsGroup :: SysMenuBar a  ->  IO (Group ())
menuButtonAsGroup = menu_AsGroup
menuButtonAsGlWindow :: SysMenuBar a  ->  IO (GlWindow())
menuButtonAsGlWindow = menu_AsGlWindow
menuButtonResize :: SysMenuBar a  -> Rectangle -> IO (())
menuButtonResize = menu_Resize
menuButtonAsWindow :: SysMenuBar a  ->  IO (Window())
menuButtonAsWindow = menu_AsWindow
menuButtonHide :: SysMenuBar a  ->  IO (())
menuButtonHide = menu_Hide
menuButtonShow :: SysMenuBar a -> IO ()
menuButtonShow = menu_Show
menuButtonDrawBox :: SysMenuBar a -> IO ()
menuButtonDrawBox = menu_DrawBox
menuButtonDrawBoxWithBoxtype :: SysMenuBar a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
menuButtonDrawBoxWithBoxtype = menu_DrawBoxWithBoxtype
menuButtonDrawBackdrop :: SysMenuBar a -> IO ()
menuButtonDrawBackdrop = menu_DrawBackdrop
menuButtonDrawFocus :: SysMenuBar a -> Maybe (Boxtype, Rectangle) -> IO ()
menuButtonDrawFocus = menu_DrawFocus
menuButtonSetCallback :: SysMenuBar a -> (SysMenuBar b -> IO ()) -> IO (())
menuButtonSetCallback = menu_SetCallback
menuButtonParent :: SysMenuBar a -> IO (Group ())
menuButtonParent = menu_Parent
menuButtonSetParent :: SysMenuBar a -> Group b -> IO ()
menuButtonSetParent = menu_SetParent
menuButtonType_ :: SysMenuBar a  ->  IO (Word8)
menuButtonType_ = menu_Type_
menuButtonSetType :: SysMenuBar a  -> Word8 ->  IO (())
menuButtonSetType = menu_SetType
menuButtonDrawLabel :: SysMenuBar a  -> Maybe (Rectangle,AlignType)->  IO (())
menuButtonDrawLabel = menu_DrawLabel
menuButtonX :: SysMenuBar a  ->  IO (Int)
menuButtonX = menu_X
menuButtonY :: SysMenuBar a  ->  IO (Int)
menuButtonY = menu_Y
menuButtonW :: SysMenuBar a  ->  IO (Int)
menuButtonW = menu_W
menuButtonH :: SysMenuBar a  ->  IO (Int)
menuButtonH = menu_H
menuButtonSetAlign :: SysMenuBar a  -> AlignType ->  IO (())
menuButtonSetAlign = menu_SetAlign
menuButtonAlign :: SysMenuBar a  ->  IO (AlignType)
menuButtonAlign = menu_Align
menuButtonBox :: SysMenuBar a  ->  IO (Boxtype)
menuButtonBox = menu_Box
menuButtonSetBox :: SysMenuBar a  -> Boxtype ->  IO (())
menuButtonSetBox = menu_SetBox
menuButtonColor :: SysMenuBar a  ->  IO (Color)
menuButtonColor = menu_Color
menuButtonSetColor :: SysMenuBar a  -> Color ->  IO (())
menuButtonSetColor = menu_SetColor
menuButtonSetColorWithBgSel :: SysMenuBar a  -> Color -> Color ->  IO (())
menuButtonSetColorWithBgSel = menu_SetColorWithBgSel
menuButtonSelectionColor :: SysMenuBar a  ->  IO (Color)
menuButtonSelectionColor = menu_SelectionColor
menuButtonSetSelectionColor :: SysMenuBar a  -> Color ->  IO (())
menuButtonSetSelectionColor = menu_SetSelectionColor
menuButtonLabel :: SysMenuBar a  ->  IO (String)
menuButtonLabel = menu_Label
menuButtonCopyLabel :: SysMenuBar a  -> String ->  IO (())
menuButtonCopyLabel = menu_CopyLabel
menuButtonSetLabel :: SysMenuBar a  -> String ->  IO (())
menuButtonSetLabel = menu_SetLabel
menuButtonLabeltype :: SysMenuBar a  ->  IO (Labeltype)
menuButtonLabeltype = menu_Labeltype
menuButtonSetLabeltype :: SysMenuBar a  -> Labeltype ->  IO (())
menuButtonSetLabeltype = menu_SetLabeltype
menuButtonLabelcolor :: SysMenuBar a  ->  IO (Color)
menuButtonLabelcolor = menu_Labelcolor
menuButtonSetLabelcolor :: SysMenuBar a  -> Color ->  IO (())
menuButtonSetLabelcolor = menu_SetLabelcolor
menuButtonLabelfont :: SysMenuBar a  ->  IO (Font)
menuButtonLabelfont = menu_Labelfont
menuButtonSetLabelfont :: SysMenuBar a  -> Font ->  IO (())
menuButtonSetLabelfont = menu_SetLabelfont
menuButtonLabelsize :: SysMenuBar a  ->  IO (FontSize)
menuButtonLabelsize = menu_Labelsize
menuButtonSetLabelsize :: SysMenuBar a  -> FontSize ->  IO (())
menuButtonSetLabelsize = menu_SetLabelsize
menuButtonImage :: SysMenuBar a  ->  IO (Image ())
menuButtonImage = menu_Image
menuButtonSetImage :: SysMenuBar a  -> Image b ->  IO (())
menuButtonSetImage = menu_SetImage
menuButtonDeimage :: SysMenuBar a  ->  IO (Image ())
menuButtonDeimage = menu_Deimage
menuButtonSetDeimage :: SysMenuBar a  -> Image b ->  IO (())
menuButtonSetDeimage = menu_SetDeimage
menuButtonTooltip :: SysMenuBar a  ->  IO (String)
menuButtonTooltip = menu_Tooltip
menuButtonCopyTooltip :: SysMenuBar a  -> String ->  IO (())
menuButtonCopyTooltip = menu_CopyTooltip
menuButtonSetTooltip :: SysMenuBar a  -> String ->  IO (())
menuButtonSetTooltip = menu_SetTooltip
menuButtonWhen :: SysMenuBar a  ->  IO (When)
menuButtonWhen = menu_When
menuButtonSetWhen :: SysMenuBar a  -> Word8 ->  IO (())
menuButtonSetWhen = menu_SetWhen
menuButtonVisible :: SysMenuBar a  ->  IO (Int)
menuButtonVisible = menu_Visible
menuButtonVisibleR :: SysMenuBar a  ->  IO (Int)
menuButtonVisibleR = menu_VisibleR
menuButtonSetVisible :: SysMenuBar a  ->  IO (())
menuButtonSetVisible = menu_SetVisible
menuButtonClearVisible :: SysMenuBar a  ->  IO (())
menuButtonClearVisible = menu_ClearVisible
menuButtonActive :: SysMenuBar a  ->  IO (Int)
menuButtonActive = menu_Active
menuButtonActiveR :: SysMenuBar a  ->  IO (Int)
menuButtonActiveR = menu_ActiveR
menuButtonActivate :: SysMenuBar a  ->  IO (())
menuButtonActivate = menu_Activate
menuButtonDeactivate :: SysMenuBar a  ->  IO (())
menuButtonDeactivate = menu_Deactivate
menuButtonOutput :: SysMenuBar a  ->  IO (Int)
menuButtonOutput = menu_Output
menuButtonSetOutput :: SysMenuBar a  ->  IO (())
menuButtonSetOutput = menu_SetOutput
menuButtonClearOutput :: SysMenuBar a  ->  IO (())
menuButtonClearOutput = menu_ClearOutput
menuButtonTakesevents :: SysMenuBar a  ->  IO (Int)
menuButtonTakesevents = menu_Takesevents
menuButtonSetChanged :: SysMenuBar a  ->  IO (())
menuButtonSetChanged = menu_SetChanged
menuButtonClearChanged :: SysMenuBar a  ->  IO (())
menuButtonClearChanged = menu_ClearChanged
menuButtonTakeFocus :: SysMenuBar a  ->  IO (Int)
menuButtonTakeFocus = menu_TakeFocus
menuButtonSetVisibleFocus :: SysMenuBar a  ->  IO (())
menuButtonSetVisibleFocus = menu_SetVisibleFocus
menuButtonClearVisibleFocus :: SysMenuBar a  ->  IO (())
menuButtonClearVisibleFocus = menu_ClearVisibleFocus
menuButtonModifyVisibleFocus :: SysMenuBar a  -> Int ->  IO (())
menuButtonModifyVisibleFocus = menu_ModifyVisibleFocus
menuButtonVisibleFocus :: SysMenuBar a  ->  IO (Int)
menuButtonVisibleFocus = menu_VisibleFocus
menuButtonContains :: SysMenuBar a  -> Widget b  ->  IO (Int)
menuButtonContains = menu_Contains
menuButtonInside :: SysMenuBar a  -> SysMenuBar a  ->  IO (Int)
menuButtonInside = menu_Inside
menuButtonRedraw :: SysMenuBar a  ->  IO (())
menuButtonRedraw = menu_Redraw
menuButtonRedrawLabel :: SysMenuBar a  ->  IO (())
menuButtonRedrawLabel = menu_RedrawLabel
menuButtonDamage :: SysMenuBar a  ->  IO (Word8)
menuButtonDamage = menu_Damage
menuButtonClearDamageWithBitmask :: SysMenuBar a  -> Word8 ->  IO (())
menuButtonClearDamageWithBitmask = menu_ClearDamageWithBitmask
menuButtonClearDamage :: SysMenuBar a  ->  IO (())
menuButtonClearDamage = menu_ClearDamage
menuButtonDamageWithText :: SysMenuBar a  -> Word8 ->  IO (())
menuButtonDamageWithText = menu_DamageWithText
menuButtonDamageInsideWidget :: SysMenuBar a  -> Word8 -> Rectangle ->  IO (())
menuButtonDamageInsideWidget = menu_DamageInsideWidget
menuButtonMeasureLabel :: SysMenuBar a  -> IO (Size)
menuButtonMeasureLabel = menu_MeasureLabel
menuButtonWindow :: SysMenuBar a  ->  IO (Window ())
menuButtonWindow = menu_Window
menuButtonTopWindow :: SysMenuBar a  ->  IO (Window ())
menuButtonTopWindow = menu_TopWindow
menuButtonTopWindowOffset :: SysMenuBar a -> IO (Position)
menuButtonTopWindowOffset = menu_TopWindowOffset
menuButtonItemPathnameWithFinditem :: SysMenuBar a  -> String -> Int -> MenuItem b  ->  IO (Int)
menuButtonItemPathnameWithFinditem = menu_ItemPathnameWithFinditem
menuButtonItemPathname :: SysMenuBar a  -> String -> Int ->  IO (Int)
menuButtonItemPathname = menu_ItemPathname
menuButtonPicked :: SysMenuBar a  -> MenuItem b ->  IO (MenuItem b)
menuButtonPicked = menu_Picked
menuButtonFind :: SysMenuBar a -> MenuItemLocator b -> IO (Int)
menuButtonFind = menu_Find
menuButtonTestShortcut :: SysMenuBar a  ->  IO (MenuItem b)
menuButtonTestShortcut = menu_TestShortcut
menuButtonGlobal :: SysMenuBar a  ->  IO ()
menuButtonGlobal = menu_Global
menuButtonMenu :: SysMenuBar a  ->  IO (SysMenuBar a)
menuButtonMenu = menu_Menu
menuButtonsetMenu :: SysMenuBar a -> [MenuItem b] -> IO ()
menuButtonsetMenu = menu_setMenu
menuButtonCopy :: SysMenuBar a  -> MenuItem b  ->  IO ()
menuButtonCopy = menu_Copy
menuButtonInsert :: SysMenuBar a -> Int -> String -> Shortcut -> (SysMenuBar a -> IO ()) -> [MenuProps] -> IO (Int)
menuButtonInsert = menu_Insert
menuButtonAdd :: MenuItem a -> String -> Shortcut -> (SysMenuBar b -> IO ()) -> [MenuProps] -> IO (Int)
menuButtonAdd = menu_Add
menuButtonSize :: SysMenuBar a  ->  IO (Int)
menuButtonSize = menu_Size
menuButtonSetSize :: SysMenuBar a  -> Int -> Int ->  IO ()
menuButtonSetSize = menu_SetSize
menuButtonClear :: SysMenuBar a  ->  IO ()
menuButtonClear = menu_Clear
menuButtonClearSubmenu :: SysMenuBar a  -> Int ->  IO (Int)
menuButtonClearSubmenu = menu_ClearSubmenu
menuButtonReplace :: SysMenuBar a  -> Int -> String ->  IO ()
menuButtonReplace = menu_Replace
menuButtonRemove :: SysMenuBar a  -> Int  ->  IO ()
menuButtonRemove = menu_Remove
menuButtonSetShortcut :: SysMenuBar a  -> Int -> ShortcutKeySequence ->  IO ()
menuButtonSetShortcut = menu_SetShortcut
menuButtonSetMode :: SysMenuBar a  -> Int -> Int ->  IO ()
menuButtonSetMode = menu_SetMode
menuButtonMode :: SysMenuBar a  -> Int ->  IO (Int)
menuButtonMode = menu_Mode
menuButtonMvalue :: SysMenuBar a  -> IO (MenuItem b)
menuButtonMvalue = menu_Mvalue
menuButtonValue :: SysMenuBar a  ->  IO (Int)
menuButtonValue = menu_Value
menuButtonSetValue :: SysMenuBar a -> MenuItemReference b -> IO (Int)
menuButtonSetValue = menu_SetValue
menuButtonText :: SysMenuBar a  ->  IO (String)
menuButtonText = menu_Text
menuButtonTextWithIndex :: SysMenuBar a  -> Int ->  IO (String)
menuButtonTextWithIndex = menu_TextWithIndex
menuButtonTextfont :: SysMenuBar a  ->  IO (Font)
menuButtonTextfont = menu_Textfont
menuButtonSetTextfont :: SysMenuBar a  -> Font ->  IO ()
menuButtonSetTextfont = menu_SetTextfont
menuButtonTextsize :: SysMenuBar a  ->  IO (FontSize)
menuButtonTextsize = menu_Textsize
menuButtonSetTextsize :: SysMenuBar a  -> FontSize ->  IO ()
menuButtonSetTextsize = menu_SetTextsize
menuButtonTextcolor :: SysMenuBar a  ->  IO (Color)
menuButtonTextcolor = menu_Textcolor
menuButtonSetTextcolor :: SysMenuBar a  -> Color ->  IO ()
menuButtonSetTextcolor = menu_SetTextcolor
menuButtonDownBox :: SysMenuBar a  ->  IO (Boxtype)
menuButtonDownBox = menu_DownBox
menuButtonSetDownBox :: SysMenuBar a  -> Boxtype ->  IO ()
menuButtonSetDownBox = menu_SetDownBox
menuButtonDownColor :: SysMenuBar a  ->  IO (Color)
menuButtonDownColor = menu_DownColor
menuButtonSetDownColor :: SysMenuBar a  -> Int ->  IO ()
menuButtonSetDownColor = menu_SetDownColor
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
menuButtonHandle :: SysMenuBar a -> Event -> IO Int
menuButtonHandle menu_bar event = withObject menu_bar (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event))
{#fun Fl_Menu_Button_popup as menuButtonPopup' { id `Ptr ()' } -> `Ptr ()' id #}
menuButtonPopup :: SysMenuBar a -> IO (MenuItem ())
menuButtonPopup menu_bar = withObject menu_bar (\p -> menuButtonPopup' p >>= toObject)
