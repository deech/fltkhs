{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Valuator
    (
     ValuatorFuncs(..),
     defaultValuatorFuncs,
     -- * Constructor
     valuatorNew,
     valuatorDestroy,
     -- * Fl_Valuator specific
     valuatorHandle,
     valuatorParent,
     valuatorSetParent,
     valuatorType_,
     valuatorSetType,
     valuatorDrawLabel,
     valuatorX,
     valuatorY,
     valuatorW,
     valuatorH,
     valuatorSetAlign,
     valuatorAlign,
     valuatorBox,
     valuatorSetBox,
     valuatorColor,
     valuatorSetColor,
     valuatorSetColorWithBgSel,
     valuatorSelectionColor,
     valuatorSetSelectionColor,
     valuatorLabel,
     valuatorCopyLabel,
     valuatorSetLabel,
     valuatorLabeltype,
     valuatorSetLabeltype,
     valuatorLabelcolor,
     valuatorSetLabelcolor,
     valuatorLabelfont,
     valuatorSetLabelfont,
     valuatorLabelsize,
     valuatorSetLabelsize,
     valuatorImage,
     valuatorSetImage,
     valuatorDeimage,
     valuatorSetDeimage,
     valuatorTooltip,
     valuatorCopyTooltip,
     valuatorSetTooltip,
     valuatorWhen,
     valuatorSetWhen,
     valuatorVisible,
     valuatorVisibleR,
     valuatorShowSuper,
     valuatorShow,
     valuatorHideSuper,
     valuatorHide,
     valuatorSetVisible,
     valuatorClearVisible,
     valuatorActive,
     valuatorActiveR,
     valuatorActivate,
     valuatorDeactivate,
     valuatorOutput,
     valuatorSetOutput,
     valuatorClearOutput,
     valuatorTakesevents,
     valuatorSetChanged,
     valuatorClearChanged,
     valuatorTakeFocus,
     valuatorSetVisibleFocus,
     valuatorClearVisibleFocus,
     valuatorModifyVisibleFocus,
     valuatorVisibleFocus,
     valuatorContains,
     valuatorInside,
     valuatorRedraw,
     valuatorRedrawLabel,
     valuatorDamage,
     valuatorClearDamageWithBitmask,
     valuatorClearDamage,
     valuatorDamageWithText,
     valuatorMeasureLabel,
     valuatorWindow,
     valuatorTopWindow,
     valuatorTopWindowOffset,
     valuatorAsGlWindowSuper,
     valuatorAsGlWindow,
     valuatorResizeSuper,
     valuatorResize,
     valuatorSetCallback,
     valuatorDrawBox,
     valuatorDrawBoxWithBoxtype,
     valuatorDrawBackdrop,
     valuatorDrawFocus,
     valuatorBounds, 
     valuatorMinimum, 
     valuatorSetMinimum, 
     valuatorMaximum, 
     valuatorSetMaximum, 
     valuatorRange, 
     valuatorSetStep, 
     valuatorSetStepWithAB, 
     valuatorStepWithS, 
     valuatorStep, 
     valuatorPrecision, 
     valuatorValue, 
     valuatorSetValue, 
     valuatorFormat, 
     valuatorRound, 
     valuatorClamp, 
     valuatorIncrement
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ValuatorC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

data ValuatorFuncs a =
    ValuatorFuncs
    {
     valuatorDrawOverride       :: Maybe (WidgetCallback a)
    ,valuatorHandleOverride     :: Maybe (WidgetEventHandler a)
    ,valuatorResizeOverride     :: Maybe (RectangleF a)
    ,valuatorShowOverride       :: Maybe (WidgetCallback a)
    ,valuatorHideOverride       :: Maybe (WidgetCallback a)
    ,valuatorAsWindowOverride   :: Maybe (GetWindowF a)
    ,valuatorAsGlWindowOverride :: Maybe (GetGlWindowF a)
    }

valuatorFunctionStruct :: (ValuatorFuncs a) -> IO (Ptr ())
valuatorFunctionStruct funcs = do
      p <- mallocBytes {#sizeof fl_Valuator_Virtual_Funcs #}
      toCallbackPrim `orNullFunPtr` (valuatorDrawOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->draw#} p
      toEventHandlerPrim `orNullFunPtr` (valuatorHandleOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->handle#} p
      toRectangleFPrim `orNullFunPtr` (valuatorResizeOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->resize#} p
      toCallbackPrim `orNullFunPtr` (valuatorShowOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->show#} p
      toCallbackPrim `orNullFunPtr` (valuatorHideOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->hide#} p
      toGetWindowFPrim `orNullFunPtr` (valuatorAsWindowOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->as_window#} p
      toGetGlWindowFPrim `orNullFunPtr` (valuatorAsGlWindowOverride funcs) >>=
                             {#set fl_Valuator_Virtual_Funcs->as_gl_window#} p
      return p
defaultValuatorFuncs :: ValuatorFuncs a
defaultValuatorFuncs = ValuatorFuncs Nothing Nothing Nothing Nothing Nothing Nothing Nothing

{# fun Fl_Valuator_New as valuatorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Valuator_New_WithLabel as valuatorNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New_WithLabel as overriddenValuatorNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New as overriddenValuatorNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valuatorNew :: Rectangle -> Maybe String -> Maybe (ValuatorFuncs a) -> IO (Valuator ())
valuatorNew rectangle l' funcs' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case (l', funcs') of
        (Nothing,Nothing) -> valuatorNew' x_pos y_pos width height >>=
                             toObject
        ((Just l), Nothing) -> valuatorNewWithLabel' x_pos y_pos width height l >>=
                               toObject
        ((Just l), (Just fs)) -> do
                               ptr <- valuatorFunctionStruct fs
                               overriddenValuatorNewWithLabel' x_pos y_pos width height l (castPtr ptr) >>=
                                                             toObject
        (Nothing, (Just fs)) -> do
                               ptr <- valuatorFunctionStruct fs
                               overriddenValuatorNew' x_pos y_pos width height (castPtr ptr) >>=
                                                    toObject

{# fun Fl_Valuator_Destroy as valuatorDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorDestroy :: Valuator a -> IO ()
valuatorDestroy win = swapObject win $ \winPtr -> do
                                        valuatorDestroy' winPtr
                                        return nullPtr

{#fun Fl_Valuator_handle as valuatorHandle'
      { id `Ptr ()', id `CInt' } -> `Int' #}
valuatorHandle :: Valuator a -> Event -> IO Int
valuatorHandle valuator event = withObject valuator (\p -> valuatorHandle' p (fromIntegral . fromEnum $ event))

{#fun Fl_Valuator_parent as valuatorParent'
      { id `Ptr ()'} -> `Ptr ()' id #}
valuatorParent :: Valuator a -> IO (Group ())
valuatorParent valuator = withObject valuator valuatorParent' >>= toObject

{#fun Fl_Valuator_set_parent as valuatorSetParent'
      { id `Ptr ()', id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorSetParent :: Valuator a -> Group b -> IO ()
valuatorSetParent valuator group =
    withObject valuator
                   (\valuatorPtr ->
                        withObject group (\groupPtr ->
                                              valuatorSetParent' valuatorPtr groupPtr
                                         )
                   )
{# fun Fl_Valuator_type as type' { id `Ptr ()' } -> `Word8' #}
valuatorType_ :: Valuator a  ->  IO (Word8)
valuatorType_ valuator = withObject valuator $ \valuatorPtr -> type' valuatorPtr
{# fun Fl_Valuator_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
valuatorSetType :: Valuator a  -> Word8 ->  IO (())
valuatorSetType valuator t = withObject valuator $ \valuatorPtr -> setType' valuatorPtr t
{# fun Fl_Valuator_draw_label as drawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Valuator_draw_label_with_xywh_alignment as drawLabelWithXywhAlignment' { id `Ptr ()',`Int',`Int',`Int',`Int',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
valuatorDrawLabel :: Valuator a  -> Maybe (Rectangle,AlignType)->  IO (())
valuatorDrawLabel valuator Nothing = withObject valuator $ \valuatorPtr -> drawLabel' valuatorPtr
valuatorDrawLabel valuator (Just (rectangle,align_)) = withObject valuator $ \valuatorPtr -> do
                                        let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                        drawLabelWithXywhAlignment' valuatorPtr x_pos y_pos w_pos h_pos align_
{# fun Fl_Valuator_x as x' { id `Ptr ()' } -> `Int' #}
valuatorX :: Valuator a  ->  IO (Int)
valuatorX valuator = withObject valuator $ \valuatorPtr -> x' valuatorPtr
{# fun Fl_Valuator_y as y' { id `Ptr ()' } -> `Int' #}
valuatorY :: Valuator a  ->  IO (Int)
valuatorY valuator = withObject valuator $ \valuatorPtr -> y' valuatorPtr
{# fun Fl_Valuator_w as w' { id `Ptr ()' } -> `Int' #}
valuatorW :: Valuator a  ->  IO (Int)
valuatorW valuator = withObject valuator $ \valuatorPtr -> w' valuatorPtr
{# fun Fl_Valuator_h as h' { id `Ptr ()' } -> `Int' #}
valuatorH :: Valuator a  ->  IO (Int)
valuatorH valuator = withObject valuator $ \valuatorPtr -> h' valuatorPtr
{# fun Fl_Valuator_set_align as setAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' supressWarningAboutRes #}
valuatorSetAlign :: Valuator a  -> AlignType ->  IO (())
valuatorSetAlign valuator _align = withObject valuator $ \valuatorPtr -> setAlign' valuatorPtr _align
{# fun Fl_Valuator_align as align' { id `Ptr ()' } -> `AlignType' cToEnum #}
valuatorAlign :: Valuator a  ->  IO (AlignType)
valuatorAlign valuator = withObject valuator $ \valuatorPtr -> align' valuatorPtr
{# fun Fl_Valuator_box as box' { id `Ptr ()' } -> `Boxtype' cToEnum #}
valuatorBox :: Valuator a  ->  IO (Boxtype)
valuatorBox valuator = withObject valuator $ \valuatorPtr -> box' valuatorPtr
{# fun Fl_Valuator_set_box as setBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
valuatorSetBox :: Valuator a  -> Boxtype ->  IO (())
valuatorSetBox valuator new_box = withObject valuator $ \valuatorPtr -> setBox' valuatorPtr new_box
{# fun Fl_Valuator_color as color' { id `Ptr ()' } -> `Color' cToColor #}
valuatorColor :: Valuator a  ->  IO (Color)
valuatorColor valuator = withObject valuator $ \valuatorPtr -> color' valuatorPtr
{# fun Fl_Valuator_set_color as setColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
valuatorSetColor :: Valuator a  -> Color ->  IO (())
valuatorSetColor valuator bg = withObject valuator $ \valuatorPtr -> setColor' valuatorPtr bg
{# fun Fl_Valuator_set_color_with_bg_sel as setColorWithBgSel' { id `Ptr ()',cFromColor `Color',cFromColor `Color' } -> `()' supressWarningAboutRes #}
valuatorSetColorWithBgSel :: Valuator a  -> Color -> Color ->  IO (())
valuatorSetColorWithBgSel valuator bg a = withObject valuator $ \valuatorPtr -> setColorWithBgSel' valuatorPtr bg a
{# fun Fl_Valuator_selection_color as selectionColor' { id `Ptr ()' } -> `Color' cToColor #}
valuatorSelectionColor :: Valuator a  ->  IO (Color)
valuatorSelectionColor valuator = withObject valuator $ \valuatorPtr -> selectionColor' valuatorPtr
{# fun Fl_Valuator_set_selection_color as setSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
valuatorSetSelectionColor :: Valuator a  -> Color ->  IO (())
valuatorSetSelectionColor valuator a = withObject valuator $ \valuatorPtr -> setSelectionColor' valuatorPtr a
{# fun Fl_Valuator_label as label' { id `Ptr ()' } -> `String' #}
valuatorLabel :: Valuator a  ->  IO (String)
valuatorLabel valuator = withObject valuator $ \valuatorPtr -> label' valuatorPtr
{# fun Fl_Valuator_copy_label as copyLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
valuatorCopyLabel :: Valuator a  -> String ->  IO (())
valuatorCopyLabel valuator new_label = withObject valuator $ \valuatorPtr -> copyLabel' valuatorPtr new_label
{# fun Fl_Valuator_set_label as setLabel' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
valuatorSetLabel :: Valuator a  -> String ->  IO (())
valuatorSetLabel valuator text = withObject valuator $ \valuatorPtr -> setLabel' valuatorPtr text
{# fun Fl_Valuator_labeltype as labeltype' { id `Ptr ()' } -> `Labeltype' cToEnum #}
valuatorLabeltype :: Valuator a  ->  IO (Labeltype)
valuatorLabeltype valuator = withObject valuator $ \valuatorPtr -> labeltype' valuatorPtr
{# fun Fl_Valuator_set_labeltype as setLabeltype' { id `Ptr ()',cFromEnum `Labeltype' } -> `()' supressWarningAboutRes #}
valuatorSetLabeltype :: Valuator a  -> Labeltype ->  IO (())
valuatorSetLabeltype valuator a = withObject valuator $ \valuatorPtr -> setLabeltype' valuatorPtr a
{# fun Fl_Valuator_labelcolor as labelcolor' { id `Ptr ()' } -> `Color' cToColor #}
valuatorLabelcolor :: Valuator a  ->  IO (Color)
valuatorLabelcolor valuator = withObject valuator $ \valuatorPtr -> labelcolor' valuatorPtr
{# fun Fl_Valuator_set_labelcolor as setLabelcolor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
valuatorSetLabelcolor :: Valuator a  -> Color ->  IO (())
valuatorSetLabelcolor valuator c = withObject valuator $ \valuatorPtr -> setLabelcolor' valuatorPtr c
{# fun Fl_Valuator_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
valuatorLabelfont :: Valuator a  ->  IO (Font)
valuatorLabelfont valuator = withObject valuator $ \valuatorPtr -> labelfont' valuatorPtr
{# fun Fl_Valuator_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' supressWarningAboutRes #}
valuatorSetLabelfont :: Valuator a  -> Font ->  IO (())
valuatorSetLabelfont valuator c = withObject valuator $ \valuatorPtr -> setLabelfont' valuatorPtr c
{# fun Fl_Valuator_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
valuatorLabelsize :: Valuator a  ->  IO (FontSize)
valuatorLabelsize valuator = withObject valuator $ \valuatorPtr -> labelsize' valuatorPtr >>= return . FontSize
{# fun Fl_Valuator_set_labelsize as setLabelsize' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
valuatorSetLabelsize :: Valuator a  -> FontSize ->  IO (())
valuatorSetLabelsize valuator (FontSize pix) = withObject valuator $ \valuatorPtr -> setLabelsize' valuatorPtr pix
{# fun Fl_Valuator_image as image' { id `Ptr ()' } -> `(Image ())' unsafeToObject #}
valuatorImage :: Valuator a  ->  IO (Image ())
valuatorImage valuator = withObject valuator $ \valuatorPtr -> image' valuatorPtr
{# fun Fl_Valuator_set_image as setImage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
valuatorSetImage :: Valuator a  -> Image b ->  IO (())
valuatorSetImage valuator pix = withObject valuator $ \valuatorPtr -> withObject pix $ \pixPtr -> setImage' valuatorPtr pixPtr
{# fun Fl_Valuator_deimage as deimage' { id `Ptr ()' } -> `(Image ())' unsafeToObject #}
valuatorDeimage :: Valuator a  ->  IO (Image ())
valuatorDeimage valuator = withObject valuator $ \valuatorPtr -> deimage' valuatorPtr
{# fun Fl_Valuator_set_deimage as setDeimage' { id `Ptr ()',id `Ptr ()'} -> `()' supressWarningAboutRes #}
valuatorSetDeimage :: Valuator a  -> Image b ->  IO (())
valuatorSetDeimage valuator pix = withObject valuator $ \valuatorPtr -> withObject pix $ \pixPtr -> setDeimage' valuatorPtr pixPtr
{# fun Fl_Valuator_tooltip as tooltip' { id `Ptr ()' } -> `String' #}
valuatorTooltip :: Valuator a  ->  IO (String)
valuatorTooltip valuator = withObject valuator $ \valuatorPtr -> tooltip' valuatorPtr
{# fun Fl_Valuator_copy_tooltip as copyTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
valuatorCopyTooltip :: Valuator a  -> String ->  IO (())
valuatorCopyTooltip valuator text = withObject valuator $ \valuatorPtr -> copyTooltip' valuatorPtr text
{# fun Fl_Valuator_set_tooltip as setTooltip' { id `Ptr ()',`String' } -> `()' supressWarningAboutRes #}
valuatorSetTooltip :: Valuator a  -> String ->  IO (())
valuatorSetTooltip valuator text = withObject valuator $ \valuatorPtr -> setTooltip' valuatorPtr text
{# fun Fl_Valuator_when as when' { id `Ptr ()' } -> `When' cToEnum #}
valuatorWhen :: Valuator a  ->  IO (When)
valuatorWhen valuator = withObject valuator $ \valuatorPtr -> when' valuatorPtr
{# fun Fl_Valuator_set_when as setWhen' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
valuatorSetWhen :: Valuator a  -> Word8 ->  IO (())
valuatorSetWhen valuator i = withObject valuator $ \valuatorPtr -> setWhen' valuatorPtr i
{# fun Fl_Valuator_visible as visible' { id `Ptr ()' } -> `Int' #}
valuatorVisible :: Valuator a  ->  IO (Int)
valuatorVisible valuator = withObject valuator $ \valuatorPtr -> visible' valuatorPtr
{# fun Fl_Valuator_visible_r as visibleR' { id `Ptr ()' } -> `Int' #}
valuatorVisibleR :: Valuator a  ->  IO (Int)
valuatorVisibleR valuator = withObject valuator $ \valuatorPtr -> visibleR' valuatorPtr
{# fun Fl_Valuator_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorShowSuper :: Valuator a  ->  IO (())
valuatorShowSuper valuator = withObject valuator $ \valuatorPtr -> showSuper' valuatorPtr
{# fun Fl_Valuator_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorShow :: Valuator a  ->  IO (())
valuatorShow valuator = withObject valuator $ \valuatorPtr -> show' valuatorPtr
{# fun Fl_Valuator_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorHideSuper :: Valuator a  ->  IO (())
valuatorHideSuper valuator = withObject valuator $ \valuatorPtr -> hideSuper' valuatorPtr
{# fun Fl_Valuator_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorHide :: Valuator a  ->  IO (())
valuatorHide valuator = withObject valuator $ \valuatorPtr -> hide' valuatorPtr
{# fun Fl_Valuator_set_visible as setVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorSetVisible :: Valuator a  ->  IO (())
valuatorSetVisible valuator = withObject valuator $ \valuatorPtr -> setVisible' valuatorPtr
{# fun Fl_Valuator_clear_visible as clearVisible' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorClearVisible :: Valuator a  ->  IO (())
valuatorClearVisible valuator = withObject valuator $ \valuatorPtr -> clearVisible' valuatorPtr
{# fun Fl_Valuator_active as active' { id `Ptr ()' } -> `Int' #}
valuatorActive :: Valuator a  ->  IO (Int)
valuatorActive valuator = withObject valuator $ \valuatorPtr -> active' valuatorPtr
{# fun Fl_Valuator_active_r as activeR' { id `Ptr ()' } -> `Int' #}
valuatorActiveR :: Valuator a  ->  IO (Int)
valuatorActiveR valuator = withObject valuator $ \valuatorPtr -> activeR' valuatorPtr
{# fun Fl_Valuator_activate as activate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorActivate :: Valuator a  ->  IO (())
valuatorActivate valuator = withObject valuator $ \valuatorPtr -> activate' valuatorPtr
{# fun Fl_Valuator_deactivate as deactivate' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorDeactivate :: Valuator a  ->  IO (())
valuatorDeactivate valuator = withObject valuator $ \valuatorPtr -> deactivate' valuatorPtr
{# fun Fl_Valuator_output as output' { id `Ptr ()' } -> `Int' #}
valuatorOutput :: Valuator a  ->  IO (Int)
valuatorOutput valuator = withObject valuator $ \valuatorPtr -> output' valuatorPtr
{# fun Fl_Valuator_set_output as setOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorSetOutput :: Valuator a  ->  IO (())
valuatorSetOutput valuator = withObject valuator $ \valuatorPtr -> setOutput' valuatorPtr
{# fun Fl_Valuator_clear_output as clearOutput' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorClearOutput :: Valuator a  ->  IO (())
valuatorClearOutput valuator = withObject valuator $ \valuatorPtr -> clearOutput' valuatorPtr
{# fun Fl_Valuator_takesevents as takesevents' { id `Ptr ()' } -> `Int' #}
valuatorTakesevents :: Valuator a  ->  IO (Int)
valuatorTakesevents valuator = withObject valuator $ \valuatorPtr -> takesevents' valuatorPtr
{# fun Fl_Valuator_set_changed as setChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorSetChanged :: Valuator a  ->  IO (())
valuatorSetChanged valuator = withObject valuator $ \valuatorPtr -> setChanged' valuatorPtr
{# fun Fl_Valuator_clear_changed as clearChanged' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorClearChanged :: Valuator a  ->  IO (())
valuatorClearChanged valuator = withObject valuator $ \valuatorPtr -> clearChanged' valuatorPtr
{# fun Fl_Valuator_take_focus as takeFocus' { id `Ptr ()' } -> `Int' #}
valuatorTakeFocus :: Valuator a  ->  IO (Int)
valuatorTakeFocus valuator = withObject valuator $ \valuatorPtr -> takeFocus' valuatorPtr
{# fun Fl_Valuator_set_visible_focus as setVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorSetVisibleFocus :: Valuator a  ->  IO (())
valuatorSetVisibleFocus valuator = withObject valuator $ \valuatorPtr -> setVisibleFocus' valuatorPtr
{# fun Fl_Valuator_clear_visible_focus as clearVisibleFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorClearVisibleFocus :: Valuator a  ->  IO (())
valuatorClearVisibleFocus valuator = withObject valuator $ \valuatorPtr -> clearVisibleFocus' valuatorPtr
{# fun Fl_Valuator_modify_visible_focus as modifyVisibleFocus' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
valuatorModifyVisibleFocus :: Valuator a  -> Int ->  IO (())
valuatorModifyVisibleFocus valuator v = withObject valuator $ \valuatorPtr -> modifyVisibleFocus' valuatorPtr v
{# fun Fl_Valuator_visible_focus as visibleFocus' { id `Ptr ()' } -> `Int' #}
valuatorVisibleFocus :: Valuator a  ->  IO (Int)
valuatorVisibleFocus valuator = withObject valuator $ \valuatorPtr -> visibleFocus' valuatorPtr
{# fun Fl_Valuator_contains as contains' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
valuatorContains :: Valuator a  -> Valuator a  ->  IO (Int)
valuatorContains valuator otherValuator = withObject valuator $ \valuatorPtr -> withObject otherValuator $ \otherValuatorPtr -> contains' valuatorPtr otherValuatorPtr
{# fun Fl_Valuator_inside as inside' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
valuatorInside :: Valuator a  -> Valuator a  ->  IO (Int)
valuatorInside valuator otherValuator = withObject valuator $ \valuatorPtr -> withObject otherValuator $ \otherValuatorPtr -> inside' valuatorPtr otherValuatorPtr
{# fun Fl_Valuator_redraw as redraw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorRedraw :: Valuator a  ->  IO (())
valuatorRedraw valuator = withObject valuator $ \valuatorPtr -> redraw' valuatorPtr
{# fun Fl_Valuator_redraw_label as redrawLabel' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorRedrawLabel :: Valuator a  ->  IO (())
valuatorRedrawLabel valuator = withObject valuator $ \valuatorPtr -> redrawLabel' valuatorPtr
{# fun Fl_Valuator_damage as damage' { id `Ptr ()' } -> `Word8' #}
valuatorDamage :: Valuator a  ->  IO (Word8)
valuatorDamage valuator = withObject valuator $ \valuatorPtr -> damage' valuatorPtr
{# fun Fl_Valuator_clear_damage_with_bitmask as clearDamageWithBitmask' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
valuatorClearDamageWithBitmask :: Valuator a  -> Word8 ->  IO (())
valuatorClearDamageWithBitmask valuator c = withObject valuator $ \valuatorPtr -> clearDamageWithBitmask' valuatorPtr c
{# fun Fl_Valuator_clear_damage as clearDamage' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorClearDamage :: Valuator a  ->  IO (())
valuatorClearDamage valuator = withObject valuator $ \valuatorPtr -> clearDamage' valuatorPtr
{# fun Fl_Valuator_damage_with_text as damageWithText' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
valuatorDamageWithText :: Valuator a  -> Word8 ->  IO (())
valuatorDamageWithText valuator c = withObject valuator $ \valuatorPtr -> damageWithText' valuatorPtr c
{# fun Fl_Valuator_measure_label as measureLabel' {id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv*} -> `()' #}
valuatorMeasureLabel :: Valuator a  -> IO (Size)
valuatorMeasureLabel valuator = withObject valuator $ \valuatorPtr -> measureLabel' valuatorPtr >>= \(width, height) -> return $ Size (Width width) (Height height)
{# fun Fl_Valuator_window as window' { id `Ptr ()' } -> `Ptr ()' id #}
valuatorWindow :: Valuator a  ->  IO (Window ())
valuatorWindow valuator = withObject valuator $ \valuatorPtr -> window' valuatorPtr >>= toObject
{# fun Fl_Valuator_top_window as topWindow' { id `Ptr ()' } -> `Ptr ()' id #}
valuatorTopWindow :: Valuator a  ->  IO (Window ())
valuatorTopWindow valuator = withObject valuator $ \valuatorPtr -> (topWindow' valuatorPtr) >>= toObject
{# fun Fl_Valuator_top_window_offset as topWindowOffset' { id `Ptr ()',alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv* } -> `()' #}
valuatorTopWindowOffset :: Valuator a -> IO (Position)
valuatorTopWindowOffset valuator = withObject valuator $ \valuatorPtr -> topWindowOffset' valuatorPtr >>= \(x_pos,y_pos) -> return $ Position (X x_pos) (Y y_pos)
{# fun Fl_Valuator_as_gl_window_super as asGlWindowSuper' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
valuatorAsGlWindowSuper :: Valuator a  ->  IO (GlWindow ())
valuatorAsGlWindowSuper valuator = withObject valuator $ \valuatorPtr -> asGlWindowSuper' valuatorPtr
{# fun Fl_Valuator_as_gl_window as asGlWindow' { id `Ptr ()' } -> `(GlWindow ())' unsafeToObject #}
valuatorAsGlWindow :: Valuator a  ->  IO (GlWindow ())
valuatorAsGlWindow valuator = withObject valuator $ \valuatorPtr -> asGlWindow' valuatorPtr
{# fun Fl_Valuator_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
valuatorResizeSuper :: Valuator a  -> Rectangle ->  IO (())
valuatorResizeSuper valuator rectangle = withObject valuator $ \valuatorPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resizeSuper' valuatorPtr x_pos y_pos w_pos h_pos
{# fun Fl_Valuator_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
valuatorResize :: Valuator a  -> Rectangle -> IO (())
valuatorResize valuator rectangle = withObject valuator $ \valuatorPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valuatorPtr x_pos y_pos w_pos h_pos
{# fun Fl_Valuator_set_callback as setCallback' { id `Ptr ()', id `FunPtr CallbackWithUserDataPrim'} -> `()' supressWarningAboutRes #}
valuatorSetCallback :: Valuator a -> (WidgetCallback b) -> IO (())
valuatorSetCallback valuator callback = withObject valuator $ \valuatorPtr -> do
                                ptr <- toWidgetCallbackPrim callback
                                setCallback' valuatorPtr (castFunPtr ptr)
{# fun unsafe Fl_Valuator_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
valuatorBounds :: Valuator a  -> Double -> Double ->  IO (())
valuatorBounds valuator a b = withObject valuator $ \valuatorPtr -> bounds' valuatorPtr a b
{# fun unsafe Fl_Valuator_minimum as minimum' { id `Ptr ()' } -> `Double' #}
valuatorMinimum :: Valuator a  ->  IO (Double)
valuatorMinimum valuator = withObject valuator $ \valuatorPtr -> minimum' valuatorPtr
{# fun unsafe Fl_Valuator_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
valuatorSetMinimum :: Valuator a  -> Double ->  IO (())
valuatorSetMinimum valuator a = withObject valuator $ \valuatorPtr -> setMinimum' valuatorPtr a
{# fun unsafe Fl_Valuator_maximum as maximum' { id `Ptr ()' } -> `Double' #}
valuatorMaximum :: Valuator a  ->  IO (Double)
valuatorMaximum valuator = withObject valuator $ \valuatorPtr -> maximum' valuatorPtr
{# fun unsafe Fl_Valuator_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
valuatorSetMaximum :: Valuator a  -> Double ->  IO (())
valuatorSetMaximum valuator a = withObject valuator $ \valuatorPtr -> setMaximum' valuatorPtr a
{# fun unsafe Fl_Valuator_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
valuatorRange :: Valuator a  -> Double -> Double ->  IO (())
valuatorRange valuator a b = withObject valuator $ \valuatorPtr -> range' valuatorPtr a b
{# fun unsafe Fl_Valuator_set_step as setStep' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
valuatorSetStep :: Valuator a  -> Int ->  IO (())
valuatorSetStep valuator a = withObject valuator $ \valuatorPtr -> setStep' valuatorPtr a
{# fun unsafe Fl_Valuator_set_step_with_a_b as setStepWithAB' { id `Ptr ()',`Double',`Int' } -> `()' supressWarningAboutRes #}
valuatorSetStepWithAB :: Valuator a  -> Double -> Int ->  IO (())
valuatorSetStepWithAB valuator a b = withObject valuator $ \valuatorPtr -> setStepWithAB' valuatorPtr a b
{# fun unsafe Fl_Valuator_step_with_s as stepWithS' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
valuatorStepWithS :: Valuator a  -> Double ->  IO (())
valuatorStepWithS valuator s = withObject valuator $ \valuatorPtr -> stepWithS' valuatorPtr s
{# fun unsafe Fl_Valuator_step as step' { id `Ptr ()' } -> `Double' #}
valuatorStep :: Valuator a  ->  IO (Double)
valuatorStep valuator = withObject valuator $ \valuatorPtr -> step' valuatorPtr
{# fun unsafe Fl_Valuator_precision as precision' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
valuatorPrecision :: Valuator a  -> Int ->  IO (())
valuatorPrecision valuator precision = withObject valuator $ \valuatorPtr -> precision' valuatorPtr precision
{# fun unsafe Fl_Valuator_value as value' { id `Ptr ()' } -> `Double' #}
valuatorValue :: Valuator a  ->  IO (Double)
valuatorValue valuator = withObject valuator $ \valuatorPtr -> value' valuatorPtr
{# fun unsafe Fl_Valuator_set_value as setValue' { id `Ptr ()',`Double' } -> `Int' #}
valuatorSetValue :: Valuator a  -> Double ->  IO (Int)
valuatorSetValue valuator v = withObject valuator $ \valuatorPtr -> setValue' valuatorPtr v
{# fun unsafe Fl_Valuator_format as format' { id `Ptr ()',`String' } -> `Int' #}
valuatorFormat :: Valuator a  -> String ->  IO (Int)
valuatorFormat valuator format = withObject valuator $ \valuatorPtr -> format' valuatorPtr format
{# fun unsafe Fl_Valuator_round as round' { id `Ptr ()',`Double' } -> `Double' #}
valuatorRound :: Valuator a  -> Double ->  IO (Double)
valuatorRound valuator v = withObject valuator $ \valuatorPtr -> round' valuatorPtr v
{# fun unsafe Fl_Valuator_clamp as clamp' { id `Ptr ()',`Double' } -> `Double' #}
valuatorClamp :: Valuator a  -> Double ->  IO (Double)
valuatorClamp valuator v = withObject valuator $ \valuatorPtr -> clamp' valuatorPtr v
{# fun unsafe Fl_Valuator_increment as increment' { id `Ptr ()',`Double',`Int' } -> `Double' #}
valuatorIncrement :: Valuator a  -> Double -> Int ->  IO (Double)
valuatorIncrement valuator v n = withObject valuator $ \valuatorPtr -> increment' valuatorPtr v n

{# fun Fl_Valuator_draw_box as valuatorDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Valuator_draw_box_with_tc as valuatorDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Valuator_draw_box_with_txywhc as valuatorDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
valuatorDrawBox :: Valuator a -> IO ()
valuatorDrawBox valuator = withObject valuator $ \valuatorPtr -> valuatorDrawBox' valuatorPtr
valuatorDrawBoxWithBoxtype :: Valuator a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
valuatorDrawBoxWithBoxtype valuator bx c Nothing =
              withObject valuator $ \valuatorPtr -> valuatorDrawBoxWithTC' valuatorPtr bx c
valuatorDrawBoxWithBoxtype valuator bx c (Just r) =
              withObject valuator $ \valuatorPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                valuatorDrawBoxWithTXywhC' valuatorPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Valuator_draw_backdrop as valuatorDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
valuatorDrawBackdrop :: Valuator a -> IO ()
valuatorDrawBackdrop valuator = withObject valuator $ \valuatorPtr -> valuatorDrawBackdrop' valuatorPtr

{# fun Fl_Valuator_draw_focus as valuatorDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Valuator_draw_focus_with_txywh as valuatorDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
valuatorDrawFocus :: Valuator a -> Maybe (Boxtype, Rectangle) -> IO ()
valuatorDrawFocus valuator Nothing =
                withObject valuator $ \ valuatorPtr -> valuatorDrawFocus' valuatorPtr
valuatorDrawFocus valuator (Just (bx, r)) =
                withObject valuator $ \valuatorPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  valuatorDrawFocusWithTXywh' valuatorPtr bx x_pos y_pos w_pos h_pos
