{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Adjuster
    (
     -- * Constructor
     adjusterNew,
     -- * Hierarchy
     --
     -- $hierarchy

     -- *  Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_AdjusterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_Adjuster_New as adjusterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Adjuster_New_WithLabel as adjusterNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
adjusterNew :: Rectangle -> Maybe T.Text -> IO (Ref Adjuster)
adjusterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> adjusterNew' x_pos y_pos width height >>=
                             toRef
        Just l -> adjusterNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Adjuster_Destroy as adjusterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Adjuster orig impl where
  runOp _ _ adjuster = swapRef adjuster $ \adjusterPtr -> do
    adjusterDestroy' adjusterPtr
    return nullPtr

{# fun Fl_Adjuster_soft as soft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSoft ()) Adjuster orig impl where
  runOp _ _ adjuster = withRef adjuster $ \adjusterPtr -> soft' adjusterPtr

{# fun Fl_Adjuster_set_soft as setSoft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetSoft ()) Adjuster orig impl where
  runOp _ _ adjuster soft = withRef adjuster $ \adjusterPtr -> setSoft' adjusterPtr soft

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Adjuster"
-- @


-- $functions
-- @
-- destroy :: 'Ref' 'Adjuster' -> 'IO' ()
--
-- getSoft :: 'Ref' 'Adjuster' -> 'IO' 'Int'
--
-- setSoft :: 'Ref' 'Adjuster' -> 'Int' -> 'IO' ()
-- @
