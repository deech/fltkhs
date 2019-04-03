{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Slider
    (
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Slider Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_DerivedSlider_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> draw'' sliderPtr

{#fun Fl_DerivedSlider_handle as sliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Slider orig impl where
  runOp _ _ slider event = withRef slider (\p -> sliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedSlider_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> show' sliderPtr

{# fun Fl_DerivedSlider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) Slider orig impl where
  runOp _ _ slider rectangle = withRef slider $ \sliderPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' sliderPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedSlider_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> hide' sliderPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Slider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Slider"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Slider' -> 'IO' ()
--
-- handle :: 'Ref' 'Slider' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Slider' -> 'IO' ()
--
-- resize :: 'Ref' 'Slider' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Slider' -> 'IO' ()
-- @
