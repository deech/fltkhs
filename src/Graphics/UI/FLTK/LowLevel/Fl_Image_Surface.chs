{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Image_Surface
    (
     imageSurfaceClassName,
     imageSurfaceSetCurrent,
     imageSurfaceDraw,
     imageSurfaceImage,
     imageSurfaceNew,
     imageSurfaceDestroy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Image_SurfaceC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Image_Surface_New as imageSurfaceNew' {`Int', `Int'} -> `Ptr ()' id #}
imageSurfaceNew :: Size -> IO (ImageSurface ())
imageSurfaceNew (Size (Width w') (Height h')) = imageSurfaceNew' w' h' >>= toObject

{# fun Fl_Image_Surface_Destroy as imageSurfaceDestroy' {id `Ptr ()'} -> `()' #}
imageSurfaceDestroy :: ImageSurface a -> IO ()
imageSurfaceDestroy copy_surface = withObject copy_surface $ \copy_surfacePtr -> imageSurfaceDestroy' copy_surfacePtr

{# fun unsafe Fl_Image_Surface_class_name as className' { id `Ptr ()' } -> `String' #}
imageSurfaceClassName :: ImageSurface a  ->  IO (String)
imageSurfaceClassName image_surface = withObject image_surface $ \image_surfacePtr -> className' image_surfacePtr

{# fun unsafe Fl_Image_Surface_set_current as setCurrent' { id `Ptr ()' } -> `()' #}
imageSurfaceSetCurrent :: ImageSurface a  ->  IO ()
imageSurfaceSetCurrent image_surface = withObject image_surface $ \image_surfacePtr -> setCurrent' image_surfacePtr

{# fun unsafe Fl_Image_Surface_draw as draw' { id `Ptr ()',id `Ptr ()',`Int',`Int' } -> `()' #}
imageSurfaceDraw :: ImageSurface a  -> Widget b -> Position ->  IO ()
imageSurfaceDraw image_surface widget (Position (X x_pos') (Y y_pos')) = withObject image_surface $ \image_surfacePtr -> withObject widget $ \widgetPtr -> draw' image_surfacePtr widgetPtr x_pos' y_pos'

{# fun unsafe Fl_Image_Surface_image as image' { id `Ptr ()' } -> `Ptr ()' id #}
imageSurfaceImage :: ImageSurface a  ->  IO (Image ())
imageSurfaceImage image_surface = withObject image_surface $ \image_surfacePtr -> image' image_surfacePtr >>= toObject
