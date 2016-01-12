{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.XBMImage
    (
     xbmImageNew
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_XBM_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.RGBImage

{# fun Fl_XBM_Image_New as xbmImageNew' { unsafeToCString `String' } -> `Ptr ()' id #}
xbmImageNew :: String -> IO (Either UnknownError (Ref XBMImage))
xbmImageNew filename' = do
  ptr <- xbmImageNew' filename'
  ref' <- (toRef ptr :: IO (Ref XBMImage))
  checkImage ref'

-- $hierarchy
--
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.XBMImage"
