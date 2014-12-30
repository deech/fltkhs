{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Progress
    (
     -- * Constructor
     progressNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_ProgressC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Progress_New as progressNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Progress_New_WithLabel as progressNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
progressNew :: Rectangle -> Maybe String -> IO (Ref Progress)
progressNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> progressNew' x_pos y_pos width height >>=
                             toRef
        Just l -> progressNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Progress_Destroy as progressDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Progress (IO ()) where
  runOp _ win = swapRef win $ \winPtr -> do
    progressDestroy' winPtr
    return nullPtr
{# fun unsafe Fl_Progress_set_maximum as setMaximum' { id `Ptr ()',`Float' } -> `()' #}
instance Op (SetMaximum ()) Progress ( Float ->  IO ()) where
  runOp _ progress v = withRef progress $ \progressPtr -> setMaximum' progressPtr v
{# fun unsafe Fl_Progress_maximum as maximum' { id `Ptr ()' } -> `Float' #}
instance Op (GetMaximum ()) Progress (  IO (Float)) where
  runOp _ progress = withRef progress $ \progressPtr -> maximum' progressPtr
{# fun unsafe Fl_Progress_set_minimum as setMinimum' { id `Ptr ()',`Float' } -> `()' #}
instance Op (SetMinimum ()) Progress ( Float ->  IO ()) where
  runOp _ progress v = withRef progress $ \progressPtr -> setMinimum' progressPtr v
{# fun unsafe Fl_Progress_minimum as minimum' { id `Ptr ()' } -> `Float' #}
instance Op (GetMinimum ()) Progress (  IO (Float)) where
  runOp _ progress = withRef progress $ \progressPtr -> minimum' progressPtr
{# fun unsafe Fl_Progress_set_value as setValue' { id `Ptr ()',`Float' } -> `()' #}
instance Op (SetValue ()) Progress ( Float ->  IO ()) where
  runOp _ progress v = withRef progress $ \progressPtr -> setValue' progressPtr v
{# fun unsafe Fl_Progress_value as value' { id `Ptr ()' } -> `Float' #}
instance Op (GetValue ()) Progress (  IO (Float)) where
  runOp _ progress = withRef progress $ \progressPtr -> value' progressPtr
