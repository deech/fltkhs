{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.HorFillSlider
    (
     horFillSliderNew
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
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Base.Widget
{# fun Fl_Hor_Fill_Slider_New as horFillSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Hor_Fill_Slider_New_WithLabel as horFillSliderNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
horFillSliderNew :: Rectangle -> Maybe T.Text -> IO (Ref HorFillSlider)
horFillSliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> horFillSliderNew' x_pos y_pos width height >>=
                             toRef
        Just l -> do
          ref <- copyTextToCString l >>= \l' -> horFillSliderNewWithLabel' x_pos y_pos width height l' >>= toRef
          setFlag ref WidgetFlagCopiedLabel
          setFlag ref WidgetFlagCopiedTooltip
          return ref

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
-- "Graphics.UI.FLTK.LowLevel.Base.HorFillSlider"
-- @
