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
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Check_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Check_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
checkButtonNew :: Rectangle -> Maybe String -> IO (Button ())
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
checkButtonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
checkButtonSetCallback= buttonSetCallback
checkButtonParent :: Widget a -> IO (Group ())
checkButtonParent= buttonParent
checkButtonSetParent :: Widget a -> Group b -> IO ()
checkButtonSetParent= buttonSetParent
checkButtonType_ :: Widget a  ->  IO (Word8)
checkButtonType_= buttonType_
checkButtonSetType :: Widget a  -> Word8 ->  IO (())
checkButtonSetType= buttonSetType
checkButtonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
checkButtonDrawLabel= buttonDrawLabel
checkButtonX :: Widget a  ->  IO (Int)
checkButtonX= buttonX
checkButtonY :: Widget a  ->  IO (Int)
checkButtonY= buttonY
checkButtonW :: Widget a  ->  IO (Int)
checkButtonW= buttonW
checkButtonH :: Widget a  ->  IO (Int)
checkButtonH= buttonH
checkButtonSetAlign :: Widget a  -> AlignType ->  IO (())
checkButtonSetAlign= buttonSetAlign
checkButtonAlign :: Widget a  ->  IO (AlignType)
checkButtonAlign= buttonAlign
checkButtonBox :: Widget a  ->  IO (Boxtype)
checkButtonBox= buttonBox
checkButtonSetBox :: Widget a  -> Boxtype ->  IO (())
checkButtonSetBox= buttonSetBox
checkButtonColor :: Widget a  ->  IO (Color)
checkButtonColor= buttonColor
checkButtonSetColor :: Widget a  -> Color ->  IO (())
checkButtonSetColor= buttonSetColor
checkButtonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
checkButtonSetColorWithBgSel= buttonSetColorWithBgSel
checkButtonSelectionColor :: Widget a  ->  IO (Color)
checkButtonSelectionColor= buttonSelectionColor
checkButtonSetSelectionColor :: Widget a  -> Color ->  IO (())
checkButtonSetSelectionColor= buttonSetSelectionColor
checkButtonLabel :: Widget a  ->  IO (String)
checkButtonLabel= buttonLabel
checkButtonCopyLabel :: Widget a  -> String ->  IO (())
checkButtonCopyLabel= buttonCopyLabel
checkButtonSetLabel :: Widget a  -> String ->  IO (())
checkButtonSetLabel= buttonSetLabel
checkButtonLabeltype :: Widget a  ->  IO (Labeltype)
checkButtonLabeltype= buttonLabeltype
checkButtonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
checkButtonSetLabeltype= buttonSetLabeltype
checkButtonLabelcolor :: Widget a  ->  IO (Color)
checkButtonLabelcolor= buttonLabelcolor
checkButtonSetLabelcolor :: Widget a  -> Color ->  IO (())
checkButtonSetLabelcolor= buttonSetLabelcolor
checkButtonLabelfont :: Widget a  ->  IO (Font)
checkButtonLabelfont= buttonLabelfont
checkButtonSetLabelfont :: Widget a  -> Font ->  IO (())
checkButtonSetLabelfont= buttonSetLabelfont
checkButtonLabelsize :: Widget a  ->  IO (FontSize)
checkButtonLabelsize= buttonLabelsize
checkButtonSetLabelsize :: Widget a  -> FontSize ->  IO (())
checkButtonSetLabelsize= buttonSetLabelsize
checkButtonImage :: Widget a  ->  IO (Image ())
checkButtonImage= buttonImage
checkButtonSetImage :: Widget a  -> Image b ->  IO (())
checkButtonSetImage= buttonSetImage
checkButtonDeimage :: Widget a  ->  IO (Image ())
checkButtonDeimage= buttonDeimage
checkButtonSetDeimage :: Widget a  -> Image b ->  IO (())
checkButtonSetDeimage= buttonSetDeimage
checkButtonTooltip :: Widget a  ->  IO (String)
checkButtonTooltip= buttonTooltip
checkButtonCopyTooltip :: Widget a  -> String ->  IO (())
checkButtonCopyTooltip= buttonCopyTooltip
checkButtonSetTooltip :: Widget a  -> String ->  IO (())
checkButtonSetTooltip= buttonSetTooltip
checkButtonWhen :: Widget a  ->  IO (When)
checkButtonWhen= buttonWhen
checkButtonSetWhen :: Widget a  -> Word8 ->  IO (())
checkButtonSetWhen= buttonSetWhen
checkButtonVisible :: Widget a  ->  IO (Int)
checkButtonVisible= buttonVisible
checkButtonVisibleR :: Widget a  ->  IO (Int)
checkButtonVisibleR= buttonVisibleR
checkButtonSetVisible :: Widget a  ->  IO (())
checkButtonSetVisible= buttonSetVisible
checkButtonClearVisible :: Widget a  ->  IO (())
checkButtonClearVisible= buttonClearVisible
checkButtonActive :: Widget a  ->  IO (Int)
checkButtonActive= buttonActive
checkButtonActiveR :: Widget a  ->  IO (Int)
checkButtonActiveR= buttonActiveR
checkButtonActivate :: Widget a  ->  IO (())
checkButtonActivate= buttonActivate
checkButtonDeactivate :: Widget a  ->  IO (())
checkButtonDeactivate= buttonDeactivate
checkButtonOutput :: Widget a  ->  IO (Int)
checkButtonOutput= buttonOutput
checkButtonSetOutput :: Widget a  ->  IO (())
checkButtonSetOutput= buttonSetOutput
checkButtonClearOutput :: Widget a  ->  IO (())
checkButtonClearOutput= buttonClearOutput
checkButtonTakesevents :: Widget a  ->  IO (Int)
checkButtonTakesevents= buttonTakesevents
checkButtonSetChanged :: Widget a  ->  IO (())
checkButtonSetChanged= buttonSetChanged
checkButtonClearChanged :: Widget a  ->  IO (())
checkButtonClearChanged= buttonClearChanged
checkButtonTakeFocus :: Widget a  ->  IO (Int)
checkButtonTakeFocus= buttonTakeFocus
checkButtonSetVisibleFocus :: Widget a  ->  IO (())
checkButtonSetVisibleFocus= buttonSetVisibleFocus
checkButtonClearVisibleFocus :: Widget a  ->  IO (())
checkButtonClearVisibleFocus= buttonClearVisibleFocus
checkButtonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
checkButtonModifyVisibleFocus= buttonModifyVisibleFocus
checkButtonVisibleFocus :: Widget a  ->  IO (Int)
checkButtonVisibleFocus= buttonVisibleFocus
checkButtonContains :: Widget a  -> Widget a  ->  IO (Int)
checkButtonContains= buttonContains
checkButtonInside :: Widget a  -> Widget a  ->  IO (Int)
checkButtonInside= buttonInside
checkButtonRedraw :: Widget a  ->  IO (())
checkButtonRedraw= buttonRedraw
checkButtonRedrawLabel :: Widget a  ->  IO (())
checkButtonRedrawLabel= buttonRedrawLabel
checkButtonDamage :: Widget a  ->  IO (Word8)
checkButtonDamage= buttonDamage
checkButtonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
checkButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
checkButtonClearDamage :: Widget a  ->  IO (())
checkButtonClearDamage= buttonClearDamage
checkButtonDamageWithText :: Widget a  -> Word8 ->  IO (())
checkButtonDamageWithText= buttonDamageWithText
checkButtonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
checkButtonDamageInsideWidget= buttonDamageInsideWidget
checkButtonMeasureLabel :: Widget a  -> IO (Size)
checkButtonMeasureLabel= buttonMeasureLabel
checkButtonWindow :: Widget a  ->  IO (Window ())
checkButtonWindow= buttonWindow
checkButtonTopWindow :: Widget a  ->  IO (Window ())
checkButtonTopWindow= buttonTopWindow
checkButtonTopWindowOffset :: Widget a -> IO (Position)
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
