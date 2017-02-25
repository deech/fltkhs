{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Roller
    (
     -- * Constructor
     rollerNew
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
#include "Fl_RollerC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

{# fun Fl_Roller_New as rollerNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Roller_New_WithLabel as rollerNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
rollerNew :: Rectangle -> Maybe T.Text -> IO (Ref Roller)
rollerNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> rollerNew' x_pos y_pos width height >>=
                             toRef
        Just l -> rollerNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Roller_Destroy as rollerDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Roller orig impl where
  runOp _ _ roller = swapRef roller $ \rollerPtr -> do
    rollerDestroy' rollerPtr
    return nullPtr

{#fun Fl_Roller_handle as rollerHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Roller orig impl where
  runOp _ _ roller event = withRef roller (\p -> rollerHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

-- $functions
-- @
--
-- destroy :: 'Ref' 'Roller' -> 'IO' ()
--
-- handle :: 'Ref' 'Roller' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Roller"
-- @
