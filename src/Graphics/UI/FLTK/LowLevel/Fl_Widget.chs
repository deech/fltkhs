{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Widget
    (
     WidgetFuncs(..),
     defaultWidgetFuncs,
     -- * Constructor
     widgetNew,
     widgetDestroy,
     -- * Fl_Widget specific
     widgetHandle,
     widgetParent,
     widgetSetParent,
     widgetType_,
     widgetSetType,
     widgetDrawLabel,
     widgetX,
     widgetY,
     widgetW,
     widgetH,
     widgetSetAlign,
     widgetAlign,
     widgetBox,
     widgetSetBox,
     widgetColor,
     widgetSetColor,
     widgetSetColorWithBgSel,
     widgetSelectionColor,
     widgetSetSelectionColor,
     widgetLabel,
     widgetCopyLabel,
     widgetSetLabel,
     widgetLabeltype,
     widgetSetLabeltype,
     widgetLabelcolor,
     widgetSetLabelcolor,
     widgetLabelfont,
     widgetSetLabelfont,
     widgetLabelsize,
     widgetSetLabelsize,
     widgetImage,
     widgetSetImage,
     widgetDeimage,
     widgetSetDeimage,
     widgetTooltip,
     widgetCopyTooltip,
     widgetSetTooltip,
     widgetWhen,
     widgetSetWhen,
     widgetVisible,
     widgetVisibleR,
     widgetShowSuper,
     widgetShow,
     widgetHideSuper,
     widgetHide,
     widgetSetVisible,
     widgetClearVisible,
     widgetActive,
     widgetActiveR,
     widgetActivate,
     widgetDeactivate,
     widgetOutput,
     widgetSetOutput,
     widgetClearOutput,
     widgetTakesevents,
     widgetSetChanged,
     widgetClearChanged,
     widgetTakeFocus,
     widgetSetVisibleFocus,
     widgetClearVisibleFocus,
     widgetModifyVisibleFocus,
     widgetVisibleFocus,
     widgetContains,
     widgetInside,
     widgetRedraw,
     widgetRedrawLabel,
     widgetDamage,
     widgetClearDamageWithBitmask,
     widgetClearDamage,
     widgetDamageWithText,
     widgetDamageInsideWidget,
     widgetMeasureLabel,
     widgetWindow,
     widgetTopWindow,
     widgetTopWindowOffset,
     widgetAsGroupSuper,
     widgetAsGroup,
     widgetAsGlWindowSuper,
     widgetAsGlWindow,
     widgetResizeSuper,
     widgetResize,
     widgetSetCallback,
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Debug.Trace

data WidgetFuncs a =
    WidgetFuncs
    {
     widgetDrawOverride       :: Maybe (WidgetCallback a)
    ,widgetHandleOverride     :: Maybe (WidgetEventHandler a)
    ,widgetResizeOverride     :: Maybe (RectangleF a)
    ,widgetShowOverride       :: Maybe (WidgetCallback a)
    ,widgetHideOverride       :: Maybe (WidgetCallback a)
    ,widgetAsWindowOverride   :: Maybe (GetWindowF a)
    ,widgetAsGlWindowOverride :: Maybe (GetGlWindowF a)
    ,widgetAsGroupOverride    :: Maybe (GetGroupF a)
    }

widgetFunctionStruct :: (WidgetFuncs a) -> IO (Ptr ())
widgetFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Widget_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (widgetDrawOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (widgetHandleOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (widgetResizeOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (widgetShowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (widgetHideOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (widgetAsWindowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (widgetAsGlWindowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullFunPtr` (widgetAsGroupOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_group#} p
      return p
defaultWidgetFuncs :: WidgetFuncs a
defaultWidgetFuncs = WidgetFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

{# fun Fl_Widget_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Widget_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenWidget_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
widgetNew :: Rectangle -> Maybe String -> Maybe (WidgetFuncs a) -> IO (Widget ())
widgetNew rectangle l' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case (l', funcs') of
        (Nothing,Nothing) -> widgetNew' x_pos y_pos width height >>=
                             toObject
        ((Just l), Nothing) -> widgetNewWithLabel' x_pos y_pos width height l >>=
                               toObject
        ((Just l), (Just fs)) -> do
                               ptr <- widgetFunctionStruct fs
                               overriddenWidgetNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             toObject
        (Nothing, (Just fs)) -> do
                               ptr <- widgetFunctionStruct fs
                               overriddenWidgetNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    toObject

{# fun Fl_Widget_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetDestroy :: Widget a -> IO ()
widgetDestroy win = swapObject win $ \winPtr -> do
                                        widgetDestroy' winPtr
                                        return nullPtr

{#fun Fl_Widget_handle as widgetHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
widgetHandle :: Widget a -> Event -> IO Int
widgetHandle widget event = withObject widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event))

{#fun Fl_Widget_parent as widgetParent'
      { id `Ptr ()'} -> `Ptr ()' id #}
widgetParent :: Widget a -> IO (Group ())
widgetParent widget = withObject widget widgetParent' >>= toObject

{#fun Fl_Widget_set_parent as widgetSetParent'
      { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetSetParent :: Widget a -> Group b -> IO ()
widgetSetParent widget group =
    withObject widget
                   (\widgetPtr ->
                        withObject group (\groupPtr ->
                                              widgetSetParent' widgetPtr groupPtr
                                         )
                   )
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
widgetType_ :: Widget a  ->  IO (Word8)
widgetType_ widget = withObject widget $ \widgetPtr -> type' widgetPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
widgetSetType :: Widget a  -> Word8 ->  IO (())
widgetSetType widget t = withObject widget $ \widgetPtr -> setType' widgetPtr t
{# fun Fl_Widget_draw_label as drawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Widget_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
widgetDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
widgetDrawLabel widget Nothing = withObject widget $ \widgetPtr -> drawLabel' widgetPtr
widgetDrawLabel widget (Just (rectangle,align_)) = withObject widget $ \widgetPtr -> do
                                        let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                        drawLabelWithXywhAlignment' widgetPtr x_pos y_pos w_pos h_pos align_
{# fun Fl_Widget_x as x' { id `Ptr ()' } -> `Int' #}
widgetX :: Widget a  ->  IO (Int)
widgetX widget = withObject widget $ \widgetPtr -> x' widgetPtr
{# fun Fl_Widget_y as y' { id `Ptr ()' } -> `Int' #}
widgetY :: Widget a  ->  IO (Int)
widgetY widget = withObject widget $ \widgetPtr -> y' widgetPtr
{# fun Fl_Widget_w as w' { id `Ptr ()' } -> `Int' #}
widgetW :: Widget a  ->  IO (Int)
widgetW widget = withObject widget $ \widgetPtr -> w' widgetPtr
{# fun Fl_Widget_h as h' { id `Ptr ()' } -> `Int' #}
widgetH :: Widget a  ->  IO (Int)
widgetH widget = withObject widget $ \widgetPtr -> h' widgetPtr
{# fun Fl_Widget_set_align as setAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
widgetSetAlign :: Widget a  -> AlignType ->  IO (())
widgetSetAlign widget _align = withObject widget $ \widgetPtr -> setAlign' widgetPtr _align
{# fun Fl_Widget_align as align' { id `Ptr ()' } -> `AlignType' cToEnum #}
widgetAlign :: Widget a  ->  IO (AlignType)
widgetAlign widget = withObject widget $ \widgetPtr -> align' widgetPtr
{# fun Fl_Widget_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
widgetBox :: Widget a  ->  IO (Boxtype)
widgetBox widget = withObject widget $ \widgetPtr -> box' widgetPtr
{# fun Fl_Widget_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
widgetSetBox :: Widget a  -> Boxtype ->  IO (())
widgetSetBox widget new_box = withObject widget $ \widgetPtr -> setBox' widgetPtr new_box
{# fun Fl_Widget_color as color' { id `Ptr ()' } -> `Color' cToColor #}
widgetColor :: Widget a  ->  IO (Color)
widgetColor widget = withObject widget $ \widgetPtr -> color' widgetPtr
{# fun Fl_Widget_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
widgetSetColor :: Widget a  -> Color ->  IO (())
widgetSetColor widget bg = withObject widget $ \widgetPtr -> setColor' widgetPtr bg
{# fun Fl_Widget_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
widgetSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
widgetSetColorWithBgSel widget bg a = withObject widget $ \widgetPtr -> setColorWithBgSel' widgetPtr bg a
{# fun Fl_Widget_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
widgetSelectionColor :: Widget a  ->  IO (Color)
widgetSelectionColor widget = withObject widget $ \widgetPtr -> selectionColor' widgetPtr
{# fun Fl_Widget_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
widgetSetSelectionColor :: Widget a  -> Color ->  IO (())
widgetSetSelectionColor widget a = withObject widget $ \widgetPtr -> setSelectionColor' widgetPtr a
{# fun Fl_Widget_label as label' { id `Ptr ()' } -> `String' #}
widgetLabel :: Widget a  ->  IO (String)
widgetLabel widget = withObject widget $ \widgetPtr -> label' widgetPtr
{# fun Fl_Widget_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
widgetCopyLabel :: Widget a  -> String ->  IO (())
widgetCopyLabel widget new_label = withObject widget $ \widgetPtr -> copyLabel' widgetPtr new_label
{# fun Fl_Widget_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
widgetSetLabel :: Widget a  -> String ->  IO (())
widgetSetLabel widget text = withObject widget $ \widgetPtr -> setLabel' widgetPtr text
{# fun Fl_Widget_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
widgetLabeltype :: Widget a  ->  IO (Labeltype)
widgetLabeltype widget = withObject widget $ \widgetPtr -> labeltype' widgetPtr
{# fun Fl_Widget_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
widgetSetLabeltype :: Widget a  -> Labeltype ->  IO (())
widgetSetLabeltype widget a = withObject widget $ \widgetPtr -> setLabeltype' widgetPtr a
{# fun Fl_Widget_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
widgetLabelcolor :: Widget a  ->  IO (Color)
widgetLabelcolor widget = withObject widget $ \widgetPtr -> labelcolor' widgetPtr
{# fun Fl_Widget_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
widgetSetLabelcolor :: Widget a  -> Color ->  IO (())
widgetSetLabelcolor widget c = withObject widget $ \widgetPtr -> setLabelcolor' widgetPtr c
{# fun Fl_Widget_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
widgetLabelfont :: Widget a  ->  IO (Font)
widgetLabelfont widget = withObject widget $ \widgetPtr -> labelfont' widgetPtr
{# fun Fl_Widget_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
widgetSetLabelfont :: Widget a  -> Font ->  IO (())
widgetSetLabelfont widget c = withObject widget $ \widgetPtr -> setLabelfont' widgetPtr c
{# fun Fl_Widget_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
widgetLabelsize :: Widget a  ->  IO (FontSize)
widgetLabelsize widget = withObject widget $ \widgetPtr -> labelsize' widgetPtr >>= return . FontSize
{# fun Fl_Widget_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
widgetSetLabelsize :: Widget a  -> FontSize ->  IO (())
widgetSetLabelsize widget (FontSize pix) = withObject widget $ \widgetPtr -> setLabelsize' widgetPtr pix
{# fun Fl_Widget_image as image' { id `Ptr ()' } -> `(Image ())' unsafeToObject #}
widgetImage :: Widget a  ->  IO (Image ())
widgetImage widget = withObject widget $ \widgetPtr -> image' widgetPtr
{# fun Fl_Widget_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
widgetSetImage :: Widget a  -> Image b ->  IO (())
widgetSetImage widget pix = withObject widget $ \widgetPtr -> withObject pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `(Image ())' unsafeToObject #}
widgetDeimage :: Widget a  ->  IO (Image ())
widgetDeimage widget = withObject widget $ \widgetPtr -> deimage' widgetPtr
{# fun Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
widgetSetDeimage :: Widget a  -> Image b ->  IO (())
widgetSetDeimage widget pix = withObject widget $ \widgetPtr -> withObject pix $ \pixPtr -> setDeimage' widgetPtr pixPtr
{# fun Fl_Widget_tooltip as tooltip' { id `Ptr ()' } -> `String' #}
widgetTooltip :: Widget a  ->  IO (String)
widgetTooltip widget = withObject widget $ \widgetPtr -> tooltip' widgetPtr
{# fun Fl_Widget_copy_tooltip as copyTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
widgetCopyTooltip :: Widget a  -> String ->  IO (())
widgetCopyTooltip widget text = withObject widget $ \widgetPtr -> copyTooltip' widgetPtr text
{# fun Fl_Widget_set_tooltip as setTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
widgetSetTooltip :: Widget a  -> String ->  IO (())
widgetSetTooltip widget text = withObject widget $ \widgetPtr -> setTooltip' widgetPtr text
{# fun Fl_Widget_when as when' { id `Ptr ()' } -> `When' cToEnum #}
widgetWhen :: Widget a  ->  IO (When)
widgetWhen widget = withObject widget $ \widgetPtr -> when' widgetPtr
{# fun Fl_Widget_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
widgetSetWhen :: Widget a  -> Word8 ->  IO (())
widgetSetWhen widget i = withObject widget $ \widgetPtr -> setWhen' widgetPtr i
{# fun Fl_Widget_visible as visible' { id `Ptr ()' } -> `Int' #}
widgetVisible :: Widget a  ->  IO (Int)
widgetVisible widget = withObject widget $ \widgetPtr -> visible' widgetPtr
{# fun Fl_Widget_visible_r as visibleR' { id `Ptr ()' } -> `Int' #}
widgetVisibleR :: Widget a  ->  IO (Int)
widgetVisibleR widget = withObject widget $ \widgetPtr -> visibleR' widgetPtr
{# fun Fl_Widget_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetShowSuper :: Widget a  ->  IO (())
widgetShowSuper widget = withObject widget $ \widgetPtr -> showSuper' widgetPtr
{# fun Fl_Widget_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetShow :: Widget a  ->  IO (())
widgetShow widget = withObject widget $ \widgetPtr -> show' widgetPtr
{# fun Fl_Widget_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetHideSuper :: Widget a  ->  IO (())
widgetHideSuper widget = withObject widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun Fl_Widget_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetHide :: Widget a  ->  IO (())
widgetHide widget = withObject widget $ \widgetPtr -> hide' widgetPtr
{# fun Fl_Widget_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetSetVisible :: Widget a  ->  IO (())
widgetSetVisible widget = withObject widget $ \widgetPtr -> setVisible' widgetPtr
{# fun Fl_Widget_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetClearVisible :: Widget a  ->  IO (())
widgetClearVisible widget = withObject widget $ \widgetPtr -> clearVisible' widgetPtr
{# fun Fl_Widget_active as active' { id `Ptr ()' } -> `Int' #}
widgetActive :: Widget a  ->  IO (Int)
widgetActive widget = withObject widget $ \widgetPtr -> active' widgetPtr
{# fun Fl_Widget_active_r as activeR' { id `Ptr ()' } -> `Int' #}
widgetActiveR :: Widget a  ->  IO (Int)
widgetActiveR widget = withObject widget $ \widgetPtr -> activeR' widgetPtr
{# fun Fl_Widget_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetActivate :: Widget a  ->  IO (())
widgetActivate widget = withObject widget $ \widgetPtr -> activate' widgetPtr
{# fun Fl_Widget_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetDeactivate :: Widget a  ->  IO (())
widgetDeactivate widget = withObject widget $ \widgetPtr -> deactivate' widgetPtr
{# fun Fl_Widget_output as output' { id `Ptr ()' } -> `Int' #}
widgetOutput :: Widget a  ->  IO (Int)
widgetOutput widget = withObject widget $ \widgetPtr -> output' widgetPtr
{# fun Fl_Widget_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetSetOutput :: Widget a  ->  IO (())
widgetSetOutput widget = withObject widget $ \widgetPtr -> setOutput' widgetPtr
{# fun Fl_Widget_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetClearOutput :: Widget a  ->  IO (())
widgetClearOutput widget = withObject widget $ \widgetPtr -> clearOutput' widgetPtr
{# fun Fl_Widget_takesevents as takesevents' { id `Ptr ()' } -> `Int' #}
widgetTakesevents :: Widget a  ->  IO (Int)
widgetTakesevents widget = withObject widget $ \widgetPtr -> takesevents' widgetPtr
{# fun Fl_Widget_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetSetChanged :: Widget a  ->  IO (())
widgetSetChanged widget = withObject widget $ \widgetPtr -> setChanged' widgetPtr
{# fun Fl_Widget_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetClearChanged :: Widget a  ->  IO (())
widgetClearChanged widget = withObject widget $ \widgetPtr -> clearChanged' widgetPtr
{# fun Fl_Widget_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
widgetTakeFocus :: Widget a  ->  IO (Int)
widgetTakeFocus widget = withObject widget $ \widgetPtr -> takeFocus' widgetPtr
{# fun Fl_Widget_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetSetVisibleFocus :: Widget a  ->  IO (())
widgetSetVisibleFocus widget = withObject widget $ \widgetPtr -> setVisibleFocus' widgetPtr
{# fun Fl_Widget_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetClearVisibleFocus :: Widget a  ->  IO (())
widgetClearVisibleFocus widget = withObject widget $ \widgetPtr -> clearVisibleFocus' widgetPtr
{# fun Fl_Widget_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
widgetModifyVisibleFocus :: Widget a  -> Int ->  IO (())
widgetModifyVisibleFocus widget v = withObject widget $ \widgetPtr -> modifyVisibleFocus' widgetPtr v
{# fun Fl_Widget_visible_focus as visibleFocus' { id `Ptr ()' } -> `Int' #}
widgetVisibleFocus :: Widget a  ->  IO (Int)
widgetVisibleFocus widget = withObject widget $ \widgetPtr -> visibleFocus' widgetPtr
{# fun Fl_Widget_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
widgetContains :: Widget a  -> Widget a  ->  IO (Int)
widgetContains widget otherWidget = withObject widget $ \widgetPtr -> withObject otherWidget $ \otherWidgetPtr -> contains' widgetPtr otherWidgetPtr
{# fun Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
widgetInside :: Widget a  -> Widget a  ->  IO (Int)
widgetInside widget otherWidget = withObject widget $ \widgetPtr -> withObject otherWidget $ \otherWidgetPtr -> inside' widgetPtr otherWidgetPtr
{# fun Fl_Widget_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetRedraw :: Widget a  ->  IO (())
widgetRedraw widget = withObject widget $ \widgetPtr -> redraw' widgetPtr
{# fun Fl_Widget_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetRedrawLabel :: Widget a  ->  IO (())
widgetRedrawLabel widget = withObject widget $ \widgetPtr -> redrawLabel' widgetPtr
{# fun Fl_Widget_damage as damage' { id `Ptr ()' } -> `Word8' #}
widgetDamage :: Widget a  ->  IO (Word8)
widgetDamage widget = withObject widget $ \widgetPtr -> damage' widgetPtr
{# fun Fl_Widget_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
widgetClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
widgetClearDamageWithBitmask widget c = withObject widget $ \widgetPtr -> clearDamageWithBitmask' widgetPtr c
{# fun Fl_Widget_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
widgetClearDamage :: Widget a  ->  IO (())
widgetClearDamage widget = withObject widget $ \widgetPtr -> clearDamage' widgetPtr
{# fun Fl_Widget_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
widgetDamageWithText :: Widget a  -> Word8 ->  IO (())
widgetDamageWithText widget c = withObject widget $ \widgetPtr -> damageWithText' widgetPtr c
{# fun Fl_Widget_damage_inside_widget as damageInsideWidget' { id `Ptr ()',`Word8',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
widgetDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
widgetDamageInsideWidget widget c rectangle = withObject widget $ \widgetPtr -> do
                                        let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                        damageInsideWidget' widgetPtr c x_pos y_pos w_pos h_pos
{# fun Fl_Widget_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
widgetMeasureLabel :: Widget a  -> IO (Size)
widgetMeasureLabel widget = withObject widget $ \widgetPtr -> measureLabel' widgetPtr >>= \(width, height) -> return $ Size (Width width) (Height height)
{# fun Fl_Widget_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
widgetWindow :: Widget a  ->  IO (Window ())
widgetWindow widget = withObject widget $ \widgetPtr -> window' widgetPtr >>= toObject
{# fun Fl_Widget_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
widgetTopWindow :: Widget a  ->  IO (Window ())
widgetTopWindow widget = withObject widget $ \widgetPtr -> (topWindow' widgetPtr) >>= toObject
{# fun Fl_Widget_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
widgetTopWindowOffset :: Widget a -> IO (Position)
widgetTopWindowOffset widget = withObject widget $ \widgetPtr -> topWindowOffset' widgetPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun Fl_Widget_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Ptr ()' id #}
widgetAsGroupSuper :: Widget a  ->  IO (Group ())
widgetAsGroupSuper widget = withObject widget $ \widgetPtr -> asGroupSuper' widgetPtr >>= toObject
{# fun Fl_Widget_as_group as asGroup' { id `Ptr ()' } -> `Ptr ()' id #}
widgetAsGroup :: Widget a  ->  IO (Group ())
widgetAsGroup widget = withObject widget $ \widgetPtr -> asGroup' widgetPtr >>= toObject
{# fun Fl_Widget_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
widgetAsGlWindowSuper :: Widget a  ->  IO (GlWindow ())
widgetAsGlWindowSuper widget = withObject widget $ \widgetPtr -> asGlWindowSuper' widgetPtr
{# fun Fl_Widget_as_gl_window as asGlWindow' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
widgetAsGlWindow :: Widget a  ->  IO (GlWindow ())
widgetAsGlWindow widget = withObject widget $ \widgetPtr -> asGlWindow' widgetPtr
{# fun Fl_Widget_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
widgetResizeSuper :: Widget a  -> Rectangle ->  IO (())
widgetResizeSuper widget rectangle = withObject widget $ \widgetPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resizeSuper' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
widgetResize :: Widget a  -> Rectangle -> IO (())
widgetResize widget rectangle = withObject widget $ \widgetPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' widgetPtr x_pos y_pos w_pos h_pos
{# fun Fl_Widget_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}
widgetSetCallback :: Widget a -> (WidgetCallback b) -> IO (())
widgetSetCallback widget callback = withObject widget $ \widgetPtr -> do
                                ptr <- toWidgetCallbackPrim callback
                                setCallback' widgetPtr (castFunPtr ptr)
