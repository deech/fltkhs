{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Adjuster
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
#include "Fl_AdjusterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Adjuster_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> draw'' adjusterPtr
{#fun Fl_Adjuster_handle as adjusterHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Adjuster orig impl where
  runOp _ _ adjuster event = withRef adjuster (\p -> adjusterHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Adjuster_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Adjuster orig impl where
  runOp _ _ adjuster rectangle = withRef adjuster $ \adjusterPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' adjusterPtr x_pos y_pos w_pos h_pos
{# fun Fl_Adjuster_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> hide' adjusterPtr
{# fun Fl_Adjuster_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> show' adjusterPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Adjuster"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Adjuster"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- handle :: 'Ref' 'Adjuster' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- resize :: 'Ref' 'Adjuster' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Adjuster' -> 'IO' ()
-- @
