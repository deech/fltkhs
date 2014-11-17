{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Timer
    (
     -- * Constructor
     timerNew,
     valueTimerNew,
     hiddenTimerNew,
     timerDestroy,
     -- * Fl_Timer specific
     timerParent,
     timerSetParent,
     timerType_,
     timerSetType,
     timerDrawLabel,
     timerX,
     timerY,
     timerW,
     timerH,
     timerSetAlign,
     timerAlign,
     timerBox,
     timerSetBox,
     timerColor,
     timerSetColor,
     timerSetColorWithBgSel,
     timerSelectionColor,
     timerSetSelectionColor,
     timerLabel,
     timerCopyLabel,
     timerSetLabel,
     timerLabeltype,
     timerSetLabeltype,
     timerLabelcolor,
     timerSetLabelcolor,
     timerLabelfont,
     timerSetLabelfont,
     timerLabelsize,
     timerSetLabelsize,
     timerImage,
     timerSetImage,
     timerDeimage,
     timerSetDeimage,
     timerTooltip,
     timerCopyTooltip,
     timerSetTooltip,
     timerWhen,
     timerSetWhen,
     timerVisible,
     timerVisibleR,
     timerShowSuper,
     timerShow,
     timerHideSuper,
     timerHide,
     timerSetVisible,
     timerClearVisible,
     timerActive,
     timerActiveR,
     timerActivate,
     timerDeactivate,
     timerOutput,
     timerSetOutput,
     timerClearOutput,
     timerTakesevents,
     timerSetChanged,
     timerClearChanged,
     timerTakeFocus,
     timerSetVisibleFocus,
     timerClearVisibleFocus,
     timerModifyVisibleFocus,
     timerVisibleFocus,
     timerContains,
     timerInside,
     timerRedraw,
     timerRedrawLabel,
     timerDamage,
     timerClearDamageWithBitmask,
     timerClearDamage,
     timerDamageWithText,
     timerMeasureLabel,
     timerWindow,
     timerTopWindow,
     timerTopWindowOffset,
     timerAsGlWindowSuper,
     timerAsGlWindow,
     timerResizeSuper,
     timerResize,
     timerSetCallback,
     timerDrawBox,
     timerDrawBoxWithBoxtype,
     timerDrawBackdrop,
     timerDrawFocus,
     timerValue,
     timerSetValue,
     timerHandle,
     timerDirection,
     timerSetDirection,
     timerSuspended,
     timerSetSuspended
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TimerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Timer_New as timerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
timerNew :: Rectangle -> String -> IO (Timer ())
timerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in timerNewWithLabel' x_pos y_pos width height l' >>= toObject
{# fun Fl_Value_Timer_New as valueTimerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueTimerNew :: Rectangle -> String -> IO (Timer ())
valueTimerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in
    valueTimerNewWithLabel' x_pos y_pos width height l' >>= toObject
    
{# fun Fl_Hidden_Timer_New as hiddenTimerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
hiddenTimerNew :: Rectangle -> String -> IO (Timer ())
hiddenTimerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in 
    hiddenTimerNewWithLabel' x_pos y_pos width height l' >>= toObject

{# fun Fl_Timer_Destroy as timerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
timerDestroy :: Timer a -> IO ()
timerDestroy win = swapObject win $ \winPtr -> do
                                        timerDestroy' winPtr
                                        return nullPtr

timerParent :: Timer a -> IO (Group ())
timerParent = widgetParent
timerSetParent :: Timer a -> Group b -> IO ()
timerSetParent = widgetSetParent
timerType_ :: Timer a  ->  IO (Word8)
timerType_ = widgetType_
timerSetType :: Timer a  -> Word8 ->  IO (())
timerSetType = widgetSetType
timerDrawLabel :: Timer a  -> Maybe (Rectangle,AlignType)->  IO (())
timerDrawLabel = widgetDrawLabel
timerX :: Timer a  ->  IO (Int)
timerX = widgetX
timerY :: Timer a  ->  IO (Int)
timerY = widgetY
timerW :: Timer a  ->  IO (Int)
timerW = widgetW
timerH :: Timer a  ->  IO (Int)
timerH = widgetH
timerSetAlign :: Timer a  -> AlignType ->  IO (())
timerSetAlign = widgetSetAlign
timerAlign :: Timer a  ->  IO (AlignType)
timerAlign = widgetAlign
timerBox :: Timer a  ->  IO (Boxtype)
timerBox = widgetBox
timerSetBox :: Timer a  -> Boxtype ->  IO (())
timerSetBox = widgetSetBox
timerColor :: Timer a  ->  IO (Color)
timerColor = widgetColor
timerSetColor :: Timer a  -> Color ->  IO (())
timerSetColor = widgetSetColor
timerSetColorWithBgSel :: Timer a  -> Color -> Color ->  IO (())
timerSetColorWithBgSel = widgetSetColorWithBgSel
timerSelectionColor :: Timer a  ->  IO (Color)
timerSelectionColor = widgetSelectionColor
timerSetSelectionColor :: Timer a  -> Color ->  IO (())
timerSetSelectionColor = widgetSetSelectionColor
timerLabel :: Timer a  ->  IO (String)
timerLabel = widgetLabel
timerCopyLabel :: Timer a  -> String ->  IO (())
timerCopyLabel = widgetCopyLabel
timerSetLabel :: Timer a  -> String ->  IO (())
timerSetLabel = widgetSetLabel
timerLabeltype :: Timer a  ->  IO (Labeltype)
timerLabeltype = widgetLabeltype
timerSetLabeltype :: Timer a  -> Labeltype ->  IO (())
timerSetLabeltype = widgetSetLabeltype
timerLabelcolor :: Timer a  ->  IO (Color)
timerLabelcolor = widgetLabelcolor
timerSetLabelcolor :: Timer a  -> Color ->  IO (())
timerSetLabelcolor = widgetSetLabelcolor
timerLabelfont :: Timer a  ->  IO (Font)
timerLabelfont = widgetLabelfont
timerSetLabelfont :: Timer a  -> Font ->  IO (())
timerSetLabelfont = widgetSetLabelfont
timerLabelsize :: Timer a  ->  IO (FontSize)
timerLabelsize = widgetLabelsize
timerSetLabelsize :: Timer a  -> FontSize ->  IO (())
timerSetLabelsize = widgetSetLabelsize
timerImage :: Timer a  ->  IO (Image ())
timerImage = widgetImage
timerSetImage :: Timer a  -> Image b ->  IO (())
timerSetImage = widgetSetImage
timerDeimage :: Timer a  ->  IO (Image ())
timerDeimage = widgetDeimage
timerSetDeimage :: Timer a  -> Image b ->  IO (())
timerSetDeimage = widgetSetDeimage
timerTooltip :: Timer a  ->  IO (String)
timerTooltip = widgetTooltip
timerCopyTooltip :: Timer a  -> String ->  IO (())
timerCopyTooltip = widgetCopyTooltip
timerSetTooltip :: Timer a  -> String ->  IO (())
timerSetTooltip = widgetSetTooltip
timerWhen :: Timer a  ->  IO (When)
timerWhen = widgetWhen
timerSetWhen :: Timer a  -> Word8 ->  IO (())
timerSetWhen = widgetSetWhen
timerVisible :: Timer a  ->  IO (Int)
timerVisible = widgetVisible
timerVisibleR :: Timer a  ->  IO (Int)
timerVisibleR = widgetVisibleR
timerShowSuper :: Timer a  ->  IO (())
timerShowSuper = widgetShowSuper
timerShow :: Timer a  ->  IO (())
timerShow = widgetShow
timerHideSuper :: Timer a  ->  IO (())
timerHideSuper = widgetHideSuper
timerHide :: Timer a  ->  IO (())
timerHide = widgetHide
timerSetVisible :: Timer a  ->  IO (())
timerSetVisible = widgetSetVisible
timerClearVisible :: Timer a  ->  IO (())
timerClearVisible = widgetClearVisible
timerActive :: Timer a  ->  IO (Int)
timerActive = widgetActive
timerActiveR :: Timer a  ->  IO (Int)
timerActiveR = widgetActiveR
timerActivate :: Timer a  ->  IO (())
timerActivate = widgetActivate
timerDeactivate :: Timer a  ->  IO (())
timerDeactivate = widgetDeactivate
timerOutput :: Timer a  ->  IO (Int)
timerOutput = widgetOutput
timerSetOutput :: Timer a  ->  IO (())
timerSetOutput = widgetSetOutput
timerClearOutput :: Timer a  ->  IO (())
timerClearOutput = widgetClearOutput
timerTakesevents :: Timer a  ->  IO (Int)
timerTakesevents = widgetTakesevents
timerSetChanged :: Timer a  ->  IO (())
timerSetChanged = widgetSetChanged
timerClearChanged :: Timer a  ->  IO (())
timerClearChanged = widgetClearChanged
timerTakeFocus :: Timer a  ->  IO (Int)
timerTakeFocus = widgetTakeFocus
timerSetVisibleFocus :: Timer a  ->  IO (())
timerSetVisibleFocus = widgetSetVisibleFocus
timerClearVisibleFocus :: Timer a  ->  IO (())
timerClearVisibleFocus = widgetClearVisibleFocus
timerModifyVisibleFocus :: Timer a  -> Int ->  IO (())
timerModifyVisibleFocus = widgetModifyVisibleFocus
timerVisibleFocus :: Timer a  ->  IO (Int)
timerVisibleFocus = widgetVisibleFocus
timerContains :: Timer a  -> Timer a  ->  IO (Int)
timerContains = widgetContains
timerInside :: Timer a  -> Timer a  ->  IO (Int)
timerInside = widgetInside
timerRedraw :: Timer a  ->  IO (())
timerRedraw = widgetRedraw
timerRedrawLabel :: Timer a  ->  IO (())
timerRedrawLabel = widgetRedrawLabel
timerDamage :: Timer a  ->  IO (Word8)
timerDamage = widgetDamage
timerClearDamageWithBitmask :: Timer a  -> Word8 ->  IO (())
timerClearDamageWithBitmask = widgetClearDamageWithBitmask
timerClearDamage :: Timer a  ->  IO (())
timerClearDamage = widgetClearDamage
timerDamageWithText :: Timer a  -> Word8 ->  IO (())
timerDamageWithText = widgetDamageWithText
timerMeasureLabel :: Timer a  -> IO (Size)
timerMeasureLabel = widgetMeasureLabel
timerWindow :: Timer a  ->  IO (Window ())
timerWindow = widgetWindow
timerTopWindow :: Timer a  ->  IO (Window ())
timerTopWindow = widgetTopWindow
timerTopWindowOffset :: Timer a -> IO (Position)
timerTopWindowOffset = widgetTopWindowOffset
timerAsGlWindowSuper :: Timer a  ->  IO (GlWindow ())
timerAsGlWindowSuper = widgetAsGlWindowSuper
timerAsGlWindow :: Timer a  ->  IO (GlWindow ())
timerAsGlWindow = widgetAsGlWindow
timerResizeSuper :: Timer a  -> Rectangle ->  IO (())
timerResizeSuper = widgetResizeSuper
timerResize :: Timer a  -> Rectangle -> IO (())
timerResize = widgetResize
timerSetCallback :: Timer a -> (Timer b -> IO ()) -> IO (())
timerSetCallback = widgetSetCallback
timerDrawBox :: Timer a -> IO ()
timerDrawBox = widgetDrawBox
timerDrawBoxWithBoxtype :: Timer a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
timerDrawBoxWithBoxtype = widgetDrawBoxWithBoxtype
timerDrawBackdrop :: Timer a -> IO ()
timerDrawBackdrop = widgetDrawBackdrop
timerDrawFocus :: Timer a -> Maybe (Boxtype, Rectangle) -> IO ()
timerDrawFocus = widgetDrawFocus
{#fun Fl_Timer_handle as timerHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
timerHandle :: Timer a -> Event -> IO Int
timerHandle timer event = withObject timer (\p -> timerHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Timer_direction as direction' { id `Ptr ()' } -> `CChar' id #}
timerDirection :: Timer a  ->  IO (CountDirection)
timerDirection adjuster = withObject adjuster $ \adjusterPtr -> direction' adjusterPtr >>= return . ccharToCountDirection
{# fun unsafe Fl_Timer_set_direction as setDirection' { id `Ptr ()',id `CChar' } -> `()' #}
timerSetDirection :: Timer a  -> CountDirection ->  IO ()
timerSetDirection adjuster d = withObject adjuster $ \adjusterPtr -> setDirection' adjusterPtr (countDirectionToCChar d)
{# fun unsafe Fl_Timer_value as value' { id `Ptr ()' } -> `Double' #}
timerValue :: Timer a  ->  IO (Double)
timerValue adjuster = withObject adjuster $ \adjusterPtr -> value' adjusterPtr
{# fun unsafe Fl_Timer_set_value as setValue' { id `Ptr ()',`Double' } -> `()' #}
timerSetValue :: Timer a  -> Double ->  IO ()
timerSetValue adjuster value = withObject adjuster $ \adjusterPtr -> setValue' adjusterPtr value
{# fun unsafe Fl_Timer_suspended as suspended' { id `Ptr ()' } -> `Bool' cToBool #}
timerSuspended :: Timer a  ->  IO (Bool)
timerSuspended adjuster = withObject adjuster $ \adjusterPtr -> suspended' adjusterPtr
{# fun unsafe Fl_Timer_set_suspended as setSuspended' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
timerSetSuspended :: Timer a  -> Bool ->  IO ()
timerSetSuspended adjuster s = withObject adjuster $ \adjusterPtr -> setSuspended' adjusterPtr s
