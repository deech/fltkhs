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
lightButtonNew :: Rectangle -> Maybe String -> IO (Button ())
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
lightButtonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
lightButtonSetCallback= buttonSetCallback
lightButtonParent :: Widget a -> IO (Group ())
lightButtonParent= buttonParent
lightButtonSetParent :: Widget a -> Group b -> IO ()
lightButtonSetParent= buttonSetParent
lightButtonType_ :: Widget a  ->  IO (Word8)
lightButtonType_= buttonType_
lightButtonSetType :: Widget a  -> Word8 ->  IO (())
lightButtonSetType= buttonSetType
lightButtonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
lightButtonDrawLabel= buttonDrawLabel
lightButtonX :: Widget a  ->  IO (Int)
lightButtonX= buttonX
lightButtonY :: Widget a  ->  IO (Int)
lightButtonY= buttonY
lightButtonW :: Widget a  ->  IO (Int)
lightButtonW= buttonW
lightButtonH :: Widget a  ->  IO (Int)
lightButtonH= buttonH
lightButtonSetAlign :: Widget a  -> AlignType ->  IO (())
lightButtonSetAlign= buttonSetAlign
lightButtonAlign :: Widget a  ->  IO (AlignType)
lightButtonAlign= buttonAlign
lightButtonBox :: Widget a  ->  IO (Boxtype)
lightButtonBox= buttonBox
lightButtonSetBox :: Widget a  -> Boxtype ->  IO (())
lightButtonSetBox= buttonSetBox
lightButtonColor :: Widget a  ->  IO (Color)
lightButtonColor= buttonColor
lightButtonSetColor :: Widget a  -> Color ->  IO (())
lightButtonSetColor= buttonSetColor
lightButtonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
lightButtonSetColorWithBgSel= buttonSetColorWithBgSel
lightButtonSelectionColor :: Widget a  ->  IO (Color)
lightButtonSelectionColor= buttonSelectionColor
lightButtonSetSelectionColor :: Widget a  -> Color ->  IO (())
lightButtonSetSelectionColor= buttonSetSelectionColor
lightButtonLabel :: Widget a  ->  IO (String)
lightButtonLabel= buttonLabel
lightButtonCopyLabel :: Widget a  -> String ->  IO (())
lightButtonCopyLabel= buttonCopyLabel
lightButtonSetLabel :: Widget a  -> String ->  IO (())
lightButtonSetLabel= buttonSetLabel
lightButtonLabeltype :: Widget a  ->  IO (Labeltype)
lightButtonLabeltype= buttonLabeltype
lightButtonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
lightButtonSetLabeltype= buttonSetLabeltype
lightButtonLabelcolor :: Widget a  ->  IO (Color)
lightButtonLabelcolor= buttonLabelcolor
lightButtonSetLabelcolor :: Widget a  -> Color ->  IO (())
lightButtonSetLabelcolor= buttonSetLabelcolor
lightButtonLabelfont :: Widget a  ->  IO (Font)
lightButtonLabelfont= buttonLabelfont
lightButtonSetLabelfont :: Widget a  -> Font ->  IO (())
lightButtonSetLabelfont= buttonSetLabelfont
lightButtonLabelsize :: Widget a  ->  IO (FontSize)
lightButtonLabelsize= buttonLabelsize
lightButtonSetLabelsize :: Widget a  -> FontSize ->  IO (())
lightButtonSetLabelsize= buttonSetLabelsize
lightButtonImage :: Widget a  ->  IO (Image ())
lightButtonImage= buttonImage
lightButtonSetImage :: Widget a  -> Image b ->  IO (())
lightButtonSetImage= buttonSetImage
lightButtonDeimage :: Widget a  ->  IO (Image ())
lightButtonDeimage= buttonDeimage
lightButtonSetDeimage :: Widget a  -> Image b ->  IO (())
lightButtonSetDeimage= buttonSetDeimage
lightButtonTooltip :: Widget a  ->  IO (String)
lightButtonTooltip= buttonTooltip
lightButtonCopyTooltip :: Widget a  -> String ->  IO (())
lightButtonCopyTooltip= buttonCopyTooltip
lightButtonSetTooltip :: Widget a  -> String ->  IO (())
lightButtonSetTooltip= buttonSetTooltip
lightButtonWhen :: Widget a  ->  IO (When)
lightButtonWhen= buttonWhen
lightButtonSetWhen :: Widget a  -> Word8 ->  IO (())
lightButtonSetWhen= buttonSetWhen
lightButtonVisible :: Widget a  ->  IO (Int)
lightButtonVisible= buttonVisible
lightButtonVisibleR :: Widget a  ->  IO (Int)
lightButtonVisibleR= buttonVisibleR
lightButtonSetVisible :: Widget a  ->  IO (())
lightButtonSetVisible= buttonSetVisible
lightButtonClearVisible :: Widget a  ->  IO (())
lightButtonClearVisible= buttonClearVisible
lightButtonActive :: Widget a  ->  IO (Int)
lightButtonActive= buttonActive
lightButtonActiveR :: Widget a  ->  IO (Int)
lightButtonActiveR= buttonActiveR
lightButtonActivate :: Widget a  ->  IO (())
lightButtonActivate= buttonActivate
lightButtonDeactivate :: Widget a  ->  IO (())
lightButtonDeactivate= buttonDeactivate
lightButtonOutput :: Widget a  ->  IO (Int)
lightButtonOutput= buttonOutput
lightButtonSetOutput :: Widget a  ->  IO (())
lightButtonSetOutput= buttonSetOutput
lightButtonClearOutput :: Widget a  ->  IO (())
lightButtonClearOutput= buttonClearOutput
lightButtonTakesevents :: Widget a  ->  IO (Int)
lightButtonTakesevents= buttonTakesevents
lightButtonSetChanged :: Widget a  ->  IO (())
lightButtonSetChanged= buttonSetChanged
lightButtonClearChanged :: Widget a  ->  IO (())
lightButtonClearChanged= buttonClearChanged
lightButtonTakeFocus :: Widget a  ->  IO (Int)
lightButtonTakeFocus= buttonTakeFocus
lightButtonSetVisibleFocus :: Widget a  ->  IO (())
lightButtonSetVisibleFocus= buttonSetVisibleFocus
lightButtonClearVisibleFocus :: Widget a  ->  IO (())
lightButtonClearVisibleFocus= buttonClearVisibleFocus
lightButtonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
lightButtonModifyVisibleFocus= buttonModifyVisibleFocus
lightButtonVisibleFocus :: Widget a  ->  IO (Int)
lightButtonVisibleFocus= buttonVisibleFocus
lightButtonContains :: Widget a  -> Widget a  ->  IO (Int)
lightButtonContains= buttonContains
lightButtonInside :: Widget a  -> Widget a  ->  IO (Int)
lightButtonInside= buttonInside
lightButtonRedraw :: Widget a  ->  IO (())
lightButtonRedraw= buttonRedraw
lightButtonRedrawLabel :: Widget a  ->  IO (())
lightButtonRedrawLabel= buttonRedrawLabel
lightButtonDamage :: Widget a  ->  IO (Word8)
lightButtonDamage= buttonDamage
lightButtonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
lightButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
lightButtonClearDamage :: Widget a  ->  IO (())
lightButtonClearDamage= buttonClearDamage
lightButtonDamageWithText :: Widget a  -> Word8 ->  IO (())
lightButtonDamageWithText= buttonDamageWithText
lightButtonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
lightButtonDamageInsideWidget= buttonDamageInsideWidget
lightButtonMeasureLabel :: Widget a  -> IO (Size)
lightButtonMeasureLabel= buttonMeasureLabel
lightButtonWindow :: Widget a  ->  IO (Window ())
lightButtonWindow= buttonWindow
lightButtonTopWindow :: Widget a  ->  IO (Window ())
lightButtonTopWindow= buttonTopWindow
lightButtonTopWindowOffset :: Widget a -> IO (Position)
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
