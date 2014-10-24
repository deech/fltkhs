{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Light_Button
    (
     lightButtonNew,
     lightButtonDestroy,
     lightButtonHandle,
     lightButtonParent,
     lightButtonSetParent,
     lightButtonType_,
     lightButtonSetType,
     lightButtonAsWindow,
     lightButtonX,
     lightButtonY,
     lightButtonW,
     lightButtonH,
     lightButtonSetAlign,
     lightButtonAlign,
     lightButtonBox,
     lightButtonSetBox,
     lightButtonColor,
     lightButtonSetColor,
     lightButtonSetColorWithBgSel,
     lightButtonSelectionColor,
     lightButtonSetSelectionColor,
     lightButtonLabel,
     lightButtonCopyLabel,
     lightButtonSetLabel,
     lightButtonLabeltype,
     lightButtonSetLabeltype,
     lightButtonLabelcolor,
     lightButtonSetLabelcolor,
     lightButtonLabelfont,
     lightButtonSetLabelfont,
     lightButtonLabelsize,
     lightButtonSetLabelsize,
     lightButtonImage,
     lightButtonSetImage,
     lightButtonDeimage,
     lightButtonSetDeimage,
     lightButtonTooltip,
     lightButtonCopyTooltip,
     lightButtonSetTooltip,
     lightButtonWhen,
     lightButtonSetWhen,
     lightButtonVisible,
     lightButtonVisibleR,
     lightButtonShow,
     lightButtonHide,
     lightButtonSetVisible,
     lightButtonClearVisible,
     lightButtonActive,
     lightButtonActiveR,
     lightButtonActivate,
     lightButtonDeactivate,
     lightButtonOutput,
     lightButtonSetOutput,
     lightButtonClearOutput,
     lightButtonTakesevents,
     lightButtonSetChanged,
     lightButtonClearChanged,
     lightButtonTakeFocus,
     lightButtonSetVisibleFocus,
     lightButtonClearVisibleFocus,
     lightButtonModifyVisibleFocus,
     lightButtonVisibleFocus,
     lightButtonContains,
     lightButtonInside,
     lightButtonRedraw,
     lightButtonRedrawLabel,
     lightButtonDamage,
     lightButtonClearDamageWithBitmask,
     lightButtonClearDamage,
     lightButtonDamageWithText,
     lightButtonDamageInsideWidget,
     lightButtonMeasureLabel,
     lightButtonWindow,
     lightButtonTopWindow,
     lightButtonTopWindowOffset,
     lightButtonAsGroup,
     lightButtonAsGlWindow,
     lightButtonResize,
     lightButtonSetCallback,
     lightButtonDrawLabel,
     lightButtonValue,
     lightButtonSetValue,
     lightButtonSet,
     lightButtonClear,
     lightButtonSetonly,
     lightButtonGetShortcut,
     lightButtonSetShortcut,
     lightButtonDownBox,
     lightButtonSetDownBox,
     lightButtonDownColor,
     lightButtonSetDownColor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Light_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Light_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Light_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
lightButtonNew :: Rectangle -> Maybe String -> IO (LightButton ())
lightButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                   toObject
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                   toObject
{# fun Fl_Light_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
lightButtonDestroy :: LightButton a -> IO ()
lightButtonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
lightButtonHandle :: LightButton a -> Event -> IO Int
lightButtonHandle = buttonHandle
lightButtonAsGroup :: LightButton a  ->  IO (Group ())
lightButtonAsGroup = buttonAsGroup
lightButtonAsGlWindow :: LightButton a  ->  IO (GlWindow())
lightButtonAsGlWindow = buttonAsGlWindow
lightButtonAsWindow :: LightButton a  ->  IO (Window())
lightButtonAsWindow = buttonAsWindow
lightButtonResize :: LightButton a  -> Rectangle -> IO (())
lightButtonResize = buttonResize
lightButtonHide :: LightButton a  ->  IO (())
lightButtonHide = buttonHide
lightButtonShow :: LightButton a -> IO ()
lightButtonShow= buttonShow
lightButtonSetCallback :: LightButton a -> (LightButton b -> IO ()) -> IO (())
lightButtonSetCallback= buttonSetCallback
lightButtonParent :: LightButton a -> IO (Group ())
lightButtonParent= buttonParent
lightButtonSetParent :: LightButton a -> Group b -> IO ()
lightButtonSetParent= buttonSetParent
lightButtonType_ :: LightButton a  ->  IO (Word8)
lightButtonType_= buttonType_
lightButtonSetType :: LightButton a  -> Word8 ->  IO (())
lightButtonSetType= buttonSetType
lightButtonDrawLabel :: LightButton a  -> Maybe (Rectangle,AlignType)->  IO (())
lightButtonDrawLabel= buttonDrawLabel
lightButtonX :: LightButton a  ->  IO (Int)
lightButtonX= buttonX
lightButtonY :: LightButton a  ->  IO (Int)
lightButtonY= buttonY
lightButtonW :: LightButton a  ->  IO (Int)
lightButtonW= buttonW
lightButtonH :: LightButton a  ->  IO (Int)
lightButtonH= buttonH
lightButtonSetAlign :: LightButton a  -> AlignType ->  IO (())
lightButtonSetAlign= buttonSetAlign
lightButtonAlign :: LightButton a  ->  IO (AlignType)
lightButtonAlign= buttonAlign
lightButtonBox :: LightButton a  ->  IO (Boxtype)
lightButtonBox= buttonBox
lightButtonSetBox :: LightButton a  -> Boxtype ->  IO (())
lightButtonSetBox= buttonSetBox
lightButtonColor :: LightButton a  ->  IO (Color)
lightButtonColor= buttonColor
lightButtonSetColor :: LightButton a  -> Color ->  IO (())
lightButtonSetColor= buttonSetColor
lightButtonSetColorWithBgSel :: LightButton a  -> Color -> Color ->  IO (())
lightButtonSetColorWithBgSel= buttonSetColorWithBgSel
lightButtonSelectionColor :: LightButton a  ->  IO (Color)
lightButtonSelectionColor= buttonSelectionColor
lightButtonSetSelectionColor :: LightButton a  -> Color ->  IO (())
lightButtonSetSelectionColor= buttonSetSelectionColor
lightButtonLabel :: LightButton a  ->  IO (String)
lightButtonLabel= buttonLabel
lightButtonCopyLabel :: LightButton a  -> String ->  IO (())
lightButtonCopyLabel= buttonCopyLabel
lightButtonSetLabel :: LightButton a  -> String ->  IO (())
lightButtonSetLabel= buttonSetLabel
lightButtonLabeltype :: LightButton a  ->  IO (Labeltype)
lightButtonLabeltype= buttonLabeltype
lightButtonSetLabeltype :: LightButton a  -> Labeltype ->  IO (())
lightButtonSetLabeltype= buttonSetLabeltype
lightButtonLabelcolor :: LightButton a  ->  IO (Color)
lightButtonLabelcolor= buttonLabelcolor
lightButtonSetLabelcolor :: LightButton a  -> Color ->  IO (())
lightButtonSetLabelcolor= buttonSetLabelcolor
lightButtonLabelfont :: LightButton a  ->  IO (Font)
lightButtonLabelfont= buttonLabelfont
lightButtonSetLabelfont :: LightButton a  -> Font ->  IO (())
lightButtonSetLabelfont= buttonSetLabelfont
lightButtonLabelsize :: LightButton a  ->  IO (FontSize)
lightButtonLabelsize= buttonLabelsize
lightButtonSetLabelsize :: LightButton a  -> FontSize ->  IO (())
lightButtonSetLabelsize= buttonSetLabelsize
lightButtonImage :: LightButton a  ->  IO (Image ())
lightButtonImage= buttonImage
lightButtonSetImage :: LightButton a  -> Image b ->  IO (())
lightButtonSetImage= buttonSetImage
lightButtonDeimage :: LightButton a  ->  IO (Image ())
lightButtonDeimage= buttonDeimage
lightButtonSetDeimage :: LightButton a  -> Image b ->  IO (())
lightButtonSetDeimage= buttonSetDeimage
lightButtonTooltip :: LightButton a  ->  IO (String)
lightButtonTooltip= buttonTooltip
lightButtonCopyTooltip :: LightButton a  -> String ->  IO (())
lightButtonCopyTooltip= buttonCopyTooltip
lightButtonSetTooltip :: LightButton a  -> String ->  IO (())
lightButtonSetTooltip= buttonSetTooltip
lightButtonWhen :: LightButton a  ->  IO (When)
lightButtonWhen= buttonWhen
lightButtonSetWhen :: LightButton a  -> Word8 ->  IO (())
lightButtonSetWhen= buttonSetWhen
lightButtonVisible :: LightButton a  ->  IO (Int)
lightButtonVisible= buttonVisible
lightButtonVisibleR :: LightButton a  ->  IO (Int)
lightButtonVisibleR= buttonVisibleR
lightButtonSetVisible :: LightButton a  ->  IO (())
lightButtonSetVisible= buttonSetVisible
lightButtonClearVisible :: LightButton a  ->  IO (())
lightButtonClearVisible= buttonClearVisible
lightButtonActive :: LightButton a  ->  IO (Int)
lightButtonActive= buttonActive
lightButtonActiveR :: LightButton a  ->  IO (Int)
lightButtonActiveR= buttonActiveR
lightButtonActivate :: LightButton a  ->  IO (())
lightButtonActivate= buttonActivate
lightButtonDeactivate :: LightButton a  ->  IO (())
lightButtonDeactivate= buttonDeactivate
lightButtonOutput :: LightButton a  ->  IO (Int)
lightButtonOutput= buttonOutput
lightButtonSetOutput :: LightButton a  ->  IO (())
lightButtonSetOutput= buttonSetOutput
lightButtonClearOutput :: LightButton a  ->  IO (())
lightButtonClearOutput= buttonClearOutput
lightButtonTakesevents :: LightButton a  ->  IO (Int)
lightButtonTakesevents= buttonTakesevents
lightButtonSetChanged :: LightButton a  ->  IO (())
lightButtonSetChanged= buttonSetChanged
lightButtonClearChanged :: LightButton a  ->  IO (())
lightButtonClearChanged= buttonClearChanged
lightButtonTakeFocus :: LightButton a  ->  IO (Int)
lightButtonTakeFocus= buttonTakeFocus
lightButtonSetVisibleFocus :: LightButton a  ->  IO (())
lightButtonSetVisibleFocus= buttonSetVisibleFocus
lightButtonClearVisibleFocus :: LightButton a  ->  IO (())
lightButtonClearVisibleFocus= buttonClearVisibleFocus
lightButtonModifyVisibleFocus :: LightButton a  -> Int ->  IO (())
lightButtonModifyVisibleFocus= buttonModifyVisibleFocus
lightButtonVisibleFocus :: LightButton a  ->  IO (Int)
lightButtonVisibleFocus= buttonVisibleFocus
lightButtonContains :: LightButton a  -> LightButton a  ->  IO (Int)
lightButtonContains= buttonContains
lightButtonInside :: LightButton a  -> LightButton a  ->  IO (Int)
lightButtonInside= buttonInside
lightButtonRedraw :: LightButton a  ->  IO (())
lightButtonRedraw= buttonRedraw
lightButtonRedrawLabel :: LightButton a  ->  IO (())
lightButtonRedrawLabel= buttonRedrawLabel
lightButtonDamage :: LightButton a  ->  IO (Word8)
lightButtonDamage= buttonDamage
lightButtonClearDamageWithBitmask :: LightButton a  -> Word8 ->  IO (())
lightButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
lightButtonClearDamage :: LightButton a  ->  IO (())
lightButtonClearDamage= buttonClearDamage
lightButtonDamageWithText :: LightButton a  -> Word8 ->  IO (())
lightButtonDamageWithText= buttonDamageWithText
lightButtonDamageInsideWidget :: LightButton a  -> Word8 -> Rectangle ->  IO (())
lightButtonDamageInsideWidget= buttonDamageInsideWidget
lightButtonMeasureLabel :: LightButton a  -> IO (Size)
lightButtonMeasureLabel= buttonMeasureLabel
lightButtonWindow :: LightButton a  ->  IO (Window ())
lightButtonWindow= buttonWindow
lightButtonTopWindow :: LightButton a  ->  IO (Window ())
lightButtonTopWindow= buttonTopWindow
lightButtonTopWindowOffset :: LightButton a -> IO (Position)
lightButtonTopWindowOffset= buttonTopWindowOffset
lightButtonValue :: LightButton a  ->  IO (Bool)
lightButtonValue= buttonValue
lightButtonSetValue :: LightButton a  -> Bool ->  IO (Bool)
lightButtonSetValue= buttonSetValue
lightButtonSet :: LightButton a  ->  IO (Bool)
lightButtonSet= buttonSet
lightButtonClear :: LightButton a  ->  IO (Bool)
lightButtonClear= buttonClear
lightButtonSetonly :: LightButton a  ->  IO (())
lightButtonSetonly= buttonSetonly
lightButtonGetShortcut :: LightButton a  ->  IO (FlShortcut)
lightButtonGetShortcut= buttonGetShortcut
lightButtonSetShortcut :: LightButton a  -> Int ->  IO (())
lightButtonSetShortcut= buttonSetShortcut
lightButtonDownBox :: LightButton a  ->  IO (Boxtype)
lightButtonDownBox= buttonDownBox
lightButtonSetDownBox :: LightButton a  -> Boxtype ->  IO (())
lightButtonSetDownBox= buttonSetDownBox
lightButtonDownColor :: LightButton a  ->  IO (Color)
lightButtonDownColor= buttonDownColor
lightButtonSetDownColor :: LightButton a  -> Color ->  IO (())
lightButtonSetDownColor= buttonSetDownColor
