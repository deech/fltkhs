{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Spinner
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
#include "Fl_SpinnerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Spinner_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> draw'' spinnerPtr
{#fun Fl_Spinner_handle as spinnerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Spinner orig impl where
  runOp _ _ spinner event = withRef spinner (\p -> spinnerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Spinner_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Spinner orig impl where
  runOp _ _ spinner rectangle = withRef spinner $ \spinnerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' spinnerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Spinner_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> hide' spinnerPtr
{# fun Fl_Spinner_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> show' spinnerPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Spinner"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Spinner"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Spinner' -> 'IO' ()
--
-- handle :: 'Ref' 'Spinner' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Spinner' -> 'IO' ()
--
-- resize :: 'Ref' 'Spinner' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Spinner' -> 'IO' ()
-- @
