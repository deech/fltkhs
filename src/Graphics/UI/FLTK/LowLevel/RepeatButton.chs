{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.RepeatButton
    (
    repeatButtonNew,
    repeatButtonCustom
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
#include "Fl_Repeat_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenRepeat_Button_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenRepeat_Button_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
repeatButtonCustom ::
       Rectangle                         -- ^ The bounds of this RepeatButton
    -> Maybe T.Text                      -- ^ The RepeatButton label
    -> Maybe (Ref RepeatButton -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs RepeatButton)      -- ^ Optional custom widget functions
    -> IO (Ref RepeatButton)
repeatButtonCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Repeat_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Repeat_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
repeatButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref RepeatButton)
repeatButtonNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Repeat_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) RepeatButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr

{#fun Fl_Repeat_Button_deactivate as deactivate' { id `Ptr ()'} -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Deactivate ()) RepeatButton orig impl where
  runOp _ _ button = withRef button (\p -> deactivate' p )
{# fun Fl_Repeat_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> draw'' repeatButtonPtr
{# fun Fl_Repeat_Button_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> drawSuper' repeatButtonPtr
{#fun Fl_Repeat_Button_handle as repeatButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) RepeatButton orig impl where
  runOp _ _ repeatButton event = withRef repeatButton (\p -> repeatButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Repeat_Button_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) RepeatButton orig impl where
  runOp _ _ repeatButton event = withRef repeatButton $ \repeatButtonPtr -> handleSuper' repeatButtonPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Repeat_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) RepeatButton orig impl where
  runOp _ _ repeatButton rectangle = withRef repeatButton $ \repeatButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' repeatButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Repeat_Button_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) RepeatButton orig impl where
  runOp _ _ repeatButton rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef repeatButton $ \repeatButtonPtr -> resizeSuper' repeatButtonPtr x_pos y_pos width height
{# fun Fl_Repeat_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> hide' repeatButtonPtr
{# fun Fl_Repeat_Button_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> hideSuper' repeatButtonPtr
{# fun Fl_Repeat_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> show' repeatButtonPtr
{# fun Fl_Repeat_Button_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> showSuper' repeatButtonPtr

-- $functions
-- @
-- deactivate :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- destroy :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- draw :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- handle :: 'Ref' 'RepeatButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'RepeatButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- resize :: 'Ref' 'RepeatButton' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'RepeatButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'RepeatButton' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RepeatButton"
-- @
