{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Check_Button
    (
     checkButtonNew,
     checkButtonDestroy,
     checkButtonHandle,
     checkButtonParent,
     checkButtonSetParent,
     checkButtonType_,
     checkButtonSetType,
     checkButtonAsWindow,
     checkButtonX,
     checkButtonY,
     checkButtonW,
     checkButtonH,
     checkButtonSetAlign,
     checkButtonAlign,
     checkButtonBox,
     checkButtonSetBox,
     checkButtonColor,
     checkButtonSetColor,
     checkButtonSetColorWithBgSel,
     checkButtonSelectionColor,
     checkButtonSetSelectionColor,
     checkButtonLabel,
     checkButtonCopyLabel,
     checkButtonSetLabel,
     checkButtonLabeltype,
     checkButtonSetLabeltype,
     checkButtonLabelcolor,
     checkButtonSetLabelcolor,
     checkButtonLabelfont,
     checkButtonSetLabelfont,
     checkButtonLabelsize,
     checkButtonSetLabelsize,
     checkButtonImage,
     checkButtonSetImage,
     checkButtonDeimage,
     checkButtonSetDeimage,
     checkButtonTooltip,
     checkButtonCopyTooltip,
     checkButtonSetTooltip,
     checkButtonWhen,
     checkButtonSetWhen,
     checkButtonVisible,
     checkButtonVisibleR,
     checkButtonShow,
     checkButtonHide,
     checkButtonSetVisible,
     checkButtonClearVisible,
     checkButtonActive,
     checkButtonActiveR,
     checkButtonActivate,
     checkButtonDeactivate,
     checkButtonOutput,
     checkButtonSetOutput,
     checkButtonClearOutput,
     checkButtonTakesevents,
     checkButtonSetChanged,
     checkButtonClearChanged,
     checkButtonTakeFocus,
     checkButtonSetVisibleFocus,
     checkButtonClearVisibleFocus,
     checkButtonModifyVisibleFocus,
     checkButtonVisibleFocus,
     checkButtonContains,
     checkButtonInside,
     checkButtonRedraw,
     checkButtonRedrawLabel,
     checkButtonDamage,
     checkButtonClearDamageWithBitmask,
     checkButtonClearDamage,
     checkButtonDamageWithText,
     checkButtonDamageInsideWidget,
     checkButtonMeasureLabel,
     checkButtonWindow,
     checkButtonTopWindow,
     checkButtonTopWindowOffset,
     checkButtonAsGroup,
     checkButtonAsGlWindow,
     checkButtonResize,
     checkButtonSetCallback,
     checkButtonDrawLabel,
     checkButtonValue,
     checkButtonSetValue,
     checkButtonSet,
     checkButtonClear,
     checkButtonSetonly,
     checkButtonGetShortcut,
     checkButtonSetShortcut,
     checkButtonDownBox,
     checkButtonSetDownBox,
     checkButtonDownColor,
     checkButtonSetDownColor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Check_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Check_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Check_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
checkButtonNew :: Rectangle -> Maybe String -> IO (CheckButton ())
checkButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                   toObject
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                   toObject
{# fun Fl_Check_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
checkButtonDestroy :: CheckButton a -> IO ()
checkButtonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
checkButtonHandle :: CheckButton a -> Event -> IO Int
checkButtonHandle = buttonHandle
checkButtonAsGroup :: CheckButton a  ->  IO (Group ())
checkButtonAsGroup = buttonAsGroup
checkButtonAsGlWindow :: CheckButton a  ->  IO (GlWindow())
checkButtonAsGlWindow = buttonAsGlWindow
checkButtonAsWindow :: CheckButton a  ->  IO (Window())
checkButtonAsWindow = buttonAsWindow
checkButtonResize :: CheckButton a  -> Rectangle -> IO (())
checkButtonResize = buttonResize
checkButtonHide :: CheckButton a  ->  IO (())
checkButtonHide = buttonHide
checkButtonShow :: CheckButton a -> IO ()
checkButtonShow= buttonShow
checkButtonSetCallback :: CheckButton a -> (CheckButton b -> IO ()) -> IO (())
checkButtonSetCallback= buttonSetCallback
checkButtonParent :: CheckButton a -> IO (Group ())
checkButtonParent= buttonParent
checkButtonSetParent :: CheckButton a -> Group b -> IO ()
checkButtonSetParent= buttonSetParent
checkButtonType_ :: CheckButton a  ->  IO (Word8)
checkButtonType_= buttonType_
checkButtonSetType :: CheckButton a  -> Word8 ->  IO (())
checkButtonSetType= buttonSetType
checkButtonDrawLabel :: CheckButton a  -> Maybe (Rectangle,AlignType)->  IO (())
checkButtonDrawLabel= buttonDrawLabel
checkButtonX :: CheckButton a  ->  IO (Int)
checkButtonX= buttonX
checkButtonY :: CheckButton a  ->  IO (Int)
checkButtonY= buttonY
checkButtonW :: CheckButton a  ->  IO (Int)
checkButtonW= buttonW
checkButtonH :: CheckButton a  ->  IO (Int)
checkButtonH= buttonH
checkButtonSetAlign :: CheckButton a  -> AlignType ->  IO (())
checkButtonSetAlign= buttonSetAlign
checkButtonAlign :: CheckButton a  ->  IO (AlignType)
checkButtonAlign= buttonAlign
checkButtonBox :: CheckButton a  ->  IO (Boxtype)
checkButtonBox= buttonBox
checkButtonSetBox :: CheckButton a  -> Boxtype ->  IO (())
checkButtonSetBox= buttonSetBox
checkButtonColor :: CheckButton a  ->  IO (Color)
checkButtonColor= buttonColor
checkButtonSetColor :: CheckButton a  -> Color ->  IO (())
checkButtonSetColor= buttonSetColor
checkButtonSetColorWithBgSel :: CheckButton a  -> Color -> Color ->  IO (())
checkButtonSetColorWithBgSel= buttonSetColorWithBgSel
checkButtonSelectionColor :: CheckButton a  ->  IO (Color)
checkButtonSelectionColor= buttonSelectionColor
checkButtonSetSelectionColor :: CheckButton a  -> Color ->  IO (())
checkButtonSetSelectionColor= buttonSetSelectionColor
checkButtonLabel :: CheckButton a  ->  IO (String)
checkButtonLabel= buttonLabel
checkButtonCopyLabel :: CheckButton a  -> String ->  IO (())
checkButtonCopyLabel= buttonCopyLabel
checkButtonSetLabel :: CheckButton a  -> String ->  IO (())
checkButtonSetLabel= buttonSetLabel
checkButtonLabeltype :: CheckButton a  ->  IO (Labeltype)
checkButtonLabeltype= buttonLabeltype
checkButtonSetLabeltype :: CheckButton a  -> Labeltype ->  IO (())
checkButtonSetLabeltype= buttonSetLabeltype
checkButtonLabelcolor :: CheckButton a  ->  IO (Color)
checkButtonLabelcolor= buttonLabelcolor
checkButtonSetLabelcolor :: CheckButton a  -> Color ->  IO (())
checkButtonSetLabelcolor= buttonSetLabelcolor
checkButtonLabelfont :: CheckButton a  ->  IO (Font)
checkButtonLabelfont= buttonLabelfont
checkButtonSetLabelfont :: CheckButton a  -> Font ->  IO (())
checkButtonSetLabelfont= buttonSetLabelfont
checkButtonLabelsize :: CheckButton a  ->  IO (FontSize)
checkButtonLabelsize= buttonLabelsize
checkButtonSetLabelsize :: CheckButton a  -> FontSize ->  IO (())
checkButtonSetLabelsize= buttonSetLabelsize
checkButtonImage :: CheckButton a  ->  IO (Image ())
checkButtonImage= buttonImage
checkButtonSetImage :: CheckButton a  -> Image b ->  IO (())
checkButtonSetImage= buttonSetImage
checkButtonDeimage :: CheckButton a  ->  IO (Image ())
checkButtonDeimage= buttonDeimage
checkButtonSetDeimage :: CheckButton a  -> Image b ->  IO (())
checkButtonSetDeimage= buttonSetDeimage
checkButtonTooltip :: CheckButton a  ->  IO (String)
checkButtonTooltip= buttonTooltip
checkButtonCopyTooltip :: CheckButton a  -> String ->  IO (())
checkButtonCopyTooltip= buttonCopyTooltip
checkButtonSetTooltip :: CheckButton a  -> String ->  IO (())
checkButtonSetTooltip= buttonSetTooltip
checkButtonWhen :: CheckButton a  ->  IO (When)
checkButtonWhen= buttonWhen
checkButtonSetWhen :: CheckButton a  -> Word8 ->  IO (())
checkButtonSetWhen= buttonSetWhen
checkButtonVisible :: CheckButton a  ->  IO (Int)
checkButtonVisible= buttonVisible
checkButtonVisibleR :: CheckButton a  ->  IO (Int)
checkButtonVisibleR= buttonVisibleR
checkButtonSetVisible :: CheckButton a  ->  IO (())
checkButtonSetVisible= buttonSetVisible
checkButtonClearVisible :: CheckButton a  ->  IO (())
checkButtonClearVisible= buttonClearVisible
checkButtonActive :: CheckButton a  ->  IO (Int)
checkButtonActive= buttonActive
checkButtonActiveR :: CheckButton a  ->  IO (Int)
checkButtonActiveR= buttonActiveR
checkButtonActivate :: CheckButton a  ->  IO (())
checkButtonActivate= buttonActivate
checkButtonDeactivate :: CheckButton a  ->  IO (())
checkButtonDeactivate= buttonDeactivate
checkButtonOutput :: CheckButton a  ->  IO (Int)
checkButtonOutput= buttonOutput
checkButtonSetOutput :: CheckButton a  ->  IO (())
checkButtonSetOutput= buttonSetOutput
checkButtonClearOutput :: CheckButton a  ->  IO (())
checkButtonClearOutput= buttonClearOutput
checkButtonTakesevents :: CheckButton a  ->  IO (Int)
checkButtonTakesevents= buttonTakesevents
checkButtonSetChanged :: CheckButton a  ->  IO (())
checkButtonSetChanged= buttonSetChanged
checkButtonClearChanged :: CheckButton a  ->  IO (())
checkButtonClearChanged= buttonClearChanged
checkButtonTakeFocus :: CheckButton a  ->  IO (Int)
checkButtonTakeFocus= buttonTakeFocus
checkButtonSetVisibleFocus :: CheckButton a  ->  IO (())
checkButtonSetVisibleFocus= buttonSetVisibleFocus
checkButtonClearVisibleFocus :: CheckButton a  ->  IO (())
checkButtonClearVisibleFocus= buttonClearVisibleFocus
checkButtonModifyVisibleFocus :: CheckButton a  -> Int ->  IO (())
checkButtonModifyVisibleFocus= buttonModifyVisibleFocus
checkButtonVisibleFocus :: CheckButton a  ->  IO (Int)
checkButtonVisibleFocus= buttonVisibleFocus
checkButtonContains :: CheckButton a  -> CheckButton a  ->  IO (Int)
checkButtonContains= buttonContains
checkButtonInside :: CheckButton a  -> CheckButton a  ->  IO (Int)
checkButtonInside= buttonInside
checkButtonRedraw :: CheckButton a  ->  IO (())
checkButtonRedraw= buttonRedraw
checkButtonRedrawLabel :: CheckButton a  ->  IO (())
checkButtonRedrawLabel= buttonRedrawLabel
checkButtonDamage :: CheckButton a  ->  IO (Word8)
checkButtonDamage= buttonDamage
checkButtonClearDamageWithBitmask :: CheckButton a  -> Word8 ->  IO (())
checkButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
checkButtonClearDamage :: CheckButton a  ->  IO (())
checkButtonClearDamage= buttonClearDamage
checkButtonDamageWithText :: CheckButton a  -> Word8 ->  IO (())
checkButtonDamageWithText= buttonDamageWithText
checkButtonDamageInsideWidget :: CheckButton a  -> Word8 -> Rectangle ->  IO (())
checkButtonDamageInsideWidget= buttonDamageInsideWidget
checkButtonMeasureLabel :: CheckButton a  -> IO (Size)
checkButtonMeasureLabel= buttonMeasureLabel
checkButtonWindow :: CheckButton a  ->  IO (Window ())
checkButtonWindow= buttonWindow
checkButtonTopWindow :: CheckButton a  ->  IO (Window ())
checkButtonTopWindow= buttonTopWindow
checkButtonTopWindowOffset :: CheckButton a -> IO (Position)
checkButtonTopWindowOffset= buttonTopWindowOffset
checkButtonValue :: CheckButton a  ->  IO (Bool)
checkButtonValue= buttonValue
checkButtonSetValue :: CheckButton a  -> Bool ->  IO (Bool)
checkButtonSetValue= buttonSetValue
checkButtonSet :: CheckButton a  ->  IO (Bool)
checkButtonSet= buttonSet
checkButtonClear :: CheckButton a  ->  IO (Bool)
checkButtonClear= buttonClear
checkButtonSetonly :: CheckButton a  ->  IO (())
checkButtonSetonly= buttonSetonly
checkButtonGetShortcut :: CheckButton a  ->  IO (FlShortcut)
checkButtonGetShortcut= buttonGetShortcut
checkButtonSetShortcut :: CheckButton a  -> Int ->  IO (())
checkButtonSetShortcut= buttonSetShortcut
checkButtonDownBox :: CheckButton a  ->  IO (Boxtype)
checkButtonDownBox= buttonDownBox
checkButtonSetDownBox :: CheckButton a  -> Boxtype ->  IO (())
checkButtonSetDownBox= buttonSetDownBox
checkButtonDownColor :: CheckButton a  ->  IO (Color)
checkButtonDownColor= buttonDownColor
checkButtonSetDownColor :: CheckButton a  -> Color ->  IO (())
checkButtonSetDownColor= buttonSetDownColor
