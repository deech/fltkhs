{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Check_Button
    (
     checkButtonNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Check_ButtonC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Check_Button_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Check_Button_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
checkButtonNew :: Rectangle -> Maybe String -> IO (Ref CheckButton)
checkButtonNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> widgetNew' x_pos y_pos width height >>= toRef
        Just l -> widgetNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Check_Button_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) CheckButton orig impl where
  runOp _ _ button = swapRef button $
                    \buttonPtr ->
                     widgetDestroy' buttonPtr >>
                     return nullPtr
