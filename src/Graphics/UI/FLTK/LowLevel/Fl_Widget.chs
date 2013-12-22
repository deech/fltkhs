{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Widget
    (
     WidgetFuncs(..),
     defaultWidgetFuncs,
     -- * Constructor
     widgetNew,
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
     widgetItemLabelfont,
     widgetSetItemLabelfont,
     widgetItemLabelsize,
     widgetSetItemLabelsize,
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

data WidgetFuncs =
    WidgetFuncs
    {
     widgetDrawOverride       :: Maybe Callback
    ,widgetHandleOverride     :: Maybe EventHandlerF
    ,widgetResizeOverride     :: Maybe RectangleF
    ,widgetShowOverride       :: Maybe Callback
    ,widgetHideOverride       :: Maybe Callback
    ,widgetAsWindowOverride   :: Maybe GetWindowF
    ,widgetAsGlWindowOverride :: Maybe GetGlWindowF
    ,widgetAsGroupOverride    :: Maybe GetGroupF
    }

widgetFunctionStruct :: WidgetFuncs -> IO (Ptr ())
widgetFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Widget_Virtual_Funcs #}
      toCallbackPrim `orNullPtr` (widgetDrawOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullPtr` (widgetHandleOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullPtr` (widgetResizeOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullPtr` (widgetShowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->show#} p
      toCallbackPrim `orNullPtr` (widgetHideOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullPtr` (widgetAsWindowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullPtr` (widgetAsGlWindowOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_gl_window#} p
      toGetGroupFPrim `orNullPtr` (widgetAsGroupOverride funcs) >>=
                             {#set fl_Widget_Virtual_Funcs->as_group#} p
      return p
defaultWidgetFuncs :: WidgetFuncs
defaultWidgetFuncs = WidgetFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing Nothing

{# fun unsafe Fl_Widget_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun unsafe Fl_Widget_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun unsafe Fl_OverriddenWidget_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun unsafe Fl_OverriddenWidget_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
widgetNew :: Rectangle -> Maybe String -> Maybe WidgetFuncs -> IO (Widget ())
widgetNew rectangle l' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
        objectOrError = \p -> maybe (error "windowNewWithLabel : object construction returned a null pointer")
                              return
                              (toObject $ castPtr p)
    in case (l', funcs') of
        (Nothing,Nothing) -> widgetNew' x_pos y_pos width height >>=
                             objectOrError
        ((Just l), Nothing) -> widgetNewWithLabel' x_pos y_pos width height l >>=
                               objectOrError
        ((Just l), (Just fs)) -> do
                               ptr <- widgetFunctionStruct fs
                               overriddenWidgetNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             objectOrError
        (Nothing, (Just fs)) -> do
                               ptr <- widgetFunctionStruct fs
                               overriddenWidgetNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    objectOrError

{#fun unsafe Fl_Widget_handle as widgetHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
widgetHandle :: Widget a -> Event -> IO Int
widgetHandle widget event = withObject widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event))

{#fun unsafe Fl_Widget_parent as widgetParent'
      { id `Ptr ()'} -> `Ptr ()' id #}
widgetParent :: Widget a -> IO (Maybe (Group ()))
widgetParent widget = withObject widget widgetParent' >>= return . toObject

{#fun unsafe Fl_Widget_set_parent as widgetSetParent'
      { id `Ptr ()', id `Ptr ()' } -> `()' #}
widgetSetParent :: Widget a -> Group b -> IO ()
widgetSetParent widget group =
    withObject widget
                   (\widgetPtr ->
                        withObject group (\groupPtr ->
                                              widgetSetParent' widgetPtr groupPtr
                                         )
                   )
{# fun unsafe Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
widgetType_ :: Widget a  ->  IO (Word8)
widgetType_ widget = withObject widget $ \widgetPtr -> type' widgetPtr
{# fun unsafe Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
widgetSetType :: Widget a  -> Word8 ->  IO (())
widgetSetType widget t = withObject widget $ \widgetPtr -> setType' widgetPtr t
{# fun unsafe Fl_Widget_draw_label as drawLabel' { id `Ptr ()' } -> `()' #}
{# fun unsafe Fl_Widget_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int',cFromEnum `AlignType' } -> `()' #}
widgetDrawLabel :: Widget a  -> Maybe (Rectangle,AlignType)->  IO (())
widgetDrawLabel widget Nothing = withObject widget $ \widgetPtr -> drawLabel' widgetPtr
widgetDrawLabel widget (Just (rectangle,align_)) = withObject widget $ \widgetPtr -> do
                                        let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                        drawLabelWithXywhAlignment' widgetPtr x_pos y_pos w_pos h_pos align_
{# fun unsafe Fl_Widget_x as x' { id `Ptr ()' } -> `Int' #}
widgetX :: Widget a  ->  IO (Int)
widgetX widget = withObject widget $ \widgetPtr -> x' widgetPtr
{# fun unsafe Fl_Widget_y as y' { id `Ptr ()' } -> `Int' #}
widgetY :: Widget a  ->  IO (Int)
widgetY widget = withObject widget $ \widgetPtr -> y' widgetPtr
{# fun unsafe Fl_Widget_w as w' { id `Ptr ()' } -> `Int' #}
widgetW :: Widget a  ->  IO (Int)
widgetW widget = withObject widget $ \widgetPtr -> w' widgetPtr
{# fun unsafe Fl_Widget_h as h' { id `Ptr ()' } -> `Int' #}
widgetH :: Widget a  ->  IO (Int)
widgetH widget = withObject widget $ \widgetPtr -> h' widgetPtr
{# fun unsafe Fl_Widget_set_align as setAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' #}
widgetSetAlign :: Widget a  -> AlignType ->  IO (())
widgetSetAlign widget _align = withObject widget $ \widgetPtr -> setAlign' widgetPtr _align
{# fun unsafe Fl_Widget_align as align' { id `Ptr ()' } -> `AlignType' cToEnum #}
widgetAlign :: Widget a  ->  IO (AlignType)
widgetAlign widget = withObject widget $ \widgetPtr -> align' widgetPtr
{# fun unsafe Fl_Widget_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
widgetBox :: Widget a  ->  IO (Boxtype)
widgetBox widget = withObject widget $ \widgetPtr -> box' widgetPtr
{# fun unsafe Fl_Widget_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
widgetSetBox :: Widget a  -> Boxtype ->  IO (())
widgetSetBox widget new_box = withObject widget $ \widgetPtr -> setBox' widgetPtr new_box
{# fun unsafe Fl_Widget_color as color' { id `Ptr ()' } -> `Color' cToColor #}
widgetColor :: Widget a  ->  IO (Color)
widgetColor widget = withObject widget $ \widgetPtr -> color' widgetPtr
{# fun unsafe Fl_Widget_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
widgetSetColor :: Widget a  -> Color ->  IO (())
widgetSetColor widget bg = withObject widget $ \widgetPtr -> setColor' widgetPtr bg
{# fun unsafe Fl_Widget_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' #}
widgetSetColorWithBgSel :: Widget a  -> Color -> Color ->  IO (())
widgetSetColorWithBgSel widget bg a = withObject widget $ \widgetPtr -> setColorWithBgSel' widgetPtr bg a
{# fun unsafe Fl_Widget_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
widgetSelectionColor :: Widget a  ->  IO (Color)
widgetSelectionColor widget = withObject widget $ \widgetPtr -> selectionColor' widgetPtr
{# fun unsafe Fl_Widget_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
widgetSetSelectionColor :: Widget a  -> Color ->  IO (())
widgetSetSelectionColor widget a = withObject widget $ \widgetPtr -> setSelectionColor' widgetPtr a
{# fun unsafe Fl_Widget_label as label' { id `Ptr ()' } -> `String' #}
widgetLabel :: Widget a  ->  IO (String)
widgetLabel widget = withObject widget $ \widgetPtr -> label' widgetPtr
{# fun unsafe Fl_Widget_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' #}
widgetCopyLabel :: Widget a  -> String ->  IO (())
widgetCopyLabel widget new_label = withObject widget $ \widgetPtr -> copyLabel' widgetPtr new_label
{# fun unsafe Fl_Widget_set_label as setLabel' { id `Ptr ()',`String' } -> `()' #}
widgetSetLabel :: Widget a  -> String ->  IO (())
widgetSetLabel widget text = withObject widget $ \widgetPtr -> setLabel' widgetPtr text
{# fun unsafe Fl_Widget_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
widgetLabeltype :: Widget a  ->  IO (Labeltype)
widgetLabeltype widget = withObject widget $ \widgetPtr -> labeltype' widgetPtr
{# fun unsafe Fl_Widget_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' #}
widgetSetLabeltype :: Widget a  -> Labeltype ->  IO (())
widgetSetLabeltype widget a = withObject widget $ \widgetPtr -> setLabeltype' widgetPtr a
{# fun unsafe Fl_Widget_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
widgetLabelcolor :: Widget a  ->  IO (Color)
widgetLabelcolor widget = withObject widget $ \widgetPtr -> labelcolor' widgetPtr
{# fun unsafe Fl_Widget_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
widgetSetLabelcolor :: Widget a  -> Color ->  IO (())
widgetSetLabelcolor widget c = withObject widget $ \widgetPtr -> setLabelcolor' widgetPtr c
{# fun unsafe Fl_Widget_item_labelfont as itemLabelfont' { id `Ptr ()' } -> `Font' cToFont #}
widgetItemLabelfont :: Widget a  ->  IO (Font)
widgetItemLabelfont widget = withObject widget $ \widgetPtr -> itemLabelfont' widgetPtr
{# fun unsafe Fl_Widget_set_item_labelfont as setItemLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
widgetSetItemLabelfont :: Widget a  -> Font ->  IO (())
widgetSetItemLabelfont widget c = withObject widget $ \widgetPtr -> setItemLabelfont' widgetPtr c
{# fun unsafe Fl_Widget_item_labelsize as itemLabelsize' { id `Ptr ()' } -> `CInt' id #}
widgetItemLabelsize :: Widget a  ->  IO (FontSize)
widgetItemLabelsize widget = withObject widget $ \widgetPtr -> itemLabelsize' widgetPtr >>= return . FontSize
{# fun unsafe Fl_Widget_set_item_labelsize as setItemLabelsize' { id `Ptr ()',id `CInt' } -> `()' #}
widgetSetItemLabelsize :: Widget a  -> FontSize ->  IO (())
widgetSetItemLabelsize widget (FontSize pix) = withObject widget $ \widgetPtr -> setItemLabelsize' widgetPtr pix
{# fun unsafe Fl_Widget_image as image' { id `Ptr ()' } -> `Maybe (Image ())' toObject #}
widgetImage :: Widget a  ->  IO (Maybe (Image ()))
widgetImage widget = withObject widget $ \widgetPtr -> image' widgetPtr
{# fun unsafe Fl_Widget_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' #}
widgetSetImage :: Widget a  -> Image b ->  IO (())
widgetSetImage widget pix = withObject widget $ \widgetPtr -> withObject pix $ \pixPtr -> setImage' widgetPtr pixPtr
{# fun unsafe Fl_Widget_deimage as deimage' { id `Ptr ()' } -> `Maybe (Image ())' toObject #}
widgetDeimage :: Widget a  ->  IO (Maybe (Image ()))
widgetDeimage widget = withObject widget $ \widgetPtr -> deimage' widgetPtr
{# fun unsafe Fl_Widget_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' #}
widgetSetDeimage :: Widget a  -> Image b ->  IO (())
widgetSetDeimage widget pix = withObject widget $ \widgetPtr -> withObject pix $ \pixPtr -> setDeimage' widgetPtr pixPtr
{# fun unsafe Fl_Widget_tooltip as tooltip' { id `Ptr ()' } -> `String' #}
widgetTooltip :: Widget a  ->  IO (String)
widgetTooltip widget = withObject widget $ \widgetPtr -> tooltip' widgetPtr
{# fun unsafe Fl_Widget_copy_tooltip as copyTooltip' { id `Ptr ()',`String' } -> `()' #}
widgetCopyTooltip :: Widget a  -> String ->  IO (())
widgetCopyTooltip widget text = withObject widget $ \widgetPtr -> copyTooltip' widgetPtr text
{# fun unsafe Fl_Widget_set_tooltip as setTooltip' { id `Ptr ()',`String' } -> `()' #}
widgetSetTooltip :: Widget a  -> String ->  IO (())
widgetSetTooltip widget text = withObject widget $ \widgetPtr -> setTooltip' widgetPtr text
{# fun unsafe Fl_Widget_when as when' { id `Ptr ()' } -> `When' cToEnum #}
widgetWhen :: Widget a  ->  IO (When)
widgetWhen widget = withObject widget $ \widgetPtr -> when' widgetPtr
{# fun unsafe Fl_Widget_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' #}
widgetSetWhen :: Widget a  -> Word8 ->  IO (())
widgetSetWhen widget i = withObject widget $ \widgetPtr -> setWhen' widgetPtr i
{# fun unsafe Fl_Widget_visible as visible' { id `Ptr ()' } -> `Int' #}
widgetVisible :: Widget a  ->  IO (Int)
widgetVisible widget = withObject widget $ \widgetPtr -> visible' widgetPtr
{# fun unsafe Fl_Widget_visible_r as visibleR' { id `Ptr ()' } -> `Int' #}
widgetVisibleR :: Widget a  ->  IO (Int)
widgetVisibleR widget = withObject widget $ \widgetPtr -> visibleR' widgetPtr
{# fun unsafe Fl_Widget_show_super as showSuper' { id `Ptr ()' } -> `()' #}
widgetShowSuper :: Widget a  ->  IO (())
widgetShowSuper widget = withObject widget $ \widgetPtr -> showSuper' widgetPtr
{# fun unsafe Fl_Widget_show as show' { id `Ptr ()' } -> `()' #}
widgetShow :: Widget a  ->  IO (())
widgetShow widget = withObject widget $ \widgetPtr -> show' widgetPtr
{# fun unsafe Fl_Widget_hide_super as hideSuper' { id `Ptr ()' } -> `()' #}
widgetHideSuper :: Widget a  ->  IO (())
widgetHideSuper widget = withObject widget $ \widgetPtr -> hideSuper' widgetPtr
{# fun unsafe Fl_Widget_hide as hide' { id `Ptr ()' } -> `()' #}
widgetHide :: Widget a  ->  IO (())
widgetHide widget = withObject widget $ \widgetPtr -> hide' widgetPtr
{# fun unsafe Fl_Widget_set_visible as setVisible' { id `Ptr ()' } -> `()' #}
widgetSetVisible :: Widget a  ->  IO (())
widgetSetVisible widget = withObject widget $ \widgetPtr -> setVisible' widgetPtr
{# fun unsafe Fl_Widget_clear_visible as clearVisible' { id `Ptr ()' } -> `()' #}
widgetClearVisible :: Widget a  ->  IO (())
widgetClearVisible widget = withObject widget $ \widgetPtr -> clearVisible' widgetPtr
{# fun unsafe Fl_Widget_active as active' { id `Ptr ()' } -> `Int' #}
widgetActive :: Widget a  ->  IO (Int)
widgetActive widget = withObject widget $ \widgetPtr -> active' widgetPtr
{# fun unsafe Fl_Widget_active_r as activeR' { id `Ptr ()' } -> `Int' #}
widgetActiveR :: Widget a  ->  IO (Int)
widgetActiveR widget = withObject widget $ \widgetPtr -> activeR' widgetPtr
{# fun unsafe Fl_Widget_activate as activate' { id `Ptr ()' } -> `()' #}
widgetActivate :: Widget a  ->  IO (())
widgetActivate widget = withObject widget $ \widgetPtr -> activate' widgetPtr
{# fun unsafe Fl_Widget_deactivate as deactivate' { id `Ptr ()' } -> `()' #}
widgetDeactivate :: Widget a  ->  IO (())
widgetDeactivate widget = withObject widget $ \widgetPtr -> deactivate' widgetPtr
{# fun unsafe Fl_Widget_output as output' { id `Ptr ()' } -> `Int' #}
widgetOutput :: Widget a  ->  IO (Int)
widgetOutput widget = withObject widget $ \widgetPtr -> output' widgetPtr
{# fun unsafe Fl_Widget_set_output as setOutput' { id `Ptr ()' } -> `()' #}
widgetSetOutput :: Widget a  ->  IO (())
widgetSetOutput widget = withObject widget $ \widgetPtr -> setOutput' widgetPtr
{# fun unsafe Fl_Widget_clear_output as clearOutput' { id `Ptr ()' } -> `()' #}
widgetClearOutput :: Widget a  ->  IO (())
widgetClearOutput widget = withObject widget $ \widgetPtr -> clearOutput' widgetPtr
{# fun unsafe Fl_Widget_takesevents as takesevents' { id `Ptr ()' } -> `Int' #}
widgetTakesevents :: Widget a  ->  IO (Int)
widgetTakesevents widget = withObject widget $ \widgetPtr -> takesevents' widgetPtr
{# fun unsafe Fl_Widget_set_changed as setChanged' { id `Ptr ()' } -> `()' #}
widgetSetChanged :: Widget a  ->  IO (())
widgetSetChanged widget = withObject widget $ \widgetPtr -> setChanged' widgetPtr
{# fun unsafe Fl_Widget_clear_changed as clearChanged' { id `Ptr ()' } -> `()' #}
widgetClearChanged :: Widget a  ->  IO (())
widgetClearChanged widget = withObject widget $ \widgetPtr -> clearChanged' widgetPtr
{# fun unsafe Fl_Widget_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
widgetTakeFocus :: Widget a  ->  IO (Int)
widgetTakeFocus widget = withObject widget $ \widgetPtr -> takeFocus' widgetPtr
{# fun unsafe Fl_Widget_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' #}
widgetSetVisibleFocus :: Widget a  ->  IO (())
widgetSetVisibleFocus widget = withObject widget $ \widgetPtr -> setVisibleFocus' widgetPtr
{# fun unsafe Fl_Widget_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' #}
widgetClearVisibleFocus :: Widget a  ->  IO (())
widgetClearVisibleFocus widget = withObject widget $ \widgetPtr -> clearVisibleFocus' widgetPtr
{# fun unsafe Fl_Widget_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' #}
widgetModifyVisibleFocus :: Widget a  -> Int ->  IO (())
widgetModifyVisibleFocus widget v = withObject widget $ \widgetPtr -> modifyVisibleFocus' widgetPtr v
{# fun unsafe Fl_Widget_visible_focus as visibleFocus' { id `Ptr ()' } -> `Int' #}
widgetVisibleFocus :: Widget a  ->  IO (Int)
widgetVisibleFocus widget = withObject widget $ \widgetPtr -> visibleFocus' widgetPtr
{# fun unsafe Fl_Widget_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
widgetContains :: Widget a  -> Widget a  ->  IO (Int)
widgetContains widget otherWidget = withObject widget $ \widgetPtr -> withObject otherWidget $ \otherWidgetPtr -> contains' widgetPtr otherWidgetPtr
{# fun unsafe Fl_Widget_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
widgetInside :: Widget a  -> Widget a  ->  IO (Int)
widgetInside widget otherWidget = withObject widget $ \widgetPtr -> withObject otherWidget $ \otherWidgetPtr -> inside' widgetPtr otherWidgetPtr
{# fun unsafe Fl_Widget_redraw as redraw' { id `Ptr ()' } -> `()' #}
widgetRedraw :: Widget a  ->  IO (())
widgetRedraw widget = withObject widget $ \widgetPtr -> redraw' widgetPtr
{# fun unsafe Fl_Widget_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' #}
widgetRedrawLabel :: Widget a  ->  IO (())
widgetRedrawLabel widget = withObject widget $ \widgetPtr -> redrawLabel' widgetPtr
{# fun unsafe Fl_Widget_damage as damage' { id `Ptr ()' } -> `Word8' #}
widgetDamage :: Widget a  ->  IO (Word8)
widgetDamage widget = withObject widget $ \widgetPtr -> damage' widgetPtr
{# fun unsafe Fl_Widget_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' #}
widgetClearDamageWithBitmask :: Widget a  -> Word8 ->  IO (())
widgetClearDamageWithBitmask widget c = withObject widget $ \widgetPtr -> clearDamageWithBitmask' widgetPtr c
{# fun unsafe Fl_Widget_clear_damage as clearDamage' { id `Ptr ()' } -> `()' #}
widgetClearDamage :: Widget a  ->  IO (())
widgetClearDamage widget = withObject widget $ \widgetPtr -> clearDamage' widgetPtr
{# fun unsafe Fl_Widget_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' #}
widgetDamageWithText :: Widget a  -> Word8 ->  IO (())
widgetDamageWithText widget c = withObject widget $ \widgetPtr -> damageWithText' widgetPtr c
{# fun unsafe Fl_Widget_damage_inside_widget as damageInsideWidget' { id `Ptr ()',`Word8',`Int',`Int',`Int',`Int' } -> `()' #}
widgetDamageInsideWidget :: Widget a  -> Word8 -> Rectangle ->  IO (())
widgetDamageInsideWidget widget c rectangle = withObject widget $ \widgetPtr -> do
                                        let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                        damageInsideWidget' widgetPtr c x_pos y_pos w_pos h_pos
{# fun unsafe Fl_Widget_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
widgetMeasureLabel :: Widget a  -> IO (RectangleSize)
widgetMeasureLabel widget = withObject widget $ \widgetPtr -> measureLabel' widgetPtr >>= \(width, height) -> return $ RectangleSize (Width width) (Height height)
{# fun unsafe Fl_Widget_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
widgetWindow :: Widget a  ->  IO (Maybe (Window ()))
widgetWindow widget = withObject widget $ \widgetPtr -> window' widgetPtr >>= return . toObject
{# fun unsafe Fl_Widget_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
widgetTopWindow :: Widget a  ->  IO (Maybe (Window ()))
widgetTopWindow widget = withObject widget $ \widgetPtr -> (topWindow' widgetPtr) >>= return . toObject
{# fun unsafe Fl_Widget_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
widgetTopWindowOffset :: Widget a -> IO (Position)
widgetTopWindowOffset widget = withObject widget $ \widgetPtr -> topWindowOffset' widgetPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun unsafe Fl_Widget_as_group_super as asGroupSuper' { id `Ptr ()' } -> `Ptr ()' id #}
widgetAsGroupSuper :: Widget a  ->  IO (Maybe (Group ()))
widgetAsGroupSuper widget = withObject widget $ \widgetPtr -> asGroupSuper' widgetPtr >>= return . toObject
{# fun unsafe Fl_Widget_as_group as asGroup' { id `Ptr ()' } -> `Ptr ()' id #}
widgetAsGroup :: Widget a  ->  IO (Maybe (Group ()))
widgetAsGroup widget = withObject widget $ \widgetPtr -> asGroup' widgetPtr >>= return . toObject
{# fun unsafe Fl_Widget_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
widgetAsGlWindowSuper :: Widget a  ->  IO (Maybe (GlWindow ()))
widgetAsGlWindowSuper widget = withObject widget $ \widgetPtr -> asGlWindowSuper' widgetPtr
{# fun unsafe Fl_Widget_as_gl_window as asGlWindow' { id `Ptr ()' } -> `Maybe (GlWindow ())' toObject #}
widgetAsGlWindow :: Widget a  ->  IO (Maybe (GlWindow ()))
widgetAsGlWindow widget = withObject widget $ \widgetPtr -> asGlWindow' widgetPtr
{# fun unsafe Fl_Widget_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
widgetResizeSuper :: Widget a  -> Rectangle ->  IO (())
widgetResizeSuper widget rectangle = withObject widget $ \widgetPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resizeSuper' widgetPtr x_pos y_pos w_pos h_pos
{# fun unsafe Fl_Widget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
widgetResize :: Widget a  -> Rectangle -> IO (())
widgetResize widget rectangle = withObject widget $ \widgetPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' widgetPtr x_pos y_pos w_pos h_pos
{# fun unsafe Fl_Widget_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' #}
widgetSetCallback :: Widget a -> Callback -> IO (())
widgetSetCallback widget callback = withObject widget $ \widgetPtr -> do
                                ptr <- toWidgetCallbackPrim callback
                                setCallback' widgetPtr (castFunPtr ptr)
