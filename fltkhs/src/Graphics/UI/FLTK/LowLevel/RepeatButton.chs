{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.RepeatButton
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
#include "Fl_Repeat_ButtonC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedRepeat_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> draw'' repeatButtonPtr
{#fun Fl_DerivedRepeat_Button_handle as repeatButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) RepeatButton orig impl where
  runOp _ _ repeatButton event = withRef repeatButton (\p -> repeatButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedRepeat_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) RepeatButton orig impl where
  runOp _ _ repeatButton rectangle = withRef repeatButton $ \repeatButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' repeatButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedRepeat_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> show' repeatButtonPtr
{# fun Fl_DerivedRepeat_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) RepeatButton orig impl where
  runOp _ _ repeatButton = withRef repeatButton $ \repeatButtonPtr -> hide' repeatButtonPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.RepeatButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RepeatButton"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- handle :: 'Ref' 'RepeatButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'RepeatButton' -> 'IO' ()
--
-- resize :: 'Ref' 'RepeatButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'RepeatButton' -> 'IO' ()
-- @
