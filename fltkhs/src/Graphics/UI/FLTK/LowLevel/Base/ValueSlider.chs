{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.ValueSlider
       (
         -- * Constructor
         valueSliderNew,
         valueSliderCustom
  , drawValueSliderBase
  , handleValueSliderBase
  , resizeValueSliderBase
  , hideValueSliderBase
  , showWidgetValueSliderBase
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
#include "Fl_Value_SliderC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenValue_Slider_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValue_Slider_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valueSliderCustom ::
       Rectangle                         -- ^ The bounds of this ValueSlider
    -> Maybe T.Text                      -- ^ The ValueSlider label
    -> Maybe (Ref ValueSlider -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs ValueSlider)      -- ^ Optional custom widget functions
    -> IO (Ref ValueSlider)
valueSliderCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Value_Slider_New as valueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Slider_New_WithLabel as valueSliderNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
valueSliderNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueSlider)
valueSliderNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Value_Slider_Destroy as valueSliderDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ValueSliderBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    valueSliderDestroy' winPtr
    return nullPtr
{# fun Fl_Value_Slider_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueSliderBase orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textfont' value_sliderPtr
{# fun Fl_Value_Slider_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueSliderBase orig impl where
  runOp _ _ value_slider s = withRef value_slider $ \value_sliderPtr -> setTextfont' value_sliderPtr s
{# fun Fl_Value_Slider_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueSliderBase orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textsize' value_sliderPtr >>= return . FontSize
{# fun Fl_Value_Slider_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueSliderBase orig impl where
  runOp _ _ value_slider (FontSize s) = withRef value_slider $ \value_sliderPtr -> setTextsize' value_sliderPtr s
{# fun Fl_Value_Slider_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueSliderBase orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textcolor' value_sliderPtr
{# fun Fl_Value_Slider_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueSliderBase orig impl where
  runOp _ _ value_slider s = withRef value_slider $ \value_sliderPtr -> setTextcolor' value_sliderPtr s

{# fun Fl_Value_Slider_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawValueSliderBase ::  Ref ValueSliderBase -> IO ()
drawValueSliderBase valueSlider = withRef valueSlider $ \valueSliderPtr -> drawSuper' valueSliderPtr
{# fun Fl_Value_Slider_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleValueSliderBase :: Ref ValueSliderBase -> Event ->  IO (Either UnknownEvent ())
handleValueSliderBase valueSlider event = withRef valueSlider $ \valueSliderPtr -> handleSuper' valueSliderPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Value_Slider_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeValueSliderBase :: Ref ValueSliderBase -> Rectangle -> IO ()
resizeValueSliderBase valueSlider rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valueSlider $ \valueSliderPtr -> resizeSuper' valueSliderPtr x_pos y_pos width height
{# fun Fl_Value_Slider_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideValueSliderBase ::  Ref ValueSliderBase -> IO ()
hideValueSliderBase valueSlider = withRef valueSlider $ \valueSliderPtr -> hideSuper' valueSliderPtr
{# fun Fl_Value_Slider_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetValueSliderBase ::  Ref ValueSliderBase -> IO ()
showWidgetValueSliderBase valueSlider = withRef valueSlider $ \valueSliderPtr -> showSuper' valueSliderPtr

{# fun Fl_Value_Slider_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueSliderBase orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> draw'' valueSliderPtr
{#fun Fl_Value_Slider_handle as valueSliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueSliderBase orig impl where
  runOp _ _ valueSlider event = withRef valueSlider (\p -> valueSliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Slider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueSliderBase orig impl where
  runOp _ _ valueSlider rectangle = withRef valueSlider $ \valueSliderPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueSliderPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Slider_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueSliderBase orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> hide' valueSliderPtr
{# fun Fl_Value_Slider_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueSliderBase orig impl where
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
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ValueSliderBase' -> 'IO' ()
--
-- draw :: 'Ref' 'ValueSliderBase' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'ValueSliderBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'ValueSliderBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'ValueSliderBase' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'ValueSliderBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueSliderBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueSliderBase' -> 'Rectangle' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'ValueSliderBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueSliderBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueSliderBase' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueSliderBase' -> 'IO' ()
-- @
