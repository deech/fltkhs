{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Line_Dial
    (
     -- * Constructor
     lineDialNew,
     lineDialDestroy,
     -- * Fl_Line_LineDial specific
     lineDialParent,
     lineDialSetParent,
     lineDialType_,
     lineDialSetType,
     lineDialDrawLabel,
     lineDialX,
     lineDialY,
     lineDialW,
     lineDialH,
     lineDialSetAlign,
     lineDialAlign,
     lineDialBox,
     lineDialSetBox,
     lineDialColor,
     lineDialSetColor,
     lineDialSetColorWithBgSel,
     lineDialSelectionColor,
     lineDialSetSelectionColor,
     lineDialLabel,
     lineDialCopyLabel,
     lineDialSetLabel,
     lineDialLabeltype,
     lineDialSetLabeltype,
     lineDialLabelcolor,
     lineDialSetLabelcolor,
     lineDialLabelfont,
     lineDialSetLabelfont,
     lineDialLabelsize,
     lineDialSetLabelsize,
     lineDialImage,
     lineDialSetImage,
     lineDialDeimage,
     lineDialSetDeimage,
     lineDialTooltip,
     lineDialCopyTooltip,
     lineDialSetTooltip,
     lineDialWhen,
     lineDialSetWhen,
     lineDialVisible,
     lineDialVisibleR,
     lineDialShowSuper,
     lineDialShow,
     lineDialHideSuper,
     lineDialHide,
     lineDialSetVisible,
     lineDialClearVisible,
     lineDialActive,
     lineDialActiveR,
     lineDialActivate,
     lineDialDeactivate,
     lineDialOutput,
     lineDialSetOutput,
     lineDialClearOutput,
     lineDialTakesevents,
     lineDialSetChanged,
     lineDialClearChanged,
     lineDialTakeFocus,
     lineDialSetVisibleFocus,
     lineDialClearVisibleFocus,
     lineDialModifyVisibleFocus,
     lineDialVisibleFocus,
     lineDialContains,
     lineDialInside,
     lineDialRedraw,
     lineDialRedrawLabel,
     lineDialDamage,
     lineDialClearDamageWithBitmask,
     lineDialClearDamage,
     lineDialDamageWithText,
     lineDialMeasureLabel,
     lineDialWindow,
     lineDialTopWindow,
     lineDialTopWindowOffset,
     lineDialAsGlWindowSuper,
     lineDialAsGlWindow,
     lineDialResizeSuper,
     lineDialResize,
     lineDialSetCallback,
     lineDialDrawBox,
     lineDialDrawBoxWithBoxtype,
     lineDialDrawBackdrop,
     lineDialDrawFocus,
     lineDialBounds,
     lineDialMinimum,
     lineDialSetMinimum,
     lineDialMaximum,
     lineDialSetMaximum,
     lineDialRange,
     lineDialSetStep,
     lineDialStep,
     lineDialPrecision,
     lineDialValue,
     lineDialSetValue,
     lineDialFormat,
     lineDialRound,
     lineDialClamp,
     lineDialIncrement,
     lineDialHandle,
     lineDialSetAngle1,
     lineDialSetAngle2,
     lineDialAngle1,
     lineDialAngle2
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Line_DialC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Dial
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Line_Dial_New as dialNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Line_Dial_New_WithLabel as dialNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
lineDialNew :: Rectangle -> Maybe String -> IO (Dial ())
lineDialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> dialNew' x_pos y_pos width height >>=
                             toObject
        Just l -> dialNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Line_Dial_Destroy as dialDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
lineDialDestroy :: LineDial a -> IO ()
lineDialDestroy win = swapObject win $ \winPtr -> do
                                        dialDestroy' winPtr
                                        return nullPtr

lineDialParent :: LineDial a -> IO (Group ())
lineDialParent = dialParent
lineDialSetParent :: LineDial a -> Group b -> IO ()
lineDialSetParent = dialSetParent
lineDialType_ :: LineDial a  ->  IO (Word8)
lineDialType_ = dialType_
lineDialSetType :: LineDial a  -> Word8 ->  IO (())
lineDialSetType = dialSetType
lineDialDrawLabel :: LineDial a  -> Maybe (Rectangle,AlignType)->  IO (())
lineDialDrawLabel = dialDrawLabel
lineDialX :: LineDial a  ->  IO (Int)
lineDialX = dialX
lineDialY :: LineDial a  ->  IO (Int)
lineDialY = dialY
lineDialW :: LineDial a  ->  IO (Int)
lineDialW = dialW
lineDialH :: LineDial a  ->  IO (Int)
lineDialH = dialH
lineDialSetAlign :: LineDial a  -> AlignType ->  IO (())
lineDialSetAlign = dialSetAlign
lineDialAlign :: LineDial a  ->  IO (AlignType)
lineDialAlign = dialAlign
lineDialBox :: LineDial a  ->  IO (Boxtype)
lineDialBox = dialBox
lineDialSetBox :: LineDial a  -> Boxtype ->  IO (())
lineDialSetBox = dialSetBox
lineDialColor :: LineDial a  ->  IO (Color)
lineDialColor = dialColor
lineDialSetColor :: LineDial a  -> Color ->  IO (())
lineDialSetColor = dialSetColor
lineDialSetColorWithBgSel :: LineDial a  -> Color -> Color ->  IO (())
lineDialSetColorWithBgSel = dialSetColorWithBgSel
lineDialSelectionColor :: LineDial a  ->  IO (Color)
lineDialSelectionColor = dialSelectionColor
lineDialSetSelectionColor :: LineDial a  -> Color ->  IO (())
lineDialSetSelectionColor = dialSetSelectionColor
lineDialLabel :: LineDial a  ->  IO (String)
lineDialLabel = dialLabel
lineDialCopyLabel :: LineDial a  -> String ->  IO (())
lineDialCopyLabel = dialCopyLabel
lineDialSetLabel :: LineDial a  -> String ->  IO (())
lineDialSetLabel = dialSetLabel
lineDialLabeltype :: LineDial a  ->  IO (Labeltype)
lineDialLabeltype = dialLabeltype
lineDialSetLabeltype :: LineDial a  -> Labeltype ->  IO (())
lineDialSetLabeltype = dialSetLabeltype
lineDialLabelcolor :: LineDial a  ->  IO (Color)
lineDialLabelcolor = dialLabelcolor
lineDialSetLabelcolor :: LineDial a  -> Color ->  IO (())
lineDialSetLabelcolor = dialSetLabelcolor
lineDialLabelfont :: LineDial a  ->  IO (Font)
lineDialLabelfont = dialLabelfont
lineDialSetLabelfont :: LineDial a  -> Font ->  IO (())
lineDialSetLabelfont = dialSetLabelfont
lineDialLabelsize :: LineDial a  ->  IO (FontSize)
lineDialLabelsize = dialLabelsize
lineDialSetLabelsize :: LineDial a  -> FontSize ->  IO (())
lineDialSetLabelsize = dialSetLabelsize
lineDialImage :: LineDial a  ->  IO (Image ())
lineDialImage = dialImage
lineDialSetImage :: LineDial a  -> Image b ->  IO (())
lineDialSetImage = dialSetImage
lineDialDeimage :: LineDial a  ->  IO (Image ())
lineDialDeimage = dialDeimage
lineDialSetDeimage :: LineDial a  -> Image b ->  IO (())
lineDialSetDeimage = dialSetDeimage
lineDialTooltip :: LineDial a  ->  IO (String)
lineDialTooltip = dialTooltip
lineDialCopyTooltip :: LineDial a  -> String ->  IO (())
lineDialCopyTooltip = dialCopyTooltip
lineDialSetTooltip :: LineDial a  -> String ->  IO (())
lineDialSetTooltip = dialSetTooltip
lineDialWhen :: LineDial a  ->  IO (When)
lineDialWhen = dialWhen
lineDialSetWhen :: LineDial a  -> Word8 ->  IO (())
lineDialSetWhen = dialSetWhen
lineDialVisible :: LineDial a  ->  IO (Int)
lineDialVisible = dialVisible
lineDialVisibleR :: LineDial a  ->  IO (Int)
lineDialVisibleR = dialVisibleR
lineDialShowSuper :: LineDial a  ->  IO (())
lineDialShowSuper = dialShowSuper
lineDialShow :: LineDial a  ->  IO (())
lineDialShow = dialShow
lineDialHideSuper :: LineDial a  ->  IO (())
lineDialHideSuper = dialHideSuper
lineDialHide :: LineDial a  ->  IO (())
lineDialHide = dialHide
lineDialSetVisible :: LineDial a  ->  IO (())
lineDialSetVisible = dialSetVisible
lineDialClearVisible :: LineDial a  ->  IO (())
lineDialClearVisible = dialClearVisible
lineDialActive :: LineDial a  ->  IO (Int)
lineDialActive = dialActive
lineDialActiveR :: LineDial a  ->  IO (Int)
lineDialActiveR = dialActiveR
lineDialActivate :: LineDial a  ->  IO (())
lineDialActivate = dialActivate
lineDialDeactivate :: LineDial a  ->  IO (())
lineDialDeactivate = dialDeactivate
lineDialOutput :: LineDial a  ->  IO (Int)
lineDialOutput = dialOutput
lineDialSetOutput :: LineDial a  ->  IO (())
lineDialSetOutput = dialSetOutput
lineDialClearOutput :: LineDial a  ->  IO (())
lineDialClearOutput = dialClearOutput
lineDialTakesevents :: LineDial a  ->  IO (Int)
lineDialTakesevents = dialTakesevents
lineDialSetChanged :: LineDial a  ->  IO (())
lineDialSetChanged = dialSetChanged
lineDialClearChanged :: LineDial a  ->  IO (())
lineDialClearChanged = dialClearChanged
lineDialTakeFocus :: LineDial a  ->  IO (Int)
lineDialTakeFocus = dialTakeFocus
lineDialSetVisibleFocus :: LineDial a  ->  IO (())
lineDialSetVisibleFocus = dialSetVisibleFocus
lineDialClearVisibleFocus :: LineDial a  ->  IO (())
lineDialClearVisibleFocus = dialClearVisibleFocus
lineDialModifyVisibleFocus :: LineDial a  -> Int ->  IO (())
lineDialModifyVisibleFocus = dialModifyVisibleFocus
lineDialVisibleFocus :: LineDial a  ->  IO (Int)
lineDialVisibleFocus = dialVisibleFocus
lineDialContains :: LineDial a  -> LineDial a  ->  IO (Int)
lineDialContains = dialContains
lineDialInside :: LineDial a  -> LineDial a  ->  IO (Int)
lineDialInside = dialInside
lineDialRedraw :: LineDial a  ->  IO (())
lineDialRedraw = dialRedraw
lineDialRedrawLabel :: LineDial a  ->  IO (())
lineDialRedrawLabel = dialRedrawLabel
lineDialDamage :: LineDial a  ->  IO (Word8)
lineDialDamage = dialDamage
lineDialClearDamageWithBitmask :: LineDial a  -> Word8 ->  IO (())
lineDialClearDamageWithBitmask = dialClearDamageWithBitmask
lineDialClearDamage :: LineDial a  ->  IO (())
lineDialClearDamage = dialClearDamage
lineDialDamageWithText :: LineDial a  -> Word8 ->  IO (())
lineDialDamageWithText = dialDamageWithText
lineDialMeasureLabel :: LineDial a  -> IO (Size)
lineDialMeasureLabel = dialMeasureLabel
lineDialWindow :: LineDial a  ->  IO (Window ())
lineDialWindow = dialWindow
lineDialTopWindow :: LineDial a  ->  IO (Window ())
lineDialTopWindow = dialTopWindow
lineDialTopWindowOffset :: LineDial a -> IO (Position)
lineDialTopWindowOffset = dialTopWindowOffset
lineDialAsGlWindowSuper :: LineDial a  ->  IO (GlWindow ())
lineDialAsGlWindowSuper = dialAsGlWindowSuper
lineDialAsGlWindow :: LineDial a  ->  IO (GlWindow ())
lineDialAsGlWindow =  dialAsGlWindow
lineDialResizeSuper :: LineDial a  -> Rectangle ->  IO (())
lineDialResizeSuper = dialResizeSuper
lineDialResize :: LineDial a  -> Rectangle -> IO (())
lineDialResize = dialResize
lineDialSetCallback :: LineDial a -> (Dial b -> IO ()) -> IO (())
lineDialSetCallback = dialSetCallback
lineDialBounds :: LineDial a  -> Double -> Double ->  IO (())
lineDialBounds = dialBounds
lineDialMinimum :: LineDial a  ->  IO (Double)
lineDialMinimum = dialMinimum
lineDialSetMinimum :: LineDial a  -> Double ->  IO (())
lineDialSetMinimum = dialSetMinimum
lineDialMaximum :: LineDial a  ->  IO (Double)
lineDialMaximum = dialMaximum
lineDialSetMaximum :: LineDial a  -> Double ->  IO (())
lineDialSetMaximum = dialSetMaximum
lineDialRange :: LineDial a  -> Double -> Double ->  IO (())
lineDialRange = dialRange
lineDialSetStep :: LineDial a -> Rational -> IO ()
lineDialSetStep = dialSetStep
lineDialStep :: LineDial a  ->  IO (Rational)
lineDialStep = dialStep
lineDialPrecision :: LineDial a  -> Int ->  IO (())
lineDialPrecision = dialPrecision
lineDialValue :: LineDial a  ->  IO (Double)
lineDialValue = dialValue
lineDialSetValue :: LineDial a  -> Double ->  IO (Int)
lineDialSetValue = dialSetValue
lineDialFormat :: LineDial a  -> String ->  IO (Int)
lineDialFormat = dialFormat
lineDialRound :: LineDial a  -> Double ->  IO (Double)
lineDialRound = dialRound
lineDialClamp :: LineDial a  -> Double ->  IO (Double)
lineDialClamp = dialClamp
lineDialIncrement :: LineDial a  -> Double -> Int ->  IO (Double)
lineDialIncrement = dialIncrement
lineDialDrawBox :: LineDial a -> IO ()
lineDialDrawBox = dialDrawBox
lineDialDrawBoxWithBoxtype :: LineDial a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
lineDialDrawBoxWithBoxtype = dialDrawBoxWithBoxtype
lineDialDrawBackdrop :: LineDial a -> IO ()
lineDialDrawBackdrop = dialDrawBackdrop
lineDialDrawFocus :: LineDial a -> Maybe (Boxtype, Rectangle) -> IO ()
lineDialDrawFocus = dialDrawFocus
lineDialSetAngle1 :: LineDial a  -> Angle ->  IO ()
lineDialSetAngle1 = dialSetAngle1
lineDialSetAngle2 :: LineDial a  -> Angle ->  IO ()
lineDialSetAngle2 = dialSetAngle2
lineDialAngle1 :: LineDial a  ->  IO (Angle)
lineDialAngle1 = dialAngle1
lineDialAngle2 :: LineDial a  ->  IO (Angle)
lineDialAngle2 = dialAngle2
lineDialHandle :: LineDial a -> Event -> IO Int
lineDialHandle = dialHandle