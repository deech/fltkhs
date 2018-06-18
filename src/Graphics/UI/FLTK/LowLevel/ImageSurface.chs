{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ImageSurface
       (
         imageSurfaceNew,
         imageSurfaceRescale
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

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Image_Surface_rescale as imageSurfaceRescale' {id `Ptr ()'} -> `()' #}
imageSurfaceRescale :: (Parent a ImageSurface) => Ref a -> IO ()
imageSurfaceRescale is = withRef is $ \imageSurfacePtr -> imageSurfaceRescale' imageSurfacePtr

{# fun Fl_Image_Surface_New as imageSurfaceNew' {`Int', `Int'} -> `Ptr ()' id #}
imageSurfaceNew :: Size -> IO (Ref ImageSurface)
imageSurfaceNew (Size (Width w') (Height h')) = imageSurfaceNew' w' h' >>= toRef

{# fun Fl_Image_Surface_Destroy as imageSurfaceDestroy' {id `Ptr ()'} -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) ImageSurface orig impl where
  runOp _ _ image_surface = withRef image_surface $ \image_surfacePtr -> imageSurfaceDestroy' image_surfacePtr

{# fun Fl_Image_Surface_set_current as setCurrent' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (SetCurrent ()) ImageSurface orig impl where
  runOp _ _ image_surface = withRef image_surface $ \image_surfacePtr -> setCurrent' image_surfacePtr

{# fun Fl_Image_Surface_draw as draw' { id `Ptr ()',id `Ptr ()',`Int',`Int' } -> `()' #}
instance (Parent a Widget, impl ~ ( Ref a  -> Position -> IO ())) => Op (Draw ()) ImageSurface orig impl where
  runOp _ _ image_surface widget (Position (X delta_x) (Y delta_y)) = withRef image_surface $ \image_surfacePtr -> withRef widget $ \widgetPtr -> draw' image_surfacePtr widgetPtr delta_x delta_y

{# fun Fl_Image_Surface_get_origin as getOrigin' {id `Ptr()', alloca- `CInt' peekIntConv*, alloca- `CInt' peekIntConv*} -> `()' #}
instance (impl ~ (IO (Position))) => Op (GetOrigin ()) ImageSurface orig impl where
  runOp _ _ image_surface =
    withRef image_surface (\ptr -> do
                             (x',y') <- getOrigin' ptr
                             return (Position (X (fromIntegral x')) (Y (fromIntegral y')))
                          )
{# fun Fl_Image_Surface_printable_rect as printableRect' {id `Ptr()', alloca- `CInt' peekIntConv*, alloca- `CInt' peekIntConv*} -> `Int' #}
instance (impl ~ (IO (Either UnknownError Size))) => Op (PrintableRect ()) ImageSurface orig impl where
  runOp _ _ image_surface =
    withRef image_surface (\ptr -> do
                             (status, w',h') <- printableRect' ptr
                             if (status == (0 :: Int))
                             then return (Right (Size (Width (fromIntegral w')) (Height (fromIntegral h'))))
                             else return (Left UnknownError)
                          )

{# fun Fl_Image_Surface_set_origin as setOrigin' {id `Ptr()', `Int', `Int'} -> `()' #}
instance (impl ~ (Position -> IO ())) => Op (SetOrigin ()) ImageSurface orig impl where
  runOp _ _ image_surface (Position (X x') (Y y')) =
    withRef image_surface (\ptr -> setOrigin' ptr (fromIntegral x') (fromIntegral y'))

{# fun Fl_Image_Surface_offscreen as offscreen' {id `Ptr()' } -> `Fl_Offscreen' id #}
instance (impl ~ ( IO (FlOffscreen))) => Op (GetOffscreen ()) ImageSurface orig impl where
  runOp _ _ image_surface =
    withRef image_surface (\ptr -> offscreen' ptr  >>= return . FlOffscreen )

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.ImageSurface"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'ImageSurface' -> 'IO' ()
--
-- draw:: ('Parent' a 'Widget') => 'Ref' 'ImageSurface' -> 'Ref' a -> 'Position' -> 'IO' ()
--
-- getOffscreen :: 'Ref' 'ImageSurface' -> 'IO' ('FlOffscreen')
--
-- getOrigin :: 'Ref' 'ImageSurface' -> 'IO' ('Position')
--
-- printableRect :: 'Ref' 'ImageSurface' -> 'IO' ('Either' 'UnknownError' 'Size')
--
-- setCurrent :: 'Ref' 'ImageSurface' -> 'IO' ()
--
-- setOrigin :: 'Ref' 'ImageSurface' -> 'Position' -> 'IO' ()
-- @
