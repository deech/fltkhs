{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Output
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
#include "Fl_OutputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Output_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> draw'' outputPtr
{#fun Fl_Output_handle as outputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Output orig impl where
  runOp _ _ output event = withRef output (\p -> outputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Output orig impl where
  runOp _ _ output rectangle = withRef output $ \outputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' outputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Output_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> hide' outputPtr
{# fun Fl_Output_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Output orig impl where
  runOp _ _ output = withRef output $ \outputPtr -> show' outputPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Output"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Output"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Output' -> 'IO' ()
--
-- handle :: 'Ref' 'Output' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Output' -> 'IO' ()
--
-- resize :: 'Ref' 'Output' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Output' -> 'IO' ()
-- @
