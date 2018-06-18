{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.RoundButton
    (
     roundButtonNew,
     roundButtonCustom
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Round_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenRound_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenRound_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
roundButtonCustom ::
       Rectangle                         -- ^ The bounds of this RoundButton
    -> Maybe T.Text                      -- ^ The RoundButton label
    -> Maybe (Ref RoundButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs RoundButton)      -- ^ Optional custom widget functions
    -> IO (Ref RoundButton)
roundButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Round_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Round_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
roundButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref RoundButton)
roundButtonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Round_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ IO ()) => Op (Destroy ()) RoundButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr
{# fun Fl_Round_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> draw'' roundButtonPtr
{# fun Fl_Round_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> drawSuper' roundButtonPtr
{#fun Fl_Round_Button_handle as roundButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) RoundButton orig impl where
  runOp _ _ roundButton event = withRef roundButton (\p -> roundButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Round_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) RoundButton orig impl where
  runOp _ _ roundButton event = withRef roundButton $ \roundButtonPtr -> handleSuper' roundButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Round_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) RoundButton orig impl where
  runOp _ _ roundButton rectangle = withRef roundButton $ \roundButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' roundButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Round_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) RoundButton orig impl where
  runOp _ _ roundButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef roundButton $ \roundButtonPtr -> resizeSuper' roundButtonPtr x_pos y_pos width height
{# fun Fl_Round_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> hide' roundButtonPtr
{# fun Fl_Round_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> hideSuper' roundButtonPtr
{# fun Fl_Round_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> show' roundButtonPtr
{# fun Fl_Round_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> showSuper' roundButtonPtr

-- $functions
-- @
-- destroy :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- draw :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- handle :: 'Ref' 'RoundButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'RoundButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- resize :: 'Ref' 'RoundButton' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'RoundButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'RoundButton' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RoundButton"
-- @
