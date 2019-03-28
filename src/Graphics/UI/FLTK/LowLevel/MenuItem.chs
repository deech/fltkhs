{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuItem
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * MenuItem Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Menu_ItemC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedMenu_Item_draw as draw' { id `Ptr ()',`Int',`Int',`Int',`Int',id `Ptr ()' } -> `()' #}
instance (Parent a MenuPrim, impl ~ (Rectangle -> Ref a ->  IO ())) => Op (Draw ()) MenuItem orig impl where
  runOp _ _ menu_item rectangle menu' =
    let (x_pos', y_pos', width', height') = fromRectangle rectangle in
    withRef menu_item $ \menu_itemPtr ->
    withRef menu' $ \menuPtr -> draw' menu_itemPtr x_pos' y_pos' width' height' menuPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.MenuItem"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuItem"
-- @

-- $functions
-- @
-- draw:: ('Parent' a 'MenuPrim') => 'Ref' 'MenuItem' -> 'Rectangle' -> 'Ref' a -> 'IO' ()
-- @
