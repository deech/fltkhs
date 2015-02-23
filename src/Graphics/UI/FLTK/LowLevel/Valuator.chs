{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Valuator
    (
     -- * Constructor
     valuatorNew,
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
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Widget
import Data.Ratio

{# fun Fl_Valuator_New as valuatorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Valuator_New_WithLabel as valuatorNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New_WithLabel as overriddenValuatorNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New as overriddenValuatorNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valuatorNew :: Rectangle -> Maybe String -> Maybe (CustomWidgetFuncs Valuator) -> IO (Ref Valuator)
valuatorNew rectangle l' funcs' =
  widgetMaker
    rectangle
    l'
    funcs'
    valuatorNew'
    valuatorNewWithLabel'
    overriddenValuatorNew'
    overriddenValuatorNewWithLabel'

{# fun Fl_Valuator_Destroy as valuatorDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Valuator orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        valuatorDestroy' winPtr
                                        return nullPtr
{#fun Fl_Valuator_handle as valuatorHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Valuator orig impl where
  runOp _ _ valuator event = withRef valuator (\p -> valuatorHandle' p (fromIntegral . fromEnum $ event))
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
{# fun unsafe Fl_Valuator_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Bounds ()) Valuator orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> bounds' valuatorPtr a b
{# fun unsafe Fl_Valuator_minimum as minimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMinimum ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> minimum' valuatorPtr
{# fun unsafe Fl_Valuator_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMinimum ()) Valuator orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMinimum' valuatorPtr a
{# fun unsafe Fl_Valuator_maximum as maximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMaximum ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> maximum' valuatorPtr
{# fun unsafe Fl_Valuator_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMaximum ()) Valuator orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMaximum' valuatorPtr a
{# fun unsafe Fl_Valuator_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Range ()) Valuator orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> range' valuatorPtr a b
{# fun unsafe Fl_Valuator_set_step_with_a_b as setStepWithAB' { id `Ptr ()', `Double', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rational -> IO ())) => Op (SetStep ()) Valuator orig impl where
  runOp _ _ valuator r = withRef valuator $ \valuatorPtr -> setStepWithAB' valuatorPtr (fromIntegral (denominator r)) (fromIntegral (numerator r))
{# fun unsafe Fl_Valuator_step as step' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Rational))) => Op (GetStep ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> step' valuatorPtr >>= \r -> return $ approxRational r 0
{# fun unsafe Fl_Valuator_precision as precision' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int ->  IO ())) => Op (Precision ()) Valuator orig impl where
  runOp _ _ valuator p' = withRef valuator $ \valuatorPtr -> precision' valuatorPtr p'
{# fun unsafe Fl_Valuator_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetValue ()) Valuator orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> value' valuatorPtr
{# fun unsafe Fl_Valuator_set_value as setValue' { id `Ptr ()',`Double' } -> `Int' #}
instance (impl ~ (Double ->  IO (Int))) => Op (SetValue ()) Valuator orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> setValue' valuatorPtr v
{# fun unsafe Fl_Valuator_format as format' { id `Ptr ()', unsafeToCString `String' } -> `Int' #}
instance (impl ~ (String ->  IO (Int))) => Op (Format ()) Valuator orig impl where
  runOp _ _ valuator f = withRef valuator $ \valuatorPtr -> format' valuatorPtr f
{# fun unsafe Fl_Valuator_round as round' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (Round ()) Valuator orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> round' valuatorPtr v
{# fun unsafe Fl_Valuator_clamp as clamp' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (Clamp ()) Valuator orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> clamp' valuatorPtr v
{# fun unsafe Fl_Valuator_increment as increment' { id `Ptr ()',`Double',`Int' } -> `Double' #}
instance (impl ~ (Double -> Int ->  IO (Double))) => Op (Increment ()) Valuator orig impl where
  runOp _ _ valuator v n = withRef valuator $ \valuatorPtr -> increment' valuatorPtr v n

-- $functions
-- @
--
-- bounds :: 'Ref' 'Valuator' -> 'Double' -> 'Double' -> 'IO' ()
--
-- clamp :: 'Ref' 'Valuator' -> 'Double' -> 'IO' 'Double'
--
-- destroy :: 'Ref' 'Valuator' -> 'IO' ()
--
-- format :: 'Ref' 'Valuator' -> 'String' -> 'IO' 'Int'
--
-- getMaximum :: 'Ref' 'Valuator' -> 'IO' 'Double'
--
-- getMinimum :: 'Ref' 'Valuator' -> 'IO' 'Double'
--
-- getStep :: 'Ref' 'Valuator' -> 'IO' 'Rational'
--
-- getValue :: 'Ref' 'Valuator' -> 'IO' 'Double'
--
-- handle :: 'Ref' 'Valuator' -> 'Event' -> 'IO' 'Int'
--
-- increment :: 'Ref' 'Valuator' -> 'Double' -> 'Int' -> 'IO' 'Double'
--
-- precision :: 'Ref' 'Valuator' -> 'Int' -> 'IO' ()
--
-- range :: 'Ref' 'Valuator' -> 'Double' -> 'Double' -> 'IO' ()
--
-- resize :: 'Ref' 'Valuator' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Valuator' -> 'Rectangle' -> 'IO' ()
--
-- round :: 'Ref' 'Valuator' -> 'Double' -> 'IO' 'Double'
--
-- setMaximum :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ()
--
-- setMinimum :: 'Ref' 'Valuator' -> 'Double' -> 'IO' ()
--
-- setStep :: 'Ref' 'Valuator' -> 'Rational' -> 'IO' ()
--
-- setValue :: 'Ref' 'Valuator' -> 'Double' -> 'IO' 'Int'
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
-- @