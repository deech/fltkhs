{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SelectBrowser
    (
     selectBrowserNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Select_BrowserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.Widget
import qualified Data.Text as T
{# fun Fl_Select_Browser_New as selectBrowserNew' { `Int',`Int',`Int',`Int', id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
{# fun Fl_Select_Browser_New_WithLabel as selectBrowserNewWithLabel' { `Int',`Int',`Int',`Int',`CString', id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
selectBrowserNew :: Rectangle -> Maybe T.Text -> IO (Ref SelectBrowser)
selectBrowserNew rectangle l' =
  let (x_pos, y_pos, width, height) = fromRectangle rectangle
  in do
  destroyFptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
  ref <- case l' of
      Nothing -> selectBrowserNew' x_pos y_pos width height destroyFptr >>= toRef
      Just l -> copyTextToCString l >>= \l' -> selectBrowserNewWithLabel' x_pos y_pos width height l' destroyFptr >>= toRef
  setFlag ref WidgetFlagCopiedLabel
  setFlag ref WidgetFlagCopiedTooltip
  return ref


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Browser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SelectBrowser"
-- @
