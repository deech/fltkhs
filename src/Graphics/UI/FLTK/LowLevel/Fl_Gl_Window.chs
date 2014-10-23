module Graphics.UI.FLTK.LowLevel.Fl_Gl_Window
    (
     defaultGlWindowFuncs,
     glWindowNew,
     glWindowDrawSuper,
     glWindowAsGroupSuper,
     glWindowAsWindowSuper,
     glWindowAsGlWindowSuper,
     glWindowHideSuper,
     glWindowFlushSuper,
     glWindowFlush,
     glWindowResizeSuper,
     glWindowHide,
     glWindowShow,
     glWindowShowSuper,
     glWindowResize,
     glWindowHandle,
     glWindowAsGroup,
     glWindowAsWindow,
     glWindowAsGlWindow,
     glWindowHandleSuper,
     glWindowDestroy,
     glWindowValid,
     glWindowSetValid,
     glWindowInvalidate,
     glWindowContextValid,
     glWindowSetContextValid,
     glWindowCanDoWithM,
     glWindowCanDo,
     glWindowMode,
     glWindowSetMode,
     glWindowContext,
     glWindowSetContext,
     glWindowSetContextWithDestroyFlag,
     glWindowSwapBuffers,
     glWindowOrtho,
     glWindowCanDoOverlay,
     glWindowRedrawOverlay,
     glWindowHideOverlay,
     glWindowMakeOverlayCurrent,
     glWindowSetCallback,
     glWindowParent,
     glWindowSetParent,
     glWindowType_,
     glWindowSetType,
     glWindowDrawLabel,
     glWindowX,
     glWindowY,
     glWindowW,
     glWindowH,
     glWindowSetAlign,
     glWindowAlign,
     glWindowBox,
     glWindowSetBox,
     glWindowColor,
     glWindowSetColor,
     glWindowSetColorWithBgSel,
     glWindowSelectionColor,
     glWindowSetSelectionColor,
     glWindowLabeltype,
     glWindowSetLabeltype,
     glWindowLabelcolor,
     glWindowSetLabelcolor,
     glWindowLabelfont,
     glWindowSetLabelfont,
     glWindowLabelsize,
     glWindowSetLabelsize,
     glWindowImage,
     glWindowSetImage,
     glWindowDeimage,
     glWindowSetDeimage,
     glWindowTooltip,
     glWindowCopyTooltip,
     glWindowSetTooltip,
     glWindowWhen,
     glWindowSetWhen,
     glWindowVisible,
     glWindowVisibleR,
     glWindowSetVisible,
     glWindowClearVisible,
     glWindowActive,
     glWindowActiveR,
     glWindowActivate,
     glWindowDeactivate,
     glWindowOutput,
     glWindowSetOutput,
     glWindowClearOutput,
     glWindowTakesevents,
     glWindowSetChanged,
     glWindowClearChanged,
     glWindowTakeFocus,
     glWindowSetVisibleFocus,
     glWindowClearVisibleFocus,
     glWindowModifyVisibleFocus,
     glWindowVisibleFocus,
     glWindowContains,
     glWindowInside,
     glWindowRedraw,
     glWindowRedrawLabel,
     glWindowDamage,
     glWindowClearDamageWithBitmask,
     glWindowClearDamage,
     glWindowDamageWithText,
     glWindowDamageInsideWidget,
     glWindowMeasureLabel,
     glWindowWindow,
     glWindowTopWindow,
     glWindowTopWindowOffset,
     glWindowBegin,
     glWindowEnd,
     glWindowFind,
     glWindowAdd,
     glWindowInsert,
     glWindowRemoveIndex,
     glWindowRemoveWidget,
     glWindowClear,
     glWindowSetResizable,
     glWindowResizable,
     glWindowAddResizable,
     glWindowInitSizes,
     glWindowChildren,
     glWindowSetClipChildren,
     glWindowClipChildren,
     glWindowFocus,
     glWindowDdfdesignKludge,
     glWindowInsertWithBefore,
     glWindowArray,
     glWindowChild,
     glWindowChanged,
     glWindowFullscreen,
     glWindowFullscreenOff,
     glWindowSetBorder,
     glWindowClearBorder,
     glWindowBorder,
     glWindowSetOverride,
     glWindowOverride,
     glWindowSetModal,
     glWindowModal,
     glWindowSetNonModal,
     glWindowNonModal,
     glWindowSetMenuWindow,
     glWindowMenuWindow,
     glWindowSetTooltipWindow,
     glWindowTooltipWindow,
     glWindowHotSpot,
     glWindowFreePosition,
     glWindowSizeRange,
     glWindowSizeRangeWithArgs,
     glWindowLabel,
     glWindowIconlabel,
     glWindowSetLabel,
     glWindowSetIconlabel,
     glWindowSetLabelWithIconlabel,
     glWindowCopyLabel,
     glWindowSetDefaultXclass,
     glWindowDefaultXclass,
     glWindowXclass,
     glWindowSetXclass,
     glWindowIcon,
     glWindowSetIcon,
     glWindowShown,
     glWindowIconize,
     glWindowXRoot,
     glWindowYRoot,
     glWindowCurrent,
     glWindowMakeCurrent,
     glWindowSetCursor,
     glWindowSetCursorWithFgBg,
     glWindowSetDefaultCursor,
     glWindowDecoratedW,
     glWindowDecoratedH
    )
where
#include "Fl_C.h"
#include "Fl_Double_WindowC.h"
#include "Fl_Gl_WindowC.h"         
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)
data GlWindowFuncs a =
    GlWindowFuncs
    {
     glWindowDrawOverride       :: Maybe (WidgetCallback a)
    ,glWindowHandleOverride     :: Maybe (WidgetEventHandler a)
    ,glWindowResizeOverride     :: Maybe (RectangleF a)
    ,glWindowShowOverride       :: Maybe (WidgetCallback a)
    ,glWindowHideOverride       :: Maybe (WidgetCallback a)
    ,glWindowAsWindowOverride   :: Maybe (GetWindowF a)
    ,glWindowAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,glWindowAsGroupOverride    :: Maybe (GetGroupF a)
    ,glWindowFlushOverride      :: Maybe (WidgetCallback a)
    }

glWindowFunctionStruct :: GlWindowFuncs a -> IO (Ptr ())
glWindowFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Gl_Window_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (glWindowDrawOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (glWindowHandleOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (glWindowResizeOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (glWindowShowOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (glWindowHideOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (glWindowAsWindowOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (glWindowAsGlWindowOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (glWindowAsGroupOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->as_group#} p
      toCallbackPrim  `orNullFunPtr` (glWindowFlushOverride funcs) >>=
                             {#set fl_Gl_Window_Virtual_Funcs->flush#} p
      {#set fl_Gl_Window_Virtual_Funcs->destroy_data #} p nullFunPtr
      return p

defaultGlWindowFuncs :: GlWindowFuncs a
defaultGlWindowFuncs = GlWindowFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{# fun Fl_Gl_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Gl_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Gl_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Gl_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGl_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
glWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe (GlWindowFuncs a) -> IO (GlWindow ())
glWindowNew (Size (Width w) (Height h)) position title funcs' =
    case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= toObject 
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= toObject 
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= toObject 
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= toObject 
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= toObject 
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= toObject 
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= toObject 
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= toObject 

{# fun unsafe Fl_Gl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowDrawSuper :: GlWindow a  ->  IO (())
glWindowDrawSuper self = withObject self $ \selfPtr -> drawSuper' selfPtr

{# fun unsafe Fl_Gl_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
glWindowAsGroupSuper :: GlWindow a  ->  IO (Group ())
glWindowAsGroupSuper win = withObject win $ \winPtr -> asGroupSuper' winPtr

{# fun unsafe Fl_Gl_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
glWindowAsWindowSuper :: GlWindow a  ->  IO (Window ())
glWindowAsWindowSuper win = withObject win $ \winPtr -> asWindowSuper' winPtr

{# fun unsafe Fl_Gl_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
glWindowAsGlWindowSuper :: GlWindow a  ->  IO (GlWindow ())
glWindowAsGlWindowSuper win = withObject win $ \winPtr -> asGlWindowSuper' winPtr

{# fun unsafe Fl_Gl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowHideSuper :: GlWindow a  ->  IO (())
glWindowHideSuper win = withObject win $ \winPtr -> hideSuper' winPtr

{# fun unsafe Fl_Gl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowFlushSuper :: GlWindow a  ->  IO (())
glWindowFlushSuper win = withObject win $ \winPtr -> flushSuper' winPtr

{# fun unsafe Fl_Gl_Window_flush as flush' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowFlush :: GlWindow a  ->  IO (())
glWindowFlush win = withObject win $ \winPtr -> flush' winPtr

{# fun unsafe Fl_Gl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowShowSuper :: GlWindow a  ->  IO (())
glWindowShowSuper win = withObject win $ \winPtr -> showSuper' winPtr

{# fun unsafe Fl_Gl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
glWindowResizeSuper :: GlWindow a  -> Int -> Int -> Int -> Int ->  IO (())
glWindowResizeSuper win x y w h = withObject win $ \winPtr -> resizeSuper' winPtr x y w h

{# fun unsafe Fl_Gl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowHide :: GlWindow a  ->  IO (())
glWindowHide win = withObject win $ \winPtr -> hide' winPtr

{# fun unsafe Fl_Gl_Window_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowShow :: GlWindow a  ->  IO (())
glWindowShow win = withObject win $ \winPtr -> show' winPtr

{# fun unsafe Fl_Gl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
glWindowResize :: GlWindow a  -> Int -> Int -> Int -> Int ->  IO (())
glWindowResize win x y w h = withObject win $ \winPtr -> resize' winPtr x y w h

{# fun unsafe Fl_Gl_Window_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
glWindowHandle :: GlWindow a  -> Int ->  IO (Int)
glWindowHandle self event = withObject self $ \selfPtr -> handle' selfPtr event

{# fun unsafe Fl_Gl_Window_as_group as asGroup' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
glWindowAsGroup :: GlWindow a  ->  IO (Group ())
glWindowAsGroup win = withObject win $ \winPtr -> asGroup' winPtr

{# fun unsafe Fl_Gl_Window_as_window as asWindow' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
glWindowAsWindow :: GlWindow a  ->  IO (Window ())
glWindowAsWindow win = withObject win $ \winPtr -> asWindow' winPtr

{# fun unsafe Fl_Gl_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
glWindowAsGlWindow :: GlWindow a  ->  IO (GlWindow ())
glWindowAsGlWindow win = withObject win $ \winPtr -> asGlWindow' winPtr

{# fun unsafe Fl_Gl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
glWindowHandleSuper :: GlWindow a  -> Int ->  IO (Int)
glWindowHandleSuper self event = withObject self $ \selfPtr -> handleSuper' selfPtr event

{# fun Fl_Gl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowDestroy :: GlWindow a -> IO ()
glWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun unsafe Fl_Gl_Window_valid as valid' { id `Ptr ()' } -> `Bool' #}
glWindowValid :: GlWindow a  ->  IO (Bool)
glWindowValid win = withObject win $ \winPtr -> valid' winPtr


{# fun unsafe Fl_Gl_Window_set_valid as setValid' { `Bool' } -> `()' supressWarningAboutRes #}
glWindowSetValid :: Bool ->  IO (())
glWindowSetValid v = setValid' v

{# fun unsafe Fl_Gl_Window_invalidate as invalidate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowInvalidate :: GlWindow a  ->  IO (())
glWindowInvalidate win = withObject win $ \winPtr -> invalidate' winPtr

{# fun unsafe Fl_Gl_Window_context_valid as contextValid' { id `Ptr ()' } -> `Bool' toBool #}
glWindowContextValid :: GlWindow a  ->  IO (Bool)
glWindowContextValid win = withObject win $ \winPtr -> contextValid' winPtr

{# fun unsafe Fl_Gl_Window_set_context_valid as setContextValid' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
glWindowSetContextValid :: GlWindow a  -> Bool ->  IO (())
glWindowSetContextValid win v = withObject win $ \winPtr -> setContextValid' winPtr v

{# fun unsafe Fl_Gl_Window_can_do_with_m as canDoWithM' { id `Ptr ()',`Int' } -> `Int' #}
glWindowCanDoWithM :: GlWindow a  -> Int ->  IO (Int)
glWindowCanDoWithM win m = withObject win $ \winPtr -> canDoWithM' winPtr m

{# fun unsafe Fl_Gl_Window_can_do as canDo' { id `Ptr ()' } -> `Int' #}
glWindowCanDo :: GlWindow a  ->  IO (Int)
glWindowCanDo win = withObject win $ \winPtr -> canDo' winPtr

{# fun unsafe Fl_Gl_Window_mode as mode' { id `Ptr ()' } -> `Mode' cToEnum #}
glWindowMode :: GlWindow a  ->  IO (Mode)
glWindowMode win = withObject win $ \winPtr -> mode' winPtr

{# fun unsafe Fl_Gl_Window_set_mode as setMode' { id `Ptr ()',cFromEnum `Mode' } -> `Int' #}
glWindowSetMode :: GlWindow a  -> Mode ->  IO (Int)
glWindowSetMode win a = withObject win $ \winPtr -> setMode' winPtr a

{# fun unsafe Fl_Gl_Window_context as context' { id `Ptr ()' } -> `GlContext' unsafeToObject #}
glWindowContext :: GlWindow a  ->  IO GlContext
glWindowContext win = withObject win $ \winPtr -> context' winPtr

{# fun unsafe Fl_Gl_Window_set_context as setContext' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowSetContext :: GlWindow a  -> GlContext ->  IO (())
glWindowSetContext win context = withObject win $ \winPtr -> withObject context $ \contextPtr -> setContext' winPtr contextPtr

{# fun unsafe Fl_Gl_Window_set_context_with_destroy_flag as setContextWithDestroyFlag' { id `Ptr ()',id `Ptr ()', fromBool `Bool'} -> `()' supressWarningAboutRes #}
glWindowSetContextWithDestroyFlag :: GlWindow a  -> GlContext ->  Bool -> IO (())
glWindowSetContextWithDestroyFlag win context destroyFlag= withObject win $ \winPtr -> withObject context $ \contextPtr -> setContextWithDestroyFlag' winPtr contextPtr destroyFlag

{# fun unsafe Fl_Gl_Window_swap_buffers as swapBuffers' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowSwapBuffers :: GlWindow a  ->  IO (())
glWindowSwapBuffers win = withObject win $ \winPtr -> swapBuffers' winPtr

{# fun unsafe Fl_Gl_Window_ortho as ortho' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowOrtho :: GlWindow a  ->  IO (())
glWindowOrtho win = withObject win $ \winPtr -> ortho' winPtr

{# fun unsafe Fl_Gl_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
glWindowCanDoOverlay :: GlWindow a  ->  IO (Int)
glWindowCanDoOverlay win = withObject win $ \winPtr -> canDoOverlay' winPtr

{# fun unsafe Fl_Gl_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowRedrawOverlay :: GlWindow a  ->  IO (())
glWindowRedrawOverlay win = withObject win $ \winPtr -> redrawOverlay' winPtr

{# fun unsafe Fl_Gl_Window_hide_overlay as hideOverlay' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowHideOverlay :: GlWindow a  ->  IO (())
glWindowHideOverlay win = withObject win $ \winPtr -> hideOverlay' winPtr

{# fun unsafe Fl_Gl_Window_make_overlay_current as makeOverlayCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
glWindowMakeOverlayCurrent :: GlWindow a  ->  IO (())
glWindowMakeOverlayCurrent win = withObject win $ \winPtr -> makeOverlayCurrent' winPtr

glWindowSetCallback :: GlWindow a -> WidgetCallback b -> IO ()
glWindowSetCallback = windowSetCallback
glWindowParent :: GlWindow a -> IO (Group ())
glWindowParent = windowParent
glWindowSetParent :: GlWindow a -> Group b -> IO ()
glWindowSetParent = windowSetParent
glWindowType_ :: GlWindow a  ->  IO (Word8)
glWindowType_ = windowType_
glWindowSetType :: GlWindow a  -> Word8 ->  IO (())
glWindowSetType = windowSetType
glWindowDrawLabel :: GlWindow a  -> Maybe (Rectangle,AlignType)->  IO (())
glWindowDrawLabel = windowDrawLabel
glWindowX :: GlWindow a  ->  IO (Int)
glWindowX = windowX
glWindowY :: GlWindow a  ->  IO (Int)
glWindowY = windowY
glWindowW :: GlWindow a  ->  IO (Int)
glWindowW = windowW
glWindowH :: GlWindow a  ->  IO (Int)
glWindowH = windowH
glWindowSetAlign :: GlWindow a  -> AlignType ->  IO (())
glWindowSetAlign = windowSetAlign
glWindowAlign :: GlWindow a  ->  IO (AlignType)
glWindowAlign = windowAlign
glWindowBox :: GlWindow a  ->  IO (Boxtype)
glWindowBox = windowBox
glWindowSetBox :: GlWindow a  -> Boxtype ->  IO (())
glWindowSetBox = windowSetBox
glWindowColor :: GlWindow a  ->  IO (Color)
glWindowColor = windowColor
glWindowSetColor :: GlWindow a  -> Color ->  IO (())
glWindowSetColor = windowSetColor
glWindowSetColorWithBgSel :: GlWindow a  -> Color -> Color ->  IO (())
glWindowSetColorWithBgSel = windowSetColorWithBgSel
glWindowSelectionColor :: GlWindow a  ->  IO (Color)
glWindowSelectionColor = windowSelectionColor
glWindowSetSelectionColor :: GlWindow a  -> Color ->  IO (())
glWindowSetSelectionColor = windowSetSelectionColor
glWindowLabeltype :: GlWindow a  ->  IO (Labeltype)
glWindowLabeltype = windowLabeltype
glWindowSetLabeltype :: GlWindow a  -> Labeltype ->  IO (())
glWindowSetLabeltype = windowSetLabeltype
glWindowLabelcolor :: GlWindow a  ->  IO (Color)
glWindowLabelcolor = windowLabelcolor
glWindowSetLabelcolor :: GlWindow a  -> Color ->  IO (())
glWindowSetLabelcolor = windowSetLabelcolor
glWindowLabelfont :: GlWindow a  ->  IO (Font)
glWindowLabelfont = windowLabelfont
glWindowSetLabelfont :: GlWindow a  -> Font ->  IO (())
glWindowSetLabelfont = windowSetLabelfont
glWindowLabelsize :: GlWindow a  ->  IO (FontSize)
glWindowLabelsize = windowLabelsize
glWindowSetLabelsize :: GlWindow a  -> FontSize ->  IO (())
glWindowSetLabelsize = windowSetLabelsize
glWindowImage :: GlWindow a  ->  IO (Image ())
glWindowImage = windowImage
glWindowSetImage :: GlWindow a  -> Image b ->  IO (())
glWindowSetImage = windowSetImage
glWindowDeimage :: GlWindow a  ->  IO (Image ())
glWindowDeimage = windowDeimage
glWindowSetDeimage :: GlWindow a  -> Image b ->  IO (())
glWindowSetDeimage = windowSetDeimage
glWindowTooltip :: GlWindow a  ->  IO (String)
glWindowTooltip = windowTooltip
glWindowCopyTooltip :: GlWindow a  -> String ->  IO (())
glWindowCopyTooltip = windowCopyTooltip
glWindowSetTooltip :: GlWindow a  -> String ->  IO (())
glWindowSetTooltip = windowSetTooltip
glWindowWhen :: GlWindow a  ->  IO (When)
glWindowWhen = windowWhen
glWindowSetWhen :: GlWindow a  -> Word8 ->  IO (())
glWindowSetWhen = windowSetWhen
glWindowVisible :: GlWindow a  ->  IO (Int)
glWindowVisible = windowVisible
glWindowVisibleR :: GlWindow a  ->  IO (Int)
glWindowVisibleR = windowVisibleR
glWindowSetVisible :: GlWindow a  ->  IO (())
glWindowSetVisible = windowSetVisible
glWindowClearVisible :: GlWindow a  ->  IO (())
glWindowClearVisible = windowClearVisible
glWindowActive :: GlWindow a  ->  IO (Int)
glWindowActive = windowActive
glWindowActiveR :: GlWindow a  ->  IO (Int)
glWindowActiveR = windowActiveR
glWindowActivate :: GlWindow a  ->  IO (())
glWindowActivate = windowActivate
glWindowDeactivate :: GlWindow a  ->  IO (())
glWindowDeactivate = windowDeactivate
glWindowOutput :: GlWindow a  ->  IO (Int)
glWindowOutput = windowOutput
glWindowSetOutput :: GlWindow a  ->  IO (())
glWindowSetOutput = windowSetOutput
glWindowClearOutput :: GlWindow a  ->  IO (())
glWindowClearOutput = windowClearOutput
glWindowTakesevents :: GlWindow a  ->  IO (Int)
glWindowTakesevents = windowTakesevents
glWindowSetChanged :: GlWindow a  ->  IO (())
glWindowSetChanged = windowSetChanged
glWindowClearChanged :: GlWindow a  ->  IO (())
glWindowClearChanged = windowClearChanged
glWindowTakeFocus :: GlWindow a  ->  IO (Int)
glWindowTakeFocus = windowTakeFocus
glWindowSetVisibleFocus :: GlWindow a  ->  IO (())
glWindowSetVisibleFocus = windowSetVisibleFocus
glWindowClearVisibleFocus :: GlWindow a  ->  IO (())
glWindowClearVisibleFocus = windowClearVisibleFocus
glWindowModifyVisibleFocus :: GlWindow a  -> Int ->  IO (())
glWindowModifyVisibleFocus = windowModifyVisibleFocus
glWindowVisibleFocus :: GlWindow a  ->  IO (Int)
glWindowVisibleFocus = windowVisibleFocus
glWindowContains :: GlWindow a  -> Group a  ->  IO (Int)
glWindowContains = windowContains
glWindowInside :: GlWindow a  -> Group a  ->  IO (Int)
glWindowInside = windowInside
glWindowRedraw :: GlWindow a  ->  IO (())
glWindowRedraw = windowRedraw
glWindowRedrawLabel :: GlWindow a  ->  IO (())
glWindowRedrawLabel = windowRedrawLabel
glWindowDamage :: GlWindow a  ->  IO (Word8)
glWindowDamage = windowDamage
glWindowClearDamageWithBitmask :: GlWindow a  -> Word8 ->  IO (())
glWindowClearDamageWithBitmask = windowClearDamageWithBitmask
glWindowClearDamage :: GlWindow a  ->  IO (())
glWindowClearDamage = windowClearDamage
glWindowDamageWithText :: GlWindow a  -> Word8 ->  IO (())
glWindowDamageWithText = windowDamageWithText
glWindowDamageInsideWidget :: GlWindow a  -> Word8 -> Rectangle ->  IO (())
glWindowDamageInsideWidget = windowDamageInsideWidget
glWindowMeasureLabel :: GlWindow a  -> IO (Size)
glWindowMeasureLabel = windowMeasureLabel
glWindowWindow :: GlWindow a  ->  IO (Window ())
glWindowWindow = windowWindow
glWindowTopWindow :: GlWindow a  ->  IO (Window ())
glWindowTopWindow = windowTopWindow
glWindowTopWindowOffset :: GlWindow a -> IO (Position)
glWindowTopWindowOffset = windowTopWindowOffset
glWindowBegin :: GlWindow a  ->  IO (())
glWindowBegin = windowBegin
glWindowEnd :: GlWindow a  ->  IO (())
glWindowEnd = windowEnd
glWindowFind :: GlWindow a  -> Widget a  ->  IO (Int)
glWindowFind = windowFind
glWindowAdd :: GlWindow a  -> Widget a  ->  IO (())
glWindowAdd = windowAdd
glWindowInsert :: GlWindow a  -> Widget a  -> Int ->  IO (())
glWindowInsert = windowInsert
glWindowRemoveIndex :: GlWindow a  -> Int ->  IO (())
glWindowRemoveIndex = windowRemoveIndex
glWindowRemoveWidget :: GlWindow a  -> Widget a  ->  IO (())
glWindowRemoveWidget = windowRemoveWidget
glWindowClear :: GlWindow a  ->  IO (())
glWindowClear = windowClear
glWindowSetResizable :: GlWindow a  -> Widget a  ->  IO (())
glWindowSetResizable = windowSetResizable
glWindowResizable :: GlWindow a  ->  IO (Widget ())
glWindowResizable = windowResizable
glWindowAddResizable :: GlWindow a  -> Widget a  ->  IO (())
glWindowAddResizable = windowAddResizable
glWindowInitSizes :: GlWindow a  ->  IO (())
glWindowInitSizes = windowInitSizes
glWindowChildren :: GlWindow a  ->  IO (Int)
glWindowChildren = windowChildren
glWindowSetClipChildren :: GlWindow a  -> Int ->  IO (())
glWindowSetClipChildren = windowSetClipChildren
glWindowClipChildren :: GlWindow a  ->  IO (Int)
glWindowClipChildren = windowClipChildren
glWindowFocus :: GlWindow a  -> Widget a  ->  IO (())
glWindowFocus = windowFocus
glWindowDdfdesignKludge :: GlWindow a  ->  IO (Widget ())
glWindowDdfdesignKludge = windowDdfdesignKludge
glWindowInsertWithBefore :: GlWindow a  -> Widget b  -> Widget c  ->  IO (())
glWindowInsertWithBefore = windowInsertWithBefore
glWindowArray :: GlWindow a  ->  IO [(Widget ())]
glWindowArray = windowArray
glWindowChild :: GlWindow a  -> Int ->  IO (Widget ())
glWindowChild = windowChild
glWindowChanged :: GlWindow a  ->  IO (Int)
glWindowChanged = windowChanged
glWindowFullscreen :: GlWindow a  ->  IO (())
glWindowFullscreen = windowFullscreen
glWindowFullscreenOff :: GlWindow a -> Maybe Rectangle ->  IO (())
glWindowFullscreenOff = windowFullscreenOff
glWindowSetBorder :: GlWindow a  -> Bool ->  IO (())
glWindowSetBorder = windowSetBorder
glWindowClearBorder :: GlWindow a  ->  IO (())
glWindowClearBorder = windowClearBorder
glWindowBorder :: GlWindow a  ->  IO (Bool)
glWindowBorder = windowBorder
glWindowSetOverride :: GlWindow a  ->  IO (())
glWindowSetOverride = windowSetOverride
glWindowOverride :: GlWindow a  ->  IO (Bool)
glWindowOverride = windowOverride
glWindowSetModal :: GlWindow a  ->  IO (())
glWindowSetModal = windowSetModal
glWindowModal :: GlWindow a  ->  IO (Bool)
glWindowModal = windowModal
glWindowSetNonModal :: GlWindow a  ->  IO (())
glWindowSetNonModal = windowSetNonModal
glWindowNonModal :: GlWindow a  ->  IO (Bool)
glWindowNonModal = windowNonModal
glWindowSetMenuWindow :: GlWindow a  ->  IO (())
glWindowSetMenuWindow = windowSetMenuWindow
glWindowMenuWindow :: GlWindow a  ->  IO (Bool)
glWindowMenuWindow = windowMenuWindow
glWindowSetTooltipWindow :: GlWindow a  ->  IO (())
glWindowSetTooltipWindow = windowSetTooltipWindow
glWindowTooltipWindow :: GlWindow a  ->  IO (Bool)
glWindowTooltipWindow = windowTooltipWindow
glWindowHotSpot :: GlWindow a -> PositionSpec b -> Maybe Bool -> IO ()
glWindowHotSpot = windowHotSpot
glWindowFreePosition :: GlWindow a  ->  IO (())
glWindowFreePosition = windowFreePosition
glWindowSizeRange :: GlWindow a  -> Int -> Int -> IO (())
glWindowSizeRange = windowSizeRange
glWindowSizeRangeWithArgs :: GlWindow a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
glWindowSizeRangeWithArgs = windowSizeRangeWithArgs
glWindowLabel :: GlWindow a  ->  IO (String)
glWindowLabel = windowLabel
glWindowIconlabel :: GlWindow a  ->  IO (String)
glWindowIconlabel = windowIconlabel
glWindowSetLabel :: GlWindow a  -> String ->  IO (())
glWindowSetLabel = windowSetLabel
glWindowSetIconlabel :: GlWindow a  -> String ->  IO (())
glWindowSetIconlabel = windowSetIconlabel
glWindowSetLabelWithIconlabel :: GlWindow a  -> String -> String ->  IO (())
glWindowSetLabelWithIconlabel = windowSetLabelWithIconlabel
glWindowCopyLabel :: GlWindow a  -> String ->  IO (())
glWindowCopyLabel = windowCopyLabel
glWindowSetDefaultXclass :: String ->  IO (())
glWindowSetDefaultXclass = windowSetDefaultXclass
glWindowDefaultXclass ::  IO (String)
glWindowDefaultXclass = windowDefaultXclass
glWindowXclass :: GlWindow a  ->  IO (String)
glWindowXclass = windowXclass
glWindowSetXclass :: GlWindow a  -> String ->  IO (())
glWindowSetXclass = windowSetXclass
glWindowIcon :: GlWindow a  ->  IO (Ptr ())
glWindowIcon = windowIcon
glWindowSetIcon :: GlWindow a  -> Ptr () ->  IO (())
glWindowSetIcon = windowSetIcon
glWindowShown :: GlWindow a  ->  IO (Bool)
glWindowShown = windowShown
glWindowIconize :: GlWindow a  ->  IO (())
glWindowIconize = windowIconize
glWindowXRoot :: GlWindow a  ->  IO (Int)
glWindowXRoot = windowXRoot
glWindowYRoot :: GlWindow a  ->  IO (Int)
glWindowYRoot = windowYRoot
glWindowCurrent ::  IO (Ptr ())
glWindowCurrent = windowCurrent
glWindowMakeCurrent :: GlWindow a  ->  IO (())
glWindowMakeCurrent = windowMakeCurrent
glWindowSetCursor :: GlWindow a -> CursorType -> IO ()
glWindowSetCursor = windowSetCursor
glWindowSetCursorWithFgBg :: GlWindow a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
glWindowSetCursorWithFgBg = windowSetCursorWithFgBg
glWindowSetDefaultCursor :: GlWindow a  -> CursorType ->  IO (())
glWindowSetDefaultCursor = windowSetDefaultCursor
glWindowDecoratedW :: GlWindow a  ->  IO (Int)
glWindowDecoratedW = windowDecoratedW
glWindowDecoratedH :: GlWindow a  ->  IO (Int)
glWindowDecoratedH = windowDecoratedH
