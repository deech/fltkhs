{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.CheckButton
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
#include "Fl_Check_ButtonC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedCheck_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> draw'' checkButtonPtr
{#fun Fl_DerivedCheck_Button_handle as checkButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) CheckButton orig impl where
  runOp _ _ checkButton event = withRef checkButton (\p -> checkButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedCheck_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) CheckButton orig impl where
  runOp _ _ checkButton rectangle = withRef checkButton $ \checkButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' checkButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedCheck_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> show' checkButtonPtr
{# fun Fl_DerivedCheck_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) CheckButton orig impl where
  runOp _ _ checkButton = withRef checkButton $ \checkButtonPtr -> hide' checkButtonPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.LightButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.CheckButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.CheckButton"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- handle :: 'Ref' 'CheckButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'CheckButton' -> 'IO' ()
--
-- resize :: 'Ref' 'CheckButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'CheckButton' -> 'IO' ()
-- @
