module Graphics.UI.FLTK.LowLevel.Fl_Overlay_Window
  (
  )
where
#include "Fl_C.h"
#include "Fl_Overlay_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Window
import C2HS hiding (cFromEnum, unsafePerformIO, toBool,cToEnum)

{# fun Fl_Overlay_Window_Destroy as windowDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
overlayWindowDestroy :: OverlayWindow a -> IO ()
overlayWindowDestroy win = withObject win $ \winPtr -> windowDestroy' winPtr

{# fun Fl_Overlay_Window_hide as hide' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
overlayWindowHide :: OverlayWindow a  ->  IO (())
overlayWindowHide overlayWindow = withObject overlayWindow $ \overlayWindowPtr -> hide' overlayWindowPtr

{# fun Fl_Overlay_Window_show as windowShow' {id `Ptr ()'} -> `()' supressWarningAboutRes #}
overlayWindowShow :: OverlayWindow a -> IO ()
overlayWindowShow window = withObject window $ (\p -> windowShow' p)

{# fun Fl_Overlay_Window_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
overlayWindowResize :: OverlayWindow a  -> Rectangle -> IO (())
overlayWindowResize window rectangle = withObject window $ \windowPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' windowPtr x_pos y_pos w_pos h_pos
