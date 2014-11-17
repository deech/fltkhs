{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Value_Slider
       (
         -- * Constructor
         valueSliderNew,
         horValueSliderNew,
         valueSliderDestroy,
         -- * Fl_Value_Slider specific
         valueSliderParent,
         valueSliderSetParent,
         valueSliderType_,
         valueSliderSetType,
         valueSliderDrawLabel,
         valueSliderX,
         valueSliderY,
         valueSliderW,
         valueSliderH,
         valueSliderSetAlign,
         valueSliderAlign,
         valueSliderBox,
         valueSliderSetBox,
         valueSliderColor,
         valueSliderSetColor,
         valueSliderSetColorWithBgSel,
         valueSliderSelectionColor,
         valueSliderSetSelectionColor,
         valueSliderLabel,
         valueSliderCopyLabel,
         valueSliderSetLabel,
         valueSliderLabeltype,
         valueSliderSetLabeltype,
         valueSliderLabelcolor,
         valueSliderSetLabelcolor,
         valueSliderLabelfont,
         valueSliderSetLabelfont,
         valueSliderLabelsize,
         valueSliderSetLabelsize,
         valueSliderImage,
         valueSliderSetImage,
         valueSliderDeimage,
         valueSliderSetDeimage,
         valueSliderTooltip,
         valueSliderCopyTooltip,
         valueSliderSetTooltip,
         valueSliderWhen,
         valueSliderSetWhen,
         valueSliderVisible,
         valueSliderVisibleR,
         valueSliderShow,
         valueSliderHide,
         valueSliderSetVisible,
         valueSliderClearVisible,
         valueSliderActive,
         valueSliderActiveR,
         valueSliderActivate,
         valueSliderDeactivate,
         valueSliderOutput,
         valueSliderSetOutput,
         valueSliderClearOutput,
         valueSliderTakesevents,
         valueSliderSetChanged,
         valueSliderClearChanged,
         valueSliderTakeFocus,
         valueSliderSetVisibleFocus,
         valueSliderClearVisibleFocus,
         valueSliderModifyVisibleFocus,
         valueSliderVisibleFocus,
         valueSliderContains,
         valueSliderInside,
         valueSliderRedraw,
         valueSliderRedrawLabel,
         valueSliderDamage,
         valueSliderClearDamageWithBitmask,
         valueSliderClearDamage,
         valueSliderDamageWithText,
         valueSliderMeasureLabel,
         valueSliderWindow,
         valueSliderTopWindow,
         valueSliderTopWindowOffset,
         valueSliderAsGlWindow,
         valueSliderResize,
         valueSliderSetCallback,
         valueSliderDrawBox,
         valueSliderDrawBoxWithBoxtype,
         valueSliderDrawBackdrop,
         valueSliderDrawFocus,
         valueSliderBounds,
         valueSliderMinimum,
         valueSliderSetMinimum,
         valueSliderMaximum,
         valueSliderSetMaximum,
         valueSliderRange,
         valueSliderSetStep,
         valueSliderStep,
         valueSliderPrecision,
         valueSliderValue,
         valueSliderSetValue,
         valueSliderFormat,
         valueSliderRound,
         valueSliderClamp,
         valueSliderIncrement,
         valueSliderHandle,
         valueSliderTextfont,
         valueSliderSetTextfont,
         valueSliderTextsize,
         valueSliderSetTextsize,
         valueSliderTextcolor,
         valueSliderSetTextcolor
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Value_Slider_New as valueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Slider_New_WithLabel as valueSliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueSliderNew :: Rectangle -> Maybe String -> IO (ValueSlider ())
valueSliderNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueSliderNew' x_pos y_pos width height >>= toObject
        Just l -> valueSliderNewWithLabel' x_pos y_pos width height l >>= toObject

{# fun Fl_Hor_Value_Slider_New as horValueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Hor_Value_Slider_New_WithLabel as horValueSliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
horValueSliderNew :: Rectangle -> Maybe String -> IO (HorValueSlider ())
horValueSliderNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> horValueSliderNew' x_pos y_pos width height >>= toObject
        Just l -> horValueSliderNewWithLabel' x_pos y_pos width height l >>= toObject

{# fun Fl_Value_Slider_Destroy as valueSliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valueSliderDestroy :: ValueSlider a -> IO ()
valueSliderDestroy win = swapObject win $ \winPtr -> do
                                        valueSliderDestroy' winPtr
                                        return nullPtr

valueSliderParent :: ValueSlider a -> IO (Group ())
valueSliderParent = valuatorParent
valueSliderSetParent :: ValueSlider a -> Group b -> IO ()
valueSliderSetParent = valuatorSetParent
valueSliderType_ :: ValueSlider a  ->  IO (Word8)
valueSliderType_ = valuatorType_
valueSliderSetType :: ValueSlider a  -> Word8 ->  IO (())
valueSliderSetType = valuatorSetType
valueSliderDrawLabel :: ValueSlider a  -> Maybe (Rectangle,AlignType)->  IO (())
valueSliderDrawLabel = valuatorDrawLabel
valueSliderX :: ValueSlider a  ->  IO (Int)
valueSliderX = valuatorX
valueSliderY :: ValueSlider a  ->  IO (Int)
valueSliderY = valuatorY
valueSliderW :: ValueSlider a  ->  IO (Int)
valueSliderW = valuatorW
valueSliderH :: ValueSlider a  ->  IO (Int)
valueSliderH = valuatorH
valueSliderSetAlign :: ValueSlider a  -> AlignType ->  IO (())
valueSliderSetAlign = valuatorSetAlign
valueSliderAlign :: ValueSlider a  ->  IO (AlignType)
valueSliderAlign = valuatorAlign
valueSliderBox :: ValueSlider a  ->  IO (Boxtype)
valueSliderBox = valuatorBox
valueSliderSetBox :: ValueSlider a  -> Boxtype ->  IO (())
valueSliderSetBox = valuatorSetBox
valueSliderColor :: ValueSlider a  ->  IO (Color)
valueSliderColor = valuatorColor
valueSliderSetColor :: ValueSlider a  -> Color ->  IO (())
valueSliderSetColor = valuatorSetColor
valueSliderSetColorWithBgSel :: ValueSlider a  -> Color -> Color ->  IO (())
valueSliderSetColorWithBgSel = valuatorSetColorWithBgSel
valueSliderSelectionColor :: ValueSlider a  ->  IO (Color)
valueSliderSelectionColor = valuatorSelectionColor
valueSliderSetSelectionColor :: ValueSlider a  -> Color ->  IO (())
valueSliderSetSelectionColor = valuatorSetSelectionColor
valueSliderLabel :: ValueSlider a  ->  IO (String)
valueSliderLabel = valuatorLabel
valueSliderCopyLabel :: ValueSlider a  -> String ->  IO (())
valueSliderCopyLabel = valuatorCopyLabel
valueSliderSetLabel :: ValueSlider a  -> String ->  IO (())
valueSliderSetLabel = valuatorSetLabel
valueSliderLabeltype :: ValueSlider a  ->  IO (Labeltype)
valueSliderLabeltype = valuatorLabeltype
valueSliderSetLabeltype :: ValueSlider a  -> Labeltype ->  IO (())
valueSliderSetLabeltype = valuatorSetLabeltype
valueSliderLabelcolor :: ValueSlider a  ->  IO (Color)
valueSliderLabelcolor = valuatorLabelcolor
valueSliderSetLabelcolor :: ValueSlider a  -> Color ->  IO (())
valueSliderSetLabelcolor = valuatorSetLabelcolor
valueSliderLabelfont :: ValueSlider a  ->  IO (Font)
valueSliderLabelfont = valuatorLabelfont
valueSliderSetLabelfont :: ValueSlider a  -> Font ->  IO (())
valueSliderSetLabelfont = valuatorSetLabelfont
valueSliderLabelsize :: ValueSlider a  ->  IO (FontSize)
valueSliderLabelsize = valuatorLabelsize
valueSliderSetLabelsize :: ValueSlider a  -> FontSize ->  IO (())
valueSliderSetLabelsize = valuatorSetLabelsize
valueSliderImage :: ValueSlider a  ->  IO (Image ())
valueSliderImage = valuatorImage
valueSliderSetImage :: ValueSlider a  -> Image b ->  IO (())
valueSliderSetImage = valuatorSetImage
valueSliderDeimage :: ValueSlider a  ->  IO (Image ())
valueSliderDeimage = valuatorDeimage
valueSliderSetDeimage :: ValueSlider a  -> Image b ->  IO (())
valueSliderSetDeimage = valuatorSetDeimage
valueSliderTooltip :: ValueSlider a  ->  IO (String)
valueSliderTooltip = valuatorTooltip
valueSliderCopyTooltip :: ValueSlider a  -> String ->  IO (())
valueSliderCopyTooltip = valuatorCopyTooltip
valueSliderSetTooltip :: ValueSlider a  -> String ->  IO (())
valueSliderSetTooltip = valuatorSetTooltip
valueSliderWhen :: ValueSlider a  ->  IO (When)
valueSliderWhen = valuatorWhen
valueSliderSetWhen :: ValueSlider a  -> Word8 ->  IO (())
valueSliderSetWhen = valuatorSetWhen
valueSliderVisible :: ValueSlider a  ->  IO (Int)
valueSliderVisible = valuatorVisible
valueSliderVisibleR :: ValueSlider a  ->  IO (Int)
valueSliderVisibleR = valuatorVisibleR
valueSliderShow :: ValueSlider a  ->  IO (())
valueSliderShow = valuatorShow
valueSliderHide :: ValueSlider a  ->  IO (())
valueSliderHide = valuatorHide
valueSliderSetVisible :: ValueSlider a  ->  IO (())
valueSliderSetVisible = valuatorSetVisible
valueSliderClearVisible :: ValueSlider a  ->  IO (())
valueSliderClearVisible = valuatorClearVisible
valueSliderActive :: ValueSlider a  ->  IO (Int)
valueSliderActive = valuatorActive
valueSliderActiveR :: ValueSlider a  ->  IO (Int)
valueSliderActiveR = valuatorActiveR
valueSliderActivate :: ValueSlider a  ->  IO (())
valueSliderActivate = valuatorActivate
valueSliderDeactivate :: ValueSlider a  ->  IO (())
valueSliderDeactivate = valuatorDeactivate
valueSliderOutput :: ValueSlider a  ->  IO (Int)
valueSliderOutput = valuatorOutput
valueSliderSetOutput :: ValueSlider a  ->  IO (())
valueSliderSetOutput = valuatorSetOutput
valueSliderClearOutput :: ValueSlider a  ->  IO (())
valueSliderClearOutput = valuatorClearOutput
valueSliderTakesevents :: ValueSlider a  ->  IO (Int)
valueSliderTakesevents = valuatorTakesevents
valueSliderSetChanged :: ValueSlider a  ->  IO (())
valueSliderSetChanged = valuatorSetChanged
valueSliderClearChanged :: ValueSlider a  ->  IO (())
valueSliderClearChanged = valuatorClearChanged
valueSliderTakeFocus :: ValueSlider a  ->  IO (Int)
valueSliderTakeFocus = valuatorTakeFocus
valueSliderSetVisibleFocus :: ValueSlider a  ->  IO (())
valueSliderSetVisibleFocus = valuatorSetVisibleFocus
valueSliderClearVisibleFocus :: ValueSlider a  ->  IO (())
valueSliderClearVisibleFocus = valuatorClearVisibleFocus
valueSliderModifyVisibleFocus :: ValueSlider a  -> Int ->  IO (())
valueSliderModifyVisibleFocus = valuatorModifyVisibleFocus
valueSliderVisibleFocus :: ValueSlider a  ->  IO (Int)
valueSliderVisibleFocus = valuatorVisibleFocus
valueSliderContains :: ValueSlider a  -> ValueSlider a  ->  IO (Int)
valueSliderContains = valuatorContains
valueSliderInside :: ValueSlider a  -> ValueSlider a  ->  IO (Int)
valueSliderInside = valuatorInside
valueSliderRedraw :: ValueSlider a  ->  IO (())
valueSliderRedraw = valuatorRedraw
valueSliderRedrawLabel :: ValueSlider a  ->  IO (())
valueSliderRedrawLabel = valuatorRedrawLabel
valueSliderDamage :: ValueSlider a  ->  IO (Word8)
valueSliderDamage = valuatorDamage
valueSliderClearDamageWithBitmask :: ValueSlider a  -> Word8 ->  IO (())
valueSliderClearDamageWithBitmask = valuatorClearDamageWithBitmask
valueSliderClearDamage :: ValueSlider a  ->  IO (())
valueSliderClearDamage = valuatorClearDamage
valueSliderDamageWithText :: ValueSlider a  -> Word8 ->  IO (())
valueSliderDamageWithText = valuatorDamageWithText
valueSliderMeasureLabel :: ValueSlider a  -> IO (Size)
valueSliderMeasureLabel = valuatorMeasureLabel
valueSliderWindow :: ValueSlider a  ->  IO (Window ())
valueSliderWindow = valuatorWindow
valueSliderTopWindow :: ValueSlider a  ->  IO (Window ())
valueSliderTopWindow = valuatorTopWindow
valueSliderTopWindowOffset :: ValueSlider a -> IO (Position)
valueSliderTopWindowOffset = valuatorTopWindowOffset
valueSliderAsGlWindow :: ValueSlider a  ->  IO (GlWindow ())
valueSliderAsGlWindow =  valuatorAsGlWindow
valueSliderResize :: ValueSlider a  -> Rectangle -> IO (())
valueSliderResize = valuatorResize
valueSliderSetCallback :: ValueSlider a -> (ValueSlider b -> IO ()) -> IO (())
valueSliderSetCallback = valuatorSetCallback
valueSliderBounds :: ValueSlider a  -> Double -> Double ->  IO (())
valueSliderBounds = valuatorBounds
valueSliderMinimum :: ValueSlider a  ->  IO (Double)
valueSliderMinimum = valuatorMinimum
valueSliderSetMinimum :: ValueSlider a  -> Double ->  IO (())
valueSliderSetMinimum = valuatorSetMinimum
valueSliderMaximum :: ValueSlider a  ->  IO (Double)
valueSliderMaximum = valuatorMaximum
valueSliderSetMaximum :: ValueSlider a  -> Double ->  IO (())
valueSliderSetMaximum = valuatorSetMaximum
valueSliderRange :: ValueSlider a  -> Double -> Double ->  IO (())
valueSliderRange = valuatorRange
valueSliderSetStep :: ValueSlider a -> Rational -> IO ()
valueSliderSetStep = valuatorSetStep
valueSliderStep :: ValueSlider a  ->  IO (Rational)
valueSliderStep = valuatorStep
valueSliderPrecision :: ValueSlider a  -> Int ->  IO (())
valueSliderPrecision = valuatorPrecision
valueSliderValue :: ValueSlider a  ->  IO (Double)
valueSliderValue = valuatorValue
valueSliderSetValue :: ValueSlider a  -> Double ->  IO (Int)
valueSliderSetValue = valuatorSetValue
valueSliderFormat :: ValueSlider a  -> String ->  IO (Int)
valueSliderFormat = valuatorFormat
valueSliderRound :: ValueSlider a  -> Double ->  IO (Double)
valueSliderRound = valuatorRound
valueSliderClamp :: ValueSlider a  -> Double ->  IO (Double)
valueSliderClamp = valuatorClamp
valueSliderIncrement :: ValueSlider a  -> Double -> Int ->  IO (Double)
valueSliderIncrement = valuatorIncrement
valueSliderDrawBox :: ValueSlider a -> IO ()
valueSliderDrawBox = valuatorDrawBox
valueSliderDrawBoxWithBoxtype :: ValueSlider a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
valueSliderDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
valueSliderDrawBackdrop :: ValueSlider a -> IO ()
valueSliderDrawBackdrop = valuatorDrawBackdrop
valueSliderDrawFocus :: ValueSlider a -> Maybe (Boxtype, Rectangle) -> IO ()
valueSliderDrawFocus = valuatorDrawFocus
{#fun Fl_Value_Slider_handle as valueSliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
valueSliderHandle :: ValueSlider a -> Event -> IO Int
valueSliderHandle valueSlider event = withObject valueSlider (\p -> valueSliderHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Value_Slider_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
valueSliderTextfont :: ValueSlider a  ->  IO (Font)
valueSliderTextfont value_slider = withObject value_slider $ \value_sliderPtr -> textfont' value_sliderPtr
{# fun unsafe Fl_Value_Slider_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
valueSliderSetTextfont :: ValueSlider a  -> Font ->  IO ()
valueSliderSetTextfont value_slider s = withObject value_slider $ \value_sliderPtr -> setTextfont' value_sliderPtr s
{# fun unsafe Fl_Value_Slider_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
valueSliderTextsize :: ValueSlider a  ->  IO (FontSize)
valueSliderTextsize value_slider = withObject value_slider $ \value_sliderPtr -> textsize' value_sliderPtr >>= return . FontSize
{# fun unsafe Fl_Value_Slider_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
valueSliderSetTextsize :: ValueSlider a  -> FontSize ->  IO ()
valueSliderSetTextsize value_slider (FontSize s) = withObject value_slider $ \value_sliderPtr -> setTextsize' value_sliderPtr s
{# fun unsafe Fl_Value_Slider_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
valueSliderTextcolor :: ValueSlider a  ->  IO (Color)
valueSliderTextcolor value_slider = withObject value_slider $ \value_sliderPtr -> textcolor' value_sliderPtr
{# fun unsafe Fl_Value_Slider_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
valueSliderSetTextcolor :: ValueSlider a  -> Color ->  IO ()
valueSliderSetTextcolor value_slider s = withObject value_slider $ \value_sliderPtr -> setTextcolor' value_sliderPtr s
