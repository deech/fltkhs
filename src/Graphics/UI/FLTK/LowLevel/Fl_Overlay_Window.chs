module Graphics.UI.FLTK.LowLevel.Fl_Overlay_Window
  (
  )
where
#include "Fl_C.h"
#include "Fl_Overlay_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Double_Window
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)


overlayeWindowSetCallback :: OverlayWindow a -> (OverlayWindow b -> IO()) -> IO ()
overlayeWindowSetCallback = doubleWindowSetCallback
overlayeWindowParent :: OverlayWindow a -> IO (Group ())
overlayeWindowParent = doubleWindowParent
overlayeWindowSetParent :: OverlayWindow a -> Group b -> IO ()
overlayeWindowSetParent = doubleWindowSetParent
overlayeWindowType_ :: OverlayWindow a  ->  IO (Word8)
overlayeWindowType_ = doubleWindowType_
overlayWindowSetType :: OverlayWindow a  -> Word8 ->  IO (())
overlayWindowSetType = doubleWindowSetType
overlayWindowDrawLabel :: OverlayWindow a  -> Maybe (Rectangle,AlignType)->  IO (())
overlayWindowDrawLabel = doubleWindowDrawLabel
overlayWindowX :: OverlayWindow a  ->  IO (Int)
overlayWindowX = doubleWindowX
overlayWindowY :: OverlayWindow a  ->  IO (Int)
overlayWindowY = doubleWindowY
overlayWindowW :: OverlayWindow a  ->  IO (Int)
overlayWindowW = doubleWindowW
overlayWindowH :: OverlayWindow a  ->  IO (Int)
overlayWindowH = doubleWindowH
overlayWindowSetAlign :: OverlayWindow a  -> AlignType ->  IO (())
overlayWindowSetAlign = doubleWindowSetAlign
overlayWindowAlign :: OverlayWindow a  ->  IO (AlignType)
overlayWindowAlign = doubleWindowAlign
overlayWindowBox :: OverlayWindow a  ->  IO (Boxtype)
overlayWindowBox = doubleWindowBox
overlayWindowSetBox :: OverlayWindow a  -> Boxtype ->  IO (())
overlayWindowSetBox = doubleWindowSetBox
overlayWindowColor :: OverlayWindow a  ->  IO (Color)
overlayWindowColor = doubleWindowColor
overlayWindowSetColor :: OverlayWindow a  -> Color ->  IO (())
overlayWindowSetColor = doubleWindowSetColor
overlayWindowSetColorWithBgSel :: OverlayWindow a  -> Color -> Color ->  IO (())
overlayWindowSetColorWithBgSel = doubleWindowSetColorWithBgSel
overlayWindowSelectionColor :: OverlayWindow a  ->  IO (Color)
overlayWindowSelectionColor = doubleWindowSelectionColor
overlayWindowSetSelectionColor :: OverlayWindow a  -> Color ->  IO (())
overlayWindowSetSelectionColor = doubleWindowSetSelectionColor
overlayWindowLabeltype :: OverlayWindow a  ->  IO (Labeltype)
overlayWindowLabeltype = doubleWindowLabeltype
overlayWindowSetLabeltype :: OverlayWindow a  -> Labeltype ->  IO (())
overlayWindowSetLabeltype = doubleWindowSetLabeltype
overlayWindowLabelcolor :: OverlayWindow a  ->  IO (Color)
overlayWindowLabelcolor = doubleWindowLabelcolor
overlayWindowSetLabelcolor :: OverlayWindow a  -> Color ->  IO (())
overlayWindowSetLabelcolor = doubleWindowSetLabelcolor
overlayWindowLabelfont :: OverlayWindow a  ->  IO (Font)
overlayWindowLabelfont = doubleWindowLabelfont
overlayWindowSetLabelfont :: OverlayWindow a  -> Font ->  IO (())
overlayWindowSetLabelfont = doubleWindowSetLabelfont
overlayWindowLabelsize :: OverlayWindow a  ->  IO (FontSize)
overlayWindowLabelsize = doubleWindowLabelsize
overlayWindowSetLabelsize :: OverlayWindow a  -> FontSize ->  IO (())
overlayWindowSetLabelsize = doubleWindowSetLabelsize
overlayWindowImage :: OverlayWindow a  ->  IO (Image ())
overlayWindowImage = doubleWindowImage
overlayWindowSetImage :: OverlayWindow a  -> Image b ->  IO (())
overlayWindowSetImage = doubleWindowSetImage
overlayWindowDeimage :: OverlayWindow a  ->  IO (Image ())
overlayWindowDeimage = doubleWindowDeimage
overlayWindowSetDeimage :: OverlayWindow a  -> Image b ->  IO (())
overlayWindowSetDeimage = doubleWindowSetDeimage
overlayWindowTooltip :: OverlayWindow a  ->  IO (String)
overlayWindowTooltip = doubleWindowTooltip
overlayWindowCopyTooltip :: OverlayWindow a  -> String ->  IO (())
overlayWindowCopyTooltip = doubleWindowCopyTooltip
overlayWindowSetTooltip :: OverlayWindow a  -> String ->  IO (())
overlayWindowSetTooltip = doubleWindowSetTooltip
overlayWindowWhen :: OverlayWindow a  ->  IO (When)
overlayWindowWhen = doubleWindowWhen
overlayWindowSetWhen :: OverlayWindow a  -> Word8 ->  IO (())
overlayWindowSetWhen = doubleWindowSetWhen
overlayWindowVisible :: OverlayWindow a  ->  IO (Int)
overlayWindowVisible = doubleWindowVisible
overlayWindowVisibleR :: OverlayWindow a  ->  IO (Int)
overlayWindowVisibleR = doubleWindowVisibleR
overlayWindowSetVisible :: OverlayWindow a  ->  IO (())
overlayWindowSetVisible = doubleWindowSetVisible
overlayWindowClearVisible :: OverlayWindow a  ->  IO (())
overlayWindowClearVisible = doubleWindowClearVisible
overlayWindowActive :: OverlayWindow a  ->  IO (Int)
overlayWindowActive = doubleWindowActive
overlayWindowActiveR :: OverlayWindow a  ->  IO (Int)
overlayWindowActiveR = doubleWindowActiveR
overlayWindowActivate :: OverlayWindow a  ->  IO (())
overlayWindowActivate = doubleWindowActivate
overlayWindowDeactivate :: OverlayWindow a  ->  IO (())
overlayWindowDeactivate = doubleWindowDeactivate
overlayWindowOutput :: OverlayWindow a  ->  IO (Int)
overlayWindowOutput = doubleWindowOutput
overlayWindowSetOutput :: OverlayWindow a  ->  IO (())
overlayWindowSetOutput = doubleWindowSetOutput
overlayWindowClearOutput :: OverlayWindow a  ->  IO (())
overlayWindowClearOutput = doubleWindowClearOutput
overlayWindowTakesevents :: OverlayWindow a  ->  IO (Int)
overlayWindowTakesevents = doubleWindowTakesevents
overlayWindowSetChanged :: OverlayWindow a  ->  IO (())
overlayWindowSetChanged = doubleWindowSetChanged
overlayWindowClearChanged :: OverlayWindow a  ->  IO (())
overlayWindowClearChanged = doubleWindowClearChanged
overlayWindowTakeFocus :: OverlayWindow a  ->  IO (Int)
overlayWindowTakeFocus = doubleWindowTakeFocus
overlayWindowSetVisibleFocus :: OverlayWindow a  ->  IO (())
overlayWindowSetVisibleFocus = doubleWindowSetVisibleFocus
overlayWindowClearVisibleFocus :: OverlayWindow a  ->  IO (())
overlayWindowClearVisibleFocus = doubleWindowClearVisibleFocus
overlayWindowModifyVisibleFocus :: OverlayWindow a  -> Int ->  IO (())
overlayWindowModifyVisibleFocus = doubleWindowModifyVisibleFocus
overlayWindowVisibleFocus :: OverlayWindow a  ->  IO (Int)
overlayWindowVisibleFocus = doubleWindowVisibleFocus
overlayWindowContains :: OverlayWindow a  -> Group b  ->  IO (Int)
overlayWindowContains = doubleWindowContains
overlayWindowInside :: OverlayWindow a  -> Group b  ->  IO (Int)
overlayWindowInside = doubleWindowInside
overlayWindowRedraw :: OverlayWindow a  ->  IO (())
overlayWindowRedraw = doubleWindowRedraw
overlayWindowRedrawLabel :: OverlayWindow a  ->  IO (())
overlayWindowRedrawLabel = doubleWindowRedrawLabel
overlayWindowDamage :: OverlayWindow a  ->  IO (Word8)
overlayWindowDamage = doubleWindowDamage
overlayWindowClearDamageWithBitmask :: OverlayWindow a  -> Word8 ->  IO (())
overlayWindowClearDamageWithBitmask = doubleWindowClearDamageWithBitmask
overlayWindowClearDamage :: OverlayWindow a  ->  IO (())
overlayWindowClearDamage = doubleWindowClearDamage
overlayWindowDamageWithText :: OverlayWindow a  -> Word8 ->  IO (())
overlayWindowDamageWithText = doubleWindowDamageWithText
overlayWindowDamageInsideWidget :: OverlayWindow a  -> Word8 -> Rectangle ->  IO (())
overlayWindowDamageInsideWidget = doubleWindowDamageInsideWidget
overlayWindowMeasureLabel :: OverlayWindow a  -> IO (Size)
overlayWindowMeasureLabel = doubleWindowMeasureLabel
overlayWindowWindow :: OverlayWindow a  ->  IO (Window ())
overlayWindowWindow = doubleWindowWindow
overlayWindowTopWindow :: OverlayWindow a  ->  IO (Window ())
overlayWindowTopWindow = doubleWindowTopWindow
overlayWindowTopWindowOffset :: OverlayWindow a -> IO (Position)
overlayWindowTopWindowOffset = doubleWindowTopWindowOffset
overlayWindowBegin :: OverlayWindow a  ->  IO (())
overlayWindowBegin = doubleWindowBegin
overlayWindowEnd :: OverlayWindow a  ->  IO (())
overlayWindowEnd = doubleWindowEnd
overlayWindowFind :: OverlayWindow a -> Widget b  ->  IO (Int)
overlayWindowFind = doubleWindowFind
overlayWindowAdd :: OverlayWindow a -> Widget b  ->  IO (())
overlayWindowAdd = doubleWindowAdd
overlayWindowInsert :: OverlayWindow a -> Widget b  -> Int ->  IO (())
overlayWindowInsert = doubleWindowInsert
overlayWindowRemoveIndex :: OverlayWindow a  -> Int ->  IO (())
overlayWindowRemoveIndex = doubleWindowRemoveIndex
overlayWindowRemoveWidget :: OverlayWindow a -> Widget b  ->  IO (())
overlayWindowRemoveWidget = doubleWindowRemoveWidget
overlayWindowClear :: OverlayWindow a  ->  IO (())
overlayWindowClear = doubleWindowClear
overlayWindowSetResizable :: OverlayWindow a -> Widget b  ->  IO (())
overlayWindowSetResizable = doubleWindowSetResizable
overlayWindowResizable :: OverlayWindow a  ->  IO (Widget ())
overlayWindowResizable = doubleWindowResizable
overlayWindowAddResizable :: OverlayWindow a -> Widget b  ->  IO (())
overlayWindowAddResizable = doubleWindowAddResizable
overlayWindowInitSizes :: OverlayWindow a  ->  IO (())
overlayWindowInitSizes = doubleWindowInitSizes
overlayWindowChildren :: OverlayWindow a  ->  IO (Int)
overlayWindowChildren = doubleWindowChildren
overlayWindowSetClipChildren :: OverlayWindow a  -> Int ->  IO (())
overlayWindowSetClipChildren = doubleWindowSetClipChildren
overlayWindowClipChildren :: OverlayWindow a  ->  IO (Int)
overlayWindowClipChildren = doubleWindowClipChildren
overlayWindowFocus :: OverlayWindow a -> Widget b  ->  IO (())
overlayWindowFocus = doubleWindowFocus
overlayWindowDdfdesignKludge :: OverlayWindow a  ->  IO (Widget ())
overlayWindowDdfdesignKludge = doubleWindowDdfdesignKludge
overlayWindowInsertWithBefore :: OverlayWindow a -> Widget b  -> Widget c  ->  IO (())
overlayWindowInsertWithBefore = doubleWindowInsertWithBefore
overlayWindowArray :: OverlayWindow a  ->  IO [(Widget ())]
overlayWindowArray = doubleWindowArray
overlayWindowChild :: OverlayWindow a  -> Int ->  IO (Widget ())
overlayWindowChild = doubleWindowChild
overlayWindowChanged :: OverlayWindow a  ->  IO (Int)
overlayWindowChanged = doubleWindowChanged
overlayWindowFullscreen :: OverlayWindow a  ->  IO (())
overlayWindowFullscreen = doubleWindowFullscreen
overlayWindowFullscreenOff :: OverlayWindow a -> Maybe Rectangle ->  IO (())
overlayWindowFullscreenOff = doubleWindowFullscreenOff
overlayWindowSetBorder :: OverlayWindow a  -> Bool ->  IO (())
overlayWindowSetBorder = doubleWindowSetBorder
overlayWindowClearBorder :: OverlayWindow a  ->  IO (())
overlayWindowClearBorder = doubleWindowClearBorder
overlayWindowBorder :: OverlayWindow a  ->  IO (Bool)
overlayWindowBorder = doubleWindowBorder
overlayWindowSetOverride :: OverlayWindow a  ->  IO (())
overlayWindowSetOverride = doubleWindowSetOverride
overlayWindowOverride :: OverlayWindow a  ->  IO (Bool)
overlayWindowOverride = doubleWindowOverride
overlayWindowSetModal :: OverlayWindow a  ->  IO (())
overlayWindowSetModal = doubleWindowSetModal
overlayWindowModal :: OverlayWindow a  ->  IO (Bool)
overlayWindowModal = doubleWindowModal
overlayWindowSetNonModal :: OverlayWindow a  ->  IO (())
overlayWindowSetNonModal = doubleWindowSetNonModal
overlayWindowNonModal :: OverlayWindow a  ->  IO (Bool)
overlayWindowNonModal = doubleWindowNonModal
overlayWindowSetMenuWindow :: OverlayWindow a  ->  IO (())
overlayWindowSetMenuWindow = doubleWindowSetMenuWindow
overlayWindowMenuWindow :: OverlayWindow a  ->  IO (Bool)
overlayWindowMenuWindow = doubleWindowMenuWindow
overlayWindowSetTooltipWindow :: OverlayWindow a  ->  IO (())
overlayWindowSetTooltipWindow = doubleWindowSetTooltipWindow
overlayWindowTooltipWindow :: OverlayWindow a  ->  IO (Bool)
overlayWindowTooltipWindow = doubleWindowTooltipWindow
overlayWindowHotSpot :: OverlayWindow a -> PositionSpec b -> Maybe Bool -> IO ()
overlayWindowHotSpot = doubleWindowHotSpot
overlayWindowFreePosition :: OverlayWindow a  ->  IO (())
overlayWindowFreePosition = doubleWindowFreePosition
overlayWindowSizeRange :: OverlayWindow a  -> Int -> Int -> IO (())
overlayWindowSizeRange = doubleWindowSizeRange
overlayWindowSizeRangeWithArgs :: OverlayWindow a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
overlayWindowSizeRangeWithArgs = doubleWindowSizeRangeWithArgs
overlayWindowLabel :: OverlayWindow a  ->  IO (String)
overlayWindowLabel = doubleWindowLabel
overlayWindowIconlabel :: OverlayWindow a  ->  IO (String)
overlayWindowIconlabel = doubleWindowIconlabel
overlayWindowSetLabel :: OverlayWindow a  -> String ->  IO (())
overlayWindowSetLabel = doubleWindowSetLabel
overlayWindowSetIconlabel :: OverlayWindow a  -> String ->  IO (())
overlayWindowSetIconlabel = doubleWindowSetIconlabel
overlayWindowSetLabelWithIconlabel :: OverlayWindow a  -> String -> String ->  IO (())
overlayWindowSetLabelWithIconlabel = doubleWindowSetLabelWithIconlabel
overlayWindowCopyLabel :: OverlayWindow a  -> String ->  IO (())
overlayWindowCopyLabel = doubleWindowCopyLabel
overlayWindowSetDefaultXclass :: String ->  IO (())
overlayWindowSetDefaultXclass = doubleWindowSetDefaultXclass
overlayWindowDefaultXclass ::  IO (String)
overlayWindowDefaultXclass = doubleWindowDefaultXclass
overlayWindowXclass :: OverlayWindow a  ->  IO (String)
overlayWindowXclass = doubleWindowXclass
overlayWindowSetXclass :: OverlayWindow a  -> String ->  IO (())
overlayWindowSetXclass = doubleWindowSetXclass
overlayWindowIcon :: OverlayWindow a  ->  IO (Ptr ())
overlayWindowIcon = doubleWindowIcon
overlayWindowSetIcon :: OverlayWindow a  -> Ptr () ->  IO (())
overlayWindowSetIcon = doubleWindowSetIcon
overlayWindowShown :: OverlayWindow a  ->  IO (Bool)
overlayWindowShown = doubleWindowShown
overlayWindowIconize :: OverlayWindow a  ->  IO (())
overlayWindowIconize = doubleWindowIconize
overlayWindowXRoot :: OverlayWindow a  ->  IO (Int)
overlayWindowXRoot = doubleWindowXRoot
overlayWindowYRoot :: OverlayWindow a  ->  IO (Int)
overlayWindowYRoot = doubleWindowYRoot
overlayWindowCurrent ::  IO (Ptr ())
overlayWindowCurrent = doubleWindowCurrent
overlayWindowMakeCurrent :: OverlayWindow a  ->  IO (())
overlayWindowMakeCurrent = doubleWindowMakeCurrent
overlayWindowSetCursor :: OverlayWindow a -> CursorType -> IO ()
overlayWindowSetCursor = doubleWindowSetCursor
overlayWindowSetCursorWithFgBg :: OverlayWindow a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
overlayWindowSetCursorWithFgBg = doubleWindowSetCursorWithFgBg
overlayWindowSetDefaultCursor :: OverlayWindow a  -> CursorType ->  IO (())
overlayWindowSetDefaultCursor = doubleWindowSetDefaultCursor
overlayWindowDecoratedW :: OverlayWindow a  ->  IO (Int)
overlayWindowDecoratedW = doubleWindowDecoratedW
overlayWindowDecoratedH :: OverlayWindow a  ->  IO (Int)
overlayWindowDecoratedH = doubleWindowDecoratedH
