{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.JPEGImage
    (
     jpegImageNew,
     jpegImageNewWithData
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_JPEG_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.RGBImage
import qualified Data.ByteString as B

{# fun Fl_JPEG_Image_New as jpegImageNew' { unsafeToCString `String' } -> `Ptr ()' id #}
{# fun Fl_JPEG_Image_New_WithData as jpegImageNewWithData' { unsafeToCString `String', id `Ptr CUChar' } -> `Ptr ()' id #}
jpegImageNew :: String -> IO (Either UnknownError (Ref JPEGImage))
jpegImageNew filename' = jpegImageNew' filename' >>= toRef >>= checkImage

jpegImageNewWithData :: String -> B.ByteString -> IO (Either UnknownError (Ref JPEGImage))
jpegImageNewWithData l' data' = do
  jpeg' <- copyByteStringToCString data'
  jpegImageNewWithData' l' (castPtr jpeg') >>= toRef >>= checkImage

-- $hierarchy
--
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.JPEGImage"
