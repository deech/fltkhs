{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Slider
    (
     -- * Constructor
     sliderNew,
     sliderDestroy,
     -- * Fl_Slider specific
     sliderHandle,
     sliderParent,
     sliderSetParent,
     sliderType_,
     sliderSetType,
     sliderX,
     sliderY,
     sliderW,
     sliderH,
     sliderSetAlign,
     sliderAlign,
     sliderBox,
     sliderSetBox,
     sliderColor,
     sliderSetColor,
     sliderSetColorWithBgSel,
     sliderSelectionColor,
     sliderSetSelectionColor,
     sliderLabel,
     sliderCopyLabel,
     sliderSetLabel,
     sliderLabeltype,
     sliderSetLabeltype,
     sliderLabelcolor,
     sliderSetLabelcolor,
     sliderLabelfont,
     sliderSetLabelfont,
     sliderLabelsize,
     sliderSetLabelsize,
     sliderImage,
     sliderSetImage,
     sliderDeimage,
     sliderSetDeimage,
     sliderTooltip,
     sliderCopyTooltip,
     sliderSetTooltip,
     sliderWhen,
     sliderSetWhen,
     sliderVisible,
     sliderVisibleR,
     sliderShowSuper,
     sliderShow,
     sliderHideSuper,
     sliderHide,
     sliderSetVisible,
     sliderClearVisible,
     sliderActive,
     sliderActiveR,
     sliderActivate,
     sliderDeactivate,
     sliderOutput,
     sliderSetOutput,
     sliderClearOutput,
     sliderTakesevents,
     sliderSetChanged,
     sliderClearChanged,
     sliderTakeFocus,
     sliderSetVisibleFocus,
     sliderClearVisibleFocus,
     sliderModifyVisibleFocus,
     sliderVisibleFocus,
     sliderContains,
     sliderInside,
     sliderRedraw,
     sliderRedrawLabel,
     sliderDamage,
     sliderClearDamageWithBitmask,
     sliderClearDamage,
     sliderDamageWithText,
     sliderMeasureLabel,
     sliderWindow,
     sliderTopWindow,
     sliderTopWindowOffset,
     sliderAsGlWindowSuper,
     sliderAsGlWindow,
     sliderResizeSuper,
     sliderResize,
     sliderSetCallback,
     sliderBounds,
     sliderMinimum,
     sliderSetMinimum,
     sliderMaximum,
     sliderSetMaximum,
     sliderRange,
     sliderSetStep,
     sliderSetStepWithAB,
     sliderStepWithS,
     sliderStep,
     sliderPrecision,
     sliderValue,
     sliderSetValue,
     sliderFormat,
     sliderRound,
     sliderClamp,
     sliderIncrement,
     sliderScrollvalue,
     sliderSetSliderSize,
     sliderSliderSize,
     sliderSlider,
     sliderSetSlider,
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Slider_New as sliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Slider_New_WithLabel as sliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
sliderNew :: Rectangle -> Maybe String -> IO (Slider ())
sliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> sliderNew' x_pos y_pos width height >>=
                             toObject
        Just l -> sliderNewWithLabel' x_pos y_pos width height l >>=
                             toObject

{# fun Fl_Slider_Destroy as sliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderDestroy :: Slider a -> IO ()
sliderDestroy win = swapObject win $ \winPtr -> do
                                        sliderDestroy' winPtr
                                        return nullPtr

{#fun Fl_Slider_handle as sliderHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
sliderHandle :: Slider a -> Event -> IO Int
sliderHandle slider event = withObject slider (\p -> sliderHandle' p (fromIntegral . fromEnum $ event))

{#fun Fl_Slider_parent as sliderParent'
      { id `Ptr ()'} -> `Ptr ()' id #}
sliderParent :: Slider a -> IO (Group ())
sliderParent slider = withObject slider sliderParent' >>= toObject

{#fun Fl_Slider_set_parent as sliderSetParent'
      { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderSetParent :: Slider a -> Group b -> IO ()
sliderSetParent slider group =
    withObject slider
                   (\sliderPtr ->
                        withObject group (\groupPtr ->
                                              sliderSetParent' sliderPtr groupPtr
                                         )
                   )
{# fun Fl_Slider_type as type' { id `Ptr ()' } -> `Word8' #}
sliderType_ :: Slider a  ->  IO (Word8)
sliderType_ slider = withObject slider $ \sliderPtr -> type' sliderPtr
{# fun Fl_Slider_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
sliderSetType :: Slider a  -> Word8 ->  IO (())
sliderSetType slider t = withObject slider $ \sliderPtr -> setType' sliderPtr t
{# fun Fl_Slider_x as x' { id `Ptr ()' } -> `Int' #}
sliderX :: Slider a  ->  IO (Int)
sliderX slider = withObject slider $ \sliderPtr -> x' sliderPtr
{# fun Fl_Slider_y as y' { id `Ptr ()' } -> `Int' #}
sliderY :: Slider a  ->  IO (Int)
sliderY slider = withObject slider $ \sliderPtr -> y' sliderPtr
{# fun Fl_Slider_w as w' { id `Ptr ()' } -> `Int' #}
sliderW :: Slider a  ->  IO (Int)
sliderW slider = withObject slider $ \sliderPtr -> w' sliderPtr
{# fun Fl_Slider_h as h' { id `Ptr ()' } -> `Int' #}
sliderH :: Slider a  ->  IO (Int)
sliderH slider = withObject slider $ \sliderPtr -> h' sliderPtr
{# fun Fl_Slider_set_align as setAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
sliderSetAlign :: Slider a  -> AlignType ->  IO (())
sliderSetAlign slider _align = withObject slider $ \sliderPtr -> setAlign' sliderPtr _align
{# fun Fl_Slider_align as align' { id `Ptr ()' } -> `AlignType' cToEnum #}
sliderAlign :: Slider a  ->  IO (AlignType)
sliderAlign slider = withObject slider $ \sliderPtr -> align' sliderPtr
{# fun Fl_Slider_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
sliderBox :: Slider a  ->  IO (Boxtype)
sliderBox slider = withObject slider $ \sliderPtr -> box' sliderPtr
{# fun Fl_Slider_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
sliderSetBox :: Slider a  -> Boxtype ->  IO (())
sliderSetBox slider new_box = withObject slider $ \sliderPtr -> setBox' sliderPtr new_box
{# fun Fl_Slider_color as color' { id `Ptr ()' } -> `Color' cToColor #}
sliderColor :: Slider a  ->  IO (Color)
sliderColor slider = withObject slider $ \sliderPtr -> color' sliderPtr
{# fun Fl_Slider_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
sliderSetColor :: Slider a  -> Color ->  IO (())
sliderSetColor slider bg = withObject slider $ \sliderPtr -> setColor' sliderPtr bg
{# fun Fl_Slider_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
sliderSetColorWithBgSel :: Slider a  -> Color -> Color ->  IO (())
sliderSetColorWithBgSel slider bg a = withObject slider $ \sliderPtr -> setColorWithBgSel' sliderPtr bg a
{# fun Fl_Slider_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
sliderSelectionColor :: Slider a  ->  IO (Color)
sliderSelectionColor slider = withObject slider $ \sliderPtr -> selectionColor' sliderPtr
{# fun Fl_Slider_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
sliderSetSelectionColor :: Slider a  -> Color ->  IO (())
sliderSetSelectionColor slider a = withObject slider $ \sliderPtr -> setSelectionColor' sliderPtr a
{# fun Fl_Slider_label as label' { id `Ptr ()' } -> `String' #}
sliderLabel :: Slider a  ->  IO (String)
sliderLabel slider = withObject slider $ \sliderPtr -> label' sliderPtr
{# fun Fl_Slider_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
sliderCopyLabel :: Slider a  -> String ->  IO (())
sliderCopyLabel slider new_label = withObject slider $ \sliderPtr -> copyLabel' sliderPtr new_label
{# fun Fl_Slider_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
sliderSetLabel :: Slider a  -> String ->  IO (())
sliderSetLabel slider text = withObject slider $ \sliderPtr -> setLabel' sliderPtr text
{# fun Fl_Slider_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
sliderLabeltype :: Slider a  ->  IO (Labeltype)
sliderLabeltype slider = withObject slider $ \sliderPtr -> labeltype' sliderPtr
{# fun Fl_Slider_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
sliderSetLabeltype :: Slider a  -> Labeltype ->  IO (())
sliderSetLabeltype slider a = withObject slider $ \sliderPtr -> setLabeltype' sliderPtr a
{# fun Fl_Slider_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
sliderLabelcolor :: Slider a  ->  IO (Color)
sliderLabelcolor slider = withObject slider $ \sliderPtr -> labelcolor' sliderPtr
{# fun Fl_Slider_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
sliderSetLabelcolor :: Slider a  -> Color ->  IO (())
sliderSetLabelcolor slider c = withObject slider $ \sliderPtr -> setLabelcolor' sliderPtr c
{# fun Fl_Slider_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
sliderLabelfont :: Slider a  ->  IO (Font)
sliderLabelfont slider = withObject slider $ \sliderPtr -> labelfont' sliderPtr
{# fun Fl_Slider_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
sliderSetLabelfont :: Slider a  -> Font ->  IO (())
sliderSetLabelfont slider c = withObject slider $ \sliderPtr -> setLabelfont' sliderPtr c
{# fun Fl_Slider_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
sliderLabelsize :: Slider a  ->  IO (FontSize)
sliderLabelsize slider = withObject slider $ \sliderPtr -> labelsize' sliderPtr >>= return . FontSize
{# fun Fl_Slider_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
sliderSetLabelsize :: Slider a  -> FontSize ->  IO (())
sliderSetLabelsize slider (FontSize pix) = withObject slider $ \sliderPtr -> setLabelsize' sliderPtr pix
{# fun Fl_Slider_image as image' { id `Ptr ()' } -> `(Image ())' unsafeToObject #}
sliderImage :: Slider a  ->  IO (Image ())
sliderImage slider = withObject slider $ \sliderPtr -> image' sliderPtr
{# fun Fl_Slider_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
sliderSetImage :: Slider a  -> Image b ->  IO (())
sliderSetImage slider pix = withObject slider $ \sliderPtr -> withObject pix $ \pixPtr -> setImage' sliderPtr pixPtr
{# fun Fl_Slider_deimage as deimage' { id `Ptr ()' } -> `(Image ())' unsafeToObject #}
sliderDeimage :: Slider a  ->  IO (Image ())
sliderDeimage slider = withObject slider $ \sliderPtr -> deimage' sliderPtr
{# fun Fl_Slider_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
sliderSetDeimage :: Slider a  -> Image b ->  IO (())
sliderSetDeimage slider pix = withObject slider $ \sliderPtr -> withObject pix $ \pixPtr -> setDeimage' sliderPtr pixPtr
{# fun Fl_Slider_tooltip as tooltip' { id `Ptr ()' } -> `String' #}
sliderTooltip :: Slider a  ->  IO (String)
sliderTooltip slider = withObject slider $ \sliderPtr -> tooltip' sliderPtr
{# fun Fl_Slider_copy_tooltip as copyTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
sliderCopyTooltip :: Slider a  -> String ->  IO (())
sliderCopyTooltip slider text = withObject slider $ \sliderPtr -> copyTooltip' sliderPtr text
{# fun Fl_Slider_set_tooltip as setTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
sliderSetTooltip :: Slider a  -> String ->  IO (())
sliderSetTooltip slider text = withObject slider $ \sliderPtr -> setTooltip' sliderPtr text
{# fun Fl_Slider_when as when' { id `Ptr ()' } -> `When' cToEnum #}
sliderWhen :: Slider a  ->  IO (When)
sliderWhen slider = withObject slider $ \sliderPtr -> when' sliderPtr
{# fun Fl_Slider_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
sliderSetWhen :: Slider a  -> Word8 ->  IO (())
sliderSetWhen slider i = withObject slider $ \sliderPtr -> setWhen' sliderPtr i
{# fun Fl_Slider_visible as visible' { id `Ptr ()' } -> `Int' #}
sliderVisible :: Slider a  ->  IO (Int)
sliderVisible slider = withObject slider $ \sliderPtr -> visible' sliderPtr
{# fun Fl_Slider_visible_r as visibleR' { id `Ptr ()' } -> `Int' #}
sliderVisibleR :: Slider a  ->  IO (Int)
sliderVisibleR slider = withObject slider $ \sliderPtr -> visibleR' sliderPtr
{# fun Fl_Slider_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderShowSuper :: Slider a  ->  IO (())
sliderShowSuper slider = withObject slider $ \sliderPtr -> showSuper' sliderPtr
{# fun Fl_Slider_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderShow :: Slider a  ->  IO (())
sliderShow slider = withObject slider $ \sliderPtr -> show' sliderPtr
{# fun Fl_Slider_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderHideSuper :: Slider a  ->  IO (())
sliderHideSuper slider = withObject slider $ \sliderPtr -> hideSuper' sliderPtr
{# fun Fl_Slider_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderHide :: Slider a  ->  IO (())
sliderHide slider = withObject slider $ \sliderPtr -> hide' sliderPtr
{# fun Fl_Slider_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderSetVisible :: Slider a  ->  IO (())
sliderSetVisible slider = withObject slider $ \sliderPtr -> setVisible' sliderPtr
{# fun Fl_Slider_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderClearVisible :: Slider a  ->  IO (())
sliderClearVisible slider = withObject slider $ \sliderPtr -> clearVisible' sliderPtr
{# fun Fl_Slider_active as active' { id `Ptr ()' } -> `Int' #}
sliderActive :: Slider a  ->  IO (Int)
sliderActive slider = withObject slider $ \sliderPtr -> active' sliderPtr
{# fun Fl_Slider_active_r as activeR' { id `Ptr ()' } -> `Int' #}
sliderActiveR :: Slider a  ->  IO (Int)
sliderActiveR slider = withObject slider $ \sliderPtr -> activeR' sliderPtr
{# fun Fl_Slider_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderActivate :: Slider a  ->  IO (())
sliderActivate slider = withObject slider $ \sliderPtr -> activate' sliderPtr
{# fun Fl_Slider_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderDeactivate :: Slider a  ->  IO (())
sliderDeactivate slider = withObject slider $ \sliderPtr -> deactivate' sliderPtr
{# fun Fl_Slider_output as output' { id `Ptr ()' } -> `Int' #}
sliderOutput :: Slider a  ->  IO (Int)
sliderOutput slider = withObject slider $ \sliderPtr -> output' sliderPtr
{# fun Fl_Slider_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderSetOutput :: Slider a  ->  IO (())
sliderSetOutput slider = withObject slider $ \sliderPtr -> setOutput' sliderPtr
{# fun Fl_Slider_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderClearOutput :: Slider a  ->  IO (())
sliderClearOutput slider = withObject slider $ \sliderPtr -> clearOutput' sliderPtr
{# fun Fl_Slider_takesevents as takesevents' { id `Ptr ()' } -> `Int' #}
sliderTakesevents :: Slider a  ->  IO (Int)
sliderTakesevents slider = withObject slider $ \sliderPtr -> takesevents' sliderPtr
{# fun Fl_Slider_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderSetChanged :: Slider a  ->  IO (())
sliderSetChanged slider = withObject slider $ \sliderPtr -> setChanged' sliderPtr
{# fun Fl_Slider_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderClearChanged :: Slider a  ->  IO (())
sliderClearChanged slider = withObject slider $ \sliderPtr -> clearChanged' sliderPtr
{# fun Fl_Slider_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
sliderTakeFocus :: Slider a  ->  IO (Int)
sliderTakeFocus slider = withObject slider $ \sliderPtr -> takeFocus' sliderPtr
{# fun Fl_Slider_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderSetVisibleFocus :: Slider a  ->  IO (())
sliderSetVisibleFocus slider = withObject slider $ \sliderPtr -> setVisibleFocus' sliderPtr
{# fun Fl_Slider_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderClearVisibleFocus :: Slider a  ->  IO (())
sliderClearVisibleFocus slider = withObject slider $ \sliderPtr -> clearVisibleFocus' sliderPtr
{# fun Fl_Slider_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
sliderModifyVisibleFocus :: Slider a  -> Int ->  IO (())
sliderModifyVisibleFocus slider v = withObject slider $ \sliderPtr -> modifyVisibleFocus' sliderPtr v
{# fun Fl_Slider_visible_focus as visibleFocus' { id `Ptr ()' } -> `Int' #}
sliderVisibleFocus :: Slider a  ->  IO (Int)
sliderVisibleFocus slider = withObject slider $ \sliderPtr -> visibleFocus' sliderPtr
{# fun Fl_Slider_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
sliderContains :: Slider a  -> Slider a  ->  IO (Int)
sliderContains slider otherSlider = withObject slider $ \sliderPtr -> withObject otherSlider $ \otherSliderPtr -> contains' sliderPtr otherSliderPtr
{# fun Fl_Slider_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
sliderInside :: Slider a  -> Slider a  ->  IO (Int)
sliderInside slider otherSlider = withObject slider $ \sliderPtr -> withObject otherSlider $ \otherSliderPtr -> inside' sliderPtr otherSliderPtr
{# fun Fl_Slider_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderRedraw :: Slider a  ->  IO (())
sliderRedraw slider = withObject slider $ \sliderPtr -> redraw' sliderPtr
{# fun Fl_Slider_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderRedrawLabel :: Slider a  ->  IO (())
sliderRedrawLabel slider = withObject slider $ \sliderPtr -> redrawLabel' sliderPtr
{# fun Fl_Slider_damage as damage' { id `Ptr ()' } -> `Word8' #}
sliderDamage :: Slider a  ->  IO (Word8)
sliderDamage slider = withObject slider $ \sliderPtr -> damage' sliderPtr
{# fun Fl_Slider_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
sliderClearDamageWithBitmask :: Slider a  -> Word8 ->  IO (())
sliderClearDamageWithBitmask slider c = withObject slider $ \sliderPtr -> clearDamageWithBitmask' sliderPtr c
{# fun Fl_Slider_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
sliderClearDamage :: Slider a  ->  IO (())
sliderClearDamage slider = withObject slider $ \sliderPtr -> clearDamage' sliderPtr
{# fun Fl_Slider_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
sliderDamageWithText :: Slider a  -> Word8 ->  IO (())
sliderDamageWithText slider c = withObject slider $ \sliderPtr -> damageWithText' sliderPtr c
{# fun Fl_Slider_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
sliderMeasureLabel :: Slider a  -> IO (Size)
sliderMeasureLabel slider = withObject slider $ \sliderPtr -> measureLabel' sliderPtr >>= \(width, height) -> return $ Size (Width width) (Height height)
{# fun Fl_Slider_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
sliderWindow :: Slider a  ->  IO (Window ())
sliderWindow slider = withObject slider $ \sliderPtr -> window' sliderPtr >>= toObject
{# fun Fl_Slider_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
sliderTopWindow :: Slider a  ->  IO (Window ())
sliderTopWindow slider = withObject slider $ \sliderPtr -> (topWindow' sliderPtr) >>= toObject
{# fun Fl_Slider_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
sliderTopWindowOffset :: Slider a -> IO (Position)
sliderTopWindowOffset slider = withObject slider $ \sliderPtr -> topWindowOffset' sliderPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun Fl_Slider_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
sliderAsGlWindowSuper :: Slider a  ->  IO (GlWindow ())
sliderAsGlWindowSuper slider = withObject slider $ \sliderPtr -> asGlWindowSuper' sliderPtr
{# fun Fl_Slider_as_gl_window as asGlWindow' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
sliderAsGlWindow :: Slider a  ->  IO (GlWindow ())
sliderAsGlWindow slider = withObject slider $ \sliderPtr -> asGlWindow' sliderPtr
{# fun Fl_Slider_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
sliderResizeSuper :: Slider a  -> Rectangle ->  IO (())
sliderResizeSuper slider rectangle = withObject slider $ \sliderPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resizeSuper' sliderPtr x_pos y_pos w_pos h_pos
{# fun Fl_Slider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
sliderResize :: Slider a  -> Rectangle -> IO (())
sliderResize slider rectangle = withObject slider $ \sliderPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' sliderPtr x_pos y_pos w_pos h_pos
{# fun Fl_Slider_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}
sliderSetCallback :: Slider a -> (Slider b -> IO ()) -> IO (())
sliderSetCallback slider callback = withObject slider $ \sliderPtr -> do
                                ptr <- toWidgetCallbackPrim callback
                                setCallback' sliderPtr (castFunPtr ptr)
{# fun unsafe Fl_Slider_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
sliderBounds :: Slider a  -> Double -> Double ->  IO (())
sliderBounds slider a b = withObject slider $ \sliderPtr -> bounds' sliderPtr a b
{# fun unsafe Fl_Slider_minimum as minimum' { id `Ptr ()' } -> `Double' #}
sliderMinimum :: Slider a  ->  IO (Double)
sliderMinimum slider = withObject slider $ \sliderPtr -> minimum' sliderPtr
{# fun unsafe Fl_Slider_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
sliderSetMinimum :: Slider a  -> Double ->  IO (())
sliderSetMinimum slider a = withObject slider $ \sliderPtr -> setMinimum' sliderPtr a
{# fun unsafe Fl_Slider_maximum as maximum' { id `Ptr ()' } -> `Double' #}
sliderMaximum :: Slider a  ->  IO (Double)
sliderMaximum slider = withObject slider $ \sliderPtr -> maximum' sliderPtr
{# fun unsafe Fl_Slider_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
sliderSetMaximum :: Slider a  -> Double ->  IO (())
sliderSetMaximum slider a = withObject slider $ \sliderPtr -> setMaximum' sliderPtr a
{# fun unsafe Fl_Slider_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
sliderRange :: Slider a  -> Double -> Double ->  IO (())
sliderRange slider a b = withObject slider $ \sliderPtr -> range' sliderPtr a b
{# fun unsafe Fl_Slider_set_step as setStep' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
sliderSetStep :: Slider a  -> Int ->  IO (())
sliderSetStep slider a = withObject slider $ \sliderPtr -> setStep' sliderPtr a
{# fun unsafe Fl_Slider_set_step_with_a_b as setStepWithAB' { id `Ptr ()',`Double',`Int' } -> `()' supressWarningAboutRes #}
sliderSetStepWithAB :: Slider a  -> Double -> Int ->  IO (())
sliderSetStepWithAB slider a b = withObject slider $ \sliderPtr -> setStepWithAB' sliderPtr a b
{# fun unsafe Fl_Slider_step_with_s as stepWithS' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
sliderStepWithS :: Slider a  -> Double ->  IO (())
sliderStepWithS slider s = withObject slider $ \sliderPtr -> stepWithS' sliderPtr s
{# fun unsafe Fl_Slider_step as step' { id `Ptr ()' } -> `Double' #}
sliderStep :: Slider a  ->  IO (Double)
sliderStep slider = withObject slider $ \sliderPtr -> step' sliderPtr
{# fun unsafe Fl_Slider_precision as precision' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
sliderPrecision :: Slider a  -> Int ->  IO (())
sliderPrecision slider precision = withObject slider $ \sliderPtr -> precision' sliderPtr precision
{# fun unsafe Fl_Slider_value as value' { id `Ptr ()' } -> `Double' #}
sliderValue :: Slider a  ->  IO (Double)
sliderValue slider = withObject slider $ \sliderPtr -> value' sliderPtr
{# fun unsafe Fl_Slider_set_value as setValue' { id `Ptr ()',`Double' } -> `Int' #}
sliderSetValue :: Slider a  -> Double ->  IO (Int)
sliderSetValue slider v = withObject slider $ \sliderPtr -> setValue' sliderPtr v
{# fun unsafe Fl_Slider_format as format' { id `Ptr ()',`String' } -> `Int' #}
sliderFormat :: Slider a  -> String ->  IO (Int)
sliderFormat slider format = withObject slider $ \sliderPtr -> format' sliderPtr format
{# fun unsafe Fl_Slider_round as round' { id `Ptr ()',`Double' } -> `Double' #}
sliderRound :: Slider a  -> Double ->  IO (Double)
sliderRound slider v = withObject slider $ \sliderPtr -> round' sliderPtr v
{# fun unsafe Fl_Slider_clamp as clamp' { id `Ptr ()',`Double' } -> `Double' #}
sliderClamp :: Slider a  -> Double ->  IO (Double)
sliderClamp slider v = withObject slider $ \sliderPtr -> clamp' sliderPtr v
{# fun unsafe Fl_Slider_increment as increment' { id `Ptr ()',`Double',`Int' } -> `Double' #}
sliderIncrement :: Slider a  -> Double -> Int ->  IO (Double)
sliderIncrement slider v n = withObject slider $ \sliderPtr -> increment' sliderPtr v n
{# fun unsafe Fl_Slider_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
sliderScrollvalue :: Slider a  -> Int -> Int -> Int -> Int ->  IO (Int)
sliderScrollvalue slider pos slider_size first total = withObject slider $ \sliderPtr -> scrollvalue' sliderPtr pos slider_size first total
{# fun unsafe Fl_Slider_set_slider_size as setSliderSize' { id `Ptr ()' } -> `Float' #}
sliderSetSliderSize :: Slider a  ->  IO (Float)
sliderSetSliderSize slider = withObject slider $ \sliderPtr -> setSliderSize' sliderPtr
{# fun unsafe Fl_Slider_slider_size as sliderSize' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
sliderSliderSize :: Slider a  -> Double ->  IO (())
sliderSliderSize slider v = withObject slider $ \sliderPtr -> sliderSize' sliderPtr v
{# fun unsafe Fl_Slider_slider as slider' { id `Ptr ()' } -> `Boxtype' cToEnum #}
sliderSlider :: Slider a  ->  IO (Boxtype)
sliderSlider slider = withObject slider $ \sliderPtr -> slider' sliderPtr
{# fun unsafe Fl_Slider_set_slider as setSlider' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
sliderSetSlider :: Slider a  -> Boxtype ->  IO (())
sliderSetSlider slider c = withObject slider $ \sliderPtr -> setSlider' sliderPtr c
