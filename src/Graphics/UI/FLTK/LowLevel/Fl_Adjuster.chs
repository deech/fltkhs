{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Adjuster
    (
     -- * Constructor
     adjusterNew,
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AdjusterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Adjuster_New as adjusterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Adjuster_New_WithLabel as adjusterNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
adjusterNew :: Rectangle -> Maybe String -> IO (Ref Adjuster)
adjusterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> adjusterNew' x_pos y_pos width height >>=
                             toRef
        Just l -> adjusterNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Adjuster_Destroy as adjusterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Adjuster ( IO ()) where
  runOp _ adjuster = swapRef adjuster $ \adjusterPtr -> do
    adjusterDestroy' adjusterPtr
    return nullPtr

{# fun unsafe Fl_Adjuster_soft as soft' { id `Ptr ()' } -> `Int' #}
instance Op (GetSoft ()) Adjuster (  IO (Int)) where
  runOp _ adjuster = withRef adjuster $ \adjusterPtr -> soft' adjusterPtr
{# fun unsafe Fl_Adjuster_set_soft as setSoft' { id `Ptr ()',`Int' } -> `()' #}
instance Op (SetSoft ()) Adjuster ( Int ->  IO ()) where
  runOp _ adjuster soft = withRef adjuster $ \adjusterPtr -> setSoft' adjusterPtr soft
