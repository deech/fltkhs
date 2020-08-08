{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueOutput
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
#include "Fl_Value_OutputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Value_Output_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> draw'' valueOutputPtr
{#fun Fl_Value_Output_handle as valueOutputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueOutput orig impl where
  runOp _ _ valueOutput event = withRef valueOutput (\p -> valueOutputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Output_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueOutput orig impl where
  runOp _ _ valueOutput rectangle = withRef valueOutput $ \valueOutputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueOutputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Output_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> hide' valueOutputPtr
{# fun Fl_Value_Output_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueOutput orig impl where
  runOp _ _ valueOutput = withRef valueOutput $ \valueOutputPtr -> show' valueOutputPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ValueOutput"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ValueOutput"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- handle :: 'Ref' 'ValueOutput' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueOutput' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueOutput' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueOutput' -> 'IO' ()
-- @
