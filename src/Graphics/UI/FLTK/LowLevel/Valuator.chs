{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Valuator
    (
     -- * Constructor
     valuatorNew,
     valuatorCustom,
     ValuatorType(..),
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
#include "Fl_ValuatorC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Widget
import Data.Ratio
#c
enum ValuatorType {
  VerticalValuatorType = FL_VERTICALC,
  HorizontalValuatorType = FL_HORIZONTALC
};
#endc
{#enum ValuatorType {} deriving (Show, Eq) #}
{# fun Fl_Valuator_New as valuatorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Valuator_New_WithLabel as valuatorNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New_WithLabel as overriddenValuatorNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New as overriddenValuatorNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valuatorCustom :: Rectangle -> Maybe String -> Maybe (Ref Valuator -> IO ()) -> Maybe (CustomWidgetFuncs Valuator) -> IO (Ref Valuator)
valuatorCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    valuatorNew'
    valuatorNewWithLabel'
    overriddenValuatorNew'
    overriddenValuatorNewWithLabel'

valuatorNew :: Rectangle -> Maybe String -> IO (Ref Valuator)
valuatorNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> valuatorNew' x_pos y_pos width height >>=
                             toRef
        Just l -> valuatorNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun Fl_Valuator_Destroy as valuatorDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Valuator orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        valuatorDestroy' winPtr
                                        return nullPtr
{# fun Fl_Valuator_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (Hide ()) Valuator orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> hide' buttonPtr
{# fun Fl_Valuator_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (( IO ()))) => Op (HideSuper ()) Valuator orig impl where
  runOp _ _ button = withRef button $ \buttonPtr -> hideSuper' buttonPtr
{#fun Fl_Valuator_handle as valuatorHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Valuator orig impl where
  runOp _ _ valuator event = withRef valuator (\p -> valuatorHandle' p (fromIntegral . fromEnum $ event))
{#fun Fl_Valuator_handle_super as valuatorHandleSuper' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (HandleSuper ()) Valuator orig impl where
  runOp _ _ valuator event = withRef valuator (\p -> valuatorHandleSuper' p (fromIntegral . fromEnum $ event))
{# fun Fl_Valuator_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle ->  IO ())) => Op (ResizeSuper ()) Valuator orig impl where
  runOp _ _ valuator rectangle = withRef valuator $ \valuatorPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resizeSuper' valuatorPtr x_pos y_pos w_pos h_pos
{# fun Fl_Valuator_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Valuator orig impl where
  runOp _ _ valuator rectangle = withRef valuator $ \valuatorPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valuatorPtr x_pos y_pos w_pos h_pos
{# fun Fl_Valuator_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Bounds ()) Valuator orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> bounds' valuatorPtr a b
{# fun Fl_Valuator_minimum as minimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMinimum ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> minimum' valuatorPtr
{# fun Fl_Valuator_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMinimum ()) Valuator orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMinimum' valuatorPtr a
{# fun Fl_Valuator_maximum as maximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMaximum ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> maximum' valuatorPtr
{# fun Fl_Valuator_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMaximum ()) Valuator orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMaximum' valuatorPtr a
{# fun Fl_Valuator_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Range ()) Valuator orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> range' valuatorPtr a b
{# fun Fl_Valuator_set_step_with_a_b as setStepWithAB' { id `Ptr ()', `Double', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rational -> IO ())) => Op (SetStep ()) Valuator orig impl where
  runOp _ _ valuator r = withRef valuator $ \valuatorPtr -> setStepWithAB' valuatorPtr (fromIntegral (denominator r)) (fromIntegral (numerator r))
{# fun Fl_Valuator_step as step' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Rational))) => Op (GetStep ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> step' valuatorPtr >>= \r -> return $ approxRational r 0
{# fun Fl_Valuator_precision as precision' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int ->  IO ())) => Op (Precision ()) Valuator orig impl where
  runOp _ _ valuator p' = withRef valuator $ \valuatorPtr -> precision' valuatorPtr p'
{# fun Fl_Valuator_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetValue ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> value' valuatorPtr
{# fun Fl_Valuator_set_value as setValue' { id `Ptr ()',`Double' } -> `Int' #}
instance (impl ~ (Double ->  IO (Int))) => Op (SetValue ()) Valuator orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> setValue' valuatorPtr v
{# fun Fl_Valuator_format as format' { id `Ptr ()', unsafeToCString `String' } -> `Int' #}
instance (impl ~ (String ->  IO (Int))) => Op (SetFormat ()) Valuator orig impl where
  runOp _ _ valuator f = withRef valuator $ \valuatorPtr -> format' valuatorPtr f
{# fun Fl_Valuator_round as round' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (Round ()) Valuator orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> round' valuatorPtr v
{# fun Fl_Valuator_clamp as clamp' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (Clamp ()) Valuator orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> clamp' valuatorPtr v
{# fun Fl_Valuator_increment as increment' { id `Ptr ()',`Double',`Int' } -> `Double' #}
instance (impl ~ (Double -> Int ->  IO (Double))) => Op (Increment ()) Valuator orig impl where
  runOp _ _ valuator v n = withRef valuator $ \valuatorPtr -> increment' valuatorPtr v n
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (ValuatorType ->  IO ())) => Op (SetType ()) Valuator orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (ValuatorType)) => Op (GetType_ ()) Valuator orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

-- $functions
-- @
-- bounds :: 'Ref' 'Valuator' -> 'Double' -> 'Double' -> 'IO' ()
--
-- clamp :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ('Double')
--
-- destroy :: 'Ref' 'Valuator' -> 'IO' ()
--
-- getMaximum :: 'Ref' 'Valuator' -> 'IO' ('Double')
--
-- getMinimum :: 'Ref' 'Valuator' -> 'IO' ('Double')
--
-- getStep :: 'Ref' 'Valuator' -> 'IO' ('Rational')
--
-- getType_ :: 'Ref' 'Valuator' -> 'IO' ('ValuatorType')
--
-- getValue :: 'Ref' 'Valuator' -> 'IO' ('Double')
--
-- handle :: 'Ref' 'Valuator' -> 'Event' -> 'IO' 'Int'
--
-- handleSuper :: 'Ref' 'Valuator' -> 'Event' -> 'IO' 'Int'
--
-- hide :: 'Ref' 'Valuator' -> ( 'IO' ())
--
-- hideSuper :: 'Ref' 'Valuator' -> ( 'IO' ())
--
-- increment :: 'Ref' 'Valuator' -> 'Double' -> 'Int' -> 'IO' ('Double')
--
-- precision :: 'Ref' 'Valuator' -> 'Int' -> 'IO' ()
--
-- range :: 'Ref' 'Valuator' -> 'Double' -> 'Double' -> 'IO' ()
--
-- resize :: 'Ref' 'Valuator' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Valuator' -> 'Rectangle' -> 'IO' ()
--
-- round :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ('Double')
--
-- setFormat :: 'Ref' 'Valuator' -> 'String' -> 'IO' ('Int')
--
-- setMaximum :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ()
--
-- setMinimum :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ()
--
-- setStep :: 'Ref' 'Valuator' -> 'Rational' -> 'IO' ()
--
-- setType :: 'Ref' 'Valuator' -> 'ValuatorType' -> 'IO' ()
--
-- setValue :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ('Int')
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
-- @