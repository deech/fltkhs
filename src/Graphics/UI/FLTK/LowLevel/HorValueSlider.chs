{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.HorValueSlider
    (
     horValueSliderNew
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Hor_Value_Slider_New as horValueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Hor_Value_Slider_New_WithLabel as horValueSliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
horValueSliderNew :: Rectangle -> Maybe String -> IO (Ref HorValueSlider)
horValueSliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> horValueSliderNew' x_pos y_pos width height >>=
                             toRef
        Just l -> horValueSliderNewWithLabel' x_pos y_pos width height l >>=
                             toRef

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Slider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ValueSlider"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.HorValueSlider"
-- @