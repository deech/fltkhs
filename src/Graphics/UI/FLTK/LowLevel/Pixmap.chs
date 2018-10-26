{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Pixmap
 (
  pixmapNew
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
#include "Fl_PixmapC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Pixmap_New as flPixmapNew' { id `Ptr (Ptr CChar)'} -> `Ptr ()' id #}
pixmapNew :: PixmapHs -> IO (Ref Pixmap)
pixmapNew pixmap = withPixmap pixmap (\ptr -> flPixmapNew' ptr >>= toRef)
{# fun Fl_Pixmap_Destroy as flPixmapDestroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ (IO ())) => Op (Destroy ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> flPixmapDestroy' pixmapPtr
{# fun Fl_Pixmap_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetW ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> w' pixmapPtr
{# fun Fl_Pixmap_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetH ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> h' pixmapPtr
{# fun Fl_Pixmap_d as d' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetD ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> d' pixmapPtr
{# fun Fl_Pixmap_ld as ld' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetLd ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> ld' pixmapPtr
{# fun Fl_Pixmap_count as count' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetCount ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> count' pixmapPtr
{# fun Fl_Pixmap_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Pixmap_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( Maybe Size -> IO (Maybe (Ref Pixmap)))) => Op (Copy ()) Pixmap orig impl where
  runOp _ _ pixmap size' = case size' of
    Just (Size (Width w) (Height h)) -> withRef pixmap $ \pixmapPtr -> copyWithWH' pixmapPtr w h >>= toMaybeRef
    Nothing -> withRef pixmap $ \pixmapPtr -> copy' pixmapPtr >>= toMaybeRef
{# fun Fl_Pixmap_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
instance (impl ~ (Color -> Float ->  IO ())) => Op (ColorAverage ()) Pixmap orig impl where
  runOp _ _ pixmap c i = withRef pixmap $ \pixmapPtr -> colorAverage' pixmapPtr c i
{# fun Fl_Pixmap_inactive as inactive' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Inactive ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> inactive' pixmapPtr
{# fun Fl_Pixmap_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Desaturate ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> desaturate' pixmapPtr

{# fun Fl_Pixmap_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_Pixmap_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_Pixmap_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_Pixmap_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Position -> Size -> Maybe X -> Maybe Y -> IO ())) => Op (DrawResize ()) Pixmap orig impl where
  runOp _ _ pixmap (Position (X x) (Y y)) (Size (Width w) (Height h)) xOffset yOffset =
    case (xOffset, yOffset) of
      (Just (X xOff), Just (Y yOff)) ->
        withRef pixmap $ \pixmapPtr -> drawWithCxCy' pixmapPtr x y w h (fromIntegral xOff) (fromIntegral yOff)
      (Just (X xOff), Nothing) ->
        withRef pixmap $ \pixmapPtr -> drawWithCx' pixmapPtr x y w h (fromIntegral xOff)
      (Nothing, Just (Y yOff)) ->
        withRef pixmap $ \pixmapPtr -> drawWithCy' pixmapPtr x y w h (fromIntegral yOff)
      (Nothing, Nothing) ->
        withRef pixmap $ \pixmapPtr -> drawWith' pixmapPtr x y w h

{# fun Fl_Pixmap_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (Draw ()) Pixmap orig impl where
  runOp _ _ image (Position (X x_pos') (Y y_pos')) = withRef image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun Fl_Pixmap_uncache as uncache' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Uncache ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> uncache' pixmapPtr

-- $functions
-- @
--
-- colorAverage :: 'Ref' 'Pixmap' -> 'Color' -> 'Float' -> 'IO' ()
--
-- copy :: 'Ref' 'Pixmap' -> 'Maybe' 'Size' -> 'IO' ('Maybe' ('Ref' 'Pixmap'))
--
-- desaturate :: 'Ref' 'Pixmap' -> 'IO' ()
--
-- destroy :: 'Ref' 'Pixmap' -> 'IO' ()
--
-- draw :: 'Ref' 'Pixmap' -> 'Position' -> 'IO' ()
--
-- drawResize :: 'Ref' 'Pixmap' -> 'Position' -> 'Size' -> 'Maybe' 'X' -> 'Maybe' 'Y' -> 'IO' ()
--
-- getCount :: 'Ref' 'Pixmap' -> 'IO' ('Int')
--
-- getD :: 'Ref' 'Pixmap' -> 'IO' ('Int')
--
-- getH :: 'Ref' 'Pixmap' -> 'IO' ('Int')
--
-- getLd :: 'Ref' 'Pixmap' -> 'IO' ('Int')
--
-- getW :: 'Ref' 'Pixmap' -> 'IO' ('Int')
--
-- inactive :: 'Ref' 'Pixmap' -> 'IO' ()
--
-- uncache :: 'Ref' 'Pixmap' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Pixmap"
-- @
