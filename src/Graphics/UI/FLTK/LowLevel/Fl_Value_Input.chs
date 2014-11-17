{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Value_Input
    (
     -- * Constructor
     valueInputNew,
     valueInputDestroy,
     -- * Fl_ValueInput specific
     valueInputParent,
     valueInputSetParent,
     valueInputType_,
     valueInputSetType,
     valueInputDrawLabel,
     valueInputX,
     valueInputY,
     valueInputW,
     valueInputH,
     valueInputSetAlign,
     valueInputAlign,
     valueInputBox,
     valueInputSetBox,
     valueInputColor,
     valueInputSetColor,
     valueInputSetColorWithBgSel,
     valueInputSelectionColor,
     valueInputSetSelectionColor,
     valueInputLabel,
     valueInputCopyLabel,
     valueInputSetLabel,
     valueInputLabeltype,
     valueInputSetLabeltype,
     valueInputLabelcolor,
     valueInputSetLabelcolor,
     valueInputLabelfont,
     valueInputSetLabelfont,
     valueInputLabelsize,
     valueInputSetLabelsize,
     valueInputImage,
     valueInputSetImage,
     valueInputDeimage,
     valueInputSetDeimage,
     valueInputTooltip,
     valueInputCopyTooltip,
     valueInputSetTooltip,
     valueInputWhen,
     valueInputSetWhen,
     valueInputVisible,
     valueInputVisibleR,
     valueInputShow,
     valueInputHide,
     valueInputSetVisible,
     valueInputClearVisible,
     valueInputActive,
     valueInputActiveR,
     valueInputActivate,
     valueInputDeactivate,
     valueInputOutput,
     valueInputSetOutput,
     valueInputClearOutput,
     valueInputTakesevents,
     valueInputSetChanged,
     valueInputClearChanged,
     valueInputTakeFocus,
     valueInputSetVisibleFocus,
     valueInputClearVisibleFocus,
     valueInputModifyVisibleFocus,
     valueInputVisibleFocus,
     valueInputContains,
     valueInputInside,
     valueInputRedraw,
     valueInputRedrawLabel,
     valueInputDamage,
     valueInputClearDamageWithBitmask,
     valueInputClearDamage,
     valueInputDamageWithText,
     valueInputMeasureLabel,
     valueInputWindow,
     valueInputTopWindow,
     valueInputTopWindowOffset,
     valueInputAsGlWindow,
     valueInputSetCallback,
     valueInputDrawBox,
     valueInputDrawBoxWithBoxtype,
     valueInputDrawBackdrop,
     valueInputDrawFocus,
     valueInputBounds,
     valueInputMinimum,
     valueInputSetMinimum,
     valueInputMaximum,
     valueInputSetMaximum,
     valueInputRange,
     valueInputSetStep,
     valueInputStep,
     valueInputPrecision,
     valueInputValue,
     valueInputSetValue,
     valueInputFormat,
     valueInputRound,
     valueInputClamp,
     valueInputIncrement,
     valueInputHandle,
     valueInputSoft,
     valueInputResize,
     valueInputSetSoft,
     valueInputShortcut,
     valueInputSetShortcut,
     valueInputTextfont,
     valueInputSetTextfont,
     valueInputTextsize,
     valueInputSetTextsize,
     valueInputTextcolor,
     valueInputSetTextcolor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Value_Input_New as valueInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Input_New_WithLabel as valueInputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueInputNew :: Rectangle -> Maybe String -> IO (ValueInput ())
valueInputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueInputNew' x_pos y_pos width height >>=
                             toObject
        Just l -> valueInputNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Value_Input_Destroy as valueInputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valueInputDestroy :: ValueInput a -> IO ()
valueInputDestroy win = swapObject win $ \winPtr -> do
                                        valueInputDestroy' winPtr
                                        return nullPtr

valueInputParent :: ValueInput a -> IO (Group ())
valueInputParent = valuatorParent
valueInputSetParent :: ValueInput a -> Group b -> IO ()
valueInputSetParent = valuatorSetParent
valueInputType_ :: ValueInput a  ->  IO (Word8)
valueInputType_ = valuatorType_
valueInputSetType :: ValueInput a  -> Word8 ->  IO (())
valueInputSetType = valuatorSetType
valueInputDrawLabel :: ValueInput a  -> Maybe (Rectangle,AlignType)->  IO (())
valueInputDrawLabel = valuatorDrawLabel
valueInputX :: ValueInput a  ->  IO (Int)
valueInputX = valuatorX
valueInputY :: ValueInput a  ->  IO (Int)
valueInputY = valuatorY
valueInputW :: ValueInput a  ->  IO (Int)
valueInputW = valuatorW
valueInputH :: ValueInput a  ->  IO (Int)
valueInputH = valuatorH
valueInputSetAlign :: ValueInput a  -> AlignType ->  IO (())
valueInputSetAlign = valuatorSetAlign
valueInputAlign :: ValueInput a  ->  IO (AlignType)
valueInputAlign = valuatorAlign
valueInputBox :: ValueInput a  ->  IO (Boxtype)
valueInputBox = valuatorBox
valueInputSetBox :: ValueInput a  -> Boxtype ->  IO (())
valueInputSetBox = valuatorSetBox
valueInputColor :: ValueInput a  ->  IO (Color)
valueInputColor = valuatorColor
valueInputSetColor :: ValueInput a  -> Color ->  IO (())
valueInputSetColor = valuatorSetColor
valueInputSetColorWithBgSel :: ValueInput a  -> Color -> Color ->  IO (())
valueInputSetColorWithBgSel = valuatorSetColorWithBgSel
valueInputSelectionColor :: ValueInput a  ->  IO (Color)
valueInputSelectionColor = valuatorSelectionColor
valueInputSetSelectionColor :: ValueInput a  -> Color ->  IO (())
valueInputSetSelectionColor = valuatorSetSelectionColor
valueInputLabel :: ValueInput a  ->  IO (String)
valueInputLabel = valuatorLabel
valueInputCopyLabel :: ValueInput a  -> String ->  IO (())
valueInputCopyLabel = valuatorCopyLabel
valueInputSetLabel :: ValueInput a  -> String ->  IO (())
valueInputSetLabel = valuatorSetLabel
valueInputLabeltype :: ValueInput a  ->  IO (Labeltype)
valueInputLabeltype = valuatorLabeltype
valueInputSetLabeltype :: ValueInput a  -> Labeltype ->  IO (())
valueInputSetLabeltype = valuatorSetLabeltype
valueInputLabelcolor :: ValueInput a  ->  IO (Color)
valueInputLabelcolor = valuatorLabelcolor
valueInputSetLabelcolor :: ValueInput a  -> Color ->  IO (())
valueInputSetLabelcolor = valuatorSetLabelcolor
valueInputLabelfont :: ValueInput a  ->  IO (Font)
valueInputLabelfont = valuatorLabelfont
valueInputSetLabelfont :: ValueInput a  -> Font ->  IO (())
valueInputSetLabelfont = valuatorSetLabelfont
valueInputLabelsize :: ValueInput a  ->  IO (FontSize)
valueInputLabelsize = valuatorLabelsize
valueInputSetLabelsize :: ValueInput a  -> FontSize ->  IO (())
valueInputSetLabelsize = valuatorSetLabelsize
valueInputImage :: ValueInput a  ->  IO (Image ())
valueInputImage = valuatorImage
valueInputSetImage :: ValueInput a  -> Image b ->  IO (())
valueInputSetImage = valuatorSetImage
valueInputDeimage :: ValueInput a  ->  IO (Image ())
valueInputDeimage = valuatorDeimage
valueInputSetDeimage :: ValueInput a  -> Image b ->  IO (())
valueInputSetDeimage = valuatorSetDeimage
valueInputTooltip :: ValueInput a  ->  IO (String)
valueInputTooltip = valuatorTooltip
valueInputCopyTooltip :: ValueInput a  -> String ->  IO (())
valueInputCopyTooltip = valuatorCopyTooltip
valueInputSetTooltip :: ValueInput a  -> String ->  IO (())
valueInputSetTooltip = valuatorSetTooltip
valueInputWhen :: ValueInput a  ->  IO (When)
valueInputWhen = valuatorWhen
valueInputSetWhen :: ValueInput a  -> Word8 ->  IO (())
valueInputSetWhen = valuatorSetWhen
valueInputVisible :: ValueInput a  ->  IO (Int)
valueInputVisible = valuatorVisible
valueInputVisibleR :: ValueInput a  ->  IO (Int)
valueInputVisibleR = valuatorVisibleR
valueInputShow :: ValueInput a  ->  IO (())
valueInputShow = valuatorShow
valueInputHide :: ValueInput a  ->  IO (())
valueInputHide = valuatorHide
valueInputSetVisible :: ValueInput a  ->  IO (())
valueInputSetVisible = valuatorSetVisible
valueInputClearVisible :: ValueInput a  ->  IO (())
valueInputClearVisible = valuatorClearVisible
valueInputActive :: ValueInput a  ->  IO (Int)
valueInputActive = valuatorActive
valueInputActiveR :: ValueInput a  ->  IO (Int)
valueInputActiveR = valuatorActiveR
valueInputActivate :: ValueInput a  ->  IO (())
valueInputActivate = valuatorActivate
valueInputDeactivate :: ValueInput a  ->  IO (())
valueInputDeactivate = valuatorDeactivate
valueInputOutput :: ValueInput a  ->  IO (Int)
valueInputOutput = valuatorOutput
valueInputSetOutput :: ValueInput a  ->  IO (())
valueInputSetOutput = valuatorSetOutput
valueInputClearOutput :: ValueInput a  ->  IO (())
valueInputClearOutput = valuatorClearOutput
valueInputTakesevents :: ValueInput a  ->  IO (Int)
valueInputTakesevents = valuatorTakesevents
valueInputSetChanged :: ValueInput a  ->  IO (())
valueInputSetChanged = valuatorSetChanged
valueInputClearChanged :: ValueInput a  ->  IO (())
valueInputClearChanged = valuatorClearChanged
valueInputTakeFocus :: ValueInput a  ->  IO (Int)
valueInputTakeFocus = valuatorTakeFocus
valueInputSetVisibleFocus :: ValueInput a  ->  IO (())
valueInputSetVisibleFocus = valuatorSetVisibleFocus
valueInputClearVisibleFocus :: ValueInput a  ->  IO (())
valueInputClearVisibleFocus = valuatorClearVisibleFocus
valueInputModifyVisibleFocus :: ValueInput a  -> Int ->  IO (())
valueInputModifyVisibleFocus = valuatorModifyVisibleFocus
valueInputVisibleFocus :: ValueInput a  ->  IO (Int)
valueInputVisibleFocus = valuatorVisibleFocus
valueInputContains :: ValueInput a  -> ValueInput a  ->  IO (Int)
valueInputContains = valuatorContains
valueInputInside :: ValueInput a  -> ValueInput a  ->  IO (Int)
valueInputInside = valuatorInside
valueInputRedraw :: ValueInput a  ->  IO (())
valueInputRedraw = valuatorRedraw
valueInputRedrawLabel :: ValueInput a  ->  IO (())
valueInputRedrawLabel = valuatorRedrawLabel
valueInputDamage :: ValueInput a  ->  IO (Word8)
valueInputDamage = valuatorDamage
valueInputClearDamageWithBitmask :: ValueInput a  -> Word8 ->  IO (())
valueInputClearDamageWithBitmask = valuatorClearDamageWithBitmask
valueInputClearDamage :: ValueInput a  ->  IO (())
valueInputClearDamage = valuatorClearDamage
valueInputDamageWithText :: ValueInput a  -> Word8 ->  IO (())
valueInputDamageWithText = valuatorDamageWithText
valueInputMeasureLabel :: ValueInput a  -> IO (Size)
valueInputMeasureLabel = valuatorMeasureLabel
valueInputWindow :: ValueInput a  ->  IO (Window ())
valueInputWindow = valuatorWindow
valueInputTopWindow :: ValueInput a  ->  IO (Window ())
valueInputTopWindow = valuatorTopWindow
valueInputTopWindowOffset :: ValueInput a -> IO (Position)
valueInputTopWindowOffset = valuatorTopWindowOffset
valueInputAsGlWindow :: ValueInput a  ->  IO (GlWindow ())
valueInputAsGlWindow =  valuatorAsGlWindow
valueInputSetCallback :: ValueInput a -> (ValueInput b -> IO ()) -> IO (())
valueInputSetCallback = valuatorSetCallback
valueInputBounds :: ValueInput a  -> Double -> Double ->  IO (())
valueInputBounds = valuatorBounds
valueInputMinimum :: ValueInput a  ->  IO (Double)
valueInputMinimum = valuatorMinimum
valueInputSetMinimum :: ValueInput a  -> Double ->  IO (())
valueInputSetMinimum = valuatorSetMinimum
valueInputMaximum :: ValueInput a  ->  IO (Double)
valueInputMaximum = valuatorMaximum
valueInputSetMaximum :: ValueInput a  -> Double ->  IO (())
valueInputSetMaximum = valuatorSetMaximum
valueInputRange :: ValueInput a  -> Double -> Double ->  IO (())
valueInputRange = valuatorRange
valueInputSetStep :: ValueInput a -> Rational -> IO ()
valueInputSetStep = valuatorSetStep
valueInputStep :: ValueInput a  ->  IO (Rational)
valueInputStep = valuatorStep
valueInputPrecision :: ValueInput a  -> Int ->  IO (())
valueInputPrecision = valuatorPrecision
valueInputValue :: ValueInput a  ->  IO (Double)
valueInputValue = valuatorValue
valueInputSetValue :: ValueInput a  -> Double ->  IO (Int)
valueInputSetValue = valuatorSetValue
valueInputFormat :: ValueInput a  -> String ->  IO (Int)
valueInputFormat = valuatorFormat
valueInputRound :: ValueInput a  -> Double ->  IO (Double)
valueInputRound = valuatorRound
valueInputClamp :: ValueInput a  -> Double ->  IO (Double)
valueInputClamp = valuatorClamp
valueInputIncrement :: ValueInput a  -> Double -> Int ->  IO (Double)
valueInputIncrement = valuatorIncrement
valueInputDrawBox :: ValueInput a -> IO ()
valueInputDrawBox = valuatorDrawBox
valueInputDrawBoxWithBoxtype :: ValueInput a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
valueInputDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
valueInputDrawBackdrop :: ValueInput a -> IO ()
valueInputDrawBackdrop = valuatorDrawBackdrop
valueInputDrawFocus :: ValueInput a -> Maybe (Boxtype, Rectangle) -> IO ()
valueInputDrawFocus = valuatorDrawFocus
{#fun Fl_Value_Input_handle as valueInputHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
valueInputHandle :: ValueInput a -> Event -> IO Int
valueInputHandle valueInput event = withObject valueInput (\p -> valueInputHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Value_Input_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
valueInputSoft :: ValueInput a  ->  IO (Bool)
valueInputSoft value_input = withObject value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun unsafe Fl_Value_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
valueInputResize :: ValueInput a  -> Rectangle ->  IO ()
valueInputResize value_input rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withObject value_input $ \value_inputPtr -> resize' value_inputPtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Value_Input_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
valueInputSetSoft :: ValueInput a  -> Bool->  IO ()
valueInputSetSoft value_input s = withObject value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun unsafe Fl_Value_Input_shortcut as shortcut' { id `Ptr ()' } -> `Int' #}
valueInputShortcut :: ValueInput a  ->  IO (Int)
valueInputShortcut value_input = withObject value_input $ \value_inputPtr -> shortcut' value_inputPtr
{# fun unsafe Fl_Value_Input_set_shortcut as setShortcut' { id `Ptr ()',`Int' } -> `()' #}
valueInputSetShortcut :: ValueInput a  -> Int ->  IO ()
valueInputSetShortcut value_input v = withObject value_input $ \value_inputPtr -> setShortcut' value_inputPtr v
{# fun unsafe Fl_Value_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
valueInputTextfont :: ValueInput a  ->  IO (Font)
valueInputTextfont value_input = withObject value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun unsafe Fl_Value_Input_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
valueInputSetTextfont :: ValueInput a  -> Int ->  IO ()
valueInputSetTextfont value_input v = withObject value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun unsafe Fl_Value_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
valueInputTextsize :: ValueInput a  ->  IO (FontSize)
valueInputTextsize value_input = withObject value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun unsafe Fl_Value_Input_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
valueInputSetTextsize :: ValueInput a  -> FontSize ->  IO ()
valueInputSetTextsize value_input (FontSize v) = withObject value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun unsafe Fl_Value_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
valueInputTextcolor :: ValueInput a  ->  IO (Color)
valueInputTextcolor value_input = withObject value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun unsafe Fl_Value_Input_set_textcolor as setTextcolor' { id `Ptr ()',`Int' } -> `()' #}
valueInputSetTextcolor :: ValueInput a  -> Int ->  IO ()
valueInputSetTextcolor value_input v = withObject value_input $ \value_inputPtr -> setTextcolor' value_inputPtr v
