{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SimpleTerminal
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
#include "Fl_Simple_TerminalC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Simple_Terminal_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) SimpleTerminal orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> draw'' simpleTerminalPtr
{#fun Fl_Simple_Terminal_handle as simpleTerminalHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SimpleTerminal orig impl where
  runOp _ _ simpleTerminal event = withRef simpleTerminal (\p -> simpleTerminalHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Simple_Terminal_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) SimpleTerminal orig impl where
  runOp _ _ simpleTerminal rectangle = withRef simpleTerminal $ \simpleTerminalPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' simpleTerminalPtr x_pos y_pos w_pos h_pos
{# fun Fl_Simple_Terminal_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) SimpleTerminal orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> hide' simpleTerminalPtr
{# fun Fl_Simple_Terminal_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) SimpleTerminal orig impl where
  runOp _ _ simpleTerminal = withRef simpleTerminal $ \simpleTerminalPtr -> show' simpleTerminalPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.SimpleTerminal"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SimpleTerminal"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'SimpleTerminal' -> 'IO' ()
--
-- handle :: 'Ref' 'SimpleTerminal' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SimpleTerminal' -> 'IO' ()
--
-- resize :: 'Ref' 'SimpleTerminal' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SimpleTerminal' -> 'IO' ()
-- @
