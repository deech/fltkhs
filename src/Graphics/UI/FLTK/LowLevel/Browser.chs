{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Browser
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
#include "Fl_BrowserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Browser_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> draw'' browserPtr
{#fun Fl_Browser_handle as browserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Browser orig impl where
  runOp _ _ browser event = withRef browser (\p -> browserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Browser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Browser orig impl where
  runOp _ _ browser rectangle = withRef browser $ \browserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' browserPtr x_pos y_pos w_pos h_pos
{# fun Fl_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hide' browserPtr
{# fun Fl_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> show' browserPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Browser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Browser"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Browser' -> 'IO' ()
--
-- handle :: 'Ref' 'Browser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Browser' -> 'IO' ()
--
-- resize :: 'Ref' 'Browser' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Browser' -> 'IO' ()
-- @
