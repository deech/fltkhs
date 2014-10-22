{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Round_Button
    (
     roundButtonNew,
     roundButtonDestroy,
     roundButtonHandle,
     roundButtonParent,
     roundButtonSetParent,
     roundButtonType_,
     roundButtonSetType,
     roundButtonAsWindow,
     roundButtonX,
     roundButtonY,
     roundButtonW,
     roundButtonH,
     roundButtonSetAlign,
     roundButtonAlign,
     roundButtonBox,
     roundButtonSetBox,
     roundButtonColor,
     roundButtonSetColor,
     roundButtonSetColorWithBgSel,
     roundButtonSelectionColor,
     roundButtonSetSelectionColor,
     roundButtonLabel,
     roundButtonCopyLabel,
     roundButtonSetLabel,
     roundButtonLabeltype,
     roundButtonSetLabeltype,
     roundButtonLabelcolor,
     roundButtonSetLabelcolor,
     roundButtonLabelfont,
     roundButtonSetLabelfont,
     roundButtonLabelsize,
     roundButtonSetLabelsize,
     roundButtonImage,
     roundButtonSetImage,
     roundButtonDeimage,
     roundButtonSetDeimage,
     roundButtonTooltip,
     roundButtonCopyTooltip,
     roundButtonSetTooltip,
     roundButtonWhen,
     roundButtonSetWhen,
     roundButtonVisible,
     roundButtonVisibleR,
     roundButtonShow,
     roundButtonHide,
     roundButtonSetVisible,
     roundButtonClearVisible,
     roundButtonActive,
     roundButtonActiveR,
     roundButtonActivate,
     roundButtonDeactivate,
     roundButtonOutput,
     roundButtonSetOutput,
     roundButtonClearOutput,
     roundButtonTakesevents,
     roundButtonSetChanged,
     roundButtonClearChanged,
     roundButtonTakeFocus,
     roundButtonSetVisibleFocus,
     roundButtonClearVisibleFocus,
     roundButtonModifyVisibleFocus,
     roundButtonVisibleFocus,
     roundButtonContains,
     roundButtonInside,
     roundButtonRedraw,
     roundButtonRedrawLabel,
     roundButtonDamage,
     roundButtonClearDamageWithBitmask,
     roundButtonClearDamage,
     roundButtonDamageWithText,
     roundButtonDamageInsideWidget,
     roundButtonMeasureLabel,
     roundButtonWindow,
     roundButtonTopWindow,
     roundButtonTopWindowOffset,
     roundButtonAsGroup,
     roundButtonAsGlWindow,
     roundButtonResize,
     roundButtonSetCallback,
     roundButtonDrawLabel,
     roundButtonValue,
     roundButtonSetValue,
     roundButtonSet,
     roundButtonClear,
     roundButtonSetonly,
     roundButtonGetShortcut,
     roundButtonSetShortcut,
     roundButtonDownBox,
     roundButtonSetDownBox,
     roundButtonDownColor,
     roundButtonSetDownColor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Round_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Round_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Round_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
roundButtonNew :: Rectangle -> Maybe String -> IO (Button ())
roundButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                   toObject
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                   toObject
{# fun Fl_Round_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
roundButtonDestroy :: RoundButton a -> IO ()
roundButtonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
roundButtonHandle :: RoundButton a -> Event -> IO Int
roundButtonHandle = buttonHandle
roundButtonAsGroup :: RoundButton a  ->  IO (Group ())
roundButtonAsGroup = buttonAsGroup
roundButtonAsGlWindow :: RoundButton a  ->  IO (GlWindow())
roundButtonAsGlWindow = buttonAsGlWindow
roundButtonAsWindow :: RoundButton a  ->  IO (Window())
roundButtonAsWindow = buttonAsWindow
roundButtonResize :: RoundButton a  -> Rectangle -> IO (())
roundButtonResize = buttonResize
roundButtonHide :: RoundButton a  ->  IO (())
roundButtonHide = buttonHide
roundButtonShow :: RoundButton a -> IO ()
roundButtonShow= buttonShow
roundButtonSetCallback :: RoundButton a -> (WidgetCallback b) -> IO (())
roundButtonSetCallback= buttonSetCallback
roundButtonParent :: RoundButton a -> IO (Group ())
roundButtonParent= buttonParent
roundButtonSetParent :: RoundButton a -> Group b -> IO ()
roundButtonSetParent= buttonSetParent
roundButtonType_ :: RoundButton a  ->  IO (Word8)
roundButtonType_= buttonType_
roundButtonSetType :: RoundButton a  -> Word8 ->  IO (())
roundButtonSetType= buttonSetType
roundButtonDrawLabel :: RoundButton a  -> Maybe (Rectangle,AlignType)->  IO (())
roundButtonDrawLabel= buttonDrawLabel
roundButtonX :: RoundButton a  ->  IO (Int)
roundButtonX= buttonX
roundButtonY :: RoundButton a  ->  IO (Int)
roundButtonY= buttonY
roundButtonW :: RoundButton a  ->  IO (Int)
roundButtonW= buttonW
roundButtonH :: RoundButton a  ->  IO (Int)
roundButtonH= buttonH
roundButtonSetAlign :: RoundButton a  -> AlignType ->  IO (())
roundButtonSetAlign= buttonSetAlign
roundButtonAlign :: RoundButton a  ->  IO (AlignType)
roundButtonAlign= buttonAlign
roundButtonBox :: RoundButton a  ->  IO (Boxtype)
roundButtonBox= buttonBox
roundButtonSetBox :: RoundButton a  -> Boxtype ->  IO (())
roundButtonSetBox= buttonSetBox
roundButtonColor :: RoundButton a  ->  IO (Color)
roundButtonColor= buttonColor
roundButtonSetColor :: RoundButton a  -> Color ->  IO (())
roundButtonSetColor= buttonSetColor
roundButtonSetColorWithBgSel :: RoundButton a  -> Color -> Color ->  IO (())
roundButtonSetColorWithBgSel= buttonSetColorWithBgSel
roundButtonSelectionColor :: RoundButton a  ->  IO (Color)
roundButtonSelectionColor= buttonSelectionColor
roundButtonSetSelectionColor :: RoundButton a  -> Color ->  IO (())
roundButtonSetSelectionColor= buttonSetSelectionColor
roundButtonLabel :: RoundButton a  ->  IO (String)
roundButtonLabel= buttonLabel
roundButtonCopyLabel :: RoundButton a  -> String ->  IO (())
roundButtonCopyLabel= buttonCopyLabel
roundButtonSetLabel :: RoundButton a  -> String ->  IO (())
roundButtonSetLabel= buttonSetLabel
roundButtonLabeltype :: RoundButton a  ->  IO (Labeltype)
roundButtonLabeltype= buttonLabeltype
roundButtonSetLabeltype :: RoundButton a  -> Labeltype ->  IO (())
roundButtonSetLabeltype= buttonSetLabeltype
roundButtonLabelcolor :: RoundButton a  ->  IO (Color)
roundButtonLabelcolor= buttonLabelcolor
roundButtonSetLabelcolor :: RoundButton a  -> Color ->  IO (())
roundButtonSetLabelcolor= buttonSetLabelcolor
roundButtonLabelfont :: RoundButton a  ->  IO (Font)
roundButtonLabelfont= buttonLabelfont
roundButtonSetLabelfont :: RoundButton a  -> Font ->  IO (())
roundButtonSetLabelfont= buttonSetLabelfont
roundButtonLabelsize :: RoundButton a  ->  IO (FontSize)
roundButtonLabelsize= buttonLabelsize
roundButtonSetLabelsize :: RoundButton a  -> FontSize ->  IO (())
roundButtonSetLabelsize= buttonSetLabelsize
roundButtonImage :: RoundButton a  ->  IO (Image ())
roundButtonImage= buttonImage
roundButtonSetImage :: RoundButton a  -> Image b ->  IO (())
roundButtonSetImage= buttonSetImage
roundButtonDeimage :: RoundButton a  ->  IO (Image ())
roundButtonDeimage= buttonDeimage
roundButtonSetDeimage :: RoundButton a  -> Image b ->  IO (())
roundButtonSetDeimage= buttonSetDeimage
roundButtonTooltip :: RoundButton a  ->  IO (String)
roundButtonTooltip= buttonTooltip
roundButtonCopyTooltip :: RoundButton a  -> String ->  IO (())
roundButtonCopyTooltip= buttonCopyTooltip
roundButtonSetTooltip :: RoundButton a  -> String ->  IO (())
roundButtonSetTooltip= buttonSetTooltip
roundButtonWhen :: RoundButton a  ->  IO (When)
roundButtonWhen= buttonWhen
roundButtonSetWhen :: RoundButton a  -> Word8 ->  IO (())
roundButtonSetWhen= buttonSetWhen
roundButtonVisible :: RoundButton a  ->  IO (Int)
roundButtonVisible= buttonVisible
roundButtonVisibleR :: RoundButton a  ->  IO (Int)
roundButtonVisibleR= buttonVisibleR
roundButtonSetVisible :: RoundButton a  ->  IO (())
roundButtonSetVisible= buttonSetVisible
roundButtonClearVisible :: RoundButton a  ->  IO (())
roundButtonClearVisible= buttonClearVisible
roundButtonActive :: RoundButton a  ->  IO (Int)
roundButtonActive= buttonActive
roundButtonActiveR :: RoundButton a  ->  IO (Int)
roundButtonActiveR= buttonActiveR
roundButtonActivate :: RoundButton a  ->  IO (())
roundButtonActivate= buttonActivate
roundButtonDeactivate :: RoundButton a  ->  IO (())
roundButtonDeactivate= buttonDeactivate
roundButtonOutput :: RoundButton a  ->  IO (Int)
roundButtonOutput= buttonOutput
roundButtonSetOutput :: RoundButton a  ->  IO (())
roundButtonSetOutput= buttonSetOutput
roundButtonClearOutput :: RoundButton a  ->  IO (())
roundButtonClearOutput= buttonClearOutput
roundButtonTakesevents :: RoundButton a  ->  IO (Int)
roundButtonTakesevents= buttonTakesevents
roundButtonSetChanged :: RoundButton a  ->  IO (())
roundButtonSetChanged= buttonSetChanged
roundButtonClearChanged :: RoundButton a  ->  IO (())
roundButtonClearChanged= buttonClearChanged
roundButtonTakeFocus :: RoundButton a  ->  IO (Int)
roundButtonTakeFocus= buttonTakeFocus
roundButtonSetVisibleFocus :: RoundButton a  ->  IO (())
roundButtonSetVisibleFocus= buttonSetVisibleFocus
roundButtonClearVisibleFocus :: RoundButton a  ->  IO (())
roundButtonClearVisibleFocus= buttonClearVisibleFocus
roundButtonModifyVisibleFocus :: RoundButton a  -> Int ->  IO (())
roundButtonModifyVisibleFocus= buttonModifyVisibleFocus
roundButtonVisibleFocus :: RoundButton a  ->  IO (Int)
roundButtonVisibleFocus= buttonVisibleFocus
roundButtonContains :: RoundButton a  -> RoundButton a  ->  IO (Int)
roundButtonContains= buttonContains
roundButtonInside :: RoundButton a  -> RoundButton a  ->  IO (Int)
roundButtonInside= buttonInside
roundButtonRedraw :: RoundButton a  ->  IO (())
roundButtonRedraw= buttonRedraw
roundButtonRedrawLabel :: RoundButton a  ->  IO (())
roundButtonRedrawLabel= buttonRedrawLabel
roundButtonDamage :: RoundButton a  ->  IO (Word8)
roundButtonDamage= buttonDamage
roundButtonClearDamageWithBitmask :: RoundButton a  -> Word8 ->  IO (())
roundButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
roundButtonClearDamage :: RoundButton a  ->  IO (())
roundButtonClearDamage= buttonClearDamage
roundButtonDamageWithText :: RoundButton a  -> Word8 ->  IO (())
roundButtonDamageWithText= buttonDamageWithText
roundButtonDamageInsideWidget :: RoundButton a  -> Word8 -> Rectangle ->  IO (())
roundButtonDamageInsideWidget= buttonDamageInsideWidget
roundButtonMeasureLabel :: RoundButton a  -> IO (Size)
roundButtonMeasureLabel= buttonMeasureLabel
roundButtonWindow :: RoundButton a  ->  IO (Window ())
roundButtonWindow= buttonWindow
roundButtonTopWindow :: RoundButton a  ->  IO (Window ())
roundButtonTopWindow= buttonTopWindow
roundButtonTopWindowOffset :: RoundButton a -> IO (Position)
roundButtonTopWindowOffset= buttonTopWindowOffset
roundButtonValue :: RoundButton a  ->  IO (Bool)
roundButtonValue= buttonValue
roundButtonSetValue :: RoundButton a  -> Bool ->  IO (Bool)
roundButtonSetValue= buttonSetValue
roundButtonSet :: RoundButton a  ->  IO (Bool)
roundButtonSet= buttonSet
roundButtonClear :: RoundButton a  ->  IO (Bool)
roundButtonClear= buttonClear
roundButtonSetonly :: RoundButton a  ->  IO (())
roundButtonSetonly= buttonSetonly
roundButtonGetShortcut :: RoundButton a  ->  IO (FlShortcut)
roundButtonGetShortcut= buttonGetShortcut
roundButtonSetShortcut :: RoundButton a  -> Int ->  IO (())
roundButtonSetShortcut= buttonSetShortcut
roundButtonDownBox :: RoundButton a  ->  IO (Boxtype)
roundButtonDownBox= buttonDownBox
roundButtonSetDownBox :: RoundButton a  -> Boxtype ->  IO (())
roundButtonSetDownBox= buttonSetDownBox
roundButtonDownColor :: RoundButton a  ->  IO (Color)
roundButtonDownColor= buttonDownColor
roundButtonSetDownColor :: RoundButton a  -> Color ->  IO (())
roundButtonSetDownColor= buttonSetDownColor
