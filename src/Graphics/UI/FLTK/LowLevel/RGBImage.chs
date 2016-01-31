{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.RGBImage
       (
       rgbImageNew,
       checkImage,
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
#include "Fl_RGB_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Data.ByteString as B

{# fun Fl_RGB_Image_New as rgbImageNew' { id `Ptr CUChar',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_RGB_Image_New_With_D as rgbImageNew_WithD' {id `Ptr CUChar',`Int',`Int', `Int'} -> `Ptr ()' id #};
{# fun Fl_RGB_Image_New_With_LD as rgbImageNew_WithLD' {id `Ptr CUChar',`Int',`Int', `Int'} -> `Ptr ()' id #};
{# fun Fl_RGB_Image_New_With_D_LD as rgbImageNew_WithD_LD' {id `Ptr CUChar',`Int',`Int', `Int', `Int'} -> `Ptr ()' id #};
rgbImageNew :: B.ByteString -> Size -> Maybe Depth  -> Maybe LineSize -> IO (Ref RGBImage)
rgbImageNew bits' (Size (Width width') (Height height')) depth' linesize' = do
  asCString <- copyByteStringToCString bits'
  case (depth', linesize') of
    (Just (Depth imageDepth) , Nothing) -> rgbImageNew_WithD' (castPtr asCString) width' height' imageDepth >>= toRef
    (Nothing, Just (LineSize l')) -> rgbImageNew_WithLD' (castPtr asCString) width' height' l' >>= toRef
    (Just (Depth imageDepth), Just (LineSize l')) -> rgbImageNew_WithD_LD' (castPtr asCString) width' height' imageDepth l' >>= toRef
    (Nothing, Nothing) -> rgbImageNew' (castPtr asCString) width' height' >>= toRef

checkImage :: (
                Parent orig RGBImage,
                Match x ~ FindOp orig (GetW ()),
                Op (GetW ()) x orig (IO Int),
                Match y ~ FindOp orig (Destroy ()),
                Op (Destroy ()) y orig (IO ())
               )
               => Ref orig -> IO (Either UnknownError (Ref orig))
checkImage ref' = do
  imageWidth <- getW ref'
  if (imageWidth == (0 :: Int))
   then do
     () <- destroy ref'
     return (Left UnknownError)
   else (return (Right ref'))

{# fun Fl_RGB_Image_Destroy as flImageDestroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ (IO ())) => Op (Destroy ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> flImageDestroy' imagePtr
{# fun Fl_RGB_Image_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetW ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> w' imagePtr
{# fun Fl_RGB_Image_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetH ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> h' imagePtr
{# fun Fl_RGB_Image_d as d' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetD ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> d' imagePtr
{# fun Fl_RGB_Image_ld as ld' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetLd ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> ld' imagePtr
{# fun Fl_RGB_Image_count as count' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetCount ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> count' imagePtr

{# fun Fl_RGB_Image_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_RGB_Image_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
instance (Parent a RGBImage, impl ~ ( Maybe Size -> IO (Maybe (Ref a)))) => Op (Copy ()) RGBImage orig impl where
  runOp _ _ image size' = case size' of
    Just (Size (Width imageWidth) (Height imageHeight)) ->
        withRef image $ \imagePtr -> copyWithWH' imagePtr imageWidth imageHeight >>= toMaybeRef
    Nothing -> withRef image $ \imagePtr -> copy' imagePtr >>= toMaybeRef

{# fun Fl_RGB_Image_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
instance (impl ~ (Color -> Float ->  IO ())) => Op (ColorAverage ()) RGBImage orig impl where
  runOp _ _ image c i = withRef image $ \imagePtr -> colorAverage' imagePtr c i

{# fun Fl_RGB_Image_inactive as inactive' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Inactive ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> inactive' imagePtr

{# fun Fl_RGB_Image_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Desaturate ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> desaturate' imagePtr

{# fun Fl_RGB_Image_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_RGB_Image_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_RGB_Image_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_RGB_Image_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}
instance (impl ~ (Position -> Size -> Maybe X -> Maybe Y -> IO ())) => Op (DrawResize ()) RGBImage orig impl where
  runOp _ _ image (Position (X imageX) (Y imageY)) (Size (Width imageWidth) (Height imageHeight)) xOffset yOffset =
    case (xOffset, yOffset) of
      (Just (X xOff), Just (Y yOff)) ->
        withRef image $ \imagePtr -> drawWithCxCy' imagePtr imageX imageY imageWidth imageHeight (fromIntegral xOff) (fromIntegral yOff)
      (Just (X xOff), Nothing) ->
        withRef image $ \imagePtr -> drawWithCx' imagePtr imageX imageY imageWidth imageHeight (fromIntegral xOff)
      (Nothing, Just (Y yOff)) ->
        withRef image $ \imagePtr -> drawWithCy' imagePtr imageX imageY imageWidth imageHeight (fromIntegral yOff)
      (Nothing, Nothing) ->
        withRef image $ \imagePtr -> drawWith' imagePtr imageX imageY imageWidth imageHeight

{# fun Fl_RGB_Image_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (Draw ()) RGBImage orig impl where
  runOp _ _ image (Position (X x_pos') (Y y_pos')) = withRef image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun Fl_RGB_Image_uncache as uncache' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Uncache ()) RGBImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> uncache' imagePtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
-- @

-- $functions
-- @
-- colorAverage :: 'Ref' 'RGBImage' -> 'Color' -> 'Float' -> 'IO' ()
--
-- copy:: ('Parent' a 'RGBImage') => 'Ref' 'RGBImage' -> 'Maybe' 'Size' -> 'IO' ('Maybe' ('Ref' a))
--
-- desaturate :: 'Ref' 'RGBImage' -> 'IO' ()
--
-- destroy :: 'Ref' 'RGBImage' -> 'IO' ()
--
-- draw :: 'Ref' 'RGBImage' -> 'Position' -> 'IO' ()
--
-- drawResize :: 'Ref' 'RGBImage' -> 'Position' -> 'Size' -> 'Maybe' 'X' -> 'Maybe' 'Y' -> 'IO' ()
--
-- getCount :: 'Ref' 'RGBImage' -> 'IO' ('Int')
--
-- getD :: 'Ref' 'RGBImage' -> 'IO' ('Int')
--
-- getH :: 'Ref' 'RGBImage' -> 'IO' ('Int')
--
-- getLd :: 'Ref' 'RGBImage' -> 'IO' ('Int')
--
-- getW :: 'Ref' 'RGBImage' -> 'IO' ('Int')
--
-- inactive :: 'Ref' 'RGBImage' -> 'IO' ()
--
-- uncache :: 'Ref' 'RGBImage' -> 'IO' ()
-- @