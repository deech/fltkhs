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
import qualified Data.Text as T
{# fun Fl_JPEG_Image_New as jpegImageNew' { `CString' } -> `Ptr ()' id #}
{# fun Fl_JPEG_Image_New_WithData as jpegImageNewWithData' { `CString', id `Ptr CUChar' } -> `Ptr ()' id #}
jpegImageNew :: T.Text -> IO (Either UnknownError (Ref JPEGImage))
jpegImageNew filename' = withText filename' jpegImageNew' >>= toRef >>= checkImage

jpegImageNewWithData :: T.Text -> B.ByteString -> IO (Either UnknownError (Ref JPEGImage))
jpegImageNewWithData l' data' = do
  jpeg' <- copyByteStringToCString data'
  labelString <- copyTextToCString l'
  jpegImageNewWithData' labelString (castPtr jpeg') >>= toRef >>= checkImage

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.JPEGImage"
-- @
