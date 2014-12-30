{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Button
    (
     buttonNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenButton_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenButton_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
buttonNew :: Rectangle -> Maybe String -> Maybe (CustomWidgetFuncs Button) -> IO (Ref Button)
buttonNew rectangle l' funcs' =
  widgetMaker
    rectangle
    l'
    funcs'
    widgetNew'
    widgetNewWithLabel'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Button (IO ()) where
  runOp _ button = swapRef button $
                 \buttonPtr ->
                  widgetDestroy' buttonPtr >>
                  return nullPtr
{# fun Fl_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawSuper ()) Button (  IO (())) where
  runOp _ button = withRef button $ \buttonPtr -> drawSuper' buttonPtr
{# fun Fl_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance Op (HandleSuper ()) Button ( Int ->  IO (Int)) where
  runOp _ button event = withRef button $ \buttonPtr -> handleSuper' buttonPtr event
{#fun Fl_Button_handle as buttonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Button ( Event -> IO Int) where
  runOp _ button event = withRef button (\p -> buttonHandle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) Button ( Rectangle -> IO (())) where
  runOp _ button rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef button $ \buttonPtr -> resizeSuper' buttonPtr x_pos y_pos width height
{# fun Fl_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) Button ( Rectangle -> IO (())) where
  runOp _ button rectangle = withRef button $ \buttonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' buttonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (HideSuper ()) Button (  IO (())) where
  runOp _ button = withRef button $ \buttonPtr -> hideSuper' buttonPtr
{# fun Fl_Button_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Hide ()) Button (  IO (())) where
  runOp _ button = withRef button $ \buttonPtr -> hide' buttonPtr
{# fun Fl_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (ShowWidgetSuper ()) Button (  IO (())) where
  runOp _ button = withRef button $ \buttonPtr -> showSuper' buttonPtr
{# fun Fl_Button_show as buttonShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance Op (ShowWidget ()) Button ( IO ()) where
  runOp _ button = withRef button $ (\p -> buttonShow' p)
{# fun unsafe Fl_Button_value as value' { id `Ptr ()' } -> `Bool' cToBool #}
instance Op (GetValue ()) Button (  IO (Bool)) where
  runOp _ b = withRef b $ \bPtr -> value' bPtr
{# fun unsafe Fl_Button_set_value as setValue' { id `Ptr ()', fromBool `Bool' } -> `Bool' toBool #}
instance Op (SetValue ()) Button ( Bool ->  IO (Bool)) where
  runOp _ b v = withRef b $ \bPtr -> setValue' bPtr v
{# fun unsafe Fl_Button_set as set' { id `Ptr ()' } -> `Bool' cToBool #}
instance Op (Set ()) Button (  IO (Bool)) where
  runOp _ b = withRef b $ \bPtr -> set' bPtr
{# fun unsafe Fl_Button_clear as clear' { id `Ptr ()' } -> `Bool' cToBool #}
instance Op (Clear ()) Button (  IO (Bool)) where
  runOp _ b = withRef b $ \bPtr -> clear' bPtr
{# fun unsafe Fl_Button_setonly as setonly' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Setonly ()) Button (  IO (())) where
  runOp _ b = withRef b $ \bPtr -> setonly' bPtr
{# fun unsafe Fl_Button_get_shortcut as getShortcut' { id `Ptr ()' } -> `FlShortcut' fromIntegral #}
instance Op (GetShortcut ()) Button (  IO (FlShortcut)) where
  runOp _ b = withRef b $ \bPtr -> getShortcut' bPtr
{# fun unsafe Fl_Button_set_shortcut as setShortcut' { id `Ptr ()',fromIntegral `Int' } -> `()' supressWarningAboutRes #}
instance Op (SetShortcut ()) Button ( Int ->  IO (())) where
  runOp _ b s = withRef b $ \bPtr -> setShortcut' bPtr s
{# fun unsafe Fl_Button_down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance Op (GetDownBox ()) Button (  IO (Boxtype)) where
  runOp _ b = withRef b $ \bPtr -> downBox' bPtr
{# fun unsafe Fl_Button_set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance Op (SetDownBox ()) Button ( Boxtype ->  IO (())) where
  runOp _ b boxtype = withRef b $ \bPtr -> setDownBox' bPtr boxtype
{# fun unsafe Fl_Button_down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
instance Op (GetDownColor ()) Button (  IO (Color)) where
  runOp _ b = withRef b $ \bPtr -> downColor' bPtr
{# fun unsafe Fl_Button_set_down_color as setDownColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (SetDownColor ()) Button ( Color ->  IO (())) where
  runOp _ b c = withRef b $ \bPtr -> setDownColor' bPtr c
{# fun Fl_Button_draw_box as buttonDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_box_with_tc as buttonDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_box_with_txywhc as buttonDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance Op (DrawBox ()) Button ( IO ()) where
  runOp _ button = withRef button $ \buttonPtr -> buttonDrawBox' buttonPtr
instance Op (DrawBoxWithBoxtype ()) Button (Boxtype -> Color -> Maybe Rectangle -> IO ()) where
  runOp _ button bx c Nothing =
              withRef button $ \buttonPtr -> buttonDrawBoxWithTC' buttonPtr bx c
  runOp _ button bx c (Just r) =
              withRef button $ \buttonPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                buttonDrawBoxWithTXywhC' buttonPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Button_draw_backdrop as buttonDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (DrawBackdrop ()) Button ( IO ()) where
  runOp _ button = withRef button $ \buttonPtr -> buttonDrawBackdrop' buttonPtr
{# fun Fl_Button_draw_focus as buttonDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_focus_with_txywh as buttonDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance Op (DrawFocus ()) Button ( Maybe (Boxtype, Rectangle) -> IO ()) where
  runOp _ button Nothing =
                withRef button $ \ buttonPtr -> buttonDrawFocus' buttonPtr
  runOp _ button (Just (bx, r)) =
                withRef button $ \buttonPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  buttonDrawFocusWithTXywh' buttonPtr bx x_pos y_pos w_pos h_pos
