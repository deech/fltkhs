{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.NiceSlider
    (
     niceSliderNew
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Nice_Slider_New as niceSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Nice_Slider_New_WithLabel as niceSliderNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
niceSliderNew :: Rectangle -> Maybe String -> IO (Ref NiceSlider)
niceSliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> niceSliderNew' x_pos y_pos width height >>=
                             toRef
        Just l -> niceSliderNewWithLabel' x_pos y_pos width height l >>=
                             toRef
-- $functions
-- @
--

-- @

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
-- "Graphics.UI.FLTK.LowLevel.NiceSlider"
-- @