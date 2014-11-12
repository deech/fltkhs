{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Copy_Surface
       (
         copySurfaceNew,
         copySurfaceDestroy,
         copySurfaceSetCurrent,
         copySurfaceClassName,
         copySurfaceDraw
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Copy_SurfaceC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Copy_Surface_New as copySurfaceNew' {`Int', `Int'} -> `Ptr ()' id #}
copySurfaceNew :: Size -> IO (CopySurface ())
copySurfaceNew (Size (Width w') (Height h')) = copySurfaceNew' w' h' >>= toObject

{# fun Fl_Copy_Surface_Destroy as copySurfaceDestroy' {id `Ptr ()'} -> `()' #}
copySurfaceDestroy :: CopySurface a -> IO ()
copySurfaceDestroy copy_surface = withObject copy_surface $ \copy_surfacePtr -> copySurfaceDestroy' copy_surfacePtr

{# fun unsafe Fl_Copy_Surface_class_name as className' { id `Ptr ()' } -> `String' #}
copySurfaceClassName :: CopySurface a  ->  IO (String)
copySurfaceClassName copy_surface = withObject copy_surface $ \copy_surfacePtr -> className' copy_surfacePtr

{# fun unsafe Fl_Copy_Surface_set_current as setCurrent' { id `Ptr ()' } -> `()' #}
copySurfaceSetCurrent :: CopySurface a  ->  IO ()
copySurfaceSetCurrent copy_surface = withObject copy_surface $ \copy_surfacePtr -> setCurrent' copy_surfacePtr

{# fun unsafe Fl_Copy_Surface_draw as draw' { id `Ptr ()',id `Ptr ()',`Int',`Int' } -> `()' #}
copySurfaceDraw :: CopySurface a  -> Widget a  -> Position -> IO ()
copySurfaceDraw copy_surface widget (Position (X delta_x) (Y delta_y)) = withObject copy_surface $ \copy_surfacePtr -> withObject widget $ \widgetPtr -> draw' copy_surfacePtr widgetPtr delta_x delta_y
