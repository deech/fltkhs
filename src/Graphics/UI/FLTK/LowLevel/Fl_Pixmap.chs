{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Pixmap
 (
  pixmapNew
 )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_PixmapC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun unsafe Fl_Pixmap_New as flPixmapNew' { id `Ptr (Ptr CChar)'} -> `Ptr ()' id #}
pixmapNew :: PixmapHs -> IO (Ref Pixmap)
pixmapNew pixmap = withPixmap pixmap (\ptr -> flPixmapNew' ptr >>= toRef)
{# fun unsafe Fl_Pixmap_Destroy as flPixmapDestroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ (IO ())) => Op (Destroy ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> flPixmapDestroy' pixmapPtr
{# fun unsafe Fl_Pixmap_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetW ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> w' pixmapPtr
{# fun unsafe Fl_Pixmap_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetH ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> h' pixmapPtr
{# fun unsafe Fl_Pixmap_d as d' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetD ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> d' pixmapPtr
{# fun unsafe Fl_Pixmap_ld as ld' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetLd ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> ld' pixmapPtr
{# fun unsafe Fl_Pixmap_count as count' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetCount ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> count' pixmapPtr
{# fun unsafe Fl_Pixmap_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
{# fun unsafe Fl_Pixmap_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( Maybe Size -> IO (Maybe (Ref Pixmap)))) => Op (Copy ()) Pixmap orig impl where
  runOp _ _ pixmap size' = do
     ref' <- case size' of
              Just (Size (Width w) (Height h)) -> withRef pixmap $ \pixmapPtr -> copyWithWH' pixmapPtr w h
              Nothing -> withRef pixmap $ \pixmapPtr -> copy' pixmapPtr
     if ref' == nullPtr then return Nothing else (toRef ref' >>= return . Just)
{# fun unsafe Fl_Pixmap_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
instance (impl ~ (Color -> Float ->  IO ())) => Op (ColorAverage ()) Pixmap orig impl where
  runOp _ _ pixmap c i = withRef pixmap $ \pixmapPtr -> colorAverage' pixmapPtr c i
{# fun unsafe Fl_Pixmap_inactive as inactive' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Inactive ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> inactive' pixmapPtr
{# fun unsafe Fl_Pixmap_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Desaturate ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> desaturate' pixmapPtr

{# fun unsafe Fl_Pixmap_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Pixmap_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Pixmap_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Pixmap_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
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

{# fun unsafe Fl_Pixmap_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (Draw ()) Pixmap orig impl where
  runOp _ _ image (Position (X x_pos') (Y y_pos')) = withRef image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun unsafe Fl_Pixmap_uncache as uncache' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Uncache ()) Pixmap orig impl where
  runOp _ _ pixmap = withRef pixmap $ \pixmapPtr -> uncache' pixmapPtr
