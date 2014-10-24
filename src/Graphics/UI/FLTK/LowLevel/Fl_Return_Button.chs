{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Return_Button
    (
     returnButtonNew,
     returnButtonDestroy,
     returnButtonHandle,
     returnButtonParent,
     returnButtonSetParent,
     returnButtonType_,
     returnButtonSetType,
     returnButtonAsWindow,
     returnButtonX,
     returnButtonY,
     returnButtonW,
     returnButtonH,
     returnButtonSetAlign,
     returnButtonAlign,
     returnButtonBox,
     returnButtonSetBox,
     returnButtonColor,
     returnButtonSetColor,
     returnButtonSetColorWithBgSel,
     returnButtonSelectionColor,
     returnButtonSetSelectionColor,
     returnButtonLabel,
     returnButtonCopyLabel,
     returnButtonSetLabel,
     returnButtonLabeltype,
     returnButtonSetLabeltype,
     returnButtonLabelcolor,
     returnButtonSetLabelcolor,
     returnButtonLabelfont,
     returnButtonSetLabelfont,
     returnButtonLabelsize,
     returnButtonSetLabelsize,
     returnButtonImage,
     returnButtonSetImage,
     returnButtonDeimage,
     returnButtonSetDeimage,
     returnButtonTooltip,
     returnButtonCopyTooltip,
     returnButtonSetTooltip,
     returnButtonWhen,
     returnButtonSetWhen,
     returnButtonVisible,
     returnButtonVisibleR,
     returnButtonShow,
     returnButtonHide,
     returnButtonSetVisible,
     returnButtonClearVisible,
     returnButtonActive,
     returnButtonActiveR,
     returnButtonActivate,
     returnButtonDeactivate,
     returnButtonOutput,
     returnButtonSetOutput,
     returnButtonClearOutput,
     returnButtonTakesevents,
     returnButtonSetChanged,
     returnButtonClearChanged,
     returnButtonTakeFocus,
     returnButtonSetVisibleFocus,
     returnButtonClearVisibleFocus,
     returnButtonModifyVisibleFocus,
     returnButtonVisibleFocus,
     returnButtonContains,
     returnButtonInside,
     returnButtonRedraw,
     returnButtonRedrawLabel,
     returnButtonDamage,
     returnButtonClearDamageWithBitmask,
     returnButtonClearDamage,
     returnButtonDamageWithText,
     returnButtonDamageInsideWidget,
     returnButtonMeasureLabel,
     returnButtonWindow,
     returnButtonTopWindow,
     returnButtonTopWindowOffset,
     returnButtonAsGroup,
     returnButtonAsGlWindow,
     returnButtonResize,
     returnButtonSetCallback,
     returnButtonDrawLabel,
     returnButtonValue,
     returnButtonSetValue,
     returnButtonSet,
     returnButtonClear,
     returnButtonSetonly,
     returnButtonGetShortcut,
     returnButtonSetShortcut,
     returnButtonDownBox,
     returnButtonSetDownBox,
     returnButtonDownColor,
     returnButtonSetDownColor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Return_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Return_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Return_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
returnButtonNew :: Rectangle -> Maybe String -> IO (ReturnButton ())
returnButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>=
                   toObject
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>=
                   toObject
{# fun Fl_Return_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
returnButtonDestroy :: ReturnButton a -> IO ()
returnButtonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
returnButtonHandle :: ReturnButton a -> Event -> IO Int
returnButtonHandle = buttonHandle
returnButtonAsGroup :: ReturnButton a  ->  IO (Group ())
returnButtonAsGroup = buttonAsGroup
returnButtonAsGlWindow :: ReturnButton a  ->  IO (GlWindow())
returnButtonAsGlWindow = buttonAsGlWindow
returnButtonAsWindow :: ReturnButton a  ->  IO (Window())
returnButtonAsWindow = buttonAsWindow
returnButtonResize :: ReturnButton a  -> Rectangle -> IO (())
returnButtonResize = buttonResize
returnButtonHide :: ReturnButton a  ->  IO (())
returnButtonHide = buttonHide
returnButtonShow :: ReturnButton a -> IO ()
returnButtonShow= buttonShow
returnButtonSetCallback :: ReturnButton a -> (ReturnButton b -> IO ()) -> IO (())
returnButtonSetCallback= buttonSetCallback
returnButtonParent :: ReturnButton a -> IO (Group ())
returnButtonParent= buttonParent
returnButtonSetParent :: ReturnButton a -> Group b -> IO ()
returnButtonSetParent= buttonSetParent
returnButtonType_ :: ReturnButton a  ->  IO (Word8)
returnButtonType_= buttonType_
returnButtonSetType :: ReturnButton a  -> Word8 ->  IO (())
returnButtonSetType= buttonSetType
returnButtonDrawLabel :: ReturnButton a  -> Maybe (Rectangle,AlignType)->  IO (())
returnButtonDrawLabel= buttonDrawLabel
returnButtonX :: ReturnButton a  ->  IO (Int)
returnButtonX= buttonX
returnButtonY :: ReturnButton a  ->  IO (Int)
returnButtonY= buttonY
returnButtonW :: ReturnButton a  ->  IO (Int)
returnButtonW= buttonW
returnButtonH :: ReturnButton a  ->  IO (Int)
returnButtonH= buttonH
returnButtonSetAlign :: ReturnButton a  -> AlignType ->  IO (())
returnButtonSetAlign= buttonSetAlign
returnButtonAlign :: ReturnButton a  ->  IO (AlignType)
returnButtonAlign= buttonAlign
returnButtonBox :: ReturnButton a  ->  IO (Boxtype)
returnButtonBox= buttonBox
returnButtonSetBox :: ReturnButton a  -> Boxtype ->  IO (())
returnButtonSetBox= buttonSetBox
returnButtonColor :: ReturnButton a  ->  IO (Color)
returnButtonColor= buttonColor
returnButtonSetColor :: ReturnButton a  -> Color ->  IO (())
returnButtonSetColor= buttonSetColor
returnButtonSetColorWithBgSel :: ReturnButton a  -> Color -> Color ->  IO (())
returnButtonSetColorWithBgSel= buttonSetColorWithBgSel
returnButtonSelectionColor :: ReturnButton a  ->  IO (Color)
returnButtonSelectionColor= buttonSelectionColor
returnButtonSetSelectionColor :: ReturnButton a  -> Color ->  IO (())
returnButtonSetSelectionColor= buttonSetSelectionColor
returnButtonLabel :: ReturnButton a  ->  IO (String)
returnButtonLabel= buttonLabel
returnButtonCopyLabel :: ReturnButton a  -> String ->  IO (())
returnButtonCopyLabel= buttonCopyLabel
returnButtonSetLabel :: ReturnButton a  -> String ->  IO (())
returnButtonSetLabel= buttonSetLabel
returnButtonLabeltype :: ReturnButton a  ->  IO (Labeltype)
returnButtonLabeltype= buttonLabeltype
returnButtonSetLabeltype :: ReturnButton a  -> Labeltype ->  IO (())
returnButtonSetLabeltype= buttonSetLabeltype
returnButtonLabelcolor :: ReturnButton a  ->  IO (Color)
returnButtonLabelcolor= buttonLabelcolor
returnButtonSetLabelcolor :: ReturnButton a  -> Color ->  IO (())
returnButtonSetLabelcolor= buttonSetLabelcolor
returnButtonLabelfont :: ReturnButton a  ->  IO (Font)
returnButtonLabelfont= buttonLabelfont
returnButtonSetLabelfont :: ReturnButton a  -> Font ->  IO (())
returnButtonSetLabelfont= buttonSetLabelfont
returnButtonLabelsize :: ReturnButton a  ->  IO (FontSize)
returnButtonLabelsize= buttonLabelsize
returnButtonSetLabelsize :: ReturnButton a  -> FontSize ->  IO (())
returnButtonSetLabelsize= buttonSetLabelsize
returnButtonImage :: ReturnButton a  ->  IO (Image ())
returnButtonImage= buttonImage
returnButtonSetImage :: ReturnButton a  -> Image b ->  IO (())
returnButtonSetImage= buttonSetImage
returnButtonDeimage :: ReturnButton a  ->  IO (Image ())
returnButtonDeimage= buttonDeimage
returnButtonSetDeimage :: ReturnButton a  -> Image b ->  IO (())
returnButtonSetDeimage= buttonSetDeimage
returnButtonTooltip :: ReturnButton a  ->  IO (String)
returnButtonTooltip= buttonTooltip
returnButtonCopyTooltip :: ReturnButton a  -> String ->  IO (())
returnButtonCopyTooltip= buttonCopyTooltip
returnButtonSetTooltip :: ReturnButton a  -> String ->  IO (())
returnButtonSetTooltip= buttonSetTooltip
returnButtonWhen :: ReturnButton a  ->  IO (When)
returnButtonWhen= buttonWhen
returnButtonSetWhen :: ReturnButton a  -> Word8 ->  IO (())
returnButtonSetWhen= buttonSetWhen
returnButtonVisible :: ReturnButton a  ->  IO (Int)
returnButtonVisible= buttonVisible
returnButtonVisibleR :: ReturnButton a  ->  IO (Int)
returnButtonVisibleR= buttonVisibleR
returnButtonSetVisible :: ReturnButton a  ->  IO (())
returnButtonSetVisible= buttonSetVisible
returnButtonClearVisible :: ReturnButton a  ->  IO (())
returnButtonClearVisible= buttonClearVisible
returnButtonActive :: ReturnButton a  ->  IO (Int)
returnButtonActive= buttonActive
returnButtonActiveR :: ReturnButton a  ->  IO (Int)
returnButtonActiveR= buttonActiveR
returnButtonActivate :: ReturnButton a  ->  IO (())
returnButtonActivate= buttonActivate
returnButtonDeactivate :: ReturnButton a  ->  IO (())
returnButtonDeactivate= buttonDeactivate
returnButtonOutput :: ReturnButton a  ->  IO (Int)
returnButtonOutput= buttonOutput
returnButtonSetOutput :: ReturnButton a  ->  IO (())
returnButtonSetOutput= buttonSetOutput
returnButtonClearOutput :: ReturnButton a  ->  IO (())
returnButtonClearOutput= buttonClearOutput
returnButtonTakesevents :: ReturnButton a  ->  IO (Int)
returnButtonTakesevents= buttonTakesevents
returnButtonSetChanged :: ReturnButton a  ->  IO (())
returnButtonSetChanged= buttonSetChanged
returnButtonClearChanged :: ReturnButton a  ->  IO (())
returnButtonClearChanged= buttonClearChanged
returnButtonTakeFocus :: ReturnButton a  ->  IO (Int)
returnButtonTakeFocus= buttonTakeFocus
returnButtonSetVisibleFocus :: ReturnButton a  ->  IO (())
returnButtonSetVisibleFocus= buttonSetVisibleFocus
returnButtonClearVisibleFocus :: ReturnButton a  ->  IO (())
returnButtonClearVisibleFocus= buttonClearVisibleFocus
returnButtonModifyVisibleFocus :: ReturnButton a  -> Int ->  IO (())
returnButtonModifyVisibleFocus= buttonModifyVisibleFocus
returnButtonVisibleFocus :: ReturnButton a  ->  IO (Int)
returnButtonVisibleFocus= buttonVisibleFocus
returnButtonContains :: ReturnButton a  -> ReturnButton a  ->  IO (Int)
returnButtonContains= buttonContains
returnButtonInside :: ReturnButton a  -> ReturnButton a  ->  IO (Int)
returnButtonInside= buttonInside
returnButtonRedraw :: ReturnButton a  ->  IO (())
returnButtonRedraw= buttonRedraw
returnButtonRedrawLabel :: ReturnButton a  ->  IO (())
returnButtonRedrawLabel= buttonRedrawLabel
returnButtonDamage :: ReturnButton a  ->  IO (Word8)
returnButtonDamage= buttonDamage
returnButtonClearDamageWithBitmask :: ReturnButton a  -> Word8 ->  IO (())
returnButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
returnButtonClearDamage :: ReturnButton a  ->  IO (())
returnButtonClearDamage= buttonClearDamage
returnButtonDamageWithText :: ReturnButton a  -> Word8 ->  IO (())
returnButtonDamageWithText= buttonDamageWithText
returnButtonDamageInsideWidget :: ReturnButton a  -> Word8 -> Rectangle ->  IO (())
returnButtonDamageInsideWidget= buttonDamageInsideWidget
returnButtonMeasureLabel :: ReturnButton a  -> IO (Size)
returnButtonMeasureLabel= buttonMeasureLabel
returnButtonWindow :: ReturnButton a  ->  IO (Window ())
returnButtonWindow= buttonWindow
returnButtonTopWindow :: ReturnButton a  ->  IO (Window ())
returnButtonTopWindow= buttonTopWindow
returnButtonTopWindowOffset :: ReturnButton a -> IO (Position)
returnButtonTopWindowOffset= buttonTopWindowOffset
returnButtonValue :: ReturnButton a  ->  IO (Bool)
returnButtonValue= buttonValue
returnButtonSetValue :: ReturnButton a  -> Bool ->  IO (Bool)
returnButtonSetValue= buttonSetValue
returnButtonSet :: ReturnButton a  ->  IO (Bool)
returnButtonSet= buttonSet
returnButtonClear :: ReturnButton a  ->  IO (Bool)
returnButtonClear= buttonClear
returnButtonSetonly :: ReturnButton a  ->  IO (())
returnButtonSetonly= buttonSetonly
returnButtonGetShortcut :: ReturnButton a  ->  IO (FlShortcut)
returnButtonGetShortcut= buttonGetShortcut
returnButtonSetShortcut :: ReturnButton a  -> Int ->  IO (())
returnButtonSetShortcut= buttonSetShortcut
returnButtonDownBox :: ReturnButton a  ->  IO (Boxtype)
returnButtonDownBox= buttonDownBox
returnButtonSetDownBox :: ReturnButton a  -> Boxtype ->  IO (())
returnButtonSetDownBox= buttonSetDownBox
returnButtonDownColor :: ReturnButton a  ->  IO (Color)
returnButtonDownColor= buttonDownColor
returnButtonSetDownColor :: ReturnButton a  -> Color ->  IO (())
returnButtonSetDownColor= buttonSetDownColor
