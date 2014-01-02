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
     buttonSetDownColor
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
     buttonDrawOverride       :: Maybe (WidgetCallback a)
    ,buttonHandleOverride     :: Maybe (WidgetEventHandler a)
    ,buttonResizeOverride     :: Maybe (RectangleF a)
    ,buttonShowOverride       :: Maybe (WidgetCallback a)
    ,buttonHideOverride       :: Maybe (WidgetCallback a)
    ,buttonAsWindowOverride   :: Maybe (GetWindowF a)
    ,buttonAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,buttonAsGroupOverride    :: Maybe (GetGroupF a)
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
        makeObject = objectOrError " widgetNew : object construction returned a null pointer"
    in case (l', funcs') of
        (Nothing,Nothing) -> widgetNew' x_pos y_pos width height >>=
                             makeObject
        ((Just l), Nothing) -> widgetNewWithLabel' x_pos y_pos width height l >>=
                               makeObject
        ((Just l), (Just fs)) -> do
                               ptr <- buttonFunctionStruct fs
                               overriddenWidgetNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             makeObject
        (Nothing, (Just fs)) -> do
                               ptr <- buttonFunctionStruct fs
                               overriddenWidgetNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    makeObject

{# fun Fl_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' #}
buttonDestroy :: Widget a -> IO ()
buttonDestroy win = withObject win $ \winPtr -> widgetDestroy' winPtr
{# fun Fl_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' #}
buttonDrawSuper :: Button a  ->  IO (())
buttonDrawSuper button = withObject button $ \buttonPtr -> drawSuper' buttonPtr
{# fun Fl_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
buttonHandleSuper :: Button a  -> Int ->  IO (Int)
buttonHandleSuper button event = withObject button $ \buttonPtr -> handleSuper' buttonPtr event
{#fun Fl_Button_handle as buttonHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
buttonHandle :: Button a -> Event -> IO Int
buttonHandle button event = withObject button (\p -> buttonHandle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Button_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
buttonAsGroupSuper :: Button a  ->  IO (Maybe (Group ()))
buttonAsGroupSuper button = withObject button $ \buttonPtr -> asGroupSuper' buttonPtr
{# fun Fl_Button_as_group as asGroup' { id `Ptr ()' } -> `Maybe (Group ())' toObject #}
buttonAsGroup :: Button a  ->  IO (Maybe (Group ()))
buttonAsGroup button = withObject button $ \buttonPtr -> asGroup' buttonPtr
buttonAsGlWindowSuper :: Widget a  ->  IO (Maybe (GlWindow ()))
buttonAsGlWindowSuper = widgetAsGlWindowSuper
{# fun Fl_Button_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
buttonAsGlWindow :: Button a  ->  IO (Maybe (GlWindow()))
buttonAsGlWindow button = withObject button $ \buttonPtr -> asGlWindow' buttonPtr
{# fun Fl_Button_as_window_super as asWindowSuper' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
buttonAsWindowSuper :: Window a  ->  IO (Maybe (Window ()))
buttonAsWindowSuper window = withObject window $ \windowPtr -> asWindowSuper' windowPtr
{# fun Fl_Button_as_window as asWindow' { id `Ptr ()' } -> `Maybe (Window ())' toObject #}
buttonAsWindow :: Button a  ->  IO (Maybe (Window()))
buttonAsWindow button = withObject button $ \buttonPtr -> asWindow' buttonPtr
{# fun Fl_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
buttonResizeSuper :: Button a  -> Rectangle -> IO (())
buttonResizeSuper button rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withObject button $ \buttonPtr -> resizeSuper' buttonPtr x_pos y_pos width height
{# fun Fl_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
buttonResize :: Button a  -> Rectangle -> IO (())
buttonResize button rectangle = withObject button $ \buttonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' buttonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' #}
buttonHideSuper :: Button a  ->  IO (())
buttonHideSuper button = withObject button $ \buttonPtr -> hideSuper' buttonPtr
{# fun Fl_Button_hide as hide' { id `Ptr ()' } -> `()' #}
buttonHide :: Button a  ->  IO (())
buttonHide button = withObject button $ \buttonPtr -> hide' buttonPtr
{# fun Fl_Button_show_super as showSuper' { id `Ptr ()' } -> `()' #}
buttonShowSuper :: Button a  ->  IO (())
buttonShowSuper button = withObject button $ \buttonPtr -> showSuper' buttonPtr
{# fun Fl_Button_show as buttonShow' {id `Ptr ()'} -> `()' #}
buttonShow :: Button a -> IO ()
buttonShow button = withObject button $ (\p -> buttonShow' p)

buttonSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
buttonSetCallback = widgetSetCallback
buttonParent :: Widget a -> IO (Maybe (Group ()))
buttonParent = widgetParent
buttonSetParent :: Widget a -> Group b -> IO ()
buttonSetParent = widgetSetParent
buttonType_ :: Widget a  ->  IO (Word8)
buttonType_ = widgetType_
buttonSetType :: Widget a  -> Word8 ->  IO (())
buttonSetType = widgetSetType
buttonDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
buttonDrawLabel = widgetDrawLabel
buttonX :: Widget a  ->  IO (Int)
buttonX = widgetX
buttonY :: Widget a  ->  IO (Int)
buttonY = widgetY
buttonW :: Widget a  ->  IO (Int)
buttonW = widgetW
buttonH :: Widget a  ->  IO (Int)
buttonH = widgetH
buttonSetAlign :: Widget a  -> AlignType ->  IO (())
buttonSetAlign = widgetSetAlign
buttonAlign :: Widget a  ->  IO (AlignType)
buttonAlign = widgetAlign
buttonBox :: Widget a  ->  IO (Boxtype)
buttonBox = widgetBox
buttonSetBox :: Widget a  -> Boxtype ->  IO (())
buttonSetBox = widgetSetBox
buttonColor :: Widget a  ->  IO (Color)
buttonColor = widgetColor
buttonSetColor :: Widget a  -> Color ->  IO (())
buttonSetColor = widgetSetColor
buttonSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
buttonSetColorWithBgSel = widgetSetColorWithBgSel
buttonSelectionColor :: Widget a  ->  IO (Color)
buttonSelectionColor = widgetSelectionColor
buttonSetSelectionColor :: Widget a  -> Color ->  IO (())
buttonSetSelectionColor = widgetSetSelectionColor
buttonLabel :: Widget a  ->  IO (String)
buttonLabel = widgetLabel
buttonCopyLabel :: Widget a  -> String ->  IO (())
buttonCopyLabel = widgetCopyLabel
buttonSetLabel :: Widget a  -> String ->  IO (())
buttonSetLabel = widgetSetLabel
buttonLabeltype :: Widget a  ->  IO (Labeltype)
buttonLabeltype = widgetLabeltype
buttonSetLabeltype :: Widget a  -> Labeltype ->  IO (())
buttonSetLabeltype = widgetSetLabeltype
buttonLabelcolor :: Widget a  ->  IO (Color)
buttonLabelcolor = widgetLabelcolor
buttonSetLabelcolor :: Widget a  -> Color ->  IO (())
buttonSetLabelcolor = widgetSetLabelcolor
buttonLabelfont :: Widget a  ->  IO (Font)
buttonLabelfont = widgetLabelfont
buttonSetLabelfont :: Widget a  -> Font ->  IO (())
buttonSetLabelfont = widgetSetLabelfont
buttonLabelsize :: Widget a  ->  IO (FontSize)
buttonLabelsize = widgetLabelsize
buttonSetLabelsize :: Widget a  -> FontSize ->  IO (())
buttonSetLabelsize = widgetSetLabelsize
buttonImage :: Widget a  ->  IO (Maybe (Image ()))
buttonImage = widgetImage
buttonSetImage :: Widget a  -> Image b ->  IO (())
buttonSetImage = widgetSetImage
buttonDeimage :: Widget a  ->  IO (Maybe (Image ()))
buttonDeimage = widgetDeimage
buttonSetDeimage :: Widget a  -> Image b ->  IO (())
buttonSetDeimage = widgetSetDeimage
buttonTooltip :: Widget a  ->  IO (String)
buttonTooltip = widgetTooltip
buttonCopyTooltip :: Widget a  -> String ->  IO (())
buttonCopyTooltip = widgetCopyTooltip
buttonSetTooltip :: Widget a  -> String ->  IO (())
buttonSetTooltip = widgetSetTooltip
buttonWhen :: Widget a  ->  IO (When)
buttonWhen = widgetWhen
buttonSetWhen :: Widget a  -> Word8 ->  IO (())
buttonSetWhen = widgetSetWhen
buttonVisible :: Widget a  ->  IO (Int)
buttonVisible = widgetVisible
buttonVisibleR :: Widget a  ->  IO (Int)
buttonVisibleR = widgetVisibleR
buttonSetVisible :: Widget a  ->  IO (())
buttonSetVisible = widgetSetVisible
buttonClearVisible :: Widget a  ->  IO (())
buttonClearVisible = widgetClearVisible
buttonActive :: Widget a  ->  IO (Int)
buttonActive = widgetActive
buttonActiveR :: Widget a  ->  IO (Int)
buttonActiveR = widgetActiveR
buttonActivate :: Widget a  ->  IO (())
buttonActivate = widgetActivate
buttonDeactivate :: Widget a  ->  IO (())
buttonDeactivate = widgetDeactivate
buttonOutput :: Widget a  ->  IO (Int)
buttonOutput = widgetOutput
buttonSetOutput :: Widget a  ->  IO (())
buttonSetOutput = widgetSetOutput
buttonClearOutput :: Widget a  ->  IO (())
buttonClearOutput = widgetClearOutput
buttonTakesevents :: Widget a  ->  IO (Int)
buttonTakesevents = widgetTakesevents
buttonSetChanged :: Widget a  ->  IO (())
buttonSetChanged = widgetSetChanged
buttonClearChanged :: Widget a  ->  IO (())
buttonClearChanged = widgetClearChanged
buttonTakeFocus :: Widget a  ->  IO (Int)
buttonTakeFocus = widgetTakeFocus
buttonSetVisibleFocus :: Widget a  ->  IO (())
buttonSetVisibleFocus = widgetSetVisibleFocus
buttonClearVisibleFocus :: Widget a  ->  IO (())
buttonClearVisibleFocus = widgetClearVisibleFocus
buttonModifyVisibleFocus :: Widget a  -> Int ->  IO (())
buttonModifyVisibleFocus = widgetModifyVisibleFocus
buttonVisibleFocus :: Widget a  ->  IO (Int)
buttonVisibleFocus = widgetVisibleFocus
buttonContains :: Widget a  -> Widget a  ->  IO (Int)
buttonContains = widgetContains
buttonInside :: Widget a  -> Widget a  ->  IO (Int)
buttonInside = widgetInside
buttonRedraw :: Widget a  ->  IO (())
buttonRedraw = widgetRedraw
buttonRedrawLabel :: Widget a  ->  IO (())
buttonRedrawLabel = widgetRedrawLabel
buttonDamage :: Widget a  ->  IO (Word8)
buttonDamage = widgetDamage
buttonClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
buttonClearDamageWithBitmask = widgetClearDamageWithBitmask
buttonClearDamage :: Widget a  ->  IO (())
buttonClearDamage = widgetClearDamage
buttonDamageWithText :: Widget a  -> Word8 ->  IO (())
buttonDamageWithText = widgetDamageWithText
buttonDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
buttonDamageInsideWidget = widgetDamageInsideWidget
buttonMeasureLabel :: Widget a  -> IO (Size)
buttonMeasureLabel = widgetMeasureLabel
buttonWindow :: Widget a  ->  IO (Maybe (Window ()))
buttonWindow = widgetWindow
buttonTopWindow :: Widget a  ->  IO (Maybe (Window ()))
buttonTopWindow = widgetTopWindow
buttonTopWindowOffset :: Widget a -> IO (Position)
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

{# fun unsafe Fl_Button_setonly as setonly' { id `Ptr ()' } -> `()' #}
buttonSetonly :: Button a  ->  IO (())
buttonSetonly b = withObject b $ \bPtr -> setonly' bPtr

{# fun unsafe Fl_Button_get_shortcut as getShortcut' { id `Ptr ()' } -> `FlShortcut' fromIntegral #}
buttonGetShortcut :: Button a  ->  IO (FlShortcut)
buttonGetShortcut b = withObject b $ \bPtr -> getShortcut' bPtr

{# fun unsafe Fl_Button_set_shortcut as setShortcut' { id `Ptr ()',fromIntegral `Int' } -> `()' #}
buttonSetShortcut :: Button a  -> Int ->  IO (())
buttonSetShortcut b s = withObject b $ \bPtr -> setShortcut' bPtr s

{# fun unsafe Fl_Button_down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
buttonDownBox :: Button a  ->  IO (Boxtype)
buttonDownBox b = withObject b $ \bPtr -> downBox' bPtr

{# fun unsafe Fl_Button_set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
buttonSetDownBox :: Button a  -> Boxtype ->  IO (())
buttonSetDownBox b boxtype = withObject b $ \bPtr -> setDownBox' bPtr boxtype

{# fun unsafe Fl_Button_down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
buttonDownColor :: Button a  ->  IO (Color)
buttonDownColor b = withObject b $ \bPtr -> downColor' bPtr

{# fun unsafe Fl_Button_set_down_color as setDownColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
buttonSetDownColor :: Button a  -> Color ->  IO (())
buttonSetDownColor b c = withObject b $ \bPtr -> setDownColor' bPtr c
