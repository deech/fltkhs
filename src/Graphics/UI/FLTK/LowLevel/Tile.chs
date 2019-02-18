{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tile
    (
     -- * Constructor
     tileNew,
     tileCustom
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
#include "Fl_TileC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenTile_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenTile_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
tileCustom ::
       Rectangle                         -- ^ The bounds of this Tile
    -> Maybe T.Text                      -- ^ The Tile label
    -> Maybe (Ref Tile -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Tile)      -- ^ Optional custom widget functions
    -> IO (Ref Tile)
tileCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Tile_New as tileNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Tile_New_WithLabel as tileNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
tileNew :: Rectangle -> Maybe T.Text -> IO (Ref Tile)
tileNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Tile_position as setPosition' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (SetPosition ()) Tile orig impl where
  runOp _ _ tile rectangle = withRef tile $ \tilePtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    setPosition' tilePtr x_pos y_pos w_pos h_pos

{# fun Fl_Tile_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Tile orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> draw'' tilePtr
{# fun Fl_Tile_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Tile orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> drawSuper' tilePtr
{#fun Fl_Tile_handle as tileHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Tile orig impl where
  runOp _ _ tile event = withRef tile (\p -> tileHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tile_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Tile orig impl where
  runOp _ _ tile event = withRef tile $ \tilePtr -> handleSuper' tilePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Tile_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Tile orig impl where
  runOp _ _ tile rectangle = withRef tile $ \tilePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' tilePtr x_pos y_pos w_pos h_pos
{# fun Fl_Tile_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Tile orig impl where
  runOp _ _ tile rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef tile $ \tilePtr -> resizeSuper' tilePtr x_pos y_pos width height
{# fun Fl_Tile_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Tile orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> hide' tilePtr
{# fun Fl_Tile_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Tile orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> hideSuper' tilePtr
{# fun Fl_Tile_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Tile orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> show' tilePtr
{# fun Fl_Tile_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Tile orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> showSuper' tilePtr

-- $functions
-- @
-- draw :: 'Ref' 'Tile' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Tile' -> 'IO' ()
--
-- handle :: 'Ref' 'Tile' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Tile' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Tile' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Tile' -> 'IO' ()
--
-- resize :: 'Ref' 'Tile' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Tile' -> 'Rectangle' -> 'IO' ()
--
-- setPosition :: 'Ref' 'Tile' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Tile' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Tile' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Tile"
-- @
