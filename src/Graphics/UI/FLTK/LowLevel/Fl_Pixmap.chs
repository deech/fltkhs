module Graphics.UI.FLTK.LowLevel.Fl_Pixmap
 (
     pixmapNew,
     pixmapDestroy,
     pixmapW,
     pixmapH,
     pixmapD,
     pixmapUncache,
     pixmapDrawResize,
     pixmapDraw,
     pixmapDesaturate,
     pixmapInactive,
     pixmapColorAverage,
     pixmapCopy,
     pixmapCopyWithWH,
     pixmapCount,
     pixmapLd,
     pixmapLabelWithMenuItem,
     pixmapLabelWithWidget
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_PixmapC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun unsafe Fl_Pixmap_New as flPixmapNew' { id `Ptr (Ptr CChar)'} -> `Ptr ()' id #}
pixmapNew :: PixmapHs -> IO (Pixmap a)
pixmapNew pixmap = withPixmap pixmap (\ptr -> flPixmapNew' ptr >>= toObject)
{# fun unsafe Fl_Pixmap_Destroy as flPixmapDestroy' { id `Ptr ()' } -> `()' id #}
pixmapDestroy :: Pixmap a -> IO ()
pixmapDestroy pixmap = withObject pixmap $ \pixmapPtr -> flPixmapDestroy' pixmapPtr
{# fun unsafe Fl_Pixmap_w as w' { id `Ptr ()' } -> `Int' #}
pixmapW :: Pixmap a  ->  IO (Int)
pixmapW pixmap = withObject pixmap $ \pixmapPtr -> w' pixmapPtr
{# fun unsafe Fl_Pixmap_h as h' { id `Ptr ()' } -> `Int' #}
pixmapH :: Pixmap a  ->  IO (Int)
pixmapH pixmap = withObject pixmap $ \pixmapPtr -> h' pixmapPtr
{# fun unsafe Fl_Pixmap_d as d' { id `Ptr ()' } -> `Int' #}
pixmapD :: Pixmap a  ->  IO (Int)
pixmapD pixmap = withObject pixmap $ \pixmapPtr -> d' pixmapPtr
{# fun unsafe Fl_Pixmap_uncache as uncache' { id `Ptr ()' } -> `()' #}
pixmapUncache :: Pixmap a  ->  IO ()
pixmapUncache pixmap = withObject pixmap $ \pixmapPtr -> uncache' pixmapPtr
{# fun unsafe Fl_Pixmap_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Pixmap_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Pixmap_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Pixmap_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
pixmapDrawResize :: Pixmap a -> Position -> Size -> Maybe X -> Maybe Y -> IO ()
pixmapDrawResize pixmap (Position (X x) (Y y)) (Size (Width w) (Height h)) xOffset yOffset =
  case (xOffset, yOffset) of
    (Just (X xOff), Just (Y yOff)) ->
      withObject pixmap $ \pixmapPtr -> drawWithCxCy' pixmapPtr x y w h (fromIntegral xOff) (fromIntegral yOff)
    (Just (X xOff), Nothing) ->
      withObject pixmap $ \pixmapPtr -> drawWithCx' pixmapPtr x y w h (fromIntegral xOff)
    (Nothing, Just (Y yOff)) ->
      withObject pixmap $ \pixmapPtr -> drawWithCy' pixmapPtr x y w h (fromIntegral yOff)
    (Nothing, Nothing) ->
      withObject pixmap $ \pixmapPtr -> drawWith' pixmapPtr x y w h

{# fun unsafe Fl_Pixmap_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
pixmapDraw :: Pixmap a  -> Position ->  IO ()
pixmapDraw image (Position (X x_pos') (Y y_pos')) = withObject image $ \imagePtr -> draw' imagePtr x_pos' y_pos'

{# fun unsafe Fl_Pixmap_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
pixmapDesaturate :: Pixmap a  ->  IO ()
pixmapDesaturate pixmap = withObject pixmap $ \pixmapPtr -> desaturate' pixmapPtr
{# fun unsafe Fl_Pixmap_inactive as inactive' { id `Ptr ()' } -> `()' #}
pixmapInactive :: Pixmap a  ->  IO ()
pixmapInactive pixmap = withObject pixmap $ \pixmapPtr -> inactive' pixmapPtr
{# fun unsafe Fl_Pixmap_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
pixmapColorAverage :: Pixmap a  -> Color -> Float ->  IO ()
pixmapColorAverage pixmap c i = withObject pixmap $ \pixmapPtr -> colorAverage' pixmapPtr c i
{# fun unsafe Fl_Pixmap_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
pixmapCopy :: Pixmap a  ->  IO (Ptr ())
pixmapCopy pixmap = withObject pixmap $ \pixmapPtr -> copy' pixmapPtr
{# fun unsafe Fl_Pixmap_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
pixmapCopyWithWH :: Pixmap a  -> Int -> Int ->  IO (Ptr ())
pixmapCopyWithWH pixmap w h = withObject pixmap $ \pixmapPtr -> copyWithWH' pixmapPtr w h
{# fun unsafe Fl_Pixmap_count as count' { id `Ptr ()' } -> `Int' #}
pixmapCount :: Pixmap a  ->  IO (Int)
pixmapCount pixmap = withObject pixmap $ \pixmapPtr -> count' pixmapPtr
{# fun unsafe Fl_Pixmap_ld as ld' { id `Ptr ()' } -> `Int' #}
pixmapLd :: Pixmap a  ->  IO (Int)
pixmapLd pixmap = withObject pixmap $ \pixmapPtr -> ld' pixmapPtr

{# fun unsafe Fl_Pixmap_label as labelWithMenuItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
pixmapLabelWithMenuItem :: Pixmap a  -> MenuItem b  ->  IO ()
pixmapLabelWithMenuItem pixmap m = withObject pixmap $ \pixmapPtr -> withObject m $ \mPtr -> labelWithMenuItem' pixmapPtr mPtr
{# fun unsafe Fl_Pixmap_label as label' { id `Ptr ()',id `Ptr ()' } -> `()' #}
pixmapLabelWithWidget :: Pixmap a  -> Widget b  ->  IO ()
pixmapLabelWithWidget pixmap w = withObject pixmap $ \pixmapPtr -> withObject w $ \wPtr -> label' pixmapPtr wPtr
