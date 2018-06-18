{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Image
       (
       ImageFail(..),
       ImageFuncs(..),
       defaultImageFuncs,
       imageNew,
       CustomColorAverage,
       CustomImageDraw,
       CustomImageCopy,
       toCustomImageDrawPrim,
       toCustomColorAveragePrim,
       toCustomImageCopyPrim
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
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

#c
enum ImageFail {
  ImageErrNoImage = ERR_NO_IMAGE,
  ImageErrFileAccess = ERR_FILE_ACCESS,
  ImageErrFormat = ERR_FORMAT
};
#endc
-- | Only available on FLTK version 1.3.4 and above.
{#enum ImageFail {} deriving (Show, Eq, Ord) #}

type CustomColorAverage        = Ref Image -> Color -> Float -> IO ()
type CustomImageDraw           = Ref Image -> Position -> Size -> Maybe X -> Maybe Y -> IO ()
type CustomImageCopy           = Ref Image -> Size -> IO (Ref Image)
toCustomImageDrawPrim :: CustomImageDraw -> IO (FunPtr CustomImageDrawPrim)
toCustomImageDrawPrim f =
    mkCustomImageDrawPrimPtr
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

toCustomColorAveragePrim :: CustomColorAverage -> IO (FunPtr CustomColorAveragePrim)
toCustomColorAveragePrim f =
    mkCustomColorAveragePtr
    (\ptr cint cfloat ->
         wrapNonNull ptr "Null pointer. toCustomColorAveragePrim" >>= \pp ->
         f (wrapInRef pp) (Color (fromIntegral cint)) (realToFrac cfloat)
    )

toCustomImageCopyPrim :: CustomImageCopy -> IO (FunPtr CustomImageCopyPrim)
toCustomImageCopyPrim f =
    mkCustomImageCopyPrimPtr
    (\ptr width' height' -> do
         pp <- wrapNonNull ptr "Null pointer. toCustomImageCopyPrim"
         refPtr <- f (wrapInRef pp) (Size (Width $ fromIntegral width')
                                           (Height $ fromIntegral height'))
         unsafeRefToPtr refPtr
    )


data ImageFuncs a b =
  ImageFuncs
  {
    imageDrawOverride  :: Maybe (CustomImageDraw),
    imageColorAverageOverride :: Maybe (CustomColorAverage),
    imageCopyOverride :: Maybe (CustomImageCopy),
    imageDesaturateOverride :: Maybe (Ref Image -> IO ()),
    imageUncacheOverride :: Maybe (Ref Image -> IO ())
  }

{# fun Fl_Image_default_virtual_funcs as virtualFuncs' {} -> `Ptr ()' id #}
imageFunctionStruct :: (ImageFuncs a b) -> IO (Ptr ())
imageFunctionStruct funcs = do
  p <- virtualFuncs'
  toCustomImageDrawPrim `orNullFunPtr` (imageDrawOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->draw #} p
  toCustomColorAveragePrim `orNullFunPtr` (imageColorAverageOverride funcs) >>=
                            {# set fl_Image_Virtual_Funcs->color_average #} p
  toCustomImageCopyPrim `orNullFunPtr` (imageCopyOverride funcs) >>=
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
instance (impl ~ ( IO (Width))) => Op (GetW ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> w' imagePtr >>= return . Width
{# fun Fl_Image_h as h' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Height))) => Op (GetH ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> h' imagePtr >>= return . Height
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

{#fun Fl_Image_fail as fail' { id `Ptr ()'} -> `CInt' #}
-- | Only available on FLTK version 1.3.4 and above.
instance (impl ~ (IO (Either ImageFail ()))) => Op (Fail ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> do
    res <- fail' imagePtr
    if (res == 0)
      then return (Right ())
      else return (Left (cToEnum res))
{# fun Fl_Image_data_w as dataw' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Width))) => Op (GetDataW ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> dataw' imagePtr >>= return . Width
{# fun Fl_Image_data_h as datah' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Height))) => Op (GetDataH ()) Image orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> datah' imagePtr >>= return . Height
{# fun Fl_Image_scale as scale' { id `Ptr ()' , `Int' , `Int' , cFromBool `Bool' , cFromBool `Bool'} -> `()' #}
instance (impl ~ (Size -> Maybe Bool -> Maybe Bool -> IO ())) => Op (Scale ()) Image orig impl where
  runOp _ _ image (Size (Width w') (Height h')) proportional can_expand =
    withRef image $ \imagePtr -> scale' imagePtr w' h' (maybe True id proportional) (maybe False id can_expand)

-- $functions
-- @
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
-- fail :: 'Ref' 'Image' -> 'IO' ('Either' 'ImageFail' ())
--
-- getCount :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getD :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getDataH :: 'Ref' 'Image' -> 'IO' ('Height')
--
-- getDataW :: 'Ref' 'Image' -> 'IO' ('Width')
--
-- getH :: 'Ref' 'Image' -> 'IO' ('Height')
--
-- getLd :: 'Ref' 'Image' -> 'IO' ('Int')
--
-- getW :: 'Ref' 'Image' -> 'IO' ('Width')
--
-- inactive :: 'Ref' 'Image' -> 'IO' ()
--
-- scale :: 'Ref' 'Image' -> 'Size' -> 'Maybe' 'Bool' -> 'Maybe' 'Bool' -> 'IO' ()
--
-- uncache :: 'Ref' 'Image' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
-- @
