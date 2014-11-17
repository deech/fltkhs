{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Positioner
    (
     -- * Constructor
     positionerNew,
     positionerDestroy,
     -- * Fl_Positioner specific
     positionerParent,
     positionerSetParent,
     positionerType_,
     positionerSetType,
     positionerDrawLabel,
     positionerX,
     positionerY,
     positionerW,
     positionerH,
     positionerSetAlign,
     positionerAlign,
     positionerBox,
     positionerSetBox,
     positionerColor,
     positionerSetColor,
     positionerSetColorWithBgSel,
     positionerSelectionColor,
     positionerSetSelectionColor,
     positionerLabel,
     positionerCopyLabel,
     positionerSetLabel,
     positionerLabeltype,
     positionerSetLabeltype,
     positionerLabelcolor,
     positionerSetLabelcolor,
     positionerLabelfont,
     positionerSetLabelfont,
     positionerLabelsize,
     positionerSetLabelsize,
     positionerImage,
     positionerSetImage,
     positionerDeimage,
     positionerSetDeimage,
     positionerTooltip,
     positionerCopyTooltip,
     positionerSetTooltip,
     positionerWhen,
     positionerSetWhen,
     positionerVisible,
     positionerVisibleR,
     positionerShowSuper,
     positionerShow,
     positionerHideSuper,
     positionerHide,
     positionerSetVisible,
     positionerClearVisible,
     positionerActive,
     positionerActiveR,
     positionerActivate,
     positionerDeactivate,
     positionerOutput,
     positionerSetOutput,
     positionerClearOutput,
     positionerTakesevents,
     positionerSetChanged,
     positionerClearChanged,
     positionerTakeFocus,
     positionerSetVisibleFocus,
     positionerClearVisibleFocus,
     positionerModifyVisibleFocus,
     positionerVisibleFocus,
     positionerContains,
     positionerInside,
     positionerRedraw,
     positionerRedrawLabel,
     positionerDamage,
     positionerClearDamageWithBitmask,
     positionerClearDamage,
     positionerDamageWithText,
     positionerMeasureLabel,
     positionerWindow,
     positionerTopWindow,
     positionerTopWindowOffset,
     positionerAsGlWindowSuper,
     positionerAsGlWindow,
     positionerResizeSuper,
     positionerResize,
     positionerSetCallback,
     positionerDrawBox,
     positionerDrawBoxWithBoxtype,
     positionerDrawBackdrop,
     positionerDrawFocus,
     positionerHandle,
     positionerHandle,
     positionerSetXvalue,
     positionerXvalue,
     positionerSetYvalue,
     positionerYvalue,
     positionerSetXminimum,
     positionerXminimum,
     positionerSetYminimum,
     positionerYminimum,
     positionerSetXmaximum,
     positionerXmaximum,
     positionerSetYmaximum,
     positionerYmaximum,
     positionerXbounds,
     positionerYbounds,
     positionerXstep,
     positionerYstep
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_PositionerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Positioner_New as positionerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Positioner_New_WithLabel as positionerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
positionerNew :: Rectangle -> Maybe String -> IO (Positioner ())
positionerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> positionerNew' x_pos y_pos width height >>=
                             toObject
        Just l -> positionerNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Positioner_Destroy as positionerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
positionerDestroy :: Positioner a -> IO ()
positionerDestroy win = swapObject win $ \winPtr -> do
                                        positionerDestroy' winPtr
                                        return nullPtr

positionerParent :: Positioner a -> IO (Group ())
positionerParent = widgetParent
positionerSetParent :: Positioner a -> Group b -> IO ()
positionerSetParent = widgetSetParent
positionerType_ :: Positioner a  ->  IO (Word8)
positionerType_ = widgetType_
positionerSetType :: Positioner a  -> Word8 ->  IO (())
positionerSetType = widgetSetType
positionerDrawLabel :: Positioner a  -> Maybe (Rectangle,AlignType)->  IO (())
positionerDrawLabel = widgetDrawLabel
positionerX :: Positioner a  ->  IO (Int)
positionerX = widgetX
positionerY :: Positioner a  ->  IO (Int)
positionerY = widgetY
positionerW :: Positioner a  ->  IO (Int)
positionerW = widgetW
positionerH :: Positioner a  ->  IO (Int)
positionerH = widgetH
positionerSetAlign :: Positioner a  -> AlignType ->  IO (())
positionerSetAlign = widgetSetAlign
positionerAlign :: Positioner a  ->  IO (AlignType)
positionerAlign = widgetAlign
positionerBox :: Positioner a  ->  IO (Boxtype)
positionerBox = widgetBox
positionerSetBox :: Positioner a  -> Boxtype ->  IO (())
positionerSetBox = widgetSetBox
positionerColor :: Positioner a  ->  IO (Color)
positionerColor = widgetColor
positionerSetColor :: Positioner a  -> Color ->  IO (())
positionerSetColor = widgetSetColor
positionerSetColorWithBgSel :: Positioner a  -> Color -> Color ->  IO (())
positionerSetColorWithBgSel = widgetSetColorWithBgSel
positionerSelectionColor :: Positioner a  ->  IO (Color)
positionerSelectionColor = widgetSelectionColor
positionerSetSelectionColor :: Positioner a  -> Color ->  IO (())
positionerSetSelectionColor = widgetSetSelectionColor
positionerLabel :: Positioner a  ->  IO (String)
positionerLabel = widgetLabel
positionerCopyLabel :: Positioner a  -> String ->  IO (())
positionerCopyLabel = widgetCopyLabel
positionerSetLabel :: Positioner a  -> String ->  IO (())
positionerSetLabel = widgetSetLabel
positionerLabeltype :: Positioner a  ->  IO (Labeltype)
positionerLabeltype = widgetLabeltype
positionerSetLabeltype :: Positioner a  -> Labeltype ->  IO (())
positionerSetLabeltype = widgetSetLabeltype
positionerLabelcolor :: Positioner a  ->  IO (Color)
positionerLabelcolor = widgetLabelcolor
positionerSetLabelcolor :: Positioner a  -> Color ->  IO (())
positionerSetLabelcolor = widgetSetLabelcolor
positionerLabelfont :: Positioner a  ->  IO (Font)
positionerLabelfont = widgetLabelfont
positionerSetLabelfont :: Positioner a  -> Font ->  IO (())
positionerSetLabelfont = widgetSetLabelfont
positionerLabelsize :: Positioner a  ->  IO (FontSize)
positionerLabelsize = widgetLabelsize
positionerSetLabelsize :: Positioner a  -> FontSize ->  IO (())
positionerSetLabelsize = widgetSetLabelsize
positionerImage :: Positioner a  ->  IO (Image ())
positionerImage = widgetImage
positionerSetImage :: Positioner a  -> Image b ->  IO (())
positionerSetImage = widgetSetImage
positionerDeimage :: Positioner a  ->  IO (Image ())
positionerDeimage = widgetDeimage
positionerSetDeimage :: Positioner a  -> Image b ->  IO (())
positionerSetDeimage = widgetSetDeimage
positionerTooltip :: Positioner a  ->  IO (String)
positionerTooltip = widgetTooltip
positionerCopyTooltip :: Positioner a  -> String ->  IO (())
positionerCopyTooltip = widgetCopyTooltip
positionerSetTooltip :: Positioner a  -> String ->  IO (())
positionerSetTooltip = widgetSetTooltip
positionerWhen :: Positioner a  ->  IO (When)
positionerWhen = widgetWhen
positionerSetWhen :: Positioner a  -> Word8 ->  IO (())
positionerSetWhen = widgetSetWhen
positionerVisible :: Positioner a  ->  IO (Int)
positionerVisible = widgetVisible
positionerVisibleR :: Positioner a  ->  IO (Int)
positionerVisibleR = widgetVisibleR
positionerShowSuper :: Positioner a  ->  IO (())
positionerShowSuper = widgetShowSuper
positionerShow :: Positioner a  ->  IO (())
positionerShow = widgetShow
positionerHideSuper :: Positioner a  ->  IO (())
positionerHideSuper = widgetHideSuper
positionerHide :: Positioner a  ->  IO (())
positionerHide = widgetHide
positionerSetVisible :: Positioner a  ->  IO (())
positionerSetVisible = widgetSetVisible
positionerClearVisible :: Positioner a  ->  IO (())
positionerClearVisible = widgetClearVisible
positionerActive :: Positioner a  ->  IO (Int)
positionerActive = widgetActive
positionerActiveR :: Positioner a  ->  IO (Int)
positionerActiveR = widgetActiveR
positionerActivate :: Positioner a  ->  IO (())
positionerActivate = widgetActivate
positionerDeactivate :: Positioner a  ->  IO (())
positionerDeactivate = widgetDeactivate
positionerOutput :: Positioner a  ->  IO (Int)
positionerOutput = widgetOutput
positionerSetOutput :: Positioner a  ->  IO (())
positionerSetOutput = widgetSetOutput
positionerClearOutput :: Positioner a  ->  IO (())
positionerClearOutput = widgetClearOutput
positionerTakesevents :: Positioner a  ->  IO (Int)
positionerTakesevents = widgetTakesevents
positionerSetChanged :: Positioner a  ->  IO (())
positionerSetChanged = widgetSetChanged
positionerClearChanged :: Positioner a  ->  IO (())
positionerClearChanged = widgetClearChanged
positionerTakeFocus :: Positioner a  ->  IO (Int)
positionerTakeFocus = widgetTakeFocus
positionerSetVisibleFocus :: Positioner a  ->  IO (())
positionerSetVisibleFocus = widgetSetVisibleFocus
positionerClearVisibleFocus :: Positioner a  ->  IO (())
positionerClearVisibleFocus = widgetClearVisibleFocus
positionerModifyVisibleFocus :: Positioner a  -> Int ->  IO (())
positionerModifyVisibleFocus = widgetModifyVisibleFocus
positionerVisibleFocus :: Positioner a  ->  IO (Int)
positionerVisibleFocus = widgetVisibleFocus
positionerContains :: Positioner a  -> Positioner a  ->  IO (Int)
positionerContains = widgetContains
positionerInside :: Positioner a  -> Positioner a  ->  IO (Int)
positionerInside = widgetInside
positionerRedraw :: Positioner a  ->  IO (())
positionerRedraw = widgetRedraw
positionerRedrawLabel :: Positioner a  ->  IO (())
positionerRedrawLabel = widgetRedrawLabel
positionerDamage :: Positioner a  ->  IO (Word8)
positionerDamage = widgetDamage
positionerClearDamageWithBitmask :: Positioner a  -> Word8 ->  IO (())
positionerClearDamageWithBitmask = widgetClearDamageWithBitmask
positionerClearDamage :: Positioner a  ->  IO (())
positionerClearDamage = widgetClearDamage
positionerDamageWithText :: Positioner a  -> Word8 ->  IO (())
positionerDamageWithText = widgetDamageWithText
positionerMeasureLabel :: Positioner a  -> IO (Size)
positionerMeasureLabel = widgetMeasureLabel
positionerWindow :: Positioner a  ->  IO (Window ())
positionerWindow = widgetWindow
positionerTopWindow :: Positioner a  ->  IO (Window ())
positionerTopWindow = widgetTopWindow
positionerTopWindowOffset :: Positioner a -> IO (Position)
positionerTopWindowOffset = widgetTopWindowOffset
positionerAsGlWindowSuper :: Positioner a  ->  IO (GlWindow ())
positionerAsGlWindowSuper = widgetAsGlWindowSuper
positionerAsGlWindow :: Positioner a  ->  IO (GlWindow ())
positionerAsGlWindow = widgetAsGlWindow
positionerResizeSuper :: Positioner a  -> Rectangle ->  IO (())
positionerResizeSuper = widgetResizeSuper
positionerResize :: Positioner a  -> Rectangle -> IO (())
positionerResize = widgetResize
positionerSetCallback :: Positioner a -> (Positioner b -> IO ()) -> IO (())
positionerSetCallback = widgetSetCallback
positionerDrawBox :: Positioner a -> IO ()
positionerDrawBox = widgetDrawBox
positionerDrawBoxWithBoxtype :: Positioner a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
positionerDrawBoxWithBoxtype = widgetDrawBoxWithBoxtype
positionerDrawBackdrop :: Positioner a -> IO ()
positionerDrawBackdrop = widgetDrawBackdrop
positionerDrawFocus :: Positioner a -> Maybe (Boxtype, Rectangle) -> IO ()
positionerDrawFocus = widgetDrawFocus
{#fun Fl_Positioner_handle as positionerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
positionerHandle :: Positioner a -> Event -> IO Int
positionerHandle positioner event = withObject positioner (\p -> positionerHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Positioner_set_xvalue as setXvalue' { id `Ptr ()',`Double' } -> `()' #}
positionerSetXvalue :: Positioner a  -> Double ->  IO ()
positionerSetXvalue positioner xvalue = withObject positioner $ \positionerPtr -> setXvalue' positionerPtr xvalue
{# fun unsafe Fl_Positioner_xvalue as xvalue' { id `Ptr ()' } -> `Double' #}
positionerXvalue :: Positioner a  ->  IO (Double)
positionerXvalue positioner = withObject positioner $ \positionerPtr -> xvalue' positionerPtr
{# fun unsafe Fl_Positioner_set_yvalue as setYvalue' { id `Ptr ()',`Double' } -> `()' #}
positionerSetYvalue :: Positioner a  -> Double ->  IO ()
positionerSetYvalue positioner yvalue = withObject positioner $ \positionerPtr -> setYvalue' positionerPtr yvalue
{# fun unsafe Fl_Positioner_yvalue as yvalue' { id `Ptr ()' } -> `Double' #}
positionerYvalue :: Positioner a  ->  IO (Double)
positionerYvalue positioner = withObject positioner $ \positionerPtr -> yvalue' positionerPtr
{# fun unsafe Fl_Positioner_set_xminimum as setXminimum' { id `Ptr ()',`Double' } -> `()' #}
positionerSetXminimum :: Positioner a  -> Double ->  IO ()
positionerSetXminimum positioner xminimum = withObject positioner $ \positionerPtr -> setXminimum' positionerPtr xminimum
{# fun unsafe Fl_Positioner_xminimum as xminimum' { id `Ptr ()' } -> `Double' #}
positionerXminimum :: Positioner a  ->  IO (Double)
positionerXminimum positioner = withObject positioner $ \positionerPtr -> xminimum' positionerPtr
{# fun unsafe Fl_Positioner_set_yminimum as setYminimum' { id `Ptr ()',`Double' } -> `()' #}
positionerSetYminimum :: Positioner a  -> Double ->  IO ()
positionerSetYminimum positioner yminimum = withObject positioner $ \positionerPtr -> setYminimum' positionerPtr yminimum
{# fun unsafe Fl_Positioner_yminimum as yminimum' { id `Ptr ()' } -> `Double' #}
positionerYminimum :: Positioner a  ->  IO (Double)
positionerYminimum positioner = withObject positioner $ \positionerPtr -> yminimum' positionerPtr
{# fun unsafe Fl_Positioner_set_xmaximum as setXmaximum' { id `Ptr ()',`Double' } -> `()' #}
positionerSetXmaximum :: Positioner a  -> Double ->  IO ()
positionerSetXmaximum positioner xmaximum = withObject positioner $ \positionerPtr -> setXmaximum' positionerPtr xmaximum
{# fun unsafe Fl_Positioner_xmaximum as xmaximum' { id `Ptr ()' } -> `Double' #}
positionerXmaximum :: Positioner a  ->  IO (Double)
positionerXmaximum positioner = withObject positioner $ \positionerPtr -> xmaximum' positionerPtr
{# fun unsafe Fl_Positioner_set_ymaximum as setYmaximum' { id `Ptr ()',`Double' } -> `()' #}
positionerSetYmaximum :: Positioner a  -> Double ->  IO ()
positionerSetYmaximum positioner ymaximum = withObject positioner $ \positionerPtr -> setYmaximum' positionerPtr ymaximum
{# fun unsafe Fl_Positioner_ymaximum as ymaximum' { id `Ptr ()' } -> `Double' #}
positionerYmaximum :: Positioner a  ->  IO (Double)
positionerYmaximum positioner = withObject positioner $ \positionerPtr -> ymaximum' positionerPtr
{# fun unsafe Fl_Positioner_xbounds as xbounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
positionerXbounds :: Positioner a  -> Double -> Double ->  IO ()
positionerXbounds positioner xstart xend = withObject positioner $ \positionerPtr -> xbounds' positionerPtr xstart xend
{# fun unsafe Fl_Positioner_ybounds as ybounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
positionerYbounds :: Positioner a  -> Double -> Double ->  IO ()
positionerYbounds positioner ystart yend = withObject positioner $ \positionerPtr -> ybounds' positionerPtr ystart yend
{# fun unsafe Fl_Positioner_xstep as xstep' { id `Ptr ()',`Double' } -> `()' #}
positionerXstep :: Positioner a  -> Double ->  IO ()
positionerXstep positioner xstep = withObject positioner $ \positionerPtr -> xstep' positionerPtr xstep
{# fun unsafe Fl_Positioner_ystep as ystep' { id `Ptr ()',`Double' } -> `()' #}
positionerYstep :: Positioner a  -> Double ->  IO ()
positionerYstep positioner ystep = withObject positioner $ \positionerPtr -> ystep' positionerPtr ystep
