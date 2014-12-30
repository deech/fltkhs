{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Positioner
    (
     -- * Constructor
     positionerNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_PositionerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Positioner_New as positionerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Positioner_New_WithLabel as positionerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
positionerNew :: Rectangle -> Maybe String -> IO (Ref Positioner)
positionerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> positionerNew' x_pos y_pos width height >>=
                             toRef
        Just l -> positionerNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Positioner_Destroy as positionerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Positioner ( IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    positionerDestroy' winPtr
    return nullPtr

{#fun Fl_Positioner_handle as positionerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Positioner ( Event -> IO Int) where
  runOp _ positioner event = withRef positioner (\p -> positionerHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Positioner_set_xvalue as setXvalue' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetXvalue ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner xvalue = withRef positioner $ \positionerPtr -> setXvalue' positionerPtr xvalue
{# fun unsafe Fl_Positioner_xvalue as xvalue' { id `Ptr ()' } -> `Double' #}
instance Op (GetXvalue ()) Positioner (  IO (Double)) where
  runOp _ positioner = withRef positioner $ \positionerPtr -> xvalue' positionerPtr
{# fun unsafe Fl_Positioner_set_yvalue as setYvalue' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetYvalue ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner yvalue = withRef positioner $ \positionerPtr -> setYvalue' positionerPtr yvalue
{# fun unsafe Fl_Positioner_yvalue as yvalue' { id `Ptr ()' } -> `Double' #}
instance Op (GetYvalue ()) Positioner (  IO (Double)) where
  runOp _ positioner = withRef positioner $ \positionerPtr -> yvalue' positionerPtr
{# fun unsafe Fl_Positioner_set_xminimum as setXminimum' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetXminimum ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner xminimum = withRef positioner $ \positionerPtr -> setXminimum' positionerPtr xminimum
{# fun unsafe Fl_Positioner_xminimum as xminimum' { id `Ptr ()' } -> `Double' #}
instance Op (GetXminimum ()) Positioner (  IO (Double)) where
  runOp _ positioner = withRef positioner $ \positionerPtr -> xminimum' positionerPtr
{# fun unsafe Fl_Positioner_set_yminimum as setYminimum' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetYminimum ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner yminimum = withRef positioner $ \positionerPtr -> setYminimum' positionerPtr yminimum
{# fun unsafe Fl_Positioner_yminimum as yminimum' { id `Ptr ()' } -> `Double' #}
instance Op (GetYminimum ()) Positioner (  IO (Double)) where
  runOp _ positioner = withRef positioner $ \positionerPtr -> yminimum' positionerPtr
{# fun unsafe Fl_Positioner_set_xmaximum as setXmaximum' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetXmaximum ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner xmaximum = withRef positioner $ \positionerPtr -> setXmaximum' positionerPtr xmaximum
{# fun unsafe Fl_Positioner_xmaximum as xmaximum' { id `Ptr ()' } -> `Double' #}
instance Op (GetXmaximum ()) Positioner (  IO (Double)) where
  runOp _ positioner = withRef positioner $ \positionerPtr -> xmaximum' positionerPtr
{# fun unsafe Fl_Positioner_set_ymaximum as setYmaximum' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetYmaximum ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner ymaximum = withRef positioner $ \positionerPtr -> setYmaximum' positionerPtr ymaximum
{# fun unsafe Fl_Positioner_ymaximum as ymaximum' { id `Ptr ()' } -> `Double' #}
instance Op (GetYmaximum ()) Positioner (  IO (Double)) where
  runOp _ positioner = withRef positioner $ \positionerPtr -> ymaximum' positionerPtr
{# fun unsafe Fl_Positioner_xbounds as xbounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
instance Op (SetXbounds ()) Positioner ( Double -> Double ->  IO ()) where
  runOp _ positioner xstart xend = withRef positioner $ \positionerPtr -> xbounds' positionerPtr xstart xend
{# fun unsafe Fl_Positioner_ybounds as ybounds' { id `Ptr ()',`Double',`Double' } -> `()' #}
instance Op (SetYbounds ()) Positioner ( Double -> Double ->  IO ()) where
  runOp _ positioner ystart yend = withRef positioner $ \positionerPtr -> ybounds' positionerPtr ystart yend
{# fun unsafe Fl_Positioner_xstep as xstep' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetXstep ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner xstep = withRef positioner $ \positionerPtr -> xstep' positionerPtr xstep
{# fun unsafe Fl_Positioner_ystep as ystep' { id `Ptr ()',`Double' } -> `()' #}
instance Op (SetYstep ()) Positioner ( Double ->  IO ()) where
  runOp _ positioner ystep = withRef positioner $ \positionerPtr -> ystep' positionerPtr ystep
