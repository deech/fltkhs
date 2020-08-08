{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Positioner
    (
     -- * Constructor
     positionerNew,
     positionerCustom
  , drawPositionerBase
  , handlePositionerBase
  , resizePositionerBase
  , hidePositionerBase
  , showWidgetPositionerBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
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
instance (impl ~ (IO ())) => Op (Destroy ()) PositionerBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    positionerDestroy' winPtr
    return nullPtr

{# fun Fl_Positioner_set_xvalue as setXvalue' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseX ->  IO ())) => Op (SetXvalue ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseX xvalue) = withRef positioner $ \positionerPtr -> setXvalue' positionerPtr xvalue
{# fun Fl_Positioner_xvalue as xvalue' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseX))) => Op (GetXvalue ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> xvalue' positionerPtr >>= return . PreciseX
{# fun Fl_Positioner_set_yvalue as setYvalue' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseY ->  IO ())) => Op (SetYvalue ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseY yvalue) = withRef positioner $ \positionerPtr -> setYvalue' positionerPtr yvalue
{# fun Fl_Positioner_yvalue as yvalue' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseY))) => Op (GetYvalue ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> yvalue' positionerPtr >>= return . PreciseY
{# fun Fl_Positioner_set_xminimum as setXminimum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseX ->  IO ())) => Op (SetXminimum ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseX xminimum) = withRef positioner $ \positionerPtr -> setXminimum' positionerPtr xminimum
{# fun Fl_Positioner_xminimum as xminimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseX))) => Op (GetXminimum ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> xminimum' positionerPtr >>= return . PreciseX
{# fun Fl_Positioner_set_yminimum as setYminimum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseY ->  IO ())) => Op (SetYminimum ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseY yminimum) = withRef positioner $ \positionerPtr -> setYminimum' positionerPtr yminimum
{# fun Fl_Positioner_yminimum as yminimum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseY))) => Op (GetYminimum ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> yminimum' positionerPtr >>= return . PreciseY
{# fun Fl_Positioner_set_xmaximum as setXmaximum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseX ->  IO ())) => Op (SetXmaximum ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseX xmaximum) = withRef positioner $ \positionerPtr -> setXmaximum' positionerPtr xmaximum
{# fun Fl_Positioner_xmaximum as xmaximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseX))) => Op (GetXmaximum ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> xmaximum' positionerPtr >>= return . PreciseX
{# fun Fl_Positioner_set_ymaximum as setYmaximum' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (PreciseY ->  IO ())) => Op (SetYmaximum ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseY ymaximum) = withRef positioner $ \positionerPtr -> setYmaximum' positionerPtr ymaximum
{# fun Fl_Positioner_ymaximum as ymaximum' { id `Ptr ()' } -> `Double' #}
instance (impl ~ ( IO (PreciseY))) => Op (GetYmaximum ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> ymaximum' positionerPtr >>= return . PreciseY
{# fun Fl_Positioner_xbounds as xbounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
instance (impl ~ (PreciseX -> PreciseX ->  IO ())) => Op (SetXbounds ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseX xstart) (PreciseX xend) = withRef positioner $ \positionerPtr -> xbounds' positionerPtr xstart xend
{# fun Fl_Positioner_ybounds as ybounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
instance (impl ~ (PreciseY -> PreciseY ->  IO ())) => Op (SetYbounds ()) PositionerBase orig impl where
  runOp _ _ positioner (PreciseY ystart) (PreciseY yend) = withRef positioner $ \positionerPtr -> ybounds' positionerPtr ystart yend
{# fun Fl_Positioner_xstep as xstep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetXstep ()) PositionerBase orig impl where
  runOp _ _ positioner xstep = withRef positioner $ \positionerPtr -> xstep' positionerPtr xstep
{# fun Fl_Positioner_ystep as ystep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetYstep ()) PositionerBase orig impl where
  runOp _ _ positioner ystep = withRef positioner $ \positionerPtr -> ystep' positionerPtr ystep

{# fun Fl_Positioner_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawPositionerBase ::  Ref PositionerBase -> IO ()
drawPositionerBase positioner = withRef positioner $ \positionerPtr -> drawSuper' positionerPtr
{# fun Fl_Positioner_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handlePositionerBase :: Ref PositionerBase -> Event ->  IO (Either UnknownEvent ())
handlePositionerBase positioner event = withRef positioner $ \positionerPtr -> handleSuper' positionerPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Positioner_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizePositionerBase :: Ref PositionerBase -> Rectangle -> IO ()
resizePositionerBase positioner rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef positioner $ \positionerPtr -> resizeSuper' positionerPtr x_pos y_pos width height
{# fun Fl_Positioner_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hidePositionerBase ::  Ref PositionerBase -> IO ()
hidePositionerBase positioner = withRef positioner $ \positionerPtr -> hideSuper' positionerPtr
{# fun Fl_Positioner_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetPositionerBase ::  Ref PositionerBase -> IO ()
showWidgetPositionerBase positioner = withRef positioner $ \positionerPtr -> showSuper' positionerPtr

{# fun Fl_Positioner_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> draw'' positionerPtr
{#fun Fl_Positioner_handle as positionerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) PositionerBase orig impl where
  runOp _ _ positioner event = withRef positioner (\p -> positionerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Positioner_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) PositionerBase orig impl where
  runOp _ _ positioner rectangle = withRef positioner $ \positionerPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' positionerPtr x_pos y_pos w_pos h_pos
{# fun Fl_Positioner_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> hide' positionerPtr
{# fun Fl_Positioner_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) PositionerBase orig impl where
  runOp _ _ positioner = withRef positioner $ \positionerPtr -> show' positionerPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Positioner"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'PositionerBase' -> 'IO' ()
--
-- draw :: 'Ref' 'PositionerBase' -> 'IO' ()
--
-- getXmaximum :: 'Ref' 'PositionerBase' -> 'IO' ('PreciseX')
--
-- getXminimum :: 'Ref' 'PositionerBase' -> 'IO' ('PreciseX')
--
-- getXvalue :: 'Ref' 'PositionerBase' -> 'IO' ('PreciseX')
--
-- getYmaximum :: 'Ref' 'PositionerBase' -> 'IO' ('PreciseY')
--
-- getYminimum :: 'Ref' 'PositionerBase' -> 'IO' ('PreciseY')
--
-- getYvalue :: 'Ref' 'PositionerBase' -> 'IO' ('PreciseY')
--
-- handle :: 'Ref' 'PositionerBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'PositionerBase' -> 'IO' ()
--
-- resize :: 'Ref' 'PositionerBase' -> 'Rectangle' -> 'IO' ()
--
-- setXbounds :: 'Ref' 'PositionerBase' -> 'PreciseX' -> 'PreciseX' -> 'IO' ()
--
-- setXmaximum :: 'Ref' 'PositionerBase' -> 'PreciseX' -> 'IO' ()
--
-- setXminimum :: 'Ref' 'PositionerBase' -> 'PreciseX' -> 'IO' ()
--
-- setXstep :: 'Ref' 'PositionerBase' -> 'Double' -> 'IO' ()
--
-- setXvalue :: 'Ref' 'PositionerBase' -> 'PreciseX' -> 'IO' ()
--
-- setYbounds :: 'Ref' 'PositionerBase' -> 'PreciseY' -> 'PreciseY' -> 'IO' ()
--
-- setYmaximum :: 'Ref' 'PositionerBase' -> 'PreciseY' -> 'IO' ()
--
-- setYminimum :: 'Ref' 'PositionerBase' -> 'PreciseY' -> 'IO' ()
--
-- setYstep :: 'Ref' 'PositionerBase' -> 'Double' -> 'IO' ()
--
-- setYvalue :: 'Ref' 'PositionerBase' -> 'PreciseY' -> 'IO' ()
--
-- showWidget :: 'Ref' 'PositionerBase' -> 'IO' ()
-- @
