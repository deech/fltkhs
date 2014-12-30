{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Valuator
    (
     -- * Constructor
     valuatorNew,
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
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Data.Ratio

{# fun Fl_Valuator_New as valuatorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Valuator_New_WithLabel as valuatorNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New_WithLabel as overriddenValuatorNewWithLabel' { `Int',`Int',`Int',`Int',`String', id `Ptr ()'} -> `Ptr ()' id #}
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
instance Op (Destroy ()) Valuator ( IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
                                        valuatorDestroy' winPtr
                                        return nullPtr
{#fun Fl_Valuator_handle as valuatorHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Valuator ( Event -> IO Int) where
  runOp _ valuator event = withRef valuator (\p -> valuatorHandle' p (fromIntegral . fromEnum $ event))
{# fun Fl_Valuator_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (ResizeSuper ()) Valuator ( Rectangle ->  IO (())) where
  runOp _ valuator rectangle = withRef valuator $ \valuatorPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resizeSuper' valuatorPtr x_pos y_pos w_pos h_pos
{# fun Fl_Valuator_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Resize ()) Valuator ( Rectangle -> IO (())) where
  runOp _ valuator rectangle = withRef valuator $ \valuatorPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' valuatorPtr x_pos y_pos w_pos h_pos
{# fun unsafe Fl_Valuator_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance Op (GetBounds ()) Valuator ( Double -> Double ->  IO (())) where
  runOp _ valuator a b = withRef valuator $ \valuatorPtr -> bounds' valuatorPtr a b
{# fun unsafe Fl_Valuator_minimum as minimum' { id `Ptr ()' } -> `Double' #}
instance Op (GetMinimum ()) Valuator (  IO (Double)) where
  runOp _ valuator = withRef valuator $ \valuatorPtr -> minimum' valuatorPtr
{# fun unsafe Fl_Valuator_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance Op (SetMinimum ()) Valuator ( Double ->  IO (())) where
  runOp _ valuator a = withRef valuator $ \valuatorPtr -> setMinimum' valuatorPtr a
{# fun unsafe Fl_Valuator_maximum as maximum' { id `Ptr ()' } -> `Double' #}
instance Op (GetMaximum ()) Valuator (  IO (Double)) where
  runOp _ valuator = withRef valuator $ \valuatorPtr -> maximum' valuatorPtr
{# fun unsafe Fl_Valuator_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance Op (SetMaximum ()) Valuator ( Double ->  IO (())) where
  runOp _ valuator a = withRef valuator $ \valuatorPtr -> setMaximum' valuatorPtr a
{# fun unsafe Fl_Valuator_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance Op (GetRange ()) Valuator ( Double -> Double ->  IO (())) where
  runOp _ valuator a b = withRef valuator $ \valuatorPtr -> range' valuatorPtr a b
{# fun unsafe Fl_Valuator_set_step_with_a_b as setStepWithAB' { id `Ptr ()', `Double', `Int' } -> `()' supressWarningAboutRes #}
instance Op (SetStep ()) Valuator ( Rational -> IO ()) where
  runOp _ valuator r = withRef valuator $ \valuatorPtr -> setStepWithAB' valuatorPtr (fromIntegral (denominator r)) (fromIntegral (numerator r))
{# fun unsafe Fl_Valuator_step as step' { id `Ptr ()' } -> `Double' #}
instance Op (GetStep ()) Valuator (  IO (Rational)) where
  runOp _ valuator = withRef valuator $ \valuatorPtr -> step' valuatorPtr >>= \r -> return $ approxRational r 0
{# fun unsafe Fl_Valuator_precision as precision' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance Op (Precision ()) Valuator ( Int ->  IO (())) where
  runOp _ valuator p' = withRef valuator $ \valuatorPtr -> precision' valuatorPtr p'
{# fun unsafe Fl_Valuator_value as value' { id `Ptr ()' } -> `Double' #}
instance Op (GetValue ()) Valuator (  IO (Double)) where
  runOp _ valuator = withRef valuator $ \valuatorPtr -> value' valuatorPtr
{# fun unsafe Fl_Valuator_set_value as setValue' { id `Ptr ()',`Double' } -> `Int' #}
instance Op (SetValue ()) Valuator ( Double ->  IO (Int)) where
  runOp _ valuator v = withRef valuator $ \valuatorPtr -> setValue' valuatorPtr v
{# fun unsafe Fl_Valuator_format as format' { id `Ptr ()',`String' } -> `Int' #}
instance Op (Format ()) Valuator ( String ->  IO (Int)) where
  runOp _ valuator f = withRef valuator $ \valuatorPtr -> format' valuatorPtr f
{# fun unsafe Fl_Valuator_round as round' { id `Ptr ()',`Double' } -> `Double' #}
instance Op (Round ()) Valuator ( Double ->  IO (Double)) where
  runOp _ valuator v = withRef valuator $ \valuatorPtr -> round' valuatorPtr v
{# fun unsafe Fl_Valuator_clamp as clamp' { id `Ptr ()',`Double' } -> `Double' #}
instance Op (Clamp ()) Valuator ( Double ->  IO (Double)) where
  runOp _ valuator v = withRef valuator $ \valuatorPtr -> clamp' valuatorPtr v
{# fun unsafe Fl_Valuator_increment as increment' { id `Ptr ()',`Double',`Int' } -> `Double' #}
instance Op (Increment ()) Valuator ( Double -> Int ->  IO (Double)) where
  runOp _ valuator v n = withRef valuator $ \valuatorPtr -> increment' valuatorPtr v n
