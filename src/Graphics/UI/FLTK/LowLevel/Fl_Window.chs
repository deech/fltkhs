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
     windowDecoratedH,
     windowDrawBox,
     windowDrawBoxWithBoxtype,
     windowDrawBackdrop,
     windowDrawFocus
    )
where
#include "Fl_C.h"
#include "Fl_WindowC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Group
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

data WindowFuncs a =
    WindowFuncs
    {
     windowDrawOverride       :: Maybe (Window a -> IO ())
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
windowParent :: Window a -> IO (Group ())
windowParent  = groupParent

windowSetParent :: Window a -> Group b -> IO ()
windowSetParent  = groupSetParent

windowType_ :: Window a  ->  IO (Word8)
windowType_  = groupType_

windowSetType :: Window a  -> Word8 ->  IO (())
windowSetType  = groupSetType

windowDrawLabel :: Window a  -> Maybe (Rectangle,AlignType)->  IO (())
windowDrawLabel  = groupDrawLabel

windowX :: Window a  ->  IO (Int)
windowX  = groupX

windowY :: Window a  ->  IO (Int)
windowY  = groupY

windowW :: Window a  ->  IO (Int)
windowW  = groupW

windowH :: Window a  ->  IO (Int)
windowH  = groupH

windowSetAlign :: Window a  -> AlignType ->  IO (())
windowSetAlign  = groupSetAlign

windowAlign :: Window a  ->  IO (AlignType)
windowAlign  = groupAlign

windowBox :: Window a  ->  IO (Boxtype)
windowBox  = groupBox

windowSetBox :: Window a  -> Boxtype ->  IO (())
windowSetBox  = groupSetBox

windowColor :: Window a  ->  IO (Color)
windowColor  = groupColor

windowSetColor :: Window a  -> Color ->  IO (())
windowSetColor  = groupSetColor

windowSetColorWithBgSel :: Window a  -> Color -> Color ->  IO (())
windowSetColorWithBgSel  = groupSetColorWithBgSel

windowSelectionColor :: Window a  ->  IO (Color)
windowSelectionColor  = groupSelectionColor

windowSetSelectionColor :: Window a  -> Color ->  IO (())
windowSetSelectionColor  = groupSetSelectionColor

windowLabeltype :: Window a  ->  IO (Labeltype)
windowLabeltype  = groupLabeltype

windowSetLabeltype :: Window a  -> Labeltype ->  IO (())
windowSetLabeltype  = groupSetLabeltype

windowLabelcolor :: Window a  ->  IO (Color)
windowLabelcolor  = groupLabelcolor

windowSetLabelcolor :: Window a  -> Color ->  IO (())
windowSetLabelcolor  = groupSetLabelcolor

windowLabelfont :: Window a  ->  IO (Font)
windowLabelfont  = groupLabelfont

windowSetLabelfont :: Window a  -> Font ->  IO (())
windowSetLabelfont  = groupSetLabelfont

windowLabelsize :: Window a  ->  IO (FontSize)
windowLabelsize  = groupLabelsize

windowSetLabelsize :: Window a  -> FontSize ->  IO (())
windowSetLabelsize  = groupSetLabelsize

windowImage :: Window a  ->  IO (Image ())
windowImage  = groupImage

windowSetImage :: Window a  -> Image b ->  IO (())
windowSetImage  = groupSetImage

windowDeimage :: Window a  ->  IO (Image ())
windowDeimage  = groupDeimage

windowSetDeimage :: Window a  -> Image b ->  IO (())
windowSetDeimage  = groupSetDeimage

windowTooltip :: Window a  ->  IO (String)
windowTooltip  = groupTooltip

windowCopyTooltip :: Window a  -> String ->  IO (())
windowCopyTooltip  = groupCopyTooltip

windowSetTooltip :: Window a  -> String ->  IO (())
windowSetTooltip  = groupSetTooltip

windowWhen :: Window a  ->  IO (When)
windowWhen  = groupWhen

windowSetWhen :: Window a  -> Word8 ->  IO (())
windowSetWhen  = groupSetWhen

windowVisible :: Window a  ->  IO (Int)
windowVisible  = groupVisible

windowVisibleR :: Window a  ->  IO (Int)
windowVisibleR  = groupVisibleR

{# fun Fl_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowHide :: Window a  ->  IO (())
windowHide window = withObject window $ \windowPtr -> hide' windowPtr

windowSetVisible :: Window a  ->  IO (())
windowSetVisible  = groupSetVisible

windowClearVisible :: Window a  ->  IO (())
windowClearVisible  = groupClearVisible

windowActive :: Window a  ->  IO (Int)
windowActive  = groupActive

windowActiveR :: Window a  ->  IO (Int)
windowActiveR  = groupActiveR

windowActivate :: Window a  ->  IO (())
windowActivate  = groupActivate

windowDeactivate :: Window a  ->  IO (())
windowDeactivate  = groupDeactivate

windowOutput :: Window a  ->  IO (Int)
windowOutput  = groupOutput

windowSetOutput :: Window a  ->  IO (())
windowSetOutput  = groupSetOutput

windowClearOutput :: Window a  ->  IO (())
windowClearOutput  = groupClearOutput

windowTakesevents :: Window a  ->  IO (Int)
windowTakesevents  = groupTakesevents

windowSetChanged :: Window a  ->  IO (())
windowSetChanged  = groupSetChanged

windowClearChanged :: Window a  ->  IO (())
windowClearChanged  = groupClearChanged

windowTakeFocus :: Window a  ->  IO (Int)
windowTakeFocus  = groupTakeFocus

windowSetVisibleFocus :: Window a  ->  IO (())
windowSetVisibleFocus  = groupSetVisibleFocus

windowClearVisibleFocus :: Window a  ->  IO (())
windowClearVisibleFocus  = groupClearVisibleFocus

windowModifyVisibleFocus :: Window a  -> Int ->  IO (())
windowModifyVisibleFocus  = groupModifyVisibleFocus

windowVisibleFocus :: Window a  ->  IO (Int)
windowVisibleFocus  = groupVisibleFocus

windowContains :: Window a  -> Group b  ->  IO (Int)
windowContains  = groupContains

windowInside :: Window a  -> Group b  ->  IO (Int)
windowInside  = groupInside

windowRedraw :: Window a  ->  IO (())
windowRedraw  = groupRedraw

windowRedrawLabel :: Window a  ->  IO (())
windowRedrawLabel  = groupRedrawLabel

windowDamage :: Window a  ->  IO (Word8)
windowDamage  = groupDamage

windowClearDamageWithBitmask :: Window a  -> Word8 ->  IO (())
windowClearDamageWithBitmask  = groupClearDamageWithBitmask

windowClearDamage :: Window a  ->  IO (())
windowClearDamage  = groupClearDamage

windowDamageWithText :: Window a  -> Word8 ->  IO (())
windowDamageWithText  = groupDamageWithText

windowDamageInsideWidget :: Window a  -> Word8 -> Rectangle ->  IO (())
windowDamageInsideWidget  = groupDamageInsideWidget

windowMeasureLabel :: Window a  -> IO (Size)
windowMeasureLabel  = groupMeasureLabel

windowWindow :: Window a  ->  IO (Window ())
windowWindow  = groupWindow

windowTopWindow :: Window a  ->  IO (Window ())
windowTopWindow  = groupTopWindow

windowTopWindowOffset :: Window a -> IO (Position)
windowTopWindowOffset  = groupTopWindowOffset

windowBegin :: Window a  ->  IO (())
windowBegin  = groupBegin

windowEnd :: Window b  ->  IO (())
windowEnd  = groupEnd

windowFind :: Window b  -> Widget a  ->  IO (Int)
windowFind  = groupFind

windowAdd :: Window b  -> Widget a  ->  IO (())
windowAdd  = groupAdd

windowInsert :: Window b  -> Widget a  -> Int ->  IO (())
windowInsert  = groupInsert

windowRemoveIndex :: Window a  -> Int ->  IO (())
windowRemoveIndex  = groupRemoveIndex

windowRemoveWidget :: Window b  -> Widget a  ->  IO (())
windowRemoveWidget  = groupRemoveWidget

windowClear :: Window a  ->  IO (())
windowClear  = groupClear

windowSetResizable :: Window b  -> Widget a  ->  IO (())
windowSetResizable  = groupSetResizable

windowResizable :: Window a  ->  IO (Widget ())
windowResizable  = groupResizable

windowAddResizable :: Window b  -> Widget a  ->  IO (())
windowAddResizable  = groupAddResizable

windowInitSizes :: Window a  ->  IO (())
windowInitSizes  = groupInitSizes

windowChildren :: Window a  ->  IO (Int)
windowChildren  = groupChildren

windowSetClipChildren :: Window a  -> Int ->  IO (())
windowSetClipChildren  = groupSetClipChildren

windowClipChildren :: Window a  ->  IO (Int)
windowClipChildren  = groupClipChildren

windowFocus :: Window b  -> Widget a  ->  IO (())
windowFocus  = groupFocus

windowDdfdesignKludge :: Window a  ->  IO (Widget ())
windowDdfdesignKludge  = groupDdfdesignKludge

windowInsertWithBefore :: Window b  -> Widget a  -> Widget c  ->  IO (())
windowInsertWithBefore  = groupInsertWithBefore

windowArray :: Window a  ->  IO [(Widget ())]
windowArray  = groupArray

windowChild :: Window a  -> Int ->  IO (Widget ())
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

{# fun Fl_Window_draw_box as windowDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_tc as windowDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_box_with_txywhc as windowDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
windowDrawBox :: Window a -> IO ()
windowDrawBox window = withObject window $ \windowPtr -> windowDrawBox' windowPtr
windowDrawBoxWithBoxtype :: Window a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
windowDrawBoxWithBoxtype window bx c Nothing =
              withObject window $ \windowPtr -> windowDrawBoxWithTC' windowPtr bx c
windowDrawBoxWithBoxtype window bx c (Just r) =
              withObject window $ \windowPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                windowDrawBoxWithTXywhC' windowPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Window_draw_backdrop as windowDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
windowDrawBackdrop :: Window a -> IO ()
windowDrawBackdrop window = withObject window $ \windowPtr -> windowDrawBackdrop' windowPtr

{# fun Fl_Window_draw_focus as windowDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Window_draw_focus_with_txywh as windowDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
windowDrawFocus :: Window a -> Maybe (Boxtype, Rectangle) -> IO ()
windowDrawFocus window Nothing =
                withObject window $ \ windowPtr -> windowDrawFocus' windowPtr
windowDrawFocus window (Just (bx, r)) =
                withObject window $ \windowPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  windowDrawFocusWithTXywh' windowPtr bx x_pos y_pos w_pos h_pos
