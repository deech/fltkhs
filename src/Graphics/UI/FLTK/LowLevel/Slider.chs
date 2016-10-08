{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Slider
    (
     sliderNew
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
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Slider_New as sliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Slider_New_WithLabel as sliderNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
sliderNew :: Rectangle -> Maybe T.Text -> IO (Ref Slider)
sliderNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> sliderNew' x_pos y_pos width height >>=
                             toRef
        Just l -> sliderNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun Fl_Slider_Destroy as sliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Slider orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        sliderDestroy' winPtr
                                        return nullPtr
{#fun Fl_Slider_handle as sliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Slider orig impl where
  runOp _ _ slider event = withRef slider (\p -> sliderHandle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Slider_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Bounds ()) Slider orig impl where
  runOp _ _ slider a b = withRef slider $ \sliderPtr -> bounds' sliderPtr a b
{# fun Fl_Slider_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
instance (impl ~ (Int -> Int -> Int -> Int ->  IO (Int))) => Op (Scrollvalue ()) Slider orig impl where
  runOp _ _ slider pos slider_size first total = withRef slider $ \sliderPtr -> scrollvalue' sliderPtr pos slider_size first total
{# fun Fl_Slider_set_slider_size as setSliderSize' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Float))) => Op (SetSliderSize ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> setSliderSize' sliderPtr
{# fun Fl_Slider_slider_size as sliderSize' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (GetSliderSize ()) Slider orig impl where
  runOp _ _ slider v = withRef slider $ \sliderPtr -> sliderSize' sliderPtr v
{# fun Fl_Slider_slider as slider' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype))) => Op (GetSlider ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> slider' sliderPtr
{# fun Fl_Slider_set_slider as setSlider' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetSlider ()) Slider orig impl where
  runOp _ _ slider c = withRef slider $ \sliderPtr -> setSlider' sliderPtr c
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (SliderType ->  IO ())) => Op (SetType ()) Slider orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (SliderType)) => Op (GetType_ ()) Slider orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger
-- $functions
-- @
--
-- bounds :: 'Ref' 'Slider' -> 'Double' -> 'Double' -> 'IO' ()
--
-- destroy :: 'Ref' 'Slider' -> 'IO' ()
--
-- getSlider :: 'Ref' 'Slider' -> 'IO' 'Boxtype'
--
-- getSliderSize :: 'Ref' 'Slider' -> 'Double' -> 'IO' ()
--
-- handle :: 'Ref' 'Slider' -> 'Event' -> 'IO' 'Int'
--
-- scrollvalue :: 'Ref' 'Slider' -> 'Int' -> 'Int' -> 'Int' -> 'Int' -> 'IO' 'Int'
--
-- setSlider :: 'Ref' 'Slider' -> 'Boxtype' -> 'IO' ()
--
-- setSliderSize :: 'Ref' 'Slider' -> 'IO' 'Float'
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
-- @
