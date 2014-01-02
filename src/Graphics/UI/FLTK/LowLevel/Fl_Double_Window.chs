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
doubleWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe (DoubleWindowFuncs a) -> IO (Window ())
doubleWindowNew (Size (Width w) (Height h)) position title funcs' =
    let makeObject = objectOrError "doubleWindowNew: object construction returned a null pointer"
    in case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= makeObject
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= makeObject
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= makeObject
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= makeObject
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= makeObject
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= makeObject
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= makeObject
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- doubleWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= makeObject

{# fun Fl_Double_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' #}
doubleWindowDestroy :: DoubleWindow a -> IO ()
doubleWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Double_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
doubleWindowDrawSuper :: DoubleWindow a  ->  IO (())
doubleWindowDrawSuper window = withObject window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Double_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
doubleWindowHandleSuper :: DoubleWindow a  -> Int ->  IO (Int)
doubleWindowHandleSuper window event = withObject window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Double_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
doubleWindowResizeSuper :: DoubleWindow a  -> Rectangle -> IO (())
doubleWindowResizeSuper window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Double_Window_show_super as showSuper' { id `Ptr ()' } -> `()' #}
doubleWindowShowSuper :: DoubleWindow a  ->  IO (())
doubleWindowShowSuper window = withObject window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Double_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' #}
doubleWindowHideSuper :: DoubleWindow a  ->  IO (())
doubleWindowHideSuper window = withObject window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Double_Window_hide as hide' { id `Ptr ()' } -> `()' #}
doubleWindowHide :: DoubleWindow a  ->  IO (())
doubleWindowHide doubleWindow = withObject doubleWindow $ \doubleWindowPtr -> hide' doubleWindowPtr

{# fun Fl_Double_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' #}
doubleWindowFlushSuper :: DoubleWindow a  ->  IO (())
doubleWindowFlushSuper window = withObject window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Double_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
doubleWindowAsWindowSuper :: DoubleWindow a  ->  IO (Maybe (Window ()))
doubleWindowAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr

{# fun Fl_Double_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `Maybe (GlWindow ())'toObject #}
doubleWindowAsGlWindowSuper :: DoubleWindow a  ->  IO (Maybe (GlWindow ()))
doubleWindowAsGlWindowSuper window = withObject window $ \windowPtr -> asGlWindowSuper' windowPtr

{# fun Fl_Double_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
doubleWindowAsGroupSuper :: DoubleWindow a  ->  IO (Maybe (Group ()))
doubleWindowAsGroupSuper window = withObject window $ \windowPtr -> asGroupSuper' windowPtr

{# fun Fl_Double_Window_show as windowShow' {id `Ptr ()'} -> `()' #}
doubleWindowShow :: DoubleWindow a -> IO ()
doubleWindowShow window = withObject window $ (\p -> windowShow' p)

{#fun Fl_Double_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
doubleWindowHandle :: DoubleWindow a -> Event -> IO Int
doubleWindowHandle window event = withObject window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Double_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
doubleWindowResize :: DoubleWindow a  -> Rectangle -> IO (())
doubleWindowResize window rectangle = withObject window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Double_Window_as_window as asWindow' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
doubleWindowAsWindow :: DoubleWindow a  ->  IO (Maybe (Window ()))
doubleWindowAsWindow window = withObject window $ \windowPtr -> asWindow' windowPtr

{# fun Fl_Double_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
doubleWindowAsGlWindow :: DoubleWindow a  ->  IO (Maybe (GlWindow()))
doubleWindowAsGlWindow window = withObject window $ \windowPtr -> asGlWindow' windowPtr

{# fun Fl_Double_Window_as_group as asGroup' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
doubleWindowAsGroup :: DoubleWindow a  ->  IO (Maybe (Group ()))
doubleWindowAsGroup window = withObject window $ \windowPtr -> asGroup' windowPtr
doubleWindowSetCallback :: Window a -> WidgetCallback b -> IO ()
doubleWindowSetCallback = windowSetCallback
doubleWindowParent :: Group a -> IO (Maybe (Group ()))
doubleWindowParent = windowParent
doubleWindowSetParent :: Group a -> Group b -> IO ()
doubleWindowSetParent = windowSetParent
doubleWindowType_ :: Group a  ->  IO (Word8)
doubleWindowType_ = windowType_
doubleWindowSetType :: Group a  -> Word8 ->  IO (())
doubleWindowSetType = windowSetType
doubleWindowDrawLabel :: Group a  -> Maybe (Rectangle,AlignType)->  IO (())
doubleWindowDrawLabel = windowDrawLabel
doubleWindowX :: Group a  ->  IO (Int)
doubleWindowX = windowX
doubleWindowY :: Group a  ->  IO (Int)
doubleWindowY = windowY
doubleWindowW :: Group a  ->  IO (Int)
doubleWindowW = windowW
doubleWindowH :: Group a  ->  IO (Int)
doubleWindowH = windowH
doubleWindowSetAlign :: Group a  -> AlignType ->  IO (())
doubleWindowSetAlign = windowSetAlign
doubleWindowAlign :: Group a  ->  IO (AlignType)
doubleWindowAlign = windowAlign
doubleWindowBox :: Group a  ->  IO (Boxtype)
doubleWindowBox = windowBox
doubleWindowSetBox :: Group a  -> Boxtype ->  IO (())
doubleWindowSetBox = windowSetBox
doubleWindowColor :: Group a  ->  IO (Color)
doubleWindowColor = windowColor
doubleWindowSetColor :: Group a  -> Color ->  IO (())
doubleWindowSetColor = windowSetColor
doubleWindowSetColorWithBgSel :: Group a  -> Color -> Color ->  IO (())
doubleWindowSetColorWithBgSel = windowSetColorWithBgSel
doubleWindowSelectionColor :: Group a  ->  IO (Color)
doubleWindowSelectionColor = windowSelectionColor
doubleWindowSetSelectionColor :: Group a  -> Color ->  IO (())
doubleWindowSetSelectionColor = windowSetSelectionColor
doubleWindowLabeltype :: Group a  ->  IO (Labeltype)
doubleWindowLabeltype = windowLabeltype
doubleWindowSetLabeltype :: Group a  -> Labeltype ->  IO (())
doubleWindowSetLabeltype = windowSetLabeltype
doubleWindowLabelcolor :: Group a  ->  IO (Color)
doubleWindowLabelcolor = windowLabelcolor
doubleWindowSetLabelcolor :: Group a  -> Color ->  IO (())
doubleWindowSetLabelcolor = windowSetLabelcolor
doubleWindowLabelfont :: Group a  ->  IO (Font)
doubleWindowLabelfont = windowLabelfont
doubleWindowSetLabelfont :: Group a  -> Font ->  IO (())
doubleWindowSetLabelfont = windowSetLabelfont
doubleWindowLabelsize :: Group a  ->  IO (FontSize)
doubleWindowLabelsize = windowLabelsize
doubleWindowSetLabelsize :: Group a  -> FontSize ->  IO (())
doubleWindowSetLabelsize = windowSetLabelsize
doubleWindowImage :: Group a  ->  IO (Maybe (Image ()))
doubleWindowImage = windowImage
doubleWindowSetImage :: Group a  -> Image b ->  IO (())
doubleWindowSetImage = windowSetImage
doubleWindowDeimage :: Group a  ->  IO (Maybe (Image ()))
doubleWindowDeimage = windowDeimage
doubleWindowSetDeimage :: Group a  -> Image b ->  IO (())
doubleWindowSetDeimage = windowSetDeimage
doubleWindowTooltip :: Group a  ->  IO (String)
doubleWindowTooltip = windowTooltip
doubleWindowCopyTooltip :: Group a  -> String ->  IO (())
doubleWindowCopyTooltip = windowCopyTooltip
doubleWindowSetTooltip :: Group a  -> String ->  IO (())
doubleWindowSetTooltip = windowSetTooltip
doubleWindowWhen :: Group a  ->  IO (When)
doubleWindowWhen = windowWhen
doubleWindowSetWhen :: Group a  -> Word8 ->  IO (())
doubleWindowSetWhen = windowSetWhen
doubleWindowVisible :: Group a  ->  IO (Int)
doubleWindowVisible = windowVisible
doubleWindowVisibleR :: Group a  ->  IO (Int)
doubleWindowVisibleR = windowVisibleR
doubleWindowSetVisible :: Group a  ->  IO (())
doubleWindowSetVisible = windowSetVisible
doubleWindowClearVisible :: Group a  ->  IO (())
doubleWindowClearVisible = windowClearVisible
doubleWindowActive :: Group a  ->  IO (Int)
doubleWindowActive = windowActive
doubleWindowActiveR :: Group a  ->  IO (Int)
doubleWindowActiveR = windowActiveR
doubleWindowActivate :: Group a  ->  IO (())
doubleWindowActivate = windowActivate
doubleWindowDeactivate :: Group a  ->  IO (())
doubleWindowDeactivate = windowDeactivate
doubleWindowOutput :: Group a  ->  IO (Int)
doubleWindowOutput = windowOutput
doubleWindowSetOutput :: Group a  ->  IO (())
doubleWindowSetOutput = windowSetOutput
doubleWindowClearOutput :: Group a  ->  IO (())
doubleWindowClearOutput = windowClearOutput
doubleWindowTakesevents :: Group a  ->  IO (Int)
doubleWindowTakesevents = windowTakesevents
doubleWindowSetChanged :: Group a  ->  IO (())
doubleWindowSetChanged = windowSetChanged
doubleWindowClearChanged :: Group a  ->  IO (())
doubleWindowClearChanged = windowClearChanged
doubleWindowTakeFocus :: Group a  ->  IO (Int)
doubleWindowTakeFocus = windowTakeFocus
doubleWindowSetVisibleFocus :: Group a  ->  IO (())
doubleWindowSetVisibleFocus = windowSetVisibleFocus
doubleWindowClearVisibleFocus :: Group a  ->  IO (())
doubleWindowClearVisibleFocus = windowClearVisibleFocus
doubleWindowModifyVisibleFocus :: Group a  -> Int ->  IO (())
doubleWindowModifyVisibleFocus = windowModifyVisibleFocus
doubleWindowVisibleFocus :: Group a  ->  IO (Int)
doubleWindowVisibleFocus = windowVisibleFocus
doubleWindowContains :: Group a  -> Group a  ->  IO (Int)
doubleWindowContains = windowContains
doubleWindowInside :: Group a  -> Group a  ->  IO (Int)
doubleWindowInside = windowInside
doubleWindowRedraw :: Group a  ->  IO (())
doubleWindowRedraw = windowRedraw
doubleWindowRedrawLabel :: Group a  ->  IO (())
doubleWindowRedrawLabel = windowRedrawLabel
doubleWindowDamage :: Group a  ->  IO (Word8)
doubleWindowDamage = windowDamage
doubleWindowClearDamageWithBitmask :: Group a  -> Word8 ->  IO (())
doubleWindowClearDamageWithBitmask = windowClearDamageWithBitmask
doubleWindowClearDamage :: Group a  ->  IO (())
doubleWindowClearDamage = windowClearDamage
doubleWindowDamageWithText :: Group a  -> Word8 ->  IO (())
doubleWindowDamageWithText = windowDamageWithText
doubleWindowDamageInsideWidget :: Group a  -> Word8 -> Rectangle ->  IO (())
doubleWindowDamageInsideWidget = windowDamageInsideWidget
doubleWindowMeasureLabel :: Group a  -> IO (Size)
doubleWindowMeasureLabel = windowMeasureLabel
doubleWindowWindow :: Group a  ->  IO (Maybe (Window ()))
doubleWindowWindow = windowWindow
doubleWindowTopWindow :: Group a  ->  IO (Maybe (Window ()))
doubleWindowTopWindow = windowTopWindow
doubleWindowTopWindowOffset :: Group a -> IO (Position)
doubleWindowTopWindowOffset = windowTopWindowOffset
doubleWindowBegin :: Group a  ->  IO (())
doubleWindowBegin = windowBegin
doubleWindowEnd :: Group a  ->  IO (())
doubleWindowEnd = windowEnd
doubleWindowFind :: Group a  -> Widget a  ->  IO (Int)
doubleWindowFind = windowFind
doubleWindowAdd :: Group a  -> Widget a  ->  IO (())
doubleWindowAdd = windowAdd
doubleWindowInsert :: Group a  -> Widget a  -> Int ->  IO (())
doubleWindowInsert = windowInsert
doubleWindowRemoveIndex :: Group a  -> Int ->  IO (())
doubleWindowRemoveIndex = windowRemoveIndex
doubleWindowRemoveWidget :: Group a  -> Widget a  ->  IO (())
doubleWindowRemoveWidget = windowRemoveWidget
doubleWindowClear :: Group a  ->  IO (())
doubleWindowClear = windowClear
doubleWindowSetResizable :: Group a  -> Widget a  ->  IO (())
doubleWindowSetResizable = windowSetResizable
doubleWindowResizable :: Group a  ->  IO (Maybe (Widget ()))
doubleWindowResizable = windowResizable
doubleWindowAddResizable :: Group a  -> Widget a  ->  IO (())
doubleWindowAddResizable = windowAddResizable
doubleWindowInitSizes :: Group a  ->  IO (())
doubleWindowInitSizes = windowInitSizes
doubleWindowChildren :: Group a  ->  IO (Int)
doubleWindowChildren = windowChildren
doubleWindowSetClipChildren :: Group a  -> Int ->  IO (())
doubleWindowSetClipChildren = windowSetClipChildren
doubleWindowClipChildren :: Group a  ->  IO (Int)
doubleWindowClipChildren = windowClipChildren
doubleWindowFocus :: Group a  -> Widget a  ->  IO (())
doubleWindowFocus = windowFocus
doubleWindowDdfdesignKludge :: Group a  ->  IO (Maybe (Widget ()))
doubleWindowDdfdesignKludge = windowDdfdesignKludge
doubleWindowInsertWithBefore :: Group a  -> Widget a  -> Widget a  ->  IO (())
doubleWindowInsertWithBefore = windowInsertWithBefore
doubleWindowArray :: Group a  ->  IO [Maybe (Widget ())]
doubleWindowArray = windowArray
doubleWindowChild :: Group a  -> Int ->  IO (Maybe (Widget ()))
doubleWindowChild = windowChild
doubleWindowChanged :: Window a  ->  IO (Int)
doubleWindowChanged = windowChanged
doubleWindowFullscreen :: Window a  ->  IO (())
doubleWindowFullscreen = windowFullscreen
doubleWindowFullscreenOff :: Window a -> Maybe Rectangle ->  IO (())
doubleWindowFullscreenOff = windowFullscreenOff
doubleWindowSetBorder :: Window a  -> Bool ->  IO (())
doubleWindowSetBorder = windowSetBorder
doubleWindowClearBorder :: Window a  ->  IO (())
doubleWindowClearBorder = windowClearBorder
doubleWindowBorder :: Window a  ->  IO (Bool)
doubleWindowBorder = windowBorder
doubleWindowSetOverride :: Window a  ->  IO (())
doubleWindowSetOverride = windowSetOverride
doubleWindowOverride :: Window a  ->  IO (Bool)
doubleWindowOverride = windowOverride
doubleWindowSetModal :: Window a  ->  IO (())
doubleWindowSetModal = windowSetModal
doubleWindowModal :: Window a  ->  IO (Bool)
doubleWindowModal = windowModal
doubleWindowSetNonModal :: Window a  ->  IO (())
doubleWindowSetNonModal = windowSetNonModal
doubleWindowNonModal :: Window a  ->  IO (Bool)
doubleWindowNonModal = windowNonModal
doubleWindowSetMenuWindow :: Window a  ->  IO (())
doubleWindowSetMenuWindow = windowSetMenuWindow
doubleWindowMenuWindow :: Window a  ->  IO (Bool)
doubleWindowMenuWindow = windowMenuWindow
doubleWindowSetTooltipWindow :: Window a  ->  IO (())
doubleWindowSetTooltipWindow = windowSetTooltipWindow
doubleWindowTooltipWindow :: Window a  ->  IO (Bool)
doubleWindowTooltipWindow = windowTooltipWindow
doubleWindowHotSpot :: Window a -> PositionSpec b -> Maybe Bool -> IO ()
doubleWindowHotSpot = windowHotSpot
doubleWindowFreePosition :: Window a  ->  IO (())
doubleWindowFreePosition = windowFreePosition
doubleWindowSizeRange :: Window a  -> Int -> Int -> IO (())
doubleWindowSizeRange = windowSizeRange
doubleWindowSizeRangeWithArgs :: Window a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
doubleWindowSizeRangeWithArgs = windowSizeRangeWithArgs
doubleWindowLabel :: Window a  ->  IO (String)
doubleWindowLabel = windowLabel
doubleWindowIconlabel :: Window a  ->  IO (String)
doubleWindowIconlabel = windowIconlabel
doubleWindowSetLabel :: Window a  -> String ->  IO (())
doubleWindowSetLabel = windowSetLabel
doubleWindowSetIconlabel :: Window a  -> String ->  IO (())
doubleWindowSetIconlabel = windowSetIconlabel
doubleWindowSetLabelWithIconlabel :: Window a  -> String -> String ->  IO (())
doubleWindowSetLabelWithIconlabel = windowSetLabelWithIconlabel
doubleWindowCopyLabel :: Window a  -> String ->  IO (())
doubleWindowCopyLabel = windowCopyLabel
doubleWindowSetDefaultXclass :: String ->  IO (())
doubleWindowSetDefaultXclass = windowSetDefaultXclass
doubleWindowDefaultXclass ::  IO (String)
doubleWindowDefaultXclass = windowDefaultXclass
doubleWindowXclass :: Window a  ->  IO (String)
doubleWindowXclass = windowXclass
doubleWindowSetXclass :: Window a  -> String ->  IO (())
doubleWindowSetXclass = windowSetXclass
doubleWindowIcon :: Window a  ->  IO (Ptr ())
doubleWindowIcon = windowIcon
doubleWindowSetIcon :: Window a  -> Ptr () ->  IO (())
doubleWindowSetIcon = windowSetIcon
doubleWindowShown :: Window a  ->  IO (Bool)
doubleWindowShown = windowShown
doubleWindowIconize :: Window a  ->  IO (())
doubleWindowIconize = windowIconize
doubleWindowXRoot :: Window a  ->  IO (Int)
doubleWindowXRoot = windowXRoot
doubleWindowYRoot :: Window a  ->  IO (Int)
doubleWindowYRoot = windowYRoot
doubleWindowCurrent ::  IO (Ptr ())
doubleWindowCurrent = windowCurrent
doubleWindowMakeCurrent :: Window a  ->  IO (())
doubleWindowMakeCurrent = windowMakeCurrent
doubleWindowSetCursor :: Window a -> CursorType -> IO ()
doubleWindowSetCursor = windowSetCursor
doubleWindowSetCursorWithFgBg :: Window a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
doubleWindowSetCursorWithFgBg = windowSetCursorWithFgBg
doubleWindowSetDefaultCursor :: Window a  -> CursorType ->  IO (())
doubleWindowSetDefaultCursor = windowSetDefaultCursor
doubleWindowDecoratedW :: Window a  ->  IO (Int)
doubleWindowDecoratedW = windowDecoratedW
doubleWindowDecoratedH :: Window a  ->  IO (Int)
doubleWindowDecoratedH = windowDecoratedH
