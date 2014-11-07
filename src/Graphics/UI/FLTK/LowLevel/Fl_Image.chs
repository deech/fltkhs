{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Image
       (
       ImageFuncs(..),
       defaultImageFuncs,
       imageNew,
       imageDestroy,
       imageW,
       imageH,
       imageD,
       imageLd,
       imageCount,
       imageCopy,
       imageColorAverage,
       imageInactive,
       imageDesaturate,
       imageDrawResize,
       imageDraw,
       imageUncache
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils

data ImageFuncs a b =
  ImageFuncs
  {
    imageDrawOverride  :: Maybe (ImageDrawCallback a),
    imageColorAverageOverride :: Maybe (ColorAverageCallback a),
    imageCopyOverride :: Maybe (ImageCopyCallback a b),
    imageDesaturateOverride :: Maybe (Image a -> IO ()),
    imageUncacheOverride :: Maybe (Image a -> IO ())
  }
imageFunctionStruct :: (ImageFuncs a b) -> IO (Ptr ())
imageFunctionStruct funcs = do
  p <- mallocBytes {# sizeof fl_Image_Virtual_Funcs #}
  toImageDrawCallbackPrim `orNullFunPtr` (imageDrawOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->draw #} p
  toColorAverageCallbackPrim `orNullFunPtr` (imageColorAverageOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->color_average #} p
  toImageCopyCallbackPrim `orNullFunPtr` (imageCopyOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->copy #} p
  toCallbackPrim `orNullFunPtr` (imageDesaturateOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->desaturate #} p
  toCallbackPrim `orNullFunPtr` (imageUncacheOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->uncache #} p
  return p

defaultImageFuncs :: ImageFuncs a b
defaultImageFuncs = ImageFuncs Nothing Nothing Nothing Nothing Nothing

{# fun unsafe Fl_Image_New as flImageNew' { `Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun unsafe Fl_OverriddenImage_New as flOverriddenImageNew' { `Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
imageNew :: Size -> Depth -> Maybe (ImageFuncs a b) -> IO (Image a)
imageNew (Size (Width width') (Height height')) (Depth depth') funcs =
  case funcs of
    Just fs -> do
            fptr <- imageFunctionStruct fs
            obj <- flOverriddenImageNew' width' height' depth' (castPtr fptr)
            toObject obj
    Nothing -> flImageNew' width' height' depth' >>= toObject

{# fun unsafe Fl_Image_Destroy as flImageDestroy' { id `Ptr ()' } -> `()' id #}
imageDestroy :: Image a -> IO ()
imageDestroy image = withObject image $ \imagePtr -> flImageDestroy' imagePtr
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

{# fun unsafe Fl_Image_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Image_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Image_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun unsafe Fl_Image_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}

imageDrawResize :: Image a -> Position -> Size -> Maybe X -> Maybe Y -> IO ()
imageDrawResize image (Position (X x) (Y y)) (Size (Width w) (Height h)) xOffset yOffset =
  case (xOffset, yOffset) of
    (Just (X xOff), Just (Y yOff)) ->
      withObject image $ \imagePtr -> drawWithCxCy' imagePtr x y w h (fromIntegral xOff) (fromIntegral yOff)
    (Just (X xOff), Nothing) ->
      withObject image $ \imagePtr -> drawWithCx' imagePtr x y w h (fromIntegral xOff)
    (Nothing, Just (Y yOff)) ->
      withObject image $ \imagePtr -> drawWithCy' imagePtr x y w h (fromIntegral yOff)
    (Nothing, Nothing) ->
      withObject image $ \imagePtr -> drawWith' imagePtr x y w h

{# fun unsafe Fl_Image_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
imageDraw :: Image a  -> Position ->  IO ()
imageDraw image (Position (X x_pos') (Y y_pos')) = withObject image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun unsafe Fl_Image_uncache as uncache' { id `Ptr ()' } -> `()' #}
imageUncache :: Image a  ->  IO ()
imageUncache image = withObject image $ \imagePtr -> uncache' imagePtr
