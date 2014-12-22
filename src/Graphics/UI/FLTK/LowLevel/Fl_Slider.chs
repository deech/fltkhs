{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Slider
    (
     sliderNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Slider_New as sliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Slider_New_WithLabel as sliderNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
sliderNew :: Rectangle -> Maybe String -> IO (Ref Slider)
sliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> sliderNew' x_pos y_pos width height >>=
                             toRef
        Just l -> sliderNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun Fl_Slider_Destroy as sliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Slider ( IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
                                        sliderDestroy' winPtr
                                        return nullPtr
{#fun Fl_Slider_handle as sliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Slider ( Event -> IO Int) where
  runOp _ slider event = withRef slider (\p -> sliderHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Slider_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance Op (GetBounds ()) Slider ( Double -> Double ->  IO (())) where
  runOp _ slider a b = withRef slider $ \sliderPtr -> bounds' sliderPtr a b
{# fun unsafe Fl_Slider_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
instance Op (Scrollvalue ()) Slider ( Int -> Int -> Int -> Int ->  IO (Int)) where
  runOp _ slider pos slider_size first total = withRef slider $ \sliderPtr -> scrollvalue' sliderPtr pos slider_size first total
{# fun unsafe Fl_Slider_set_slider_size as setSliderSize' { id `Ptr ()' } -> `Float' #}
instance Op (SetSliderSize ()) Slider (  IO (Float)) where
  runOp _ slider = withRef slider $ \sliderPtr -> setSliderSize' sliderPtr
{# fun unsafe Fl_Slider_slider_size as sliderSize' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance Op (GetSliderSize ()) Slider ( Double ->  IO (())) where
  runOp _ slider v = withRef slider $ \sliderPtr -> sliderSize' sliderPtr v
{# fun unsafe Fl_Slider_slider as slider' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance Op (GetSlider ()) Slider (  IO (Boxtype)) where
  runOp _ slider = withRef slider $ \sliderPtr -> slider' sliderPtr
{# fun unsafe Fl_Slider_set_slider as setSlider' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance Op (SetSlider ()) Slider ( Boxtype ->  IO (())) where
  runOp _ slider c = withRef slider $ \sliderPtr -> setSlider' sliderPtr c
