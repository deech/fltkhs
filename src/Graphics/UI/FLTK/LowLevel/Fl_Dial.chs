{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Dial
    (
     -- * Constructor
     dialNew,
     dialDestroy,
     -- * Fl_Dial specific
     dialParent,
     dialSetParent,
     dialType_,
     dialSetType,
     dialDrawLabel,
     dialX,
     dialY,
     dialW,
     dialH,
     dialSetAlign,
     dialAlign,
     dialBox,
     dialSetBox,
     dialColor,
     dialSetColor,
     dialSetColorWithBgSel,
     dialSelectionColor,
     dialSetSelectionColor,
     dialLabel,
     dialCopyLabel,
     dialSetLabel,
     dialLabeltype,
     dialSetLabeltype,
     dialLabelcolor,
     dialSetLabelcolor,
     dialLabelfont,
     dialSetLabelfont,
     dialLabelsize,
     dialSetLabelsize,
     dialImage,
     dialSetImage,
     dialDeimage,
     dialSetDeimage,
     dialTooltip,
     dialCopyTooltip,
     dialSetTooltip,
     dialWhen,
     dialSetWhen,
     dialVisible,
     dialVisibleR,
     dialShowSuper,
     dialShow,
     dialHideSuper,
     dialHide,
     dialSetVisible,
     dialClearVisible,
     dialActive,
     dialActiveR,
     dialActivate,
     dialDeactivate,
     dialOutput,
     dialSetOutput,
     dialClearOutput,
     dialTakesevents,
     dialSetChanged,
     dialClearChanged,
     dialTakeFocus,
     dialSetVisibleFocus,
     dialClearVisibleFocus,
     dialModifyVisibleFocus,
     dialVisibleFocus,
     dialContains,
     dialInside,
     dialRedraw,
     dialRedrawLabel,
     dialDamage,
     dialClearDamageWithBitmask,
     dialClearDamage,
     dialDamageWithText,
     dialMeasureLabel,
     dialWindow,
     dialTopWindow,
     dialTopWindowOffset,
     dialAsGlWindowSuper,
     dialAsGlWindow,
     dialResizeSuper,
     dialResize,
     dialSetCallback,
     dialDrawBox,
     dialDrawBoxWithBoxtype,
     dialDrawBackdrop,
     dialDrawFocus,
     dialBounds,
     dialMinimum,
     dialSetMinimum,
     dialMaximum,
     dialSetMaximum,
     dialRange,
     dialSetStep,
     dialStep,
     dialPrecision,
     dialValue,
     dialSetValue,
     dialFormat,
     dialRound,
     dialClamp,
     dialIncrement,
     dialHandle,
     dialSetAngle1,
     dialSetAngle2,
     dialAngle1,
     dialAngle2
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_DialC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Dial_New as dialNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Dial_New_WithLabel as dialNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
dialNew :: Rectangle -> Maybe String -> IO (Dial ())
dialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> dialNew' x_pos y_pos width height >>=
                             toObject
        Just l -> dialNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Dial_Destroy as dialDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
dialDestroy :: Dial a -> IO ()
dialDestroy win = swapObject win $ \winPtr -> do
                                        dialDestroy' winPtr
                                        return nullPtr

dialParent :: Dial a -> IO (Group ())
dialParent = valuatorParent
dialSetParent :: Dial a -> Group b -> IO ()
dialSetParent = valuatorSetParent
dialType_ :: Dial a  ->  IO (Word8)
dialType_ = valuatorType_
dialSetType :: Dial a  -> Word8 ->  IO (())
dialSetType = valuatorSetType
dialDrawLabel :: Dial a  -> Maybe (Rectangle,AlignType)->  IO (())
dialDrawLabel = valuatorDrawLabel
dialX :: Dial a  ->  IO (Int)
dialX = valuatorX
dialY :: Dial a  ->  IO (Int)
dialY = valuatorY
dialW :: Dial a  ->  IO (Int)
dialW = valuatorW
dialH :: Dial a  ->  IO (Int)
dialH = valuatorH
dialSetAlign :: Dial a  -> AlignType ->  IO (())
dialSetAlign = valuatorSetAlign
dialAlign :: Dial a  ->  IO (AlignType)
dialAlign = valuatorAlign
dialBox :: Dial a  ->  IO (Boxtype)
dialBox = valuatorBox
dialSetBox :: Dial a  -> Boxtype ->  IO (())
dialSetBox = valuatorSetBox
dialColor :: Dial a  ->  IO (Color)
dialColor = valuatorColor
dialSetColor :: Dial a  -> Color ->  IO (())
dialSetColor = valuatorSetColor
dialSetColorWithBgSel :: Dial a  -> Color -> Color ->  IO (())
dialSetColorWithBgSel = valuatorSetColorWithBgSel
dialSelectionColor :: Dial a  ->  IO (Color)
dialSelectionColor = valuatorSelectionColor
dialSetSelectionColor :: Dial a  -> Color ->  IO (())
dialSetSelectionColor = valuatorSetSelectionColor
dialLabel :: Dial a  ->  IO (String)
dialLabel = valuatorLabel
dialCopyLabel :: Dial a  -> String ->  IO (())
dialCopyLabel = valuatorCopyLabel
dialSetLabel :: Dial a  -> String ->  IO (())
dialSetLabel = valuatorSetLabel
dialLabeltype :: Dial a  ->  IO (Labeltype)
dialLabeltype = valuatorLabeltype
dialSetLabeltype :: Dial a  -> Labeltype ->  IO (())
dialSetLabeltype = valuatorSetLabeltype
dialLabelcolor :: Dial a  ->  IO (Color)
dialLabelcolor = valuatorLabelcolor
dialSetLabelcolor :: Dial a  -> Color ->  IO (())
dialSetLabelcolor = valuatorSetLabelcolor
dialLabelfont :: Dial a  ->  IO (Font)
dialLabelfont = valuatorLabelfont
dialSetLabelfont :: Dial a  -> Font ->  IO (())
dialSetLabelfont = valuatorSetLabelfont
dialLabelsize :: Dial a  ->  IO (FontSize)
dialLabelsize = valuatorLabelsize
dialSetLabelsize :: Dial a  -> FontSize ->  IO (())
dialSetLabelsize = valuatorSetLabelsize
dialImage :: Dial a  ->  IO (Image ())
dialImage = valuatorImage
dialSetImage :: Dial a  -> Image b ->  IO (())
dialSetImage = valuatorSetImage
dialDeimage :: Dial a  ->  IO (Image ())
dialDeimage = valuatorDeimage
dialSetDeimage :: Dial a  -> Image b ->  IO (())
dialSetDeimage = valuatorSetDeimage
dialTooltip :: Dial a  ->  IO (String)
dialTooltip = valuatorTooltip
dialCopyTooltip :: Dial a  -> String ->  IO (())
dialCopyTooltip = valuatorCopyTooltip
dialSetTooltip :: Dial a  -> String ->  IO (())
dialSetTooltip = valuatorSetTooltip
dialWhen :: Dial a  ->  IO (When)
dialWhen = valuatorWhen
dialSetWhen :: Dial a  -> Word8 ->  IO (())
dialSetWhen = valuatorSetWhen
dialVisible :: Dial a  ->  IO (Int)
dialVisible = valuatorVisible
dialVisibleR :: Dial a  ->  IO (Int)
dialVisibleR = valuatorVisibleR
dialShowSuper :: Dial a  ->  IO (())
dialShowSuper = valuatorShowSuper
dialShow :: Dial a  ->  IO (())
dialShow = valuatorShow
dialHideSuper :: Dial a  ->  IO (())
dialHideSuper = valuatorHideSuper
dialHide :: Dial a  ->  IO (())
dialHide = valuatorHide
dialSetVisible :: Dial a  ->  IO (())
dialSetVisible = valuatorSetVisible
dialClearVisible :: Dial a  ->  IO (())
dialClearVisible = valuatorClearVisible
dialActive :: Dial a  ->  IO (Int)
dialActive = valuatorActive
dialActiveR :: Dial a  ->  IO (Int)
dialActiveR = valuatorActiveR
dialActivate :: Dial a  ->  IO (())
dialActivate = valuatorActivate
dialDeactivate :: Dial a  ->  IO (())
dialDeactivate = valuatorDeactivate
dialOutput :: Dial a  ->  IO (Int)
dialOutput = valuatorOutput
dialSetOutput :: Dial a  ->  IO (())
dialSetOutput = valuatorSetOutput
dialClearOutput :: Dial a  ->  IO (())
dialClearOutput = valuatorClearOutput
dialTakesevents :: Dial a  ->  IO (Int)
dialTakesevents = valuatorTakesevents
dialSetChanged :: Dial a  ->  IO (())
dialSetChanged = valuatorSetChanged
dialClearChanged :: Dial a  ->  IO (())
dialClearChanged = valuatorClearChanged
dialTakeFocus :: Dial a  ->  IO (Int)
dialTakeFocus = valuatorTakeFocus
dialSetVisibleFocus :: Dial a  ->  IO (())
dialSetVisibleFocus = valuatorSetVisibleFocus
dialClearVisibleFocus :: Dial a  ->  IO (())
dialClearVisibleFocus = valuatorClearVisibleFocus
dialModifyVisibleFocus :: Dial a  -> Int ->  IO (())
dialModifyVisibleFocus = valuatorModifyVisibleFocus
dialVisibleFocus :: Dial a  ->  IO (Int)
dialVisibleFocus = valuatorVisibleFocus
dialContains :: Dial a  -> Dial a  ->  IO (Int)
dialContains = valuatorContains
dialInside :: Dial a  -> Dial a  ->  IO (Int)
dialInside = valuatorInside
dialRedraw :: Dial a  ->  IO (())
dialRedraw = valuatorRedraw
dialRedrawLabel :: Dial a  ->  IO (())
dialRedrawLabel = valuatorRedrawLabel
dialDamage :: Dial a  ->  IO (Word8)
dialDamage = valuatorDamage
dialClearDamageWithBitmask :: Dial a  -> Word8 ->  IO (())
dialClearDamageWithBitmask = valuatorClearDamageWithBitmask
dialClearDamage :: Dial a  ->  IO (())
dialClearDamage = valuatorClearDamage
dialDamageWithText :: Dial a  -> Word8 ->  IO (())
dialDamageWithText = valuatorDamageWithText
dialMeasureLabel :: Dial a  -> IO (Size)
dialMeasureLabel = valuatorMeasureLabel
dialWindow :: Dial a  ->  IO (Window ())
dialWindow = valuatorWindow
dialTopWindow :: Dial a  ->  IO (Window ())
dialTopWindow = valuatorTopWindow
dialTopWindowOffset :: Dial a -> IO (Position)
dialTopWindowOffset = valuatorTopWindowOffset
dialAsGlWindowSuper :: Dial a  ->  IO (GlWindow ())
dialAsGlWindowSuper = valuatorAsGlWindowSuper
dialAsGlWindow :: Dial a  ->  IO (GlWindow ())
dialAsGlWindow =  valuatorAsGlWindow
dialResizeSuper :: Dial a  -> Rectangle ->  IO (())
dialResizeSuper = valuatorResizeSuper
dialResize :: Dial a  -> Rectangle -> IO (())
dialResize = valuatorResize
dialSetCallback :: Dial a -> (Dial b -> IO ()) -> IO (())
dialSetCallback = valuatorSetCallback
dialBounds :: Dial a  -> Double -> Double ->  IO (())
dialBounds = valuatorBounds
dialMinimum :: Dial a  ->  IO (Double)
dialMinimum = valuatorMinimum
dialSetMinimum :: Dial a  -> Double ->  IO (())
dialSetMinimum = valuatorSetMinimum
dialMaximum :: Dial a  ->  IO (Double)
dialMaximum = valuatorMaximum
dialSetMaximum :: Dial a  -> Double ->  IO (())
dialSetMaximum = valuatorSetMaximum
dialRange :: Dial a  -> Double -> Double ->  IO (())
dialRange = valuatorRange
dialSetStep :: Dial a -> Rational -> IO ()
dialSetStep = valuatorSetStep
dialStep :: Dial a  ->  IO (Rational)
dialStep = valuatorStep
dialPrecision :: Dial a  -> Int ->  IO (())
dialPrecision = valuatorPrecision
dialValue :: Dial a  ->  IO (Double)
dialValue = valuatorValue
dialSetValue :: Dial a  -> Double ->  IO (Int)
dialSetValue = valuatorSetValue
dialFormat :: Dial a  -> String ->  IO (Int)
dialFormat = valuatorFormat
dialRound :: Dial a  -> Double ->  IO (Double)
dialRound = valuatorRound
dialClamp :: Dial a  -> Double ->  IO (Double)
dialClamp = valuatorClamp
dialIncrement :: Dial a  -> Double -> Int ->  IO (Double)
dialIncrement = valuatorIncrement
dialDrawBox :: Dial a -> IO ()
dialDrawBox = valuatorDrawBox
dialDrawBoxWithBoxtype :: Dial a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
dialDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
dialDrawBackdrop :: Dial a -> IO ()
dialDrawBackdrop = valuatorDrawBackdrop
dialDrawFocus :: Dial a -> Maybe (Boxtype, Rectangle) -> IO ()
dialDrawFocus = valuatorDrawFocus
{# fun unsafe Fl_Dial_set_angle1 as setAngle1' { id `Ptr ()',id `CShort' } -> `()' #}
dialSetAngle1 :: Dial a  -> Angle ->  IO ()
dialSetAngle1 dial (Angle a) = withObject dial $ \dialPtr -> setAngle1' dialPtr a
{# fun unsafe Fl_Dial_set_angle2 as setAngle2' { id `Ptr ()',id `CShort' } -> `()' #}
dialSetAngle2 :: Dial a  -> Angle ->  IO ()
dialSetAngle2 dial (Angle a) = withObject dial $ \dialPtr -> setAngle2' dialPtr a
{# fun unsafe Fl_Dial_angle1 as angle1' { id `Ptr ()' } -> `CShort' id #}
dialAngle1 :: Dial a  ->  IO (Angle)
dialAngle1 dial = withObject dial $ \dialPtr -> angle1' dialPtr >>= return . Angle
{# fun unsafe Fl_Dial_angle2 as angle2' { id `Ptr ()' } -> `CShort' id #}
dialAngle2 :: Dial a  ->  IO (Angle)
dialAngle2 dial = withObject dial $ \dialPtr -> angle2' dialPtr >>= return . Angle
{#fun Fl_Dial_handle as dialHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
dialHandle :: Dial a -> Event -> IO Int
dialHandle dial event = withObject dial (\p -> dialHandle' p (fromIntegral . fromEnum $ event))