{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tile
    (
     -- * Constructor
     tileNew,
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
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Tile_New as tileNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Tile_New_WithLabel as tileNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
tileNew :: Rectangle -> Maybe String -> IO (Ref Tile)
tileNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> tileNew' x_pos y_pos width height >>=
                             toRef
        Just l -> tileNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Tile_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) Tile orig impl where
  runOp _ _ tile rectangle = withRef tile $ \tilePtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' tilePtr x_pos y_pos w_pos h_pos

{# fun Fl_Tile_position as setPosition' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Rectangle ->  IO ())) => Op (SetPosition ()) Tile orig impl where
  runOp _ _ tile rectangle = withRef tile $ \tilePtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    setPosition' tilePtr x_pos y_pos w_pos h_pos

{#fun Fl_Tile_handle as tileHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Tile orig impl where
  runOp _ _ tile event = withRef tile (\p -> tileHandle' p (fromIntegral . fromEnum $ event))

-- $functions
-- @
-- handle :: 'Ref' 'Tile' -> 'Event' -> 'IO' 'Int'
--
-- resize :: 'Ref' 'Tile' -> 'Rectangle' -> 'IO' ()
--
-- setPosition :: 'Ref' 'Tile' -> 'Rectangle' -> 'IO' ()
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
