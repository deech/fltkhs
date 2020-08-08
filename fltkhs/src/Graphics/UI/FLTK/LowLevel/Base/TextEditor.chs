{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.TextEditor
       (
         textEditorNew,
         textEditorCustom,
         KeyBinding(..),
         KeyFunc(..),
         KeyFuncPrim,
         toKeyFuncPrim,
         keyBindingsToArray,
         arrayToKeyBindings
  , drawTextEditorBase
  , handleTextEditorBase
  , resizeTextEditorBase
  , hideTextEditorBase
  , showWidgetTextEditorBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Utils
import Data.List

data KeyBinding  = KeyBinding KeyBindingKeySequence (FunPtr KeyFuncPrim)
data KeyFunc     = forall a. (Parent a TextEditorBase) => KeyFunc (Ref a -> Char -> IO ())
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
       {#set Key_BindingC->function #} p (castFunPtr  fr)
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
      let currKb = KeyBinding (KeyBindingKeySequence evs keyType) (castFunPtr function')
      go (accum ++ [currKb]) next'

{# fun Fl_OverriddenText_Editor_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenText_Editor_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
textEditorCustom ::
       Rectangle                         -- ^ The bounds of this TextEditor
    -> Maybe T.Text                      -- ^ The TextEditor label
    -> Maybe (Ref TextEditor -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs TextEditor)      -- ^ Optional custom widget functions
    -> IO (Ref TextEditor)
textEditorCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Text_Editor_New as textEditorNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Text_Editor_New_WithLabel as textEditorNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
textEditorNew :: Rectangle -> Maybe T.Text -> IO (Ref TextEditor)
textEditorNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Text_Editor_Destroy as textEditorDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TextEditorBase orig impl where
  runOp _ _ editor = swapRef editor $ \editorPtr -> do
    textEditorDestroy' editorPtr
    return nullPtr
{# fun Fl_Text_Editor_set_insert_mode as setInsertMode' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetInsertMode ()) TextEditorBase orig impl where
   runOp _ _ text_editor b = withRef text_editor $ \text_editorPtr -> setInsertMode' text_editorPtr b
{# fun Fl_Text_Editor_insert_mode as insertMode' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetInsertMode ()) TextEditorBase orig impl where
   runOp _ _ text_editor = withRef text_editor $ \text_editorPtr -> insertMode' text_editorPtr
{# fun Fl_Text_Editor_add_default_key_bindings as addDefaultKeyBindings' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO [KeyBinding])) => Op (GetDefaultKeyBindings ()) TextEditorBase orig impl where
  runOp _ _ text_editor = withRef text_editor $ \text_editorPtr -> do
    p' <- addDefaultKeyBindings' text_editorPtr nullPtr
    kbs <- arrayToKeyBindings p'
    return kbs
{# fun Fl_Text_Editor_replace_key_bindings as replaceKeyBindings' { id `Ptr ()', id `Ptr ()'} -> `()' #}
instance (impl ~ ([KeyBinding] -> IO ())) => Op (ReplaceKeyBindings ()) TextEditorBase orig impl where
  runOp _ _ text_editor kbs = withRef text_editor $ \text_editorPtr -> do
        p <- keyBindingsToArray kbs
        replaceKeyBindings' text_editorPtr p


{# fun Fl_Text_Editor_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawTextEditorBase ::  Ref TextEditorBase -> IO ()
drawTextEditorBase textEditor = withRef textEditor $ \textEditorPtr -> drawSuper' textEditorPtr
{# fun Fl_Text_Editor_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleTextEditorBase :: Ref TextEditorBase -> Event ->  IO (Either UnknownEvent ())
handleTextEditorBase textEditor event = withRef textEditor $ \textEditorPtr -> handleSuper' textEditorPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Text_Editor_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeTextEditorBase :: Ref TextEditorBase -> Rectangle -> IO ()
resizeTextEditorBase textEditor rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef textEditor $ \textEditorPtr -> resizeSuper' textEditorPtr x_pos y_pos width height
{# fun Fl_Text_Editor_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideTextEditorBase ::  Ref TextEditorBase -> IO ()
hideTextEditorBase textEditor = withRef textEditor $ \textEditorPtr -> hideSuper' textEditorPtr
{# fun Fl_Text_Editor_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetTextEditorBase ::  Ref TextEditorBase -> IO ()
showWidgetTextEditorBase textEditor = withRef textEditor $ \textEditorPtr -> showSuper' textEditorPtr

{# fun Fl_Text_Editor_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TextEditorBase orig impl where
  runOp _ _ textEditor = withRef textEditor $ \textEditorPtr -> draw'' textEditorPtr
{#fun Fl_Text_Editor_handle as textEditorHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) TextEditorBase orig impl where
  runOp _ _ textEditor event = withRef textEditor (\p -> textEditorHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Text_Editor_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TextEditorBase orig impl where
  runOp _ _ textEditor = withRef textEditor $ \textEditorPtr -> show' textEditorPtr
{# fun Fl_Text_Editor_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TextEditorBase orig impl where
  runOp _ _ textEditor = withRef textEditor $ \textEditorPtr -> hide' textEditorPtr
{# fun Fl_Text_Editor_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) TextEditorBase orig impl where
  runOp _ _ textEditor rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef textEditor $ \textEditorPtr -> resize' textEditorPtr x_pos y_pos width height


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextDisplay"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextEditor"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'TextEditorBase' -> 'IO' ()
--
-- draw :: 'Ref' 'TextEditorBase' -> 'IO' ()
--
-- getDefaultKeyBindings :: 'Ref' 'TextEditorBase' -> 'IO' ['KeyBinding']
--
-- getInsertMode :: 'Ref' 'TextEditorBase' -> 'IO' ('Bool')
--
-- handle :: 'Ref' 'TextEditorBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TextEditorBase' -> 'IO' ()
--
-- replaceKeyBindings :: 'Ref' 'TextEditorBase' -> ['KeyBinding'] -> 'IO' ()
--
-- resize :: 'Ref' 'TextEditorBase' -> 'Rectangle' -> 'IO' ()
--
-- setInsertMode :: 'Ref' 'TextEditorBase' -> 'Bool' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TextEditorBase' -> 'IO' ()
-- @
