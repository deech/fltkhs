{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ImageSurface
       (
         imageSurfaceNew
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
#include "Fl_Image_SurfaceC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Image_Surface_New as imageSurfaceNew' {`Int', `Int'} -> `Ptr ()' id #}
imageSurfaceNew :: Size -> IO (Ref ImageSurface)
imageSurfaceNew (Size (Width w') (Height h')) = imageSurfaceNew' w' h' >>= toRef

{# fun Fl_Image_Surface_Destroy as imageSurfaceDestroy' {id `Ptr ()'} -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) ImageSurface orig impl where
  runOp _ _ image_surface = withRef image_surface $ \image_surfacePtr -> imageSurfaceDestroy' image_surfacePtr

{# fun Fl_Image_Surface_class_name as className' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ ( IO (String))) => Op (ClassName ()) ImageSurface orig impl where
  runOp _ _ image_surface = withRef image_surface $ \image_surfacePtr -> className' image_surfacePtr

{# fun Fl_Image_Surface_set_current as setCurrent' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (SetCurrent ()) ImageSurface orig impl where
  runOp _ _ image_surface = withRef image_surface $ \image_surfacePtr -> setCurrent' image_surfacePtr

{# fun Fl_Image_Surface_draw as draw' { id `Ptr ()',id `Ptr ()',`Int',`Int' } -> `()' #}
instance (Parent a Widget, impl ~ ( Ref a  -> Position -> IO ())) => Op (Draw ()) ImageSurface orig impl where
  runOp _ _ image_surface widget (Position (X delta_x) (Y delta_y)) = withRef image_surface $ \image_surfacePtr -> withRef widget $ \widgetPtr -> draw' image_surfacePtr widgetPtr delta_x delta_y


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.ImageSurface"
-- @

-- $functions
-- @
-- className :: 'Ref' 'ImageSurface' -> 'IO' ('String')
--
-- destroy :: 'Ref' 'ImageSurface' -> 'IO' ()
--
-- draw:: ('Parent' a 'Widget') => 'Ref' 'ImageSurface' -> 'Ref' a -> 'Position' -> 'IO' ()
--
-- setCurrent :: 'Ref' 'ImageSurface' -> 'IO' ()
-- @
