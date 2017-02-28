{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Timer
    (
     -- * Constructor
     timerNew,
     timerCustom,
     -- * Hierarchy
     --
     -- $hierarchy

     valueTimerNew,
     hiddenTimerNew
     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_TimerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenTimer_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenTimer_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
timerCustom ::
       Rectangle                            -- ^ The bounds of this Timer
    -> T.Text                               -- ^ The Timer label
    -> Maybe (Ref Timer -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Timer)      -- ^ Optional custom widget functions
    -> IO (Ref Timer)
timerCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    (Just l')
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Timer_New as timerNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
timerNew :: Rectangle -> T.Text -> IO (Ref Timer)
timerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in timerNewWithLabel' x_pos y_pos width height l' >>= toRef
{# fun Fl_Value_Timer_New as valueTimerNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
valueTimerNew :: Rectangle -> T.Text -> IO (Ref ValueTimer)
valueTimerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in
    valueTimerNewWithLabel' x_pos y_pos width height l' >>= toRef

{# fun Fl_Hidden_Timer_New as hiddenTimerNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
hiddenTimerNew :: Rectangle -> T.Text -> IO (Ref HiddenTimer)
hiddenTimerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in
    hiddenTimerNewWithLabel' x_pos y_pos width height l' >>= toRef

{# fun Fl_Timer_Destroy as timerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Timer orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
                                        timerDestroy' winPtr
                                        return nullPtr
{# fun Fl_Timer_direction as direction' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (CountDirection))) => Op (GetDirection ()) Timer orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> direction' adjusterPtr >>= return . ccharToCountDirection
{# fun Fl_Timer_set_direction as setDirection' { id `Ptr ()',id `CChar' } -> `()' #}
instance (impl ~ (CountDirection ->  IO ())) => Op (SetDirection ()) Timer orig impl where
  runOp _ _ adjuster d = withRef adjuster $ \adjusterPtr -> setDirection' adjusterPtr (countDirectionToCChar d)
{# fun Fl_Timer_value as value' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (Double))) => Op (GetValue ()) Timer orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> value' adjusterPtr
{# fun Fl_Timer_set_value as setValue' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetValue ()) Timer orig impl where
  runOp _ _ adjuster value = withRef adjuster $ \adjusterPtr -> setValue' adjusterPtr value
{# fun Fl_Timer_suspended as suspended' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetSuspended ()) Timer orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> suspended' adjusterPtr
{# fun Fl_Timer_set_suspended as setSuspended' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetSuspended ()) Timer orig impl where
  runOp _ _ adjuster s = withRef adjuster $ \adjusterPtr -> setSuspended' adjusterPtr s
{# fun Fl_Timer_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Timer orig impl where
  runOp _ _ timer = withRef timer $ \timerPtr -> draw'' timerPtr
{# fun Fl_Timer_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Timer orig impl where
  runOp _ _ timer = withRef timer $ \timerPtr -> drawSuper' timerPtr
{#fun Fl_Timer_handle as timerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Timer orig impl where
  runOp _ _ timer event = withRef timer (\p -> timerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Timer_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Timer orig impl where
  runOp _ _ timer event = withRef timer $ \timerPtr -> handleSuper' timerPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Timer_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Timer orig impl where
  runOp _ _ timer rectangle = withRef timer $ \timerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' timerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Timer_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Timer orig impl where
  runOp _ _ timer rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef timer $ \timerPtr -> resizeSuper' timerPtr x_pos y_pos width height
{# fun Fl_Timer_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Timer orig impl where
  runOp _ _ timer = withRef timer $ \timerPtr -> hide' timerPtr
{# fun Fl_Timer_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Timer orig impl where
  runOp _ _ timer = withRef timer $ \timerPtr -> hideSuper' timerPtr
{# fun Fl_Timer_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Timer orig impl where
  runOp _ _ timer = withRef timer $ \timerPtr -> show' timerPtr
{# fun Fl_Timer_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Timer orig impl where
  runOp _ _ timer = withRef timer $ \timerPtr -> showSuper' timerPtr

-- $functions
-- @
--
-- destroy :: 'Ref' 'Timer' -> 'IO' ()
--
-- draw :: 'Ref' 'Timer' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Timer' -> 'IO' ()
--
-- getDirection :: 'Ref' 'Timer' -> 'IO' ('CountDirection')
--
-- getSuspended :: 'Ref' 'Timer' -> 'IO' ('Bool')
--
-- getValue :: 'Ref' 'Timer' -> 'IO' ('Double')
--
-- handle :: 'Ref' 'Timer' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Timer' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Timer' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Timer' -> 'IO' ()
--
-- resize :: 'Ref' 'Timer' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Timer' -> 'Rectangle' -> 'IO' ()
--
-- setDirection :: 'Ref' 'Timer' -> 'CountDirection' -> 'IO' ()
--
-- setSuspended :: 'Ref' 'Timer' -> 'Bool' -> 'IO' ()
--
-- setValue :: 'Ref' 'Timer' -> 'Double' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Timer' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Timer' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Timer"
-- @
