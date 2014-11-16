{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Adjuster
    (
     -- * Constructor
     adjusterNew,
     adjusterDestroy,
     -- * Fl_Adjuster specific
     adjusterParent,
     adjusterSetParent,
     adjusterType_,
     adjusterSetType,
     adjusterDrawLabel,
     adjusterX,
     adjusterY,
     adjusterW,
     adjusterH,
     adjusterSetAlign,
     adjusterAlign,
     adjusterBox,
     adjusterSetBox,
     adjusterColor,
     adjusterSetColor,
     adjusterSetColorWithBgSel,
     adjusterSelectionColor,
     adjusterSetSelectionColor,
     adjusterLabel,
     adjusterCopyLabel,
     adjusterSetLabel,
     adjusterLabeltype,
     adjusterSetLabeltype,
     adjusterLabelcolor,
     adjusterSetLabelcolor,
     adjusterLabelfont,
     adjusterSetLabelfont,
     adjusterLabelsize,
     adjusterSetLabelsize,
     adjusterImage,
     adjusterSetImage,
     adjusterDeimage,
     adjusterSetDeimage,
     adjusterTooltip,
     adjusterCopyTooltip,
     adjusterSetTooltip,
     adjusterWhen,
     adjusterSetWhen,
     adjusterVisible,
     adjusterVisibleR,
     adjusterShowSuper,
     adjusterShow,
     adjusterHideSuper,
     adjusterHide,
     adjusterSetVisible,
     adjusterClearVisible,
     adjusterActive,
     adjusterActiveR,
     adjusterActivate,
     adjusterDeactivate,
     adjusterOutput,
     adjusterSetOutput,
     adjusterClearOutput,
     adjusterTakesevents,
     adjusterSetChanged,
     adjusterClearChanged,
     adjusterTakeFocus,
     adjusterSetVisibleFocus,
     adjusterClearVisibleFocus,
     adjusterModifyVisibleFocus,
     adjusterVisibleFocus,
     adjusterContains,
     adjusterInside,
     adjusterRedraw,
     adjusterRedrawLabel,
     adjusterDamage,
     adjusterClearDamageWithBitmask,
     adjusterClearDamage,
     adjusterDamageWithText,
     adjusterMeasureLabel,
     adjusterWindow,
     adjusterTopWindow,
     adjusterTopWindowOffset,
     adjusterAsGlWindowSuper,
     adjusterAsGlWindow,
     adjusterResizeSuper,
     adjusterResize,
     adjusterSetCallback,
     adjusterDrawBox,
     adjusterDrawBoxWithBoxtype,
     adjusterDrawBackdrop,
     adjusterDrawFocus,
     adjusterBounds,
     adjusterMinimum,
     adjusterSetMinimum,
     adjusterMaximum,
     adjusterSetMaximum,
     adjusterRange,
     adjusterSetStep,
     adjusterStep,
     adjusterPrecision,
     adjusterValue,
     adjusterSetValue,
     adjusterFormat,
     adjusterRound,
     adjusterClamp,
     adjusterIncrement,
     adjusterSoft,
     adjusterSetSoft
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AdjusterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Valuator
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Adjuster_New as adjusterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Adjuster_New_WithLabel as adjusterNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
adjusterNew :: Rectangle -> Maybe String -> IO (Adjuster ())
adjusterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> adjusterNew' x_pos y_pos width height >>=
                             toObject
        Just l -> adjusterNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Adjuster_Destroy as adjusterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
adjusterDestroy :: Adjuster a -> IO ()
adjusterDestroy win = swapObject win $ \winPtr -> do
                                        adjusterDestroy' winPtr
                                        return nullPtr

adjusterParent :: Adjuster a -> IO (Group ())
adjusterParent = valuatorParent
adjusterSetParent :: Adjuster a -> Group b -> IO ()
adjusterSetParent = valuatorSetParent
adjusterType_ :: Adjuster a  ->  IO (Word8)
adjusterType_ = valuatorType_
adjusterSetType :: Adjuster a  -> Word8 ->  IO (())
adjusterSetType = valuatorSetType
adjusterDrawLabel :: Adjuster a  -> Maybe (Rectangle,AlignType)->  IO (())
adjusterDrawLabel = valuatorDrawLabel
adjusterX :: Adjuster a  ->  IO (Int)
adjusterX = valuatorX
adjusterY :: Adjuster a  ->  IO (Int)
adjusterY = valuatorY
adjusterW :: Adjuster a  ->  IO (Int)
adjusterW = valuatorW
adjusterH :: Adjuster a  ->  IO (Int)
adjusterH = valuatorH
adjusterSetAlign :: Adjuster a  -> AlignType ->  IO (())
adjusterSetAlign = valuatorSetAlign
adjusterAlign :: Adjuster a  ->  IO (AlignType)
adjusterAlign = valuatorAlign
adjusterBox :: Adjuster a  ->  IO (Boxtype)
adjusterBox = valuatorBox
adjusterSetBox :: Adjuster a  -> Boxtype ->  IO (())
adjusterSetBox = valuatorSetBox
adjusterColor :: Adjuster a  ->  IO (Color)
adjusterColor = valuatorColor
adjusterSetColor :: Adjuster a  -> Color ->  IO (())
adjusterSetColor = valuatorSetColor
adjusterSetColorWithBgSel :: Adjuster a  -> Color -> Color ->  IO (())
adjusterSetColorWithBgSel = valuatorSetColorWithBgSel
adjusterSelectionColor :: Adjuster a  ->  IO (Color)
adjusterSelectionColor = valuatorSelectionColor
adjusterSetSelectionColor :: Adjuster a  -> Color ->  IO (())
adjusterSetSelectionColor = valuatorSetSelectionColor
adjusterLabel :: Adjuster a  ->  IO (String)
adjusterLabel = valuatorLabel
adjusterCopyLabel :: Adjuster a  -> String ->  IO (())
adjusterCopyLabel = valuatorCopyLabel
adjusterSetLabel :: Adjuster a  -> String ->  IO (())
adjusterSetLabel = valuatorSetLabel
adjusterLabeltype :: Adjuster a  ->  IO (Labeltype)
adjusterLabeltype = valuatorLabeltype
adjusterSetLabeltype :: Adjuster a  -> Labeltype ->  IO (())
adjusterSetLabeltype = valuatorSetLabeltype
adjusterLabelcolor :: Adjuster a  ->  IO (Color)
adjusterLabelcolor = valuatorLabelcolor
adjusterSetLabelcolor :: Adjuster a  -> Color ->  IO (())
adjusterSetLabelcolor = valuatorSetLabelcolor
adjusterLabelfont :: Adjuster a  ->  IO (Font)
adjusterLabelfont = valuatorLabelfont
adjusterSetLabelfont :: Adjuster a  -> Font ->  IO (())
adjusterSetLabelfont = valuatorSetLabelfont
adjusterLabelsize :: Adjuster a  ->  IO (FontSize)
adjusterLabelsize = valuatorLabelsize
adjusterSetLabelsize :: Adjuster a  -> FontSize ->  IO (())
adjusterSetLabelsize = valuatorSetLabelsize
adjusterImage :: Adjuster a  ->  IO (Image ())
adjusterImage = valuatorImage
adjusterSetImage :: Adjuster a  -> Image b ->  IO (())
adjusterSetImage = valuatorSetImage
adjusterDeimage :: Adjuster a  ->  IO (Image ())
adjusterDeimage = valuatorDeimage
adjusterSetDeimage :: Adjuster a  -> Image b ->  IO (())
adjusterSetDeimage = valuatorSetDeimage
adjusterTooltip :: Adjuster a  ->  IO (String)
adjusterTooltip = valuatorTooltip
adjusterCopyTooltip :: Adjuster a  -> String ->  IO (())
adjusterCopyTooltip = valuatorCopyTooltip
adjusterSetTooltip :: Adjuster a  -> String ->  IO (())
adjusterSetTooltip = valuatorSetTooltip
adjusterWhen :: Adjuster a  ->  IO (When)
adjusterWhen = valuatorWhen
adjusterSetWhen :: Adjuster a  -> Word8 ->  IO (())
adjusterSetWhen = valuatorSetWhen
adjusterVisible :: Adjuster a  ->  IO (Int)
adjusterVisible = valuatorVisible
adjusterVisibleR :: Adjuster a  ->  IO (Int)
adjusterVisibleR = valuatorVisibleR
adjusterShowSuper :: Adjuster a  ->  IO (())
adjusterShowSuper = valuatorShowSuper
adjusterShow :: Adjuster a  ->  IO (())
adjusterShow = valuatorShow
adjusterHideSuper :: Adjuster a  ->  IO (())
adjusterHideSuper = valuatorHideSuper
adjusterHide :: Adjuster a  ->  IO (())
adjusterHide = valuatorHide
adjusterSetVisible :: Adjuster a  ->  IO (())
adjusterSetVisible = valuatorSetVisible
adjusterClearVisible :: Adjuster a  ->  IO (())
adjusterClearVisible = valuatorClearVisible
adjusterActive :: Adjuster a  ->  IO (Int)
adjusterActive = valuatorActive
adjusterActiveR :: Adjuster a  ->  IO (Int)
adjusterActiveR = valuatorActiveR
adjusterActivate :: Adjuster a  ->  IO (())
adjusterActivate = valuatorActivate
adjusterDeactivate :: Adjuster a  ->  IO (())
adjusterDeactivate = valuatorDeactivate
adjusterOutput :: Adjuster a  ->  IO (Int)
adjusterOutput = valuatorOutput
adjusterSetOutput :: Adjuster a  ->  IO (())
adjusterSetOutput = valuatorSetOutput
adjusterClearOutput :: Adjuster a  ->  IO (())
adjusterClearOutput = valuatorClearOutput
adjusterTakesevents :: Adjuster a  ->  IO (Int)
adjusterTakesevents = valuatorTakesevents
adjusterSetChanged :: Adjuster a  ->  IO (())
adjusterSetChanged = valuatorSetChanged
adjusterClearChanged :: Adjuster a  ->  IO (())
adjusterClearChanged = valuatorClearChanged
adjusterTakeFocus :: Adjuster a  ->  IO (Int)
adjusterTakeFocus = valuatorTakeFocus
adjusterSetVisibleFocus :: Adjuster a  ->  IO (())
adjusterSetVisibleFocus = valuatorSetVisibleFocus
adjusterClearVisibleFocus :: Adjuster a  ->  IO (())
adjusterClearVisibleFocus = valuatorClearVisibleFocus
adjusterModifyVisibleFocus :: Adjuster a  -> Int ->  IO (())
adjusterModifyVisibleFocus = valuatorModifyVisibleFocus
adjusterVisibleFocus :: Adjuster a  ->  IO (Int)
adjusterVisibleFocus = valuatorVisibleFocus
adjusterContains :: Adjuster a  -> Adjuster a  ->  IO (Int)
adjusterContains = valuatorContains
adjusterInside :: Adjuster a  -> Adjuster a  ->  IO (Int)
adjusterInside = valuatorInside
adjusterRedraw :: Adjuster a  ->  IO (())
adjusterRedraw = valuatorRedraw
adjusterRedrawLabel :: Adjuster a  ->  IO (())
adjusterRedrawLabel = valuatorRedrawLabel
adjusterDamage :: Adjuster a  ->  IO (Word8)
adjusterDamage = valuatorDamage
adjusterClearDamageWithBitmask :: Adjuster a  -> Word8 ->  IO (())
adjusterClearDamageWithBitmask = valuatorClearDamageWithBitmask
adjusterClearDamage :: Adjuster a  ->  IO (())
adjusterClearDamage = valuatorClearDamage
adjusterDamageWithText :: Adjuster a  -> Word8 ->  IO (())
adjusterDamageWithText = valuatorDamageWithText
adjusterMeasureLabel :: Adjuster a  -> IO (Size)
adjusterMeasureLabel = valuatorMeasureLabel
adjusterWindow :: Adjuster a  ->  IO (Window ())
adjusterWindow = valuatorWindow
adjusterTopWindow :: Adjuster a  ->  IO (Window ())
adjusterTopWindow = valuatorTopWindow
adjusterTopWindowOffset :: Adjuster a -> IO (Position)
adjusterTopWindowOffset = valuatorTopWindowOffset
adjusterAsGlWindowSuper :: Adjuster a  ->  IO (GlWindow ())
adjusterAsGlWindowSuper = valuatorAsGlWindowSuper
adjusterAsGlWindow :: Adjuster a  ->  IO (GlWindow ())
adjusterAsGlWindow =  valuatorAsGlWindow
adjusterResizeSuper :: Adjuster a  -> Rectangle ->  IO (())
adjusterResizeSuper = valuatorResizeSuper
adjusterResize :: Adjuster a  -> Rectangle -> IO (())
adjusterResize = valuatorResize
adjusterSetCallback :: Adjuster a -> (Adjuster b -> IO ()) -> IO (())
adjusterSetCallback = valuatorSetCallback
adjusterBounds :: Adjuster a  -> Double -> Double ->  IO (())
adjusterBounds = valuatorBounds
adjusterMinimum :: Adjuster a  ->  IO (Double)
adjusterMinimum = valuatorMinimum
adjusterSetMinimum :: Adjuster a  -> Double ->  IO (())
adjusterSetMinimum = valuatorSetMinimum
adjusterMaximum :: Adjuster a  ->  IO (Double)
adjusterMaximum = valuatorMaximum
adjusterSetMaximum :: Adjuster a  -> Double ->  IO (())
adjusterSetMaximum = valuatorSetMaximum
adjusterRange :: Adjuster a  -> Double -> Double ->  IO (())
adjusterRange = valuatorRange
adjusterSetStep :: Adjuster a -> Rational -> IO ()
adjusterSetStep = valuatorSetStep
adjusterStep :: Adjuster a  ->  IO (Rational)
adjusterStep = valuatorStep
adjusterPrecision :: Adjuster a  -> Int ->  IO (())
adjusterPrecision = valuatorPrecision
adjusterValue :: Adjuster a  ->  IO (Double)
adjusterValue = valuatorValue
adjusterSetValue :: Adjuster a  -> Double ->  IO (Int)
adjusterSetValue = valuatorSetValue
adjusterFormat :: Adjuster a  -> String ->  IO (Int)
adjusterFormat = valuatorFormat
adjusterRound :: Adjuster a  -> Double ->  IO (Double)
adjusterRound = valuatorRound
adjusterClamp :: Adjuster a  -> Double ->  IO (Double)
adjusterClamp = valuatorClamp
adjusterIncrement :: Adjuster a  -> Double -> Int ->  IO (Double)
adjusterIncrement = valuatorIncrement
adjusterDrawBox :: Adjuster a -> IO ()
adjusterDrawBox = valuatorDrawBox
adjusterDrawBoxWithBoxtype :: Adjuster a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
adjusterDrawBoxWithBoxtype = valuatorDrawBoxWithBoxtype
adjusterDrawBackdrop :: Adjuster a -> IO ()
adjusterDrawBackdrop = valuatorDrawBackdrop
adjusterDrawFocus :: Adjuster a -> Maybe (Boxtype, Rectangle) -> IO ()
adjusterDrawFocus = valuatorDrawFocus
{# fun unsafe Fl_Adjuster_soft as soft' { id `Ptr ()' } -> `Int' #}
adjusterSoft :: Adjuster a  ->  IO (Int)
adjusterSoft adjuster = withObject adjuster $ \adjusterPtr -> soft' adjusterPtr
{# fun unsafe Fl_Adjuster_set_soft as setSoft' { id `Ptr ()',`Int' } -> `()' #}
adjusterSetSoft :: Adjuster a  -> Int ->  IO ()
adjusterSetSoft adjuster soft = withObject adjuster $ \adjusterPtr -> setSoft' adjusterPtr soft
