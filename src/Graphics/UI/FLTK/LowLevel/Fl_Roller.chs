{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Roller
    (
     -- * Constructor
     rollerNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_RollerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Roller_New as rollerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Roller_New_WithLabel as rollerNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
rollerNew :: Rectangle -> Maybe String -> IO (Ref Roller)
rollerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> rollerNew' x_pos y_pos width height >>=
                             toRef
        Just l -> rollerNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Roller_Destroy as rollerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Roller ( IO ()) where
  runOp _ roller = swapRef roller $ \rollerPtr -> do
    rollerDestroy' rollerPtr
    return nullPtr

{#fun Fl_Roller_handle as rollerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance Op (Handle ()) Roller ( Event -> IO Int) where
  runOp _ roller event = withRef roller (\p -> rollerHandle' p (fromIntegral . fromEnum $ event))
