module Graphics.UI.FLTK.LowLevel.Fl_Single_Window
  (
    SingleWindowFuncs(..),
    defaultSingleWindowFuncs,
    singleWindowNew,
    singleWindowDestroy,
    singleWindowDrawSuper,
    singleWindowHandleSuper,
    singleWindowResizeSuper,
    singleWindowShowSuper,
    singleWindowHideSuper,
    singleWindowFlushSuper,
    singleWindowAsWindowSuper,
    singleWindowAsGlWindowSuper,
    singleWindowAsGroupSuper,
    singleWindowShow,
    singleWindowHandle,
    singleWindowResize,
    singleWindowAsWindow,
    singleWindowAsGlWindow,
    singleWindowAsGroup,
    singleWindowSetCallback,
    singleWindowParent,
    singleWindowSetParent,
    singleWindowType_,
    singleWindowSetType,
    singleWindowDrawLabel,
    singleWindowX,
    singleWindowY,
    singleWindowW,
    singleWindowH,
    singleWindowSetAlign,
    singleWindowAlign,
    singleWindowBox,
    singleWindowSetBox,
    singleWindowColor,
    singleWindowSetColor,
    singleWindowSetColorWithBgSel,
    singleWindowSelectionColor,
    singleWindowSetSelectionColor,
    singleWindowLabeltype,
    singleWindowSetLabeltype,
    singleWindowLabelcolor,
    singleWindowSetLabelcolor,
    singleWindowLabelfont,
    singleWindowSetLabelfont,
    singleWindowLabelsize,
    singleWindowSetLabelsize,
    singleWindowImage,
    singleWindowSetImage,
    singleWindowDeimage,
    singleWindowSetDeimage,
    singleWindowTooltip,
    singleWindowCopyTooltip,
    singleWindowSetTooltip,
    singleWindowWhen,
    singleWindowSetWhen,
    singleWindowVisible,
    singleWindowVisibleR,
    singleWindowHide,
    singleWindowSetVisible,
    singleWindowClearVisible,
    singleWindowActive,
    singleWindowActiveR,
    singleWindowActivate,
    singleWindowDeactivate,
    singleWindowOutput,
    singleWindowSetOutput,
    singleWindowClearOutput,
    singleWindowTakesevents,
    singleWindowSetChanged,
    singleWindowClearChanged,
    singleWindowTakeFocus,
    singleWindowSetVisibleFocus,
    singleWindowClearVisibleFocus,
    singleWindowModifyVisibleFocus,
    singleWindowVisibleFocus,
    singleWindowContains,
    singleWindowInside,
    singleWindowRedraw,
    singleWindowRedrawLabel,
    singleWindowDamage,
    singleWindowClearDamageWithBitmask,
    singleWindowClearDamage,
    singleWindowDamageWithText,
    singleWindowDamageInsideWidget,
    singleWindowMeasureLabel,
    singleWindowWindow,
    singleWindowTopWindow,
    singleWindowTopWindowOffset,
    singleWindowBegin,
    singleWindowEnd,
    singleWindowFind,
    singleWindowAdd,
    singleWindowInsert,
    singleWindowRemoveIndex,
    singleWindowRemoveWidget,
    singleWindowClear,
    singleWindowSetResizable,
    singleWindowResizable,
    singleWindowAddResizable,
    singleWindowInitSizes,
    singleWindowChildren,
    singleWindowSetClipChildren,
    singleWindowClipChildren,
    singleWindowFocus,
    singleWindowDdfdesignKludge,
    singleWindowInsertWithBefore,
    singleWindowArray,
    singleWindowChild,
    singleWindowChanged,
    singleWindowFullscreen,
    singleWindowFullscreenOff,
    singleWindowSetBorder,
    singleWindowClearBorder,
    singleWindowBorder,
    singleWindowSetOverride,
    singleWindowOverride,
    singleWindowSetModal,
    singleWindowModal,
    singleWindowSetNonModal,
    singleWindowNonModal,
    singleWindowSetMenuWindow,
    singleWindowMenuWindow,
    singleWindowSetTooltipWindow,
    singleWindowTooltipWindow,
    singleWindowHotSpot,
    singleWindowFreePosition,
    singleWindowSizeRange,
    singleWindowSizeRangeWithArgs,
    singleWindowLabel,
    singleWindowIconlabel,
    singleWindowSetLabel,
    singleWindowSetIconlabel,
    singleWindowSetLabelWithIconlabel,
    singleWindowCopyLabel,
    singleWindowSetDefaultXclass,
    singleWindowDefaultXclass,
    singleWindowXclass,
    singleWindowSetXclass,
    singleWindowIcon,
    singleWindowSetIcon,
    singleWindowShown,
    singleWindowIconize,
    singleWindowXRoot,
    singleWindowYRoot,
    singleWindowCurrent,
    singleWindowMakeCurrent,
    singleWindowSetCursor,
    singleWindowSetCursorWithFgBg,
    singleWindowSetDefaultCursor,
    singleWindowDecoratedW,
    singleWindowDecoratedH
  )
where
#include "Fl_C.h"
#include "Fl_Single_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

data SingleWindowFuncs a =
    SingleWindowFuncs
    {
     singleWindowDrawOverride       :: Maybe (SingleWindow a -> IO ())
    ,singleWindowHandleOverride     :: Maybe (SingleWindow a -> Event -> IO Int)
    ,singleWindowResizeOverride     :: Maybe (SingleWindow a -> Rectangle -> IO ())
    ,singleWindowShowOverride       :: Maybe (SingleWindow a -> IO ())
    ,singleWindowHideOverride       :: Maybe (SingleWindow a -> IO ())
    ,singleWindowAsWindowOverride   :: Maybe (SingleWindow a -> IO (Window ()))
    ,singleWindowAsGlWindowOverride :: Maybe (SingleWindow a -> IO (GlWindow ()))
    ,singleWindowAsGroupOverride    :: Maybe (SingleWindow a -> IO (Group ()))
    ,singleWindowFlushOverride      :: Maybe (SingleWindow a -> IO ())
    }

singleWindowFunctionStruct :: SingleWindowFuncs a -> IO (Ptr ())
singleWindowFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Single_Window_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (singleWindowDrawOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (singleWindowHandleOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (singleWindowResizeOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (singleWindowShowOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (singleWindowHideOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (singleWindowAsWindowOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (singleWindowAsGlWindowOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (singleWindowAsGroupOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->as_group#} p
      toCallbackPrim  `orNullFunPtr` (singleWindowFlushOverride funcs) >>=
                             {#set fl_Single_Window_Virtual_Funcs->flush#} p
      {#set fl_Single_Window_Virtual_Funcs->destroy_data #} p nullFunPtr
      return p

defaultSingleWindowFuncs :: SingleWindowFuncs a
defaultSingleWindowFuncs = SingleWindowFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{# fun Fl_Single_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Single_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Single_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Single_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSingle_Window_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
singleWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe (SingleWindowFuncs a) -> IO (SingleWindow ())
singleWindowNew (Size (Width w) (Height h)) position title funcs' =
    case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= toObject 
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= toObject 
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= toObject 
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= toObject 
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= toObject 
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= toObject 
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= toObject 
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= toObject 

{# fun Fl_Single_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
singleWindowDestroy :: SingleWindow a -> IO ()
singleWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Single_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
singleWindowDrawSuper :: SingleWindow a  ->  IO (())
singleWindowDrawSuper window = withObject window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Single_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
singleWindowHandleSuper :: SingleWindow a  -> Int ->  IO (Int)
singleWindowHandleSuper window event = withObject window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Single_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
singleWindowResizeSuper :: SingleWindow a  -> Rectangle -> IO (())
singleWindowResizeSuper window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Single_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
singleWindowShowSuper :: SingleWindow a  ->  IO (())
singleWindowShowSuper window = withObject window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Single_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
singleWindowHideSuper :: SingleWindow a  ->  IO (())
singleWindowHideSuper window = withObject window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Single_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
singleWindowHide :: SingleWindow a  ->  IO (())
singleWindowHide window = withObject window $ \windowPtr -> hide' windowPtr

{# fun Fl_Single_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
singleWindowFlushSuper :: SingleWindow a  ->  IO (())
singleWindowFlushSuper window = withObject window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Single_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
singleWindowAsWindowSuper :: SingleWindow a  ->  IO (Window ())
singleWindowAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr

{# fun Fl_Single_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
singleWindowAsGlWindowSuper :: SingleWindow a  ->  IO (GlWindow ())
singleWindowAsGlWindowSuper window = withObject window $ \windowPtr -> asGlWindowSuper' windowPtr

{# fun Fl_Single_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
singleWindowAsGroupSuper :: SingleWindow a  ->  IO (Group ())
singleWindowAsGroupSuper window = withObject window $ \windowPtr -> asGroupSuper' windowPtr

{# fun Fl_Single_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
singleWindowShow :: SingleWindow a -> IO ()
singleWindowShow window = withObject window $ (\p -> windowShow' p)

{#fun Fl_Single_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
singleWindowHandle :: SingleWindow a -> Event -> IO Int
singleWindowHandle window event = withObject window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Single_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
singleWindowResize :: SingleWindow a  -> Rectangle -> IO (())
singleWindowResize window rectangle = withObject window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Single_Window_as_window as asWindow' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
singleWindowAsWindow :: SingleWindow a  ->  IO (Window ())
singleWindowAsWindow window = withObject window $ \windowPtr -> asWindow' windowPtr

{# fun Fl_Single_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
singleWindowAsGlWindow :: SingleWindow a  ->  IO (GlWindow())
singleWindowAsGlWindow window = withObject window $ \windowPtr -> asGlWindow' windowPtr

{# fun Fl_Single_Window_as_group as asGroup' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
singleWindowAsGroup :: SingleWindow a  ->  IO (Group ())
singleWindowAsGroup window = withObject window $ \windowPtr -> asGroup' windowPtr
singleWindowSetCallback :: SingleWindow a -> (SingleWindow b -> IO ()) -> IO ()
singleWindowSetCallback = windowSetCallback
singleWindowParent :: SingleWindow a -> IO (Group ())
singleWindowParent = windowParent
singleWindowSetParent :: SingleWindow a -> Group b -> IO ()
singleWindowSetParent = windowSetParent
singleWindowType_ :: SingleWindow a  ->  IO (Word8)
singleWindowType_ = windowType_
singleWindowSetType :: SingleWindow a  -> Word8 ->  IO (())
singleWindowSetType = windowSetType
singleWindowDrawLabel :: SingleWindow a  -> Maybe (Rectangle,AlignType)->  IO (())
singleWindowDrawLabel = windowDrawLabel
singleWindowX :: SingleWindow a  ->  IO (Int)
singleWindowX = windowX
singleWindowY :: SingleWindow a  ->  IO (Int)
singleWindowY = windowY
singleWindowW :: SingleWindow a  ->  IO (Int)
singleWindowW = windowW
singleWindowH :: SingleWindow a  ->  IO (Int)
singleWindowH = windowH
singleWindowSetAlign :: SingleWindow a  -> AlignType ->  IO (())
singleWindowSetAlign = windowSetAlign
singleWindowAlign :: SingleWindow a  ->  IO (AlignType)
singleWindowAlign = windowAlign
singleWindowBox :: SingleWindow a  ->  IO (Boxtype)
singleWindowBox = windowBox
singleWindowSetBox :: SingleWindow a  -> Boxtype ->  IO (())
singleWindowSetBox = windowSetBox
singleWindowColor :: SingleWindow a  ->  IO (Color)
singleWindowColor = windowColor
singleWindowSetColor :: SingleWindow a  -> Color ->  IO (())
singleWindowSetColor = windowSetColor
singleWindowSetColorWithBgSel :: SingleWindow a  -> Color -> Color ->  IO (())
singleWindowSetColorWithBgSel = windowSetColorWithBgSel
singleWindowSelectionColor :: SingleWindow a  ->  IO (Color)
singleWindowSelectionColor = windowSelectionColor
singleWindowSetSelectionColor :: SingleWindow a  -> Color ->  IO (())
singleWindowSetSelectionColor = windowSetSelectionColor
singleWindowLabeltype :: SingleWindow a  ->  IO (Labeltype)
singleWindowLabeltype = windowLabeltype
singleWindowSetLabeltype :: SingleWindow a  -> Labeltype ->  IO (())
singleWindowSetLabeltype = windowSetLabeltype
singleWindowLabelcolor :: SingleWindow a  ->  IO (Color)
singleWindowLabelcolor = windowLabelcolor
singleWindowSetLabelcolor :: SingleWindow a  -> Color ->  IO (())
singleWindowSetLabelcolor = windowSetLabelcolor
singleWindowLabelfont :: SingleWindow a  ->  IO (Font)
singleWindowLabelfont = windowLabelfont
singleWindowSetLabelfont :: SingleWindow a  -> Font ->  IO (())
singleWindowSetLabelfont = windowSetLabelfont
singleWindowLabelsize :: SingleWindow a  ->  IO (FontSize)
singleWindowLabelsize = windowLabelsize
singleWindowSetLabelsize :: SingleWindow a  -> FontSize ->  IO (())
singleWindowSetLabelsize = windowSetLabelsize
singleWindowImage :: SingleWindow a  ->  IO (Image ())
singleWindowImage = windowImage
singleWindowSetImage :: SingleWindow a  -> Image b ->  IO (())
singleWindowSetImage = windowSetImage
singleWindowDeimage :: SingleWindow a  ->  IO (Image ())
singleWindowDeimage = windowDeimage
singleWindowSetDeimage :: SingleWindow a  -> Image b ->  IO (())
singleWindowSetDeimage = windowSetDeimage
singleWindowTooltip :: SingleWindow a  ->  IO (String)
singleWindowTooltip = windowTooltip
singleWindowCopyTooltip :: SingleWindow a  -> String ->  IO (())
singleWindowCopyTooltip = windowCopyTooltip
singleWindowSetTooltip :: SingleWindow a  -> String ->  IO (())
singleWindowSetTooltip = windowSetTooltip
singleWindowWhen :: SingleWindow a  ->  IO (When)
singleWindowWhen = windowWhen
singleWindowSetWhen :: SingleWindow a  -> Word8 ->  IO (())
singleWindowSetWhen = windowSetWhen
singleWindowVisible :: SingleWindow a  ->  IO (Int)
singleWindowVisible = windowVisible
singleWindowVisibleR :: SingleWindow a  ->  IO (Int)
singleWindowVisibleR = windowVisibleR
singleWindowSetVisible :: SingleWindow a  ->  IO (())
singleWindowSetVisible = windowSetVisible
singleWindowClearVisible :: SingleWindow a  ->  IO (())
singleWindowClearVisible = windowClearVisible
singleWindowActive :: SingleWindow a  ->  IO (Int)
singleWindowActive = windowActive
singleWindowActiveR :: SingleWindow a  ->  IO (Int)
singleWindowActiveR = windowActiveR
singleWindowActivate :: SingleWindow a  ->  IO (())
singleWindowActivate = windowActivate
singleWindowDeactivate :: SingleWindow a  ->  IO (())
singleWindowDeactivate = windowDeactivate
singleWindowOutput :: SingleWindow a  ->  IO (Int)
singleWindowOutput = windowOutput
singleWindowSetOutput :: SingleWindow a  ->  IO (())
singleWindowSetOutput = windowSetOutput
singleWindowClearOutput :: SingleWindow a  ->  IO (())
singleWindowClearOutput = windowClearOutput
singleWindowTakesevents :: SingleWindow a  ->  IO (Int)
singleWindowTakesevents = windowTakesevents
singleWindowSetChanged :: SingleWindow a  ->  IO (())
singleWindowSetChanged = windowSetChanged
singleWindowClearChanged :: SingleWindow a  ->  IO (())
singleWindowClearChanged = windowClearChanged
singleWindowTakeFocus :: SingleWindow a  ->  IO (Int)
singleWindowTakeFocus = windowTakeFocus
singleWindowSetVisibleFocus :: SingleWindow a  ->  IO (())
singleWindowSetVisibleFocus = windowSetVisibleFocus
singleWindowClearVisibleFocus :: SingleWindow a  ->  IO (())
singleWindowClearVisibleFocus = windowClearVisibleFocus
singleWindowModifyVisibleFocus :: SingleWindow a  -> Int ->  IO (())
singleWindowModifyVisibleFocus = windowModifyVisibleFocus
singleWindowVisibleFocus :: SingleWindow a  ->  IO (Int)
singleWindowVisibleFocus = windowVisibleFocus
singleWindowContains :: SingleWindow a  -> Group a  ->  IO (Int)
singleWindowContains = windowContains
singleWindowInside :: SingleWindow a  -> Group a  ->  IO (Int)
singleWindowInside = windowInside
singleWindowRedraw :: SingleWindow a  ->  IO (())
singleWindowRedraw = windowRedraw
singleWindowRedrawLabel :: SingleWindow a  ->  IO (())
singleWindowRedrawLabel = windowRedrawLabel
singleWindowDamage :: SingleWindow a  ->  IO (Word8)
singleWindowDamage = windowDamage
singleWindowClearDamageWithBitmask :: SingleWindow a  -> Word8 ->  IO (())
singleWindowClearDamageWithBitmask = windowClearDamageWithBitmask
singleWindowClearDamage :: SingleWindow a  ->  IO (())
singleWindowClearDamage = windowClearDamage
singleWindowDamageWithText :: SingleWindow a  -> Word8 ->  IO (())
singleWindowDamageWithText = windowDamageWithText
singleWindowDamageInsideWidget :: SingleWindow a  -> Word8 -> Rectangle ->  IO (())
singleWindowDamageInsideWidget = windowDamageInsideWidget
singleWindowMeasureLabel :: SingleWindow a  -> IO (Size)
singleWindowMeasureLabel = windowMeasureLabel
singleWindowWindow :: SingleWindow a  ->  IO (Window ())
singleWindowWindow = windowWindow
singleWindowTopWindow :: SingleWindow a  ->  IO (Window ())
singleWindowTopWindow = windowTopWindow
singleWindowTopWindowOffset :: SingleWindow a -> IO (Position)
singleWindowTopWindowOffset = windowTopWindowOffset
singleWindowBegin :: SingleWindow a  ->  IO (())
singleWindowBegin = windowBegin
singleWindowEnd :: SingleWindow a  ->  IO (())
singleWindowEnd = windowEnd
singleWindowFind :: SingleWindow a -> Widget b  ->  IO (Int)
singleWindowFind = windowFind
singleWindowAdd :: SingleWindow a -> Widget b  ->  IO (())
singleWindowAdd = windowAdd
singleWindowInsert :: SingleWindow a -> Widget b  -> Int ->  IO (())
singleWindowInsert = windowInsert
singleWindowRemoveIndex :: SingleWindow a  -> Int ->  IO (())
singleWindowRemoveIndex = windowRemoveIndex
singleWindowRemoveWidget :: SingleWindow a -> Widget b  ->  IO (())
singleWindowRemoveWidget = windowRemoveWidget
singleWindowClear :: SingleWindow a  ->  IO (())
singleWindowClear = windowClear
singleWindowSetResizable :: SingleWindow a -> Widget b  ->  IO (())
singleWindowSetResizable = windowSetResizable
singleWindowResizable :: SingleWindow a  ->  IO (Widget ())
singleWindowResizable = windowResizable
singleWindowAddResizable :: SingleWindow a -> Widget b  ->  IO (())
singleWindowAddResizable = windowAddResizable
singleWindowInitSizes :: SingleWindow a  ->  IO (())
singleWindowInitSizes = windowInitSizes
singleWindowChildren :: SingleWindow a  ->  IO (Int)
singleWindowChildren = windowChildren
singleWindowSetClipChildren :: SingleWindow a  -> Int ->  IO (())
singleWindowSetClipChildren = windowSetClipChildren
singleWindowClipChildren :: SingleWindow a  ->  IO (Int)
singleWindowClipChildren = windowClipChildren
singleWindowFocus :: SingleWindow a -> Widget b  ->  IO (())
singleWindowFocus = windowFocus
singleWindowDdfdesignKludge :: SingleWindow a  ->  IO (Widget ())
singleWindowDdfdesignKludge = windowDdfdesignKludge
singleWindowInsertWithBefore :: SingleWindow a -> Widget b  -> Widget c  ->  IO (())
singleWindowInsertWithBefore = windowInsertWithBefore
singleWindowArray :: SingleWindow a  ->  IO [(Widget ())]
singleWindowArray = windowArray
singleWindowChild :: SingleWindow a  -> Int ->  IO (Widget ())
singleWindowChild = windowChild
singleWindowChanged :: SingleWindow a  ->  IO (Int)
singleWindowChanged = windowChanged
singleWindowFullscreen :: SingleWindow a  ->  IO (())
singleWindowFullscreen = windowFullscreen
singleWindowFullscreenOff :: SingleWindow a -> Maybe Rectangle ->  IO (())
singleWindowFullscreenOff = windowFullscreenOff
singleWindowSetBorder :: SingleWindow a  -> Bool ->  IO (())
singleWindowSetBorder = windowSetBorder
singleWindowClearBorder :: SingleWindow a  ->  IO (())
singleWindowClearBorder = windowClearBorder
singleWindowBorder :: SingleWindow a  ->  IO (Bool)
singleWindowBorder = windowBorder
singleWindowSetOverride :: SingleWindow a  ->  IO (())
singleWindowSetOverride = windowSetOverride
singleWindowOverride :: SingleWindow a  ->  IO (Bool)
singleWindowOverride = windowOverride
singleWindowSetModal :: SingleWindow a  ->  IO (())
singleWindowSetModal = windowSetModal
singleWindowModal :: SingleWindow a  ->  IO (Bool)
singleWindowModal = windowModal
singleWindowSetNonModal :: SingleWindow a  ->  IO (())
singleWindowSetNonModal = windowSetNonModal
singleWindowNonModal :: SingleWindow a  ->  IO (Bool)
singleWindowNonModal = windowNonModal
singleWindowSetMenuWindow :: SingleWindow a  ->  IO (())
singleWindowSetMenuWindow = windowSetMenuWindow
singleWindowMenuWindow :: SingleWindow a  ->  IO (Bool)
singleWindowMenuWindow = windowMenuWindow
singleWindowSetTooltipWindow :: SingleWindow a  ->  IO (())
singleWindowSetTooltipWindow = windowSetTooltipWindow
singleWindowTooltipWindow :: SingleWindow a  ->  IO (Bool)
singleWindowTooltipWindow = windowTooltipWindow
singleWindowHotSpot :: SingleWindow a -> PositionSpec b -> Maybe Bool -> IO ()
singleWindowHotSpot = windowHotSpot
singleWindowFreePosition :: SingleWindow a  ->  IO (())
singleWindowFreePosition = windowFreePosition
singleWindowSizeRange :: SingleWindow a  -> Int -> Int -> IO (())
singleWindowSizeRange = windowSizeRange
singleWindowSizeRangeWithArgs :: SingleWindow a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
singleWindowSizeRangeWithArgs = windowSizeRangeWithArgs
singleWindowLabel :: SingleWindow a  ->  IO (String)
singleWindowLabel = windowLabel
singleWindowIconlabel :: SingleWindow a  ->  IO (String)
singleWindowIconlabel = windowIconlabel
singleWindowSetLabel :: SingleWindow a  -> String ->  IO (())
singleWindowSetLabel = windowSetLabel
singleWindowSetIconlabel :: SingleWindow a  -> String ->  IO (())
singleWindowSetIconlabel = windowSetIconlabel
singleWindowSetLabelWithIconlabel :: SingleWindow a  -> String -> String ->  IO (())
singleWindowSetLabelWithIconlabel = windowSetLabelWithIconlabel
singleWindowCopyLabel :: SingleWindow a  -> String ->  IO (())
singleWindowCopyLabel = windowCopyLabel
singleWindowSetDefaultXclass :: String ->  IO (())
singleWindowSetDefaultXclass = windowSetDefaultXclass
singleWindowDefaultXclass ::  IO (String)
singleWindowDefaultXclass = windowDefaultXclass
singleWindowXclass :: SingleWindow a  ->  IO (String)
singleWindowXclass = windowXclass
singleWindowSetXclass :: SingleWindow a  -> String ->  IO (())
singleWindowSetXclass = windowSetXclass
singleWindowIcon :: SingleWindow a  ->  IO (Ptr ())
singleWindowIcon = windowIcon
singleWindowSetIcon :: SingleWindow a  -> Ptr () ->  IO (())
singleWindowSetIcon = windowSetIcon
singleWindowShown :: SingleWindow a  ->  IO (Bool)
singleWindowShown = windowShown
singleWindowIconize :: SingleWindow a  ->  IO (())
singleWindowIconize = windowIconize
singleWindowXRoot :: SingleWindow a  ->  IO (Int)
singleWindowXRoot = windowXRoot
singleWindowYRoot :: SingleWindow a  ->  IO (Int)
singleWindowYRoot = windowYRoot
singleWindowCurrent ::  IO (Ptr ())
singleWindowCurrent = windowCurrent
singleWindowMakeCurrent :: SingleWindow a  ->  IO (())
singleWindowMakeCurrent = windowMakeCurrent
singleWindowSetCursor :: SingleWindow a -> CursorType -> IO ()
singleWindowSetCursor = windowSetCursor
singleWindowSetCursorWithFgBg :: SingleWindow a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
singleWindowSetCursorWithFgBg = windowSetCursorWithFgBg
singleWindowSetDefaultCursor :: SingleWindow a  -> CursorType ->  IO (())
singleWindowSetDefaultCursor = windowSetDefaultCursor
singleWindowDecoratedW :: SingleWindow a  ->  IO (Int)
singleWindowDecoratedW = windowDecoratedW
singleWindowDecoratedH :: SingleWindow a  ->  IO (Int)
singleWindowDecoratedH = windowDecoratedH
