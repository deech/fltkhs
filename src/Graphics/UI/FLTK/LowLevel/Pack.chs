{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Pack
  (
    PackType(..),
    packNew,
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
#include "Fl_PackC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Pack_New as packNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Pack_New_WithLabel as packNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
packNew :: Rectangle -> Maybe String -> IO (Ref Pack)
packNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> packNew' x_pos y_pos width height >>=
                             toRef
        Just l -> packNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun unsafe Fl_Pack_get_spacing as getSpacing' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetSpacing ()) Pack orig impl where
   runOp _ _ p = withRef p $ \pPtr -> getSpacing' pPtr
{# fun unsafe Fl_Pack_set_spacing as setSpacing' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetSpacing ()) Pack orig impl where
   runOp _ _ p pixels = withRef p $ \pPtr -> setSpacing' pPtr pixels
{# fun unsafe Fl_Pack_horizontal as horizontal' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO Bool)) => Op (IsHorizontal ()) Pack orig impl where
   runOp _ _ p = withRef p $ \pPtr -> do
     orientation <- horizontal' pPtr >>= return . cToEnum
     case orientation of
       PackHorizontal -> return True
       _  -> return False
{# fun unsafe Fl_Pack_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (PackType))) => Op (GetType ()) Pack orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . cToEnum
{# fun unsafe Fl_Pack_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (PackType ->  IO ())) => Op (SetType ()) Pack orig impl where
   runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (cFromEnum t)

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Pack"
-- @

-- $functions
-- @
-- getSpacing :: 'Ref' 'Pack' -> 'IO' 'Int'
--
-- getType :: 'Ref' 'Pack' -> 'IO' 'PackType'
--
-- isHorizontal :: 'Ref' 'Pack' -> 'IO' 'Bool'
--
-- setSpacing :: 'Ref' 'Pack' -> 'Int' -> 'IO' ()
--
-- setType :: 'Ref' 'Pack' -> 'PackType' -> 'IO' ()
-- @
