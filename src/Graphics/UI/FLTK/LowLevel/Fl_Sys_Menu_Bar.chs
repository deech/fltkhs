    {-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Sys_Menu_Bar
    (
     -- * Constructor
     sysMenuBarNew,
     sysMenuBarDestroy,
     -- * Fl_Widget specific
     sysMenuBarHandle,
     sysMenuBarParent,
     sysMenuBarSetParent,
     sysMenuBarType_,
     sysMenuBarSetType,
     sysMenuBarAsWindow,
     sysMenuBarX,
     sysMenuBarY,
     sysMenuBarW,
     sysMenuBarH,
     sysMenuBarSetAlign,
     sysMenuBarAlign,
     sysMenuBarBox,
     sysMenuBarSetBox,
     sysMenuBarColor,
     sysMenuBarSetColor,
     sysMenuBarSetColorWithBgSel,
     sysMenuBarSelectionColor,
     sysMenuBarSetSelectionColor,
     sysMenuBarLabel,
     sysMenuBarCopyLabel,
     sysMenuBarSetLabel,
     sysMenuBarLabeltype,
     sysMenuBarSetLabeltype,
     sysMenuBarLabelcolor,
     sysMenuBarSetLabelcolor,
     sysMenuBarLabelfont,
     sysMenuBarSetLabelfont,
     sysMenuBarLabelsize,
     sysMenuBarSetLabelsize,
     sysMenuBarImage,
     sysMenuBarSetImage,
     sysMenuBarDeimage,
     sysMenuBarSetDeimage,
     sysMenuBarTooltip,
     sysMenuBarCopyTooltip,
     sysMenuBarSetTooltip,
     sysMenuBarWhen,
     sysMenuBarSetWhen,
     sysMenuBarVisible,
     sysMenuBarVisibleR,
     sysMenuBarShow,
     sysMenuBarHide,
     sysMenuBarSetVisible,
     sysMenuBarClearVisible,
     sysMenuBarActive,
     sysMenuBarActiveR,
     sysMenuBarActivate,
     sysMenuBarDeactivate,
     sysMenuBarOutput,
     sysMenuBarSetOutput,
     sysMenuBarClearOutput,
     sysMenuBarTakesevents,
     sysMenuBarSetChanged,
     sysMenuBarClearChanged,
     sysMenuBarTakeFocus,
     sysMenuBarSetVisibleFocus,
     sysMenuBarClearVisibleFocus,
     sysMenuBarModifyVisibleFocus,
     sysMenuBarVisibleFocus,
     sysMenuBarContains,
     sysMenuBarInside,
     sysMenuBarRedraw,
     sysMenuBarRedrawLabel,
     sysMenuBarDamage,
     sysMenuBarClearDamageWithBitmask,
     sysMenuBarClearDamage,
     sysMenuBarDamageWithText,
     sysMenuBarDamageInsideWidget,
     sysMenuBarMeasureLabel,
     sysMenuBarWindow,
     sysMenuBarTopWindow,
     sysMenuBarTopWindowOffset,
     sysMenuBarAsGroup,
     sysMenuBarAsGlWindow,
     sysMenuBarResize,
     sysMenuBarSetCallback,
     sysMenuBarDrawLabel,
     sysMenuBarValue,
     sysMenuBarSetValue,
     sysMenuBarClear,
     sysMenuBarSetShortcut,
     sysMenuBarDownBox,
     sysMenuBarSetDownBox,
     sysMenuBarDownColor,
     sysMenuBarSetDownColor,
     sysMenuBarDrawBox,
     sysMenuBarDrawBoxWithBoxtype,
     sysMenuBarDrawBackdrop,
     sysMenuBarDrawFocus,
     sysMenuBarItemPathnameWithFinditem,
     sysMenuBarItemPathname,
     sysMenuBarPicked,
     sysMenuBarFind,
     sysMenuBarTestShortcut,
     sysMenuBarGlobal,
     sysMenuBarMenu,
     sysMenuBarsetMenu,
     sysMenuBarCopy,
     sysMenuBarInsert,
     sysMenuBarAdd,
     sysMenuBarSize,
     sysMenuBarSetSize,
     sysMenuBarClearSubmenu,
     sysMenuBarReplace,
     sysMenuBarRemove,
     sysMenuBarSetMode,
     sysMenuBarMode,
     sysMenuBarMvalue,
     sysMenuBarText,
     sysMenuBarTextWithIndex,
     sysMenuBarTextfont,
     sysMenuBarSetTextfont,
     sysMenuBarTextsize,
     sysMenuBarSetTextsize,
     sysMenuBarTextcolor,
     sysMenuBarSetTextcolor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Sys_Menu_BarC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Menu_
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Sys_Menu_Bar_New as sysMenuBarNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Sys_Menu_Bar_New_WithLabel as sysMenuBarNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
sysMenuBarNew :: Rectangle -> Maybe String -> IO (ValueInput ())
sysMenuBarNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> sysMenuBarNew' x_pos y_pos width height >>=
                             toObject
        Just l -> sysMenuBarNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Sys_Menu_Bar_Destroy as sysMenuBarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sysMenuBarDestroy :: ValueInput a -> IO ()
sysMenuBarDestroy win = swapObject win $ \winPtr -> do
                                        sysMenuBarDestroy' winPtr
                                        return nullPtr

sysMenuBarAsGroup :: SysMenuBar a  ->  IO (Group ())
sysMenuBarAsGroup = menu_AsGroup
sysMenuBarAsGlWindow :: SysMenuBar a  ->  IO (GlWindow())
sysMenuBarAsGlWindow = menu_AsGlWindow
sysMenuBarResize :: SysMenuBar a  -> Rectangle -> IO (())
sysMenuBarResize = menu_Resize
sysMenuBarAsWindow :: SysMenuBar a  ->  IO (Window())
sysMenuBarAsWindow = menu_AsWindow
sysMenuBarHide :: SysMenuBar a  ->  IO (())
sysMenuBarHide = menu_Hide
sysMenuBarShow :: SysMenuBar a -> IO ()
sysMenuBarShow = menu_Show
sysMenuBarDrawBox :: SysMenuBar a -> IO ()
sysMenuBarDrawBox = menu_DrawBox
sysMenuBarDrawBoxWithBoxtype :: SysMenuBar a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
sysMenuBarDrawBoxWithBoxtype = menu_DrawBoxWithBoxtype
sysMenuBarDrawBackdrop :: SysMenuBar a -> IO ()
sysMenuBarDrawBackdrop = menu_DrawBackdrop
sysMenuBarDrawFocus :: SysMenuBar a -> Maybe (Boxtype, Rectangle) -> IO ()
sysMenuBarDrawFocus = menu_DrawFocus
sysMenuBarSetCallback :: SysMenuBar a -> (SysMenuBar b -> IO ()) -> IO (())
sysMenuBarSetCallback = menu_SetCallback
sysMenuBarParent :: SysMenuBar a -> IO (Group ())
sysMenuBarParent = menu_Parent
sysMenuBarSetParent :: SysMenuBar a -> Group b -> IO ()
sysMenuBarSetParent = menu_SetParent
sysMenuBarType_ :: SysMenuBar a  ->  IO (Word8)
sysMenuBarType_ = menu_Type_
sysMenuBarSetType :: SysMenuBar a  -> Word8 ->  IO (())
sysMenuBarSetType = menu_SetType
sysMenuBarDrawLabel :: SysMenuBar a  -> Maybe (Rectangle,AlignType)->  IO (())
sysMenuBarDrawLabel = menu_DrawLabel
sysMenuBarX :: SysMenuBar a  ->  IO (Int)
sysMenuBarX = menu_X
sysMenuBarY :: SysMenuBar a  ->  IO (Int)
sysMenuBarY = menu_Y
sysMenuBarW :: SysMenuBar a  ->  IO (Int)
sysMenuBarW = menu_W
sysMenuBarH :: SysMenuBar a  ->  IO (Int)
sysMenuBarH = menu_H
sysMenuBarSetAlign :: SysMenuBar a  -> AlignType ->  IO (())
sysMenuBarSetAlign = menu_SetAlign
sysMenuBarAlign :: SysMenuBar a  ->  IO (AlignType)
sysMenuBarAlign = menu_Align
sysMenuBarBox :: SysMenuBar a  ->  IO (Boxtype)
sysMenuBarBox = menu_Box
sysMenuBarSetBox :: SysMenuBar a  -> Boxtype ->  IO (())
sysMenuBarSetBox = menu_SetBox
sysMenuBarColor :: SysMenuBar a  ->  IO (Color)
sysMenuBarColor = menu_Color
sysMenuBarSetColor :: SysMenuBar a  -> Color ->  IO (())
sysMenuBarSetColor = menu_SetColor
sysMenuBarSetColorWithBgSel :: SysMenuBar a  -> Color -> Color ->  IO (())
sysMenuBarSetColorWithBgSel = menu_SetColorWithBgSel
sysMenuBarSelectionColor :: SysMenuBar a  ->  IO (Color)
sysMenuBarSelectionColor = menu_SelectionColor
sysMenuBarSetSelectionColor :: SysMenuBar a  -> Color ->  IO (())
sysMenuBarSetSelectionColor = menu_SetSelectionColor
sysMenuBarLabel :: SysMenuBar a  ->  IO (String)
sysMenuBarLabel = menu_Label
sysMenuBarCopyLabel :: SysMenuBar a  -> String ->  IO (())
sysMenuBarCopyLabel = menu_CopyLabel
sysMenuBarSetLabel :: SysMenuBar a  -> String ->  IO (())
sysMenuBarSetLabel = menu_SetLabel
sysMenuBarLabeltype :: SysMenuBar a  ->  IO (Labeltype)
sysMenuBarLabeltype = menu_Labeltype
sysMenuBarSetLabeltype :: SysMenuBar a  -> Labeltype ->  IO (())
sysMenuBarSetLabeltype = menu_SetLabeltype
sysMenuBarLabelcolor :: SysMenuBar a  ->  IO (Color)
sysMenuBarLabelcolor = menu_Labelcolor
sysMenuBarSetLabelcolor :: SysMenuBar a  -> Color ->  IO (())
sysMenuBarSetLabelcolor = menu_SetLabelcolor
sysMenuBarLabelfont :: SysMenuBar a  ->  IO (Font)
sysMenuBarLabelfont = menu_Labelfont
sysMenuBarSetLabelfont :: SysMenuBar a  -> Font ->  IO (())
sysMenuBarSetLabelfont = menu_SetLabelfont
sysMenuBarLabelsize :: SysMenuBar a  ->  IO (FontSize)
sysMenuBarLabelsize = menu_Labelsize
sysMenuBarSetLabelsize :: SysMenuBar a  -> FontSize ->  IO (())
sysMenuBarSetLabelsize = menu_SetLabelsize
sysMenuBarImage :: SysMenuBar a  ->  IO (Image ())
sysMenuBarImage = menu_Image
sysMenuBarSetImage :: SysMenuBar a  -> Image b ->  IO (())
sysMenuBarSetImage = menu_SetImage
sysMenuBarDeimage :: SysMenuBar a  ->  IO (Image ())
sysMenuBarDeimage = menu_Deimage
sysMenuBarSetDeimage :: SysMenuBar a  -> Image b ->  IO (())
sysMenuBarSetDeimage = menu_SetDeimage
sysMenuBarTooltip :: SysMenuBar a  ->  IO (String)
sysMenuBarTooltip = menu_Tooltip
sysMenuBarCopyTooltip :: SysMenuBar a  -> String ->  IO (())
sysMenuBarCopyTooltip = menu_CopyTooltip
sysMenuBarSetTooltip :: SysMenuBar a  -> String ->  IO (())
sysMenuBarSetTooltip = menu_SetTooltip
sysMenuBarWhen :: SysMenuBar a  ->  IO (When)
sysMenuBarWhen = menu_When
sysMenuBarSetWhen :: SysMenuBar a  -> Word8 ->  IO (())
sysMenuBarSetWhen = menu_SetWhen
sysMenuBarVisible :: SysMenuBar a  ->  IO (Int)
sysMenuBarVisible = menu_Visible
sysMenuBarVisibleR :: SysMenuBar a  ->  IO (Int)
sysMenuBarVisibleR = menu_VisibleR
sysMenuBarSetVisible :: SysMenuBar a  ->  IO (())
sysMenuBarSetVisible = menu_SetVisible
sysMenuBarClearVisible :: SysMenuBar a  ->  IO (())
sysMenuBarClearVisible = menu_ClearVisible
sysMenuBarActive :: SysMenuBar a  ->  IO (Int)
sysMenuBarActive = menu_Active
sysMenuBarActiveR :: SysMenuBar a  ->  IO (Int)
sysMenuBarActiveR = menu_ActiveR
sysMenuBarActivate :: SysMenuBar a  ->  IO (())
sysMenuBarActivate = menu_Activate
sysMenuBarDeactivate :: SysMenuBar a  ->  IO (())
sysMenuBarDeactivate = menu_Deactivate
sysMenuBarOutput :: SysMenuBar a  ->  IO (Int)
sysMenuBarOutput = menu_Output
sysMenuBarSetOutput :: SysMenuBar a  ->  IO (())
sysMenuBarSetOutput = menu_SetOutput
sysMenuBarClearOutput :: SysMenuBar a  ->  IO (())
sysMenuBarClearOutput = menu_ClearOutput
sysMenuBarTakesevents :: SysMenuBar a  ->  IO (Int)
sysMenuBarTakesevents = menu_Takesevents
sysMenuBarSetChanged :: SysMenuBar a  ->  IO (())
sysMenuBarSetChanged = menu_SetChanged
sysMenuBarClearChanged :: SysMenuBar a  ->  IO (())
sysMenuBarClearChanged = menu_ClearChanged
sysMenuBarTakeFocus :: SysMenuBar a  ->  IO (Int)
sysMenuBarTakeFocus = menu_TakeFocus
sysMenuBarSetVisibleFocus :: SysMenuBar a  ->  IO (())
sysMenuBarSetVisibleFocus = menu_SetVisibleFocus
sysMenuBarClearVisibleFocus :: SysMenuBar a  ->  IO (())
sysMenuBarClearVisibleFocus = menu_ClearVisibleFocus
sysMenuBarModifyVisibleFocus :: SysMenuBar a  -> Int ->  IO (())
sysMenuBarModifyVisibleFocus = menu_ModifyVisibleFocus
sysMenuBarVisibleFocus :: SysMenuBar a  ->  IO (Int)
sysMenuBarVisibleFocus = menu_VisibleFocus
sysMenuBarContains :: SysMenuBar a  -> Widget b  ->  IO (Int)
sysMenuBarContains = menu_Contains
sysMenuBarInside :: SysMenuBar a  -> SysMenuBar a  ->  IO (Int)
sysMenuBarInside = menu_Inside
sysMenuBarRedraw :: SysMenuBar a  ->  IO (())
sysMenuBarRedraw = menu_Redraw
sysMenuBarRedrawLabel :: SysMenuBar a  ->  IO (())
sysMenuBarRedrawLabel = menu_RedrawLabel
sysMenuBarDamage :: SysMenuBar a  ->  IO (Word8)
sysMenuBarDamage = menu_Damage
sysMenuBarClearDamageWithBitmask :: SysMenuBar a  -> Word8 ->  IO (())
sysMenuBarClearDamageWithBitmask = menu_ClearDamageWithBitmask
sysMenuBarClearDamage :: SysMenuBar a  ->  IO (())
sysMenuBarClearDamage = menu_ClearDamage
sysMenuBarDamageWithText :: SysMenuBar a  -> Word8 ->  IO (())
sysMenuBarDamageWithText = menu_DamageWithText
sysMenuBarDamageInsideWidget :: SysMenuBar a  -> Word8 -> Rectangle ->  IO (())
sysMenuBarDamageInsideWidget = menu_DamageInsideWidget
sysMenuBarMeasureLabel :: SysMenuBar a  -> IO (Size)
sysMenuBarMeasureLabel = menu_MeasureLabel
sysMenuBarWindow :: SysMenuBar a  ->  IO (Window ())
sysMenuBarWindow = menu_Window
sysMenuBarTopWindow :: SysMenuBar a  ->  IO (Window ())
sysMenuBarTopWindow = menu_TopWindow
sysMenuBarTopWindowOffset :: SysMenuBar a -> IO (Position)
sysMenuBarTopWindowOffset = menu_TopWindowOffset
sysMenuBarItemPathnameWithFinditem :: SysMenuBar a  -> String -> Int -> MenuItem b  ->  IO (Int)
sysMenuBarItemPathnameWithFinditem = menu_ItemPathnameWithFinditem
sysMenuBarItemPathname :: SysMenuBar a  -> String -> Int ->  IO (Int)
sysMenuBarItemPathname = menu_ItemPathname
sysMenuBarPicked :: SysMenuBar a  -> MenuItem b ->  IO (MenuItem b)
sysMenuBarPicked = menu_Picked
sysMenuBarFind :: SysMenuBar a -> MenuItemLocator b -> IO (Int)
sysMenuBarFind = menu_Find
sysMenuBarTestShortcut :: SysMenuBar a  ->  IO (MenuItem b)
sysMenuBarTestShortcut = menu_TestShortcut
sysMenuBarGlobal :: SysMenuBar a  ->  IO ()
sysMenuBarGlobal = menu_Global
sysMenuBarMenu :: SysMenuBar a  ->  IO (SysMenuBar a)
sysMenuBarMenu = menu_Menu
sysMenuBarsetMenu :: SysMenuBar a -> [MenuItem b] -> IO ()
sysMenuBarsetMenu = menu_setMenu
sysMenuBarCopy :: SysMenuBar a  -> MenuItem b  ->  IO ()
sysMenuBarCopy = menu_Copy
sysMenuBarInsert :: SysMenuBar a -> Int -> String -> Maybe Shortcut -> (SysMenuBar a -> IO ()) -> [MenuProps] -> IO (Int)
sysMenuBarInsert = menu_Insert
sysMenuBarAdd :: MenuItem a -> String -> Maybe Shortcut -> (SysMenuBar b -> IO ()) -> [MenuProps] -> IO (Int)
sysMenuBarAdd = menu_Add
sysMenuBarSize :: SysMenuBar a  ->  IO (Int)
sysMenuBarSize = menu_Size
sysMenuBarSetSize :: SysMenuBar a  -> Int -> Int ->  IO ()
sysMenuBarSetSize = menu_SetSize
sysMenuBarClear :: SysMenuBar a  ->  IO ()
sysMenuBarClear = menu_Clear
sysMenuBarClearSubmenu :: SysMenuBar a  -> Int ->  IO (Int)
sysMenuBarClearSubmenu = menu_ClearSubmenu
sysMenuBarReplace :: SysMenuBar a  -> Int -> String ->  IO ()
sysMenuBarReplace = menu_Replace
sysMenuBarRemove :: SysMenuBar a  -> Int  ->  IO ()
sysMenuBarRemove = menu_Remove
sysMenuBarSetShortcut :: SysMenuBar a  -> Int -> ShortcutKeySequence ->  IO ()
sysMenuBarSetShortcut = menu_SetShortcut
sysMenuBarSetMode :: SysMenuBar a  -> Int -> Int ->  IO ()
sysMenuBarSetMode = menu_SetMode
sysMenuBarMode :: SysMenuBar a  -> Int ->  IO (Int)
sysMenuBarMode = menu_Mode
sysMenuBarMvalue :: SysMenuBar a  -> IO (MenuItem b)
sysMenuBarMvalue = menu_Mvalue
sysMenuBarValue :: SysMenuBar a  ->  IO (Int)
sysMenuBarValue = menu_Value
sysMenuBarSetValue :: SysMenuBar a -> MenuItemReference b -> IO (Int)
sysMenuBarSetValue = menu_SetValue
sysMenuBarText :: SysMenuBar a  ->  IO (String)
sysMenuBarText = menu_Text
sysMenuBarTextWithIndex :: SysMenuBar a  -> Int ->  IO (String)
sysMenuBarTextWithIndex = menu_TextWithIndex
sysMenuBarTextfont :: SysMenuBar a  ->  IO (Font)
sysMenuBarTextfont = menu_Textfont
sysMenuBarSetTextfont :: SysMenuBar a  -> Font ->  IO ()
sysMenuBarSetTextfont = menu_SetTextfont
sysMenuBarTextsize :: SysMenuBar a  ->  IO (FontSize)
sysMenuBarTextsize = menu_Textsize
sysMenuBarSetTextsize :: SysMenuBar a  -> FontSize ->  IO ()
sysMenuBarSetTextsize = menu_SetTextsize
sysMenuBarTextcolor :: SysMenuBar a  ->  IO (Color)
sysMenuBarTextcolor = menu_Textcolor
sysMenuBarSetTextcolor :: SysMenuBar a  -> Color ->  IO ()
sysMenuBarSetTextcolor = menu_SetTextcolor
sysMenuBarDownBox :: SysMenuBar a  ->  IO (Boxtype)
sysMenuBarDownBox = menu_DownBox
sysMenuBarSetDownBox :: SysMenuBar a  -> Boxtype ->  IO ()
sysMenuBarSetDownBox = menu_SetDownBox
sysMenuBarDownColor :: SysMenuBar a  ->  IO (Color)
sysMenuBarDownColor = menu_DownColor
sysMenuBarSetDownColor :: SysMenuBar a  -> Int ->  IO ()
sysMenuBarSetDownColor = menu_SetDownColor
{#fun Fl_Sys_Menu_Bar_handle as sysMenuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
sysMenuBarHandle :: SysMenuBar a -> Event -> IO Int
sysMenuBarHandle menu_bar event = withObject menu_bar (\p -> sysMenuBarHandle' p (fromIntegral . fromEnum $ event))