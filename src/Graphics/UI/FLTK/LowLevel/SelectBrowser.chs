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
import Graphics.UI.FLTK.LowLevel.Widget
import qualified Data.Text as T
{# fun Fl_Select_Browser_New as selectBrowserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Select_Browser_New_WithLabel as selectBrowserNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
selectBrowserNew :: Rectangle -> Maybe T.Text -> IO (Ref SelectBrowser)
selectBrowserNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> selectBrowserNew' x_pos y_pos width height >>=
                             toRef
        Just l -> do
          ref <- copyTextToCString l >>= \l' -> selectBrowserNewWithLabel' x_pos y_pos width height l' >>= toRef
          setFlag ref WidgetFlagCopiedLabel
          setFlag ref WidgetFlagCopiedTooltip
          return ref
-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Browser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SelectBrowser"
-- @
