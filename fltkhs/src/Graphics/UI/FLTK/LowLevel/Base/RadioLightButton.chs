{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.RadioLightButton
    (
     radioLightButtonNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Radio_Light_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.Widget
import qualified Data.Text as T
{# fun Fl_Radio_Light_Button_New as widgetNew' { `Int',`Int',`Int',`Int',id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Radio_Light_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString',id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
radioLightButtonNew :: Rectangle -> Maybe T.Text -> IO (Ref RadioLightButton)
radioLightButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in do
    destroyFptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
    ref <- case l' of
        Nothing -> widgetNew' x_pos y_pos width height destroyFptr >>= toRef
        Just l -> copyTextToCString l >>= \l' -> widgetNewWithLabel' x_pos y_pos width height l' destroyFptr >>= toRef
    setFlag ref WidgetFlagCopiedLabel
    setFlag ref WidgetFlagCopiedTooltip
    return ref


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.LightButton"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.RadioLightButton"
-- @
