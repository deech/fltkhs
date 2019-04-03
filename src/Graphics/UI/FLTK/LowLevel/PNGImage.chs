{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.PNGImage
    (
     pngImageNew,
     pngImageNewWithData
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_PNG_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.RGBImage
import qualified Data.ByteString as B
import qualified Data.Text as T
{# fun Fl_PNG_Image_New as pngImageNew' { `CString' } -> `Ptr ()' id #}
{# fun Fl_PNG_Image_New_WithData as pngImageNewWithData' { `CString', id `Ptr CUChar', `Int' } -> `Ptr ()' id #}
pngImageNew :: T.Text -> IO (Either UnknownError (Ref PNGImage))
pngImageNew filename' = withText filename' pngImageNew' >>= toRef >>= checkImage

pngImageNewWithData :: T.Text -> B.ByteString -> IO (Either UnknownError (Ref PNGImage))
pngImageNewWithData l' data' =
  B.useAsCString data' $ \png' ->
    copyTextToCString l' >>= \label -> pngImageNewWithData' label (castPtr png') (B.length data') >>= toRef >>= checkImage


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.PNGImage"
-- @
