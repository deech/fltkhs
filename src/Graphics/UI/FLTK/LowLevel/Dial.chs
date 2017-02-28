{-# LANGUAGE TypeFamilies,CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Dial
    (
     -- * Constructor
     dialNew,
     dialCustom,
     DialType(..)
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Dial functions
     --
     -- $Dialfunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_DialC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget

#c
enum DialType {
  NormalDialType = FL_NORMAL_DIALC,
  LineDialType = FL_LINE_DIALC,
  FillDialType = FL_FILL_DIALC
};
#endc
{#enum DialType {} deriving (Show, Eq) #}

{# fun Fl_OverriddenDial_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenDial_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
dialCustom ::
       Rectangle                         -- ^ The bounds of this Dial
    -> Maybe T.Text                      -- ^ The Dial label
    -> Maybe (Ref Dial -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Dial)      -- ^ Optional custom widget functions
    -> IO (Ref Dial)
dialCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Dial_New as dialNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Dial_New_WithLabel as dialNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
dialNew :: Rectangle -> Maybe T.Text -> IO (Ref Dial)
dialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> dialNew' x_pos y_pos width height >>=
                             toRef
        Just l -> dialNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Dial_Destroy as dialDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Dial orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    dialDestroy' winPtr
    return nullPtr

{# fun Fl_Dial_set_angle1 as setAngle1' { id `Ptr ()',id `CShort' } -> `()' #}
instance (impl ~ ( Angle -> IO ())) => Op (SetAngle1 ()) Dial orig impl where
  runOp _ _ dial (Angle a) = withRef dial $ \dialPtr -> setAngle1' dialPtr a
{# fun Fl_Dial_set_angle2 as setAngle2' { id `Ptr ()',id `CShort' } -> `()' #}
instance (impl ~ ( Angle -> IO ())) => Op (SetAngle2 ()) Dial orig impl where
  runOp _ _ dial (Angle a) = withRef dial $ \dialPtr -> setAngle2' dialPtr a
{# fun Fl_Dial_angle1 as angle1' { id `Ptr ()' } -> `CShort' id #}
instance (impl ~ ( IO (Angle))) => Op (GetAngle1 ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> angle1' dialPtr >>= return . Angle
{# fun Fl_Dial_angle2 as angle2' { id `Ptr ()' } -> `CShort' id #}
instance (impl ~ ( IO (Angle))) => Op (GetAngle2 ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> angle2' dialPtr >>= return . Angle
instance (impl ~ ( Angle -> Angle -> IO ())) => Op (SetAngles ()) Dial orig impl where
  runOp _ _ dial a1' a2' = do
    setAngle1 dial a1'
    setAngle2 dial a2'
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (DialType ->  IO ())) => Op (SetType ()) Dial orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (DialType)) => Op (GetType_ ()) Dial orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_Dial_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> draw'' dialPtr
{# fun Fl_Dial_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> drawSuper' dialPtr
{#fun Fl_Dial_handle as dialHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Dial orig impl where
  runOp _ _ dial event = withRef dial (\p -> dialHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Dial_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Dial orig impl where
  runOp _ _ dial event = withRef dial $ \dialPtr -> handleSuper' dialPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Dial_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Dial orig impl where
  runOp _ _ dial rectangle = withRef dial $ \dialPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' dialPtr x_pos y_pos w_pos h_pos
{# fun Fl_Dial_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Dial orig impl where
  runOp _ _ dial rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef dial $ \dialPtr -> resizeSuper' dialPtr x_pos y_pos width height
{# fun Fl_Dial_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> hide' dialPtr
{# fun Fl_Dial_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> hideSuper' dialPtr
{# fun Fl_Dial_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> show' dialPtr
{# fun Fl_Dial_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> showSuper' dialPtr

-- $Dialfunctions
--
-- @
-- destroy :: 'Ref' 'Dial' -> 'IO' ()
--
-- draw :: 'Ref' 'Dial' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Dial' -> 'IO' ()
--
-- getAngle1 :: 'Ref' 'Dial' -> 'IO' ('Angle')
--
-- getAngle2 :: 'Ref' 'Dial' -> 'IO' ('Angle')
--
-- getType_ :: 'Ref' 'Dial' -> 'IO' ('DialType')
--
-- handle :: 'Ref' 'Dial' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Dial' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Dial' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Dial' -> 'IO' ()
--
-- resize :: 'Ref' 'Dial' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Dial' -> 'Rectangle' -> 'IO' ()
--
-- setAngle1 :: 'Ref' 'Dial' -> 'Angle' -> 'IO' ()
--
-- setAngle2 :: 'Ref' 'Dial' -> 'Angle' -> 'IO' ()
--
-- setAngles :: 'Ref' 'Dial' -> 'Angle' -> 'Angle' -> 'IO' ()
--
-- setType :: 'Ref' 'Dial' -> 'DialType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Dial' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Dial' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Dial"
-- @
