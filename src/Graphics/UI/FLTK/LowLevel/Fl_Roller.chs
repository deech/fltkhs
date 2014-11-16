{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Roller
    (
     -- * Constructor
     rollerNew,
     rollerDestroy,
     -- * Fl_Roller specific
     rollerParent,
     rollerSetParent,
     rollerType_,
     rollerSetType,
     rollerDrawLabel,
     rollerX,
     rollerY,
     rollerW,
     rollerH,
     rollerSetAlign,
     rollerAlign,
     rollerBox,
     rollerSetBox,
     rollerColor,
     rollerSetColor,
     rollerSetColorWithBgSel,
     rollerSelectionColor,
     rollerSetSelectionColor,
     rollerLabel,
     rollerCopyLabel,
     rollerSetLabel,
     rollerLabeltype,
     rollerSetLabeltype,
     rollerLabelcolor,
     rollerSetLabelcolor,
     rollerLabelfont,
     rollerSetLabelfont,
     rollerLabelsize,
     rollerSetLabelsize,
     rollerImage,
     rollerSetImage,
     rollerDeimage,
     rollerSetDeimage,
     rollerTooltip,
     rollerCopyTooltip,
     rollerSetTooltip,
     rollerWhen,
     rollerSetWhen,
     rollerVisible,
     rollerVisibleR,
     rollerShowSuper,
     rollerShow,
     rollerHideSuper,
     rollerHide,
     rollerSetVisible,
     rollerClearVisible,
     rollerActive,
     rollerActiveR,
     rollerActivate,
     rollerDeactivate,
     rollerOutput,
     rollerSetOutput,
     rollerClearOutput,
     rollerTakesevents,
     rollerSetChanged,
     rollerClearChanged,
     rollerTakeFocus,
     rollerSetVisibleFocus,
     rollerClearVisibleFocus,
     rollerModifyVisibleFocus,
     rollerVisibleFocus,
     rollerContains,
     rollerInside,
     rollerRedraw,
     rollerRedrawLabel,
     rollerDamage,
     rollerClearDamageWithBitmask,
     rollerClearDamage,
     rollerDamageWithText,
     rollerMeasureLabel,
     rollerWindow,
     rollerTopWindow,
     rollerTopWindowOffset,
     rollerAsGlWindowSuper,
     rollerAsGlWindow,
     rollerResizeSuper,
     rollerResize,
     rollerSetCallback,
     rollerDrawBox,
     rollerDrawBoxWithBoxtype,
     rollerDrawBackdrop,
     rollerDrawFocus,
     rollerBounds,
     rollerMinimum,
     rollerSetMinimum,
     rollerMaximum,
     rollerSetMaximum,
     rollerRange,
     rollerSetStep,
     rollerStep,
     rollerPrecision,
     rollerValue,
     rollerSetValue,
     rollerFormat,
     rollerRound,
     rollerClamp,
     rollerIncrement,
     rollerHandle
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_RollerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Roller_New as rollerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Roller_New_WithLabel as rollerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
rollerNew :: Rectangle -> Maybe String -> IO (Roller ())
rollerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> rollerNew' x_pos y_pos width height >>=
                             toObject
        Just l -> rollerNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Roller_Destroy as rollerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
rollerDestroy :: Roller a -> IO ()
rollerDestroy win = swapObject win $ \winPtr -> do
                                        rollerDestroy' winPtr
                                        return nullPtr

rollerParent :: Roller a -> IO (Group ())
rollerParent = valuatorParent
rollerSetParent :: Roller a -> Group b -> IO ()
rollerSetParent = valuatorSetParent
rollerType_ :: Roller a  ->  IO (Word8)
rollerType_ = valuatorType_
rollerSetType :: Roller a  -> Word8 ->  IO (())
rollerSetType = valuatorSetType
rollerDrawLabel :: Roller a  -> Maybe (Rectangle,AlignType)->  IO (())
rollerDrawLabel = valuatorDrawLabel
rollerX :: Roller a  ->  IO (Int)
rollerX = valuatorX
rollerY :: Roller a  ->  IO (Int)
rollerY = valuatorY
rollerW :: Roller a  ->  IO (Int)
rollerW = valuatorW
rollerH :: Roller a  ->  IO (Int)
rollerH = valuatorH
rollerSetAlign :: Roller a  -> AlignType ->  IO (())
rollerSetAlign = valuatorSetAlign
rollerAlign :: Roller a  ->  IO (AlignType)
rollerAlign = valuatorAlign
rollerBox :: Roller a  ->  IO (Boxtype)
rollerBox = valuatorBox
rollerSetBox :: Roller a  -> Boxtype ->  IO (())
rollerSetBox = valuatorSetBox
rollerColor :: Roller a  ->  IO (Color)
rollerColor = valuatorColor
rollerSetColor :: Roller a  -> Color ->  IO (())
rollerSetColor = valuatorSetColor
rollerSetColorWithBgSel :: Roller a  -> Color -> Color ->  IO (())
rollerSetColorWithBgSel = valuatorSetColorWithBgSel
rollerSelectionColor :: Roller a  ->  IO (Color)
rollerSelectionColor = valuatorSelectionColor
rollerSetSelectionColor :: Roller a  -> Color ->  IO (())
rollerSetSelectionColor = valuatorSetSelectionColor
rollerLabel :: Roller a  ->  IO (String)
rollerLabel = valuatorLabel
rollerCopyLabel :: Roller a  -> String ->  IO (())
rollerCopyLabel = valuatorCopyLabel
rollerSetLabel :: Roller a  -> String ->  IO (())
rollerSetLabel = valuatorSetLabel
rollerLabeltype :: Roller a  ->  IO (Labeltype)
rollerLabeltype = valuatorLabeltype
rollerSetLabeltype :: Roller a  -> Labeltype ->  IO (())
rollerSetLabeltype = valuatorSetLabeltype
rollerLabelcolor :: Roller a  ->  IO (Color)
rollerLabelcolor = valuatorLabelcolor
rollerSetLabelcolor :: Roller a  -> Color ->  IO (())
rollerSetLabelcolor = valuatorSetLabelcolor
rollerLabelfont :: Roller a  ->  IO (Font)
rollerLabelfont = valuatorLabelfont
rollerSetLabelfont :: Roller a  -> Font ->  IO (())
rollerSetLabelfont = valuatorSetLabelfont
rollerLabelsize :: Roller a  ->  IO (FontSize)
rollerLabelsize = valuatorLabelsize
rollerSetLabelsize :: Roller a  -> FontSize ->  IO (())
rollerSetLabelsize = valuatorSetLabelsize
rollerImage :: Roller a  ->  IO (Image ())
rollerImage = valuatorImage
rollerSetImage :: Roller a  -> Image b ->  IO (())
rollerSetImage = valuatorSetImage
rollerDeimage :: Roller a  ->  IO (Image ())
rollerDeimage = valuatorDeimage
rollerSetDeimage :: Roller a  -> Image b ->  IO (())
rollerSetDeimage = valuatorSetDeimage
rollerTooltip :: Roller a  ->  IO (String)
rollerTooltip = valuatorTooltip
rollerCopyTooltip :: Roller a  -> String ->  IO (())
rollerCopyTooltip = valuatorCopyTooltip
rollerSetTooltip :: Roller a  -> String ->  IO (())
rollerSetTooltip = valuatorSetTooltip
rollerWhen :: Roller a  ->  IO (When)
rollerWhen = valuatorWhen
rollerSetWhen :: Roller a  -> Word8 ->  IO (())
rollerSetWhen = valuatorSetWhen
rollerVisible :: Roller a  ->  IO (Int)
rollerVisible = valuatorVisible
rollerVisibleR :: Roller a  ->  IO (Int)
rollerVisibleR = valuatorVisibleR
rollerShowSuper :: Roller a  ->  IO (())
rollerShowSuper = valuatorShowSuper
rollerShow :: Roller a  ->  IO (())
rollerShow = valuatorShow
rollerHideSuper :: Roller a  ->  IO (())
rollerHideSuper = valuatorHideSuper
rollerHide :: Roller a  ->  IO (())
rollerHide = valuatorHide
rollerSetVisible :: Roller a  ->  IO (())
rollerSetVisible = valuatorSetVisible
rollerClearVisible :: Roller a  ->  IO (())
rollerClearVisible = valuatorClearVisible
rollerActive :: Roller a  ->  IO (Int)
rollerActive = valuatorActive
rollerActiveR :: Roller a  ->  IO (Int)
rollerActiveR = valuatorActiveR
rollerActivate :: Roller a  ->  IO (())
rollerActivate = valuatorActivate
rollerDeactivate :: Roller a  ->  IO (())
rollerDeactivate = valuatorDeactivate
rollerOutput :: Roller a  ->  IO (Int)
rollerOutput = valuatorOutput
rollerSetOutput :: Roller a  ->  IO (())
rollerSetOutput = valuatorSetOutput
rollerClearOutput :: Roller a  ->  IO (())
rollerClearOutput = valuatorClearOutput
rollerTakesevents :: Roller a  ->  IO (Int)
rollerTakesevents = valuatorTakesevents
rollerSetChanged :: Roller a  ->  IO (())
rollerSetChanged = valuatorSetChanged
rollerClearChanged :: Roller a  ->  IO (())
rollerClearChanged = valuatorClearChanged
rollerTakeFocus :: Roller a  ->  IO (Int)
rollerTakeFocus = valuatorTakeFocus
rollerSetVisibleFocus :: Roller a  ->  IO (())
rollerSetVisibleFocus = valuatorSetVisibleFocus
rollerClearVisibleFocus :: Roller a  ->  IO (())
rollerClearVisibleFocus = valuatorClearVisibleFocus
rollerModifyVisibleFocus :: Roller a  -> Int ->  IO (())
rollerModifyVisibleFocus = valuatorModifyVisibleFocus
rollerVisibleFocus :: Roller a  ->  IO (Int)
rollerVisibleFocus = valuatorVisibleFocus
rollerContains :: Roller a  -> Roller a  ->  IO (Int)
rollerContains = valuatorContains
rollerInside :: Roller a  -> Roller a  ->  IO (Int)
rollerInside = valuatorInside
rollerRedraw :: Roller a  ->  IO (())
rollerRedraw = valuatorRedraw
rollerRedrawLabel :: Roller a  ->  IO (())
rollerRedrawLabel = valuatorRedrawLabel
rollerDamage :: Roller a  ->  IO (Word8)
rollerDamage = valuatorDamage
rollerClearDamageWithBitmask :: Roller a  -> Word8 ->  IO (())
rollerClearDamageWithBitmask = valuatorClearDamageWithBitmask
rollerClearDamage :: Roller a  ->  IO (())
rollerClearDamage = valuatorClearDamage
rollerDamageWithText :: Roller a  -> Word8 ->  IO (())
rollerDamageWithText = valuatorDamageWithText
rollerMeasureLabel :: Roller a  -> IO (Size)
rollerMeasureLabel = valuatorMeasureLabel
rollerWindow :: Roller a  ->  IO (Window ())
rollerWindow = valuatorWindow
rollerTopWindow :: Roller a  ->  IO (Window ())
rollerTopWindow = valuatorTopWindow
rollerTopWindowOffset :: Roller a -> IO (Position)
rollerTopWindowOffset = valuatorTopWindowOffset
rollerAsGlWindowSuper :: Roller a  ->  IO (GlWindow ())
rollerAsGlWindowSuper = valuatorAsGlWindowSuper
rollerAsGlWindow :: Roller a  ->  IO (GlWindow ())
rollerAsGlWindow =  valuatorAsGlWindow
rollerResizeSuper :: Roller a  -> Rectangle ->  IO (())
rollerResizeSuper = valuatorResizeSuper
rollerResize :: Roller a  -> Rectangle -> IO (())
rollerResize = valuatorResize
rollerSetCallback :: Roller a -> (Roller b -> IO ()) -> IO (())
rollerSetCallback = valuatorSetCallback
rollerBounds :: Roller a  -> Double -> Double ->  IO (())
rollerBounds = valuatorBounds
rollerMinimum :: Roller a  ->  IO (Double)
rollerMinimum = valuatorMinimum
rollerSetMinimum :: Roller a  -> Double ->  IO (())
rollerSetMinimum = valuatorSetMinimum
rollerMaximum :: Roller a  ->  IO (Double)
rollerMaximum = valuatorMaximum
rollerSetMaximum :: Roller a  -> Double ->  IO (())
rollerSetMaximum = valuatorSetMaximum
rollerRange :: Roller a  -> Double -> Double ->  IO (())
rollerRange = valuatorRange
rollerSetStep :: Roller a -> Rational -> IO ()
rollerSetStep = valuatorSetStep
rollerStep :: Roller a  ->  IO (Rational)
rollerStep = valuatorStep
rollerPrecision :: Roller a  -> Int ->  IO (())
rollerPrecision = valuatorPrecision
rollerValue :: Roller a  ->  IO (Double)
rollerValue = valuatorValue
rollerSetValue :: Roller a  -> Double ->  IO (Int)
rollerSetValue = valuatorSetValue
rollerFormat :: Roller a  -> String ->  IO (Int)
rollerFormat = valuatorFormat
rollerRound :: Roller a  -> Double ->  IO (Double)
rollerRound = valuatorRound
rollerClamp :: Roller a  -> Double ->  IO (Double)
rollerClamp = valuatorClamp
rollerIncrement :: Roller a  -> Double -> Int ->  IO (Double)
rollerIncrement = valuatorIncrement
rollerDrawBox :: Roller a -> IO ()
rollerDrawBox = valuatorDrawBox
rollerDrawBoxWithBoxtype :: Roller a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
rollerDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
rollerDrawBackdrop :: Roller a -> IO ()
rollerDrawBackdrop = valuatorDrawBackdrop
rollerDrawFocus :: Roller a -> Maybe (Boxtype, Rectangle) -> IO ()
rollerDrawFocus = valuatorDrawFocus
{#fun Fl_Roller_handle as rollerHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
rollerHandle :: Roller a -> Event -> IO Int
rollerHandle roller event = withObject roller (\p -> rollerHandle' p (fromIntegral . fromEnum $ event))