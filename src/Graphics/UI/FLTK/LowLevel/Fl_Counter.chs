{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Counter
    (
     -- * Constructor
     counterNew,
     counterDestroy,
     -- * Fl_Counter specific
     counterParent,
     counterSetParent,
     counterType_,
     counterSetType,
     counterDrawLabel,
     counterX,
     counterY,
     counterW,
     counterH,
     counterSetAlign,
     counterAlign,
     counterBox,
     counterSetBox,
     counterColor,
     counterSetColor,
     counterSetColorWithBgSel,
     counterSelectionColor,
     counterSetSelectionColor,
     counterLabel,
     counterCopyLabel,
     counterSetLabel,
     counterLabeltype,
     counterSetLabeltype,
     counterLabelcolor,
     counterSetLabelcolor,
     counterLabelfont,
     counterSetLabelfont,
     counterLabelsize,
     counterSetLabelsize,
     counterImage,
     counterSetImage,
     counterDeimage,
     counterSetDeimage,
     counterTooltip,
     counterCopyTooltip,
     counterSetTooltip,
     counterWhen,
     counterSetWhen,
     counterVisible,
     counterVisibleR,
     counterShowSuper,
     counterShow,
     counterHideSuper,
     counterHide,
     counterSetVisible,
     counterClearVisible,
     counterActive,
     counterActiveR,
     counterActivate,
     counterDeactivate,
     counterOutput,
     counterSetOutput,
     counterClearOutput,
     counterTakesevents,
     counterSetChanged,
     counterClearChanged,
     counterTakeFocus,
     counterSetVisibleFocus,
     counterClearVisibleFocus,
     counterModifyVisibleFocus,
     counterVisibleFocus,
     counterContains,
     counterInside,
     counterRedraw,
     counterRedrawLabel,
     counterDamage,
     counterClearDamageWithBitmask,
     counterClearDamage,
     counterDamageWithText,
     counterMeasureLabel,
     counterWindow,
     counterTopWindow,
     counterTopWindowOffset,
     counterAsGlWindowSuper,
     counterAsGlWindow,
     counterResizeSuper,
     counterResize,
     counterSetCallback,
     counterDrawBox,
     counterDrawBoxWithBoxtype,
     counterDrawBackdrop,
     counterDrawFocus,
     counterBounds,
     counterMinimum,
     counterSetMinimum,
     counterMaximum,
     counterSetMaximum,
     counterRange,
     counterSetStep,
     counterStep,
     counterPrecision,
     counterValue,
     counterSetValue,
     counterFormat,
     counterRound,
     counterClamp,
     counterIncrement,
     counterHandle,
     counterLstep,
     counterSetTextfont,
     counterTextfont,
     counterSetTextsize,
     counterTextsize,
     counterSetTextcolor,
     counterTextcolor
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_CounterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Counter_New as counterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Counter_New_WithLabel as counterNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
counterNew :: Rectangle -> Maybe String -> IO (Counter ())
counterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> counterNew' x_pos y_pos width height >>=
                             toObject
        Just l -> counterNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Counter_Destroy as counterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
counterDestroy :: Counter a -> IO ()
counterDestroy win = swapObject win $ \winPtr -> do
                                        counterDestroy' winPtr
                                        return nullPtr

counterParent :: Counter a -> IO (Group ())
counterParent = valuatorParent
counterSetParent :: Counter a -> Group b -> IO ()
counterSetParent = valuatorSetParent
counterType_ :: Counter a  ->  IO (Word8)
counterType_ = valuatorType_
counterSetType :: Counter a  -> Word8 ->  IO (())
counterSetType = valuatorSetType
counterDrawLabel :: Counter a  -> Maybe (Rectangle,AlignType)->  IO (())
counterDrawLabel = valuatorDrawLabel
counterX :: Counter a  ->  IO (Int)
counterX = valuatorX
counterY :: Counter a  ->  IO (Int)
counterY = valuatorY
counterW :: Counter a  ->  IO (Int)
counterW = valuatorW
counterH :: Counter a  ->  IO (Int)
counterH = valuatorH
counterSetAlign :: Counter a  -> AlignType ->  IO (())
counterSetAlign = valuatorSetAlign
counterAlign :: Counter a  ->  IO (AlignType)
counterAlign = valuatorAlign
counterBox :: Counter a  ->  IO (Boxtype)
counterBox = valuatorBox
counterSetBox :: Counter a  -> Boxtype ->  IO (())
counterSetBox = valuatorSetBox
counterColor :: Counter a  ->  IO (Color)
counterColor = valuatorColor
counterSetColor :: Counter a  -> Color ->  IO (())
counterSetColor = valuatorSetColor
counterSetColorWithBgSel :: Counter a  -> Color -> Color ->  IO (())
counterSetColorWithBgSel = valuatorSetColorWithBgSel
counterSelectionColor :: Counter a  ->  IO (Color)
counterSelectionColor = valuatorSelectionColor
counterSetSelectionColor :: Counter a  -> Color ->  IO (())
counterSetSelectionColor = valuatorSetSelectionColor
counterLabel :: Counter a  ->  IO (String)
counterLabel = valuatorLabel
counterCopyLabel :: Counter a  -> String ->  IO (())
counterCopyLabel = valuatorCopyLabel
counterSetLabel :: Counter a  -> String ->  IO (())
counterSetLabel = valuatorSetLabel
counterLabeltype :: Counter a  ->  IO (Labeltype)
counterLabeltype = valuatorLabeltype
counterSetLabeltype :: Counter a  -> Labeltype ->  IO (())
counterSetLabeltype = valuatorSetLabeltype
counterLabelcolor :: Counter a  ->  IO (Color)
counterLabelcolor = valuatorLabelcolor
counterSetLabelcolor :: Counter a  -> Color ->  IO (())
counterSetLabelcolor = valuatorSetLabelcolor
counterLabelfont :: Counter a  ->  IO (Font)
counterLabelfont = valuatorLabelfont
counterSetLabelfont :: Counter a  -> Font ->  IO (())
counterSetLabelfont = valuatorSetLabelfont
counterLabelsize :: Counter a  ->  IO (FontSize)
counterLabelsize = valuatorLabelsize
counterSetLabelsize :: Counter a  -> FontSize ->  IO (())
counterSetLabelsize = valuatorSetLabelsize
counterImage :: Counter a  ->  IO (Image ())
counterImage = valuatorImage
counterSetImage :: Counter a  -> Image b ->  IO (())
counterSetImage = valuatorSetImage
counterDeimage :: Counter a  ->  IO (Image ())
counterDeimage = valuatorDeimage
counterSetDeimage :: Counter a  -> Image b ->  IO (())
counterSetDeimage = valuatorSetDeimage
counterTooltip :: Counter a  ->  IO (String)
counterTooltip = valuatorTooltip
counterCopyTooltip :: Counter a  -> String ->  IO (())
counterCopyTooltip = valuatorCopyTooltip
counterSetTooltip :: Counter a  -> String ->  IO (())
counterSetTooltip = valuatorSetTooltip
counterWhen :: Counter a  ->  IO (When)
counterWhen = valuatorWhen
counterSetWhen :: Counter a  -> Word8 ->  IO (())
counterSetWhen = valuatorSetWhen
counterVisible :: Counter a  ->  IO (Int)
counterVisible = valuatorVisible
counterVisibleR :: Counter a  ->  IO (Int)
counterVisibleR = valuatorVisibleR
counterShowSuper :: Counter a  ->  IO (())
counterShowSuper = valuatorShowSuper
counterShow :: Counter a  ->  IO (())
counterShow = valuatorShow
counterHideSuper :: Counter a  ->  IO (())
counterHideSuper = valuatorHideSuper
counterHide :: Counter a  ->  IO (())
counterHide = valuatorHide
counterSetVisible :: Counter a  ->  IO (())
counterSetVisible = valuatorSetVisible
counterClearVisible :: Counter a  ->  IO (())
counterClearVisible = valuatorClearVisible
counterActive :: Counter a  ->  IO (Int)
counterActive = valuatorActive
counterActiveR :: Counter a  ->  IO (Int)
counterActiveR = valuatorActiveR
counterActivate :: Counter a  ->  IO (())
counterActivate = valuatorActivate
counterDeactivate :: Counter a  ->  IO (())
counterDeactivate = valuatorDeactivate
counterOutput :: Counter a  ->  IO (Int)
counterOutput = valuatorOutput
counterSetOutput :: Counter a  ->  IO (())
counterSetOutput = valuatorSetOutput
counterClearOutput :: Counter a  ->  IO (())
counterClearOutput = valuatorClearOutput
counterTakesevents :: Counter a  ->  IO (Int)
counterTakesevents = valuatorTakesevents
counterSetChanged :: Counter a  ->  IO (())
counterSetChanged = valuatorSetChanged
counterClearChanged :: Counter a  ->  IO (())
counterClearChanged = valuatorClearChanged
counterTakeFocus :: Counter a  ->  IO (Int)
counterTakeFocus = valuatorTakeFocus
counterSetVisibleFocus :: Counter a  ->  IO (())
counterSetVisibleFocus = valuatorSetVisibleFocus
counterClearVisibleFocus :: Counter a  ->  IO (())
counterClearVisibleFocus = valuatorClearVisibleFocus
counterModifyVisibleFocus :: Counter a  -> Int ->  IO (())
counterModifyVisibleFocus = valuatorModifyVisibleFocus
counterVisibleFocus :: Counter a  ->  IO (Int)
counterVisibleFocus = valuatorVisibleFocus
counterContains :: Counter a  -> Counter a  ->  IO (Int)
counterContains = valuatorContains
counterInside :: Counter a  -> Counter a  ->  IO (Int)
counterInside = valuatorInside
counterRedraw :: Counter a  ->  IO (())
counterRedraw = valuatorRedraw
counterRedrawLabel :: Counter a  ->  IO (())
counterRedrawLabel = valuatorRedrawLabel
counterDamage :: Counter a  ->  IO (Word8)
counterDamage = valuatorDamage
counterClearDamageWithBitmask :: Counter a  -> Word8 ->  IO (())
counterClearDamageWithBitmask = valuatorClearDamageWithBitmask
counterClearDamage :: Counter a  ->  IO (())
counterClearDamage = valuatorClearDamage
counterDamageWithText :: Counter a  -> Word8 ->  IO (())
counterDamageWithText = valuatorDamageWithText
counterMeasureLabel :: Counter a  -> IO (Size)
counterMeasureLabel = valuatorMeasureLabel
counterWindow :: Counter a  ->  IO (Window ())
counterWindow = valuatorWindow
counterTopWindow :: Counter a  ->  IO (Window ())
counterTopWindow = valuatorTopWindow
counterTopWindowOffset :: Counter a -> IO (Position)
counterTopWindowOffset = valuatorTopWindowOffset
counterAsGlWindowSuper :: Counter a  ->  IO (GlWindow ())
counterAsGlWindowSuper = valuatorAsGlWindowSuper
counterAsGlWindow :: Counter a  ->  IO (GlWindow ())
counterAsGlWindow =  valuatorAsGlWindow
counterResizeSuper :: Counter a  -> Rectangle ->  IO (())
counterResizeSuper = valuatorResizeSuper
counterResize :: Counter a  -> Rectangle -> IO (())
counterResize = valuatorResize
counterSetCallback :: Counter a -> (Counter b -> IO ()) -> IO (())
counterSetCallback = valuatorSetCallback
counterBounds :: Counter a  -> Double -> Double ->  IO (())
counterBounds = valuatorBounds
counterMinimum :: Counter a  ->  IO (Double)
counterMinimum = valuatorMinimum
counterSetMinimum :: Counter a  -> Double ->  IO (())
counterSetMinimum = valuatorSetMinimum
counterMaximum :: Counter a  ->  IO (Double)
counterMaximum = valuatorMaximum
counterSetMaximum :: Counter a  -> Double ->  IO (())
counterSetMaximum = valuatorSetMaximum
counterRange :: Counter a  -> Double -> Double ->  IO (())
counterRange = valuatorRange
counterSetStep :: Counter a -> Rational -> IO ()
counterSetStep = valuatorSetStep
counterStep :: Counter a  ->  IO (Rational)
counterStep = valuatorStep
counterPrecision :: Counter a  -> Int ->  IO (())
counterPrecision = valuatorPrecision
counterValue :: Counter a  ->  IO (Double)
counterValue = valuatorValue
counterSetValue :: Counter a  -> Double ->  IO (Int)
counterSetValue = valuatorSetValue
counterFormat :: Counter a  -> String ->  IO (Int)
counterFormat = valuatorFormat
counterRound :: Counter a  -> Double ->  IO (Double)
counterRound = valuatorRound
counterClamp :: Counter a  -> Double ->  IO (Double)
counterClamp = valuatorClamp
counterIncrement :: Counter a  -> Double -> Int ->  IO (Double)
counterIncrement = valuatorIncrement
counterDrawBox :: Counter a -> IO ()
counterDrawBox = valuatorDrawBox
counterDrawBoxWithBoxtype :: Counter a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
counterDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
counterDrawBackdrop :: Counter a -> IO ()
counterDrawBackdrop = valuatorDrawBackdrop
counterDrawFocus :: Counter a -> Maybe (Boxtype, Rectangle) -> IO ()
counterDrawFocus = valuatorDrawFocus
{#fun Fl_Counter_handle as counterHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
counterHandle :: Counter a -> Event -> IO Int
counterHandle counter event = withObject counter (\p -> counterHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Counter_lstep as lstep' { id `Ptr ()',`Double' } -> `()' #}
counterLstep :: Counter a  -> Double ->  IO ()
counterLstep counter lstep = withObject counter $ \counterPtr -> lstep' counterPtr lstep
{# fun unsafe Fl_Counter_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
counterSetTextfont :: Counter a  -> Font ->  IO ()
counterSetTextfont counter text = withObject counter $ \counterPtr -> setTextfont' counterPtr text
{# fun unsafe Fl_Counter_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
counterTextfont :: Counter a  ->  IO (Font)
counterTextfont counter = withObject counter $ \counterPtr -> textfont' counterPtr
{# fun unsafe Fl_Counter_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
counterSetTextsize :: Counter a  -> FontSize ->  IO ()
counterSetTextsize counter (FontSize text) = withObject counter $ \counterPtr -> setTextsize' counterPtr text
{# fun unsafe Fl_Counter_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
counterTextsize :: Counter a  ->  IO (FontSize)
counterTextsize counter = withObject counter $ \counterPtr -> textsize' counterPtr >>= return . FontSize
{# fun unsafe Fl_Counter_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
counterSetTextcolor :: Counter a  -> Color ->  IO ()
counterSetTextcolor counter text = withObject counter $ \counterPtr -> setTextcolor' counterPtr text
{# fun unsafe Fl_Counter_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
counterTextcolor :: Counter a  ->  IO (Color)
counterTextcolor counter = withObject counter $ \counterPtr -> textcolor' counterPtr
