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
roundButtonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
roundButtonSetCallback= buttonSetCallback
roundButtonParent :: Widget a -> IO (Group ())
roundButtonParent= buttonParent
roundButtonSetParent :: Widget a -> Group b -> IO ()
roundButtonSetParent= buttonSetParent
roundButtonType_ :: Widget a  ->  IO (Word8)
roundButtonType_= buttonType_
roundButtonSetType :: Widget a  -> Word8 ->  IO (())
roundButtonSetType= buttonSetType
roundButtonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
roundButtonDrawLabel= buttonDrawLabel
roundButtonX :: Widget a  ->  IO (Int)
roundButtonX= buttonX
roundButtonY :: Widget a  ->  IO (Int)
roundButtonY= buttonY
roundButtonW :: Widget a  ->  IO (Int)
roundButtonW= buttonW
roundButtonH :: Widget a  ->  IO (Int)
roundButtonH= buttonH
roundButtonSetAlign :: Widget a  -> AlignType ->  IO (())
roundButtonSetAlign= buttonSetAlign
roundButtonAlign :: Widget a  ->  IO (AlignType)
roundButtonAlign= buttonAlign
roundButtonBox :: Widget a  ->  IO (Boxtype)
roundButtonBox= buttonBox
roundButtonSetBox :: Widget a  -> Boxtype ->  IO (())
roundButtonSetBox= buttonSetBox
roundButtonColor :: Widget a  ->  IO (Color)
roundButtonColor= buttonColor
roundButtonSetColor :: Widget a  -> Color ->  IO (())
roundButtonSetColor= buttonSetColor
roundButtonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
roundButtonSetColorWithBgSel= buttonSetColorWithBgSel
roundButtonSelectionColor :: Widget a  ->  IO (Color)
roundButtonSelectionColor= buttonSelectionColor
roundButtonSetSelectionColor :: Widget a  -> Color ->  IO (())
roundButtonSetSelectionColor= buttonSetSelectionColor
roundButtonLabel :: Widget a  ->  IO (String)
roundButtonLabel= buttonLabel
roundButtonCopyLabel :: Widget a  -> String ->  IO (())
roundButtonCopyLabel= buttonCopyLabel
roundButtonSetLabel :: Widget a  -> String ->  IO (())
roundButtonSetLabel= buttonSetLabel
roundButtonLabeltype :: Widget a  ->  IO (Labeltype)
roundButtonLabeltype= buttonLabeltype
roundButtonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
roundButtonSetLabeltype= buttonSetLabeltype
roundButtonLabelcolor :: Widget a  ->  IO (Color)
roundButtonLabelcolor= buttonLabelcolor
roundButtonSetLabelcolor :: Widget a  -> Color ->  IO (())
roundButtonSetLabelcolor= buttonSetLabelcolor
roundButtonLabelfont :: Widget a  ->  IO (Font)
roundButtonLabelfont= buttonLabelfont
roundButtonSetLabelfont :: Widget a  -> Font ->  IO (())
roundButtonSetLabelfont= buttonSetLabelfont
roundButtonLabelsize :: Widget a  ->  IO (FontSize)
roundButtonLabelsize= buttonLabelsize
roundButtonSetLabelsize :: Widget a  -> FontSize ->  IO (())
roundButtonSetLabelsize= buttonSetLabelsize
roundButtonImage :: Widget a  ->  IO (Image ())
roundButtonImage= buttonImage
roundButtonSetImage :: Widget a  -> Image b ->  IO (())
roundButtonSetImage= buttonSetImage
roundButtonDeimage :: Widget a  ->  IO (Image ())
roundButtonDeimage= buttonDeimage
roundButtonSetDeimage :: Widget a  -> Image b ->  IO (())
roundButtonSetDeimage= buttonSetDeimage
roundButtonTooltip :: Widget a  ->  IO (String)
roundButtonTooltip= buttonTooltip
roundButtonCopyTooltip :: Widget a  -> String ->  IO (())
roundButtonCopyTooltip= buttonCopyTooltip
roundButtonSetTooltip :: Widget a  -> String ->  IO (())
roundButtonSetTooltip= buttonSetTooltip
roundButtonWhen :: Widget a  ->  IO (When)
roundButtonWhen= buttonWhen
roundButtonSetWhen :: Widget a  -> Word8 ->  IO (())
roundButtonSetWhen= buttonSetWhen
roundButtonVisible :: Widget a  ->  IO (Int)
roundButtonVisible= buttonVisible
roundButtonVisibleR :: Widget a  ->  IO (Int)
roundButtonVisibleR= buttonVisibleR
roundButtonSetVisible :: Widget a  ->  IO (())
roundButtonSetVisible= buttonSetVisible
roundButtonClearVisible :: Widget a  ->  IO (())
roundButtonClearVisible= buttonClearVisible
roundButtonActive :: Widget a  ->  IO (Int)
roundButtonActive= buttonActive
roundButtonActiveR :: Widget a  ->  IO (Int)
roundButtonActiveR= buttonActiveR
roundButtonActivate :: Widget a  ->  IO (())
roundButtonActivate= buttonActivate
roundButtonDeactivate :: Widget a  ->  IO (())
roundButtonDeactivate= buttonDeactivate
roundButtonOutput :: Widget a  ->  IO (Int)
roundButtonOutput= buttonOutput
roundButtonSetOutput :: Widget a  ->  IO (())
roundButtonSetOutput= buttonSetOutput
roundButtonClearOutput :: Widget a  ->  IO (())
roundButtonClearOutput= buttonClearOutput
roundButtonTakesevents :: Widget a  ->  IO (Int)
roundButtonTakesevents= buttonTakesevents
roundButtonSetChanged :: Widget a  ->  IO (())
roundButtonSetChanged= buttonSetChanged
roundButtonClearChanged :: Widget a  ->  IO (())
roundButtonClearChanged= buttonClearChanged
roundButtonTakeFocus :: Widget a  ->  IO (Int)
roundButtonTakeFocus= buttonTakeFocus
roundButtonSetVisibleFocus :: Widget a  ->  IO (())
roundButtonSetVisibleFocus= buttonSetVisibleFocus
roundButtonClearVisibleFocus :: Widget a  ->  IO (())
roundButtonClearVisibleFocus= buttonClearVisibleFocus
roundButtonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
roundButtonModifyVisibleFocus= buttonModifyVisibleFocus
roundButtonVisibleFocus :: Widget a  ->  IO (Int)
roundButtonVisibleFocus= buttonVisibleFocus
roundButtonContains :: Widget a  -> Widget a  ->  IO (Int)
roundButtonContains= buttonContains
roundButtonInside :: Widget a  -> Widget a  ->  IO (Int)
roundButtonInside= buttonInside
roundButtonRedraw :: Widget a  ->  IO (())
roundButtonRedraw= buttonRedraw
roundButtonRedrawLabel :: Widget a  ->  IO (())
roundButtonRedrawLabel= buttonRedrawLabel
roundButtonDamage :: Widget a  ->  IO (Word8)
roundButtonDamage= buttonDamage
roundButtonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
roundButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
roundButtonClearDamage :: Widget a  ->  IO (())
roundButtonClearDamage= buttonClearDamage
roundButtonDamageWithText :: Widget a  -> Word8 ->  IO (())
roundButtonDamageWithText= buttonDamageWithText
roundButtonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
roundButtonDamageInsideWidget= buttonDamageInsideWidget
roundButtonMeasureLabel :: Widget a  -> IO (Size)
roundButtonMeasureLabel= buttonMeasureLabel
roundButtonWindow :: Widget a  ->  IO (Window ())
roundButtonWindow= buttonWindow
roundButtonTopWindow :: Widget a  ->  IO (Window ())
roundButtonTopWindow= buttonTopWindow
roundButtonTopWindowOffset :: Widget a -> IO (Position)
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
