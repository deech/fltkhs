{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TextDisplay
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
#include "Fl_Text_DisplayC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Text_Display_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TextDisplay orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> hide' textDisplayPtr
{# fun Fl_Text_Display_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) TextDisplay orig impl where
  runOp _ _ textDisplay rectangle = withRef textDisplay $ \textDisplayPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' textDisplayPtr x_pos y_pos w_pos h_pos
{#fun Fl_Text_Display_handle as textDisplayHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) TextDisplay orig impl where
  runOp _ _ textDisplay event = withRef textDisplay (\p -> textDisplayHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Text_Display_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TextDisplay orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> show' textDisplayPtr
{# fun Fl_Text_Display_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TextDisplay orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> draw'' textDisplayPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TextDisplay"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'TextDisplay' -> 'IO' ()
--
-- handle :: 'Ref' 'TextDisplay' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TextDisplay' -> 'IO' ()
--
-- resize :: 'Ref' 'TextDisplay' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TextDisplay' -> 'IO' ()
-- @
