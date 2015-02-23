{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.ToggleButton
    (
     toggleButtonNew
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
#include "Fl_Toggle_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Toggle_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Toggle_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String'} -> `Ptr ()' id #}
toggleButtonNew :: Rectangle -> Maybe String -> IO (Ref ToggleButton)
toggleButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>= toRef
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Toggle_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) ToggleButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr

-- $functions
-- @
--
-- destroy :: 'Ref' 'ToggleButton' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Button"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.ToggleButton"
-- @