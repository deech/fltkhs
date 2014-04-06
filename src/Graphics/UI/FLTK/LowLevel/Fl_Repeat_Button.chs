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
repeatButtonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
repeatButtonSetCallback= buttonSetCallback
repeatButtonParent :: Widget a -> IO (Group ())
repeatButtonParent= buttonParent
repeatButtonSetParent :: Widget a -> Group b -> IO ()
repeatButtonSetParent= buttonSetParent
repeatButtonType_ :: Widget a  ->  IO (Word8)
repeatButtonType_= buttonType_
repeatButtonSetType :: Widget a  -> Word8 ->  IO (())
repeatButtonSetType= buttonSetType
repeatButtonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
repeatButtonDrawLabel= buttonDrawLabel
repeatButtonX :: Widget a  ->  IO (Int)
repeatButtonX= buttonX
repeatButtonY :: Widget a  ->  IO (Int)
repeatButtonY= buttonY
repeatButtonW :: Widget a  ->  IO (Int)
repeatButtonW= buttonW
repeatButtonH :: Widget a  ->  IO (Int)
repeatButtonH= buttonH
repeatButtonSetAlign :: Widget a  -> AlignType ->  IO (())
repeatButtonSetAlign= buttonSetAlign
repeatButtonAlign :: Widget a  ->  IO (AlignType)
repeatButtonAlign= buttonAlign
repeatButtonBox :: Widget a  ->  IO (Boxtype)
repeatButtonBox= buttonBox
repeatButtonSetBox :: Widget a  -> Boxtype ->  IO (())
repeatButtonSetBox= buttonSetBox
repeatButtonColor :: Widget a  ->  IO (Color)
repeatButtonColor= buttonColor
repeatButtonSetColor :: Widget a  -> Color ->  IO (())
repeatButtonSetColor= buttonSetColor
repeatButtonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
repeatButtonSetColorWithBgSel= buttonSetColorWithBgSel
repeatButtonSelectionColor :: Widget a  ->  IO (Color)
repeatButtonSelectionColor= buttonSelectionColor
repeatButtonSetSelectionColor :: Widget a  -> Color ->  IO (())
repeatButtonSetSelectionColor= buttonSetSelectionColor
repeatButtonLabel :: Widget a  ->  IO (String)
repeatButtonLabel= buttonLabel
repeatButtonCopyLabel :: Widget a  -> String ->  IO (())
repeatButtonCopyLabel= buttonCopyLabel
repeatButtonSetLabel :: Widget a  -> String ->  IO (())
repeatButtonSetLabel= buttonSetLabel
repeatButtonLabeltype :: Widget a  ->  IO (Labeltype)
repeatButtonLabeltype= buttonLabeltype
repeatButtonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
repeatButtonSetLabeltype= buttonSetLabeltype
repeatButtonLabelcolor :: Widget a  ->  IO (Color)
repeatButtonLabelcolor= buttonLabelcolor
repeatButtonSetLabelcolor :: Widget a  -> Color ->  IO (())
repeatButtonSetLabelcolor= buttonSetLabelcolor
repeatButtonLabelfont :: Widget a  ->  IO (Font)
repeatButtonLabelfont= buttonLabelfont
repeatButtonSetLabelfont :: Widget a  -> Font ->  IO (())
repeatButtonSetLabelfont= buttonSetLabelfont
repeatButtonLabelsize :: Widget a  ->  IO (FontSize)
repeatButtonLabelsize= buttonLabelsize
repeatButtonSetLabelsize :: Widget a  -> FontSize ->  IO (())
repeatButtonSetLabelsize= buttonSetLabelsize
repeatButtonImage :: Widget a  ->  IO (Image ())
repeatButtonImage= buttonImage
repeatButtonSetImage :: Widget a  -> Image b ->  IO (())
repeatButtonSetImage= buttonSetImage
repeatButtonDeimage :: Widget a  ->  IO (Image ())
repeatButtonDeimage= buttonDeimage
repeatButtonSetDeimage :: Widget a  -> Image b ->  IO (())
repeatButtonSetDeimage= buttonSetDeimage
repeatButtonTooltip :: Widget a  ->  IO (String)
repeatButtonTooltip= buttonTooltip
repeatButtonCopyTooltip :: Widget a  -> String ->  IO (())
repeatButtonCopyTooltip= buttonCopyTooltip
repeatButtonSetTooltip :: Widget a  -> String ->  IO (())
repeatButtonSetTooltip= buttonSetTooltip
repeatButtonWhen :: Widget a  ->  IO (When)
repeatButtonWhen= buttonWhen
repeatButtonSetWhen :: Widget a  -> Word8 ->  IO (())
repeatButtonSetWhen= buttonSetWhen
repeatButtonVisible :: Widget a  ->  IO (Int)
repeatButtonVisible= buttonVisible
repeatButtonVisibleR :: Widget a  ->  IO (Int)
repeatButtonVisibleR= buttonVisibleR
repeatButtonSetVisible :: Widget a  ->  IO (())
repeatButtonSetVisible= buttonSetVisible
repeatButtonClearVisible :: Widget a  ->  IO (())
repeatButtonClearVisible= buttonClearVisible
repeatButtonActive :: Widget a  ->  IO (Int)
repeatButtonActive= buttonActive
repeatButtonActiveR :: Widget a  ->  IO (Int)
repeatButtonActiveR= buttonActiveR
repeatButtonActivate :: Widget a  ->  IO (())
repeatButtonActivate= buttonActivate
repeatButtonDeactivate :: Widget a  ->  IO (())
repeatButtonDeactivate= buttonDeactivate
repeatButtonOutput :: Widget a  ->  IO (Int)
repeatButtonOutput= buttonOutput
repeatButtonSetOutput :: Widget a  ->  IO (())
repeatButtonSetOutput= buttonSetOutput
repeatButtonClearOutput :: Widget a  ->  IO (())
repeatButtonClearOutput= buttonClearOutput
repeatButtonTakesevents :: Widget a  ->  IO (Int)
repeatButtonTakesevents= buttonTakesevents
repeatButtonSetChanged :: Widget a  ->  IO (())
repeatButtonSetChanged= buttonSetChanged
repeatButtonClearChanged :: Widget a  ->  IO (())
repeatButtonClearChanged= buttonClearChanged
repeatButtonTakeFocus :: Widget a  ->  IO (Int)
repeatButtonTakeFocus= buttonTakeFocus
repeatButtonSetVisibleFocus :: Widget a  ->  IO (())
repeatButtonSetVisibleFocus= buttonSetVisibleFocus
repeatButtonClearVisibleFocus :: Widget a  ->  IO (())
repeatButtonClearVisibleFocus= buttonClearVisibleFocus
repeatButtonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
repeatButtonModifyVisibleFocus= buttonModifyVisibleFocus
repeatButtonVisibleFocus :: Widget a  ->  IO (Int)
repeatButtonVisibleFocus= buttonVisibleFocus
repeatButtonContains :: Widget a  -> Widget a  ->  IO (Int)
repeatButtonContains= buttonContains
repeatButtonInside :: Widget a  -> Widget a  ->  IO (Int)
repeatButtonInside= buttonInside
repeatButtonRedraw :: Widget a  ->  IO (())
repeatButtonRedraw= buttonRedraw
repeatButtonRedrawLabel :: Widget a  ->  IO (())
repeatButtonRedrawLabel= buttonRedrawLabel
repeatButtonDamage :: Widget a  ->  IO (Word8)
repeatButtonDamage= buttonDamage
repeatButtonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
repeatButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
repeatButtonClearDamage :: Widget a  ->  IO (())
repeatButtonClearDamage= buttonClearDamage
repeatButtonDamageWithText :: Widget a  -> Word8 ->  IO (())
repeatButtonDamageWithText= buttonDamageWithText
repeatButtonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
repeatButtonDamageInsideWidget= buttonDamageInsideWidget
repeatButtonMeasureLabel :: Widget a  -> IO (Size)
repeatButtonMeasureLabel= buttonMeasureLabel
repeatButtonWindow :: Widget a  ->  IO (Window ())
repeatButtonWindow= buttonWindow
repeatButtonTopWindow :: Widget a  ->  IO (Window ())
repeatButtonTopWindow= buttonTopWindow
repeatButtonTopWindowOffset :: Widget a -> IO (Position)
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
