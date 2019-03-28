{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Roller
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
#include "Fl_RollerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Roller_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> draw'' rollerPtr
{#fun Fl_Roller_handle as rollerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Roller orig impl where
  runOp _ _ roller event = withRef roller (\p -> rollerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Roller_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Roller orig impl where
  runOp _ _ roller rectangle = withRef roller $ \rollerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' rollerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Roller_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> hide' rollerPtr
{# fun Fl_Roller_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Roller orig impl where
  runOp _ _ roller = withRef roller $ \rollerPtr -> show' rollerPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Roller"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Roller"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Roller' -> 'IO' ()
--
-- handle :: 'Ref' 'Roller' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Roller' -> 'IO' ()
--
-- resize :: 'Ref' 'Roller' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Roller' -> 'IO' ()
-- @
