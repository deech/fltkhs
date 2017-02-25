{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ValueSlider
       (
         -- * Constructor
         valueSliderNew
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

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_Value_Slider_New as valueSliderNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Value_Slider_New_WithLabel as valueSliderNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
valueSliderNew :: Rectangle -> Maybe T.Text -> IO (Ref ValueSlider)
valueSliderNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valueSliderNew' x_pos y_pos width height >>= toRef
        Just l -> valueSliderNewWithLabel' x_pos y_pos width height l >>= toRef

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
{#fun Fl_Value_Slider_handle as valueSliderHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValueSlider orig impl where
  runOp _ _ valueSlider event = withRef valueSlider (\p -> valueSliderHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
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

-- $functions
-- @
--
-- destroy :: 'Ref' 'ValueSlider' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'ValueSlider' -> 'IO' 'Color'
--
-- getTextfont :: 'Ref' 'ValueSlider' -> 'IO' 'Font'
--
-- getTextsize :: 'Ref' 'ValueSlider' -> 'IO' 'FontSize'
--
-- handle :: 'Ref' 'ValueSlider' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- setTextcolor :: 'Ref' 'ValueSlider' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'ValueSlider' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'ValueSlider' -> 'FontSize' -> 'IO' ()
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
