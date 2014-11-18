{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Menu_Bar
    (
     -- * Constructor
     menuBarNew,
     menuBarDestroy,
     -- * Fl_Widget specific
     menuBarHandle,
     menuBarParent,
     menuBarSetParent,
     menuBarType_,
     menuBarSetType,
     menuBarAsWindow,
     menuBarX,
     menuBarY,
     menuBarW,
     menuBarH,
     menuBarSetAlign,
     menuBarAlign,
     menuBarBox,
     menuBarSetBox,
     menuBarColor,
     menuBarSetColor,
     menuBarSetColorWithBgSel,
     menuBarSelectionColor,
     menuBarSetSelectionColor,
     menuBarLabel,
     menuBarCopyLabel,
     menuBarSetLabel,
     menuBarLabeltype,
     menuBarSetLabeltype,
     menuBarLabelcolor,
     menuBarSetLabelcolor,
     menuBarLabelfont,
     menuBarSetLabelfont,
     menuBarLabelsize,
     menuBarSetLabelsize,
     menuBarImage,
     menuBarSetImage,
     menuBarDeimage,
     menuBarSetDeimage,
     menuBarTooltip,
     menuBarCopyTooltip,
     menuBarSetTooltip,
     menuBarWhen,
     menuBarSetWhen,
     menuBarVisible,
     menuBarVisibleR,
     menuBarShow,
     menuBarHide,
     menuBarSetVisible,
     menuBarClearVisible,
     menuBarActive,
     menuBarActiveR,
     menuBarActivate,
     menuBarDeactivate,
     menuBarOutput,
     menuBarSetOutput,
     menuBarClearOutput,
     menuBarTakesevents,
     menuBarSetChanged,
     menuBarClearChanged,
     menuBarTakeFocus,
     menuBarSetVisibleFocus,
     menuBarClearVisibleFocus,
     menuBarModifyVisibleFocus,
     menuBarVisibleFocus,
     menuBarContains,
     menuBarInside,
     menuBarRedraw,
     menuBarRedrawLabel,
     menuBarDamage,
     menuBarClearDamageWithBitmask,
     menuBarClearDamage,
     menuBarDamageWithText,
     menuBarDamageInsideWidget,
     menuBarMeasureLabel,
     menuBarWindow,
     menuBarTopWindow,
     menuBarTopWindowOffset,
     menuBarAsGroup,
     menuBarAsGlWindow,
     menuBarResize,
     menuBarSetCallback,
     menuBarDrawLabel,
     menuBarValue,
     menuBarSetValue,
     menuBarClear,
     menuBarSetShortcut,
     menuBarDownBox,
     menuBarSetDownBox,
     menuBarDownColor,
     menuBarSetDownColor,
     menuBarDrawBox,
     menuBarDrawBoxWithBoxtype,
     menuBarDrawBackdrop,
     menuBarDrawFocus,
     menuBarItemPathnameWithFinditem,
     menuBarItemPathname,
     menuBarPicked,
     menuBarFind,
     menuBarTestShortcut,
     menuBarGlobal,
     menuBarMenu,
     menuBarsetMenu,
     menuBarCopy,
     menuBarInsert,
     menuBarAdd,
     menuBarSize,
     menuBarSetSize,
     menuBarClearSubmenu,
     menuBarReplace,
     menuBarRemove,
     menuBarSetMode,
     menuBarMode,
     menuBarMvalue,
     menuBarText,
     menuBarTextWithIndex,
     menuBarTextfont,
     menuBarSetTextfont,
     menuBarTextsize,
     menuBarSetTextsize,
     menuBarTextcolor,
     menuBarSetTextcolor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_BarC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Menu_
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Menu_Bar_New as menuBarNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Bar_New_WithLabel as menuBarNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
menuBarNew :: Rectangle -> Maybe String -> IO (ValueInput ())
menuBarNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> menuBarNew' x_pos y_pos width height >>=
                             toObject
        Just l -> menuBarNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Menu_Bar_Destroy as menuBarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
menuBarDestroy :: ValueInput a -> IO ()
menuBarDestroy win = swapObject win $ \winPtr -> do
                                        menuBarDestroy' winPtr
                                        return nullPtr

menuBarAsGroup :: MenuBar a  ->  IO (Group ())
menuBarAsGroup = menu_AsGroup
menuBarAsGlWindow :: MenuBar a  ->  IO (GlWindow())
menuBarAsGlWindow = menu_AsGlWindow
menuBarResize :: MenuBar a  -> Rectangle -> IO (())
menuBarResize = menu_Resize
menuBarAsWindow :: MenuBar a  ->  IO (Window())
menuBarAsWindow = menu_AsWindow
menuBarHide :: MenuBar a  ->  IO (())
menuBarHide = menu_Hide
menuBarShow :: MenuBar a -> IO ()
menuBarShow = menu_Show
menuBarDrawBox :: MenuBar a -> IO ()
menuBarDrawBox = menu_DrawBox
menuBarDrawBoxWithBoxtype :: MenuBar a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
menuBarDrawBoxWithBoxtype = menu_DrawBoxWithBoxtype
menuBarDrawBackdrop :: MenuBar a -> IO ()
menuBarDrawBackdrop = menu_DrawBackdrop
menuBarDrawFocus :: MenuBar a -> Maybe (Boxtype, Rectangle) -> IO ()
menuBarDrawFocus = menu_DrawFocus
menuBarSetCallback :: MenuBar a -> (MenuBar b -> IO ()) -> IO (())
menuBarSetCallback = menu_SetCallback
menuBarParent :: MenuBar a -> IO (Group ())
menuBarParent = menu_Parent
menuBarSetParent :: MenuBar a -> Group b -> IO ()
menuBarSetParent = menu_SetParent
menuBarType_ :: MenuBar a  ->  IO (Word8)
menuBarType_ = menu_Type_
menuBarSetType :: MenuBar a  -> Word8 ->  IO (())
menuBarSetType = menu_SetType
menuBarDrawLabel :: MenuBar a  -> Maybe (Rectangle,AlignType)->  IO (())
menuBarDrawLabel = menu_DrawLabel
menuBarX :: MenuBar a  ->  IO (Int)
menuBarX = menu_X
menuBarY :: MenuBar a  ->  IO (Int)
menuBarY = menu_Y
menuBarW :: MenuBar a  ->  IO (Int)
menuBarW = menu_W
menuBarH :: MenuBar a  ->  IO (Int)
menuBarH = menu_H
menuBarSetAlign :: MenuBar a  -> AlignType ->  IO (())
menuBarSetAlign = menu_SetAlign
menuBarAlign :: MenuBar a  ->  IO (AlignType)
menuBarAlign = menu_Align
menuBarBox :: MenuBar a  ->  IO (Boxtype)
menuBarBox = menu_Box
menuBarSetBox :: MenuBar a  -> Boxtype ->  IO (())
menuBarSetBox = menu_SetBox
menuBarColor :: MenuBar a  ->  IO (Color)
menuBarColor = menu_Color
menuBarSetColor :: MenuBar a  -> Color ->  IO (())
menuBarSetColor = menu_SetColor
menuBarSetColorWithBgSel :: MenuBar a  -> Color -> Color ->  IO (())
menuBarSetColorWithBgSel = menu_SetColorWithBgSel
menuBarSelectionColor :: MenuBar a  ->  IO (Color)
menuBarSelectionColor = menu_SelectionColor
menuBarSetSelectionColor :: MenuBar a  -> Color ->  IO (())
menuBarSetSelectionColor = menu_SetSelectionColor
menuBarLabel :: MenuBar a  ->  IO (String)
menuBarLabel = menu_Label
menuBarCopyLabel :: MenuBar a  -> String ->  IO (())
menuBarCopyLabel = menu_CopyLabel
menuBarSetLabel :: MenuBar a  -> String ->  IO (())
menuBarSetLabel = menu_SetLabel
menuBarLabeltype :: MenuBar a  ->  IO (Labeltype)
menuBarLabeltype = menu_Labeltype
menuBarSetLabeltype :: MenuBar a  -> Labeltype ->  IO (())
menuBarSetLabeltype = menu_SetLabeltype
menuBarLabelcolor :: MenuBar a  ->  IO (Color)
menuBarLabelcolor = menu_Labelcolor
menuBarSetLabelcolor :: MenuBar a  -> Color ->  IO (())
menuBarSetLabelcolor = menu_SetLabelcolor
menuBarLabelfont :: MenuBar a  ->  IO (Font)
menuBarLabelfont = menu_Labelfont
menuBarSetLabelfont :: MenuBar a  -> Font ->  IO (())
menuBarSetLabelfont = menu_SetLabelfont
menuBarLabelsize :: MenuBar a  ->  IO (FontSize)
menuBarLabelsize = menu_Labelsize
menuBarSetLabelsize :: MenuBar a  -> FontSize ->  IO (())
menuBarSetLabelsize = menu_SetLabelsize
menuBarImage :: MenuBar a  ->  IO (Image ())
menuBarImage = menu_Image
menuBarSetImage :: MenuBar a  -> Image b ->  IO (())
menuBarSetImage = menu_SetImage
menuBarDeimage :: MenuBar a  ->  IO (Image ())
menuBarDeimage = menu_Deimage
menuBarSetDeimage :: MenuBar a  -> Image b ->  IO (())
menuBarSetDeimage = menu_SetDeimage
menuBarTooltip :: MenuBar a  ->  IO (String)
menuBarTooltip = menu_Tooltip
menuBarCopyTooltip :: MenuBar a  -> String ->  IO (())
menuBarCopyTooltip = menu_CopyTooltip
menuBarSetTooltip :: MenuBar a  -> String ->  IO (())
menuBarSetTooltip = menu_SetTooltip
menuBarWhen :: MenuBar a  ->  IO (When)
menuBarWhen = menu_When
menuBarSetWhen :: MenuBar a  -> Word8 ->  IO (())
menuBarSetWhen = menu_SetWhen
menuBarVisible :: MenuBar a  ->  IO (Int)
menuBarVisible = menu_Visible
menuBarVisibleR :: MenuBar a  ->  IO (Int)
menuBarVisibleR = menu_VisibleR
menuBarSetVisible :: MenuBar a  ->  IO (())
menuBarSetVisible = menu_SetVisible
menuBarClearVisible :: MenuBar a  ->  IO (())
menuBarClearVisible = menu_ClearVisible
menuBarActive :: MenuBar a  ->  IO (Int)
menuBarActive = menu_Active
menuBarActiveR :: MenuBar a  ->  IO (Int)
menuBarActiveR = menu_ActiveR
menuBarActivate :: MenuBar a  ->  IO (())
menuBarActivate = menu_Activate
menuBarDeactivate :: MenuBar a  ->  IO (())
menuBarDeactivate = menu_Deactivate
menuBarOutput :: MenuBar a  ->  IO (Int)
menuBarOutput = menu_Output
menuBarSetOutput :: MenuBar a  ->  IO (())
menuBarSetOutput = menu_SetOutput
menuBarClearOutput :: MenuBar a  ->  IO (())
menuBarClearOutput = menu_ClearOutput
menuBarTakesevents :: MenuBar a  ->  IO (Int)
menuBarTakesevents = menu_Takesevents
menuBarSetChanged :: MenuBar a  ->  IO (())
menuBarSetChanged = menu_SetChanged
menuBarClearChanged :: MenuBar a  ->  IO (())
menuBarClearChanged = menu_ClearChanged
menuBarTakeFocus :: MenuBar a  ->  IO (Int)
menuBarTakeFocus = menu_TakeFocus
menuBarSetVisibleFocus :: MenuBar a  ->  IO (())
menuBarSetVisibleFocus = menu_SetVisibleFocus
menuBarClearVisibleFocus :: MenuBar a  ->  IO (())
menuBarClearVisibleFocus = menu_ClearVisibleFocus
menuBarModifyVisibleFocus :: MenuBar a  -> Int ->  IO (())
menuBarModifyVisibleFocus = menu_ModifyVisibleFocus
menuBarVisibleFocus :: MenuBar a  ->  IO (Int)
menuBarVisibleFocus = menu_VisibleFocus
menuBarContains :: MenuBar a  -> Widget b  ->  IO (Int)
menuBarContains = menu_Contains
menuBarInside :: MenuBar a  -> MenuBar a  ->  IO (Int)
menuBarInside = menu_Inside
menuBarRedraw :: MenuBar a  ->  IO (())
menuBarRedraw = menu_Redraw
menuBarRedrawLabel :: MenuBar a  ->  IO (())
menuBarRedrawLabel = menu_RedrawLabel
menuBarDamage :: MenuBar a  ->  IO (Word8)
menuBarDamage = menu_Damage
menuBarClearDamageWithBitmask :: MenuBar a  -> Word8 ->  IO (())
menuBarClearDamageWithBitmask = menu_ClearDamageWithBitmask
menuBarClearDamage :: MenuBar a  ->  IO (())
menuBarClearDamage = menu_ClearDamage
menuBarDamageWithText :: MenuBar a  -> Word8 ->  IO (())
menuBarDamageWithText = menu_DamageWithText
menuBarDamageInsideWidget :: MenuBar a  -> Word8 -> Rectangle ->  IO (())
menuBarDamageInsideWidget = menu_DamageInsideWidget
menuBarMeasureLabel :: MenuBar a  -> IO (Size)
menuBarMeasureLabel = menu_MeasureLabel
menuBarWindow :: MenuBar a  ->  IO (Window ())
menuBarWindow = menu_Window
menuBarTopWindow :: MenuBar a  ->  IO (Window ())
menuBarTopWindow = menu_TopWindow
menuBarTopWindowOffset :: MenuBar a -> IO (Position)
menuBarTopWindowOffset = menu_TopWindowOffset
menuBarItemPathnameWithFinditem :: MenuBar a  -> String -> Int -> MenuItem b  ->  IO (Int)
menuBarItemPathnameWithFinditem = menu_ItemPathnameWithFinditem
menuBarItemPathname :: MenuBar a  -> String -> Int ->  IO (Int)
menuBarItemPathname = menu_ItemPathname
menuBarPicked :: MenuBar a  -> MenuItem b ->  IO (MenuItem b)
menuBarPicked = menu_Picked
menuBarFind :: MenuBar a -> MenuItemLocator b -> IO (Int)
menuBarFind = menu_Find
menuBarTestShortcut :: MenuBar a  ->  IO (MenuItem b)
menuBarTestShortcut = menu_TestShortcut
menuBarGlobal :: MenuBar a  ->  IO ()
menuBarGlobal = menu_Global
menuBarMenu :: MenuBar a  ->  IO (MenuBar a)
menuBarMenu = menu_Menu
menuBarsetMenu :: MenuBar a -> [MenuItem b] -> IO ()
menuBarsetMenu = menu_setMenu
menuBarCopy :: MenuBar a  -> MenuItem b  ->  IO ()
menuBarCopy = menu_Copy
menuBarInsert :: MenuBar a -> Int -> String -> Shortcut -> (MenuBar a -> IO ()) -> [MenuProps] -> IO (Int)
menuBarInsert = menu_Insert
menuBarAdd :: MenuItem a -> String -> Shortcut -> (MenuBar b -> IO ()) -> [MenuProps] -> IO (Int)
menuBarAdd = menu_Add
menuBarSize :: MenuBar a  ->  IO (Int)
menuBarSize = menu_Size
menuBarSetSize :: MenuBar a  -> Int -> Int ->  IO ()
menuBarSetSize = menu_SetSize
menuBarClear :: MenuBar a  ->  IO ()
menuBarClear = menu_Clear
menuBarClearSubmenu :: MenuBar a  -> Int ->  IO (Int)
menuBarClearSubmenu = menu_ClearSubmenu
menuBarReplace :: MenuBar a  -> Int -> String ->  IO ()
menuBarReplace = menu_Replace
menuBarRemove :: MenuBar a  -> Int  ->  IO ()
menuBarRemove = menu_Remove
menuBarSetShortcut :: MenuBar a  -> Int -> ShortcutKeySequence ->  IO ()
menuBarSetShortcut = menu_SetShortcut
menuBarSetMode :: MenuBar a  -> Int -> Int ->  IO ()
menuBarSetMode = menu_SetMode
menuBarMode :: MenuBar a  -> Int ->  IO (Int)
menuBarMode = menu_Mode
menuBarMvalue :: MenuBar a  -> IO (MenuItem b)
menuBarMvalue = menu_Mvalue
menuBarValue :: MenuBar a  ->  IO (Int)
menuBarValue = menu_Value
menuBarSetValue :: MenuBar a -> MenuItemReference b -> IO (Int)
menuBarSetValue = menu_SetValue
menuBarText :: MenuBar a  ->  IO (String)
menuBarText = menu_Text
menuBarTextWithIndex :: MenuBar a  -> Int ->  IO (String)
menuBarTextWithIndex = menu_TextWithIndex
menuBarTextfont :: MenuBar a  ->  IO (Font)
menuBarTextfont = menu_Textfont
menuBarSetTextfont :: MenuBar a  -> Font ->  IO ()
menuBarSetTextfont = menu_SetTextfont
menuBarTextsize :: MenuBar a  ->  IO (FontSize)
menuBarTextsize = menu_Textsize
menuBarSetTextsize :: MenuBar a  -> FontSize ->  IO ()
menuBarSetTextsize = menu_SetTextsize
menuBarTextcolor :: MenuBar a  ->  IO (Color)
menuBarTextcolor = menu_Textcolor
menuBarSetTextcolor :: MenuBar a  -> Color ->  IO ()
menuBarSetTextcolor = menu_SetTextcolor
menuBarDownBox :: MenuBar a  ->  IO (Boxtype)
menuBarDownBox = menu_DownBox
menuBarSetDownBox :: MenuBar a  -> Boxtype ->  IO ()
menuBarSetDownBox = menu_SetDownBox
menuBarDownColor :: MenuBar a  ->  IO (Color)
menuBarDownColor = menu_DownColor
menuBarSetDownColor :: MenuBar a  -> Int ->  IO ()
menuBarSetDownColor = menu_SetDownColor
{#fun Fl_Menu_Bar_handle as menuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
menuBarHandle :: MenuPrim a -> Event -> IO Int
menuBarHandle menu_bar event = withObject menu_bar (\p -> menuBarHandle' p (fromIntegral . fromEnum $ event))