{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Wizard
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
#include "Fl_WizardC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Wizard_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> draw'' wizardPtr
{#fun Fl_Wizard_handle as wizardHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Wizard orig impl where
  runOp _ _ wizard event = withRef wizard (\p -> wizardHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Wizard_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Wizard orig impl where
  runOp _ _ wizard rectangle = withRef wizard $ \wizardPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' wizardPtr x_pos y_pos w_pos h_pos
{# fun Fl_Wizard_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> hide' wizardPtr
{# fun Fl_Wizard_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Wizard orig impl where
  runOp _ _ wizard = withRef wizard $ \wizardPtr -> show' wizardPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Wizard"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Wizard"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Wizard' -> 'IO' ()
--
-- handle :: 'Ref' 'Wizard' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Wizard' -> 'IO' ()
--
-- resize :: 'Ref' 'Wizard' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Wizard' -> 'IO' ()
-- @
