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
returnButtonNew :: Rectangle -> Maybe String -> IO (Button ())
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
returnButtonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
returnButtonSetCallback= buttonSetCallback
returnButtonParent :: Widget a -> IO (Group ())
returnButtonParent= buttonParent
returnButtonSetParent :: Widget a -> Group b -> IO ()
returnButtonSetParent= buttonSetParent
returnButtonType_ :: Widget a  ->  IO (Word8)
returnButtonType_= buttonType_
returnButtonSetType :: Widget a  -> Word8 ->  IO (())
returnButtonSetType= buttonSetType
returnButtonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
returnButtonDrawLabel= buttonDrawLabel
returnButtonX :: Widget a  ->  IO (Int)
returnButtonX= buttonX
returnButtonY :: Widget a  ->  IO (Int)
returnButtonY= buttonY
returnButtonW :: Widget a  ->  IO (Int)
returnButtonW= buttonW
returnButtonH :: Widget a  ->  IO (Int)
returnButtonH= buttonH
returnButtonSetAlign :: Widget a  -> AlignType ->  IO (())
returnButtonSetAlign= buttonSetAlign
returnButtonAlign :: Widget a  ->  IO (AlignType)
returnButtonAlign= buttonAlign
returnButtonBox :: Widget a  ->  IO (Boxtype)
returnButtonBox= buttonBox
returnButtonSetBox :: Widget a  -> Boxtype ->  IO (())
returnButtonSetBox= buttonSetBox
returnButtonColor :: Widget a  ->  IO (Color)
returnButtonColor= buttonColor
returnButtonSetColor :: Widget a  -> Color ->  IO (())
returnButtonSetColor= buttonSetColor
returnButtonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
returnButtonSetColorWithBgSel= buttonSetColorWithBgSel
returnButtonSelectionColor :: Widget a  ->  IO (Color)
returnButtonSelectionColor= buttonSelectionColor
returnButtonSetSelectionColor :: Widget a  -> Color ->  IO (())
returnButtonSetSelectionColor= buttonSetSelectionColor
returnButtonLabel :: Widget a  ->  IO (String)
returnButtonLabel= buttonLabel
returnButtonCopyLabel :: Widget a  -> String ->  IO (())
returnButtonCopyLabel= buttonCopyLabel
returnButtonSetLabel :: Widget a  -> String ->  IO (())
returnButtonSetLabel= buttonSetLabel
returnButtonLabeltype :: Widget a  ->  IO (Labeltype)
returnButtonLabeltype= buttonLabeltype
returnButtonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
returnButtonSetLabeltype= buttonSetLabeltype
returnButtonLabelcolor :: Widget a  ->  IO (Color)
returnButtonLabelcolor= buttonLabelcolor
returnButtonSetLabelcolor :: Widget a  -> Color ->  IO (())
returnButtonSetLabelcolor= buttonSetLabelcolor
returnButtonLabelfont :: Widget a  ->  IO (Font)
returnButtonLabelfont= buttonLabelfont
returnButtonSetLabelfont :: Widget a  -> Font ->  IO (())
returnButtonSetLabelfont= buttonSetLabelfont
returnButtonLabelsize :: Widget a  ->  IO (FontSize)
returnButtonLabelsize= buttonLabelsize
returnButtonSetLabelsize :: Widget a  -> FontSize ->  IO (())
returnButtonSetLabelsize= buttonSetLabelsize
returnButtonImage :: Widget a  ->  IO (Image ())
returnButtonImage= buttonImage
returnButtonSetImage :: Widget a  -> Image b ->  IO (())
returnButtonSetImage= buttonSetImage
returnButtonDeimage :: Widget a  ->  IO (Image ())
returnButtonDeimage= buttonDeimage
returnButtonSetDeimage :: Widget a  -> Image b ->  IO (())
returnButtonSetDeimage= buttonSetDeimage
returnButtonTooltip :: Widget a  ->  IO (String)
returnButtonTooltip= buttonTooltip
returnButtonCopyTooltip :: Widget a  -> String ->  IO (())
returnButtonCopyTooltip= buttonCopyTooltip
returnButtonSetTooltip :: Widget a  -> String ->  IO (())
returnButtonSetTooltip= buttonSetTooltip
returnButtonWhen :: Widget a  ->  IO (When)
returnButtonWhen= buttonWhen
returnButtonSetWhen :: Widget a  -> Word8 ->  IO (())
returnButtonSetWhen= buttonSetWhen
returnButtonVisible :: Widget a  ->  IO (Int)
returnButtonVisible= buttonVisible
returnButtonVisibleR :: Widget a  ->  IO (Int)
returnButtonVisibleR= buttonVisibleR
returnButtonSetVisible :: Widget a  ->  IO (())
returnButtonSetVisible= buttonSetVisible
returnButtonClearVisible :: Widget a  ->  IO (())
returnButtonClearVisible= buttonClearVisible
returnButtonActive :: Widget a  ->  IO (Int)
returnButtonActive= buttonActive
returnButtonActiveR :: Widget a  ->  IO (Int)
returnButtonActiveR= buttonActiveR
returnButtonActivate :: Widget a  ->  IO (())
returnButtonActivate= buttonActivate
returnButtonDeactivate :: Widget a  ->  IO (())
returnButtonDeactivate= buttonDeactivate
returnButtonOutput :: Widget a  ->  IO (Int)
returnButtonOutput= buttonOutput
returnButtonSetOutput :: Widget a  ->  IO (())
returnButtonSetOutput= buttonSetOutput
returnButtonClearOutput :: Widget a  ->  IO (())
returnButtonClearOutput= buttonClearOutput
returnButtonTakesevents :: Widget a  ->  IO (Int)
returnButtonTakesevents= buttonTakesevents
returnButtonSetChanged :: Widget a  ->  IO (())
returnButtonSetChanged= buttonSetChanged
returnButtonClearChanged :: Widget a  ->  IO (())
returnButtonClearChanged= buttonClearChanged
returnButtonTakeFocus :: Widget a  ->  IO (Int)
returnButtonTakeFocus= buttonTakeFocus
returnButtonSetVisibleFocus :: Widget a  ->  IO (())
returnButtonSetVisibleFocus= buttonSetVisibleFocus
returnButtonClearVisibleFocus :: Widget a  ->  IO (())
returnButtonClearVisibleFocus= buttonClearVisibleFocus
returnButtonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
returnButtonModifyVisibleFocus= buttonModifyVisibleFocus
returnButtonVisibleFocus :: Widget a  ->  IO (Int)
returnButtonVisibleFocus= buttonVisibleFocus
returnButtonContains :: Widget a  -> Widget a  ->  IO (Int)
returnButtonContains= buttonContains
returnButtonInside :: Widget a  -> Widget a  ->  IO (Int)
returnButtonInside= buttonInside
returnButtonRedraw :: Widget a  ->  IO (())
returnButtonRedraw= buttonRedraw
returnButtonRedrawLabel :: Widget a  ->  IO (())
returnButtonRedrawLabel= buttonRedrawLabel
returnButtonDamage :: Widget a  ->  IO (Word8)
returnButtonDamage= buttonDamage
returnButtonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
returnButtonClearDamageWithBitmask= buttonClearDamageWithBitmask
returnButtonClearDamage :: Widget a  ->  IO (())
returnButtonClearDamage= buttonClearDamage
returnButtonDamageWithText :: Widget a  -> Word8 ->  IO (())
returnButtonDamageWithText= buttonDamageWithText
returnButtonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
returnButtonDamageInsideWidget= buttonDamageInsideWidget
returnButtonMeasureLabel :: Widget a  -> IO (Size)
returnButtonMeasureLabel= buttonMeasureLabel
returnButtonWindow :: Widget a  ->  IO (Window ())
returnButtonWindow= buttonWindow
returnButtonTopWindow :: Widget a  ->  IO (Window ())
returnButtonTopWindow= buttonTopWindow
returnButtonTopWindowOffset :: Widget a -> IO (Position)
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
