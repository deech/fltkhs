{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuButton
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
#include "Fl_Menu_ButtonC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Menu_Button_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> draw'' menuButtonPtr
{#fun Fl_Menu_Button_handle as menuButtonHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuButton orig impl where
  runOp _ _ menuButton event = withRef menuButton (\p -> menuButtonHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Menu_Button_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) MenuButton orig impl where
  runOp _ _ menuButton rectangle = withRef menuButton $ \menuButtonPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menuButtonPtr x_pos y_pos w_pos h_pos
{# fun Fl_Menu_Button_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> hide' menuButtonPtr
{# fun Fl_Menu_Button_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) MenuButton orig impl where
  runOp _ _ menuButton = withRef menuButton $ \menuButtonPtr -> show' menuButtonPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuButton"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuButton' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuButton' -> 'IO' ()
--
-- resize :: 'Ref' 'MenuButton' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuButton' -> 'IO' ()
-- @
