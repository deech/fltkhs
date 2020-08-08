{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Progress
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
#include "Fl_ProgressC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Progress_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> draw'' progressPtr
{#fun Fl_Progress_handle as progressHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Progress orig impl where
  runOp _ _ progress event = withRef progress (\p -> progressHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Progress_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Progress orig impl where
  runOp _ _ progress rectangle = withRef progress $ \progressPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' progressPtr x_pos y_pos w_pos h_pos
{# fun Fl_Progress_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> hide' progressPtr
{# fun Fl_Progress_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Progress orig impl where
  runOp _ _ progress = withRef progress $ \progressPtr -> show' progressPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Progress"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Progress"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Progress' -> 'IO' ()
--
-- handle :: 'Ref' 'Progress' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Progress' -> 'IO' ()
--
-- resize :: 'Ref' 'Progress' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Progress' -> 'IO' ()
-- @
