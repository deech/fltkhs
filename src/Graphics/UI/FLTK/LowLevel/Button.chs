{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Button
    (
     buttonCustom,
     buttonNew,
     ButtonType(..),
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Fl_Button functions
     --
     -- $Fl_Buttonfunctions
    )
where
#include "Fl_C.h"
#include "Fl_ButtonC.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_OverriddenButton_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenButton_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
buttonCustom :: Rectangle                         -- ^ The bounds of this button
             -> Maybe T.Text                      -- ^ The button label
             -> Maybe (Ref Button -> IO ())       -- ^ Optional custom drawing function
             -> Maybe (CustomWidgetFuncs Button)  -- ^ Optional custom widget functions
             -> IO (Ref Button)
buttonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

buttonNew :: Rectangle -> Maybe T.Text -> IO (Ref Button)
buttonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (Destroy ()) Button orig impl where
  runOp _ _ button = swapRef button $
                 \buttonPtr ->
                  widgetDestroy' buttonPtr >>
                  return nullPtr
{# fun Fl_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (DrawSuper ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> drawSuper' buttonPtr
{# fun Fl_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ ((Event ->  IO (Either UnknownEvent ())))) => Op (HandleSuper ()) Button orig impl where
  runOp _ _ button event = withRef button $ \buttonPtr -> handleSuper' buttonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{#fun Fl_Button_handle as buttonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ ((Event -> IO (Either UnknownEvent ())))) => Op (Handle ()) Button orig impl where
  runOp _ _ button event = withRef button (\p -> buttonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((Rectangle -> IO ()))) => Op (ResizeSuper ()) Button orig impl where
  runOp _ _ button rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef button $ \buttonPtr -> resizeSuper' buttonPtr x_pos y_pos width height
{# fun Fl_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((Rectangle -> IO ()))) => Op (Resize ()) Button orig impl where
  runOp _ _ button rectangle = withRef button $ \buttonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' buttonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (HideSuper ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> hideSuper' buttonPtr
{# fun Fl_Button_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (Hide ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> hide' buttonPtr
{# fun Fl_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (ShowWidgetSuper ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> showSuper' buttonPtr
{# fun Fl_Button_show as buttonShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ ((IO ()))) => Op (ShowWidget ()) Button orig impl where
  runOp _ _ button = withRef button $ (\p -> buttonShow' p)
{# fun Fl_Button_value as value' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (( IO (Bool)))) => Op (GetValue ()) Button orig impl where
  runOp _ _ b = withRef b $ \bPtr -> value' bPtr
{# fun Fl_Button_set_value as setValue' { id `Ptr ()', fromBool `Bool' } -> `Bool' toBool #}
instance (impl ~ ((Bool ->  IO (Bool)))) => Op (SetValue ()) Button orig impl where
  runOp _ _ b v = withRef b $ \bPtr -> setValue' bPtr v
{# fun Fl_Button_clear as clear' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (( IO (Bool)))) => Op (Clear ()) Button orig impl where
  runOp _ _ b = withRef b $ \bPtr -> clear' bPtr
{# fun Fl_Button_setonly as setonly' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (Setonly ()) Button orig impl where
  runOp _ _ b = withRef b $ \bPtr -> setonly' bPtr
{# fun Fl_Button_get_shortcut as getShortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ (( IO (Maybe ShortcutKeySequence)))) => Op (GetShortcut ()) Button orig impl where
  runOp _ _ b = withRef b $ \bPtr -> getShortcut' bPtr >>= return . cIntToKeySequence
{# fun Fl_Button_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((ShortcutKeySequence ->  IO ()))) => Op (SetShortcut ()) Button orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)
{# fun Fl_Button_down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ (( IO (Boxtype)))) => Op (GetDownBox ()) Button orig impl where
  runOp _ _ b = withRef b $ \bPtr -> downBox' bPtr
{# fun Fl_Button_set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((Boxtype ->  IO ()))) => Op (SetDownBox ()) Button orig impl where
  runOp _ _ b boxtype = withRef b $ \bPtr -> setDownBox' bPtr boxtype
{# fun Fl_Button_down_color as downColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (( IO (Color)))) => Op (GetDownColor ()) Button orig impl where
  runOp _ _ b = withRef b $ \bPtr -> downColor' bPtr
{# fun Fl_Button_set_down_color as setDownColor' { id `Ptr ()',cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((Color ->  IO ()))) => Op (SetDownColor ()) Button orig impl where
  runOp _ _ b c = withRef b $ \bPtr -> setDownColor' bPtr c
{# fun Fl_Button_draw_box as buttonDrawBox' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_box_with_tc as buttonDrawBoxWithTC' { id `Ptr ()', cFromEnum `Boxtype', cFromColor`Color' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_box_with_txywhc as buttonDrawBoxWithTXywhC' { id `Ptr ()', cFromEnum `Boxtype', `Int',`Int',`Int',`Int', cFromColor `Color' } -> `()' supressWarningAboutRes #}
instance (impl ~ ((IO ()))) => Op (DrawBox ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> buttonDrawBox' buttonPtr
instance (impl ~ (( Boxtype -> Color -> Maybe Rectangle -> IO ()))) => Op (DrawBoxWithBoxtype ()) Button orig impl where
  runOp _ _ button bx c Nothing =
              withRef button $ \buttonPtr -> buttonDrawBoxWithTC' buttonPtr bx c
  runOp _ _ button bx c (Just r) =
              withRef button $ \buttonPtr -> do
                let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                buttonDrawBoxWithTXywhC' buttonPtr bx x_pos y_pos w_pos h_pos c
{# fun Fl_Button_draw_backdrop as buttonDrawBackdrop' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (DrawBackdrop ()) Button orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> buttonDrawBackdrop' buttonPtr
{# fun Fl_Button_draw_focus as buttonDrawFocus' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
{# fun Fl_Button_draw_focus_with_txywh as buttonDrawFocusWithTXywh' { id `Ptr ()', cFromEnum `Boxtype', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Maybe (Boxtype, Rectangle) -> IO ())) => Op (DrawFocus ()) Button orig impl where
  runOp _ _ button Nothing =
                withRef button $ \ buttonPtr -> buttonDrawFocus' buttonPtr
  runOp _ _ button (Just (bx, r)) =
                withRef button $ \buttonPtr -> do
                  let (x_pos,y_pos,w_pos,h_pos) = fromRectangle r
                  buttonDrawFocusWithTXywh' buttonPtr bx x_pos y_pos w_pos h_pos

{# fun Fl_Button_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (ButtonType))) => Op (GetType_ ()) Button orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . cToEnum
{# fun Fl_Button_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (ButtonType ->  IO ())) => Op (SetType ()) Button orig impl where
   runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (cFromEnum t)

-- $Fl_Buttonfunctions
-- @
-- clear :: 'Ref' 'Button' -> ( 'IO' ('Bool'))
--
-- destroy :: 'Ref' 'Button' -> ( 'IO' ())
--
-- drawBackdrop :: 'Ref' 'Button' -> 'IO' ()
--
-- drawBox :: 'Ref' 'Button' -> ('IO' ())
--
-- drawBoxWithBoxtype :: 'Ref' 'Button' -> ( 'Boxtype' -> 'Color' -> 'Maybe' 'Rectangle' -> 'IO' ())
--
-- drawFocus :: 'Ref' 'Button' -> 'Maybe' ('Boxtype', 'Rectangle') -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Button' -> ( 'IO' ())
--
-- getDownBox :: 'Ref' 'Button' -> ( 'IO' ('Boxtype'))
--
-- getDownColor :: 'Ref' 'Button' -> ( 'IO' ('Color'))
--
-- getShortcut :: 'Ref' 'Button' -> ( 'IO' ('Maybe' 'ShortcutKeySequence'))
--
-- getType_ :: 'Ref' 'Button' -> 'IO' ('ButtonType')
--
-- getValue :: 'Ref' 'Button' -> ( 'IO' ('Bool'))
--
-- handle :: 'Ref' 'Button' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- handleSuper :: 'Ref' 'Button' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- hide :: 'Ref' 'Button' -> ( 'IO' ())
--
-- hideSuper :: 'Ref' 'Button' -> ( 'IO' ())
--
-- resize :: 'Ref' 'Button' -> ('Rectangle' -> 'IO' ())
--
-- resizeSuper :: 'Ref' 'Button' -> ('Rectangle' -> 'IO' ())
--
-- setDownBox :: 'Ref' 'Button' -> ('Boxtype' -> 'IO' ())
--
-- setDownColor :: 'Ref' 'Button' -> ('Color' -> 'IO' ())
--
-- setShortcut :: 'Ref' 'Button' -> ('ShortcutKeySequence' -> 'IO' ())
--
-- setType :: 'Ref' 'Button' -> 'ButtonType' -> 'IO' ()
--
-- setValue :: 'Ref' 'Button' -> ('Bool' -> 'IO' ('Bool'))
--
-- setonly :: 'Ref' 'Button' -> ( 'IO' ())
--
-- showWidget :: 'Ref' 'Button' -> ('IO' ())
--
-- showWidgetSuper :: 'Ref' 'Button' -> ( 'IO' ())

-- Available in FLTK 1.3.4 only:


-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--
-- @
