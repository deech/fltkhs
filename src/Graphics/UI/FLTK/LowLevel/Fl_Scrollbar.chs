{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Scrollbar
    (
     -- * Constructor
     scrollbarNew,
     scrollbarDestroy,
     -- * Fl_Scrollbar specific
     scrollbarParent,
     scrollbarSetParent,
     scrollbarType_,
     scrollbarSetType,
     scrollbarDrawLabel,
     scrollbarX,
     scrollbarY,
     scrollbarW,
     scrollbarH,
     scrollbarSetAlign,
     scrollbarAlign,
     scrollbarBox,
     scrollbarSetBox,
     scrollbarColor,
     scrollbarSetColor,
     scrollbarSetColorWithBgSel,
     scrollbarSelectionColor,
     scrollbarSetSelectionColor,
     scrollbarLabel,
     scrollbarCopyLabel,
     scrollbarSetLabel,
     scrollbarLabeltype,
     scrollbarSetLabeltype,
     scrollbarLabelcolor,
     scrollbarSetLabelcolor,
     scrollbarLabelfont,
     scrollbarSetLabelfont,
     scrollbarLabelsize,
     scrollbarSetLabelsize,
     scrollbarImage,
     scrollbarSetImage,
     scrollbarDeimage,
     scrollbarSetDeimage,
     scrollbarTooltip,
     scrollbarCopyTooltip,
     scrollbarSetTooltip,
     scrollbarWhen,
     scrollbarSetWhen,
     scrollbarVisible,
     scrollbarVisibleR,
     scrollbarShowSuper,
     scrollbarShow,
     scrollbarHideSuper,
     scrollbarHide,
     scrollbarSetVisible,
     scrollbarClearVisible,
     scrollbarActive,
     scrollbarActiveR,
     scrollbarActivate,
     scrollbarDeactivate,
     scrollbarOutput,
     scrollbarSetOutput,
     scrollbarClearOutput,
     scrollbarTakesevents,
     scrollbarSetChanged,
     scrollbarClearChanged,
     scrollbarTakeFocus,
     scrollbarSetVisibleFocus,
     scrollbarClearVisibleFocus,
     scrollbarModifyVisibleFocus,
     scrollbarVisibleFocus,
     scrollbarContains,
     scrollbarInside,
     scrollbarRedraw,
     scrollbarRedrawLabel,
     scrollbarDamage,
     scrollbarClearDamageWithBitmask,
     scrollbarClearDamage,
     scrollbarDamageWithText,
     scrollbarMeasureLabel,
     scrollbarWindow,
     scrollbarTopWindow,
     scrollbarTopWindowOffset,
     scrollbarAsGlWindowSuper,
     scrollbarAsGlWindow,
     scrollbarResizeSuper,
     scrollbarResize,
     scrollbarSetCallback,
     scrollbarDrawBox,
     scrollbarDrawBoxWithBoxtype,
     scrollbarDrawBackdrop,
     scrollbarDrawFocus,
     scrollbarBounds,
     scrollbarMinimum,
     scrollbarSetMinimum,
     scrollbarMaximum,
     scrollbarSetMaximum,
     scrollbarRange,
     scrollbarSetStep,
     scrollbarStep,
     scrollbarPrecision,
     scrollbarValue,
     scrollbarSetValue,
     scrollbarFormat,
     scrollbarRound,
     scrollbarClamp,
     scrollbarIncrement,
     scrollbarHandle,
     scrollbarScrollvalue,
     scrollbarSetSliderSize,
     scrollbarSliderSize,
     scrollbarSlider,
     scrollbarSetSlider,
     scrollbarSetLinesize,
     scrollbarLinesize
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ScrollbarC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Scrollbar_New as scrollbarNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Scrollbar_New_WithLabel as scrollbarNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
scrollbarNew :: Rectangle -> Maybe String -> IO (Scrollbar ())
scrollbarNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> scrollbarNew' x_pos y_pos width height >>=
                             toObject
        Just l -> scrollbarNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Scrollbar_Destroy as scrollbarDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
scrollbarDestroy :: Scrollbar a -> IO ()
scrollbarDestroy win = swapObject win $ \winPtr -> do
                                        scrollbarDestroy' winPtr
                                        return nullPtr

scrollbarParent :: Scrollbar a -> IO (Group ())
scrollbarParent = valuatorParent
scrollbarSetParent :: Scrollbar a -> Group b -> IO ()
scrollbarSetParent = valuatorSetParent
scrollbarType_ :: Scrollbar a  ->  IO (Word8)
scrollbarType_ = valuatorType_
scrollbarSetType :: Scrollbar a  -> Word8 ->  IO (())
scrollbarSetType = valuatorSetType
scrollbarDrawLabel :: Scrollbar a  -> Maybe (Rectangle,AlignType)->  IO (())
scrollbarDrawLabel = valuatorDrawLabel
scrollbarX :: Scrollbar a  ->  IO (Int)
scrollbarX = valuatorX
scrollbarY :: Scrollbar a  ->  IO (Int)
scrollbarY = valuatorY
scrollbarW :: Scrollbar a  ->  IO (Int)
scrollbarW = valuatorW
scrollbarH :: Scrollbar a  ->  IO (Int)
scrollbarH = valuatorH
scrollbarSetAlign :: Scrollbar a  -> AlignType ->  IO (())
scrollbarSetAlign = valuatorSetAlign
scrollbarAlign :: Scrollbar a  ->  IO (AlignType)
scrollbarAlign = valuatorAlign
scrollbarBox :: Scrollbar a  ->  IO (Boxtype)
scrollbarBox = valuatorBox
scrollbarSetBox :: Scrollbar a  -> Boxtype ->  IO (())
scrollbarSetBox = valuatorSetBox
scrollbarColor :: Scrollbar a  ->  IO (Color)
scrollbarColor = valuatorColor
scrollbarSetColor :: Scrollbar a  -> Color ->  IO (())
scrollbarSetColor = valuatorSetColor
scrollbarSetColorWithBgSel :: Scrollbar a  -> Color -> Color ->  IO (())
scrollbarSetColorWithBgSel = valuatorSetColorWithBgSel
scrollbarSelectionColor :: Scrollbar a  ->  IO (Color)
scrollbarSelectionColor = valuatorSelectionColor
scrollbarSetSelectionColor :: Scrollbar a  -> Color ->  IO (())
scrollbarSetSelectionColor = valuatorSetSelectionColor
scrollbarLabel :: Scrollbar a  ->  IO (String)
scrollbarLabel = valuatorLabel
scrollbarCopyLabel :: Scrollbar a  -> String ->  IO (())
scrollbarCopyLabel = valuatorCopyLabel
scrollbarSetLabel :: Scrollbar a  -> String ->  IO (())
scrollbarSetLabel = valuatorSetLabel
scrollbarLabeltype :: Scrollbar a  ->  IO (Labeltype)
scrollbarLabeltype = valuatorLabeltype
scrollbarSetLabeltype :: Scrollbar a  -> Labeltype ->  IO (())
scrollbarSetLabeltype = valuatorSetLabeltype
scrollbarLabelcolor :: Scrollbar a  ->  IO (Color)
scrollbarLabelcolor = valuatorLabelcolor
scrollbarSetLabelcolor :: Scrollbar a  -> Color ->  IO (())
scrollbarSetLabelcolor = valuatorSetLabelcolor
scrollbarLabelfont :: Scrollbar a  ->  IO (Font)
scrollbarLabelfont = valuatorLabelfont
scrollbarSetLabelfont :: Scrollbar a  -> Font ->  IO (())
scrollbarSetLabelfont = valuatorSetLabelfont
scrollbarLabelsize :: Scrollbar a  ->  IO (FontSize)
scrollbarLabelsize = valuatorLabelsize
scrollbarSetLabelsize :: Scrollbar a  -> FontSize ->  IO (())
scrollbarSetLabelsize = valuatorSetLabelsize
scrollbarImage :: Scrollbar a  ->  IO (Image ())
scrollbarImage = valuatorImage
scrollbarSetImage :: Scrollbar a  -> Image b ->  IO (())
scrollbarSetImage = valuatorSetImage
scrollbarDeimage :: Scrollbar a  ->  IO (Image ())
scrollbarDeimage = valuatorDeimage
scrollbarSetDeimage :: Scrollbar a  -> Image b ->  IO (())
scrollbarSetDeimage = valuatorSetDeimage
scrollbarTooltip :: Scrollbar a  ->  IO (String)
scrollbarTooltip = valuatorTooltip
scrollbarCopyTooltip :: Scrollbar a  -> String ->  IO (())
scrollbarCopyTooltip = valuatorCopyTooltip
scrollbarSetTooltip :: Scrollbar a  -> String ->  IO (())
scrollbarSetTooltip = valuatorSetTooltip
scrollbarWhen :: Scrollbar a  ->  IO (When)
scrollbarWhen = valuatorWhen
scrollbarSetWhen :: Scrollbar a  -> Word8 ->  IO (())
scrollbarSetWhen = valuatorSetWhen
scrollbarVisible :: Scrollbar a  ->  IO (Int)
scrollbarVisible = valuatorVisible
scrollbarVisibleR :: Scrollbar a  ->  IO (Int)
scrollbarVisibleR = valuatorVisibleR
scrollbarShowSuper :: Scrollbar a  ->  IO (())
scrollbarShowSuper = valuatorShowSuper
scrollbarShow :: Scrollbar a  ->  IO (())
scrollbarShow = valuatorShow
scrollbarHideSuper :: Scrollbar a  ->  IO (())
scrollbarHideSuper = valuatorHideSuper
scrollbarHide :: Scrollbar a  ->  IO (())
scrollbarHide = valuatorHide
scrollbarSetVisible :: Scrollbar a  ->  IO (())
scrollbarSetVisible = valuatorSetVisible
scrollbarClearVisible :: Scrollbar a  ->  IO (())
scrollbarClearVisible = valuatorClearVisible
scrollbarActive :: Scrollbar a  ->  IO (Int)
scrollbarActive = valuatorActive
scrollbarActiveR :: Scrollbar a  ->  IO (Int)
scrollbarActiveR = valuatorActiveR
scrollbarActivate :: Scrollbar a  ->  IO (())
scrollbarActivate = valuatorActivate
scrollbarDeactivate :: Scrollbar a  ->  IO (())
scrollbarDeactivate = valuatorDeactivate
scrollbarOutput :: Scrollbar a  ->  IO (Int)
scrollbarOutput = valuatorOutput
scrollbarSetOutput :: Scrollbar a  ->  IO (())
scrollbarSetOutput = valuatorSetOutput
scrollbarClearOutput :: Scrollbar a  ->  IO (())
scrollbarClearOutput = valuatorClearOutput
scrollbarTakesevents :: Scrollbar a  ->  IO (Int)
scrollbarTakesevents = valuatorTakesevents
scrollbarSetChanged :: Scrollbar a  ->  IO (())
scrollbarSetChanged = valuatorSetChanged
scrollbarClearChanged :: Scrollbar a  ->  IO (())
scrollbarClearChanged = valuatorClearChanged
scrollbarTakeFocus :: Scrollbar a  ->  IO (Int)
scrollbarTakeFocus = valuatorTakeFocus
scrollbarSetVisibleFocus :: Scrollbar a  ->  IO (())
scrollbarSetVisibleFocus = valuatorSetVisibleFocus
scrollbarClearVisibleFocus :: Scrollbar a  ->  IO (())
scrollbarClearVisibleFocus = valuatorClearVisibleFocus
scrollbarModifyVisibleFocus :: Scrollbar a  -> Int ->  IO (())
scrollbarModifyVisibleFocus = valuatorModifyVisibleFocus
scrollbarVisibleFocus :: Scrollbar a  ->  IO (Int)
scrollbarVisibleFocus = valuatorVisibleFocus
scrollbarContains :: Scrollbar a  -> Scrollbar a  ->  IO (Int)
scrollbarContains = valuatorContains
scrollbarInside :: Scrollbar a  -> Scrollbar a  ->  IO (Int)
scrollbarInside = valuatorInside
scrollbarRedraw :: Scrollbar a  ->  IO (())
scrollbarRedraw = valuatorRedraw
scrollbarRedrawLabel :: Scrollbar a  ->  IO (())
scrollbarRedrawLabel = valuatorRedrawLabel
scrollbarDamage :: Scrollbar a  ->  IO (Word8)
scrollbarDamage = valuatorDamage
scrollbarClearDamageWithBitmask :: Scrollbar a  -> Word8 ->  IO (())
scrollbarClearDamageWithBitmask = valuatorClearDamageWithBitmask
scrollbarClearDamage :: Scrollbar a  ->  IO (())
scrollbarClearDamage = valuatorClearDamage
scrollbarDamageWithText :: Scrollbar a  -> Word8 ->  IO (())
scrollbarDamageWithText = valuatorDamageWithText
scrollbarMeasureLabel :: Scrollbar a  -> IO (Size)
scrollbarMeasureLabel = valuatorMeasureLabel
scrollbarWindow :: Scrollbar a  ->  IO (Window ())
scrollbarWindow = valuatorWindow
scrollbarTopWindow :: Scrollbar a  ->  IO (Window ())
scrollbarTopWindow = valuatorTopWindow
scrollbarTopWindowOffset :: Scrollbar a -> IO (Position)
scrollbarTopWindowOffset = valuatorTopWindowOffset
scrollbarAsGlWindowSuper :: Scrollbar a  ->  IO (GlWindow ())
scrollbarAsGlWindowSuper = valuatorAsGlWindowSuper
scrollbarAsGlWindow :: Scrollbar a  ->  IO (GlWindow ())
scrollbarAsGlWindow =  valuatorAsGlWindow
scrollbarResizeSuper :: Scrollbar a  -> Rectangle ->  IO (())
scrollbarResizeSuper = valuatorResizeSuper
scrollbarResize :: Scrollbar a  -> Rectangle -> IO (())
scrollbarResize = valuatorResize
scrollbarSetCallback :: Scrollbar a -> (Scrollbar b -> IO ()) -> IO (())
scrollbarSetCallback = valuatorSetCallback
scrollbarBounds :: Scrollbar a  -> Double -> Double ->  IO (())
scrollbarBounds = valuatorBounds
scrollbarMinimum :: Scrollbar a  ->  IO (Double)
scrollbarMinimum = valuatorMinimum
scrollbarSetMinimum :: Scrollbar a  -> Double ->  IO (())
scrollbarSetMinimum = valuatorSetMinimum
scrollbarMaximum :: Scrollbar a  ->  IO (Double)
scrollbarMaximum = valuatorMaximum
scrollbarSetMaximum :: Scrollbar a  -> Double ->  IO (())
scrollbarSetMaximum = valuatorSetMaximum
scrollbarRange :: Scrollbar a  -> Double -> Double ->  IO (())
scrollbarRange = valuatorRange
scrollbarSetStep :: Scrollbar a -> Rational -> IO ()
scrollbarSetStep = valuatorSetStep
scrollbarStep :: Scrollbar a  ->  IO (Rational)
scrollbarStep = valuatorStep
scrollbarPrecision :: Scrollbar a  -> Int ->  IO (())
scrollbarPrecision = valuatorPrecision
scrollbarValue :: Scrollbar a  ->  IO (Double)
scrollbarValue = valuatorValue
scrollbarSetValue :: Scrollbar a  -> Double ->  IO (Int)
scrollbarSetValue = valuatorSetValue
scrollbarFormat :: Scrollbar a  -> String ->  IO (Int)
scrollbarFormat = valuatorFormat
scrollbarRound :: Scrollbar a  -> Double ->  IO (Double)
scrollbarRound = valuatorRound
scrollbarClamp :: Scrollbar a  -> Double ->  IO (Double)
scrollbarClamp = valuatorClamp
scrollbarIncrement :: Scrollbar a  -> Double -> Int ->  IO (Double)
scrollbarIncrement = valuatorIncrement
scrollbarDrawBox :: Scrollbar a -> IO ()
scrollbarDrawBox = valuatorDrawBox
scrollbarDrawBoxWithBoxtype :: Scrollbar a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
scrollbarDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
scrollbarDrawBackdrop :: Scrollbar a -> IO ()
scrollbarDrawBackdrop = valuatorDrawBackdrop
scrollbarDrawFocus :: Scrollbar a -> Maybe (Boxtype, Rectangle) -> IO ()
scrollbarDrawFocus = valuatorDrawFocus
{# fun unsafe Fl_Scrollbar_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
scrollbarScrollvalue :: Scrollbar a  -> Int -> Int -> Int -> Int ->  IO (Int)
scrollbarScrollvalue slider pos size first total = withObject slider $ \sliderPtr -> scrollvalue' sliderPtr pos size first total

{# fun unsafe Fl_Scrollbar_set_slider_size as setSliderSize' { id `Ptr ()' } -> `Float' #}
scrollbarSetSliderSize :: Scrollbar a  ->  IO (Float)
scrollbarSetSliderSize slider = withObject slider $ \sliderPtr -> setSliderSize' sliderPtr

{# fun unsafe Fl_Scrollbar_slider_size as sliderSize' { id `Ptr ()',`Double' } -> `()' #}
scrollbarSliderSize :: Scrollbar a  -> Double ->  IO ()
scrollbarSliderSize slider v = withObject slider $ \sliderPtr -> sliderSize' sliderPtr v

{# fun unsafe Fl_Scrollbar_slider as slider' { id `Ptr ()' } -> `Boxtype' cToEnum #}
scrollbarSlider :: Scrollbar a  ->  IO (Boxtype)
scrollbarSlider slider = withObject slider $ \sliderPtr -> slider' sliderPtr

{# fun unsafe Fl_Scrollbar_set_slider as setSlider' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
scrollbarSetSlider :: Scrollbar a  -> Boxtype ->  IO ()
scrollbarSetSlider slider c = withObject slider $ \sliderPtr -> setSlider' sliderPtr c

{# fun unsafe Fl_Scrollbar_set_linesize as setLinesize' { id `Ptr ()',`Int' } -> `()' #}
scrollbarSetLinesize :: Scrollbar a  -> Int ->  IO ()
scrollbarSetLinesize slider i = withObject slider $ \sliderPtr -> setLinesize' sliderPtr i

{# fun unsafe Fl_Scrollbar_linesize as linesize' { id `Ptr ()' } -> `Int' #}
scrollbarLinesize :: Scrollbar a  ->  IO (Int)
scrollbarLinesize slider = withObject slider $ \sliderPtr -> linesize' sliderPtr

{#fun Fl_Scrollbar_handle as scrollbarHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
scrollbarHandle :: Scrollbar a -> Event -> IO Int
scrollbarHandle scrollbar event = withObject scrollbar (\p -> scrollbarHandle' p (fromIntegral . fromEnum $ event))
