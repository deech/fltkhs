{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Scrollbar
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Widget Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ScrollbarC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy


{# fun Fl_Scrollbar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> draw'' scrollbarPtr
{# fun Fl_Scrollbar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Scrollbar orig impl where
  runOp _ _ scrollbar rectangle = withRef scrollbar $ \scrollbarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' scrollbarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Scrollbar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> hide' scrollbarPtr
{# fun Fl_Scrollbar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Scrollbar orig impl where
  runOp _ _ scrollbar = withRef scrollbar $ \scrollbarPtr -> show' scrollbarPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Slider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Scrollbar"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Scrollbar"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- hide :: 'Ref' 'Scrollbar' -> 'IO' ()
--
-- resize :: 'Ref' 'Scrollbar' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Scrollbar' -> 'IO' ()
-- @
