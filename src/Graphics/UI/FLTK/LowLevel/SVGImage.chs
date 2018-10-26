{-# LANGUAGE OverloadedStrings, CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SVGImage
    (
     svgImageNew,
     svgImageNewFromFile
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_SVG_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.RGBImage
import qualified Data.Text as T
import qualified Data.ByteString as B

{# fun Fl_SVG_Image_New_WithData as svgImageNewWithData' { id `Ptr CChar' , id `Ptr CChar' } -> `Ptr ()' id #}
svgImageNewFromFile :: T.Text -> IO (Either UnknownError (Ref SVGImage))
svgImageNewFromFile path' = do
  pathPtr <- copyTextToCString path'
  ptr <- svgImageNewWithData' pathPtr (castPtr nullPtr)
  ref' <- (toRef ptr :: IO (Ref SVGImage))
  checkImage ref'

svgImageNew :: B.ByteString -> IO (Either UnknownError (Ref SVGImage))
svgImageNew svgData' = do
  dataPtr <- copyByteStringToCString svgData'
  ptr <- svgImageNewWithData' (castPtr nullPtr) dataPtr
  ref' <- (toRef ptr :: IO (Ref SVGImage))
  checkImage ref'

{# fun Fl_SVG_Image_Destroy as flImageDestroy' { id `Ptr ()' } -> `()' id #}
instance (impl ~ (IO ())) => Op (Destroy ()) SVGImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> flImageDestroy' imagePtr

{# fun Fl_SVG_Image_resize as resize' { id `Ptr ()',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Size -> IO ())) => Op (Resize ()) SVGImage orig impl where
  runOp _ _ widget (Size (Width w') (Height h')) =
    withRef widget $ \widgetPtr -> resize' widgetPtr w' h'

{# fun Fl_SVG_Image_copy_with_w_h as copyWithWH' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
instance (impl ~ (Size -> IO (Maybe (Ref SVGImage)))) => Op (Copy ()) SVGImage orig impl where
  runOp _ _ image size' = case size' of
    (Size (Width imageWidth) (Height imageHeight)) ->
        withRef image $ \imagePtr -> copyWithWH' imagePtr imageWidth imageHeight >>= toMaybeRef

{# fun Fl_SVG_Image_color_average as colorAverage' { id `Ptr ()',cFromColor `Color',`Float' } -> `()' #}
instance (impl ~ (Color -> Float ->  IO ())) => Op (ColorAverage ()) SVGImage orig impl where
  runOp _ _ image c i = withRef image $ \imagePtr -> colorAverage' imagePtr c i

{# fun Fl_SVG_Image_desaturate as desaturate' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Desaturate ()) SVGImage orig impl where
  runOp _ _ image = withRef image $ \imagePtr -> desaturate' imagePtr

{# fun Fl_SVG_Image_draw_with_cx_cy as drawWithCxCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_SVG_Image_draw_with_cx as drawWithCx' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_SVG_Image_draw_with_cy as drawWithCy' { id `Ptr ()',`Int',`Int',`Int',`Int',`Int' } -> `()' #}
{# fun Fl_SVG_Image_draw_with as drawWith' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' #}

instance (impl ~ (Position -> Size -> Maybe X -> Maybe Y -> IO ())) => Op (DrawResize ()) SVGImage orig impl where
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

{# fun Fl_SVG_Image_draw as draw' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Position ->  IO ())) => Op (Draw ()) SVGImage orig impl where
  runOp _ _ image (Position (X x_pos') (Y y_pos')) = withRef image $ \imagePtr -> draw' imagePtr x_pos' y_pos'

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SVGImage"
-- @

-- $functions
-- @
-- colorAverage :: 'Ref' 'SVGImage' -> 'Color' -> 'Float' -> 'IO' ()
--
-- copy :: 'Ref' 'SVGImage' -> 'Size' -> 'IO' ('Maybe' ('Ref' 'SVGImage'))
--
-- desaturate :: 'Ref' 'SVGImage' -> 'IO' ()
--
-- destroy :: 'Ref' 'SVGImage' -> 'IO' ()
--
-- draw :: 'Ref' 'SVGImage' -> 'Position' -> 'IO' ()
--
-- drawResize :: 'Ref' 'SVGImage' -> 'Position' -> 'Size' -> 'Maybe' 'X' -> 'Maybe' 'Y' -> 'IO' ()
--
-- resize :: 'Ref' 'SVGImage' -> 'Size' -> 'IO' ()
-- @
