{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Scrolled
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
#include "Fl_ScrollC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Scroll_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Scrolled orig impl where
  runOp _ _ scrolled = withRef scrolled $ \scrolledPtr -> draw'' scrolledPtr
{#fun Fl_Scroll_handle as scrolledHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Scrolled orig impl where
  runOp _ _ scrolled event = withRef scrolled (\p -> scrolledHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Scroll_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Scrolled orig impl where
  runOp _ _ scrolled rectangle = withRef scrolled $ \scrolledPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' scrolledPtr x_pos y_pos w_pos h_pos
{# fun Fl_Scroll_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Scrolled orig impl where
  runOp _ _ scrolled = withRef scrolled $ \scrolledPtr -> hide' scrolledPtr
{# fun Fl_Scroll_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Scrolled orig impl where
  runOp _ _ scrolled = withRef scrolled $ \scrolledPtr -> show' scrolledPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Scrolled"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Scrolled' -> 'IO' ()
--
-- handle :: 'Ref' 'Scrolled' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Scrolled' -> 'IO' ()
--
-- resize :: 'Ref' 'Scrolled' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Scrolled' -> 'IO' ()
-- @
