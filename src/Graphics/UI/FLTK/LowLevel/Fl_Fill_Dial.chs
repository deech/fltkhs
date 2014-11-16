{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Fill_Dial
    (
     -- * Constructor
     fillDialNew,
     fillDialDestroy,
     -- * Fl_Fill_FillDial specific
     fillDialParent,
     fillDialSetParent,
     fillDialType_,
     fillDialSetType,
     fillDialDrawLabel,
     fillDialX,
     fillDialY,
     fillDialW,
     fillDialH,
     fillDialSetAlign,
     fillDialAlign,
     fillDialBox,
     fillDialSetBox,
     fillDialColor,
     fillDialSetColor,
     fillDialSetColorWithBgSel,
     fillDialSelectionColor,
     fillDialSetSelectionColor,
     fillDialLabel,
     fillDialCopyLabel,
     fillDialSetLabel,
     fillDialLabeltype,
     fillDialSetLabeltype,
     fillDialLabelcolor,
     fillDialSetLabelcolor,
     fillDialLabelfont,
     fillDialSetLabelfont,
     fillDialLabelsize,
     fillDialSetLabelsize,
     fillDialImage,
     fillDialSetImage,
     fillDialDeimage,
     fillDialSetDeimage,
     fillDialTooltip,
     fillDialCopyTooltip,
     fillDialSetTooltip,
     fillDialWhen,
     fillDialSetWhen,
     fillDialVisible,
     fillDialVisibleR,
     fillDialShowSuper,
     fillDialShow,
     fillDialHideSuper,
     fillDialHide,
     fillDialSetVisible,
     fillDialClearVisible,
     fillDialActive,
     fillDialActiveR,
     fillDialActivate,
     fillDialDeactivate,
     fillDialOutput,
     fillDialSetOutput,
     fillDialClearOutput,
     fillDialTakesevents,
     fillDialSetChanged,
     fillDialClearChanged,
     fillDialTakeFocus,
     fillDialSetVisibleFocus,
     fillDialClearVisibleFocus,
     fillDialModifyVisibleFocus,
     fillDialVisibleFocus,
     fillDialContains,
     fillDialInside,
     fillDialRedraw,
     fillDialRedrawLabel,
     fillDialDamage,
     fillDialClearDamageWithBitmask,
     fillDialClearDamage,
     fillDialDamageWithText,
     fillDialMeasureLabel,
     fillDialWindow,
     fillDialTopWindow,
     fillDialTopWindowOffset,
     fillDialAsGlWindowSuper,
     fillDialAsGlWindow,
     fillDialResizeSuper,
     fillDialResize,
     fillDialSetCallback,
     fillDialDrawBox,
     fillDialDrawBoxWithBoxtype,
     fillDialDrawBackdrop,
     fillDialDrawFocus,
     fillDialBounds,
     fillDialMinimum,
     fillDialSetMinimum,
     fillDialMaximum,
     fillDialSetMaximum,
     fillDialRange,
     fillDialSetStep,
     fillDialStep,
     fillDialPrecision,
     fillDialValue,
     fillDialSetValue,
     fillDialFormat,
     fillDialRound,
     fillDialClamp,
     fillDialIncrement,
     fillDialHandle,
     fillDialSetAngle1,
     fillDialSetAngle2,
     fillDialAngle1,
     fillDialAngle2
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Fill_DialC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Dial
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Fill_Dial_New as dialNew' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
fillDialNew :: Rectangle -> String -> IO (Dial ())
fillDialNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle in
    dialNew' x_pos y_pos width height l' >>= toObject

{# fun Fl_Fill_Dial_Destroy as dialDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
fillDialDestroy :: FillDial a -> IO ()
fillDialDestroy win = swapObject win $ \winPtr -> do
                                        dialDestroy' winPtr
                                        return nullPtr

fillDialParent :: FillDial a -> IO (Group ())
fillDialParent = dialParent
fillDialSetParent :: FillDial a -> Group b -> IO ()
fillDialSetParent = dialSetParent
fillDialType_ :: FillDial a  ->  IO (Word8)
fillDialType_ = dialType_
fillDialSetType :: FillDial a  -> Word8 ->  IO (())
fillDialSetType = dialSetType
fillDialDrawLabel :: FillDial a  -> Maybe (Rectangle,AlignType)->  IO (())
fillDialDrawLabel = dialDrawLabel
fillDialX :: FillDial a  ->  IO (Int)
fillDialX = dialX
fillDialY :: FillDial a  ->  IO (Int)
fillDialY = dialY
fillDialW :: FillDial a  ->  IO (Int)
fillDialW = dialW
fillDialH :: FillDial a  ->  IO (Int)
fillDialH = dialH
fillDialSetAlign :: FillDial a  -> AlignType ->  IO (())
fillDialSetAlign = dialSetAlign
fillDialAlign :: FillDial a  ->  IO (AlignType)
fillDialAlign = dialAlign
fillDialBox :: FillDial a  ->  IO (Boxtype)
fillDialBox = dialBox
fillDialSetBox :: FillDial a  -> Boxtype ->  IO (())
fillDialSetBox = dialSetBox
fillDialColor :: FillDial a  ->  IO (Color)
fillDialColor = dialColor
fillDialSetColor :: FillDial a  -> Color ->  IO (())
fillDialSetColor = dialSetColor
fillDialSetColorWithBgSel :: FillDial a  -> Color -> Color ->  IO (())
fillDialSetColorWithBgSel = dialSetColorWithBgSel
fillDialSelectionColor :: FillDial a  ->  IO (Color)
fillDialSelectionColor = dialSelectionColor
fillDialSetSelectionColor :: FillDial a  -> Color ->  IO (())
fillDialSetSelectionColor = dialSetSelectionColor
fillDialLabel :: FillDial a  ->  IO (String)
fillDialLabel = dialLabel
fillDialCopyLabel :: FillDial a  -> String ->  IO (())
fillDialCopyLabel = dialCopyLabel
fillDialSetLabel :: FillDial a  -> String ->  IO (())
fillDialSetLabel = dialSetLabel
fillDialLabeltype :: FillDial a  ->  IO (Labeltype)
fillDialLabeltype = dialLabeltype
fillDialSetLabeltype :: FillDial a  -> Labeltype ->  IO (())
fillDialSetLabeltype = dialSetLabeltype
fillDialLabelcolor :: FillDial a  ->  IO (Color)
fillDialLabelcolor = dialLabelcolor
fillDialSetLabelcolor :: FillDial a  -> Color ->  IO (())
fillDialSetLabelcolor = dialSetLabelcolor
fillDialLabelfont :: FillDial a  ->  IO (Font)
fillDialLabelfont = dialLabelfont
fillDialSetLabelfont :: FillDial a  -> Font ->  IO (())
fillDialSetLabelfont = dialSetLabelfont
fillDialLabelsize :: FillDial a  ->  IO (FontSize)
fillDialLabelsize = dialLabelsize
fillDialSetLabelsize :: FillDial a  -> FontSize ->  IO (())
fillDialSetLabelsize = dialSetLabelsize
fillDialImage :: FillDial a  ->  IO (Image ())
fillDialImage = dialImage
fillDialSetImage :: FillDial a  -> Image b ->  IO (())
fillDialSetImage = dialSetImage
fillDialDeimage :: FillDial a  ->  IO (Image ())
fillDialDeimage = dialDeimage
fillDialSetDeimage :: FillDial a  -> Image b ->  IO (())
fillDialSetDeimage = dialSetDeimage
fillDialTooltip :: FillDial a  ->  IO (String)
fillDialTooltip = dialTooltip
fillDialCopyTooltip :: FillDial a  -> String ->  IO (())
fillDialCopyTooltip = dialCopyTooltip
fillDialSetTooltip :: FillDial a  -> String ->  IO (())
fillDialSetTooltip = dialSetTooltip
fillDialWhen :: FillDial a  ->  IO (When)
fillDialWhen = dialWhen
fillDialSetWhen :: FillDial a  -> Word8 ->  IO (())
fillDialSetWhen = dialSetWhen
fillDialVisible :: FillDial a  ->  IO (Int)
fillDialVisible = dialVisible
fillDialVisibleR :: FillDial a  ->  IO (Int)
fillDialVisibleR = dialVisibleR
fillDialShowSuper :: FillDial a  ->  IO (())
fillDialShowSuper = dialShowSuper
fillDialShow :: FillDial a  ->  IO (())
fillDialShow = dialShow
fillDialHideSuper :: FillDial a  ->  IO (())
fillDialHideSuper = dialHideSuper
fillDialHide :: FillDial a  ->  IO (())
fillDialHide = dialHide
fillDialSetVisible :: FillDial a  ->  IO (())
fillDialSetVisible = dialSetVisible
fillDialClearVisible :: FillDial a  ->  IO (())
fillDialClearVisible = dialClearVisible
fillDialActive :: FillDial a  ->  IO (Int)
fillDialActive = dialActive
fillDialActiveR :: FillDial a  ->  IO (Int)
fillDialActiveR = dialActiveR
fillDialActivate :: FillDial a  ->  IO (())
fillDialActivate = dialActivate
fillDialDeactivate :: FillDial a  ->  IO (())
fillDialDeactivate = dialDeactivate
fillDialOutput :: FillDial a  ->  IO (Int)
fillDialOutput = dialOutput
fillDialSetOutput :: FillDial a  ->  IO (())
fillDialSetOutput = dialSetOutput
fillDialClearOutput :: FillDial a  ->  IO (())
fillDialClearOutput = dialClearOutput
fillDialTakesevents :: FillDial a  ->  IO (Int)
fillDialTakesevents = dialTakesevents
fillDialSetChanged :: FillDial a  ->  IO (())
fillDialSetChanged = dialSetChanged
fillDialClearChanged :: FillDial a  ->  IO (())
fillDialClearChanged = dialClearChanged
fillDialTakeFocus :: FillDial a  ->  IO (Int)
fillDialTakeFocus = dialTakeFocus
fillDialSetVisibleFocus :: FillDial a  ->  IO (())
fillDialSetVisibleFocus = dialSetVisibleFocus
fillDialClearVisibleFocus :: FillDial a  ->  IO (())
fillDialClearVisibleFocus = dialClearVisibleFocus
fillDialModifyVisibleFocus :: FillDial a  -> Int ->  IO (())
fillDialModifyVisibleFocus = dialModifyVisibleFocus
fillDialVisibleFocus :: FillDial a  ->  IO (Int)
fillDialVisibleFocus = dialVisibleFocus
fillDialContains :: FillDial a  -> FillDial a  ->  IO (Int)
fillDialContains = dialContains
fillDialInside :: FillDial a  -> FillDial a  ->  IO (Int)
fillDialInside = dialInside
fillDialRedraw :: FillDial a  ->  IO (())
fillDialRedraw = dialRedraw
fillDialRedrawLabel :: FillDial a  ->  IO (())
fillDialRedrawLabel = dialRedrawLabel
fillDialDamage :: FillDial a  ->  IO (Word8)
fillDialDamage = dialDamage
fillDialClearDamageWithBitmask :: FillDial a  -> Word8 ->  IO (())
fillDialClearDamageWithBitmask = dialClearDamageWithBitmask
fillDialClearDamage :: FillDial a  ->  IO (())
fillDialClearDamage = dialClearDamage
fillDialDamageWithText :: FillDial a  -> Word8 ->  IO (())
fillDialDamageWithText = dialDamageWithText
fillDialMeasureLabel :: FillDial a  -> IO (Size)
fillDialMeasureLabel = dialMeasureLabel
fillDialWindow :: FillDial a  ->  IO (Window ())
fillDialWindow = dialWindow
fillDialTopWindow :: FillDial a  ->  IO (Window ())
fillDialTopWindow = dialTopWindow
fillDialTopWindowOffset :: FillDial a -> IO (Position)
fillDialTopWindowOffset = dialTopWindowOffset
fillDialAsGlWindowSuper :: FillDial a  ->  IO (GlWindow ())
fillDialAsGlWindowSuper = dialAsGlWindowSuper
fillDialAsGlWindow :: FillDial a  ->  IO (GlWindow ())
fillDialAsGlWindow =  dialAsGlWindow
fillDialResizeSuper :: FillDial a  -> Rectangle ->  IO (())
fillDialResizeSuper = dialResizeSuper
fillDialResize :: FillDial a  -> Rectangle -> IO (())
fillDialResize = dialResize
fillDialSetCallback :: FillDial a -> (Dial b -> IO ()) -> IO (())
fillDialSetCallback = dialSetCallback
fillDialBounds :: FillDial a  -> Double -> Double ->  IO (())
fillDialBounds = dialBounds
fillDialMinimum :: FillDial a  ->  IO (Double)
fillDialMinimum = dialMinimum
fillDialSetMinimum :: FillDial a  -> Double ->  IO (())
fillDialSetMinimum = dialSetMinimum
fillDialMaximum :: FillDial a  ->  IO (Double)
fillDialMaximum = dialMaximum
fillDialSetMaximum :: FillDial a  -> Double ->  IO (())
fillDialSetMaximum = dialSetMaximum
fillDialRange :: FillDial a  -> Double -> Double ->  IO (())
fillDialRange = dialRange
fillDialSetStep :: FillDial a -> Rational -> IO ()
fillDialSetStep = dialSetStep
fillDialStep :: FillDial a  ->  IO (Rational)
fillDialStep = dialStep
fillDialPrecision :: FillDial a  -> Int ->  IO (())
fillDialPrecision = dialPrecision
fillDialValue :: FillDial a  ->  IO (Double)
fillDialValue = dialValue
fillDialSetValue :: FillDial a  -> Double ->  IO (Int)
fillDialSetValue = dialSetValue
fillDialFormat :: FillDial a  -> String ->  IO (Int)
fillDialFormat = dialFormat
fillDialRound :: FillDial a  -> Double ->  IO (Double)
fillDialRound = dialRound
fillDialClamp :: FillDial a  -> Double ->  IO (Double)
fillDialClamp = dialClamp
fillDialIncrement :: FillDial a  -> Double -> Int ->  IO (Double)
fillDialIncrement = dialIncrement
fillDialDrawBox :: FillDial a -> IO ()
fillDialDrawBox = dialDrawBox
fillDialDrawBoxWithBoxtype :: FillDial a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
fillDialDrawBoxWithBoxtype = dialDrawBoxWithBoxtype
fillDialDrawBackdrop :: FillDial a -> IO ()
fillDialDrawBackdrop = dialDrawBackdrop
fillDialDrawFocus :: FillDial a -> Maybe (Boxtype, Rectangle) -> IO ()
fillDialDrawFocus = dialDrawFocus
fillDialSetAngle1 :: FillDial a  -> Angle ->  IO ()
fillDialSetAngle1 = dialSetAngle1
fillDialSetAngle2 :: FillDial a  -> Angle ->  IO ()
fillDialSetAngle2 = dialSetAngle2
fillDialAngle1 :: FillDial a  ->  IO (Angle)
fillDialAngle1 = dialAngle1
fillDialAngle2 :: FillDial a  ->  IO (Angle)
fillDialAngle2 = dialAngle2
fillDialHandle :: FillDial a -> Event -> IO Int
fillDialHandle = dialHandle