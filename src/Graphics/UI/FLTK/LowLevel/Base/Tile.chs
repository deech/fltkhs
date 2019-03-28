{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Tile
    (
     -- * Constructor
     tileNew,
     tileCustom
  , drawTileBase
  , handleTileBase
  , resizeTileBase
  , hideTileBase
  , showWidgetTileBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
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
instance (impl ~ (Rectangle ->  IO ())) => Op (SetPosition ()) TileBase orig impl where
  runOp _ _ tile rectangle = withRef tile $ \tilePtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    setPosition' tilePtr x_pos y_pos w_pos h_pos

{# fun Fl_Tile_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawTileBase ::  Ref TileBase -> IO ()
drawTileBase tile = withRef tile $ \tilePtr -> drawSuper' tilePtr
{# fun Fl_Tile_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleTileBase :: Ref TileBase -> Event ->  IO (Either UnknownEvent ())
handleTileBase tile event = withRef tile $ \tilePtr -> handleSuper' tilePtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Tile_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeTileBase :: Ref TileBase -> Rectangle -> IO ()
resizeTileBase tile rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef tile $ \tilePtr -> resizeSuper' tilePtr x_pos y_pos width height
{# fun Fl_Tile_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideTileBase ::  Ref TileBase -> IO ()
hideTileBase tile = withRef tile $ \tilePtr -> hideSuper' tilePtr
{# fun Fl_Tile_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetTileBase ::  Ref TileBase -> IO ()
showWidgetTileBase tile = withRef tile $ \tilePtr -> showSuper' tilePtr

{# fun Fl_Tile_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TileBase orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> draw'' tilePtr
{#fun Fl_Tile_handle as tileHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) TileBase orig impl where
  runOp _ _ tile event = withRef tile (\p -> tileHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tile_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TileBase orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> show' tilePtr
{# fun Fl_Tile_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TileBase orig impl where
  runOp _ _ tile = withRef tile $ \tilePtr -> hide' tilePtr
{# fun Fl_Tile_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) TileBase orig impl where
  runOp _ _ tile rectangle = withRef tile $ \tilePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' tilePtr x_pos y_pos w_pos h_pos


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Tile"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'TileBase' -> 'IO' ()
--
-- handle :: 'Ref' 'TileBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TileBase' -> 'IO' ()
--
-- resize :: 'Ref' 'TileBase' -> 'Rectangle' -> 'IO' ()
--
-- setPosition :: 'Ref' 'TileBase' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TileBase' -> 'IO' ()
-- @
