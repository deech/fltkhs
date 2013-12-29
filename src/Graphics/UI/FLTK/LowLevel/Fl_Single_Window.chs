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
import Foreign.Marshal.Utils
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

data SingleWindowFuncs a =
    SingleWindowFuncs
    {
     singleWindowDrawOverride       :: Maybe (WidgetCallback a)
    ,singleWindowHandleOverride     :: Maybe (WidgetEventHandler a)
    ,singleWindowResizeOverride     :: Maybe (RectangleF a)
    ,singleWindowShowOverride       :: Maybe (WidgetCallback a)
    ,singleWindowHideOverride       :: Maybe (WidgetCallback a)
    ,singleWindowAsWindowOverride   :: Maybe (GetWindowF a)
    ,singleWindowAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,singleWindowAsGroupOverride    :: Maybe (GetGroupF a)
    ,singleWindowFlushOverride      :: Maybe (WidgetCallback a)
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
singleWindowNew :: Size -> Maybe Position -> Maybe String -> Maybe (SingleWindowFuncs a) -> IO (Window ())
singleWindowNew (Size (Width w) (Height h)) position title funcs' =
    let makeObject = objectOrError "singleWindowNew: object construction returned a null pointer"
    in case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= makeObject
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= makeObject
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= makeObject
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= makeObject
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= makeObject
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= makeObject
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= makeObject
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- singleWindowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= makeObject

{# fun Fl_Single_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' #}
singleWindowDestroy :: SingleWindow a -> IO ()
singleWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Single_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
singleWindowDrawSuper :: SingleWindow a  ->  IO (())
singleWindowDrawSuper window = withObject window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Single_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
singleWindowHandleSuper :: SingleWindow a  -> Int ->  IO (Int)
singleWindowHandleSuper window event = withObject window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Single_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
singleWindowResizeSuper :: SingleWindow a  -> Rectangle -> IO (())
singleWindowResizeSuper window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Single_Window_show_super as showSuper' { id `Ptr ()' } -> `()' #}
singleWindowShowSuper :: SingleWindow a  ->  IO (())
singleWindowShowSuper window = withObject window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Single_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' #}
singleWindowHideSuper :: SingleWindow a  ->  IO (())
singleWindowHideSuper window = withObject window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Single_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' #}
singleWindowFlushSuper :: SingleWindow a  ->  IO (())
singleWindowFlushSuper window = withObject window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Single_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
singleWindowAsWindowSuper :: SingleWindow a  ->  IO (Maybe (Window ()))
singleWindowAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr

{# fun Fl_Single_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `Maybe (GlWindow ())'toObject #}
singleWindowAsGlWindowSuper :: SingleWindow a  ->  IO (Maybe (GlWindow ()))
singleWindowAsGlWindowSuper window = withObject window $ \windowPtr -> asGlWindowSuper' windowPtr

{# fun Fl_Single_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
singleWindowAsGroupSuper :: SingleWindow a  ->  IO (Maybe (Group ()))
singleWindowAsGroupSuper window = withObject window $ \windowPtr -> asGroupSuper' windowPtr

{# fun Fl_Single_Window_show as windowShow' {id `Ptr ()'} -> `()' #}
singleWindowShow :: SingleWindow a -> IO ()
singleWindowShow window = withObject window $ (\p -> windowShow' p)

{#fun Fl_Single_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
singleWindowHandle :: SingleWindow a -> Event -> IO Int
singleWindowHandle window event = withObject window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Single_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
singleWindowResize :: SingleWindow a  -> Rectangle -> IO (())
singleWindowResize window rectangle = withObject window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Single_Window_as_window as asWindow' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
singleWindowAsWindow :: SingleWindow a  ->  IO (Maybe (Window ()))
singleWindowAsWindow window = withObject window $ \windowPtr -> asWindow' windowPtr

{# fun Fl_Single_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
singleWindowAsGlWindow :: SingleWindow a  ->  IO (Maybe (GlWindow()))
singleWindowAsGlWindow window = withObject window $ \windowPtr -> asGlWindow' windowPtr

{# fun Fl_Single_Window_as_group as asGroup' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
singleWindowAsGroup :: SingleWindow a  ->  IO (Maybe (Group ()))
singleWindowAsGroup window = withObject window $ \windowPtr -> asGroup' windowPtr
singleWindowSetCallback :: Window a -> WidgetCallback b -> IO ()
singleWindowSetCallback = windowSetCallback
singleWindowParent :: Group a -> IO (Maybe (Group ()))
singleWindowParent = windowParent
singleWindowSetParent :: Group a -> Group b -> IO ()
singleWindowSetParent = windowSetParent
singleWindowType_ :: Group a  ->  IO (Word8)
singleWindowType_ = windowType_
singleWindowSetType :: Group a  -> Word8 ->  IO (())
singleWindowSetType = windowSetType
singleWindowDrawLabel :: Group a  -> Maybe (Rectangle,AlignType)->  IO (())
singleWindowDrawLabel = windowDrawLabel
singleWindowX :: Group a  ->  IO (Int)
singleWindowX = windowX
singleWindowY :: Group a  ->  IO (Int)
singleWindowY = windowY
singleWindowW :: Group a  ->  IO (Int)
singleWindowW = windowW
singleWindowH :: Group a  ->  IO (Int)
singleWindowH = windowH
singleWindowSetAlign :: Group a  -> AlignType ->  IO (())
singleWindowSetAlign = windowSetAlign
singleWindowAlign :: Group a  ->  IO (AlignType)
singleWindowAlign = windowAlign
singleWindowBox :: Group a  ->  IO (Boxtype)
singleWindowBox = windowBox
singleWindowSetBox :: Group a  -> Boxtype ->  IO (())
singleWindowSetBox = windowSetBox
singleWindowColor :: Group a  ->  IO (Color)
singleWindowColor = windowColor
singleWindowSetColor :: Group a  -> Color ->  IO (())
singleWindowSetColor = windowSetColor
singleWindowSetColorWithBgSel :: Group a  -> Color -> Color ->  IO (())
singleWindowSetColorWithBgSel = windowSetColorWithBgSel
singleWindowSelectionColor :: Group a  ->  IO (Color)
singleWindowSelectionColor = windowSelectionColor
singleWindowSetSelectionColor :: Group a  -> Color ->  IO (())
singleWindowSetSelectionColor = windowSetSelectionColor
singleWindowLabeltype :: Group a  ->  IO (Labeltype)
singleWindowLabeltype = windowLabeltype
singleWindowSetLabeltype :: Group a  -> Labeltype ->  IO (())
singleWindowSetLabeltype = windowSetLabeltype
singleWindowLabelcolor :: Group a  ->  IO (Color)
singleWindowLabelcolor = windowLabelcolor
singleWindowSetLabelcolor :: Group a  -> Color ->  IO (())
singleWindowSetLabelcolor = windowSetLabelcolor
singleWindowLabelfont :: Group a  ->  IO (Font)
singleWindowLabelfont = windowLabelfont
singleWindowSetLabelfont :: Group a  -> Font ->  IO (())
singleWindowSetLabelfont = windowSetLabelfont
singleWindowLabelsize :: Group a  ->  IO (FontSize)
singleWindowLabelsize = windowLabelsize
singleWindowSetLabelsize :: Group a  -> FontSize ->  IO (())
singleWindowSetLabelsize = windowSetLabelsize
singleWindowImage :: Group a  ->  IO (Maybe (Image ()))
singleWindowImage = windowImage
singleWindowSetImage :: Group a  -> Image b ->  IO (())
singleWindowSetImage = windowSetImage
singleWindowDeimage :: Group a  ->  IO (Maybe (Image ()))
singleWindowDeimage = windowDeimage
singleWindowSetDeimage :: Group a  -> Image b ->  IO (())
singleWindowSetDeimage = windowSetDeimage
singleWindowTooltip :: Group a  ->  IO (String)
singleWindowTooltip = windowTooltip
singleWindowCopyTooltip :: Group a  -> String ->  IO (())
singleWindowCopyTooltip = windowCopyTooltip
singleWindowSetTooltip :: Group a  -> String ->  IO (())
singleWindowSetTooltip = windowSetTooltip
singleWindowWhen :: Group a  ->  IO (When)
singleWindowWhen = windowWhen
singleWindowSetWhen :: Group a  -> Word8 ->  IO (())
singleWindowSetWhen = windowSetWhen
singleWindowVisible :: Group a  ->  IO (Int)
singleWindowVisible = windowVisible
singleWindowVisibleR :: Group a  ->  IO (Int)
singleWindowVisibleR = windowVisibleR
singleWindowHide :: Window a  ->  IO (())
singleWindowHide = windowHide
singleWindowSetVisible :: Group a  ->  IO (())
singleWindowSetVisible = windowSetVisible
singleWindowClearVisible :: Group a  ->  IO (())
singleWindowClearVisible = windowClearVisible
singleWindowActive :: Group a  ->  IO (Int)
singleWindowActive = windowActive
singleWindowActiveR :: Group a  ->  IO (Int)
singleWindowActiveR = windowActiveR
singleWindowActivate :: Group a  ->  IO (())
singleWindowActivate = windowActivate
singleWindowDeactivate :: Group a  ->  IO (())
singleWindowDeactivate = windowDeactivate
singleWindowOutput :: Group a  ->  IO (Int)
singleWindowOutput = windowOutput
singleWindowSetOutput :: Group a  ->  IO (())
singleWindowSetOutput = windowSetOutput
singleWindowClearOutput :: Group a  ->  IO (())
singleWindowClearOutput = windowClearOutput
singleWindowTakesevents :: Group a  ->  IO (Int)
singleWindowTakesevents = windowTakesevents
singleWindowSetChanged :: Group a  ->  IO (())
singleWindowSetChanged = windowSetChanged
singleWindowClearChanged :: Group a  ->  IO (())
singleWindowClearChanged = windowClearChanged
singleWindowTakeFocus :: Group a  ->  IO (Int)
singleWindowTakeFocus = windowTakeFocus
singleWindowSetVisibleFocus :: Group a  ->  IO (())
singleWindowSetVisibleFocus = windowSetVisibleFocus
singleWindowClearVisibleFocus :: Group a  ->  IO (())
singleWindowClearVisibleFocus = windowClearVisibleFocus
singleWindowModifyVisibleFocus :: Group a  -> Int ->  IO (())
singleWindowModifyVisibleFocus = windowModifyVisibleFocus
singleWindowVisibleFocus :: Group a  ->  IO (Int)
singleWindowVisibleFocus = windowVisibleFocus
singleWindowContains :: Group a  -> Group a  ->  IO (Int)
singleWindowContains = windowContains
singleWindowInside :: Group a  -> Group a  ->  IO (Int)
singleWindowInside = windowInside
singleWindowRedraw :: Group a  ->  IO (())
singleWindowRedraw = windowRedraw
singleWindowRedrawLabel :: Group a  ->  IO (())
singleWindowRedrawLabel = windowRedrawLabel
singleWindowDamage :: Group a  ->  IO (Word8)
singleWindowDamage = windowDamage
singleWindowClearDamageWithBitmask :: Group a  -> Word8 ->  IO (())
singleWindowClearDamageWithBitmask = windowClearDamageWithBitmask
singleWindowClearDamage :: Group a  ->  IO (())
singleWindowClearDamage = windowClearDamage
singleWindowDamageWithText :: Group a  -> Word8 ->  IO (())
singleWindowDamageWithText = windowDamageWithText
singleWindowDamageInsideWidget :: Group a  -> Word8 -> Rectangle ->  IO (())
singleWindowDamageInsideWidget = windowDamageInsideWidget
singleWindowMeasureLabel :: Group a  -> IO (Size)
singleWindowMeasureLabel = windowMeasureLabel
singleWindowWindow :: Group a  ->  IO (Maybe (Window ()))
singleWindowWindow = windowWindow
singleWindowTopWindow :: Group a  ->  IO (Maybe (Window ()))
singleWindowTopWindow = windowTopWindow
singleWindowTopWindowOffset :: Group a -> IO (Position)
singleWindowTopWindowOffset = windowTopWindowOffset
singleWindowBegin :: Group a  ->  IO (())
singleWindowBegin = windowBegin
singleWindowEnd :: Group a  ->  IO (())
singleWindowEnd = windowEnd
singleWindowFind :: Group a  -> Widget a  ->  IO (Int)
singleWindowFind = windowFind
singleWindowAdd :: Group a  -> Widget a  ->  IO (())
singleWindowAdd = windowAdd
singleWindowInsert :: Group a  -> Widget a  -> Int ->  IO (())
singleWindowInsert = windowInsert
singleWindowRemoveIndex :: Group a  -> Int ->  IO (())
singleWindowRemoveIndex = windowRemoveIndex
singleWindowRemoveWidget :: Group a  -> Widget a  ->  IO (())
singleWindowRemoveWidget = windowRemoveWidget
singleWindowClear :: Group a  ->  IO (())
singleWindowClear = windowClear
singleWindowSetResizable :: Group a  -> Widget a  ->  IO (())
singleWindowSetResizable = windowSetResizable
singleWindowResizable :: Group a  ->  IO (Maybe (Widget ()))
singleWindowResizable = windowResizable
singleWindowAddResizable :: Group a  -> Widget a  ->  IO (())
singleWindowAddResizable = windowAddResizable
singleWindowInitSizes :: Group a  ->  IO (())
singleWindowInitSizes = windowInitSizes
singleWindowChildren :: Group a  ->  IO (Int)
singleWindowChildren = windowChildren
singleWindowSetClipChildren :: Group a  -> Int ->  IO (())
singleWindowSetClipChildren = windowSetClipChildren
singleWindowClipChildren :: Group a  ->  IO (Int)
singleWindowClipChildren = windowClipChildren
singleWindowFocus :: Group a  -> Widget a  ->  IO (())
singleWindowFocus = windowFocus
singleWindowDdfdesignKludge :: Group a  ->  IO (Maybe (Widget ()))
singleWindowDdfdesignKludge = windowDdfdesignKludge
singleWindowInsertWithBefore :: Group a  -> Widget a  -> Widget a  ->  IO (())
singleWindowInsertWithBefore = windowInsertWithBefore
singleWindowArray :: Group a  ->  IO [Maybe (Widget ())]
singleWindowArray = windowArray
singleWindowChild :: Group a  -> Int ->  IO (Maybe (Widget ()))
singleWindowChild = windowChild
singleWindowChanged :: Window a  ->  IO (Int)
singleWindowChanged = windowChanged
singleWindowFullscreen :: Window a  ->  IO (())
singleWindowFullscreen = windowFullscreen
singleWindowFullscreenOff :: Window a -> Maybe Rectangle ->  IO (())
singleWindowFullscreenOff = windowFullscreenOff
singleWindowSetBorder :: Window a  -> Bool ->  IO (())
singleWindowSetBorder = windowSetBorder
singleWindowClearBorder :: Window a  ->  IO (())
singleWindowClearBorder = windowClearBorder
singleWindowBorder :: Window a  ->  IO (Bool)
singleWindowBorder = windowBorder
singleWindowSetOverride :: Window a  ->  IO (())
singleWindowSetOverride = windowSetOverride
singleWindowOverride :: Window a  ->  IO (Bool)
singleWindowOverride = windowOverride
singleWindowSetModal :: Window a  ->  IO (())
singleWindowSetModal = windowSetModal
singleWindowModal :: Window a  ->  IO (Bool)
singleWindowModal = windowModal
singleWindowSetNonModal :: Window a  ->  IO (())
singleWindowSetNonModal = windowSetNonModal
singleWindowNonModal :: Window a  ->  IO (Bool)
singleWindowNonModal = windowNonModal
singleWindowSetMenuWindow :: Window a  ->  IO (())
singleWindowSetMenuWindow = windowSetMenuWindow
singleWindowMenuWindow :: Window a  ->  IO (Bool)
singleWindowMenuWindow = windowMenuWindow
singleWindowSetTooltipWindow :: Window a  ->  IO (())
singleWindowSetTooltipWindow = windowSetTooltipWindow
singleWindowTooltipWindow :: Window a  ->  IO (Bool)
singleWindowTooltipWindow = windowTooltipWindow
singleWindowHotSpot :: Window a -> PositionSpec b -> Maybe Bool -> IO ()
singleWindowHotSpot = windowHotSpot
singleWindowFreePosition :: Window a  ->  IO (())
singleWindowFreePosition = windowFreePosition
singleWindowSizeRange :: Window a  -> Int -> Int -> IO (())
singleWindowSizeRange = windowSizeRange
singleWindowSizeRangeWithArgs :: Window a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
singleWindowSizeRangeWithArgs = windowSizeRangeWithArgs
singleWindowLabel :: Window a  ->  IO (String)
singleWindowLabel = windowLabel
singleWindowIconlabel :: Window a  ->  IO (String)
singleWindowIconlabel = windowIconlabel
singleWindowSetLabel :: Window a  -> String ->  IO (())
singleWindowSetLabel = windowSetLabel
singleWindowSetIconlabel :: Window a  -> String ->  IO (())
singleWindowSetIconlabel = windowSetIconlabel
singleWindowSetLabelWithIconlabel :: Window a  -> String -> String ->  IO (())
singleWindowSetLabelWithIconlabel = windowSetLabelWithIconlabel
singleWindowCopyLabel :: Window a  -> String ->  IO (())
singleWindowCopyLabel = windowCopyLabel
singleWindowSetDefaultXclass :: String ->  IO (())
singleWindowSetDefaultXclass = windowSetDefaultXclass
singleWindowDefaultXclass ::  IO (String)
singleWindowDefaultXclass = windowDefaultXclass
singleWindowXclass :: Window a  ->  IO (String)
singleWindowXclass = windowXclass
singleWindowSetXclass :: Window a  -> String ->  IO (())
singleWindowSetXclass = windowSetXclass
singleWindowIcon :: Window a  ->  IO (Ptr ())
singleWindowIcon = windowIcon
singleWindowSetIcon :: Window a  -> Ptr () ->  IO (())
singleWindowSetIcon = windowSetIcon
singleWindowShown :: Window a  ->  IO (Bool)
singleWindowShown = windowShown
singleWindowIconize :: Window a  ->  IO (())
singleWindowIconize = windowIconize
singleWindowXRoot :: Window a  ->  IO (Int)
singleWindowXRoot = windowXRoot
singleWindowYRoot :: Window a  ->  IO (Int)
singleWindowYRoot = windowYRoot
singleWindowCurrent ::  IO (Ptr ())
singleWindowCurrent = windowCurrent
singleWindowMakeCurrent :: Window a  ->  IO (())
singleWindowMakeCurrent = windowMakeCurrent
singleWindowSetCursor :: Window a -> CursorType -> IO ()
singleWindowSetCursor = windowSetCursor
singleWindowSetCursorWithFgBg :: Window a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
singleWindowSetCursorWithFgBg = windowSetCursorWithFgBg
singleWindowSetDefaultCursor :: Window a  -> CursorType ->  IO (())
singleWindowSetDefaultCursor = windowSetDefaultCursor
singleWindowDecoratedW :: Window a  ->  IO (Int)
singleWindowDecoratedW = windowDecoratedW
singleWindowDecoratedH :: Window a  ->  IO (Int)
singleWindowDecoratedH = windowDecoratedH
