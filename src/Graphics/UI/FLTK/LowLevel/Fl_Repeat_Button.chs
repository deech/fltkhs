{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Repeat_Button
    (
     repeatButtonNew,
     repeatButtonDestroy,
     repeatButtonHandle,
     repeatButtonParent,
     repeatButtonSetParent,
     repeatButtonType_,
     repeatButtonSetType,
     repeatButtonAsWindow,
     repeatButtonX,
     repeatButtonY,
     repeatButtonW,
     repeatButtonH,
     repeatButtonSetAlign,
     repeatButtonAlign,
     repeatButtonBox,
     repeatButtonSetBox,
     repeatButtonColor,
     repeatButtonSetColor,
     repeatButtonSetColorWithBgSel,
     repeatButtonSelectionColor,
     repeatButtonSetSelectionColor,
     repeatButtonLabel,
     repeatButtonCopyLabel,
     repeatButtonSetLabel,
     repeatButtonLabeltype,
     repeatButtonSetLabeltype,
     repeatButtonLabelcolor,
     repeatButtonSetLabelcolor,
     repeatButtonLabelfont,
     repeatButtonSetLabelfont,
     repeatButtonLabelsize,
     repeatButtonSetLabelsize,
     repeatButtonImage,
     repeatButtonSetImage,
     repeatButtonDeimage,
     repeatButtonSetDeimage,
     repeatButtonTooltip,
     repeatButtonCopyTooltip,
     repeatButtonSetTooltip,
     repeatButtonWhen,
     repeatButtonSetWhen,
     repeatButtonVisible,
     repeatButtonVisibleR,
     repeatButtonShow,
     repeatButtonHide,
     repeatButtonSetVisible,
     repeatButtonClearVisible,
     repeatButtonActive,
     repeatButtonActiveR,
     repeatButtonActivate,
     repeatButtonDeactivate,
     repeatButtonOutput,
     repeatButtonSetOutput,
     repeatButtonClearOutput,
     repeatButtonTakesevents,
     repeatButtonSetChanged,
     repeatButtonClearChanged,
     repeatButtonTakeFocus,
     repeatButtonSetVisibleFocus,
     repeatButtonClearVisibleFocus,
     repeatButtonModifyVisibleFocus,
     repeatButtonVisibleFocus,
     repeatButtonContains,
     repeatButtonInside,
     repeatButtonRedraw,
     repeatButtonRedrawLabel,
     repeatButtonDamage,
     repeatButtonClearDamageWithBitmask,
     repeatButtonClearDamage,
     repeatButtonDamageWithText,
     repeatButtonDamageInsideWidget,
     repeatButtonMeasureLabel,
     repeatButtonWindow,
     repeatButtonTopWindow,
     repeatButtonTopWindowOffset,
     repeatButtonAsGroup,
     repeatButtonAsGlWindow,
     repeatButtonResize,
     repeatButtonSetCallback,
     repeatButtonDrawLabel,
     repeatButtonValue,
     repeatButtonSetValue,
     repeatButtonSet,
     repeatButtonClear,
     repeatButtonSetonly,
     repeatButtonGetShortcut,
     repeatButtonSetShortcut,
     repeatButtonDownBox,
     repeatButtonSetDownBox,
     repeatButtonDownColor,
     repeatButtonSetDownColor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Repeat_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Repeat_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Repeat_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
repeatButtonNew :: Rectangle -> Maybe String -> IO (Button ())
repeatButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                   toObject
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                   toObject
{# fun Fl_Repeat_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
repeatButtonDestroy :: RepeatButton a -> IO ()
repeatButtonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
repeatButtonHandle :: RepeatButton a -> Event -> IO Int
repeatButtonHandle = buttonHandle
repeatButtonAsGroup :: RepeatButton a  ->  IO (Group ())
repeatButtonAsGroup = buttonAsGroup
repeatButtonAsGlWindow :: RepeatButton a  ->  IO (GlWindow())
repeatButtonAsGlWindow = buttonAsGlWindow
repeatButtonAsWindow :: RepeatButton a  ->  IO (Window())
repeatButtonAsWindow = buttonAsWindow
repeatButtonResize :: RepeatButton a  -> Rectangle -> IO (())
repeatButtonResize = buttonResize
repeatButtonHide :: RepeatButton a  ->  IO (())
repeatButtonHide = buttonHide
repeatButtonShow :: RepeatButton a -> IO ()
repeatButtonShow= buttonShow
repeatButtonSetCallback :: RepeatButton a -> (WidgetCallback b) -> IO (())
repeatButtonSetCallback= buttonSetCallback
repeatButtonParent :: RepeatButton a -> IO (Group ())
repeatButtonParent= buttonParent
repeatButtonSetParent :: RepeatButton a -> Group b -> IO ()
repeatButtonSetParent= buttonSetParent
repeatButtonType_ :: RepeatButton a  ->  IO (Word8)
repeatButtonType_= buttonType_
repeatButtonSetType :: RepeatButton a  -> Word8 ->  IO (())
repeatButtonSetType= buttonSetType
repeatButtonDrawLabel :: RepeatButton a  -> Maybe (Rectangle,AlignType)->  IO (())
repeatButtonDrawLabel= buttonDrawLabel
repeatButtonX :: RepeatButton a  ->  IO (Int)
repeatButtonX= buttonX
repeatButtonY :: RepeatButton a  ->  IO (Int)
repeatButtonY= buttonY
repeatButtonW :: RepeatButton a  ->  IO (Int)
repeatButtonW= buttonW
repeatButtonH :: RepeatButton a  ->  IO (Int)
repeatButtonH= buttonH
repeatButtonSetAlign :: RepeatButton a  -> AlignType ->  IO (())
repeatButtonSetAlign= buttonSetAlign
repeatButtonAlign :: RepeatButton a  ->  IO (AlignType)
repeatButtonAlign= buttonAlign
repeatButtonBox :: RepeatButton a  ->  IO (Boxtype)
repeatButtonBox= buttonBox
repeatButtonSetBox :: RepeatButton a  -> Boxtype ->  IO (())
repeatButtonSetBox= buttonSetBox
repeatButtonColor :: RepeatButton a  ->  IO (Color)
repeatButtonColor= buttonColor
repeatButtonSetColor :: RepeatButton a  -> Color ->  IO (())
repeatButtonSetColor= buttonSetColor
repeatButtonSetColorWithBgSel :: RepeatButton a  -> Color -> Color ->  IO (())
repeatButtonSetColorWithBgSel= buttonSetColorWithBgSel
repeatButtonSelectionColor :: RepeatButton a  ->  IO (Color)
repeatButtonSelectionColor= buttonSelectionColor
repeatButtonSetSelectionColor :: RepeatButton a  -> Color ->  IO (())
repeatButtonSetSelectionColor= buttonSetSelectionColor
repeatButtonLabel :: RepeatButton a  ->  IO (String)
repeatButtonLabel= buttonLabel
repeatButtonCopyLabel :: RepeatButton a  -> String ->  IO (())
repeatButtonCopyLabel= buttonCopyLabel
repeatButtonSetLabel :: RepeatButton a  -> String ->  IO (())
repeatButtonSetLabel= buttonSetLabel
repeatButtonLabeltype :: RepeatButton a  ->  IO (Labeltype)
repeatButtonLabeltype= buttonLabeltype
repeatButtonSetLabeltype :: RepeatButton a  -> Labeltype ->  IO (())
repeatButtonSetLabeltype= buttonSetLabeltype
repeatButtonLabelcolor :: RepeatButton a  ->  IO (Color)
repeatButtonLabelcolor= buttonLabelcolor
repeatButtonSetLabelcolor :: RepeatButton a  -> Color ->  IO (())
repeatButtonSetLabelcolor= buttonSetLabelcolor
repeatButtonLabelfont :: RepeatButton a  ->  IO (Font)
repeatButtonLabelfont= buttonLabelfont
repeatButtonSetLabelfont :: RepeatButton a  -> Font ->  IO (())
repeatButtonSetLabelfont= buttonSetLabelfont
repeatButtonLabelsize :: RepeatButton a  ->  IO (FontSize)
repeatButtonLabelsize= buttonLabelsize
repeatButtonSetLabelsize :: RepeatButton a  -> FontSize ->  IO (())
repeatButtonSetLabelsize= buttonSetLabelsize
repeatButtonImage :: RepeatButton a  ->  IO (Image ())
repeatButtonImage= buttonImage
repeatButtonSetImage :: RepeatButton a  -> Image b ->  IO (())
repeatButtonSetImage= buttonSetImage
repeatButtonDeimage :: RepeatButton a  ->  IO (Image ())
repeatButtonDeimage= buttonDeimage
repeatButtonSetDeimage :: RepeatButton a  -> Image b ->  IO (())
repeatButtonSetDeimage= buttonSetDeimage
repeatButtonTooltip :: RepeatButton a  ->  IO (String)
repeatButtonTooltip= buttonTooltip
repeatButtonCopyTooltip :: RepeatButton a  -> String ->  IO (())
repeatButtonCopyTooltip= buttonCopyTooltip
repeatButtonSetTooltip :: RepeatButton a  -> String ->  IO (())
repeatButtonSetTooltip= buttonSetTooltip
repeatButtonWhen :: RepeatButton a  ->  IO (When)
repeatButtonWhen= buttonWhen
repeatButtonSetWhen :: RepeatButton a  -> Word8 ->  IO (())
repeatButtonSetWhen= buttonSetWhen
repeatButtonVisible :: RepeatButton a  ->  IO (Int)
repeatButtonVisible= buttonVisible
repeatButtonVisibleR :: RepeatButton a  ->  IO (Int)
repeatButtonVisibleR= buttonVisibleR
repeatButtonSetVisible :: RepeatButton a  ->  IO (())
repeatButtonSetVisible= buttonSetVisible
repeatButtonClearVisible :: RepeatButton a  ->  IO (())
repeatButtonClearVisible= buttonClearVisible
repeatButtonActive :: RepeatButton a  ->  IO (Int)
repeatButtonActive= buttonActive
repeatButtonActiveR :: RepeatButton a  ->  IO (Int)
repeatButtonActiveR= buttonActiveR
repeatButtonActivate :: RepeatButton a  ->  IO (())
repeatButtonActivate= buttonActivate
repeatButtonDeactivate :: RepeatButton a  ->  IO (())
repeatButtonDeactivate= buttonDeactivate
repeatButtonOutput :: RepeatButton a  ->  IO (Int)
repeatButtonOutput= buttonOutput
repeatButtonSetOutput :: RepeatButton a  ->  IO (())
repeatButtonSetOutput= buttonSetOutput
repeatButtonClearOutput :: RepeatButton a  ->  IO (())
repeatButtonClearOutput= buttonClearOutput
repeatButtonTakesevents :: RepeatButton a  ->  IO (Int)
repeatButtonTakesevents= buttonTakesevents
repeatButtonSetChanged :: RepeatButton a  ->  IO (())
repeatButtonSetChanged= buttonSetChanged
repeatButtonClearChanged :: RepeatButton a  ->  IO (())
repeatButtonClearChanged= buttonClearChanged
repeatButtonTakeFocus :: RepeatButton a  ->  IO (Int)
repeatButtonTakeFocus= buttonTakeFocus
repeatButtonSetVisibleFocus :: RepeatButton a  ->  IO (())
repeatButtonSetVisibleFocus= buttonSetVisibleFocus
repeatButtonClearVisibleFocus :: RepeatButton a  ->  IO (())
repeatButtonClearVisibleFocus= buttonClearVisibleFocus
repeatButtonModifyVisibleFocus :: RepeatButton a  -> Int ->  IO (())
repeatButtonModifyVisibleFocus= buttonModifyVisibleFocus
repeatButtonVisibleFocus :: RepeatButton a  ->  IO (Int)
repeatButtonVisibleFocus= buttonVisibleFocus
repeatButtonContains :: RepeatButton a  -> RepeatButton a  ->  IO (Int)
repeatButtonContains= buttonContains
repeatButtonInside :: RepeatButton a  -> RepeatButton a  ->  IO (Int)
repeatButtonInside= buttonInside
repeatButtonRedraw :: RepeatButton a  ->  IO (())
repeatButtonRedraw= buttonRedraw
repeatButtonRedrawLabel :: RepeatButton a  ->  IO (())
repeatButtonRedrawLabel= buttonRedrawLabel
repeatButtonDamage :: RepeatButton a  ->  IO (Word8)
repeatButtonDamage= buttonDamage
repeatButtonClearDamageWithBitmask :: RepeatButton a  -> Word8 ->  IO (())
repeatButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
repeatButtonClearDamage :: RepeatButton a  ->  IO (())
repeatButtonClearDamage= buttonClearDamage
repeatButtonDamageWithText :: RepeatButton a  -> Word8 ->  IO (())
repeatButtonDamageWithText= buttonDamageWithText
repeatButtonDamageInsideWidget :: RepeatButton a  -> Word8 -> Rectangle ->  IO (())
repeatButtonDamageInsideWidget= buttonDamageInsideWidget
repeatButtonMeasureLabel :: RepeatButton a  -> IO (Size)
repeatButtonMeasureLabel= buttonMeasureLabel
repeatButtonWindow :: RepeatButton a  ->  IO (Window ())
repeatButtonWindow= buttonWindow
repeatButtonTopWindow :: RepeatButton a  ->  IO (Window ())
repeatButtonTopWindow= buttonTopWindow
repeatButtonTopWindowOffset :: RepeatButton a -> IO (Position)
repeatButtonTopWindowOffset= buttonTopWindowOffset
repeatButtonValue :: RepeatButton a  ->  IO (Bool)
repeatButtonValue= buttonValue
repeatButtonSetValue :: RepeatButton a  -> Bool ->  IO (Bool)
repeatButtonSetValue= buttonSetValue
repeatButtonSet :: RepeatButton a  ->  IO (Bool)
repeatButtonSet= buttonSet
repeatButtonClear :: RepeatButton a  ->  IO (Bool)
repeatButtonClear= buttonClear
repeatButtonSetonly :: RepeatButton a  ->  IO (())
repeatButtonSetonly= buttonSetonly
repeatButtonGetShortcut :: RepeatButton a  ->  IO (FlShortcut)
repeatButtonGetShortcut= buttonGetShortcut
repeatButtonSetShortcut :: RepeatButton a  -> Int ->  IO (())
repeatButtonSetShortcut= buttonSetShortcut
repeatButtonDownBox :: RepeatButton a  ->  IO (Boxtype)
repeatButtonDownBox= buttonDownBox
repeatButtonSetDownBox :: RepeatButton a  -> Boxtype ->  IO (())
repeatButtonSetDownBox= buttonSetDownBox
repeatButtonDownColor :: RepeatButton a  ->  IO (Color)
repeatButtonDownColor= buttonDownColor
repeatButtonSetDownColor :: RepeatButton a  -> Color ->  IO (())
repeatButtonSetDownColor= buttonSetDownColor
