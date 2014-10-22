{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Image
       (
       ImageFuncs(..),
       imageW,
       imageH,
       imageD,
       imageLd,
       imageCount,
       imageCopy,
       imageColorAverage,
       imageInactive,
       imageDesaturate,
       imageLabel,
       imageLabelWithMenuItem,
       imageDrawResize,
       imageDraw,
       imageUncache
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ImageC.h"
import C2HS hiding (cFromEnum, unsafePerformIO, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

data ImageFuncs a =
  ImageFuncs
  {
    imageDrawOverride  :: Maybe (WidgetCallback a),
    imageColorAverageOverride :: Maybe (Image a -> Color -> Float -> IO ()),
    imageCopyOverride :: Maybe (Image a -> IO (Image a)),
    imageDesaturateOverride :: Maybe (Image a -> IO ()),
    imageLabelOverride :: Maybe (Image a -> Widget a -> IO ()),
    imageLabelWithMenuItemOverride :: Maybe (Image a -> MenuItem a -> IO ()),
    imageUncacheOverride :: Maybe (Image a -> IO ())
  }

{# fun unsafe Fl_Image_w as w' { id `Ptr ()' } -> `Int' #}
imageW :: Image a  ->  IO (Int)
imageW image = withObject image $ \imagePtr -> w' imagePtr
{# fun unsafe Fl_Image_h as h' { id `Ptr ()' } -> `Int' #}
imageH :: Image a  ->  IO (Int)
imageH image = withObject image $ \imagePtr -> h' imagePtr
{# fun unsafe Fl_Image_d as d' { id `Ptr ()' } -> `Int' #}
imageD :: Image a  ->  IO (Int)
imageD image = withObject image $ \imagePtr -> d' imagePtr
{# fun unsafe Fl_Image_ld as ld' { id `Ptr ()' } -> `Int' #}
imageLd :: Image a  ->  IO (Int)
imageLd image = withObject image $ \imagePtr -> ld' imagePtr
{# fun unsafe Fl_Image_count as count' { id `Ptr ()' } -> `Int' #}
imageCount :: Image a  ->  IO (Int)
imageCount image = withObject image $ \imagePtr -> count' imagePtr

{# fun unsafe Fl_Image_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
{# fun unsafe Fl_Image_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
imageCopy :: Image a  ->  Maybe Size -> IO (Image b)
imageCopy image size' = case size' of
  Just (Size (Width w) (Height h)) -> withObject image $ \imagePtr -> copyWithWH' imagePtr w h >>= toObject
  Nothing -> withObject image $ \imagePtr -> copy' imagePtr >>= toObject

{# fun unsafe Fl_Image_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
imageColorAverage :: Image a  -> Color -> Float ->  IO ()
imageColorAverage image c i = withObject image $ \imagePtr -> colorAverage' imagePtr c i

{# fun unsafe Fl_Image_inactive as inactive' { id `Ptr ()' } -> `()' #}
imageInactive :: Image a  ->  IO ()
imageInactive image = withObject image $ \imagePtr -> inactive' imagePtr

{# fun unsafe Fl_Image_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
imageDesaturate :: Image a  ->  IO ()
imageDesaturate image = withObject image $ \imagePtr -> desaturate' imagePtr

{# fun unsafe Fl_Image_label as label' { id `Ptr ()',id `Ptr ()' } -> `()' #}
imageLabel :: Image a  -> Widget a  ->  IO ()
imageLabel image w = withObject image $ \imagePtr -> withObject w $ \wPtr -> label' imagePtr wPtr

{# fun unsafe Fl_Image_label_with_menu_item as labelWithMenuItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
imageLabelWithMenuItem :: Image a  -> MenuItem a  ->  IO ()
imageLabelWithMenuItem image m = withObject image $ \imagePtr -> withObject m $ \mPtr -> labelWithMenuItem' imagePtr mPtr

{# fun unsafe Fl_Image_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Image_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Image_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Image_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}

imageDrawResize :: Image a -> Position -> Size -> Maybe ByX -> Maybe ByY -> IO ()
imageDrawResize image (Position (X x) (Y y)) (Size (Width w) (Height h)) xOffset yOffset =
  case (xOffset, yOffset) of
    (Just (ByX xOff), Just (ByY yOff)) ->
      withObject image $ \imagePtr -> drawWithCxCy' imagePtr x y w h (truncate xOff) (truncate yOff)
    (Just (ByX xOff), Nothing) ->
      withObject image $ \imagePtr -> drawWithCx' imagePtr x y w h (truncate xOff)
    (Nothing, Just (ByY yOff)) ->
      withObject image $ \imagePtr -> drawWithCy' imagePtr x y w h (truncate yOff)
    (Nothing, Nothing) ->
      withObject image $ \imagePtr -> drawWith' imagePtr x y w h

{# fun unsafe Fl_Image_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
imageDraw :: Image a  -> Position ->  IO ()
imageDraw image (Position (X x_pos') (Y y_pos')) = withObject image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun unsafe Fl_Image_uncache as uncache' { id `Ptr ()' } -> `()' #}
imageUncache :: Image a  ->  IO ()
imageUncache image = withObject image $ \imagePtr -> uncache' imagePtr
