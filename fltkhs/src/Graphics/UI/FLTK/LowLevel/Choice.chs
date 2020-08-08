{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Choice
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
#include "Fl_ChoiceC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{#fun Fl_Choice_handle as choiceHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Choice orig impl where
  runOp _ _ choice event = withRef choice (\p -> choiceHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Choice_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Choice orig impl where
  runOp _ _ choice = withRef choice $ \choicePtr -> draw'' choicePtr
{# fun Fl_Choice_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Choice orig impl where
  runOp _ _ choice rectangle = withRef choice $ \choicePtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' choicePtr x_pos y_pos w_pos h_pos
{# fun Fl_Choice_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Choice orig impl where
  runOp _ _ choice = withRef choice $ \choicePtr -> hide' choicePtr
{# fun Fl_Choice_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Choice orig impl where
  runOp _ _ choice = withRef choice $ \choicePtr -> show' choicePtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Choice"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Choice"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Choice' -> 'IO' ()
--
-- handle :: 'Ref' 'Choice' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Choice' -> 'IO' ()
--
-- resize :: 'Ref' 'Choice' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Choice' -> 'IO' ()
-- @
