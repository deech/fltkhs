{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Timer
    (
     -- * Constructor
     timerNew,
     valueTimerNew,
     hiddenTimerNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TimerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Timer_New as timerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
timerNew :: Rectangle -> String -> IO (Ref Timer)
timerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in timerNewWithLabel' x_pos y_pos width height l' >>= toRef
{# fun Fl_Value_Timer_New as valueTimerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
valueTimerNew :: Rectangle -> String -> IO (Ref ValueTimer)
valueTimerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in
    valueTimerNewWithLabel' x_pos y_pos width height l' >>= toRef

{# fun Fl_Hidden_Timer_New as hiddenTimerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
hiddenTimerNew :: Rectangle -> String -> IO (Ref HiddenTimer)
hiddenTimerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in
    hiddenTimerNewWithLabel' x_pos y_pos width height l' >>= toRef

{# fun Fl_Timer_Destroy as timerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Timer orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        timerDestroy' winPtr
                                        return nullPtr
{#fun Fl_Timer_handle as timerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Timer orig impl where
  runOp _ _ timer event = withRef timer (\p -> timerHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Timer_direction as direction' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (CountDirection))) => Op (GetDirection ()) Timer orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> direction' adjusterPtr >>= return . ccharToCountDirection
{# fun unsafe Fl_Timer_set_direction as setDirection' { id `Ptr ()',id `CChar' } -> `()' #}
instance (impl ~ (CountDirection ->  IO ())) => Op (SetDirection ()) Timer orig impl where
  runOp _ _ adjuster d = withRef adjuster $ \adjusterPtr -> setDirection' adjusterPtr (countDirectionToCChar d)
{# fun unsafe Fl_Timer_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetValue ()) Timer orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> value' adjusterPtr
{# fun unsafe Fl_Timer_set_value as setValue' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetValue ()) Timer orig impl where
  runOp _ _ adjuster value = withRef adjuster $ \adjusterPtr -> setValue' adjusterPtr value
{# fun unsafe Fl_Timer_suspended as suspended' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSuspended ()) Timer orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> suspended' adjusterPtr
{# fun unsafe Fl_Timer_set_suspended as setSuspended' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetSuspended ()) Timer orig impl where
  runOp _ _ adjuster s = withRef adjuster $ \adjusterPtr -> setSuspended' adjusterPtr s
