{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Toggle_Button
    (
     toggleButtonNew,
     toggleButtonDestroy,
     toggleButtonHandle,
     toggleButtonParent,
     toggleButtonSetParent,
     toggleButtonType_,
     toggleButtonSetType,
     toggleButtonAsWindow,
     toggleButtonX,
     toggleButtonY,
     toggleButtonW,
     toggleButtonH,
     toggleButtonSetAlign,
     toggleButtonAlign,
     toggleButtonBox,
     toggleButtonSetBox,
     toggleButtonColor,
     toggleButtonSetColor,
     toggleButtonSetColorWithBgSel,
     toggleButtonSelectionColor,
     toggleButtonSetSelectionColor,
     toggleButtonLabel,
     toggleButtonCopyLabel,
     toggleButtonSetLabel,
     toggleButtonLabeltype,
     toggleButtonSetLabeltype,
     toggleButtonLabelcolor,
     toggleButtonSetLabelcolor,
     toggleButtonLabelfont,
     toggleButtonSetLabelfont,
     toggleButtonLabelsize,
     toggleButtonSetLabelsize,
     toggleButtonImage,
     toggleButtonSetImage,
     toggleButtonDeimage,
     toggleButtonSetDeimage,
     toggleButtonTooltip,
     toggleButtonCopyTooltip,
     toggleButtonSetTooltip,
     toggleButtonWhen,
     toggleButtonSetWhen,
     toggleButtonVisible,
     toggleButtonVisibleR,
     toggleButtonShow,
     toggleButtonHide,
     toggleButtonSetVisible,
     toggleButtonClearVisible,
     toggleButtonActive,
     toggleButtonActiveR,
     toggleButtonActivate,
     toggleButtonDeactivate,
     toggleButtonOutput,
     toggleButtonSetOutput,
     toggleButtonClearOutput,
     toggleButtonTakesevents,
     toggleButtonSetChanged,
     toggleButtonClearChanged,
     toggleButtonTakeFocus,
     toggleButtonSetVisibleFocus,
     toggleButtonClearVisibleFocus,
     toggleButtonModifyVisibleFocus,
     toggleButtonVisibleFocus,
     toggleButtonContains,
     toggleButtonInside,
     toggleButtonRedraw,
     toggleButtonRedrawLabel,
     toggleButtonDamage,
     toggleButtonClearDamageWithBitmask,
     toggleButtonClearDamage,
     toggleButtonDamageWithText,
     toggleButtonDamageInsideWidget,
     toggleButtonMeasureLabel,
     toggleButtonWindow,
     toggleButtonTopWindow,
     toggleButtonTopWindowOffset,
     toggleButtonAsGroup,
     toggleButtonAsGlWindow,
     toggleButtonResize,
     toggleButtonSetCallback,
     toggleButtonDrawLabel,
     toggleButtonValue,
     toggleButtonSetValue,
     toggleButtonSet,
     toggleButtonClear,
     toggleButtonSetonly,
     toggleButtonGetShortcut,
     toggleButtonSetShortcut,
     toggleButtonDownBox,
     toggleButtonSetDownBox,
     toggleButtonDownColor,
     toggleButtonSetDownColor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Toggle_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Toggle_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Toggle_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
toggleButtonNew :: Rectangle -> Maybe String -> IO (ToggleButton ())
toggleButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                   toObject
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                   toObject
{# fun Fl_Toggle_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
toggleButtonDestroy :: ToggleButton a -> IO ()
toggleButtonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
toggleButtonHandle :: ToggleButton a -> Event -> IO Int
toggleButtonHandle = buttonHandle
toggleButtonAsGroup :: ToggleButton a  ->  IO (Group ())
toggleButtonAsGroup = buttonAsGroup
toggleButtonAsGlWindow :: ToggleButton a  ->  IO (GlWindow())
toggleButtonAsGlWindow = buttonAsGlWindow
toggleButtonAsWindow :: ToggleButton a  ->  IO (Window())
toggleButtonAsWindow = buttonAsWindow
toggleButtonResize :: ToggleButton a  -> Rectangle -> IO (())
toggleButtonResize = buttonResize
toggleButtonHide :: ToggleButton a  ->  IO (())
toggleButtonHide = buttonHide
toggleButtonShow :: ToggleButton a -> IO ()
toggleButtonShow= buttonShow
toggleButtonSetCallback :: ToggleButton a -> (WidgetCallback b) -> IO (())
toggleButtonSetCallback= buttonSetCallback
toggleButtonParent :: ToggleButton a -> IO (Group ())
toggleButtonParent= buttonParent
toggleButtonSetParent :: ToggleButton a -> Group b -> IO ()
toggleButtonSetParent= buttonSetParent
toggleButtonType_ :: ToggleButton a  ->  IO (Word8)
toggleButtonType_= buttonType_
toggleButtonSetType :: ToggleButton a  -> Word8 ->  IO (())
toggleButtonSetType= buttonSetType
toggleButtonDrawLabel :: ToggleButton a  -> Maybe (Rectangle,AlignType)->  IO (())
toggleButtonDrawLabel= buttonDrawLabel
toggleButtonX :: ToggleButton a  ->  IO (Int)
toggleButtonX= buttonX
toggleButtonY :: ToggleButton a  ->  IO (Int)
toggleButtonY= buttonY
toggleButtonW :: ToggleButton a  ->  IO (Int)
toggleButtonW= buttonW
toggleButtonH :: ToggleButton a  ->  IO (Int)
toggleButtonH= buttonH
toggleButtonSetAlign :: ToggleButton a  -> AlignType ->  IO (())
toggleButtonSetAlign= buttonSetAlign
toggleButtonAlign :: ToggleButton a  ->  IO (AlignType)
toggleButtonAlign= buttonAlign
toggleButtonBox :: ToggleButton a  ->  IO (Boxtype)
toggleButtonBox= buttonBox
toggleButtonSetBox :: ToggleButton a  -> Boxtype ->  IO (())
toggleButtonSetBox= buttonSetBox
toggleButtonColor :: ToggleButton a  ->  IO (Color)
toggleButtonColor= buttonColor
toggleButtonSetColor :: ToggleButton a  -> Color ->  IO (())
toggleButtonSetColor= buttonSetColor
toggleButtonSetColorWithBgSel :: ToggleButton a  -> Color -> Color ->  IO (())
toggleButtonSetColorWithBgSel= buttonSetColorWithBgSel
toggleButtonSelectionColor :: ToggleButton a  ->  IO (Color)
toggleButtonSelectionColor= buttonSelectionColor
toggleButtonSetSelectionColor :: ToggleButton a  -> Color ->  IO (())
toggleButtonSetSelectionColor= buttonSetSelectionColor
toggleButtonLabel :: ToggleButton a  ->  IO (String)
toggleButtonLabel= buttonLabel
toggleButtonCopyLabel :: ToggleButton a  -> String ->  IO (())
toggleButtonCopyLabel= buttonCopyLabel
toggleButtonSetLabel :: ToggleButton a  -> String ->  IO (())
toggleButtonSetLabel= buttonSetLabel
toggleButtonLabeltype :: ToggleButton a  ->  IO (Labeltype)
toggleButtonLabeltype= buttonLabeltype
toggleButtonSetLabeltype :: ToggleButton a  -> Labeltype ->  IO (())
toggleButtonSetLabeltype= buttonSetLabeltype
toggleButtonLabelcolor :: ToggleButton a  ->  IO (Color)
toggleButtonLabelcolor= buttonLabelcolor
toggleButtonSetLabelcolor :: ToggleButton a  -> Color ->  IO (())
toggleButtonSetLabelcolor= buttonSetLabelcolor
toggleButtonLabelfont :: ToggleButton a  ->  IO (Font)
toggleButtonLabelfont= buttonLabelfont
toggleButtonSetLabelfont :: ToggleButton a  -> Font ->  IO (())
toggleButtonSetLabelfont= buttonSetLabelfont
toggleButtonLabelsize :: ToggleButton a  ->  IO (FontSize)
toggleButtonLabelsize= buttonLabelsize
toggleButtonSetLabelsize :: ToggleButton a  -> FontSize ->  IO (())
toggleButtonSetLabelsize= buttonSetLabelsize
toggleButtonImage :: ToggleButton a  ->  IO (Image ())
toggleButtonImage= buttonImage
toggleButtonSetImage :: ToggleButton a  -> Image b ->  IO (())
toggleButtonSetImage= buttonSetImage
toggleButtonDeimage :: ToggleButton a  ->  IO (Image ())
toggleButtonDeimage= buttonDeimage
toggleButtonSetDeimage :: ToggleButton a  -> Image b ->  IO (())
toggleButtonSetDeimage= buttonSetDeimage
toggleButtonTooltip :: ToggleButton a  ->  IO (String)
toggleButtonTooltip= buttonTooltip
toggleButtonCopyTooltip :: ToggleButton a  -> String ->  IO (())
toggleButtonCopyTooltip= buttonCopyTooltip
toggleButtonSetTooltip :: ToggleButton a  -> String ->  IO (())
toggleButtonSetTooltip= buttonSetTooltip
toggleButtonWhen :: ToggleButton a  ->  IO (When)
toggleButtonWhen= buttonWhen
toggleButtonSetWhen :: ToggleButton a  -> Word8 ->  IO (())
toggleButtonSetWhen= buttonSetWhen
toggleButtonVisible :: ToggleButton a  ->  IO (Int)
toggleButtonVisible= buttonVisible
toggleButtonVisibleR :: ToggleButton a  ->  IO (Int)
toggleButtonVisibleR= buttonVisibleR
toggleButtonSetVisible :: ToggleButton a  ->  IO (())
toggleButtonSetVisible= buttonSetVisible
toggleButtonClearVisible :: ToggleButton a  ->  IO (())
toggleButtonClearVisible= buttonClearVisible
toggleButtonActive :: ToggleButton a  ->  IO (Int)
toggleButtonActive= buttonActive
toggleButtonActiveR :: ToggleButton a  ->  IO (Int)
toggleButtonActiveR= buttonActiveR
toggleButtonActivate :: ToggleButton a  ->  IO (())
toggleButtonActivate= buttonActivate
toggleButtonDeactivate :: ToggleButton a  ->  IO (())
toggleButtonDeactivate= buttonDeactivate
toggleButtonOutput :: ToggleButton a  ->  IO (Int)
toggleButtonOutput= buttonOutput
toggleButtonSetOutput :: ToggleButton a  ->  IO (())
toggleButtonSetOutput= buttonSetOutput
toggleButtonClearOutput :: ToggleButton a  ->  IO (())
toggleButtonClearOutput= buttonClearOutput
toggleButtonTakesevents :: ToggleButton a  ->  IO (Int)
toggleButtonTakesevents= buttonTakesevents
toggleButtonSetChanged :: ToggleButton a  ->  IO (())
toggleButtonSetChanged= buttonSetChanged
toggleButtonClearChanged :: ToggleButton a  ->  IO (())
toggleButtonClearChanged= buttonClearChanged
toggleButtonTakeFocus :: ToggleButton a  ->  IO (Int)
toggleButtonTakeFocus= buttonTakeFocus
toggleButtonSetVisibleFocus :: ToggleButton a  ->  IO (())
toggleButtonSetVisibleFocus= buttonSetVisibleFocus
toggleButtonClearVisibleFocus :: ToggleButton a  ->  IO (())
toggleButtonClearVisibleFocus= buttonClearVisibleFocus
toggleButtonModifyVisibleFocus :: ToggleButton a  -> Int ->  IO (())
toggleButtonModifyVisibleFocus= buttonModifyVisibleFocus
toggleButtonVisibleFocus :: ToggleButton a  ->  IO (Int)
toggleButtonVisibleFocus= buttonVisibleFocus
toggleButtonContains :: ToggleButton a  -> ToggleButton a  ->  IO (Int)
toggleButtonContains= buttonContains
toggleButtonInside :: ToggleButton a  -> ToggleButton a  ->  IO (Int)
toggleButtonInside= buttonInside
toggleButtonRedraw :: ToggleButton a  ->  IO (())
toggleButtonRedraw= buttonRedraw
toggleButtonRedrawLabel :: ToggleButton a  ->  IO (())
toggleButtonRedrawLabel= buttonRedrawLabel
toggleButtonDamage :: ToggleButton a  ->  IO (Word8)
toggleButtonDamage= buttonDamage
toggleButtonClearDamageWithBitmask :: ToggleButton a  -> Word8 ->  IO (())
toggleButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
toggleButtonClearDamage :: ToggleButton a  ->  IO (())
toggleButtonClearDamage= buttonClearDamage
toggleButtonDamageWithText :: ToggleButton a  -> Word8 ->  IO (())
toggleButtonDamageWithText= buttonDamageWithText
toggleButtonDamageInsideWidget :: ToggleButton a  -> Word8 -> Rectangle ->  IO (())
toggleButtonDamageInsideWidget= buttonDamageInsideWidget
toggleButtonMeasureLabel :: ToggleButton a  -> IO (Size)
toggleButtonMeasureLabel= buttonMeasureLabel
toggleButtonWindow :: ToggleButton a  ->  IO (Window ())
toggleButtonWindow= buttonWindow
toggleButtonTopWindow :: ToggleButton a  ->  IO (Window ())
toggleButtonTopWindow= buttonTopWindow
toggleButtonTopWindowOffset :: ToggleButton a -> IO (Position)
toggleButtonTopWindowOffset= buttonTopWindowOffset
toggleButtonValue :: ToggleButton a  ->  IO (Bool)
toggleButtonValue= buttonValue
toggleButtonSetValue :: ToggleButton a  -> Bool ->  IO (Bool)
toggleButtonSetValue= buttonSetValue
toggleButtonSet :: ToggleButton a  ->  IO (Bool)
toggleButtonSet= buttonSet
toggleButtonClear :: ToggleButton a  ->  IO (Bool)
toggleButtonClear= buttonClear
toggleButtonSetonly :: ToggleButton a  ->  IO (())
toggleButtonSetonly= buttonSetonly
toggleButtonGetShortcut :: ToggleButton a  ->  IO (FlShortcut)
toggleButtonGetShortcut= buttonGetShortcut
toggleButtonSetShortcut :: ToggleButton a  -> Int ->  IO (())
toggleButtonSetShortcut= buttonSetShortcut
toggleButtonDownBox :: ToggleButton a  ->  IO (Boxtype)
toggleButtonDownBox= buttonDownBox
toggleButtonSetDownBox :: ToggleButton a  -> Boxtype ->  IO (())
toggleButtonSetDownBox= buttonSetDownBox
toggleButtonDownColor :: ToggleButton a  ->  IO (Color)
toggleButtonDownColor= buttonDownColor
toggleButtonSetDownColor :: ToggleButton a  -> Color ->  IO (())
toggleButtonSetDownColor= buttonSetDownColor
