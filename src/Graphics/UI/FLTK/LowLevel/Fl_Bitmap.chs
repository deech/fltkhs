module Graphics.UI.FLTK.LowLevel.Fl_Bitmap
 (
  bitmapNew,
  bitmapDestroy,
  bitmapW,
  bitmapH,
  bitmapD,
  bitmapLd,
  bitmapCount,
  bitmapCopy,
  bitmapColorAverage,
  bitmapInactive,
  bitmapDesaturate,
  bitmapDrawResize,
  bitmapDraw,
  bitmapUncache
  )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_BitmapC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

{# fun unsafe Fl_Bitmap_New as flBitmapNew' { id `Ptr CChar',`Int',`Int' } -> `Ptr ()' id #}
bitmapNew :: BitmapHs -> IO (Bitmap a)
bitmapNew bitmap = withBitmap bitmap (\ptr width' height' -> flBitmapNew' ptr width' height' >>= toObject)
{# fun unsafe Fl_Bitmap_Destroy as flBitmapDestroy' { id `Ptr ()' } -> `()' id #}
bitmapDestroy :: Bitmap a -> IO ()
bitmapDestroy bitmap = withObject bitmap $ \bitmapPtr -> flBitmapDestroy' bitmapPtr                
{# fun unsafe Fl_Bitmap_w as w' { id `Ptr ()' } -> `Int' #}
bitmapW :: Bitmap a  ->  IO (Int)
bitmapW bitmap = withObject bitmap $ \bitmapPtr -> w' bitmapPtr
{# fun unsafe Fl_Bitmap_h as h' { id `Ptr ()' } -> `Int' #}
bitmapH :: Bitmap a  ->  IO (Int)
bitmapH bitmap = withObject bitmap $ \bitmapPtr -> h' bitmapPtr
{# fun unsafe Fl_Bitmap_d as d' { id `Ptr ()' } -> `Int' #}
bitmapD :: Bitmap a  ->  IO (Int)
bitmapD bitmap = withObject bitmap $ \bitmapPtr -> d' bitmapPtr
{# fun unsafe Fl_Bitmap_ld as ld' { id `Ptr ()' } -> `Int' #}
bitmapLd :: Bitmap a  ->  IO (Int)
bitmapLd bitmap = withObject bitmap $ \bitmapPtr -> ld' bitmapPtr
{# fun unsafe Fl_Bitmap_count as count' { id `Ptr ()' } -> `Int' #}
bitmapCount :: Bitmap a  ->  IO (Int)
bitmapCount bitmap = withObject bitmap $ \bitmapPtr -> count' bitmapPtr
{# fun unsafe Fl_Bitmap_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
{# fun unsafe Fl_Bitmap_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
bitmapCopy :: Bitmap a  ->  Maybe Size -> IO (Bitmap b)
bitmapCopy bitmap size' = case size' of
  Just (Size (Width w) (Height h)) -> withObject bitmap $ \bitmapPtr -> copyWithWH' bitmapPtr w h >>= toObject
  Nothing -> withObject bitmap $ \bitmapPtr -> copy' bitmapPtr >>= toObject
{# fun unsafe Fl_Bitmap_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
bitmapColorAverage :: Bitmap a  -> Color -> Float ->  IO ()
bitmapColorAverage bitmap c i = withObject bitmap $ \bitmapPtr -> colorAverage' bitmapPtr c i
{# fun unsafe Fl_Bitmap_inactive as inactive' { id `Ptr ()' } -> `()' #}
bitmapInactive :: Bitmap a  ->  IO ()
bitmapInactive bitmap = withObject bitmap $ \bitmapPtr -> inactive' bitmapPtr
{# fun unsafe Fl_Bitmap_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
bitmapDesaturate :: Bitmap a  ->  IO ()
bitmapDesaturate bitmap = withObject bitmap $ \bitmapPtr -> desaturate' bitmapPtr

{# fun unsafe Fl_Bitmap_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Bitmap_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Bitmap_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Bitmap_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
bitmapDrawResize :: Bitmap a -> Position -> Size -> Maybe X -> Maybe Y -> IO ()
bitmapDrawResize bitmap (Position (X x) (Y y)) (Size (Width w) (Height h)) xOffset yOffset =
  case (xOffset, yOffset) of
    (Just (X xOff), Just (Y yOff)) ->
      withObject bitmap $ \bitmapPtr -> drawWithCxCy' bitmapPtr x y w h (fromIntegral xOff) (fromIntegral yOff)
    (Just (X xOff), Nothing) ->
      withObject bitmap $ \bitmapPtr -> drawWithCx' bitmapPtr x y w h (fromIntegral xOff)
    (Nothing, Just (Y yOff)) ->
      withObject bitmap $ \bitmapPtr -> drawWithCy' bitmapPtr x y w h (fromIntegral yOff)
    (Nothing, Nothing) ->
      withObject bitmap $ \bitmapPtr -> drawWith' bitmapPtr x y w h

{# fun unsafe Fl_Bitmap_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
bitmapDraw :: Bitmap a  -> Position ->  IO ()
bitmapDraw image (Position (X x_pos') (Y y_pos')) = withObject image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun unsafe Fl_Bitmap_uncache as uncache' { id `Ptr ()' } -> `()' #}
bitmapUncache :: Bitmap a  ->  IO ()
bitmapUncache bitmap = withObject bitmap $ \bitmapPtr -> uncache' bitmapPtr
