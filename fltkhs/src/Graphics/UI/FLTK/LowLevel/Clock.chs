{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Clock
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
#include "Fl_ClockC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Clock_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Clock orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> draw'' clockPtr
{#fun Fl_Clock_handle as clockHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Clock orig impl where
  runOp _ _ clock event = withRef clock (\p -> clockHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Clock_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Clock orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> show' clockPtr
{# fun Fl_Clock_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Clock orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> hide' clockPtr
{# fun Fl_Clock_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Clock orig impl where
  runOp _ _ clock rectangle = withRef clock $ \clockPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' clockPtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Clock"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Clock"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Clock' -> 'IO' ()
--
-- handle :: 'Ref' 'Clock' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Clock' -> 'IO' ()
--
-- resize :: 'Ref' 'Clock' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Clock' -> 'IO' ()
-- @
