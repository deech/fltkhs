{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tabs
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
#include "Fl_TabsC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Tabs_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> draw'' tabsPtr
{#fun Fl_Tabs_handle as tabsHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Tabs orig impl where
  runOp _ _ tabs event = withRef tabs (\p -> tabsHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tabs_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Tabs orig impl where
  runOp _ _ tabs rectangle = withRef tabs $ \tabsPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' tabsPtr x_pos y_pos w_pos h_pos
{# fun Fl_Tabs_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> hide' tabsPtr
{# fun Fl_Tabs_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> show' tabsPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Tabs"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Tabs"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Tabs' -> 'IO' ()
--
-- handle :: 'Ref' 'Tabs' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Tabs' -> 'IO' ()
--
-- resize :: 'Ref' 'Tabs' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Tabs' -> 'IO' ()
-- @
