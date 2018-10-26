{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Slider
    (
     sliderNew,
     sliderCustom
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
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
{# fun Fl_OverriddenSlider_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Slider_New_WithLabel as sliderNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
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
instance (impl ~ (IO ())) => Op (Destroy ()) Slider orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        sliderDestroy' winPtr
                                        return nullPtr
{# fun Fl_Slider_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Bounds ()) Slider orig impl where
  runOp _ _ slider a b = withRef slider $ \sliderPtr -> bounds' sliderPtr a b
{# fun Fl_Slider_scrollvalue as scrollvalue' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `Int' #}
instance (impl ~ (Y -> Lines -> LineNumber -> Lines ->  IO (Int))) => Op (Scrollvalue ()) Slider orig impl where
  runOp _ _ slider (Y pos) (Lines slider_size) (LineNumber first) (Lines total) = withRef slider $ \sliderPtr -> scrollvalue' sliderPtr pos slider_size first total
{# fun Fl_Slider_set_slider_size as setSliderSize' { id `Ptr ()' } -> `Float' #}
instance (impl ~ ( IO (Double))) => Op (GetSliderSize ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> setSliderSize' sliderPtr >>= return . realToFrac
{# fun Fl_Slider_slider_size as sliderSize' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetSliderSize ()) Slider orig impl where
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

{# fun Fl_Slider_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> draw'' sliderPtr
{# fun Fl_Slider_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> drawSuper' sliderPtr
{#fun Fl_Slider_handle as sliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Slider orig impl where
  runOp _ _ slider event = withRef slider (\p -> sliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Slider_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Slider orig impl where
  runOp _ _ slider event = withRef slider $ \sliderPtr -> handleSuper' sliderPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Slider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Slider orig impl where
  runOp _ _ slider rectangle = withRef slider $ \sliderPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' sliderPtr x_pos y_pos w_pos h_pos
{# fun Fl_Slider_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Slider orig impl where
  runOp _ _ slider rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef slider $ \sliderPtr -> resizeSuper' sliderPtr x_pos y_pos width height
{# fun Fl_Slider_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> hide' sliderPtr
{# fun Fl_Slider_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> hideSuper' sliderPtr
{# fun Fl_Slider_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> show' sliderPtr
{# fun Fl_Slider_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Slider orig impl where
  runOp _ _ slider = withRef slider $ \sliderPtr -> showSuper' sliderPtr

-- $functions
-- @
-- bounds :: 'Ref' 'Slider' -> 'Double' -> 'Double' -> 'IO' ()
--
-- destroy :: 'Ref' 'Slider' -> 'IO' ()
--
-- draw :: 'Ref' 'Slider' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Slider' -> 'IO' ()
--
-- getSlider :: 'Ref' 'Slider' -> 'IO' ('Boxtype')
--
-- getSliderSize :: 'Ref' 'Slider' -> 'IO' ('Double')
--
-- getType_ :: 'Ref' 'Slider' -> 'IO' ('SliderType')
--
-- handle :: 'Ref' 'Slider' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Slider' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Slider' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Slider' -> 'IO' ()
--
-- resize :: 'Ref' 'Slider' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Slider' -> 'Rectangle' -> 'IO' ()
--
-- scrollvalue :: 'Ref' 'Slider' -> 'Y' -> 'Lines' -> 'LineNumber' -> 'Lines' -> 'IO' ('Int')
--
-- setSlider :: 'Ref' 'Slider' -> 'Boxtype' -> 'IO' ()
--
-- setSliderSize :: 'Ref' 'Slider' -> 'Double' -> 'IO' ()
--
-- setType :: 'Ref' 'Slider' -> 'SliderType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Slider' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Slider' -> 'IO' ()
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
