{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.XPMImage
    (
     xpmImageNew
     -- * Hierarchy
     --
     -- $hierarchy

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_XPM_ImageC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.RGBImage
import qualified Data.Text as T
{# fun Fl_XPM_Image_New as xpmImageNew' { `CString' } -> `Ptr ()' id #}
xpmImageNew :: T.Text -> IO (Either UnknownError (Ref XPMImage))
xpmImageNew filename' = do
  ptr <- withText filename' xpmImageNew'
  ref' <- (toRef ptr :: IO (Ref XPMImage))
  checkImage ref'

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Image"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.RGBImage"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.XPMImage"
-- @
