{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueSlider
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
#include "Fl_Value_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Value_Slider_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> draw'' valueSliderPtr
{#fun Fl_Value_Slider_handle as valueSliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueSlider orig impl where
  runOp _ _ valueSlider event = withRef valueSlider (\p -> valueSliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Slider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueSlider orig impl where
  runOp _ _ valueSlider rectangle = withRef valueSlider $ \valueSliderPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueSliderPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Slider_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> hide' valueSliderPtr
{# fun Fl_Value_Slider_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> show' valueSliderPtr

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
-- "Graphics.UI.FLTK.LowLevel.Base.ValueSlider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ValueSlider"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- handle :: 'Ref' 'ValueSlider' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueSlider' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueSlider' -> 'IO' ()
-- @
