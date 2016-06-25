{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.FileInput
    (
     fileInputNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_File_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

{# fun Fl_File_Input_New as fileInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_File_Input_New_WithLabel as fileInputNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
fileInputNew :: Rectangle -> Maybe String -> IO (Ref FileInput)
fileInputNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> fileInputNew' x_pos y_pos width height >>=
                             toRef
        Just l -> fileInputNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun Fl_File_Input_down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype))) => Op (GetDownBox ()) FileInput orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> downBox' fileInputPtr
{# fun Fl_File_Input_set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetDownBox ()) FileInput orig impl where
  runOp _ _ fileInput b = withRef fileInput $ \fileInputPtr -> setDownBox' fileInputPtr b
{# fun Fl_File_Input_errorcolor as errorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetErrorColor ()) FileInput orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> errorColor' fileInputPtr
{# fun Fl_File_Input_set_errorcolor as setErrorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetErrorColor ()) FileInput orig impl where
  runOp _ _ fileInput b = withRef fileInput $ \fileInputPtr -> setErrorColor' fileInputPtr b
{# fun Fl_File_Input_set_value as setValue' { id `Ptr ()', unsafeToCString `String'} -> `()' #}
instance (impl ~ (String -> IO ())) => Op (SetValue ()) FileInput orig impl where
  runOp _ _ fileInput s = withRef fileInput $ \fileInputPtr -> setValue' fileInputPtr s
{# fun Fl_File_Input_value as getValue' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ (IO (String))) => Op (GetValue ()) FileInput orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> getValue' fileInputPtr

-- $hierarchy
-- @
-- @

-- $functions
-- @
-- @
