{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Image
       (
       ImageErr(..),
       ImageFuncs(..),
       defaultImageFuncs,
       imageNew,
       ColorAverageCallback,
       ImageDrawCallback,
       ImageCopyCallback,
       toImageDrawCallbackPrim,
       toColorAverageCallbackPrim,
       toImageCopyCallbackPrim
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
#include "Fl_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

#c
enum ImageErr {
  ImageErrNoImage = FL_IMAGE_ERR_NO_IMAGE,
  ImageErrFileAccess = FL_IMAGE_ERR_FILE_ACCESS,
  ImageErrFormat = FL_IMAGE_ERR_FORMAT
};
#endc
{#enum ImageErr {} deriving (Show) #}

type ColorAverageCallback        = Ref Image -> Color -> Float -> IO ()
type ImageDrawCallback           = Ref Image -> Position -> Size -> Maybe X -> Maybe Y -> IO ()
type ImageCopyCallback           = Ref Image -> Size -> IO (Ref Image)
toImageDrawCallbackPrim :: ImageDrawCallback -> IO (FunPtr ImageDrawCallbackPrim)
toImageDrawCallbackPrim f =
    mkImageDrawCallbackPrimPtr
    (\ptr x_pos' y_pos' width' height' x_offset' y_offset' ->
       let _x_offset = fmap X $ integralToMaybe x_offset'
           _y_offset = fmap Y $ integralToMaybe y_offset'
           position' = Position (X $ fromIntegral x_pos')
                                (Y $ fromIntegral y_pos')
           size' = Size (Width $ fromIntegral width')
                        (Height $ fromIntegral height')
       in
        toRef ptr >>= \refPtr -> f refPtr position' size' _x_offset _y_offset
    )

toColorAverageCallbackPrim :: ColorAverageCallback -> IO (FunPtr ColorAverageCallbackPrim)
toColorAverageCallbackPrim f =
    mkColorAverageCallbackPtr
    (\ptr cint cfloat ->
         wrapNonNull ptr "Null pointer. toColorAverageCallbackPrim" >>= \pp ->
         f (wrapInRef pp) (Color (fromIntegral cint)) (realToFrac cfloat)
    )

toImageCopyCallbackPrim :: ImageCopyCallback -> IO (FunPtr ImageCopyCallbackPrim)
toImageCopyCallbackPrim f =
    mkImageCopyCallbackPrimPtr
    (\ptr width' height' -> do
         pp <- wrapNonNull ptr "Null pointer. toImageCopyCallbackPrim"
         refPtr <- f (wrapInRef pp) (Size (Width $ fromIntegral width')
                                           (Height $ fromIntegral height'))
         unsafeRefToPtr refPtr
    )


data ImageFuncs a b =
  ImageFuncs
  {
    imageDrawOverride  :: Maybe (ImageDrawCallback),
    imageColorAverageOverride :: Maybe (ColorAverageCallback),
    imageCopyOverride :: Maybe (ImageCopyCallback),
    imageDesaturateOverride :: Maybe (Ref Image -> IO ()),
    imageUncacheOverride :: Maybe (Ref Image -> IO ())
  }

{# fun Fl_Image_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}
imageFunctionStruct :: (ImageFuncs a b) -> IO (Ptr ())
imageFunctionStruct funcs = do
  p <- virtualFuncs'
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

{# fun Fl_Image_New as flImageNew' { `Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_OverriddenImage_New as flOverriddenImageNew' { `Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
imageNew :: Size -> Depth -> Maybe (ImageFuncs a b) -> IO (Ref Image)
imageNew (Size (Width width') (Height height')) (Depth depth') funcs =
  case funcs of
    Just fs -> do
            fptr <- imageFunctionStruct fs
            obj <- flOverriddenImageNew' width' height' depth' (castPtr fptr)
            toRef obj
    Nothing -> flImageNew' width' height' depth' >>= toRef


{# fun Fl_Image_Destroy as flImageDestroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ (IO ())) => Op (Destroy ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> flImageDestroy' imagePtr
{# fun Fl_Image_w as w' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetW ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> w' imagePtr
{# fun Fl_Image_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetH ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> h' imagePtr
{# fun Fl_Image_d as d' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetD ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> d' imagePtr
{# fun Fl_Image_ld as ld' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetLd ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> ld' imagePtr
{# fun Fl_Image_count as count' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetCount ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> count' imagePtr

{# fun Fl_Image_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Image_copy as copy' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( Maybe Size -> IO (Maybe (Ref Image)))) => Op (Copy ()) Image orig impl where
  runOp _ _ image size' = case size' of
    Just (Size (Width imageWidth) (Height imageHeight)) ->
        withRef image $ \imagePtr -> copyWithWH' imagePtr imageWidth imageHeight >>= toMaybeRef
    Nothing -> withRef image $ \imagePtr -> copy' imagePtr >>= toMaybeRef

{# fun Fl_Image_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
instance (impl ~ (Color -> Float ->  IO ())) => Op (ColorAverage ()) Image orig impl where
  runOp _ _ image c i = withRef image $ \imagePtr -> colorAverage' imagePtr c i

{# fun Fl_Image_inactive as inactive' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Inactive ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> inactive' imagePtr

{# fun Fl_Image_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Desaturate ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> desaturate' imagePtr

{# fun Fl_Image_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_Image_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_Image_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_Image_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}

instance (impl ~ (Position -> Size -> Maybe X -> Maybe Y -> IO ())) => Op (DrawResize ()) Image orig impl where
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

{# fun Fl_Image_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (Draw ()) Image orig impl where
  runOp _ _ image (Position (X x_pos') (Y y_pos')) = withRef image $ \imagePtr -> draw' imagePtr x_pos' y_pos'
{# fun Fl_Image_uncache as uncache' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Uncache ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> uncache' imagePtr

{#fun Fl_Image_fail as fail' { id `Ptr ()' } -> `Int' #}
instance (impl ~ IO (Either ImageErr ())) => Op (Fail ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> do
    err <- fail' imagePtr
    return (if (err == 0) then
              Right ()
            else Left (toEnum err))

-- $functions
-- @
--
-- colorAverage :: 'Ref' 'Image' -> 'Color' -> 'Float' -> 'IO' ()
--
-- copy :: 'Ref' 'Image' -> 'Maybe' 'Size' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- desaturate :: 'Ref' 'Image' -> 'IO' ()
--
-- destroy :: 'Ref' 'Image' -> 'IO' ()
--
-- draw :: 'Ref' 'Image' -> 'Position' -> 'IO' ()
--
-- drawResize :: 'Ref' 'Image' -> 'Position' -> 'Size' -> 'Maybe' 'X' -> 'Maybe' 'Y' -> 'IO' ()
--
-- fail :: 'Ref' 'Image' -> 'IO' ('Either' 'ImageErr' ())
--
-- getCount :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getD :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getH :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getLd :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getW :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- inactive :: 'Ref' 'Image' -> 'IO' ()
--
-- uncache :: 'Ref' 'Image' -> 'IO' ()
-- @


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
-- @
