{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Positioner
    (
     -- * Constructor
     positionerNew,
     positionerCustom
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
#include "Fl_PositionerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_OverriddenPositioner_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenPositioner_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
positionerCustom ::
       Rectangle                         -- ^ The bounds of this Positioner
    -> Maybe T.Text                      -- ^ The Positioner label
    -> Maybe (Ref Positioner -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Positioner)      -- ^ Optional custom widget functions
    -> IO (Ref Positioner)
positionerCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Positioner_New as positionerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Positioner_New_WithLabel as positionerNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
positionerNew :: Rectangle -> Maybe T.Text -> IO (Ref Positioner)
positionerNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Positioner_Destroy as positionerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Positioner orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    positionerDestroy' winPtr
    return nullPtr

{# fun Fl_Positioner_set_xvalue as setXvalue' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseX ->  IO ())) => Op (SetXvalue ()) Positioner orig impl where
  runOp _ _ positioner (PreciseX xvalue) = withRef positioner $ \positionerPtr -> setXvalue' positionerPtr xvalue
{# fun Fl_Positioner_xvalue as xvalue' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseX))) => Op (GetXvalue ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> xvalue' positionerPtr >>= return . PreciseX
{# fun Fl_Positioner_set_yvalue as setYvalue' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseY ->  IO ())) => Op (SetYvalue ()) Positioner orig impl where
  runOp _ _ positioner (PreciseY yvalue) = withRef positioner $ \positionerPtr -> setYvalue' positionerPtr yvalue
{# fun Fl_Positioner_yvalue as yvalue' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseY))) => Op (GetYvalue ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> yvalue' positionerPtr >>= return . PreciseY
{# fun Fl_Positioner_set_xminimum as setXminimum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseX ->  IO ())) => Op (SetXminimum ()) Positioner orig impl where
  runOp _ _ positioner (PreciseX xminimum) = withRef positioner $ \positionerPtr -> setXminimum' positionerPtr xminimum
{# fun Fl_Positioner_xminimum as xminimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseX))) => Op (GetXminimum ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> xminimum' positionerPtr >>= return . PreciseX
{# fun Fl_Positioner_set_yminimum as setYminimum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseY ->  IO ())) => Op (SetYminimum ()) Positioner orig impl where
  runOp _ _ positioner (PreciseY yminimum) = withRef positioner $ \positionerPtr -> setYminimum' positionerPtr yminimum
{# fun Fl_Positioner_yminimum as yminimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseY))) => Op (GetYminimum ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> yminimum' positionerPtr >>= return . PreciseY
{# fun Fl_Positioner_set_xmaximum as setXmaximum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseX ->  IO ())) => Op (SetXmaximum ()) Positioner orig impl where
  runOp _ _ positioner (PreciseX xmaximum) = withRef positioner $ \positionerPtr -> setXmaximum' positionerPtr xmaximum
{# fun Fl_Positioner_xmaximum as xmaximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseX))) => Op (GetXmaximum ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> xmaximum' positionerPtr >>= return . PreciseX
{# fun Fl_Positioner_set_ymaximum as setYmaximum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseY ->  IO ())) => Op (SetYmaximum ()) Positioner orig impl where
  runOp _ _ positioner (PreciseY ymaximum) = withRef positioner $ \positionerPtr -> setYmaximum' positionerPtr ymaximum
{# fun Fl_Positioner_ymaximum as ymaximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseY))) => Op (GetYmaximum ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> ymaximum' positionerPtr >>= return . PreciseY
{# fun Fl_Positioner_xbounds as xbounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
instance (impl ~ (PreciseX -> PreciseX ->  IO ())) => Op (SetXbounds ()) Positioner orig impl where
  runOp _ _ positioner (PreciseX xstart) (PreciseX xend) = withRef positioner $ \positionerPtr -> xbounds' positionerPtr xstart xend
{# fun Fl_Positioner_ybounds as ybounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
instance (impl ~ (PreciseY -> PreciseY ->  IO ())) => Op (SetYbounds ()) Positioner orig impl where
  runOp _ _ positioner (PreciseY ystart) (PreciseY yend) = withRef positioner $ \positionerPtr -> ybounds' positionerPtr ystart yend
{# fun Fl_Positioner_xstep as xstep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetXstep ()) Positioner orig impl where
  runOp _ _ positioner xstep = withRef positioner $ \positionerPtr -> xstep' positionerPtr xstep
{# fun Fl_Positioner_ystep as ystep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetYstep ()) Positioner orig impl where
  runOp _ _ positioner ystep = withRef positioner $ \positionerPtr -> ystep' positionerPtr ystep
{# fun Fl_Positioner_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> draw'' positionerPtr
{# fun Fl_Positioner_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> drawSuper' positionerPtr
{#fun Fl_Positioner_handle as positionerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Positioner orig impl where
  runOp _ _ positioner event = withRef positioner (\p -> positionerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Positioner_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Positioner orig impl where
  runOp _ _ positioner event = withRef positioner $ \positionerPtr -> handleSuper' positionerPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Positioner_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Positioner orig impl where
  runOp _ _ positioner rectangle = withRef positioner $ \positionerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' positionerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Positioner_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Positioner orig impl where
  runOp _ _ positioner rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef positioner $ \positionerPtr -> resizeSuper' positionerPtr x_pos y_pos width height
{# fun Fl_Positioner_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> hide' positionerPtr
{# fun Fl_Positioner_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> hideSuper' positionerPtr
{# fun Fl_Positioner_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> show' positionerPtr
{# fun Fl_Positioner_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Positioner orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> showSuper' positionerPtr

-- $functions
-- @
-- destroy :: 'Ref' 'Positioner' -> 'IO' ()
--
-- draw :: 'Ref' 'Positioner' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Positioner' -> 'IO' ()
--
-- getXmaximum :: 'Ref' 'Positioner' -> 'IO' ('PreciseX')
--
-- getXminimum :: 'Ref' 'Positioner' -> 'IO' ('PreciseX')
--
-- getXvalue :: 'Ref' 'Positioner' -> 'IO' ('PreciseX')
--
-- getYmaximum :: 'Ref' 'Positioner' -> 'IO' ('PreciseY')
--
-- getYminimum :: 'Ref' 'Positioner' -> 'IO' ('PreciseY')
--
-- getYvalue :: 'Ref' 'Positioner' -> 'IO' ('PreciseY')
--
-- handle :: 'Ref' 'Positioner' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Positioner' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Positioner' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Positioner' -> 'IO' ()
--
-- resize :: 'Ref' 'Positioner' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Positioner' -> 'Rectangle' -> 'IO' ()
--
-- setXbounds :: 'Ref' 'Positioner' -> 'PreciseX' -> 'PreciseX' -> 'IO' ()
--
-- setXmaximum :: 'Ref' 'Positioner' -> 'PreciseX' -> 'IO' ()
--
-- setXminimum :: 'Ref' 'Positioner' -> 'PreciseX' -> 'IO' ()
--
-- setXstep :: 'Ref' 'Positioner' -> 'Double' -> 'IO' ()
--
-- setXvalue :: 'Ref' 'Positioner' -> 'PreciseX' -> 'IO' ()
--
-- setYbounds :: 'Ref' 'Positioner' -> 'PreciseY' -> 'PreciseY' -> 'IO' ()
--
-- setYmaximum :: 'Ref' 'Positioner' -> 'PreciseY' -> 'IO' ()
--
-- setYminimum :: 'Ref' 'Positioner' -> 'PreciseY' -> 'IO' ()
--
-- setYstep :: 'Ref' 'Positioner' -> 'Double' -> 'IO' ()
--
-- setYvalue :: 'Ref' 'Positioner' -> 'PreciseY' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Positioner' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Positioner' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Positioner"
-- @
