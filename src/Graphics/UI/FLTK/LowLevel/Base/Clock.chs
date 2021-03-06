{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Clock
  (
    ClockType(..),
    clockNew,
    clockNewWithType,
    clockCustom,
    Hour(..),
    Minute(..),
    Second(..),
    ClockByTime (..),
    ClockSinceEpoch(..),
    ClockSetTimeType(..)
  , drawClockBase
  , handleClockBase
  , resizeClockBase
  , hideClockBase
  , showWidgetClockBase
    -- * Hierarchy
    --
    -- $hierarchy

    -- * Clock
    --
    -- $functions
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
import Graphics.UI.FLTK.LowLevel.Base.Widget

#c
enum ClockType {
  SquareClock = FL_SQUARE_CLOCK,
  RoundClock = FL_ROUND_CLOCK,
  AnalogClock = FL_ANALOG_CLOCK,
  DigitalClock = FL_DIGITAL_CLOCK
};
#endc
{# enum ClockType {} deriving (Show) #}
newtype Hour = Hour Int deriving Show
newtype Minute = Minute Int deriving Show
newtype Second = Second Int deriving Show
data ClockByTime = ClockByTime Hour Minute Second deriving Show
data ClockSinceEpoch = ClockSinceEpoch Second deriving Show
data ClockSetTimeType = ClockSetByTime ClockByTime | ClockSetSinceEpoch ClockSinceEpoch deriving Show

{# fun Fl_OverriddenClock_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenClock_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
clockCustom ::
       Rectangle                         -- ^ The bounds of this Clock
    -> Maybe T.Text                      -- ^ The Clock label
    -> Maybe (Ref Clock -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Clock)      -- ^ Optional custom widget functions
    -> IO (Ref Clock)
clockCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Clock_New as clockNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Clock_New_WithLabel as clockNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
{# fun Fl_Clock_New_WithClockType as clockNewWithClockType' { id `CUChar', `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
clockNew :: Rectangle -> Maybe T.Text -> IO (Ref Clock)
clockNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

clockNewWithType :: ClockType -> Rectangle -> T.Text -> IO (Ref Clock)
clockNewWithType clocktype' rectangle' label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle'
    in do
    ref <- copyTextToCString label' >>= \l' -> clockNewWithClockType' (castCharToCUChar . chr . fromEnum $ clocktype') x_pos y_pos width height l'  >>= toRef
    setFlag ref WidgetFlagCopiedLabel
    setFlag ref WidgetFlagCopiedTooltip
    return ref

{# fun Fl_Clock_set_value_with_hms as setValueWithhms' {id `Ptr ()', `Int', `Int', `Int'} -> `()' #}
{# fun Fl_Clock_set_value as setValue' {id `Ptr ()', id `CULong'} -> `()' #}

instance (impl ~ ( ClockSetTimeType -> IO ())) => Op (SetValue ()) ClockBase orig impl where
  runOp _ _ clock' clockvalue = withRef clock' $ \clockPtr ->
    case clockvalue of
     ClockSetByTime (ClockByTime (Hour h)(Minute m) (Second s)) -> setValueWithhms' clockPtr h m s
     ClockSetSinceEpoch (ClockSinceEpoch (Second s)) -> setValue' clockPtr (fromIntegral s)

{# fun Fl_Clock_value as getValue' {id `Ptr ()'} -> `CULong' id #}
instance (impl ~ (IO ClockSinceEpoch)) => Op (GetValueSinceEpoch ()) ClockBase orig impl where
  runOp _ _ clock' = withRef clock' $ \clockPtr ->
    getValue' clockPtr >>= return . ClockSinceEpoch . Second . fromIntegral

{# fun Fl_Clock_hour   as clockHour'   {id `Ptr ()'} -> `Int'  #}
{# fun Fl_Clock_minute as clockMinute' {id `Ptr ()'} -> `Int'  #}
{# fun Fl_Clock_second as clockSecond' {id `Ptr ()'} -> `Int'  #}
instance (impl ~ (IO ClockByTime)) => Op (GetValue ()) ClockBase orig impl where
  runOp _ _ clock' = withRef clock' $ \clockPtr -> do
    hour' <- clockHour' clockPtr
    minute' <- clockMinute' clockPtr
    second' <- clockSecond' clockPtr
    return $ ClockByTime (Hour hour') (Minute minute') (Second second')

{# fun Fl_Clock_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (ClockType ->  IO ())) => Op (SetType ()) ClockBase orig impl where
  runOp _ _ clock type'' = withRef clock $ \clockPtr -> setType' clockPtr (fromIntegral (fromEnum type''))

{# fun Fl_Clock_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (ClockType))) => Op (GetType_ ()) ClockBase orig impl where
   runOp _ _ clock = withRef clock $ \clockPtr -> type' clockPtr >>= return . toEnum . fromIntegral


{# fun Fl_Clock_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawClockBase ::  Ref ClockBase -> IO ()
drawClockBase clock = withRef clock $ \clockPtr -> drawSuper' clockPtr
{# fun Fl_Clock_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleClockBase :: Ref ClockBase -> Event ->  IO (Either UnknownEvent ())
handleClockBase clock event = withRef clock $ \clockPtr -> handleSuper' clockPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Clock_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeClockBase :: Ref ClockBase -> Rectangle -> IO ()
resizeClockBase clock rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef clock $ \clockPtr -> resizeSuper' clockPtr x_pos y_pos width height
{# fun Fl_Clock_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideClockBase ::  Ref ClockBase -> IO ()
hideClockBase clock = withRef clock $ \clockPtr -> hideSuper' clockPtr
{# fun Fl_Clock_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetClockBase ::  Ref ClockBase -> IO ()
showWidgetClockBase clock = withRef clock $ \clockPtr -> showSuper' clockPtr

{#fun Fl_Clock_get_shadow as getShadow' {id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO Bool)) => Op (GetShadow ()) ClockBase orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> getShadow' clockPtr
{#fun Fl_Clock_set_shadow as setShadow' {id `Ptr ()', cFromBool `Bool'} -> `()'#}
instance (impl ~ (Bool -> IO ())) => Op (SetShadow ()) ClockBase orig impl where
  runOp _ _ clock shadow = withRef clock $ \clockPtr -> setShadow' clockPtr shadow

{# fun Fl_Clock_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) ClockBase orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> draw'' clockPtr
{#fun Fl_Clock_handle as clockHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) ClockBase orig impl where
  runOp _ _ clock event = withRef clock (\p -> clockHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Clock_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) ClockBase orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> show' clockPtr
{# fun Fl_Clock_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) ClockBase orig impl where
  runOp _ _ clock = withRef clock $ \clockPtr -> hide' clockPtr
{# fun Fl_Clock_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) ClockBase orig impl where
  runOp _ _ clock rectangle = withRef clock $ \clockPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' clockPtr x_pos y_pos w_pos h_pos


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Clock"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'ClockBase' -> 'IO' ()
--
-- getShadow :: 'Ref' 'ClockBase' -> 'IO' 'Bool'
--
-- getType_ :: 'Ref' 'ClockBase' -> 'IO' ('ClockType')
--
-- getValue :: 'Ref' 'ClockBase' -> 'IO' 'ClockByTime'
--
-- getValueSinceEpoch :: 'Ref' 'ClockBase' -> 'IO' 'ClockSinceEpoch'
--
-- handle :: 'Ref' 'ClockBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'ClockBase' -> 'IO' ()
--
-- resize :: 'Ref' 'ClockBase' -> 'Rectangle' -> 'IO' ()
--
-- setShadow :: 'Ref' 'ClockBase' -> 'Bool' -> 'IO' ()
--
-- setType :: 'Ref' 'ClockBase' -> 'ClockType' -> 'IO' ()
--
-- setValue :: 'Ref' 'ClockBase' -> 'ClockSetTimeType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'ClockBase' -> 'IO' ()
-- @
