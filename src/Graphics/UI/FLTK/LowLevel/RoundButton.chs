{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.RoundButton
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
#include "Fl_Round_ButtonC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedRound_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> draw'' roundButtonPtr
{#fun Fl_DerivedRound_Button_handle as roundButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) RoundButton orig impl where
  runOp _ _ roundButton event = withRef roundButton (\p -> roundButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedRound_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) RoundButton orig impl where
  runOp _ _ roundButton rectangle = withRef roundButton $ \roundButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' roundButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedRound_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> show' roundButtonPtr
{# fun Fl_DerivedRound_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) RoundButton orig impl where
  runOp _ _ roundButton = withRef roundButton $ \roundButtonPtr -> hide' roundButtonPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.RoundButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RoundButton"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- handle :: 'Ref' 'RoundButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'RoundButton' -> 'IO' ()
--
-- resize :: 'Ref' 'RoundButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'RoundButton' -> 'IO' ()
-- @
