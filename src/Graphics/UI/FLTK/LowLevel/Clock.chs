{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Clock
  (
    ClockType(..),
    clockNew,
    clockNewWithType,
    Hour(..),
    Minute(..),
    Second(..),
    ClockByTime (..),
    ClockSinceEpoch(..),
    ClockSetTimeType(..)
    -- * Hierarchy
    --
    -- $hierarchy

    -- * Clock
    --
    -- $Clockfunctions
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ClockC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Data.Char
#c
enum ClockType {
  SquareClock = FL_SQUARE_CLOCK,
  RoundClock = FL_ROUND_CLOCK,
  AnalogClock = FL_ANALOG_CLOCK,
  DigitalClock = FL_DIGITAL_CLOCK
};
#endc
{# enum ClockType {} deriving (Show) #}
newtype Hour = Hour Int
newtype Minute = Minute Int
newtype Second = Second Int
data ClockByTime = ClockByTime Hour Minute Second
data ClockSinceEpoch = ClockSinceEpoch Second
data ClockSetTimeType = ClockSetByTime ClockByTime | ClockSetSinceEpoch ClockSinceEpoch
{# fun Fl_Clock_New as clockNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Clock_New_WithLabel as clockNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
{# fun Fl_Clock_New_WithClockType as clockNewWithClockType' { id `CUChar', `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
clockNew :: Rectangle -> Maybe T.Text -> IO (Ref Clock)
clockNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> clockNew' x_pos y_pos width height >>=
                             toRef
        Just l -> clockNewWithLabel' x_pos y_pos width height l >>=
                             toRef
clockNewWithType :: ClockType -> Rectangle -> T.Text -> IO (Ref Clock)
clockNewWithType clocktype' rectangle' label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle'
    in
     clockNewWithClockType' (castCharToCUChar . chr . fromEnum $ clocktype') x_pos y_pos width height label'  >>= toRef

{# fun Fl_Clock_set_value_with_hms as setValueWithhms' {id `Ptr ()', `Int', `Int', `Int'} -> `()' #}
{# fun Fl_Clock_set_value as setValue' {id `Ptr ()', id `CULong'} -> `()' #}
instance (impl ~ (ClockSetTimeType -> IO ())) => Op (SetValue()) Clock orig impl where
  runOp _ _ clock' clockvalue = withRef clock' $ \clockPtr ->
    case clockvalue of
     ClockSetByTime (ClockByTime (Hour h)(Minute m) (Second s)) -> setValueWithhms' clockPtr h m s
     ClockSetSinceEpoch (ClockSinceEpoch (Second s)) -> setValue' clockPtr (fromIntegral s)

{# fun Fl_Clock_value as getValue' {id `Ptr ()'} -> `CULong' id #}
instance (impl ~ (IO ClockSinceEpoch)) => Op (GetValueSinceEpoch ()) Clock orig impl where
  runOp _ _ clock' = withRef clock' $ \clockPtr ->
    getValue' clockPtr >>= return . ClockSinceEpoch . Second . fromIntegral

{# fun Fl_Clock_hour   as clockHour'   {id `Ptr ()'} -> `Int'  #}
{# fun Fl_Clock_minute as clockMinute' {id `Ptr ()'} -> `Int'  #}
{# fun Fl_Clock_second as clockSecond' {id `Ptr ()'} -> `Int'  #}
instance (impl ~ (IO ClockByTime)) => Op (GetValue ()) Clock orig impl where
  runOp _ _ clock' = withRef clock' $ \clockPtr -> do
    hour' <- clockHour' clockPtr
    minute' <- clockMinute' clockPtr
    second' <- clockSecond' clockPtr
    return $ ClockByTime (Hour hour') (Minute minute') (Second second')

{#fun Fl_Clock_handle as menu_Handle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Clock orig impl where
  runOp _ _ menu_ event = withRef menu_ (\p -> menu_Handle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_Clock_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (ClockType ->  IO ())) => Op (SetType ()) Clock orig impl where
  runOp _ _ clock type'' = withRef clock $ \clockPtr -> setType' clockPtr (fromIntegral (fromEnum type''))

{# fun Fl_Clock_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (ClockType))) => Op (GetType_ ()) Clock orig impl where
   runOp _ _ clock = withRef clock $ \clockPtr -> type' clockPtr >>= return . toEnum . fromIntegral

-- $Clockfunctions
--
-- @
--
-- getValue :: 'Ref' 'Clock' -> 'IO' 'ClockByTime'
--
-- getValueSinceEpoch :: 'Ref' 'Clock' -> 'IO' 'ClockSinceEpoch'
--
-- handle :: 'Ref' 'Clock' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- setValue :: 'Ref' 'Clock' -> 'ClockSetTimeType' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Clock"
-- @
