{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Progress
    (
     -- * Constructor
     progressNew,
     progressDestroy,
     -- * Fl_Progress specific
     progressParent,
     progressSetParent,
     progressType_,
     progressSetType,
     progressDrawLabel,
     progressX,
     progressY,
     progressW,
     progressH,
     progressSetAlign,
     progressAlign,
     progressBox,
     progressSetBox,
     progressColor,
     progressSetColor,
     progressSetColorWithBgSel,
     progressSelectionColor,
     progressSetSelectionColor,
     progressLabel,
     progressCopyLabel,
     progressSetLabel,
     progressLabeltype,
     progressSetLabeltype,
     progressLabelcolor,
     progressSetLabelcolor,
     progressLabelfont,
     progressSetLabelfont,
     progressLabelsize,
     progressSetLabelsize,
     progressImage,
     progressSetImage,
     progressDeimage,
     progressSetDeimage,
     progressTooltip,
     progressCopyTooltip,
     progressSetTooltip,
     progressWhen,
     progressSetWhen,
     progressVisible,
     progressVisibleR,
     progressShowSuper,
     progressShow,
     progressHideSuper,
     progressHide,
     progressSetVisible,
     progressClearVisible,
     progressActive,
     progressActiveR,
     progressActivate,
     progressDeactivate,
     progressOutput,
     progressSetOutput,
     progressClearOutput,
     progressTakesevents,
     progressSetChanged,
     progressClearChanged,
     progressTakeFocus,
     progressSetVisibleFocus,
     progressClearVisibleFocus,
     progressModifyVisibleFocus,
     progressVisibleFocus,
     progressContains,
     progressInside,
     progressRedraw,
     progressRedrawLabel,
     progressDamage,
     progressClearDamageWithBitmask,
     progressClearDamage,
     progressDamageWithText,
     progressMeasureLabel,
     progressWindow,
     progressTopWindow,
     progressTopWindowOffset,
     progressAsGlWindowSuper,
     progressAsGlWindow,
     progressResizeSuper,
     progressResize,
     progressSetCallback,
     progressDrawBox,
     progressDrawBoxWithBoxtype,
     progressDrawBackdrop,
     progressDrawFocus,
     progressValue,
     progressSetValue,
     progressHandle,
     progressSetMaximum,
     progressMaximum,
     progressSetMinimum,
     progressMinimum
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ProgressC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Progress_New as progressNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Progress_New_WithLabel as progressNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
progressNew :: Rectangle -> Maybe String -> IO (Progress ())
progressNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> progressNew' x_pos y_pos width height >>=
                             toObject
        Just l -> progressNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Progress_Destroy as progressDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
progressDestroy :: Progress a -> IO ()
progressDestroy win = swapObject win $ \winPtr -> do
                                        progressDestroy' winPtr
                                        return nullPtr

progressParent :: Progress a -> IO (Group ())
progressParent = widgetParent
progressSetParent :: Progress a -> Group b -> IO ()
progressSetParent = widgetSetParent
progressType_ :: Progress a  ->  IO (Word8)
progressType_ = widgetType_
progressSetType :: Progress a  -> Word8 ->  IO (())
progressSetType = widgetSetType
progressDrawLabel :: Progress a  -> Maybe (Rectangle,AlignType)->  IO (())
progressDrawLabel = widgetDrawLabel
progressX :: Progress a  ->  IO (Int)
progressX = widgetX
progressY :: Progress a  ->  IO (Int)
progressY = widgetY
progressW :: Progress a  ->  IO (Int)
progressW = widgetW
progressH :: Progress a  ->  IO (Int)
progressH = widgetH
progressSetAlign :: Progress a  -> AlignType ->  IO (())
progressSetAlign = widgetSetAlign
progressAlign :: Progress a  ->  IO (AlignType)
progressAlign = widgetAlign
progressBox :: Progress a  ->  IO (Boxtype)
progressBox = widgetBox
progressSetBox :: Progress a  -> Boxtype ->  IO (())
progressSetBox = widgetSetBox
progressColor :: Progress a  ->  IO (Color)
progressColor = widgetColor
progressSetColor :: Progress a  -> Color ->  IO (())
progressSetColor = widgetSetColor
progressSetColorWithBgSel :: Progress a  -> Color -> Color ->  IO (())
progressSetColorWithBgSel = widgetSetColorWithBgSel
progressSelectionColor :: Progress a  ->  IO (Color)
progressSelectionColor = widgetSelectionColor
progressSetSelectionColor :: Progress a  -> Color ->  IO (())
progressSetSelectionColor = widgetSetSelectionColor
progressLabel :: Progress a  ->  IO (String)
progressLabel = widgetLabel
progressCopyLabel :: Progress a  -> String ->  IO (())
progressCopyLabel = widgetCopyLabel
progressSetLabel :: Progress a  -> String ->  IO (())
progressSetLabel = widgetSetLabel
progressLabeltype :: Progress a  ->  IO (Labeltype)
progressLabeltype = widgetLabeltype
progressSetLabeltype :: Progress a  -> Labeltype ->  IO (())
progressSetLabeltype = widgetSetLabeltype
progressLabelcolor :: Progress a  ->  IO (Color)
progressLabelcolor = widgetLabelcolor
progressSetLabelcolor :: Progress a  -> Color ->  IO (())
progressSetLabelcolor = widgetSetLabelcolor
progressLabelfont :: Progress a  ->  IO (Font)
progressLabelfont = widgetLabelfont
progressSetLabelfont :: Progress a  -> Font ->  IO (())
progressSetLabelfont = widgetSetLabelfont
progressLabelsize :: Progress a  ->  IO (FontSize)
progressLabelsize = widgetLabelsize
progressSetLabelsize :: Progress a  -> FontSize ->  IO (())
progressSetLabelsize = widgetSetLabelsize
progressImage :: Progress a  ->  IO (Image ())
progressImage = widgetImage
progressSetImage :: Progress a  -> Image b ->  IO (())
progressSetImage = widgetSetImage
progressDeimage :: Progress a  ->  IO (Image ())
progressDeimage = widgetDeimage
progressSetDeimage :: Progress a  -> Image b ->  IO (())
progressSetDeimage = widgetSetDeimage
progressTooltip :: Progress a  ->  IO (String)
progressTooltip = widgetTooltip
progressCopyTooltip :: Progress a  -> String ->  IO (())
progressCopyTooltip = widgetCopyTooltip
progressSetTooltip :: Progress a  -> String ->  IO (())
progressSetTooltip = widgetSetTooltip
progressWhen :: Progress a  ->  IO (When)
progressWhen = widgetWhen
progressSetWhen :: Progress a  -> Word8 ->  IO (())
progressSetWhen = widgetSetWhen
progressVisible :: Progress a  ->  IO (Int)
progressVisible = widgetVisible
progressVisibleR :: Progress a  ->  IO (Int)
progressVisibleR = widgetVisibleR
progressShowSuper :: Progress a  ->  IO (())
progressShowSuper = widgetShowSuper
progressShow :: Progress a  ->  IO (())
progressShow = widgetShow
progressHideSuper :: Progress a  ->  IO (())
progressHideSuper = widgetHideSuper
progressHide :: Progress a  ->  IO (())
progressHide = widgetHide
progressSetVisible :: Progress a  ->  IO (())
progressSetVisible = widgetSetVisible
progressClearVisible :: Progress a  ->  IO (())
progressClearVisible = widgetClearVisible
progressActive :: Progress a  ->  IO (Int)
progressActive = widgetActive
progressActiveR :: Progress a  ->  IO (Int)
progressActiveR = widgetActiveR
progressActivate :: Progress a  ->  IO (())
progressActivate = widgetActivate
progressDeactivate :: Progress a  ->  IO (())
progressDeactivate = widgetDeactivate
progressOutput :: Progress a  ->  IO (Int)
progressOutput = widgetOutput
progressSetOutput :: Progress a  ->  IO (())
progressSetOutput = widgetSetOutput
progressClearOutput :: Progress a  ->  IO (())
progressClearOutput = widgetClearOutput
progressTakesevents :: Progress a  ->  IO (Int)
progressTakesevents = widgetTakesevents
progressSetChanged :: Progress a  ->  IO (())
progressSetChanged = widgetSetChanged
progressClearChanged :: Progress a  ->  IO (())
progressClearChanged = widgetClearChanged
progressTakeFocus :: Progress a  ->  IO (Int)
progressTakeFocus = widgetTakeFocus
progressSetVisibleFocus :: Progress a  ->  IO (())
progressSetVisibleFocus = widgetSetVisibleFocus
progressClearVisibleFocus :: Progress a  ->  IO (())
progressClearVisibleFocus = widgetClearVisibleFocus
progressModifyVisibleFocus :: Progress a  -> Int ->  IO (())
progressModifyVisibleFocus = widgetModifyVisibleFocus
progressVisibleFocus :: Progress a  ->  IO (Int)
progressVisibleFocus = widgetVisibleFocus
progressContains :: Progress a  -> Progress a  ->  IO (Int)
progressContains = widgetContains
progressInside :: Progress a  -> Progress a  ->  IO (Int)
progressInside = widgetInside
progressRedraw :: Progress a  ->  IO (())
progressRedraw = widgetRedraw
progressRedrawLabel :: Progress a  ->  IO (())
progressRedrawLabel = widgetRedrawLabel
progressDamage :: Progress a  ->  IO (Word8)
progressDamage = widgetDamage
progressClearDamageWithBitmask :: Progress a  -> Word8 ->  IO (())
progressClearDamageWithBitmask = widgetClearDamageWithBitmask
progressClearDamage :: Progress a  ->  IO (())
progressClearDamage = widgetClearDamage
progressDamageWithText :: Progress a  -> Word8 ->  IO (())
progressDamageWithText = widgetDamageWithText
progressMeasureLabel :: Progress a  -> IO (Size)
progressMeasureLabel = widgetMeasureLabel
progressWindow :: Progress a  ->  IO (Window ())
progressWindow = widgetWindow
progressTopWindow :: Progress a  ->  IO (Window ())
progressTopWindow = widgetTopWindow
progressTopWindowOffset :: Progress a -> IO (Position)
progressTopWindowOffset = widgetTopWindowOffset
progressAsGlWindowSuper :: Progress a  ->  IO (GlWindow ())
progressAsGlWindowSuper = widgetAsGlWindowSuper
progressAsGlWindow :: Progress a  ->  IO (GlWindow ())
progressAsGlWindow = widgetAsGlWindow
progressResizeSuper :: Progress a  -> Rectangle ->  IO (())
progressResizeSuper = widgetResizeSuper
progressResize :: Progress a  -> Rectangle -> IO (())
progressResize = widgetResize
progressSetCallback :: Progress a -> (Progress b -> IO ()) -> IO (())
progressSetCallback = widgetSetCallback
progressDrawBox :: Progress a -> IO ()
progressDrawBox = widgetDrawBox
progressDrawBoxWithBoxtype :: Progress a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
progressDrawBoxWithBoxtype = widgetDrawBoxWithBoxtype
progressDrawBackdrop :: Progress a -> IO ()
progressDrawBackdrop = widgetDrawBackdrop
progressDrawFocus :: Progress a -> Maybe (Boxtype, Rectangle) -> IO ()
progressDrawFocus = widgetDrawFocus
progressHandle :: Progress a -> Event -> IO Int
progressHandle = widgetHandle
{# fun unsafe Fl_Progress_set_maximum as setMaximum' { id `Ptr ()',`Float' } -> `()' #}
progressSetMaximum :: Progress a  -> Float ->  IO ()
progressSetMaximum progress v = withObject progress $ \progressPtr -> setMaximum' progressPtr v
{# fun unsafe Fl_Progress_maximum as maximum' { id `Ptr ()' } -> `Float' #}
progressMaximum :: Progress a  ->  IO (Float)
progressMaximum progress = withObject progress $ \progressPtr -> maximum' progressPtr
{# fun unsafe Fl_Progress_set_minimum as setMinimum' { id `Ptr ()',`Float' } -> `()' #}
progressSetMinimum :: Progress a  -> Float ->  IO ()
progressSetMinimum progress v = withObject progress $ \progressPtr -> setMinimum' progressPtr v
{# fun unsafe Fl_Progress_minimum as minimum' { id `Ptr ()' } -> `Float' #}
progressMinimum :: Progress a  ->  IO (Float)
progressMinimum progress = withObject progress $ \progressPtr -> minimum' progressPtr
{# fun unsafe Fl_Progress_set_value as setValue' { id `Ptr ()',`Float' } -> `()' #}
progressSetValue :: Progress a  -> Float ->  IO ()
progressSetValue progress v = withObject progress $ \progressPtr -> setValue' progressPtr v
{# fun unsafe Fl_Progress_value as value' { id `Ptr ()' } -> `Float' #}
progressValue :: Progress a  ->  IO (Float)
progressValue progress = withObject progress $ \progressPtr -> value' progressPtr