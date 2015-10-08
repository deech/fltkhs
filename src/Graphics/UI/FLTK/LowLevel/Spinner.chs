{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, OverlappingInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Spinner
    (
     -- * Constructor
     spinnerNew,
     SpinnerType(..)
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $Spinnerfunctions
     --
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SpinnerC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
#c
enum SpinnerType {
  IntSpinnerType = FL_INT_INPUTC,
  FloatSpinnerType = FL_FLOAT_INPUTC
};
#endc
{#enum SpinnerType {} deriving (Show, Eq) #}
{# fun Fl_Spinner_New as spinnerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Spinner_New_WithLabel as spinnerNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
spinnerNew :: Rectangle -> Maybe String -> IO (Ref Spinner)
spinnerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> spinnerNew' x_pos y_pos width height >>=
                             toRef
        Just l -> spinnerNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{#fun Fl_Spinner_handle as spinnerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Spinner orig impl where
  runOp _ _ spinner event = withRef spinner (\p -> spinnerHandle' p (fromIntegral . fromEnum $ event))
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
{# fun Fl_Spinner_set_format as set_format' { id `Ptr ()', `String' } -> `()' supressWarningAboutRes #}
instance (impl ~ (String ->  IO ())) => Op (SetFormat ()) Spinner orig impl where
  runOp _ _ spinner f = withRef spinner $ \spinnerPtr -> set_format' spinnerPtr f
{# fun Fl_Spinner_format as format' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ ( IO (Maybe String))) => Op (GetFormat ()) Spinner orig impl where
   runOp _ _ spinner = withRef spinner $ \spinnerPtr -> format' spinnerPtr >>= \s ->
     if (null s) then return Nothing else return (Just s)
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
-- getFormat :: 'Ref' 'Spinner' -> 'IO' ('Maybe' 'String')
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
-- handle :: 'Ref' 'Spinner' -> 'Event' -> 'IO' 'Int'
--
-- range :: 'Ref' 'Spinner' -> 'Double' -> 'Double' -> 'IO' ()
--
-- setFormat :: 'Ref' 'Spinner' -> 'String' -> 'IO' ()
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
-- @
