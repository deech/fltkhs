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
import Graphics.UI.FLTK.LowLevel.Fl_Double_Window
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
glWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe (GlWindowFuncs a) -> IO (Window ())
glWindowNew (Size (Width w) (Height h)) position title funcs' =
    let makeObject = objectOrError "glWindowNew: object construction returned a null pointer"
    in case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= makeObject
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= makeObject
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= makeObject
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= makeObject
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= makeObject
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= makeObject
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= makeObject
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- glWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= makeObject

{# fun unsafe Fl_Gl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
glWindowDrawSuper :: GlWindow a  ->  IO (())
glWindowDrawSuper self = withObject self $ \selfPtr -> drawSuper' selfPtr

{# fun unsafe Fl_Gl_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
glWindowAsGroupSuper :: GlWindow a  ->  IO (Maybe (Group ()))
glWindowAsGroupSuper win = withObject win $ \winPtr -> asGroupSuper' winPtr

{# fun unsafe Fl_Gl_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
glWindowAsWindowSuper :: GlWindow a  ->  IO (Maybe (Window ()))
glWindowAsWindowSuper win = withObject win $ \winPtr -> asWindowSuper' winPtr

{# fun unsafe Fl_Gl_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
glWindowAsGlWindowSuper :: GlWindow a  ->  IO (Maybe (GlWindow ()))
glWindowAsGlWindowSuper win = withObject win $ \winPtr -> asGlWindowSuper' winPtr

{# fun unsafe Fl_Gl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' #}
glWindowHideSuper :: GlWindow a  ->  IO (())
glWindowHideSuper win = withObject win $ \winPtr -> hideSuper' winPtr

{# fun unsafe Fl_Gl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' #}
glWindowFlushSuper :: GlWindow a  ->  IO (())
glWindowFlushSuper win = withObject win $ \winPtr -> flushSuper' winPtr

{# fun unsafe Fl_Gl_Window_flush as flush' { id `Ptr ()' } -> `()' #}
glWindowFlush :: GlWindow a  ->  IO (())
glWindowFlush win = withObject win $ \winPtr -> flush' winPtr

{# fun unsafe Fl_Gl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' #}
glWindowShowSuper :: GlWindow a  ->  IO (())
glWindowShowSuper win = withObject win $ \winPtr -> showSuper' winPtr

{# fun unsafe Fl_Gl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
glWindowResizeSuper :: GlWindow a  -> Int -> Int -> Int -> Int ->  IO (())
glWindowResizeSuper win x y w h = withObject win $ \winPtr -> resizeSuper' winPtr x y w h

{# fun unsafe Fl_Gl_Window_hide as hide' { id `Ptr ()' } -> `()' #}
glWindowHide :: GlWindow a  ->  IO (())
glWindowHide win = withObject win $ \winPtr -> hide' winPtr

{# fun unsafe Fl_Gl_Window_show as show' { id `Ptr ()' } -> `()' #}
glWindowShow :: GlWindow a  ->  IO (())
glWindowShow win = withObject win $ \winPtr -> show' winPtr

{# fun unsafe Fl_Gl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
glWindowResize :: GlWindow a  -> Int -> Int -> Int -> Int ->  IO (())
glWindowResize win x y w h = withObject win $ \winPtr -> resize' winPtr x y w h

{# fun unsafe Fl_Gl_Window_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
glWindowHandle :: GlWindow a  -> Int ->  IO (Int)
glWindowHandle self event = withObject self $ \selfPtr -> handle' selfPtr event

{# fun unsafe Fl_Gl_Window_as_group as asGroup' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
glWindowAsGroup :: GlWindow a  ->  IO (Maybe (Group ()))
glWindowAsGroup win = withObject win $ \winPtr -> asGroup' winPtr

{# fun unsafe Fl_Gl_Window_as_window as asWindow' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
glWindowAsWindow :: GlWindow a  ->  IO (Maybe (Window ()))
glWindowAsWindow win = withObject win $ \winPtr -> asWindow' winPtr

{# fun unsafe Fl_Gl_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
glWindowAsGlWindow :: GlWindow a  ->  IO (Maybe (GlWindow ()))
glWindowAsGlWindow win = withObject win $ \winPtr -> asGlWindow' winPtr

{# fun unsafe Fl_Gl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
glWindowHandleSuper :: GlWindow a  -> Int ->  IO (Int)
glWindowHandleSuper self event = withObject self $ \selfPtr -> handleSuper' selfPtr event

{# fun Fl_Gl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' #}
glWindowDestroy :: GlWindow a -> IO ()
glWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun unsafe Fl_Gl_Window_valid as valid' { id `Ptr ()' } -> `Bool' #}
glWindowValid :: GlWindow a  ->  IO (Bool)
glWindowValid win = withObject win $ \winPtr -> valid' winPtr


{# fun unsafe Fl_Gl_Window_set_valid as setValid' { `Bool' } -> `()' #}
glWindowSetValid :: Bool ->  IO (())
glWindowSetValid v = setValid' v

{# fun unsafe Fl_Gl_Window_invalidate as invalidate' { id `Ptr ()' } -> `()' #}
glWindowInvalidate :: GlWindow a  ->  IO (())
glWindowInvalidate win = withObject win $ \winPtr -> invalidate' winPtr

{# fun unsafe Fl_Gl_Window_context_valid as contextValid' { id `Ptr ()' } -> `Bool' toBool #}
glWindowContextValid :: GlWindow a  ->  IO (Bool)
glWindowContextValid win = withObject win $ \winPtr -> contextValid' winPtr

{# fun unsafe Fl_Gl_Window_set_context_valid as setContextValid' { id `Ptr ()', fromBool `Bool' } -> `()' #}
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

{# fun unsafe Fl_Gl_Window_set_mode as setMode' { id `Ptr ()',`Int' } -> `Int' #}
glWindowSetMode :: GlWindow a  -> Int ->  IO (Int)
glWindowSetMode win a = withObject win $ \winPtr -> setMode' winPtr a

{# fun unsafe Fl_Gl_Window_context as context' { id `Ptr ()' } -> `Maybe GlContext' toObject #}
glWindowContext :: GlWindow a  ->  IO (Maybe GlContext)
glWindowContext win = withObject win $ \winPtr -> context' winPtr

{# fun unsafe Fl_Gl_Window_set_context as setContext' { id `Ptr ()',id `Ptr ()' } -> `()' #}
glWindowSetContext :: GlWindow a  -> GlContext ->  IO (())
glWindowSetContext win context = withObject win $ \winPtr -> withObject context $ \contextPtr -> setContext' winPtr contextPtr

{# fun unsafe Fl_Gl_Window_set_context_with_destroy_flag as setContextWithDestroyFlag' { id `Ptr ()',id `Ptr ()', fromBool `Bool'} -> `()' #}
glWindowSetContextWithDestroyFlag :: GlWindow a  -> GlContext ->  Bool -> IO (())
glWindowSetContextWithDestroyFlag win context destroyFlag= withObject win $ \winPtr -> withObject context $ \contextPtr -> setContextWithDestroyFlag' winPtr contextPtr destroyFlag

{# fun unsafe Fl_Gl_Window_swap_buffers as swapBuffers' { id `Ptr ()' } -> `()' #}
glWindowSwapBuffers :: GlWindow a  ->  IO (())
glWindowSwapBuffers win = withObject win $ \winPtr -> swapBuffers' winPtr

{# fun unsafe Fl_Gl_Window_ortho as ortho' { id `Ptr ()' } -> `()' #}
glWindowOrtho :: GlWindow a  ->  IO (())
glWindowOrtho win = withObject win $ \winPtr -> ortho' winPtr

{# fun unsafe Fl_Gl_Window_can_do_overlay as canDoOverlay' { id `Ptr ()' } -> `Int' #}
glWindowCanDoOverlay :: GlWindow a  ->  IO (Int)
glWindowCanDoOverlay win = withObject win $ \winPtr -> canDoOverlay' winPtr

{# fun unsafe Fl_Gl_Window_redraw_overlay as redrawOverlay' { id `Ptr ()' } -> `()' #}
glWindowRedrawOverlay :: GlWindow a  ->  IO (())
glWindowRedrawOverlay win = withObject win $ \winPtr -> redrawOverlay' winPtr

{# fun unsafe Fl_Gl_Window_hide_overlay as hideOverlay' { id `Ptr ()' } -> `()' #}
glWindowHideOverlay :: GlWindow a  ->  IO (())
glWindowHideOverlay win = withObject win $ \winPtr -> hideOverlay' winPtr

{# fun unsafe Fl_Gl_Window_make_overlay_current as makeOverlayCurrent' { id `Ptr ()' } -> `()' #}
glWindowMakeOverlayCurrent :: GlWindow a  ->  IO (())
glWindowMakeOverlayCurrent win = withObject win $ \winPtr -> makeOverlayCurrent' winPtr

glWindowSetCallback :: Window a -> WidgetCallback b -> IO ()
glWindowSetCallback = doubleWindowSetCallback
glWindowParent :: Group a -> IO (Maybe (Group ()))
glWindowParent = doubleWindowParent
glWindowSetParent :: Group a -> Group b -> IO ()
glWindowSetParent = doubleWindowSetParent
glWindowType_ :: Group a  ->  IO (Word8)
glWindowType_ = doubleWindowType_
glWindowSetType :: Group a  -> Word8 ->  IO (())
glWindowSetType = doubleWindowSetType
glWindowDrawLabel :: Group a  -> Maybe (Rectangle,AlignType)->  IO (())
glWindowDrawLabel = doubleWindowDrawLabel
glWindowX :: Group a  ->  IO (Int)
glWindowX = doubleWindowX
glWindowY :: Group a  ->  IO (Int)
glWindowY = doubleWindowY
glWindowW :: Group a  ->  IO (Int)
glWindowW = doubleWindowW
glWindowH :: Group a  ->  IO (Int)
glWindowH = doubleWindowH
glWindowSetAlign :: Group a  -> AlignType ->  IO (())
glWindowSetAlign = doubleWindowSetAlign
glWindowAlign :: Group a  ->  IO (AlignType)
glWindowAlign = doubleWindowAlign
glWindowBox :: Group a  ->  IO (Boxtype)
glWindowBox = doubleWindowBox
glWindowSetBox :: Group a  -> Boxtype ->  IO (())
glWindowSetBox = doubleWindowSetBox
glWindowColor :: Group a  ->  IO (Color)
glWindowColor = doubleWindowColor
glWindowSetColor :: Group a  -> Color ->  IO (())
glWindowSetColor = doubleWindowSetColor
glWindowSetColorWithBgSel :: Group a  -> Color -> Color ->  IO (())
glWindowSetColorWithBgSel = doubleWindowSetColorWithBgSel
glWindowSelectionColor :: Group a  ->  IO (Color)
glWindowSelectionColor = doubleWindowSelectionColor
glWindowSetSelectionColor :: Group a  -> Color ->  IO (())
glWindowSetSelectionColor = doubleWindowSetSelectionColor
glWindowLabeltype :: Group a  ->  IO (Labeltype)
glWindowLabeltype = doubleWindowLabeltype
glWindowSetLabeltype :: Group a  -> Labeltype ->  IO (())
glWindowSetLabeltype = doubleWindowSetLabeltype
glWindowLabelcolor :: Group a  ->  IO (Color)
glWindowLabelcolor = doubleWindowLabelcolor
glWindowSetLabelcolor :: Group a  -> Color ->  IO (())
glWindowSetLabelcolor = doubleWindowSetLabelcolor
glWindowLabelfont :: Group a  ->  IO (Font)
glWindowLabelfont = doubleWindowLabelfont
glWindowSetLabelfont :: Group a  -> Font ->  IO (())
glWindowSetLabelfont = doubleWindowSetLabelfont
glWindowLabelsize :: Group a  ->  IO (FontSize)
glWindowLabelsize = doubleWindowLabelsize
glWindowSetLabelsize :: Group a  -> FontSize ->  IO (())
glWindowSetLabelsize = doubleWindowSetLabelsize
glWindowImage :: Group a  ->  IO (Maybe (Image ()))
glWindowImage = doubleWindowImage
glWindowSetImage :: Group a  -> Image b ->  IO (())
glWindowSetImage = doubleWindowSetImage
glWindowDeimage :: Group a  ->  IO (Maybe (Image ()))
glWindowDeimage = doubleWindowDeimage
glWindowSetDeimage :: Group a  -> Image b ->  IO (())
glWindowSetDeimage = doubleWindowSetDeimage
glWindowTooltip :: Group a  ->  IO (String)
glWindowTooltip = doubleWindowTooltip
glWindowCopyTooltip :: Group a  -> String ->  IO (())
glWindowCopyTooltip = doubleWindowCopyTooltip
glWindowSetTooltip :: Group a  -> String ->  IO (())
glWindowSetTooltip = doubleWindowSetTooltip
glWindowWhen :: Group a  ->  IO (When)
glWindowWhen = doubleWindowWhen
glWindowSetWhen :: Group a  -> Word8 ->  IO (())
glWindowSetWhen = doubleWindowSetWhen
glWindowVisible :: Group a  ->  IO (Int)
glWindowVisible = doubleWindowVisible
glWindowVisibleR :: Group a  ->  IO (Int)
glWindowVisibleR = doubleWindowVisibleR
glWindowSetVisible :: Group a  ->  IO (())
glWindowSetVisible = doubleWindowSetVisible
glWindowClearVisible :: Group a  ->  IO (())
glWindowClearVisible = doubleWindowClearVisible
glWindowActive :: Group a  ->  IO (Int)
glWindowActive = doubleWindowActive
glWindowActiveR :: Group a  ->  IO (Int)
glWindowActiveR = doubleWindowActiveR
glWindowActivate :: Group a  ->  IO (())
glWindowActivate = doubleWindowActivate
glWindowDeactivate :: Group a  ->  IO (())
glWindowDeactivate = doubleWindowDeactivate
glWindowOutput :: Group a  ->  IO (Int)
glWindowOutput = doubleWindowOutput
glWindowSetOutput :: Group a  ->  IO (())
glWindowSetOutput = doubleWindowSetOutput
glWindowClearOutput :: Group a  ->  IO (())
glWindowClearOutput = doubleWindowClearOutput
glWindowTakesevents :: Group a  ->  IO (Int)
glWindowTakesevents = doubleWindowTakesevents
glWindowSetChanged :: Group a  ->  IO (())
glWindowSetChanged = doubleWindowSetChanged
glWindowClearChanged :: Group a  ->  IO (())
glWindowClearChanged = doubleWindowClearChanged
glWindowTakeFocus :: Group a  ->  IO (Int)
glWindowTakeFocus = doubleWindowTakeFocus
glWindowSetVisibleFocus :: Group a  ->  IO (())
glWindowSetVisibleFocus = doubleWindowSetVisibleFocus
glWindowClearVisibleFocus :: Group a  ->  IO (())
glWindowClearVisibleFocus = doubleWindowClearVisibleFocus
glWindowModifyVisibleFocus :: Group a  -> Int ->  IO (())
glWindowModifyVisibleFocus = doubleWindowModifyVisibleFocus
glWindowVisibleFocus :: Group a  ->  IO (Int)
glWindowVisibleFocus = doubleWindowVisibleFocus
glWindowContains :: Group a  -> Group a  ->  IO (Int)
glWindowContains = doubleWindowContains
glWindowInside :: Group a  -> Group a  ->  IO (Int)
glWindowInside = doubleWindowInside
glWindowRedraw :: Group a  ->  IO (())
glWindowRedraw = doubleWindowRedraw
glWindowRedrawLabel :: Group a  ->  IO (())
glWindowRedrawLabel = doubleWindowRedrawLabel
glWindowDamage :: Group a  ->  IO (Word8)
glWindowDamage = doubleWindowDamage
glWindowClearDamageWithBitmask :: Group a  -> Word8 ->  IO (())
glWindowClearDamageWithBitmask = doubleWindowClearDamageWithBitmask
glWindowClearDamage :: Group a  ->  IO (())
glWindowClearDamage = doubleWindowClearDamage
glWindowDamageWithText :: Group a  -> Word8 ->  IO (())
glWindowDamageWithText = doubleWindowDamageWithText
glWindowDamageInsideWidget :: Group a  -> Word8 -> Rectangle ->  IO (())
glWindowDamageInsideWidget = doubleWindowDamageInsideWidget
glWindowMeasureLabel :: Group a  -> IO (Size)
glWindowMeasureLabel = doubleWindowMeasureLabel
glWindowWindow :: Group a  ->  IO (Maybe (Window ()))
glWindowWindow = doubleWindowWindow
glWindowTopWindow :: Group a  ->  IO (Maybe (Window ()))
glWindowTopWindow = doubleWindowTopWindow
glWindowTopWindowOffset :: Group a -> IO (Position)
glWindowTopWindowOffset = doubleWindowTopWindowOffset
glWindowBegin :: Group a  ->  IO (())
glWindowBegin = doubleWindowBegin
glWindowEnd :: Group a  ->  IO (())
glWindowEnd = doubleWindowEnd
glWindowFind :: Group a  -> Widget a  ->  IO (Int)
glWindowFind = doubleWindowFind
glWindowAdd :: Group a  -> Widget a  ->  IO (())
glWindowAdd = doubleWindowAdd
glWindowInsert :: Group a  -> Widget a  -> Int ->  IO (())
glWindowInsert = doubleWindowInsert
glWindowRemoveIndex :: Group a  -> Int ->  IO (())
glWindowRemoveIndex = doubleWindowRemoveIndex
glWindowRemoveWidget :: Group a  -> Widget a  ->  IO (())
glWindowRemoveWidget = doubleWindowRemoveWidget
glWindowClear :: Group a  ->  IO (())
glWindowClear = doubleWindowClear
glWindowSetResizable :: Group a  -> Widget a  ->  IO (())
glWindowSetResizable = doubleWindowSetResizable
glWindowResizable :: Group a  ->  IO (Maybe (Widget ()))
glWindowResizable = doubleWindowResizable
glWindowAddResizable :: Group a  -> Widget a  ->  IO (())
glWindowAddResizable = doubleWindowAddResizable
glWindowInitSizes :: Group a  ->  IO (())
glWindowInitSizes = doubleWindowInitSizes
glWindowChildren :: Group a  ->  IO (Int)
glWindowChildren = doubleWindowChildren
glWindowSetClipChildren :: Group a  -> Int ->  IO (())
glWindowSetClipChildren = doubleWindowSetClipChildren
glWindowClipChildren :: Group a  ->  IO (Int)
glWindowClipChildren = doubleWindowClipChildren
glWindowFocus :: Group a  -> Widget a  ->  IO (())
glWindowFocus = doubleWindowFocus
glWindowDdfdesignKludge :: Group a  ->  IO (Maybe (Widget ()))
glWindowDdfdesignKludge = doubleWindowDdfdesignKludge
glWindowInsertWithBefore :: Group a  -> Widget a  -> Widget a  ->  IO (())
glWindowInsertWithBefore = doubleWindowInsertWithBefore
glWindowArray :: Group a  ->  IO [Maybe (Widget ())]
glWindowArray = doubleWindowArray
glWindowChild :: Group a  -> Int ->  IO (Maybe (Widget ()))
glWindowChild = doubleWindowChild
glWindowChanged :: Window a  ->  IO (Int)
glWindowChanged = doubleWindowChanged
glWindowFullscreen :: Window a  ->  IO (())
glWindowFullscreen = doubleWindowFullscreen
glWindowFullscreenOff :: Window a -> Maybe Rectangle ->  IO (())
glWindowFullscreenOff = doubleWindowFullscreenOff
glWindowSetBorder :: Window a  -> Bool ->  IO (())
glWindowSetBorder = doubleWindowSetBorder
glWindowClearBorder :: Window a  ->  IO (())
glWindowClearBorder = doubleWindowClearBorder
glWindowBorder :: Window a  ->  IO (Bool)
glWindowBorder = doubleWindowBorder
glWindowSetOverride :: Window a  ->  IO (())
glWindowSetOverride = doubleWindowSetOverride
glWindowOverride :: Window a  ->  IO (Bool)
glWindowOverride = doubleWindowOverride
glWindowSetModal :: Window a  ->  IO (())
glWindowSetModal = doubleWindowSetModal
glWindowModal :: Window a  ->  IO (Bool)
glWindowModal = doubleWindowModal
glWindowSetNonModal :: Window a  ->  IO (())
glWindowSetNonModal = doubleWindowSetNonModal
glWindowNonModal :: Window a  ->  IO (Bool)
glWindowNonModal = doubleWindowNonModal
glWindowSetMenuWindow :: Window a  ->  IO (())
glWindowSetMenuWindow = doubleWindowSetMenuWindow
glWindowMenuWindow :: Window a  ->  IO (Bool)
glWindowMenuWindow = doubleWindowMenuWindow
glWindowSetTooltipWindow :: Window a  ->  IO (())
glWindowSetTooltipWindow = doubleWindowSetTooltipWindow
glWindowTooltipWindow :: Window a  ->  IO (Bool)
glWindowTooltipWindow = doubleWindowTooltipWindow
glWindowHotSpot :: Window a -> PositionSpec b -> Maybe Bool -> IO ()
glWindowHotSpot = doubleWindowHotSpot
glWindowFreePosition :: Window a  ->  IO (())
glWindowFreePosition = doubleWindowFreePosition
glWindowSizeRange :: Window a  -> Int -> Int -> IO (())
glWindowSizeRange = doubleWindowSizeRange
glWindowSizeRangeWithArgs :: Window a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
glWindowSizeRangeWithArgs = doubleWindowSizeRangeWithArgs
glWindowLabel :: Window a  ->  IO (String)
glWindowLabel = doubleWindowLabel
glWindowIconlabel :: Window a  ->  IO (String)
glWindowIconlabel = doubleWindowIconlabel
glWindowSetLabel :: Window a  -> String ->  IO (())
glWindowSetLabel = doubleWindowSetLabel
glWindowSetIconlabel :: Window a  -> String ->  IO (())
glWindowSetIconlabel = doubleWindowSetIconlabel
glWindowSetLabelWithIconlabel :: Window a  -> String -> String ->  IO (())
glWindowSetLabelWithIconlabel = doubleWindowSetLabelWithIconlabel
glWindowCopyLabel :: Window a  -> String ->  IO (())
glWindowCopyLabel = doubleWindowCopyLabel
glWindowSetDefaultXclass :: String ->  IO (())
glWindowSetDefaultXclass = doubleWindowSetDefaultXclass
glWindowDefaultXclass ::  IO (String)
glWindowDefaultXclass = doubleWindowDefaultXclass
glWindowXclass :: Window a  ->  IO (String)
glWindowXclass = doubleWindowXclass
glWindowSetXclass :: Window a  -> String ->  IO (())
glWindowSetXclass = doubleWindowSetXclass
glWindowIcon :: Window a  ->  IO (Ptr ())
glWindowIcon = doubleWindowIcon
glWindowSetIcon :: Window a  -> Ptr () ->  IO (())
glWindowSetIcon = doubleWindowSetIcon
glWindowShown :: Window a  ->  IO (Bool)
glWindowShown = doubleWindowShown
glWindowIconize :: Window a  ->  IO (())
glWindowIconize = doubleWindowIconize
glWindowXRoot :: Window a  ->  IO (Int)
glWindowXRoot = doubleWindowXRoot
glWindowYRoot :: Window a  ->  IO (Int)
glWindowYRoot = doubleWindowYRoot
glWindowCurrent ::  IO (Ptr ())
glWindowCurrent = doubleWindowCurrent
glWindowMakeCurrent :: Window a  ->  IO (())
glWindowMakeCurrent = doubleWindowMakeCurrent
glWindowSetCursor :: Window a -> CursorType -> IO ()
glWindowSetCursor = doubleWindowSetCursor
glWindowSetCursorWithFgBg :: Window a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
glWindowSetCursorWithFgBg = doubleWindowSetCursorWithFgBg
glWindowSetDefaultCursor :: Window a  -> CursorType ->  IO (())
glWindowSetDefaultCursor = doubleWindowSetDefaultCursor
glWindowDecoratedW :: Window a  ->  IO (Int)
glWindowDecoratedW = doubleWindowDecoratedW
glWindowDecoratedH :: Window a  ->  IO (Int)
glWindowDecoratedH = doubleWindowDecoratedH
