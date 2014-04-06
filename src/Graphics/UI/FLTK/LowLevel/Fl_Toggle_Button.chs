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
toggleButtonNew :: Rectangle -> Maybe String -> IO (Button ())
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
toggleButtonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
toggleButtonSetCallback= buttonSetCallback
toggleButtonParent :: Widget a -> IO (Group ())
toggleButtonParent= buttonParent
toggleButtonSetParent :: Widget a -> Group b -> IO ()
toggleButtonSetParent= buttonSetParent
toggleButtonType_ :: Widget a  ->  IO (Word8)
toggleButtonType_= buttonType_
toggleButtonSetType :: Widget a  -> Word8 ->  IO (())
toggleButtonSetType= buttonSetType
toggleButtonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
toggleButtonDrawLabel= buttonDrawLabel
toggleButtonX :: Widget a  ->  IO (Int)
toggleButtonX= buttonX
toggleButtonY :: Widget a  ->  IO (Int)
toggleButtonY= buttonY
toggleButtonW :: Widget a  ->  IO (Int)
toggleButtonW= buttonW
toggleButtonH :: Widget a  ->  IO (Int)
toggleButtonH= buttonH
toggleButtonSetAlign :: Widget a  -> AlignType ->  IO (())
toggleButtonSetAlign= buttonSetAlign
toggleButtonAlign :: Widget a  ->  IO (AlignType)
toggleButtonAlign= buttonAlign
toggleButtonBox :: Widget a  ->  IO (Boxtype)
toggleButtonBox= buttonBox
toggleButtonSetBox :: Widget a  -> Boxtype ->  IO (())
toggleButtonSetBox= buttonSetBox
toggleButtonColor :: Widget a  ->  IO (Color)
toggleButtonColor= buttonColor
toggleButtonSetColor :: Widget a  -> Color ->  IO (())
toggleButtonSetColor= buttonSetColor
toggleButtonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
toggleButtonSetColorWithBgSel= buttonSetColorWithBgSel
toggleButtonSelectionColor :: Widget a  ->  IO (Color)
toggleButtonSelectionColor= buttonSelectionColor
toggleButtonSetSelectionColor :: Widget a  -> Color ->  IO (())
toggleButtonSetSelectionColor= buttonSetSelectionColor
toggleButtonLabel :: Widget a  ->  IO (String)
toggleButtonLabel= buttonLabel
toggleButtonCopyLabel :: Widget a  -> String ->  IO (())
toggleButtonCopyLabel= buttonCopyLabel
toggleButtonSetLabel :: Widget a  -> String ->  IO (())
toggleButtonSetLabel= buttonSetLabel
toggleButtonLabeltype :: Widget a  ->  IO (Labeltype)
toggleButtonLabeltype= buttonLabeltype
toggleButtonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
toggleButtonSetLabeltype= buttonSetLabeltype
toggleButtonLabelcolor :: Widget a  ->  IO (Color)
toggleButtonLabelcolor= buttonLabelcolor
toggleButtonSetLabelcolor :: Widget a  -> Color ->  IO (())
toggleButtonSetLabelcolor= buttonSetLabelcolor
toggleButtonLabelfont :: Widget a  ->  IO (Font)
toggleButtonLabelfont= buttonLabelfont
toggleButtonSetLabelfont :: Widget a  -> Font ->  IO (())
toggleButtonSetLabelfont= buttonSetLabelfont
toggleButtonLabelsize :: Widget a  ->  IO (FontSize)
toggleButtonLabelsize= buttonLabelsize
toggleButtonSetLabelsize :: Widget a  -> FontSize ->  IO (())
toggleButtonSetLabelsize= buttonSetLabelsize
toggleButtonImage :: Widget a  ->  IO (Image ())
toggleButtonImage= buttonImage
toggleButtonSetImage :: Widget a  -> Image b ->  IO (())
toggleButtonSetImage= buttonSetImage
toggleButtonDeimage :: Widget a  ->  IO (Image ())
toggleButtonDeimage= buttonDeimage
toggleButtonSetDeimage :: Widget a  -> Image b ->  IO (())
toggleButtonSetDeimage= buttonSetDeimage
toggleButtonTooltip :: Widget a  ->  IO (String)
toggleButtonTooltip= buttonTooltip
toggleButtonCopyTooltip :: Widget a  -> String ->  IO (())
toggleButtonCopyTooltip= buttonCopyTooltip
toggleButtonSetTooltip :: Widget a  -> String ->  IO (())
toggleButtonSetTooltip= buttonSetTooltip
toggleButtonWhen :: Widget a  ->  IO (When)
toggleButtonWhen= buttonWhen
toggleButtonSetWhen :: Widget a  -> Word8 ->  IO (())
toggleButtonSetWhen= buttonSetWhen
toggleButtonVisible :: Widget a  ->  IO (Int)
toggleButtonVisible= buttonVisible
toggleButtonVisibleR :: Widget a  ->  IO (Int)
toggleButtonVisibleR= buttonVisibleR
toggleButtonSetVisible :: Widget a  ->  IO (())
toggleButtonSetVisible= buttonSetVisible
toggleButtonClearVisible :: Widget a  ->  IO (())
toggleButtonClearVisible= buttonClearVisible
toggleButtonActive :: Widget a  ->  IO (Int)
toggleButtonActive= buttonActive
toggleButtonActiveR :: Widget a  ->  IO (Int)
toggleButtonActiveR= buttonActiveR
toggleButtonActivate :: Widget a  ->  IO (())
toggleButtonActivate= buttonActivate
toggleButtonDeactivate :: Widget a  ->  IO (())
toggleButtonDeactivate= buttonDeactivate
toggleButtonOutput :: Widget a  ->  IO (Int)
toggleButtonOutput= buttonOutput
toggleButtonSetOutput :: Widget a  ->  IO (())
toggleButtonSetOutput= buttonSetOutput
toggleButtonClearOutput :: Widget a  ->  IO (())
toggleButtonClearOutput= buttonClearOutput
toggleButtonTakesevents :: Widget a  ->  IO (Int)
toggleButtonTakesevents= buttonTakesevents
toggleButtonSetChanged :: Widget a  ->  IO (())
toggleButtonSetChanged= buttonSetChanged
toggleButtonClearChanged :: Widget a  ->  IO (())
toggleButtonClearChanged= buttonClearChanged
toggleButtonTakeFocus :: Widget a  ->  IO (Int)
toggleButtonTakeFocus= buttonTakeFocus
toggleButtonSetVisibleFocus :: Widget a  ->  IO (())
toggleButtonSetVisibleFocus= buttonSetVisibleFocus
toggleButtonClearVisibleFocus :: Widget a  ->  IO (())
toggleButtonClearVisibleFocus= buttonClearVisibleFocus
toggleButtonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
toggleButtonModifyVisibleFocus= buttonModifyVisibleFocus
toggleButtonVisibleFocus :: Widget a  ->  IO (Int)
toggleButtonVisibleFocus= buttonVisibleFocus
toggleButtonContains :: Widget a  -> Widget a  ->  IO (Int)
toggleButtonContains= buttonContains
toggleButtonInside :: Widget a  -> Widget a  ->  IO (Int)
toggleButtonInside= buttonInside
toggleButtonRedraw :: Widget a  ->  IO (())
toggleButtonRedraw= buttonRedraw
toggleButtonRedrawLabel :: Widget a  ->  IO (())
toggleButtonRedrawLabel= buttonRedrawLabel
toggleButtonDamage :: Widget a  ->  IO (Word8)
toggleButtonDamage= buttonDamage
toggleButtonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
toggleButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
toggleButtonClearDamage :: Widget a  ->  IO (())
toggleButtonClearDamage= buttonClearDamage
toggleButtonDamageWithText :: Widget a  -> Word8 ->  IO (())
toggleButtonDamageWithText= buttonDamageWithText
toggleButtonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
toggleButtonDamageInsideWidget= buttonDamageInsideWidget
toggleButtonMeasureLabel :: Widget a  -> IO (Size)
toggleButtonMeasureLabel= buttonMeasureLabel
toggleButtonWindow :: Widget a  ->  IO (Window ())
toggleButtonWindow= buttonWindow
toggleButtonTopWindow :: Widget a  ->  IO (Window ())
toggleButtonTopWindow= buttonTopWindow
toggleButtonTopWindowOffset :: Widget a -> IO (Position)
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
