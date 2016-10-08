{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.IntInput
    (
     intInputNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Int_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import qualified Data.Text as T
{# fun Fl_Int_Input_New as intInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Int_Input_New_WithLabel as intInputNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
intInputNew :: Rectangle -> Maybe T.Text -> IO (Ref IntInput)
intInputNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> intInputNew' x_pos y_pos width height >>=
                             toRef
        Just l -> intInputNewWithLabel' x_pos y_pos width height l >>=
                             toRef

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.IntInput"
-- @
