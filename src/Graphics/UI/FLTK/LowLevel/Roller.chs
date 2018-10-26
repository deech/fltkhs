{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Roller
    (
     -- * Constructor
     rollerNew,
     rollerCustom
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
#include "Fl_RollerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenRoller_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenRoller_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
rollerCustom ::
       Rectangle                         -- ^ The bounds of this Roller
    -> Maybe T.Text                      -- ^ The Roller label
    -> Maybe (Ref Roller -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Roller)      -- ^ Optional custom widget functions
    -> IO (Ref Roller)
rollerCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Roller_New as rollerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Roller_New_WithLabel as rollerNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
rollerNew :: Rectangle -> Maybe T.Text -> IO (Ref Roller)
rollerNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Roller_Destroy as rollerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Roller orig impl where
  runOp _ _ roller = swapRef roller $ \rollerPtr -> do
    rollerDestroy' rollerPtr
    return nullPtr
{# fun Fl_Roller_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> draw'' rollerPtr
{# fun Fl_Roller_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> drawSuper' rollerPtr
{#fun Fl_Roller_handle as rollerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Roller orig impl where
  runOp _ _ roller event = withRef roller (\p -> rollerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Roller_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Roller orig impl where
  runOp _ _ roller event = withRef roller $ \rollerPtr -> handleSuper' rollerPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Roller_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Roller orig impl where
  runOp _ _ roller rectangle = withRef roller $ \rollerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' rollerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Roller_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Roller orig impl where
  runOp _ _ roller rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef roller $ \rollerPtr -> resizeSuper' rollerPtr x_pos y_pos width height
{# fun Fl_Roller_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> hide' rollerPtr
{# fun Fl_Roller_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> hideSuper' rollerPtr
{# fun Fl_Roller_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> show' rollerPtr
{# fun Fl_Roller_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> showSuper' rollerPtr
-- $functions
-- @
-- destroy :: 'Ref' 'Roller' -> 'IO' ()
--
-- draw :: 'Ref' 'Roller' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Roller' -> 'IO' ()
--
-- handle :: 'Ref' 'Roller' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Roller' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Roller' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Roller' -> 'IO' ()
--
-- resize :: 'Ref' 'Roller' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Roller' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Roller' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Roller' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Roller"
-- @
