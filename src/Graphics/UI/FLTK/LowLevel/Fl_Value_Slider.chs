{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Value_Slider
       (
         -- * Constructor
         valueSliderNew
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Value_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Value_Slider_New as valueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Slider_New_WithLabel as valueSliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueSliderNew :: Rectangle -> Maybe String -> IO (Ref ValueSlider)
valueSliderNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueSliderNew' x_pos y_pos width height >>= toRef
        Just l -> valueSliderNewWithLabel' x_pos y_pos width height l >>= toRef

-- {# fun Fl_Hor_Value_Slider_New as horValueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
-- {# fun Fl_Hor_Value_Slider_New_WithLabel as horValueSliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
-- horValueSliderNew :: Rectangle -> Maybe String -> IO (HorValueSlider ())
-- horValueSliderNew rectangle l'=
--     let (x_pos, y_pos, width, height) = fromRectangle rectangle
--     in case l' of
--         Nothing -> horValueSliderNew' x_pos y_pos width height >>= toRef
--         Just l -> horValueSliderNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Value_Slider_Destroy as valueSliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ValueSlider orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    valueSliderDestroy' winPtr
    return nullPtr
{#fun Fl_Value_Slider_handle as valueSliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) ValueSlider orig impl where
  runOp _ _ valueSlider event = withRef valueSlider (\p -> valueSliderHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Value_Slider_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueSlider orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textfont' value_sliderPtr
{# fun unsafe Fl_Value_Slider_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueSlider orig impl where
  runOp _ _ value_slider s = withRef value_slider $ \value_sliderPtr -> setTextfont' value_sliderPtr s
{# fun unsafe Fl_Value_Slider_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueSlider orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textsize' value_sliderPtr >>= return . FontSize
{# fun unsafe Fl_Value_Slider_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueSlider orig impl where
  runOp _ _ value_slider (FontSize s) = withRef value_slider $ \value_sliderPtr -> setTextsize' value_sliderPtr s
{# fun unsafe Fl_Value_Slider_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueSlider orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textcolor' value_sliderPtr
{# fun unsafe Fl_Value_Slider_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueSlider orig impl where
  runOp _ _ value_slider s = withRef value_slider $ \value_sliderPtr -> setTextcolor' value_sliderPtr s
