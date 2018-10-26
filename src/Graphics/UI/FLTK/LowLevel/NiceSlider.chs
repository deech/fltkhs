{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.NiceSlider
    (
     niceSliderNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Widget
import qualified Data.Text as T
{# fun Fl_Nice_Slider_New as niceSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Nice_Slider_New_WithLabel as niceSliderNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
niceSliderNew :: Rectangle -> Maybe T.Text -> IO (Ref NiceSlider)
niceSliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> niceSliderNew' x_pos y_pos width height >>=
                             toRef
        Just l -> do
          ref <- niceSliderNewWithLabel' x_pos y_pos width height l >>= toRef
          setFlag ref WidgetFlagCopiedLabel
          setFlag ref WidgetFlagCopiedTooltip
          return ref

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
