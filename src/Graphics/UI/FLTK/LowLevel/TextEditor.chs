{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TextEditor
       (
         textEditorNew,
         KeyBinding(..),
         KeyFunc(..),
         KeyFuncPrim,
         keyFuncToFunRef,
         toKeyFuncPrim,
         keyBindingsToArray,
         arrayToKeyBindings
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
#include "Fl_Text_EditorC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Utils
import Data.List

data KeyBinding  = KeyBinding KeyBindingKeySequence FunRef
data KeyFunc     = forall a. (Parent a TextEditor) => KeyFunc (Ref a -> Char -> IO ())
type KeyFuncPrim = CInt -> Ptr () -> IO ()

foreign import ccall "wrapper"
        mkKeyFuncPrim :: KeyFuncPrim -> IO (FunPtr KeyFuncPrim)

toKeyFuncPrim :: KeyFunc -> IO (FunPtr KeyFuncPrim)
toKeyFuncPrim (KeyFunc f) =
    mkKeyFuncPrim
     (
       \char' ptr -> do
         ref <- toRef ptr
         f ref (castCCharToChar $ fromIntegral char')
     )

keyFuncToFunRef :: KeyFunc -> IO FunRef
keyFuncToFunRef f = toKeyFuncPrim f >>= return . toFunRef

keyBindingsToArray :: [KeyBinding] -> IO (Ptr ())
keyBindingsToArray kbs =
  case kbs of
    (kb':kbs') -> foldl'
                  (
                    \p' kb'' -> do
                           curr <- ptrToKb kb''
                           p' >>= {#set Key_BindingC->next #} curr
                           return curr
                  )
                  (ptrToKb kb')
                  kbs'
    []       -> return nullPtr
  where
    extractCodes (KeyBindingKeySequence es key') =
      let keyNum = case key' of
            SpecialKeyType c' -> fromIntegral $ fromEnum c'
            NormalKeyType c' -> fromIntegral $ castCharToCChar c'
          stateCode = maybe 0 (fromIntegral . combine) es
      in
      (stateCode, keyNum)
    ptrToKb (KeyBinding kb fr) =
      let (sc,kn) = extractCodes kb
      in do
       p <- mallocBytes {#sizeof Key_BindingC #}
       {#set Key_BindingC->key #} p kn
       {#set Key_BindingC->state #} p sc
       {#set Key_BindingC->function #} p (castFunPtr  (fromFunRef fr))
       {#set Key_BindingC->next #} p nullPtr
       return p

arrayToKeyBindings :: Ptr () -> IO [KeyBinding]
arrayToKeyBindings p | p == nullPtr = return []
arrayToKeyBindings p =
  go [] p
  where
    go accum p' | p' == nullPtr = return accum
    go accum p' = do
      key' <- {#get Key_BindingC->key #} p' >>= return . fromIntegral
      state' <- {#get Key_BindingC->state #} p'
      function' <- {#get Key_BindingC->function #} p'
      next' <- {#get Key_BindingC->next #} p'
      free p'
      let skCandidates = filter (\sk -> fromEnum sk == key') allSpecialKeys
      let keyType = if (null skCandidates)
                    then (NormalKeyType $ castCCharToChar $ fromIntegral key')
                    else (SpecialKeyType $ head skCandidates)
      let evs = if (state' == 0)
                then Nothing
                else Just $ extract allEventStates state'
      let currKb = KeyBinding (KeyBindingKeySequence evs keyType) (toFunRef function')
      go (accum ++ [currKb]) next'

{# fun Fl_Text_Editor_New as textEditorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Text_Editor_New_WithLabel as textEditorNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
textEditorNew :: Rectangle -> Maybe T.Text -> IO (Ref TextEditor)
textEditorNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> textEditorNew' x_pos y_pos width height >>= toRef
        Just l -> textEditorNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Text_Editor_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO(Either UnknownEvent ()))) => Op (Handle ()) TextEditor orig impl where
   runOp _ _ text_editor e = withRef text_editor $ \text_editorPtr -> handle' text_editorPtr (fromEnum e) >>= return  . successOrUnknownEvent
{# fun Fl_Text_Editor_Destroy as textEditorDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TextEditor orig impl where
  runOp _ _ editor = swapRef editor $ \editorPtr -> do
    textEditorDestroy' editorPtr
    return nullPtr
{# fun Fl_Text_Editor_set_insert_mode as setInsertMode' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetInsertMode ()) TextEditor orig impl where
   runOp _ _ text_editor b = withRef text_editor $ \text_editorPtr -> setInsertMode' text_editorPtr b
{# fun Fl_Text_Editor_insert_mode as insertMode' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetInsertMode ()) TextEditor orig impl where
   runOp _ _ text_editor = withRef text_editor $ \text_editorPtr -> insertMode' text_editorPtr
{# fun Fl_Text_Editor_add_default_key_bindings as addDefaultKeyBindings' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO [KeyBinding])) => Op (GetDefaultKeyBindings ()) TextEditor orig impl where
  runOp _ _ text_editor = withRef text_editor $ \text_editorPtr -> do
    p' <- addDefaultKeyBindings' text_editorPtr nullPtr
    kbs <- arrayToKeyBindings p'
    return kbs
{# fun Fl_Text_Editor_replace_key_bindings as replaceKeyBindings' { id `Ptr ()', id `Ptr ()'} -> `()' #}
instance (impl ~ ([KeyBinding] -> IO ())) => Op (ReplaceKeyBindings ()) TextEditor orig impl where
  runOp _ _ text_editor kbs = withRef text_editor $ \text_editorPtr -> do
        p <- keyBindingsToArray kbs
        replaceKeyBindings' text_editorPtr p

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.TextEditor"
--
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'TextEditor' -> 'IO' ()
--
-- getDefaultKeyBindings :: 'Ref' 'TextEditor' -> 'IO' ['KeyBinding']
--
-- getInsertMode :: 'Ref' 'TextEditor' -> 'IO' 'Bool'
--
-- handle :: 'Ref' 'TextEditor' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- replaceKeyBindings :: 'Ref' 'TextEditor' -> ['KeyBinding'] -> 'IO' ()
--
-- setInsertMode :: 'Ref' 'TextEditor' -> 'Bool' -> 'IO' ()
--
-- @
