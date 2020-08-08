{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuBar
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
#include "Fl_Menu_BarC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Menu_Bar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> draw'' menuBarPtr
{#fun Fl_Menu_Bar_handle as menuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuBar orig impl where
  runOp _ _ menuBar event = withRef menuBar (\p -> menuBarHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Menu_Bar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) MenuBar orig impl where
  runOp _ _ menuBar rectangle = withRef menuBar $ \menuBarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menuBarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Menu_Bar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> hide' menuBarPtr
{# fun Fl_Menu_Bar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> show' menuBarPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.MenuBar"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuBar"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- resize :: 'Ref' 'MenuBar' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuBar' -> 'IO' ()
-- @
