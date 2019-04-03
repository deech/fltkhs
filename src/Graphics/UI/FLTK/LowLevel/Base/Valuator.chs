{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Valuator
    (
     -- * Constructor
     valuatorNew,
     valuatorCustom,
     ValuatorType(..)
  , handleValuatorBase
  , resizeValuatorBase
  , hideValuatorBase
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

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Data.Ratio
#c
enum ValuatorType {
  VerticalValuatorType = FL_VERTICALC,
  HorizontalValuatorType = FL_HORIZONTALC
};
#endc
{#enum ValuatorType {} deriving (Show, Eq) #}
{# fun Fl_Valuator_New as valuatorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Valuator_New_WithLabel as valuatorNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New_WithLabel as overriddenValuatorNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenValuator_New as overriddenValuatorNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
valuatorCustom :: Rectangle -> Maybe T.Text -> Maybe (Ref Valuator -> IO ()) -> Maybe (CustomWidgetFuncs Valuator) -> IO (Ref Valuator)
valuatorCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenValuatorNew'
    overriddenValuatorNewWithLabel'

valuatorNew :: Rectangle -> Maybe T.Text -> IO (Ref Valuator)
valuatorNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenValuatorNew'
    overriddenValuatorNewWithLabel'

{# fun Fl_Valuator_Destroy as valuatorDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ValuatorBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        valuatorDestroy' winPtr
                                        return nullPtr

{# fun Fl_Valuator_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleValuatorBase :: Ref ValuatorBase -> Event ->  IO (Either UnknownEvent ())
handleValuatorBase valuator event = withRef valuator $ \valuatorPtr -> handleSuper' valuatorPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Valuator_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeValuatorBase :: Ref ValuatorBase -> Rectangle -> IO ()
resizeValuatorBase valuator rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef valuator $ \valuatorPtr -> resizeSuper' valuatorPtr x_pos y_pos width height
{# fun Fl_Valuator_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideValuatorBase ::  Ref ValuatorBase -> IO ()
hideValuatorBase valuator = withRef valuator $ \valuatorPtr -> hideSuper' valuatorPtr

{#fun Fl_DerivedValuator_handle as valuatorHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ValuatorBase orig impl where
  runOp _ _ valuator event = withRef valuator (\p -> valuatorHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_DerivedValuator_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) ValuatorBase orig impl where
  runOp _ _ valuator rectangle = withRef valuator $ \valuatorPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' valuatorPtr x_pos y_pos w_pos h_pos

{# fun Fl_DerivedValuator_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Hide ()) ValuatorBase orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> hide' valuatorPtr

{# fun Fl_Valuator_bounds as bounds' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Bounds ()) ValuatorBase orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> bounds' valuatorPtr a b
{# fun Fl_Valuator_minimum as minimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMinimum ()) ValuatorBase orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> minimum' valuatorPtr
{# fun Fl_Valuator_set_minimum as setMinimum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMinimum ()) ValuatorBase orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMinimum' valuatorPtr a
{# fun Fl_Valuator_maximum as maximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetMaximum ()) ValuatorBase orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> maximum' valuatorPtr
{# fun Fl_Valuator_set_maximum as setMaximum' { id `Ptr ()',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double ->  IO ())) => Op (SetMaximum ()) ValuatorBase orig impl where
  runOp _ _ valuator a = withRef valuator $ \valuatorPtr -> setMaximum' valuatorPtr a
{# fun Fl_Valuator_range as range' { id `Ptr ()',`Double',`Double' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Double -> Double ->  IO ())) => Op (Range ()) ValuatorBase orig impl where
  runOp _ _ valuator a b = withRef valuator $ \valuatorPtr -> range' valuatorPtr a b
{# fun Fl_Valuator_set_step_with_a_b as setStepWithAB' { id `Ptr ()', `Double', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rational -> IO ())) => Op (SetStep ()) ValuatorBase orig impl where
  runOp _ _ valuator r = withRef valuator $ \valuatorPtr -> setStepWithAB' valuatorPtr (fromIntegral (numerator r)) (fromIntegral (denominator r))
{# fun Fl_Valuator_step as step' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Rational))) => Op (GetStep ()) ValuatorBase orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> step' valuatorPtr >>= \r -> return $ approxRational r 0
{# fun Fl_Valuator_precision as precision' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Int ->  IO ())) => Op (Precision ()) ValuatorBase orig impl where
  runOp _ _ valuator p' = withRef valuator $ \valuatorPtr -> precision' valuatorPtr p'
{# fun Fl_Valuator_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetValue ()) ValuatorBase orig impl where
  runOp _ _ valuator = withRef valuator $ \valuatorPtr -> value' valuatorPtr
{# fun Fl_Valuator_set_value as setValue' { id `Ptr ()',`Double' } -> `Int' #}
instance (impl ~ (Double ->  IO (Either NoChange ()))) => Op (SetValue ()) ValuatorBase orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> do
    ret <- setValue' valuatorPtr v
    return (if (ret == 0) then Left NoChange else Right ())
{# fun Fl_Valuator_format as format' { id `Ptr ()', id `Ptr CChar' } -> `Int' #}
instance (impl ~ (IO (Either UnknownError T.Text))) => Op (Format ()) ValuatorBase orig impl where
  runOp _ _ valuator =
    let bufSize = 128
    in
    withRef valuator
      (\valuatorPtr ->
          allocaBytes 128
            (\bufPtr -> do
               res <- format' valuatorPtr bufPtr
               if (res < 0 || res > bufSize)
                 then return (Left UnknownError)
                 else fmap Right (cStringToText (castPtr bufPtr))
            )
      )
{# fun Fl_Valuator_round as round' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (Round ()) ValuatorBase orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> round' valuatorPtr v
{# fun Fl_Valuator_clamp as clamp' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (Clamp ()) ValuatorBase orig impl where
  runOp _ _ valuator v = withRef valuator $ \valuatorPtr -> clamp' valuatorPtr v
{# fun Fl_Valuator_increment as increment' { id `Ptr ()',`Double',`Int' } -> `Double' #}
instance (impl ~ (Double -> Int ->  IO (Double))) => Op (Increment ()) ValuatorBase orig impl where
  runOp _ _ valuator v n = withRef valuator $ \valuatorPtr -> increment' valuatorPtr v n
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (ValuatorType ->  IO ())) => Op (SetType ()) ValuatorBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (ValuatorType)) => Op (GetType_ ()) ValuatorBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Valuator"
-- @

-- $functions
-- @
-- bounds :: 'Ref' 'ValuatorBase' -> 'Double' -> 'Double' -> 'IO' ()
--
-- clamp :: 'Ref' 'ValuatorBase' -> 'Double' -> 'IO' ('Double')
--
-- destroy :: 'Ref' 'ValuatorBase' -> 'IO' ()
--
-- format :: 'Ref' 'ValuatorBase' -> 'IO' ('Either' 'UnknownError' 'T.Text')
--
-- getMaximum :: 'Ref' 'ValuatorBase' -> 'IO' ('Double')
--
-- getMinimum :: 'Ref' 'ValuatorBase' -> 'IO' ('Double')
--
-- getStep :: 'Ref' 'ValuatorBase' -> 'IO' ('Rational')
--
-- getType_ :: 'Ref' 'ValuatorBase' -> 'IO' ('ValuatorType')
--
-- getValue :: 'Ref' 'ValuatorBase' -> 'IO' ('Double')
--
-- handle :: 'Ref' 'ValuatorBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ValuatorBase' -> 'IO' ()
--
-- increment :: 'Ref' 'ValuatorBase' -> 'Double' -> 'Int' -> 'IO' ('Double')
--
-- precision :: 'Ref' 'ValuatorBase' -> 'Int' -> 'IO' ()
--
-- range :: 'Ref' 'ValuatorBase' -> 'Double' -> 'Double' -> 'IO' ()
--
-- resize :: 'Ref' 'ValuatorBase' -> 'Rectangle' -> 'IO' ()
--
-- round :: 'Ref' 'ValuatorBase' -> 'Double' -> 'IO' ('Double')
--
-- setMaximum :: 'Ref' 'ValuatorBase' -> 'Double' -> 'IO' ()
--
-- setMinimum :: 'Ref' 'ValuatorBase' -> 'Double' -> 'IO' ()
--
-- setStep :: 'Ref' 'ValuatorBase' -> 'Rational' -> 'IO' ()
--
-- setType :: 'Ref' 'ValuatorBase' -> 'ValuatorType' -> 'IO' ()
--
-- setValue :: 'Ref' 'ValuatorBase' -> 'Double' -> 'IO' ('Either' 'NoChange' ())
-- @
