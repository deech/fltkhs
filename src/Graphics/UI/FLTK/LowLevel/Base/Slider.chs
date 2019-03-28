{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Slider
    (
     sliderNew,
     sliderCustom
  , drawSliderBase
  , handleSliderBase
  , resizeSliderBase
  , hideSliderBase
  , showWidgetSliderBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
{# fun Fl_OverriddenSlider_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSlider_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
sliderCustom ::
       Rectangle                         -- ^ The bounds of this Slider
    -> Maybe T.Text                      -- ^ The Slider label
    -> Maybe (Ref Slider -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Slider)      -- ^ Optional custom widget functions
    -> IO (Ref Slider)
sliderCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'
{# fun Fl_Slider_New as sliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Slider_New_WithLabel as sliderNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
sliderNew :: Rectangle -> Maybe T.Text -> IO (Ref Slider)
sliderNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Slider_Destroy as sliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) SliderBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        sliderDestroy' winPtr
                                        return nullPtr
{# fun Fl_Slider_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Bounds ()) SliderBase orig impl where
  runOp _ _ slider a b = withRef slider $ \sliderPtr -> bounds' sliderPtr a b
{# fun Fl_Slider_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
instance (impl ~ (Y -> Lines -> LineNumber -> Lines ->  IO (Int))) => Op (Scrollvalue ()) SliderBase orig impl where
  runOp _ _ slider (Y pos) (Lines slider_size) (LineNumber first) (Lines total) = withRef slider $ \sliderPtr -> scrollvalue' sliderPtr pos slider_size first total
{# fun Fl_Slider_set_slider_size as setSliderSize' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Double))) => Op (GetSliderSize ()) SliderBase orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> setSliderSize' sliderPtr >>= return . realToFrac
{# fun Fl_Slider_slider_size as sliderSize' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetSliderSize ()) SliderBase orig impl where
  runOp _ _ slider v = withRef slider $ \sliderPtr -> sliderSize' sliderPtr v
{# fun Fl_Slider_slider as slider' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype))) => Op (GetSlider ()) SliderBase orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> slider' sliderPtr
{# fun Fl_Slider_set_slider as setSlider' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetSlider ()) SliderBase orig impl where
  runOp _ _ slider c = withRef slider $ \sliderPtr -> setSlider' sliderPtr c
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (SliderType ->  IO ())) => Op (SetType ()) SliderBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (SliderType)) => Op (GetType_ ()) SliderBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

{# fun Fl_Slider_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawSliderBase ::  Ref SliderBase -> IO ()
drawSliderBase slider = withRef slider $ \sliderPtr -> drawSuper' sliderPtr
{# fun Fl_Slider_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleSliderBase :: Ref SliderBase -> Event ->  IO (Either UnknownEvent ())
handleSliderBase slider event = withRef slider $ \sliderPtr -> handleSuper' sliderPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Slider_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeSliderBase :: Ref SliderBase -> Rectangle -> IO ()
resizeSliderBase slider rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef slider $ \sliderPtr -> resizeSuper' sliderPtr x_pos y_pos width height
{# fun Fl_Slider_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideSliderBase ::  Ref SliderBase -> IO ()
hideSliderBase slider = withRef slider $ \sliderPtr -> hideSuper' sliderPtr
{# fun Fl_Slider_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetSliderBase ::  Ref SliderBase -> IO ()
showWidgetSliderBase slider = withRef slider $ \sliderPtr -> showSuper' sliderPtr

{# fun Fl_DerivedSlider_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) SliderBase orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> draw'' sliderPtr

{#fun Fl_DerivedSlider_handle as sliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) SliderBase orig impl where
  runOp _ _ slider event = withRef slider (\p -> sliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedSlider_show as show' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (ShowWidget ()) SliderBase orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> show' sliderPtr

{# fun Fl_DerivedSlider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) SliderBase orig impl where
  runOp _ _ slider rectangle = withRef slider $ \sliderPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' sliderPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedSlider_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) SliderBase orig impl where
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
-- @

-- $functions
-- @
-- bounds :: 'Ref' 'SliderBase' -> 'Double' -> 'Double' -> 'IO' ()
--
-- destroy :: 'Ref' 'SliderBase' -> 'IO' ()
--
-- draw :: 'Ref' 'SliderBase' -> 'IO' ()
--
-- getSlider :: 'Ref' 'SliderBase' -> 'IO' ('Boxtype')
--
-- getSliderSize :: 'Ref' 'SliderBase' -> 'IO' ('Double')
--
-- getType_ :: 'Ref' 'SliderBase' -> 'IO' ('SliderType')
--
-- handle :: 'Ref' 'SliderBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'SliderBase' -> 'IO' ()
--
-- resize :: 'Ref' 'SliderBase' -> 'Rectangle' -> 'IO' ()
--
-- scrollvalue :: 'Ref' 'SliderBase' -> 'Y' -> 'Lines' -> 'LineNumber' -> 'Lines' -> 'IO' ('Int')
--
-- setSlider :: 'Ref' 'SliderBase' -> 'Boxtype' -> 'IO' ()
--
-- setSliderSize :: 'Ref' 'SliderBase' -> 'Double' -> 'IO' ()
--
-- setType :: 'Ref' 'SliderBase' -> 'SliderType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'SliderBase' -> 'IO' ()
-- @
