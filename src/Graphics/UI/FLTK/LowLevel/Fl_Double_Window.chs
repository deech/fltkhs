module Graphics.UI.FLTK.LowLevel.Fl_Double_Window
  (
    DoubleWindowFuncs(..),
    defaultDoubleWindowFuncs,
    doubleWindowNew,
    doubleWindowDestroy,
    doubleWindowDrawSuper,
    doubleWindowHandleSuper,
    doubleWindowResizeSuper,
    doubleWindowShowSuper,
    doubleWindowHideSuper,
    doubleWindowFlushSuper,
    doubleWindowAsWindowSuper,
    doubleWindowAsGlWindowSuper,
    doubleWindowAsGroupSuper,
    doubleWindowShow,
    doubleWindowHandle,
    doubleWindowResize,
    doubleWindowAsWindow,
    doubleWindowAsGlWindow,
    doubleWindowAsGroup,
    doubleWindowSetCallback,
    doubleWindowParent,
    doubleWindowSetParent,
    doubleWindowType_,
    doubleWindowSetType,
    doubleWindowDrawLabel,
    doubleWindowX,
    doubleWindowY,
    doubleWindowW,
    doubleWindowH,
    doubleWindowSetAlign,
    doubleWindowAlign,
    doubleWindowBox,
    doubleWindowSetBox,
    doubleWindowColor,
    doubleWindowSetColor,
    doubleWindowSetColorWithBgSel,
    doubleWindowSelectionColor,
    doubleWindowSetSelectionColor,
    doubleWindowLabeltype,
    doubleWindowSetLabeltype,
    doubleWindowLabelcolor,
    doubleWindowSetLabelcolor,
    doubleWindowLabelfont,
    doubleWindowSetLabelfont,
    doubleWindowLabelsize,
    doubleWindowSetLabelsize,
    doubleWindowImage,
    doubleWindowSetImage,
    doubleWindowDeimage,
    doubleWindowSetDeimage,
    doubleWindowTooltip,
    doubleWindowCopyTooltip,
    doubleWindowSetTooltip,
    doubleWindowWhen,
    doubleWindowSetWhen,
    doubleWindowVisible,
    doubleWindowVisibleR,
    doubleWindowHide,
    doubleWindowSetVisible,
    doubleWindowClearVisible,
    doubleWindowActive,
    doubleWindowActiveR,
    doubleWindowActivate,
    doubleWindowDeactivate,
    doubleWindowOutput,
    doubleWindowSetOutput,
    doubleWindowClearOutput,
    doubleWindowTakesevents,
    doubleWindowSetChanged,
    doubleWindowClearChanged,
    doubleWindowTakeFocus,
    doubleWindowSetVisibleFocus,
    doubleWindowClearVisibleFocus,
    doubleWindowModifyVisibleFocus,
    doubleWindowVisibleFocus,
    doubleWindowContains,
    doubleWindowInside,
    doubleWindowRedraw,
    doubleWindowRedrawLabel,
    doubleWindowDamage,
    doubleWindowClearDamageWithBitmask,
    doubleWindowClearDamage,
    doubleWindowDamageWithText,
    doubleWindowDamageInsideWidget,
    doubleWindowMeasureLabel,
    doubleWindowWindow,
    doubleWindowTopWindow,
    doubleWindowTopWindowOffset,
    doubleWindowBegin,
    doubleWindowEnd,
    doubleWindowFind,
    doubleWindowAdd,
    doubleWindowInsert,
    doubleWindowRemoveIndex,
    doubleWindowRemoveWidget,
    doubleWindowClear,
    doubleWindowSetResizable,
    doubleWindowResizable,
    doubleWindowAddResizable,
    doubleWindowInitSizes,
    doubleWindowChildren,
    doubleWindowSetClipChildren,
    doubleWindowClipChildren,
    doubleWindowFocus,
    doubleWindowDdfdesignKludge,
    doubleWindowInsertWithBefore,
    doubleWindowArray,
    doubleWindowChild,
    doubleWindowChanged,
    doubleWindowFullscreen,
    doubleWindowFullscreenOff,
    doubleWindowSetBorder,
    doubleWindowClearBorder,
    doubleWindowBorder,
    doubleWindowSetOverride,
    doubleWindowOverride,
    doubleWindowSetModal,
    doubleWindowModal,
    doubleWindowSetNonModal,
    doubleWindowNonModal,
    doubleWindowSetMenuWindow,
    doubleWindowMenuWindow,
    doubleWindowSetTooltipWindow,
    doubleWindowTooltipWindow,
    doubleWindowHotSpot,
    doubleWindowFreePosition,
    doubleWindowSizeRange,
    doubleWindowSizeRangeWithArgs,
    doubleWindowLabel,
    doubleWindowIconlabel,
    doubleWindowSetLabel,
    doubleWindowSetIconlabel,
    doubleWindowSetLabelWithIconlabel,
    doubleWindowCopyLabel,
    doubleWindowSetDefaultXclass,
    doubleWindowDefaultXclass,
    doubleWindowXclass,
    doubleWindowSetXclass,
    doubleWindowIcon,
    doubleWindowSetIcon,
    doubleWindowShown,
    doubleWindowIconize,
    doubleWindowXRoot,
    doubleWindowYRoot,
    doubleWindowCurrent,
    doubleWindowMakeCurrent,
    doubleWindowSetCursor,
    doubleWindowSetCursorWithFgBg,
    doubleWindowSetDefaultCursor,
    doubleWindowDecoratedW,
    doubleWindowDecoratedH
  )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

data DoubleWindowFuncs a =
    DoubleWindowFuncs
    {
     doubleWindowDrawOverride       :: Maybe (WidgetCallback a)
    ,doubleWindowHandleOverride     :: Maybe (WidgetEventHandler a)
    ,doubleWindowResizeOverride     :: Maybe (RectangleF a)
    ,doubleWindowShowOverride       :: Maybe (WidgetCallback a)
    ,doubleWindowHideOverride       :: Maybe (WidgetCallback a)
    ,doubleWindowAsWindowOverride   :: Maybe (GetWindowF a)
    ,doubleWindowAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,doubleWindowAsGroupOverride    :: Maybe (GetGroupF a)
    ,doubleWindowFlushOverride      :: Maybe (WidgetCallback a)
    }

doubleWindowFunctionStruct :: DoubleWindowFuncs a -> IO (Ptr ())
doubleWindowFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Double_Window_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (doubleWindowDrawOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (doubleWindowHandleOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (doubleWindowResizeOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (doubleWindowShowOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (doubleWindowHideOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (doubleWindowAsWindowOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (doubleWindowAsGlWindowOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (doubleWindowAsGroupOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->as_group#} p
      toCallbackPrim  `orNullFunPtr` (doubleWindowFlushOverride funcs) >>=
                             {#set fl_Double_Window_Virtual_Funcs->flush#} p
      {#set fl_Double_Window_Virtual_Funcs->destroy_data #} p nullFunPtr
      return p

defaultDoubleWindowFuncs :: DoubleWindowFuncs a
defaultDoubleWindowFuncs = DoubleWindowFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{# fun Fl_Double_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Double_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Double_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Double_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDouble_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
doubleWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe (DoubleWindowFuncs a) -> IO (DoubleWindow ())
doubleWindowNew (Size (Width w) (Height h)) position title funcs' =
    case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= toObject 
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= toObject 
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= toObject 
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= toObject 
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= toObject 
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= toObject 
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= toObject 
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= toObject 

{# fun Fl_Double_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
doubleWindowDestroy :: DoubleWindow a -> IO ()
doubleWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Double_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
doubleWindowDrawSuper :: DoubleWindow a  ->  IO (())
doubleWindowDrawSuper window = withObject window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Double_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
doubleWindowHandleSuper :: DoubleWindow a  -> Int ->  IO (Int)
doubleWindowHandleSuper window event = withObject window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Double_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
doubleWindowResizeSuper :: DoubleWindow a  -> Rectangle -> IO (())
doubleWindowResizeSuper window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Double_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
doubleWindowShowSuper :: DoubleWindow a  ->  IO (())
doubleWindowShowSuper window = withObject window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Double_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
doubleWindowHideSuper :: DoubleWindow a  ->  IO (())
doubleWindowHideSuper window = withObject window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Double_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
doubleWindowHide :: DoubleWindow a  ->  IO (())
doubleWindowHide doubleWindow = withObject doubleWindow $ \doubleWindowPtr -> hide' doubleWindowPtr

{# fun Fl_Double_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
doubleWindowFlushSuper :: DoubleWindow a  ->  IO (())
doubleWindowFlushSuper window = withObject window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Double_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
doubleWindowAsWindowSuper :: DoubleWindow a  ->  IO (Window ())
doubleWindowAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr

{# fun Fl_Double_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
doubleWindowAsGlWindowSuper :: DoubleWindow a  ->  IO (GlWindow ())
doubleWindowAsGlWindowSuper window = withObject window $ \windowPtr -> asGlWindowSuper' windowPtr

{# fun Fl_Double_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
doubleWindowAsGroupSuper :: DoubleWindow a  ->  IO (Group ())
doubleWindowAsGroupSuper window = withObject window $ \windowPtr -> asGroupSuper' windowPtr

{# fun Fl_Double_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
doubleWindowShow :: DoubleWindow a -> IO ()
doubleWindowShow window = withObject window $ (\p -> windowShow' p)

{#fun Fl_Double_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
doubleWindowHandle :: DoubleWindow a -> Event -> IO Int
doubleWindowHandle window event = withObject window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Double_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
doubleWindowResize :: DoubleWindow a  -> Rectangle -> IO (())
doubleWindowResize window rectangle = withObject window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Double_Window_as_window as asWindow' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
doubleWindowAsWindow :: DoubleWindow a  ->  IO (Window ())
doubleWindowAsWindow window = withObject window $ \windowPtr -> asWindow' windowPtr

{# fun Fl_Double_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
doubleWindowAsGlWindow :: DoubleWindow a  ->  IO (GlWindow())
doubleWindowAsGlWindow window = withObject window $ \windowPtr -> asGlWindow' windowPtr

{# fun Fl_Double_Window_as_group as asGroup' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
doubleWindowAsGroup :: DoubleWindow a  ->  IO (Group ())
doubleWindowAsGroup window = withObject window $ \windowPtr -> asGroup' windowPtr
doubleWindowSetCallback :: DoubleWindow a -> WidgetCallback b -> IO ()
doubleWindowSetCallback = windowSetCallback
doubleWindowParent :: DoubleWindow a -> IO (Group ())
doubleWindowParent = windowParent
doubleWindowSetParent :: DoubleWindow a -> Group b -> IO ()
doubleWindowSetParent = windowSetParent
doubleWindowType_ :: DoubleWindow a  ->  IO (Word8)
doubleWindowType_ = windowType_
doubleWindowSetType :: DoubleWindow a  -> Word8 ->  IO (())
doubleWindowSetType = windowSetType
doubleWindowDrawLabel :: DoubleWindow a  -> Maybe (Rectangle,AlignType)->  IO (())
doubleWindowDrawLabel = windowDrawLabel
doubleWindowX :: DoubleWindow a  ->  IO (Int)
doubleWindowX = windowX
doubleWindowY :: DoubleWindow a  ->  IO (Int)
doubleWindowY = windowY
doubleWindowW :: DoubleWindow a  ->  IO (Int)
doubleWindowW = windowW
doubleWindowH :: DoubleWindow a  ->  IO (Int)
doubleWindowH = windowH
doubleWindowSetAlign :: DoubleWindow a  -> AlignType ->  IO (())
doubleWindowSetAlign = windowSetAlign
doubleWindowAlign :: DoubleWindow a  ->  IO (AlignType)
doubleWindowAlign = windowAlign
doubleWindowBox :: DoubleWindow a  ->  IO (Boxtype)
doubleWindowBox = windowBox
doubleWindowSetBox :: DoubleWindow a  -> Boxtype ->  IO (())
doubleWindowSetBox = windowSetBox
doubleWindowColor :: DoubleWindow a  ->  IO (Color)
doubleWindowColor = windowColor
doubleWindowSetColor :: DoubleWindow a  -> Color ->  IO (())
doubleWindowSetColor = windowSetColor
doubleWindowSetColorWithBgSel :: DoubleWindow a  -> Color -> Color ->  IO (())
doubleWindowSetColorWithBgSel = windowSetColorWithBgSel
doubleWindowSelectionColor :: DoubleWindow a  ->  IO (Color)
doubleWindowSelectionColor = windowSelectionColor
doubleWindowSetSelectionColor :: DoubleWindow a  -> Color ->  IO (())
doubleWindowSetSelectionColor = windowSetSelectionColor
doubleWindowLabeltype :: DoubleWindow a  ->  IO (Labeltype)
doubleWindowLabeltype = windowLabeltype
doubleWindowSetLabeltype :: DoubleWindow a  -> Labeltype ->  IO (())
doubleWindowSetLabeltype = windowSetLabeltype
doubleWindowLabelcolor :: DoubleWindow a  ->  IO (Color)
doubleWindowLabelcolor = windowLabelcolor
doubleWindowSetLabelcolor :: DoubleWindow a  -> Color ->  IO (())
doubleWindowSetLabelcolor = windowSetLabelcolor
doubleWindowLabelfont :: DoubleWindow a  ->  IO (Font)
doubleWindowLabelfont = windowLabelfont
doubleWindowSetLabelfont :: DoubleWindow a  -> Font ->  IO (())
doubleWindowSetLabelfont = windowSetLabelfont
doubleWindowLabelsize :: DoubleWindow a  ->  IO (FontSize)
doubleWindowLabelsize = windowLabelsize
doubleWindowSetLabelsize :: DoubleWindow a  -> FontSize ->  IO (())
doubleWindowSetLabelsize = windowSetLabelsize
doubleWindowImage :: DoubleWindow a  ->  IO (Image ())
doubleWindowImage = windowImage
doubleWindowSetImage :: DoubleWindow a  -> Image b ->  IO (())
doubleWindowSetImage = windowSetImage
doubleWindowDeimage :: DoubleWindow a  ->  IO (Image ())
doubleWindowDeimage = windowDeimage
doubleWindowSetDeimage :: DoubleWindow a  -> Image b ->  IO (())
doubleWindowSetDeimage = windowSetDeimage
doubleWindowTooltip :: DoubleWindow a  ->  IO (String)
doubleWindowTooltip = windowTooltip
doubleWindowCopyTooltip :: DoubleWindow a  -> String ->  IO (())
doubleWindowCopyTooltip = windowCopyTooltip
doubleWindowSetTooltip :: DoubleWindow a  -> String ->  IO (())
doubleWindowSetTooltip = windowSetTooltip
doubleWindowWhen :: DoubleWindow a  ->  IO (When)
doubleWindowWhen = windowWhen
doubleWindowSetWhen :: DoubleWindow a  -> Word8 ->  IO (())
doubleWindowSetWhen = windowSetWhen
doubleWindowVisible :: DoubleWindow a  ->  IO (Int)
doubleWindowVisible = windowVisible
doubleWindowVisibleR :: DoubleWindow a  ->  IO (Int)
doubleWindowVisibleR = windowVisibleR
doubleWindowSetVisible :: DoubleWindow a  ->  IO (())
doubleWindowSetVisible = windowSetVisible
doubleWindowClearVisible :: DoubleWindow a  ->  IO (())
doubleWindowClearVisible = windowClearVisible
doubleWindowActive :: DoubleWindow a  ->  IO (Int)
doubleWindowActive = windowActive
doubleWindowActiveR :: DoubleWindow a  ->  IO (Int)
doubleWindowActiveR = windowActiveR
doubleWindowActivate :: DoubleWindow a  ->  IO (())
doubleWindowActivate = windowActivate
doubleWindowDeactivate :: DoubleWindow a  ->  IO (())
doubleWindowDeactivate = windowDeactivate
doubleWindowOutput :: DoubleWindow a  ->  IO (Int)
doubleWindowOutput = windowOutput
doubleWindowSetOutput :: DoubleWindow a  ->  IO (())
doubleWindowSetOutput = windowSetOutput
doubleWindowClearOutput :: DoubleWindow a  ->  IO (())
doubleWindowClearOutput = windowClearOutput
doubleWindowTakesevents :: DoubleWindow a  ->  IO (Int)
doubleWindowTakesevents = windowTakesevents
doubleWindowSetChanged :: DoubleWindow a  ->  IO (())
doubleWindowSetChanged = windowSetChanged
doubleWindowClearChanged :: DoubleWindow a  ->  IO (())
doubleWindowClearChanged = windowClearChanged
doubleWindowTakeFocus :: DoubleWindow a  ->  IO (Int)
doubleWindowTakeFocus = windowTakeFocus
doubleWindowSetVisibleFocus :: DoubleWindow a  ->  IO (())
doubleWindowSetVisibleFocus = windowSetVisibleFocus
doubleWindowClearVisibleFocus :: DoubleWindow a  ->  IO (())
doubleWindowClearVisibleFocus = windowClearVisibleFocus
doubleWindowModifyVisibleFocus :: DoubleWindow a  -> Int ->  IO (())
doubleWindowModifyVisibleFocus = windowModifyVisibleFocus
doubleWindowVisibleFocus :: DoubleWindow a  ->  IO (Int)
doubleWindowVisibleFocus = windowVisibleFocus
doubleWindowContains :: DoubleWindow a  -> Group a  ->  IO (Int)
doubleWindowContains = windowContains
doubleWindowInside :: DoubleWindow a  -> Group a  ->  IO (Int)
doubleWindowInside = windowInside
doubleWindowRedraw :: DoubleWindow a  ->  IO (())
doubleWindowRedraw = windowRedraw
doubleWindowRedrawLabel :: DoubleWindow a  ->  IO (())
doubleWindowRedrawLabel = windowRedrawLabel
doubleWindowDamage :: DoubleWindow a  ->  IO (Word8)
doubleWindowDamage = windowDamage
doubleWindowClearDamageWithBitmask :: DoubleWindow a  -> Word8 ->  IO (())
doubleWindowClearDamageWithBitmask = windowClearDamageWithBitmask
doubleWindowClearDamage :: DoubleWindow a  ->  IO (())
doubleWindowClearDamage = windowClearDamage
doubleWindowDamageWithText :: DoubleWindow a  -> Word8 ->  IO (())
doubleWindowDamageWithText = windowDamageWithText
doubleWindowDamageInsideWidget :: DoubleWindow a  -> Word8 -> Rectangle ->  IO (())
doubleWindowDamageInsideWidget = windowDamageInsideWidget
doubleWindowMeasureLabel :: DoubleWindow a  -> IO (Size)
doubleWindowMeasureLabel = windowMeasureLabel
doubleWindowWindow :: DoubleWindow a  ->  IO (Window ())
doubleWindowWindow = windowWindow
doubleWindowTopWindow :: DoubleWindow a  ->  IO (Window ())
doubleWindowTopWindow = windowTopWindow
doubleWindowTopWindowOffset :: DoubleWindow a -> IO (Position)
doubleWindowTopWindowOffset = windowTopWindowOffset
doubleWindowBegin :: DoubleWindow a  ->  IO (())
doubleWindowBegin = windowBegin
doubleWindowEnd :: DoubleWindow a  ->  IO (())
doubleWindowEnd = windowEnd
doubleWindowFind :: DoubleWindow a -> Widget b  ->  IO (Int)
doubleWindowFind = windowFind
doubleWindowAdd :: DoubleWindow a -> Widget b  ->  IO (())
doubleWindowAdd = windowAdd
doubleWindowInsert :: DoubleWindow a -> Widget b  -> Int ->  IO (())
doubleWindowInsert = windowInsert
doubleWindowRemoveIndex :: DoubleWindow a  -> Int ->  IO (())
doubleWindowRemoveIndex = windowRemoveIndex
doubleWindowRemoveWidget :: DoubleWindow a -> Widget b  ->  IO (())
doubleWindowRemoveWidget = windowRemoveWidget
doubleWindowClear :: DoubleWindow a  ->  IO (())
doubleWindowClear = windowClear
doubleWindowSetResizable :: DoubleWindow a -> Widget b  ->  IO (())
doubleWindowSetResizable = windowSetResizable
doubleWindowResizable :: DoubleWindow a  ->  IO (Widget ())
doubleWindowResizable = windowResizable
doubleWindowAddResizable :: DoubleWindow a -> Widget b  ->  IO (())
doubleWindowAddResizable = windowAddResizable
doubleWindowInitSizes :: DoubleWindow a  ->  IO (())
doubleWindowInitSizes = windowInitSizes
doubleWindowChildren :: DoubleWindow a  ->  IO (Int)
doubleWindowChildren = windowChildren
doubleWindowSetClipChildren :: DoubleWindow a  -> Int ->  IO (())
doubleWindowSetClipChildren = windowSetClipChildren
doubleWindowClipChildren :: DoubleWindow a  ->  IO (Int)
doubleWindowClipChildren = windowClipChildren
doubleWindowFocus :: DoubleWindow a -> Widget b  ->  IO (())
doubleWindowFocus = windowFocus
doubleWindowDdfdesignKludge :: DoubleWindow a  ->  IO (Widget ())
doubleWindowDdfdesignKludge = windowDdfdesignKludge
doubleWindowInsertWithBefore :: DoubleWindow a -> Widget b  -> Widget c  ->  IO (())
doubleWindowInsertWithBefore = windowInsertWithBefore
doubleWindowArray :: DoubleWindow a  ->  IO [(Widget ())]
doubleWindowArray = windowArray
doubleWindowChild :: DoubleWindow a  -> Int ->  IO (Widget ())
doubleWindowChild = windowChild
doubleWindowChanged :: DoubleWindow a  ->  IO (Int)
doubleWindowChanged = windowChanged
doubleWindowFullscreen :: DoubleWindow a  ->  IO (())
doubleWindowFullscreen = windowFullscreen
doubleWindowFullscreenOff :: DoubleWindow a -> Maybe Rectangle ->  IO (())
doubleWindowFullscreenOff = windowFullscreenOff
doubleWindowSetBorder :: DoubleWindow a  -> Bool ->  IO (())
doubleWindowSetBorder = windowSetBorder
doubleWindowClearBorder :: DoubleWindow a  ->  IO (())
doubleWindowClearBorder = windowClearBorder
doubleWindowBorder :: DoubleWindow a  ->  IO (Bool)
doubleWindowBorder = windowBorder
doubleWindowSetOverride :: DoubleWindow a  ->  IO (())
doubleWindowSetOverride = windowSetOverride
doubleWindowOverride :: DoubleWindow a  ->  IO (Bool)
doubleWindowOverride = windowOverride
doubleWindowSetModal :: DoubleWindow a  ->  IO (())
doubleWindowSetModal = windowSetModal
doubleWindowModal :: DoubleWindow a  ->  IO (Bool)
doubleWindowModal = windowModal
doubleWindowSetNonModal :: DoubleWindow a  ->  IO (())
doubleWindowSetNonModal = windowSetNonModal
doubleWindowNonModal :: DoubleWindow a  ->  IO (Bool)
doubleWindowNonModal = windowNonModal
doubleWindowSetMenuWindow :: DoubleWindow a  ->  IO (())
doubleWindowSetMenuWindow = windowSetMenuWindow
doubleWindowMenuWindow :: DoubleWindow a  ->  IO (Bool)
doubleWindowMenuWindow = windowMenuWindow
doubleWindowSetTooltipWindow :: DoubleWindow a  ->  IO (())
doubleWindowSetTooltipWindow = windowSetTooltipWindow
doubleWindowTooltipWindow :: DoubleWindow a  ->  IO (Bool)
doubleWindowTooltipWindow = windowTooltipWindow
doubleWindowHotSpot :: DoubleWindow a -> PositionSpec b -> Maybe Bool -> IO ()
doubleWindowHotSpot = windowHotSpot
doubleWindowFreePosition :: DoubleWindow a  ->  IO (())
doubleWindowFreePosition = windowFreePosition
doubleWindowSizeRange :: DoubleWindow a  -> Int -> Int -> IO (())
doubleWindowSizeRange = windowSizeRange
doubleWindowSizeRangeWithArgs :: DoubleWindow a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
doubleWindowSizeRangeWithArgs = windowSizeRangeWithArgs
doubleWindowLabel :: DoubleWindow a  ->  IO (String)
doubleWindowLabel = windowLabel
doubleWindowIconlabel :: DoubleWindow a  ->  IO (String)
doubleWindowIconlabel = windowIconlabel
doubleWindowSetLabel :: DoubleWindow a  -> String ->  IO (())
doubleWindowSetLabel = windowSetLabel
doubleWindowSetIconlabel :: DoubleWindow a  -> String ->  IO (())
doubleWindowSetIconlabel = windowSetIconlabel
doubleWindowSetLabelWithIconlabel :: DoubleWindow a  -> String -> String ->  IO (())
doubleWindowSetLabelWithIconlabel = windowSetLabelWithIconlabel
doubleWindowCopyLabel :: DoubleWindow a  -> String ->  IO (())
doubleWindowCopyLabel = windowCopyLabel
doubleWindowSetDefaultXclass :: String ->  IO (())
doubleWindowSetDefaultXclass = windowSetDefaultXclass
doubleWindowDefaultXclass ::  IO (String)
doubleWindowDefaultXclass = windowDefaultXclass
doubleWindowXclass :: DoubleWindow a  ->  IO (String)
doubleWindowXclass = windowXclass
doubleWindowSetXclass :: DoubleWindow a  -> String ->  IO (())
doubleWindowSetXclass = windowSetXclass
doubleWindowIcon :: DoubleWindow a  ->  IO (Ptr ())
doubleWindowIcon = windowIcon
doubleWindowSetIcon :: DoubleWindow a  -> Ptr () ->  IO (())
doubleWindowSetIcon = windowSetIcon
doubleWindowShown :: DoubleWindow a  ->  IO (Bool)
doubleWindowShown = windowShown
doubleWindowIconize :: DoubleWindow a  ->  IO (())
doubleWindowIconize = windowIconize
doubleWindowXRoot :: DoubleWindow a  ->  IO (Int)
doubleWindowXRoot = windowXRoot
doubleWindowYRoot :: DoubleWindow a  ->  IO (Int)
doubleWindowYRoot = windowYRoot
doubleWindowCurrent ::  IO (Ptr ())
doubleWindowCurrent = windowCurrent
doubleWindowMakeCurrent :: DoubleWindow a  ->  IO (())
doubleWindowMakeCurrent = windowMakeCurrent
doubleWindowSetCursor :: DoubleWindow a -> CursorType -> IO ()
doubleWindowSetCursor = windowSetCursor
doubleWindowSetCursorWithFgBg :: DoubleWindow a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
doubleWindowSetCursorWithFgBg = windowSetCursorWithFgBg
doubleWindowSetDefaultCursor :: DoubleWindow a  -> CursorType ->  IO (())
doubleWindowSetDefaultCursor = windowSetDefaultCursor
doubleWindowDecoratedW :: DoubleWindow a  ->  IO (Int)
doubleWindowDecoratedW = windowDecoratedW
doubleWindowDecoratedH :: DoubleWindow a  ->  IO (Int)
doubleWindowDecoratedH = windowDecoratedH
