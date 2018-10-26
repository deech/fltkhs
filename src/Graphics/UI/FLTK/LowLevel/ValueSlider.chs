{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueSlider
       (
         -- * Constructor
         valueSliderNew,
         valueSliderCustom
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
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenValue_Slider_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_Value_Slider_New_WithLabel as valueSliderNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
valueSliderNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueSlider)
valueSliderNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

-- {# fun Fl_Hor_Value_Slider_New as horValueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
-- {# fun Fl_Hor_Value_Slider_New_WithLabel as horValueSliderNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
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
{# fun Fl_Value_Slider_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) ValueSlider orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textfont' value_sliderPtr
{# fun Fl_Value_Slider_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) ValueSlider orig impl where
  runOp _ _ value_slider s = withRef value_slider $ \value_sliderPtr -> setTextfont' value_sliderPtr s
{# fun Fl_Value_Slider_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) ValueSlider orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textsize' value_sliderPtr >>= return . FontSize
{# fun Fl_Value_Slider_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) ValueSlider orig impl where
  runOp _ _ value_slider (FontSize s) = withRef value_slider $ \value_sliderPtr -> setTextsize' value_sliderPtr s
{# fun Fl_Value_Slider_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) ValueSlider orig impl where
  runOp _ _ value_slider = withRef value_slider $ \value_sliderPtr -> textcolor' value_sliderPtr
{# fun Fl_Value_Slider_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) ValueSlider orig impl where
  runOp _ _ value_slider s = withRef value_slider $ \value_sliderPtr -> setTextcolor' value_sliderPtr s
{# fun Fl_Value_Slider_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> draw'' valueSliderPtr
{# fun Fl_Value_Slider_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> drawSuper' valueSliderPtr
{#fun Fl_Value_Slider_handle as valueSliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueSlider orig impl where
  runOp _ _ valueSlider event = withRef valueSlider (\p -> valueSliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Value_Slider_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) ValueSlider orig impl where
  runOp _ _ valueSlider event = withRef valueSlider $ \valueSliderPtr -> handleSuper' valueSliderPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Value_Slider_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ValueSlider orig impl where
  runOp _ _ valueSlider rectangle = withRef valueSlider $ \valueSliderPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valueSliderPtr x_pos y_pos w_pos h_pos
{# fun Fl_Value_Slider_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) ValueSlider orig impl where
  runOp _ _ valueSlider rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valueSlider $ \valueSliderPtr -> resizeSuper' valueSliderPtr x_pos y_pos width height
{# fun Fl_Value_Slider_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> hide' valueSliderPtr
{# fun Fl_Value_Slider_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> hideSuper' valueSliderPtr
{# fun Fl_Value_Slider_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> show' valueSliderPtr
{# fun Fl_Value_Slider_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) ValueSlider orig impl where
  runOp _ _ valueSlider = withRef valueSlider $ \valueSliderPtr -> showSuper' valueSliderPtr

-- $functions
-- @
-- destroy :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- draw :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'ValueSlider' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'ValueSlider' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'ValueSlider' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'ValueSlider' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'ValueSlider' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- resize :: 'Ref' 'ValueSlider' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'ValueSlider' -> 'Rectangle' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'ValueSlider' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueSlider' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueSlider' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'ValueSlider' -> 'IO' ()
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
-- "Graphics.UI.FLTK.LowLevel.ValueSlider"
-- @
