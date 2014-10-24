{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Button
    (
     ButtonFuncs(..),
     defaultButtonFuncs,
     -- * Constructor
     buttonNew,
     buttonDestroy,
     -- * Fl_Widget specific
     buttonHandle,
     buttonParent,
     buttonSetParent,
     buttonType_,
     buttonSetType,
     buttonDrawSuper,
     buttonHandleSuper,
     buttonAsWindowSuper,
     buttonAsWindow,
     buttonX,
     buttonY,
     buttonW,
     buttonH,
     buttonSetAlign,
     buttonAlign,
     buttonBox,
     buttonSetBox,
     buttonColor,
     buttonSetColor,
     buttonSetColorWithBgSel,
     buttonSelectionColor,
     buttonSetSelectionColor,
     buttonLabel,
     buttonCopyLabel,
     buttonSetLabel,
     buttonLabeltype,
     buttonSetLabeltype,
     buttonLabelcolor,
     buttonSetLabelcolor,
     buttonLabelfont,
     buttonSetLabelfont,
     buttonLabelsize,
     buttonSetLabelsize,
     buttonImage,
     buttonSetImage,
     buttonDeimage,
     buttonSetDeimage,
     buttonTooltip,
     buttonCopyTooltip,
     buttonSetTooltip,
     buttonWhen,
     buttonSetWhen,
     buttonVisible,
     buttonVisibleR,
     buttonShowSuper,
     buttonShow,
     buttonHideSuper,
     buttonHide,
     buttonSetVisible,
     buttonClearVisible,
     buttonActive,
     buttonActiveR,
     buttonActivate,
     buttonDeactivate,
     buttonOutput,
     buttonSetOutput,
     buttonClearOutput,
     buttonTakesevents,
     buttonSetChanged,
     buttonClearChanged,
     buttonTakeFocus,
     buttonSetVisibleFocus,
     buttonClearVisibleFocus,
     buttonModifyVisibleFocus,
     buttonVisibleFocus,
     buttonContains,
     buttonInside,
     buttonRedraw,
     buttonRedrawLabel,
     buttonDamage,
     buttonClearDamageWithBitmask,
     buttonClearDamage,
     buttonDamageWithText,
     buttonDamageInsideWidget,
     buttonMeasureLabel,
     buttonWindow,
     buttonTopWindow,
     buttonTopWindowOffset,
     buttonAsGroupSuper,
     buttonAsGroup,
     buttonAsGlWindowSuper,
     buttonAsGlWindow,
     buttonResizeSuper,
     buttonResize,
     buttonSetCallback,
     buttonDrawLabel,
     buttonValue,
     buttonSetValue,
     buttonSet,
     buttonClear,
     buttonSetonly,
     buttonGetShortcut,
     buttonSetShortcut,
     buttonDownBox,
     buttonSetDownBox,
     buttonDownColor,
     buttonSetDownColor,
     buttonDrawBox,
     buttonDrawBoxWithBoxtype,
     buttonDrawBackdrop,
     buttonDrawFocus
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
data ButtonFuncs a =
    ButtonFuncs
    {
     buttonDrawOverride       :: Maybe (Button a -> IO ())
    ,buttonHandleOverride     :: Maybe (Button a -> Event -> IO Int)
    ,buttonResizeOverride     :: Maybe (Button a -> Rectangle -> IO ())
    ,buttonShowOverride       :: Maybe (Button a -> IO ())
    ,buttonHideOverride       :: Maybe (Button a -> IO ())
    ,buttonAsWindowOverride   :: Maybe (Button a -> IO (Window ()))
    ,buttonAsGlWindowOverride :: Maybe (Button a -> IO (GlWindow ()))
    ,buttonAsGroupOverride    :: Maybe (Button a -> IO (Group ()))
    }

buttonFunctionStruct :: (ButtonFuncs a) -> IO (Ptr ())
buttonFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Button_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (buttonDrawOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (buttonHandleOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (buttonResizeOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (buttonShowOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (buttonHideOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (buttonAsWindowOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (buttonAsGlWindowOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (buttonAsGroupOverride funcs) >>=
                             {#set fl_Button_Virtual_Funcs->as_group#} p
      return p
defaultButtonFuncs :: ButtonFuncs a
defaultButtonFuncs = ButtonFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

{# fun Fl_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenButton_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenButton_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
buttonNew :: Rectangle -> Maybe String -> Maybe (ButtonFuncs a) -> IO (Button ())
buttonNew rectangle l' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case (l', funcs') of
        (Nothing,Nothing) -> widgetNew' x_pos y_pos width height >>=
                             toObject
        ((Just l), Nothing) -> widgetNewWithLabel' x_pos y_pos width height l >>=
                               toObject
        ((Just l), (Just fs)) -> do
                               ptr <- buttonFunctionStruct fs
                               overriddenWidgetNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             toObject
        (Nothing, (Just fs)) -> do
                               ptr <- buttonFunctionStruct fs
                               overriddenWidgetNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    toObject

{# fun Fl_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonDestroy :: Button a -> IO ()
buttonDestroy button = swapObject button $
                          \buttonPtr ->
                             widgetDestroy' buttonPtr >>
                             return nullPtr
{# fun Fl_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonDrawSuper :: Button a  ->  IO (())
buttonDrawSuper button = withObject button $ \buttonPtr -> drawSuper' buttonPtr
{# fun Fl_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
buttonHandleSuper :: Button a  -> Int ->  IO (Int)
buttonHandleSuper button event = withObject button $ \buttonPtr -> handleSuper' buttonPtr event
{#fun Fl_Button_handle as buttonHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
buttonHandle :: Button a -> Event -> IO Int
buttonHandle button event = withObject button (\p -> buttonHandle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Button_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
buttonAsGroupSuper :: Button a  ->  IO (Group ())
buttonAsGroupSuper button = withObject button $ \buttonPtr -> asGroupSuper' buttonPtr
{# fun Fl_Button_as_group as asGroup' { id `Ptr ()' } -> `Group ()' unsafeToObject #}
buttonAsGroup :: Button a  ->  IO (Group ())
buttonAsGroup button = withObject button $ \buttonPtr -> asGroup' buttonPtr
buttonAsGlWindowSuper :: Widget a  ->  IO (GlWindow ())
buttonAsGlWindowSuper = widgetAsGlWindowSuper
{# fun Fl_Button_as_gl_window as asGlWindow' { id `Ptr ()' } -> `GlWindow ()' unsafeToObject #}
buttonAsGlWindow :: Button a  ->  IO (GlWindow())
buttonAsGlWindow button = withObject button $ \buttonPtr -> asGlWindow' buttonPtr
{# fun Fl_Button_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
buttonAsWindowSuper :: Window a  ->  IO (Window ())
buttonAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr
{# fun Fl_Button_as_window as asWindow' { id `Ptr ()' } -> `Window ()' unsafeToObject #}
buttonAsWindow :: Button a  ->  IO (Window())
buttonAsWindow button = withObject button $ \buttonPtr -> asWindow' buttonPtr
{# fun Fl_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
buttonResizeSuper :: Button a  -> Rectangle -> IO (())
buttonResizeSuper button rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject button $ \buttonPtr -> resizeSuper' buttonPtr x_pos y_pos width height
{# fun Fl_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
buttonResize :: Button a  -> Rectangle -> IO (())
buttonResize button rectangle = withObject button $ \buttonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' buttonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonHideSuper :: Button a  ->  IO (())
buttonHideSuper button = withObject button $ \buttonPtr -> hideSuper' buttonPtr
{# fun Fl_Button_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonHide :: Button a  ->  IO (())
buttonHide button = withObject button $ \buttonPtr -> hide' buttonPtr
{# fun Fl_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonShowSuper :: Button a  ->  IO (())
buttonShowSuper button = withObject button $ \buttonPtr -> showSuper' buttonPtr
{# fun Fl_Button_show as buttonShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
buttonShow :: Button a -> IO ()
buttonShow button = withObject button $ (\p -> buttonShow' p)

buttonSetCallback :: Button a -> (Button b -> IO ()) -> IO (())
buttonSetCallback = widgetSetCallback
buttonParent :: Button a -> IO (Group ())
buttonParent = widgetParent
buttonSetParent :: Button a -> Group b -> IO ()
buttonSetParent = widgetSetParent
buttonType_ :: Button a  ->  IO (Word8)
buttonType_ = widgetType_
buttonSetType :: Button a  -> Word8 ->  IO (())
buttonSetType = widgetSetType
buttonDrawLabel :: Button a  -> Maybe (Rectangle,AlignType)->  IO (())
buttonDrawLabel = widgetDrawLabel
buttonX :: Button a  ->  IO (Int)
buttonX = widgetX
buttonY :: Button a  ->  IO (Int)
buttonY = widgetY
buttonW :: Button a  ->  IO (Int)
buttonW = widgetW
buttonH :: Button a  ->  IO (Int)
buttonH = widgetH
buttonSetAlign :: Button a  -> AlignType ->  IO (())
buttonSetAlign = widgetSetAlign
buttonAlign :: Button a  ->  IO (AlignType)
buttonAlign = widgetAlign
buttonBox :: Button a  ->  IO (Boxtype)
buttonBox = widgetBox
buttonSetBox :: Button a  -> Boxtype ->  IO (())
buttonSetBox = widgetSetBox
buttonColor :: Button a  ->  IO (Color)
buttonColor = widgetColor
buttonSetColor :: Button a  -> Color ->  IO (())
buttonSetColor = widgetSetColor
buttonSetColorWithBgSel :: Button a  -> Color -> Color ->  IO (())
buttonSetColorWithBgSel = widgetSetColorWithBgSel
buttonSelectionColor :: Button a  ->  IO (Color)
buttonSelectionColor = widgetSelectionColor
buttonSetSelectionColor :: Button a  -> Color ->  IO (())
buttonSetSelectionColor = widgetSetSelectionColor
buttonLabel :: Button a  ->  IO (String)
buttonLabel = widgetLabel
buttonCopyLabel :: Button a  -> String ->  IO (())
buttonCopyLabel = widgetCopyLabel
buttonSetLabel :: Button a  -> String ->  IO (())
buttonSetLabel = widgetSetLabel
buttonLabeltype :: Button a  ->  IO (Labeltype)
buttonLabeltype = widgetLabeltype
buttonSetLabeltype :: Button a  -> Labeltype ->  IO (())
buttonSetLabeltype = widgetSetLabeltype
buttonLabelcolor :: Button a  ->  IO (Color)
buttonLabelcolor = widgetLabelcolor
buttonSetLabelcolor :: Button a  -> Color ->  IO (())
buttonSetLabelcolor = widgetSetLabelcolor
buttonLabelfont :: Button a  ->  IO (Font)
buttonLabelfont = widgetLabelfont
buttonSetLabelfont :: Button a  -> Font ->  IO (())
buttonSetLabelfont = widgetSetLabelfont
buttonLabelsize :: Button a  ->  IO (FontSize)
buttonLabelsize = widgetLabelsize
buttonSetLabelsize :: Button a  -> FontSize ->  IO (())
buttonSetLabelsize = widgetSetLabelsize
buttonImage :: Button a  ->  IO (Image ())
buttonImage = widgetImage
buttonSetImage :: Button a  -> Image b ->  IO (())
buttonSetImage = widgetSetImage
buttonDeimage :: Button a  ->  IO (Image ())
buttonDeimage = widgetDeimage
buttonSetDeimage :: Button a  -> Image b ->  IO (())
buttonSetDeimage = widgetSetDeimage
buttonTooltip :: Button a  ->  IO (String)
buttonTooltip = widgetTooltip
buttonCopyTooltip :: Button a  -> String ->  IO (())
buttonCopyTooltip = widgetCopyTooltip
buttonSetTooltip :: Button a  -> String ->  IO (())
buttonSetTooltip = widgetSetTooltip
buttonWhen :: Button a  ->  IO (When)
buttonWhen = widgetWhen
buttonSetWhen :: Button a  -> Word8 ->  IO (())
buttonSetWhen = widgetSetWhen
buttonVisible :: Button a  ->  IO (Int)
buttonVisible = widgetVisible
buttonVisibleR :: Button a  ->  IO (Int)
buttonVisibleR = widgetVisibleR
buttonSetVisible :: Button a  ->  IO (())
buttonSetVisible = widgetSetVisible
buttonClearVisible :: Button a  ->  IO (())
buttonClearVisible = widgetClearVisible
buttonActive :: Button a  ->  IO (Int)
buttonActive = widgetActive
buttonActiveR :: Button a  ->  IO (Int)
buttonActiveR = widgetActiveR
buttonActivate :: Button a  ->  IO (())
buttonActivate = widgetActivate
buttonDeactivate :: Button a  ->  IO (())
buttonDeactivate = widgetDeactivate
buttonOutput :: Button a  ->  IO (Int)
buttonOutput = widgetOutput
buttonSetOutput :: Button a  ->  IO (())
buttonSetOutput = widgetSetOutput
buttonClearOutput :: Button a  ->  IO (())
buttonClearOutput = widgetClearOutput
buttonTakesevents :: Button a  ->  IO (Int)
buttonTakesevents = widgetTakesevents
buttonSetChanged :: Button a  ->  IO (())
buttonSetChanged = widgetSetChanged
buttonClearChanged :: Button a  ->  IO (())
buttonClearChanged = widgetClearChanged
buttonTakeFocus :: Button a  ->  IO (Int)
buttonTakeFocus = widgetTakeFocus
buttonSetVisibleFocus :: Button a  ->  IO (())
buttonSetVisibleFocus = widgetSetVisibleFocus
buttonClearVisibleFocus :: Button a  ->  IO (())
buttonClearVisibleFocus = widgetClearVisibleFocus
buttonModifyVisibleFocus :: Button a  -> Int ->  IO (())
buttonModifyVisibleFocus = widgetModifyVisibleFocus
buttonVisibleFocus :: Button a  ->  IO (Int)
buttonVisibleFocus = widgetVisibleFocus
buttonContains :: Button a  -> Button a  ->  IO (Int)
buttonContains = widgetContains
buttonInside :: Button a  -> Button a  ->  IO (Int)
buttonInside = widgetInside
buttonRedraw :: Button a  ->  IO (())
buttonRedraw = widgetRedraw
buttonRedrawLabel :: Button a  ->  IO (())
buttonRedrawLabel = widgetRedrawLabel
buttonDamage :: Button a  ->  IO (Word8)
buttonDamage = widgetDamage
buttonClearDamageWithBitmask :: Button a  -> Word8 ->  IO (())
buttonClearDamageWithBitmask = widgetClearDamageWithBitmask
buttonClearDamage :: Button a  ->  IO (())
buttonClearDamage = widgetClearDamage
buttonDamageWithText :: Button a  -> Word8 ->  IO (())
buttonDamageWithText = widgetDamageWithText
buttonDamageInsideWidget :: Button a  -> Word8 -> Rectangle ->  IO (())
buttonDamageInsideWidget = widgetDamageInsideWidget
buttonMeasureLabel :: Button a  -> IO (Size)
buttonMeasureLabel = widgetMeasureLabel
buttonWindow :: Button a  ->  IO (Window ())
buttonWindow = widgetWindow
buttonTopWindow :: Button a  ->  IO (Window ())
buttonTopWindow = widgetTopWindow
buttonTopWindowOffset :: Button a -> IO (Position)
buttonTopWindowOffset = widgetTopWindowOffset

{# fun unsafe Fl_Button_value as value' { id `Ptr ()' } -> `Bool' cToBool #}
buttonValue :: Button a  ->  IO (Bool)
buttonValue b = withObject b $ \bPtr -> value' bPtr

{# fun unsafe Fl_Button_set_value as setValue' { id `Ptr ()', fromBool `Bool' } -> `Bool' toBool #}
buttonSetValue :: Button a  -> Bool ->  IO (Bool)
buttonSetValue b v = withObject b $ \bPtr -> setValue' bPtr v

{# fun unsafe Fl_Button_set as set' { id `Ptr ()' } -> `Bool' cToBool #}
buttonSet :: Button a  ->  IO (Bool)
buttonSet b = withObject b $ \bPtr -> set' bPtr

{# fun unsafe Fl_Button_clear as clear' { id `Ptr ()' } -> `Bool' cToBool #}
buttonClear :: Button a  ->  IO (Bool)
buttonClear b = withObject b $ \bPtr -> clear' bPtr

{# fun unsafe Fl_Button_setonly as setonly' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonSetonly :: Button a  ->  IO (())
buttonSetonly b = withObject b $ \bPtr -> setonly' bPtr

{# fun unsafe Fl_Button_get_shortcut as getShortcut' { id `Ptr ()' } -> `FlShortcut' fromIntegral #}
buttonGetShortcut :: Button a  ->  IO (FlShortcut)
buttonGetShortcut b = withObject b $ \bPtr -> getShortcut' bPtr

{# fun unsafe Fl_Button_set_shortcut as setShortcut' { id `Ptr ()',fromIntegral `Int' } -> `()' supressWarningAboutRes #}
buttonSetShortcut :: Button a  -> Int ->  IO (())
buttonSetShortcut b s = withObject b $ \bPtr -> setShortcut' bPtr s

{# fun unsafe Fl_Button_down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
buttonDownBox :: Button a  ->  IO (Boxtype)
buttonDownBox b = withObject b $ \bPtr -> downBox' bPtr

{# fun unsafe Fl_Button_set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
buttonSetDownBox :: Button a  -> Boxtype ->  IO (())
buttonSetDownBox b boxtype = withObject b $ \bPtr -> setDownBox' bPtr boxtype

{# fun unsafe Fl_Button_down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
buttonDownColor :: Button a  ->  IO (Color)
buttonDownColor b = withObject b $ \bPtr -> downColor' bPtr

{# fun unsafe Fl_Button_set_down_color as setDownColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
buttonSetDownColor :: Button a  -> Color ->  IO (())
buttonSetDownColor b c = withObject b $ \bPtr -> setDownColor' bPtr c
{# fun Fl_Button_draw_box as buttonDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_box_with_tc as buttonDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_box_with_txywhc as buttonDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
buttonDrawBox :: Button a -> IO ()
buttonDrawBox button = withObject button $ \buttonPtr -> buttonDrawBox' buttonPtr
buttonDrawBoxWithBoxtype :: Button a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
buttonDrawBoxWithBoxtype button bx c Nothing =
              withObject button $ \buttonPtr -> buttonDrawBoxWithTC' buttonPtr bx c
buttonDrawBoxWithBoxtype button bx c (Just r) =
              withObject button $ \buttonPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                buttonDrawBoxWithTXywhC' buttonPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Button_draw_backdrop as buttonDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
buttonDrawBackdrop :: Button a -> IO ()
buttonDrawBackdrop button = withObject button $ \buttonPtr -> buttonDrawBackdrop' buttonPtr

{# fun Fl_Button_draw_focus as buttonDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_focus_with_txywh as buttonDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
buttonDrawFocus :: Button a -> Maybe (Boxtype, Rectangle) -> IO ()
buttonDrawFocus button Nothing =
                withObject button $ \ buttonPtr -> buttonDrawFocus' buttonPtr
buttonDrawFocus button (Just (bx, r)) =
                withObject button $ \buttonPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  buttonDrawFocusWithTXywh' buttonPtr bx x_pos y_pos w_pos h_pos
