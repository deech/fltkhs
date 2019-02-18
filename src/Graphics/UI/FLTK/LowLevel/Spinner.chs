{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Spinner
    (
     -- * Constructor
     spinnerNew,
     spinnerCustom,
     SpinnerType(..)
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
     --
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SpinnerC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
#c
enum SpinnerType {
  IntSpinnerType = FL_INT_INPUTC,
  FloatSpinnerType = FL_FLOAT_INPUTC
};
#endc
{#enum SpinnerType {} deriving (Show, Eq) #}
{# fun Fl_OverriddenSpinner_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenSpinner_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
spinnerCustom ::
       Rectangle                         -- ^ The bounds of this Spinner
    -> Maybe T.Text                      -- ^ The Spinner label
    -> Maybe (Ref Spinner -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Spinner)      -- ^ Optional custom widget functions
    -> IO (Ref Spinner)
spinnerCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Spinner_New as spinnerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Spinner_New_WithLabel as spinnerNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
spinnerNew :: Rectangle -> Maybe T.Text -> IO (Ref Spinner)
spinnerNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Spinner_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) Spinner orig impl where
  runOp _ _ spinner text = withRef spinner $ \spinnerPtr -> setTextfont' spinnerPtr text
{# fun Fl_Spinner_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> textfont' spinnerPtr
{# fun Fl_Spinner_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) Spinner orig impl where
  runOp _ _ spinner (FontSize text) = withRef spinner $ \spinnerPtr -> setTextsize' spinnerPtr text
{# fun Fl_Spinner_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> textsize' spinnerPtr >>= return . FontSize
{# fun Fl_Spinner_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) Spinner orig impl where
  runOp _ _ spinner text = withRef spinner $ \spinnerPtr -> setTextcolor' spinnerPtr text
{# fun Fl_Spinner_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> textcolor' spinnerPtr
{# fun Fl_Spinner_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (SpinnerType ->  IO ())) => Op (SetType ()) Spinner orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Spinner_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (SpinnerType)) => Op (GetType_ ()) Spinner orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_Spinner_set_format as set_format' { id `Ptr ()', `CString' } -> `()' supressWarningAboutRes #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetFormat ()) Spinner orig impl where
  runOp _ _ spinner f = withRef spinner $ \spinnerPtr -> copyTextToCString f >>= set_format' spinnerPtr
{# fun Fl_Spinner_format as format' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetFormat ()) Spinner orig impl where
   runOp _ _ spinner = withRef spinner $ \spinnerPtr -> format' spinnerPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Spinner_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetValue ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> value' spinnerPtr
{# fun Fl_Spinner_set_value as setValue' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetValue ()) Spinner orig impl where
  runOp _ _ spinner v = withRef spinner $ \spinnerPtr -> setValue' spinnerPtr v
{# fun Fl_Spinner_set_step as setStep' { id `Ptr ()', `Double'} -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> IO ())) => Op (SetStep ()) Spinner orig impl where
  runOp _ _ spinner r = withRef spinner $ \spinnerPtr -> setStep' spinnerPtr r
{# fun Fl_Spinner_step as step' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetStep ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> step' spinnerPtr
{# fun Fl_Spinner_maximum as maximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMaximum ()) Spinner orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> maximum' valuatorPtr
{# fun Fl_Spinner_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMaximum ()) Spinner orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMaximum' valuatorPtr a
{# fun Fl_Spinner_minimum as minimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMinimum ()) Spinner orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> minimum' valuatorPtr
{# fun Fl_Spinner_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMinimum ()) Spinner orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMinimum' valuatorPtr a
{# fun Fl_Spinner_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Range ()) Spinner orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> range' valuatorPtr a b
{# fun Fl_Spinner_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> draw'' spinnerPtr
{# fun Fl_Spinner_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> drawSuper' spinnerPtr
{#fun Fl_Spinner_handle as spinnerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Spinner orig impl where
  runOp _ _ spinner event = withRef spinner (\p -> spinnerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Spinner_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Spinner orig impl where
  runOp _ _ spinner event = withRef spinner $ \spinnerPtr -> handleSuper' spinnerPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Spinner_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Spinner orig impl where
  runOp _ _ spinner rectangle = withRef spinner $ \spinnerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' spinnerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Spinner_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Spinner orig impl where
  runOp _ _ spinner rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef spinner $ \spinnerPtr -> resizeSuper' spinnerPtr x_pos y_pos width height
{# fun Fl_Spinner_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> hide' spinnerPtr
{# fun Fl_Spinner_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> hideSuper' spinnerPtr
{# fun Fl_Spinner_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> show' spinnerPtr
{# fun Fl_Spinner_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> showSuper' spinnerPtr

{# fun Fl_Spinner_set_wrap as setWrap' { id `Ptr ()', cFromBool `Bool'} -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool -> IO ())) => Op (SetWrap ()) Spinner orig impl where
  runOp _ _ spinner r = withRef spinner $ \spinnerPtr -> setWrap' spinnerPtr r
{# fun Fl_Spinner_wrap as wrap' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetWrap ()) Spinner orig impl where
  runOp _ _ spinner = withRef spinner $ \spinnerPtr -> wrap' spinnerPtr

-- $hierarchy
-- @
--
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Spinner"
--
-- @

-- $functions
-- @
-- draw :: 'Ref' 'Spinner' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Spinner' -> 'IO' ()
--
-- getFormat :: 'Ref' 'Spinner' -> 'IO' ('Maybe' 'T.Text')
--
-- getMaximum :: 'Ref' 'Spinner' -> 'IO' ('Double')
--
-- getMinimum :: 'Ref' 'Spinner' -> 'IO' ('Double')
--
-- getStep :: 'Ref' 'Spinner' -> 'IO' ('Double')
--
-- getTextcolor :: 'Ref' 'Spinner' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'Spinner' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'Spinner' -> 'IO' ('FontSize')
--
-- getType_ :: 'Ref' 'Spinner' -> 'IO' ('SpinnerType')
--
-- getValue :: 'Ref' 'Spinner' -> 'IO' ('Double')
--
-- getWrap :: 'Ref' 'Spinner' -> 'IO' ('Bool')
--
-- handle :: 'Ref' 'Spinner' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Spinner' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Spinner' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Spinner' -> 'IO' ()
--
-- range :: 'Ref' 'Spinner' -> 'Double' -> 'Double' -> 'IO' ()
--
-- resize :: 'Ref' 'Spinner' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Spinner' -> 'Rectangle' -> 'IO' ()
--
-- setFormat :: 'Ref' 'Spinner' -> 'T.Text' -> 'IO' ()
--
-- setMaximum :: 'Ref' 'Spinner' -> 'Double' -> 'IO' ()
--
-- setMinimum :: 'Ref' 'Spinner' -> 'Double' -> 'IO' ()
--
-- setStep :: 'Ref' 'Spinner' -> 'Double' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'Spinner' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'Spinner' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'Spinner' -> 'FontSize' -> 'IO' ()
--
-- setType :: 'Ref' 'Spinner' -> 'SpinnerType' -> 'IO' ()
--
-- setValue :: 'Ref' 'Spinner' -> 'Double' -> 'IO' ()
--
-- setWrap :: 'Ref' 'Spinner' -> 'Bool' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Spinner' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Spinner' -> 'IO' ()
-- @
