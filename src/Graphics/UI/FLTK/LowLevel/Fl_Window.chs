{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Window
    (
     WindowFuncs(..),
     OptionalSizeRangeArgs(..),
     defaultWindowFuncs,
     defaultOptionalSizeRangeArgs,
     windowNew,
     windowDestroy,
     windowDrawSuper,
     windowHandleSuper,
     windowResizeSuper,
     windowShowSuper,
     windowHideSuper,
     windowFlushSuper,
     windowAsWindowSuper,
     windowAsGlWindowSuper,
     windowAsGroupSuper,
     windowShow,
     windowHandle,
     windowResize,
     windowAsWindow,
     windowAsGlWindow,
     windowAsGroup,
     windowSetCallback,
     windowParent,
     windowSetParent,
     windowType_,
     windowSetType,
     windowDrawLabel,
     windowX,
     windowY,
     windowW,
     windowH,
     windowSetAlign,
     windowAlign,
     windowBox,
     windowSetBox,
     windowColor,
     windowSetColor,
     windowSetColorWithBgSel,
     windowSelectionColor,
     windowSetSelectionColor,
     windowLabeltype,
     windowSetLabeltype,
     windowLabelcolor,
     windowSetLabelcolor,
     windowLabelfont,
     windowSetLabelfont,
     windowLabelsize,
     windowSetLabelsize,
     windowImage,
     windowSetImage,
     windowDeimage,
     windowSetDeimage,
     windowTooltip,
     windowCopyTooltip,
     windowSetTooltip,
     windowWhen,
     windowSetWhen,
     windowVisible,
     windowVisibleR,
     windowHide,
     windowSetVisible,
     windowClearVisible,
     windowActive,
     windowActiveR,
     windowActivate,
     windowDeactivate,
     windowOutput,
     windowSetOutput,
     windowClearOutput,
     windowTakesevents,
     windowSetChanged,
     windowClearChanged,
     windowTakeFocus,
     windowSetVisibleFocus,
     windowClearVisibleFocus,
     windowModifyVisibleFocus,
     windowVisibleFocus,
     windowContains,
     windowInside,
     windowRedraw,
     windowRedrawLabel,
     windowDamage,
     windowClearDamageWithBitmask,
     windowClearDamage,
     windowDamageWithText,
     windowDamageInsideWidget,
     windowMeasureLabel,
     windowWindow,
     windowTopWindow,
     windowTopWindowOffset,
     windowBegin,
     windowEnd,
     windowFind,
     windowAdd,
     windowInsert,
     windowRemoveIndex,
     windowRemoveWidget,
     windowClear,
     windowSetResizable,
     windowResizable,
     windowAddResizable,
     windowInitSizes,
     windowChildren,
     windowSetClipChildren,
     windowClipChildren,
     windowFocus,
     windowDdfdesignKludge,
     windowInsertWithBefore,
     windowArray,
     windowChild,
     windowChanged,
     windowFullscreen,
     windowFullscreenOff,
     windowSetBorder,
     windowClearBorder,
     windowBorder,
     windowSetOverride,
     windowOverride,
     windowSetModal,
     windowModal,
     windowSetNonModal,
     windowNonModal,
     windowSetMenuWindow,
     windowMenuWindow,
     windowSetTooltipWindow,
     windowTooltipWindow,
     windowHotSpot,
     windowFreePosition,
     windowSizeRange,
     windowSizeRangeWithArgs,
     windowLabel,
     windowIconlabel,
     windowSetLabel,
     windowSetIconlabel,
     windowSetLabelWithIconlabel,
     windowCopyLabel,
     windowSetDefaultXclass,
     windowDefaultXclass,
     windowXclass,
     windowSetXclass,
     windowIcon,
     windowSetIcon,
     windowShown,
     windowIconize,
     windowXRoot,
     windowYRoot,
     windowCurrent,
     windowMakeCurrent,
     windowSetCursor,
     windowSetCursorWithFgBg,
     windowSetDefaultCursor,
     windowSetDefaultCursorWithFgBg,
     windowDecoratedW,
     windowDecoratedH
    )
where
#include "Fl_C.h"
#include "Fl_WindowC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import Foreign
import Foreign.Marshal.Utils
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Group
import Debug.Trace
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

data WindowFuncs a =
    WindowFuncs
    {
     windowDrawOverride       :: Maybe (WidgetCallback a)
    ,windowHandleOverride     :: Maybe (WidgetEventHandler a)
    ,windowResizeOverride     :: Maybe (RectangleF a)
    ,windowShowOverride       :: Maybe (WidgetCallback a)
    ,windowHideOverride       :: Maybe (WidgetCallback a)
    ,windowAsWindowOverride   :: Maybe (GetWindowF a)
    ,windowAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,windowAsGroupOverride    :: Maybe (GetGroupF a)
    ,windowFlushOverride      :: Maybe (WidgetCallback a)
    }

data OptionalSizeRangeArgs = OptionalSizeRangeArgs {
      maxw :: Maybe Int,
      maxh :: Maybe Int,
      dw :: Maybe Int,
      dh :: Maybe Int,
      aspect :: Maybe Bool
    }

optionalSizeRangeArgsToStruct :: OptionalSizeRangeArgs -> IO (Ptr ())
optionalSizeRangeArgsToStruct args = do
  p <- mallocBytes {#sizeof fl_Window_size_range_args #}
  {#set fl_Window_size_range_args->maxw #} p $ maybe 0 fromIntegral (maxw args)
  {#set fl_Window_size_range_args->maxh #} p $ maybe 0 fromIntegral (maxh args)
  {#set fl_Window_size_range_args->dw #} p $ maybe 0 fromIntegral (dw args)
  {#set fl_Window_size_range_args->dh #} p $ maybe 0 fromIntegral (dh args)
  {#set fl_Window_size_range_args->aspect #} p $ maybe 0 fromBool (aspect args)
  return p

defaultOptionalSizeRangeArgs :: OptionalSizeRangeArgs
defaultOptionalSizeRangeArgs = OptionalSizeRangeArgs Nothing Nothing Nothing Nothing Nothing

windowFunctionStruct :: WindowFuncs a -> IO (Ptr ())
windowFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Window_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (windowDrawOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (windowHandleOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (windowResizeOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (windowShowOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (windowHideOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (windowAsWindowOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (windowAsGlWindowOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (windowAsGroupOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->as_group#} p
      toCallbackPrim  `orNullFunPtr` (windowFlushOverride funcs) >>=
                             {#set fl_Window_Virtual_Funcs->flush#} p
      {#set fl_Window_Virtual_Funcs->destroy_data #} p nullFunPtr
      return p

defaultWindowFuncs :: WindowFuncs a
defaultWindowFuncs = WindowFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing
{# fun Fl_Window_New as windowNew' { `Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Window_New_WithLabel as windowNewWithLabel' {`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Window_NewXY_WithLabel as windowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_Window_NewXY as windowNewXY' { `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_New as overriddenWindowNew' {`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY as overriddenWindowNewXY' {`Int',`Int', `Int', `Int', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_NewXY_WithLabel as overriddenWindowNewXYWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWindow_New_WithLabel as overriddenWindowNewWithLabel' { `Int',`Int', `String', id `Ptr ()'} -> `Ptr ()' id #}
windowNew :: Size -> Maybe Position -> Maybe String -> Maybe (WindowFuncs a) -> IO (Window ())
windowNew (Size (Width w) (Height h)) position title funcs' =
    case (position, title, funcs') of
         (Nothing,Nothing,Nothing) -> windowNew' w h >>= toObject
         (Just (Position (X x) (Y y)), Nothing, Nothing) ->  windowNewXY' x y w h >>= toObject
         (Just (Position (X x) (Y y)), (Just l'), Nothing) -> windowNewXYWithLabel' x y w h l' >>= toObject
         (Nothing, (Just l'), Nothing) -> windowNewWithLabel' w h l' >>= toObject
         (Nothing,Nothing,(Just fs')) -> do
                                        p <- windowFunctionStruct fs'
                                        overriddenWindowNew' w h p >>= toObject
         (Just (Position (X x) (Y y)), Nothing, (Just fs')) ->  do
                                        p <- windowFunctionStruct fs'
                                        overriddenWindowNewXY' x y w h p >>= toObject
         (Just (Position (X x) (Y y)), (Just l'), (Just fs')) -> do
                                        p <- windowFunctionStruct fs'
                                        overriddenWindowNewXYWithLabel' x y w h l' p >>= toObject
         (Nothing, (Just l'), (Just fs')) -> do
                                        p <- windowFunctionStruct fs'
                                        overriddenWindowNewWithLabel' w h l' p >>= toObject
{# fun Fl_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowDestroy :: Window a -> IO ()
windowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Window_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowDrawSuper :: Window a  ->  IO (())
windowDrawSuper window = withObject window $ \windowPtr -> drawSuper' windowPtr

{# fun Fl_Window_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
windowHandleSuper :: Window a  -> Int ->  IO (Int)
windowHandleSuper window event = withObject window $ \windowPtr -> handleSuper' windowPtr event

{# fun Fl_Window_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
windowResizeSuper :: Window a  -> Rectangle -> IO (())
windowResizeSuper window rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject window $ \windowPtr -> resizeSuper' windowPtr x_pos y_pos width height

{# fun Fl_Window_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowShowSuper :: Window a  ->  IO (())
windowShowSuper window = withObject window $ \windowPtr -> showSuper' windowPtr

{# fun Fl_Window_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowHideSuper :: Window a  ->  IO (())
windowHideSuper window = withObject window $ \windowPtr -> hideSuper' windowPtr

{# fun Fl_Window_flush_super as flushSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowFlushSuper :: Window a  ->  IO (())
windowFlushSuper window = withObject window $ \windowPtr -> flushSuper' windowPtr

{# fun Fl_Window_as_window_super as asWindowSuper' { id `Ptr ()' } -> `(Window ())' unsafeToObject #}
windowAsWindowSuper :: Window a  ->  IO (Window ())
windowAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr

{# fun Fl_Window_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
windowAsGlWindowSuper :: Window a  ->  IO (GlWindow ())
windowAsGlWindowSuper window = withObject window $ \windowPtr -> asGlWindowSuper' windowPtr

{# fun Fl_Window_as_group_super as asGroupSuper' { id `Ptr ()' } -> `(Group ())' unsafeToObject #}
windowAsGroupSuper :: Window a  ->  IO (Group ())
windowAsGroupSuper window = withObject window $ \windowPtr -> asGroupSuper' windowPtr

{# fun Fl_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
windowShow :: Window a -> IO ()
windowShow window = withObject window (\p -> windowShow' p)

{#fun Fl_Window_handle as windowHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
windowHandle :: Window a -> Event -> IO Int
windowHandle window event = withObject window (\p -> windowHandle' p (fromIntegral . fromEnum $ event))

{# fun Fl_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
windowResize :: Window a  -> Rectangle -> IO (())
windowResize window rectangle = withObject window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos

{# fun Fl_Window_as_window as asWindow' { id `Ptr ()' } -> `(Window ())' unsafeToObject #}
windowAsWindow :: Window a  ->  IO (Window ())
windowAsWindow window = withObject window $ \windowPtr -> asWindow' windowPtr

{# fun Fl_Window_as_gl_window as asGlWindow' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
windowAsGlWindow :: Window a  ->  IO (GlWindow())
windowAsGlWindow window = withObject window $ \windowPtr -> asGlWindow' windowPtr

{# fun Fl_Window_as_group as asGroup' { id `Ptr ()' } -> `(Group ())' unsafeToObject #}
windowAsGroup :: Window a  ->  IO (Group ())
windowAsGroup window = withObject window $ \windowPtr -> asGroup' windowPtr

{# fun Fl_Window_set_callback as
              windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackWithUserDataPrim'}
              -> `()' supressWarningAboutRes #}
windowSetCallback :: Window a -> WidgetCallback b -> IO ()
windowSetCallback window callback =
   withObject window $ (\p -> do
                               callbackPtr <- toWidgetCallbackPrim callback
                               windowSetCallback' (castPtr p) callbackPtr)
windowParent :: Group a -> IO (Group ())
windowParent  = groupParent

windowSetParent :: Group a -> Group b -> IO ()
windowSetParent  = groupSetParent

windowType_ :: Group a  ->  IO (Word8)
windowType_  = groupType_

windowSetType :: Group a  -> Word8 ->  IO (())
windowSetType  = groupSetType

windowDrawLabel :: Group a  -> Maybe (Rectangle,AlignType)->  IO (())
windowDrawLabel  = groupDrawLabel

windowX :: Group a  ->  IO (Int)
windowX  = groupX

windowY :: Group a  ->  IO (Int)
windowY  = groupY

windowW :: Group a  ->  IO (Int)
windowW  = groupW

windowH :: Group a  ->  IO (Int)
windowH  = groupH

windowSetAlign :: Group a  -> AlignType ->  IO (())
windowSetAlign  = groupSetAlign

windowAlign :: Group a  ->  IO (AlignType)
windowAlign  = groupAlign

windowBox :: Group a  ->  IO (Boxtype)
windowBox  = groupBox

windowSetBox :: Group a  -> Boxtype ->  IO (())
windowSetBox  = groupSetBox

windowColor :: Group a  ->  IO (Color)
windowColor  = groupColor

windowSetColor :: Group a  -> Color ->  IO (())
windowSetColor  = groupSetColor

windowSetColorWithBgSel :: Group a  -> Color -> Color ->  IO (())
windowSetColorWithBgSel  = groupSetColorWithBgSel

windowSelectionColor :: Group a  ->  IO (Color)
windowSelectionColor  = groupSelectionColor

windowSetSelectionColor :: Group a  -> Color ->  IO (())
windowSetSelectionColor  = groupSetSelectionColor

windowLabeltype :: Group a  ->  IO (Labeltype)
windowLabeltype  = groupLabeltype

windowSetLabeltype :: Group a  -> Labeltype ->  IO (())
windowSetLabeltype  = groupSetLabeltype

windowLabelcolor :: Group a  ->  IO (Color)
windowLabelcolor  = groupLabelcolor

windowSetLabelcolor :: Group a  -> Color ->  IO (())
windowSetLabelcolor  = groupSetLabelcolor

windowLabelfont :: Group a  ->  IO (Font)
windowLabelfont  = groupLabelfont

windowSetLabelfont :: Group a  -> Font ->  IO (())
windowSetLabelfont  = groupSetLabelfont

windowLabelsize :: Group a  ->  IO (FontSize)
windowLabelsize  = groupLabelsize

windowSetLabelsize :: Group a  -> FontSize ->  IO (())
windowSetLabelsize  = groupSetLabelsize

windowImage :: Group a  ->  IO (Image ())
windowImage  = groupImage

windowSetImage :: Group a  -> Image b ->  IO (())
windowSetImage  = groupSetImage

windowDeimage :: Group a  ->  IO (Image ())
windowDeimage  = groupDeimage

windowSetDeimage :: Group a  -> Image b ->  IO (())
windowSetDeimage  = groupSetDeimage

windowTooltip :: Group a  ->  IO (String)
windowTooltip  = groupTooltip

windowCopyTooltip :: Group a  -> String ->  IO (())
windowCopyTooltip  = groupCopyTooltip

windowSetTooltip :: Group a  -> String ->  IO (())
windowSetTooltip  = groupSetTooltip

windowWhen :: Group a  ->  IO (When)
windowWhen  = groupWhen

windowSetWhen :: Group a  -> Word8 ->  IO (())
windowSetWhen  = groupSetWhen

windowVisible :: Group a  ->  IO (Int)
windowVisible  = groupVisible

windowVisibleR :: Group a  ->  IO (Int)
windowVisibleR  = groupVisibleR

{# fun Fl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowHide :: Window a  ->  IO (())
windowHide window = withObject window $ \windowPtr -> hide' windowPtr

windowSetVisible :: Group a  ->  IO (())
windowSetVisible  = groupSetVisible

windowClearVisible :: Group a  ->  IO (())
windowClearVisible  = groupClearVisible

windowActive :: Group a  ->  IO (Int)
windowActive  = groupActive

windowActiveR :: Group a  ->  IO (Int)
windowActiveR  = groupActiveR

windowActivate :: Group a  ->  IO (())
windowActivate  = groupActivate

windowDeactivate :: Group a  ->  IO (())
windowDeactivate  = groupDeactivate

windowOutput :: Group a  ->  IO (Int)
windowOutput  = groupOutput

windowSetOutput :: Group a  ->  IO (())
windowSetOutput  = groupSetOutput

windowClearOutput :: Group a  ->  IO (())
windowClearOutput  = groupClearOutput

windowTakesevents :: Group a  ->  IO (Int)
windowTakesevents  = groupTakesevents

windowSetChanged :: Group a  ->  IO (())
windowSetChanged  = groupSetChanged

windowClearChanged :: Group a  ->  IO (())
windowClearChanged  = groupClearChanged

windowTakeFocus :: Group a  ->  IO (Int)
windowTakeFocus  = groupTakeFocus

windowSetVisibleFocus :: Group a  ->  IO (())
windowSetVisibleFocus  = groupSetVisibleFocus

windowClearVisibleFocus :: Group a  ->  IO (())
windowClearVisibleFocus  = groupClearVisibleFocus

windowModifyVisibleFocus :: Group a  -> Int ->  IO (())
windowModifyVisibleFocus  = groupModifyVisibleFocus

windowVisibleFocus :: Group a  ->  IO (Int)
windowVisibleFocus  = groupVisibleFocus

windowContains :: Group a  -> Group a  ->  IO (Int)
windowContains  = groupContains

windowInside :: Group a  -> Group a  ->  IO (Int)
windowInside  = groupInside

windowRedraw :: Group a  ->  IO (())
windowRedraw  = groupRedraw

windowRedrawLabel :: Group a  ->  IO (())
windowRedrawLabel  = groupRedrawLabel

windowDamage :: Group a  ->  IO (Word8)
windowDamage  = groupDamage

windowClearDamageWithBitmask :: Group a  -> Word8 ->  IO (())
windowClearDamageWithBitmask  = groupClearDamageWithBitmask

windowClearDamage :: Group a  ->  IO (())
windowClearDamage  = groupClearDamage

windowDamageWithText :: Group a  -> Word8 ->  IO (())
windowDamageWithText  = groupDamageWithText

windowDamageInsideWidget :: Group a  -> Word8 -> Rectangle ->  IO (())
windowDamageInsideWidget  = groupDamageInsideWidget

windowMeasureLabel :: Group a  -> IO (Size)
windowMeasureLabel  = groupMeasureLabel

windowWindow :: Group a  ->  IO (Window ())
windowWindow  = groupWindow

windowTopWindow :: Group a  ->  IO (Window ())
windowTopWindow  = groupTopWindow

windowTopWindowOffset :: Group a -> IO (Position)
windowTopWindowOffset  = groupTopWindowOffset

windowBegin :: Group a  ->  IO (())
windowBegin  = groupBegin

windowEnd :: Group a  ->  IO (())
windowEnd  = groupEnd

windowFind :: Group a  -> Widget a  ->  IO (Int)
windowFind  = groupFind

windowAdd :: Group a  -> Widget a  ->  IO (())
windowAdd  = groupAdd

windowInsert :: Group a  -> Widget a  -> Int ->  IO (())
windowInsert  = groupInsert

windowRemoveIndex :: Group a  -> Int ->  IO (())
windowRemoveIndex  = groupRemoveIndex

windowRemoveWidget :: Group a  -> Widget a  ->  IO (())
windowRemoveWidget  = groupRemoveWidget

windowClear :: Group a  ->  IO (())
windowClear  = groupClear

windowSetResizable :: Group a  -> Widget a  ->  IO (())
windowSetResizable  = groupSetResizable

windowResizable :: Group a  ->  IO (Widget ())
windowResizable  = groupResizable

windowAddResizable :: Group a  -> Widget a  ->  IO (())
windowAddResizable  = groupAddResizable

windowInitSizes :: Group a  ->  IO (())
windowInitSizes  = groupInitSizes

windowChildren :: Group a  ->  IO (Int)
windowChildren  = groupChildren

windowSetClipChildren :: Group a  -> Int ->  IO (())
windowSetClipChildren  = groupSetClipChildren

windowClipChildren :: Group a  ->  IO (Int)
windowClipChildren  = groupClipChildren

windowFocus :: Group a  -> Widget a  ->  IO (())
windowFocus  = groupFocus

windowDdfdesignKludge :: Group a  ->  IO (Widget ())
windowDdfdesignKludge  = groupDdfdesignKludge

windowInsertWithBefore :: Group a  -> Widget a  -> Widget a  ->  IO (())
windowInsertWithBefore  = groupInsertWithBefore

windowArray :: Group a  ->  IO [(Widget ())]
windowArray  = groupArray

windowChild :: Group a  -> Int ->  IO (Widget ())
windowChild  = groupChild

{# fun Fl_Window_changed as changed' { id `Ptr ()' } -> `Int' #}
windowChanged :: Window a  ->  IO (Int)
windowChanged win = withObject win $ \winPtr -> changed' winPtr

{# fun Fl_Window_fullscreen as fullscreen' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowFullscreen :: Window a  ->  IO (())
windowFullscreen win = withObject win $ \winPtr -> fullscreen' winPtr

{# fun Fl_Window_fullscreen_off as fullscreenOff' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_fullscreen_off_with_resize as fullscreenOffWithResize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
windowFullscreenOff :: Window a -> Maybe Rectangle ->  IO (())
windowFullscreenOff win (Just rectangle) =
    withObject win $ \winPtr ->
        let (x_pos, y_pos, width, height) = fromRectangle rectangle
        in fullscreenOffWithResize' winPtr x_pos y_pos width height
windowFullscreenOff win Nothing =
    withObject win $ \winPtr -> fullscreenOff' winPtr

{# fun Fl_Window_set_border as setBorder' { id `Ptr ()', fromBool `Bool' } -> `()' supressWarningAboutRes #}
windowSetBorder :: Window a  -> Bool ->  IO (())
windowSetBorder win b = withObject win $ \winPtr -> setBorder' winPtr b

{# fun Fl_Window_clear_border as clearBorder' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowClearBorder :: Window a  ->  IO (())
windowClearBorder win = withObject win $ \winPtr -> clearBorder' winPtr

{# fun Fl_Window_border as border' { id `Ptr ()' } -> `Bool' toBool#}
windowBorder :: Window a  ->  IO (Bool)
windowBorder win = withObject win $ \winPtr -> border' winPtr

{# fun Fl_Window_set_override as setOverride' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSetOverride :: Window a  ->  IO (())
windowSetOverride win = withObject win $ \winPtr -> setOverride' winPtr

{# fun Fl_Window_override as override' { id `Ptr ()' } -> `Bool' toBool #}
windowOverride :: Window a  ->  IO (Bool)
windowOverride win = withObject win $ \winPtr -> override' winPtr

{# fun Fl_Window_set_modal as setModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSetModal :: Window a  ->  IO (())
windowSetModal win = withObject win $ \winPtr -> setModal' winPtr

{# fun Fl_Window_modal as modal' { id `Ptr ()' } -> `Bool' toBool #}
windowModal :: Window a  ->  IO (Bool)
windowModal win = withObject win $ \winPtr -> modal' winPtr

{# fun Fl_Window_set_non_modal as setNonModal' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSetNonModal :: Window a  ->  IO (())
windowSetNonModal win = withObject win $ \winPtr -> setNonModal' winPtr

{# fun Fl_Window_non_modal as nonModal' { id `Ptr ()' } -> `Bool' toBool #}
windowNonModal :: Window a  ->  IO (Bool)
windowNonModal win = withObject win $ \winPtr -> nonModal' winPtr

{# fun Fl_Window_set_menu_window as setMenuWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSetMenuWindow :: Window a  ->  IO (())
windowSetMenuWindow win = withObject win $ \winPtr -> setMenuWindow' winPtr

{# fun Fl_Window_menu_window as menuWindow' { id `Ptr ()' } -> `Bool' toBool #}
windowMenuWindow :: Window a  ->  IO (Bool)
windowMenuWindow win = withObject win $ \winPtr -> menuWindow' winPtr

{# fun Fl_Window_set_tooltip_window as setTooltipWindow' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSetTooltipWindow :: Window a  ->  IO (())
windowSetTooltipWindow win = withObject win $ \winPtr -> setTooltipWindow' winPtr

{# fun Fl_Window_tooltip_window as tooltipWindow' { id `Ptr ()' } -> `Bool' toBool #}
windowTooltipWindow :: Window a  ->  IO (Bool)
windowTooltipWindow win = withObject win $ \winPtr -> tooltipWindow' winPtr

{# fun Fl_Window_hotspot_with_x_y as hotspotWithXY' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_x_y_with_offscreen as hotspotWithXYWithOffscreen' { id `Ptr ()',`Int',`Int', fromBool `Bool' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget as hotspotWithWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_hotspot_with_widget_with_offscreen as hotspotWithWidgetWithOffscreen' { id `Ptr ()',id `Ptr ()',fromBool `Bool' } -> `()' supressWarningAboutRes #}
windowHotSpot :: Window a -> PositionSpec b -> Maybe Bool -> IO ()
windowHotSpot win positionSpec offscreen =
    withObject win $ \winPtr ->
            case (positionSpec, offscreen) of
              ((ByPosition (Position (X x) (Y y))), (Just offscreen')) ->
                  hotspotWithXYWithOffscreen' winPtr x y offscreen'
              ((ByPosition (Position (X x) (Y y))), Nothing) -> hotspotWithXY' winPtr x y
              ((ByWidget templateWidget), (Just offscreen')) ->
                  withObject templateWidget $ \templatePtr ->
                      hotspotWithWidgetWithOffscreen' winPtr templatePtr offscreen'
              ((ByWidget templateWidget), Nothing) ->
                  withObject templateWidget $ \templatePtr ->
                      hotspotWithWidget' winPtr templatePtr
{# fun Fl_Window_free_position as freePosition' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowFreePosition :: Window a  ->  IO (())
windowFreePosition win = withObject win $ \winPtr -> freePosition' winPtr

{# fun Fl_Window_size_range as sizeRange' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_size_range_with_args as sizeRangeWithArgs' { id `Ptr ()',`Int',`Int', id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSizeRange :: Window a  -> Int -> Int -> IO (())
windowSizeRange win minw' minh' =
    withObject win $ \winPtr -> sizeRange' winPtr minw' minh'
windowSizeRangeWithArgs :: Window a  -> Int -> Int -> OptionalSizeRangeArgs ->  IO (())
windowSizeRangeWithArgs win minw' minh' args =
    withObject win $ \winPtr -> do
      structPtr <- optionalSizeRangeArgsToStruct args
      sizeRangeWithArgs' winPtr minw' minh' structPtr

{# fun Fl_Window_label as label' { id `Ptr ()' } -> `String' #}
windowLabel :: Window a  ->  IO (String)
windowLabel win = withObject win $ \winPtr -> label' winPtr

{# fun Fl_Window_iconlabel as iconlabel' { id `Ptr ()' } -> `String' #}
windowIconlabel :: Window a  ->  IO (String)
windowIconlabel win = withObject win $ \winPtr -> iconlabel' winPtr

{# fun Fl_Window_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
windowSetLabel :: Window a  -> String ->  IO (())
windowSetLabel win l' = withObject win $ \winPtr -> setLabel' winPtr l'

{# fun Fl_Window_set_iconlabel as setIconlabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
windowSetIconlabel :: Window a  -> String ->  IO (())
windowSetIconlabel win l' = withObject win $ \winPtr -> setIconlabel' winPtr l'

{# fun Fl_Window_set_label_with_iconlabel as setLabelWithIconlabel' { id `Ptr ()',`String',`String' } -> `()' supressWarningAboutRes #}
windowSetLabelWithIconlabel :: Window a  -> String -> String ->  IO (())
windowSetLabelWithIconlabel win label iconlabel = withObject win $ \winPtr -> setLabelWithIconlabel' winPtr label iconlabel

{# fun Fl_Window_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
windowCopyLabel :: Window a  -> String ->  IO (())
windowCopyLabel win a = withObject win $ \winPtr -> copyLabel' winPtr a

{# fun Fl_Window_set_default_xclass as setDefaultXclass' { `String' } -> `()' supressWarningAboutRes #}
windowSetDefaultXclass :: String ->  IO (())
windowSetDefaultXclass label = setDefaultXclass' label

{# fun Fl_Window_default_xclass as defaultXclass' {  } -> `String' #}
windowDefaultXclass ::  IO (String)
windowDefaultXclass  = defaultXclass'

{# fun Fl_Window_xclass as xclass' { id `Ptr ()' } -> `String' #}
windowXclass :: Window a  ->  IO (String)
windowXclass win = withObject win $ \winPtr -> xclass' winPtr

{# fun Fl_Window_set_xclass as setXclass' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
windowSetXclass :: Window a  -> String ->  IO (())
windowSetXclass win c = withObject win $ \winPtr -> setXclass' winPtr c

{# fun Fl_Window_icon as icon' { id `Ptr ()' } -> `Ptr ()' id #}
windowIcon :: Window a  ->  IO (Ptr ())
windowIcon win = withObject win $ \winPtr -> icon' winPtr

{# fun Fl_Window_set_icon as setIcon' { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowSetIcon :: Window a  -> Ptr () ->  IO (())
windowSetIcon win bitmap = withObject win $ \winPtr -> setIcon' winPtr bitmap

{# fun Fl_Window_shown as shown' { id `Ptr ()' } -> `Bool' toBool #}
windowShown :: Window a  ->  IO (Bool)
windowShown win = withObject win $ \winPtr -> shown' winPtr

{# fun Fl_Window_iconize as iconize' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowIconize :: Window a  ->  IO (())
windowIconize win = withObject win $ \winPtr -> iconize' winPtr

{# fun Fl_Window_x_root as xRoot' { id `Ptr ()' } -> `Int' #}
windowXRoot :: Window a  ->  IO (Int)
windowXRoot win = withObject win $ \winPtr -> xRoot' winPtr

{# fun Fl_Window_y_root as yRoot' { id `Ptr ()' } -> `Int' #}
windowYRoot :: Window a  ->  IO (Int)
windowYRoot win = withObject win $ \winPtr -> yRoot' winPtr

{# fun Fl_Window_current as current' {  } -> `Ptr ()' id #}
windowCurrent ::  IO (Ptr ())
windowCurrent  = current'

{# fun Fl_Window_make_current as makeCurrent' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowMakeCurrent :: Window a  ->  IO (())
windowMakeCurrent win = withObject win $ \winPtr -> makeCurrent' winPtr

{# fun Fl_Window_set_cursor_with_bg as setCursorWithBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg as setCursorWithFg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor_with_fg_bg as setCursorWithFgBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_cursor as setCursor' { id `Ptr ()',cFromEnum `CursorType' } -> `()' supressWarningAboutRes #}
windowSetCursor :: Window a -> CursorType -> IO ()
windowSetCursor win cursor =  withObject win $ \winPtr -> setCursor' winPtr cursor
windowSetCursorWithFgBg :: Window a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
windowSetCursorWithFgBg win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withObject win $ \winPtr -> setCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withObject win $ \winPtr -> setCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withObject win $ \winPtr -> setCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withObject win $ \winPtr -> setCursor' winPtr cursor

{# fun Fl_Window_set_default_cursor_with_bg as setDefaultCursorWithBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor_with_fg as setDefaultCursorWithFg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor_with_fg_bg as setDefaultCursorWithFgBg' { id `Ptr ()',cFromEnum `CursorType',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_set_default_cursor as setDefaultCursor' { id `Ptr ()',cFromEnum `CursorType' } -> `()' supressWarningAboutRes #}
windowSetDefaultCursor :: Window a  -> CursorType ->  IO (())
windowSetDefaultCursor win cursor = withObject win $ \winPtr -> setDefaultCursor' winPtr cursor
windowSetDefaultCursorWithFgBg:: Window a  -> CursorType -> (Maybe Color, Maybe Color) ->  IO (())
windowSetDefaultCursorWithFgBg win cursor fgbg =
    case fgbg of
      ((Just fg), (Just bg)) -> withObject win $ \winPtr -> setDefaultCursorWithFgBg' winPtr cursor fg bg
      (Nothing , (Just bg)) -> withObject win $ \winPtr -> setDefaultCursorWithBg' winPtr cursor bg
      ((Just fg), Nothing)  -> withObject win $ \winPtr -> setDefaultCursorWithFg' winPtr cursor fg
      (Nothing, Nothing)    -> withObject win $ \winPtr -> setDefaultCursor' winPtr cursor

{# fun Fl_Window_decorated_w as decoratedW' { id `Ptr ()' } -> `Int' #}
windowDecoratedW :: Window a  ->  IO (Int)
windowDecoratedW win = withObject win $ \winPtr -> decoratedW' winPtr

{# fun Fl_Window_decorated_h as decoratedH' { id `Ptr ()' } -> `Int' #}
windowDecoratedH :: Window a  ->  IO (Int)
windowDecoratedH win = withObject win $ \winPtr -> decoratedH' winPtr
