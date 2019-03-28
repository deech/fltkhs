{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ReturnButton
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
#include "Fl_Return_ButtonC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedReturn_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> draw'' returnButtonPtr
{#fun Fl_DerivedReturn_Button_handle as returnButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ReturnButton orig impl where
  runOp _ _ returnButton event = withRef returnButton (\p -> returnButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_DerivedReturn_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ReturnButton orig impl where
  runOp _ _ returnButton rectangle = withRef returnButton $ \returnButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' returnButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_DerivedReturn_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> show' returnButtonPtr
{# fun Fl_DerivedReturn_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ReturnButton orig impl where
  runOp _ _ returnButton = withRef returnButton $ \returnButtonPtr -> hide' returnButtonPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.ReturnButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ReturnButton"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'ReturnButton' -> 'IO' ()
--
-- handle :: 'Ref' 'ReturnButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ReturnButton' -> 'IO' ()
--
-- resize :: 'Ref' 'ReturnButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ReturnButton' -> 'IO' ()
-- @
