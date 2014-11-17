{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Value_Output
    (
     -- * Constructor
     valueOutputNew,
     valueOutputDestroy,
     -- * Fl_ValueOutput specific
     valueOutputParent,
     valueOutputSetParent,
     valueOutputType_,
     valueOutputSetType,
     valueOutputDrawLabel,
     valueOutputX,
     valueOutputY,
     valueOutputW,
     valueOutputH,
     valueOutputSetAlign,
     valueOutputAlign,
     valueOutputBox,
     valueOutputSetBox,
     valueOutputColor,
     valueOutputSetColor,
     valueOutputSetColorWithBgSel,
     valueOutputSelectionColor,
     valueOutputSetSelectionColor,
     valueOutputLabel,
     valueOutputCopyLabel,
     valueOutputSetLabel,
     valueOutputLabeltype,
     valueOutputSetLabeltype,
     valueOutputLabelcolor,
     valueOutputSetLabelcolor,
     valueOutputLabelfont,
     valueOutputSetLabelfont,
     valueOutputLabelsize,
     valueOutputSetLabelsize,
     valueOutputImage,
     valueOutputSetImage,
     valueOutputDeimage,
     valueOutputSetDeimage,
     valueOutputTooltip,
     valueOutputCopyTooltip,
     valueOutputSetTooltip,
     valueOutputWhen,
     valueOutputSetWhen,
     valueOutputVisible,
     valueOutputVisibleR,
     valueOutputShow,
     valueOutputHide,
     valueOutputSetVisible,
     valueOutputClearVisible,
     valueOutputActive,
     valueOutputActiveR,
     valueOutputActivate,
     valueOutputDeactivate,
     valueOutputOutput,
     valueOutputSetOutput,
     valueOutputClearOutput,
     valueOutputTakesevents,
     valueOutputSetChanged,
     valueOutputClearChanged,
     valueOutputTakeFocus,
     valueOutputSetVisibleFocus,
     valueOutputClearVisibleFocus,
     valueOutputModifyVisibleFocus,
     valueOutputVisibleFocus,
     valueOutputContains,
     valueOutputInside,
     valueOutputRedraw,
     valueOutputRedrawLabel,
     valueOutputDamage,
     valueOutputClearDamageWithBitmask,
     valueOutputClearDamage,
     valueOutputDamageWithText,
     valueOutputMeasureLabel,
     valueOutputWindow,
     valueOutputTopWindow,
     valueOutputTopWindowOffset,
     valueOutputAsGlWindow,
     valueOutputSetCallback,
     valueOutputDrawBox,
     valueOutputDrawBoxWithBoxtype,
     valueOutputDrawBackdrop,
     valueOutputDrawFocus,
     valueOutputBounds,
     valueOutputMinimum,
     valueOutputSetMinimum,
     valueOutputMaximum,
     valueOutputSetMaximum,
     valueOutputRange,
     valueOutputSetStep,
     valueOutputStep,
     valueOutputPrecision,
     valueOutputValue,
     valueOutputSetValue,
     valueOutputFormat,
     valueOutputRound,
     valueOutputClamp,
     valueOutputIncrement,
     valueOutputHandle,
     valueOutputSoft,
     valueOutputResize,
     valueOutputSetSoft,
     valueOutputTextfont,
     valueOutputSetTextfont,
     valueOutputTextsize,
     valueOutputSetTextsize,
     valueOutputTextcolor,
     valueOutputSetTextcolor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_OutputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Value_Output_New as valueOutputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Output_New_WithLabel as valueOutputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueOutputNew :: Rectangle -> Maybe String -> IO (ValueOutput ())
valueOutputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueOutputNew' x_pos y_pos width height >>=
                             toObject
        Just l -> valueOutputNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Value_Output_Destroy as valueOutputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valueOutputDestroy :: ValueOutput a -> IO ()
valueOutputDestroy win = swapObject win $ \winPtr -> do
                                        valueOutputDestroy' winPtr
                                        return nullPtr

valueOutputParent :: ValueOutput a -> IO (Group ())
valueOutputParent = valuatorParent
valueOutputSetParent :: ValueOutput a -> Group b -> IO ()
valueOutputSetParent = valuatorSetParent
valueOutputType_ :: ValueOutput a  ->  IO (Word8)
valueOutputType_ = valuatorType_
valueOutputSetType :: ValueOutput a  -> Word8 ->  IO (())
valueOutputSetType = valuatorSetType
valueOutputDrawLabel :: ValueOutput a  -> Maybe (Rectangle,AlignType)->  IO (())
valueOutputDrawLabel = valuatorDrawLabel
valueOutputX :: ValueOutput a  ->  IO (Int)
valueOutputX = valuatorX
valueOutputY :: ValueOutput a  ->  IO (Int)
valueOutputY = valuatorY
valueOutputW :: ValueOutput a  ->  IO (Int)
valueOutputW = valuatorW
valueOutputH :: ValueOutput a  ->  IO (Int)
valueOutputH = valuatorH
valueOutputSetAlign :: ValueOutput a  -> AlignType ->  IO (())
valueOutputSetAlign = valuatorSetAlign
valueOutputAlign :: ValueOutput a  ->  IO (AlignType)
valueOutputAlign = valuatorAlign
valueOutputBox :: ValueOutput a  ->  IO (Boxtype)
valueOutputBox = valuatorBox
valueOutputSetBox :: ValueOutput a  -> Boxtype ->  IO (())
valueOutputSetBox = valuatorSetBox
valueOutputColor :: ValueOutput a  ->  IO (Color)
valueOutputColor = valuatorColor
valueOutputSetColor :: ValueOutput a  -> Color ->  IO (())
valueOutputSetColor = valuatorSetColor
valueOutputSetColorWithBgSel :: ValueOutput a  -> Color -> Color ->  IO (())
valueOutputSetColorWithBgSel = valuatorSetColorWithBgSel
valueOutputSelectionColor :: ValueOutput a  ->  IO (Color)
valueOutputSelectionColor = valuatorSelectionColor
valueOutputSetSelectionColor :: ValueOutput a  -> Color ->  IO (())
valueOutputSetSelectionColor = valuatorSetSelectionColor
valueOutputLabel :: ValueOutput a  ->  IO (String)
valueOutputLabel = valuatorLabel
valueOutputCopyLabel :: ValueOutput a  -> String ->  IO (())
valueOutputCopyLabel = valuatorCopyLabel
valueOutputSetLabel :: ValueOutput a  -> String ->  IO (())
valueOutputSetLabel = valuatorSetLabel
valueOutputLabeltype :: ValueOutput a  ->  IO (Labeltype)
valueOutputLabeltype = valuatorLabeltype
valueOutputSetLabeltype :: ValueOutput a  -> Labeltype ->  IO (())
valueOutputSetLabeltype = valuatorSetLabeltype
valueOutputLabelcolor :: ValueOutput a  ->  IO (Color)
valueOutputLabelcolor = valuatorLabelcolor
valueOutputSetLabelcolor :: ValueOutput a  -> Color ->  IO (())
valueOutputSetLabelcolor = valuatorSetLabelcolor
valueOutputLabelfont :: ValueOutput a  ->  IO (Font)
valueOutputLabelfont = valuatorLabelfont
valueOutputSetLabelfont :: ValueOutput a  -> Font ->  IO (())
valueOutputSetLabelfont = valuatorSetLabelfont
valueOutputLabelsize :: ValueOutput a  ->  IO (FontSize)
valueOutputLabelsize = valuatorLabelsize
valueOutputSetLabelsize :: ValueOutput a  -> FontSize ->  IO (())
valueOutputSetLabelsize = valuatorSetLabelsize
valueOutputImage :: ValueOutput a  ->  IO (Image ())
valueOutputImage = valuatorImage
valueOutputSetImage :: ValueOutput a  -> Image b ->  IO (())
valueOutputSetImage = valuatorSetImage
valueOutputDeimage :: ValueOutput a  ->  IO (Image ())
valueOutputDeimage = valuatorDeimage
valueOutputSetDeimage :: ValueOutput a  -> Image b ->  IO (())
valueOutputSetDeimage = valuatorSetDeimage
valueOutputTooltip :: ValueOutput a  ->  IO (String)
valueOutputTooltip = valuatorTooltip
valueOutputCopyTooltip :: ValueOutput a  -> String ->  IO (())
valueOutputCopyTooltip = valuatorCopyTooltip
valueOutputSetTooltip :: ValueOutput a  -> String ->  IO (())
valueOutputSetTooltip = valuatorSetTooltip
valueOutputWhen :: ValueOutput a  ->  IO (When)
valueOutputWhen = valuatorWhen
valueOutputSetWhen :: ValueOutput a  -> Word8 ->  IO (())
valueOutputSetWhen = valuatorSetWhen
valueOutputVisible :: ValueOutput a  ->  IO (Int)
valueOutputVisible = valuatorVisible
valueOutputVisibleR :: ValueOutput a  ->  IO (Int)
valueOutputVisibleR = valuatorVisibleR
valueOutputShow :: ValueOutput a  ->  IO (())
valueOutputShow = valuatorShow
valueOutputHide :: ValueOutput a  ->  IO (())
valueOutputHide = valuatorHide
valueOutputSetVisible :: ValueOutput a  ->  IO (())
valueOutputSetVisible = valuatorSetVisible
valueOutputClearVisible :: ValueOutput a  ->  IO (())
valueOutputClearVisible = valuatorClearVisible
valueOutputActive :: ValueOutput a  ->  IO (Int)
valueOutputActive = valuatorActive
valueOutputActiveR :: ValueOutput a  ->  IO (Int)
valueOutputActiveR = valuatorActiveR
valueOutputActivate :: ValueOutput a  ->  IO (())
valueOutputActivate = valuatorActivate
valueOutputDeactivate :: ValueOutput a  ->  IO (())
valueOutputDeactivate = valuatorDeactivate
valueOutputOutput :: ValueOutput a  ->  IO (Int)
valueOutputOutput = valuatorOutput
valueOutputSetOutput :: ValueOutput a  ->  IO (())
valueOutputSetOutput = valuatorSetOutput
valueOutputClearOutput :: ValueOutput a  ->  IO (())
valueOutputClearOutput = valuatorClearOutput
valueOutputTakesevents :: ValueOutput a  ->  IO (Int)
valueOutputTakesevents = valuatorTakesevents
valueOutputSetChanged :: ValueOutput a  ->  IO (())
valueOutputSetChanged = valuatorSetChanged
valueOutputClearChanged :: ValueOutput a  ->  IO (())
valueOutputClearChanged = valuatorClearChanged
valueOutputTakeFocus :: ValueOutput a  ->  IO (Int)
valueOutputTakeFocus = valuatorTakeFocus
valueOutputSetVisibleFocus :: ValueOutput a  ->  IO (())
valueOutputSetVisibleFocus = valuatorSetVisibleFocus
valueOutputClearVisibleFocus :: ValueOutput a  ->  IO (())
valueOutputClearVisibleFocus = valuatorClearVisibleFocus
valueOutputModifyVisibleFocus :: ValueOutput a  -> Int ->  IO (())
valueOutputModifyVisibleFocus = valuatorModifyVisibleFocus
valueOutputVisibleFocus :: ValueOutput a  ->  IO (Int)
valueOutputVisibleFocus = valuatorVisibleFocus
valueOutputContains :: ValueOutput a  -> ValueOutput a  ->  IO (Int)
valueOutputContains = valuatorContains
valueOutputInside :: ValueOutput a  -> ValueOutput a  ->  IO (Int)
valueOutputInside = valuatorInside
valueOutputRedraw :: ValueOutput a  ->  IO (())
valueOutputRedraw = valuatorRedraw
valueOutputRedrawLabel :: ValueOutput a  ->  IO (())
valueOutputRedrawLabel = valuatorRedrawLabel
valueOutputDamage :: ValueOutput a  ->  IO (Word8)
valueOutputDamage = valuatorDamage
valueOutputClearDamageWithBitmask :: ValueOutput a  -> Word8 ->  IO (())
valueOutputClearDamageWithBitmask = valuatorClearDamageWithBitmask
valueOutputClearDamage :: ValueOutput a  ->  IO (())
valueOutputClearDamage = valuatorClearDamage
valueOutputDamageWithText :: ValueOutput a  -> Word8 ->  IO (())
valueOutputDamageWithText = valuatorDamageWithText
valueOutputMeasureLabel :: ValueOutput a  -> IO (Size)
valueOutputMeasureLabel = valuatorMeasureLabel
valueOutputWindow :: ValueOutput a  ->  IO (Window ())
valueOutputWindow = valuatorWindow
valueOutputTopWindow :: ValueOutput a  ->  IO (Window ())
valueOutputTopWindow = valuatorTopWindow
valueOutputTopWindowOffset :: ValueOutput a -> IO (Position)
valueOutputTopWindowOffset = valuatorTopWindowOffset
valueOutputAsGlWindow :: ValueOutput a  ->  IO (GlWindow ())
valueOutputAsGlWindow =  valuatorAsGlWindow
valueOutputSetCallback :: ValueOutput a -> (ValueOutput b -> IO ()) -> IO (())
valueOutputSetCallback = valuatorSetCallback
valueOutputBounds :: ValueOutput a  -> Double -> Double ->  IO (())
valueOutputBounds = valuatorBounds
valueOutputMinimum :: ValueOutput a  ->  IO (Double)
valueOutputMinimum = valuatorMinimum
valueOutputSetMinimum :: ValueOutput a  -> Double ->  IO (())
valueOutputSetMinimum = valuatorSetMinimum
valueOutputMaximum :: ValueOutput a  ->  IO (Double)
valueOutputMaximum = valuatorMaximum
valueOutputSetMaximum :: ValueOutput a  -> Double ->  IO (())
valueOutputSetMaximum = valuatorSetMaximum
valueOutputRange :: ValueOutput a  -> Double -> Double ->  IO (())
valueOutputRange = valuatorRange
valueOutputSetStep :: ValueOutput a -> Rational -> IO ()
valueOutputSetStep = valuatorSetStep
valueOutputStep :: ValueOutput a  ->  IO (Rational)
valueOutputStep = valuatorStep
valueOutputPrecision :: ValueOutput a  -> Int ->  IO (())
valueOutputPrecision = valuatorPrecision
valueOutputValue :: ValueOutput a  ->  IO (Double)
valueOutputValue = valuatorValue
valueOutputSetValue :: ValueOutput a  -> Double ->  IO (Int)
valueOutputSetValue = valuatorSetValue
valueOutputFormat :: ValueOutput a  -> String ->  IO (Int)
valueOutputFormat = valuatorFormat
valueOutputRound :: ValueOutput a  -> Double ->  IO (Double)
valueOutputRound = valuatorRound
valueOutputClamp :: ValueOutput a  -> Double ->  IO (Double)
valueOutputClamp = valuatorClamp
valueOutputIncrement :: ValueOutput a  -> Double -> Int ->  IO (Double)
valueOutputIncrement = valuatorIncrement
valueOutputDrawBox :: ValueOutput a -> IO ()
valueOutputDrawBox = valuatorDrawBox
valueOutputDrawBoxWithBoxtype :: ValueOutput a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
valueOutputDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
valueOutputDrawBackdrop :: ValueOutput a -> IO ()
valueOutputDrawBackdrop = valuatorDrawBackdrop
valueOutputDrawFocus :: ValueOutput a -> Maybe (Boxtype, Rectangle) -> IO ()
valueOutputDrawFocus = valuatorDrawFocus
{#fun Fl_Value_Output_handle as valueOutputHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
valueOutputHandle :: ValueOutput a -> Event -> IO Int
valueOutputHandle valueOutput event = withObject valueOutput (\p -> valueOutputHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Value_Output_soft as soft' { id `Ptr ()' } -> `Bool' cToBool #}
valueOutputSoft :: ValueOutput a  ->  IO (Bool)
valueOutputSoft value_input = withObject value_input $ \value_inputPtr -> soft' value_inputPtr
{# fun unsafe Fl_Value_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
valueOutputResize :: ValueOutput a  -> Rectangle ->  IO ()
valueOutputResize value_input rectangle = let (x_pos', y_pos', width', height') = fromRectangle rectangle in withObject value_input $ \value_inputPtr -> resize' value_inputPtr x_pos' y_pos' width' height'
{# fun unsafe Fl_Value_Output_set_soft as setSoft' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
valueOutputSetSoft :: ValueOutput a  -> Bool->  IO ()
valueOutputSetSoft value_input s = withObject value_input $ \value_inputPtr -> setSoft' value_inputPtr s
{# fun unsafe Fl_Value_Output_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
valueOutputTextfont :: ValueOutput a  ->  IO (Font)
valueOutputTextfont value_input = withObject value_input $ \value_inputPtr -> textfont' value_inputPtr
{# fun unsafe Fl_Value_Output_set_textfont as setTextfont' { id `Ptr ()',`Int' } -> `()' #}
valueOutputSetTextfont :: ValueOutput a  -> Int ->  IO ()
valueOutputSetTextfont value_input v = withObject value_input $ \value_inputPtr -> setTextfont' value_inputPtr v
{# fun unsafe Fl_Value_Output_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
valueOutputTextsize :: ValueOutput a  ->  IO (FontSize)
valueOutputTextsize value_input = withObject value_input $ \value_inputPtr -> textsize' value_inputPtr >>= return . FontSize
{# fun unsafe Fl_Value_Output_set_textsize as setTextsize' { id `Ptr ()',id `CInt' } -> `()' #}
valueOutputSetTextsize :: ValueOutput a  -> FontSize ->  IO ()
valueOutputSetTextsize value_input (FontSize v) = withObject value_input $ \value_inputPtr -> setTextsize' value_inputPtr v
{# fun unsafe Fl_Value_Output_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
valueOutputTextcolor :: ValueOutput a  ->  IO (Color)
valueOutputTextcolor value_input = withObject value_input $ \value_inputPtr -> textcolor' value_inputPtr
{# fun unsafe Fl_Value_Output_set_textcolor as setTextcolor' { id `Ptr ()',`Int' } -> `()' #}
valueOutputSetTextcolor :: ValueOutput a  -> Int ->  IO ()
valueOutputSetTextcolor value_input v = withObject value_input $ \value_inputPtr -> setTextcolor' value_inputPtr v
