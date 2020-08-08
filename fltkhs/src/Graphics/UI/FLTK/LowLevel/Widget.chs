{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Widget
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
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedWidget_draw as draw' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Draw ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> draw' widgetPtr

{#fun Fl_DerivedWidget_handle as widgetHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Widget orig impl where
  runOp _ _ widget event = withRef widget (\p -> widgetHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedWidget_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> show' widgetPtr

{# fun Fl_DerivedWidget_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) Widget orig impl where
  runOp _ _ widget rectangle = withRef widget $ \widgetPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' widgetPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedWidget_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~  IO ()) => Op (Destroy ()) Widget orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    widgetDestroy' winPtr
    return nullPtr

{# fun Fl_DerivedWidget_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) Widget orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> hide' widgetPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Widget"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'Widget' -> 'IO' ()
--
-- draw :: 'Ref' 'Widget' -> 'IO' ()
--
-- handle :: 'Ref' 'Widget' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Widget' -> 'IO' ()
--
-- resize :: 'Ref' 'Widget' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Widget' -> 'IO' ()
-- @
