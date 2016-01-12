{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.GIFImage
    (
     gifImageNew
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_GIF_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.RGBImage

{# fun Fl_GIF_Image_New as gifImageNew' { unsafeToCString `String' } -> `Ptr ()' id #}
gifImageNew :: String -> IO (Either UnknownError (Ref GIFImage))
gifImageNew filename' = do
  ptr <- gifImageNew' filename'
  ref' <- (toRef ptr :: IO (Ref GIFImage))
  checkImage ref'