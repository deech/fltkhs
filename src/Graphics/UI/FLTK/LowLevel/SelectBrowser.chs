{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.SelectBrowser
    (
     selectBrowserNew
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
#include "Fl_Select_BrowserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Select_Browser_New as selectBrowserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Select_Browser_New_WithLabel as selectBrowserNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String'} -> `Ptr ()' id #}
selectBrowserNew :: Rectangle -> Maybe String -> IO (Ref SelectBrowser)
selectBrowserNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> selectBrowserNew' x_pos y_pos width height >>=
                             toRef
        Just l -> selectBrowserNewWithLabel' x_pos y_pos width height l >>=
                             toRef
-- $functions
-- @
--

-- @

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