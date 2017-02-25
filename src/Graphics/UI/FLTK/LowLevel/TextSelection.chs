{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TextSelection
       (
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
#include "Fl_Text_SelectionC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Text_Selection_set as set' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance  ( impl ~ (BufferRange -> IO ())) => Op (Set ()) TextSelection orig impl where
  runOp _ _ text_selection (BufferRange (BufferOffset start'') (BufferOffset end'')) = withRef text_selection $ \text_selectionPtr -> set' text_selectionPtr start'' end''
{# fun Fl_Text_Selection_update as update' { id `Ptr ()',`Int',`Int',`Int' } -> `()' #}
instance  ( impl ~ (BufferOffset -> Int -> Int ->  IO ())) => Op (Update ()) TextSelection orig impl where
  runOp _ _ text_selection (BufferOffset pos) ndeleted ninserted = withRef text_selection $ \text_selectionPtr -> update' text_selectionPtr pos ndeleted ninserted
{# fun Fl_Text_Selection_start as start' { id `Ptr ()' } -> `Int' #}
instance  ( impl ~ IO BufferOffset) => Op (Start ()) TextSelection orig impl where
  runOp _ _ text_selection = withRef text_selection $ \text_selectionPtr -> start' text_selectionPtr >>= return . BufferOffset
{# fun Fl_Text_Selection_end as end' { id `Ptr ()' } -> `Int' #}
instance  ( impl ~ (IO (BufferOffset))) => Op (End ()) TextSelection orig impl where
  runOp _ _ text_selection = withRef text_selection $ \text_selectionPtr -> end' text_selectionPtr >>= return . BufferOffset
{# fun Fl_Text_Selection_selected as selected' { id `Ptr ()' } -> `Bool' cToBool #}
instance  ( impl ~ IO (Bool)) => Op (Selected ()) TextSelection orig impl where
  runOp _ _ text_selection = withRef text_selection $ \text_selectionPtr -> selected' text_selectionPtr
{# fun Fl_Text_Selection_set_selected as setSelected' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance  ( impl ~ (Bool ->  IO ())) => Op (SetSelected ()) TextSelection orig impl where
  runOp _ _ text_selection b = withRef text_selection $ \text_selectionPtr -> setSelected' text_selectionPtr b
{# fun Fl_Text_Selection_includes as includes' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance  ( impl ~ (BufferOffset ->  IO (Bool))) => Op (Includes ()) TextSelection orig impl where
  runOp _ _ text_selection (BufferOffset pos) = withRef text_selection $ \text_selectionPtr -> includes' text_selectionPtr pos
{# fun Fl_Text_Selection_position as position' { id `Ptr ()', id `Ptr CInt', id `Ptr CInt' } -> `Int' #}
instance  ( impl ~ (IO (Maybe BufferRange))) => Op (GetPosition ()) TextSelection orig impl where
  runOp _ _ text_selection =
    withRef text_selection $ \text_selectionPtr ->
    statusToBufferRange $ position' text_selectionPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.TextSelection"
-- @

-- $functions
-- @
-- end :: 'Ref' 'TextSelection' -> 'IO' 'BufferOffset'
--
-- getPosition :: 'Ref' 'TextSelection' -> 'IO' ('Maybe' 'BufferRange')
--
-- includes :: 'Ref' 'TextSelection' -> 'BufferOffset' -> 'IO' 'Bool'
--
-- selected :: 'Ref' 'TextSelection' -> 'IO' 'Bool'
--
-- set :: 'Ref' 'TextSelection' -> 'BufferRange' -> 'IO' ()
--
-- setSelected :: 'Ref' 'TextSelection' -> 'Bool' -> 'IO' ()
--
-- start :: 'Ref' 'TextSelection' -> 'IO' 'BufferOffset'
--
-- update :: 'Ref' 'TextSelection' -> 'BufferOffset' -> 'Int' -> 'Int' -> 'IO' ()
-- @
