{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TextBuffer
       (
         textBufferNew
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
#include "Fl_Text_BufferC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Widget(defaultDestroyCallbacks)
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_Text_Buffer_New as new' {id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
{# fun Fl_Text_Buffer_New_With_RequestedSize as newRequestedSize' {`Int',id `FunPtr DestroyCallbacksPrim'}-> `Ptr ()' id #}
{# fun Fl_Text_Buffer_New_With_PreferredGapSize as newPreferredGapSize' {`Int',id `FunPtr DestroyCallbacksPrim'} -> `Ptr ()' id #}
{# fun Fl_Text_Buffer_New_With_RequestedSize_PreferredGapSize as newRequestedSizePreferredGapSize' {`Int', `Int',id `FunPtr DestroyCallbacksPrim'}-> `Ptr ()' id #}

textBufferNew :: Maybe PreferredSize -> Maybe GapSize -> IO (Ref TextBuffer)
textBufferNew req' pref' = do
  destroyFptr <- toDestroyCallbacksPrim (defaultDestroyCallbacks :: (Ref TextBuffer -> [Maybe (FunPtr (IO ()))] -> IO ()))
  case (req',pref') of
    (Just (PreferredSize r'), Just (GapSize p')) -> newRequestedSizePreferredGapSize' r' p' destroyFptr >>= toRef
    (Just (PreferredSize r'), Nothing) -> newRequestedSize' r' destroyFptr >>= toRef
    (Nothing, Just (GapSize p')) -> newPreferredGapSize' p' destroyFptr >>= toRef
    (Nothing, Nothing) -> new' destroyFptr >>= toRef

{# fun Fl_Text_Buffer_Destroy as textbufferDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TextBuffer orig impl where
  runOp _ _ textBuffer' = swapRef textBuffer' $ \textBuffer'Ptr -> do
    textbufferDestroy' textBuffer'Ptr
    return nullPtr
{# fun Fl_Text_Buffer_input_file_was_transcoded as inputFileWasTranscoded' { id `Ptr ()' } -> `Bool' cToBool #}
instance ( impl ~ (  IO (Bool))) => Op (InputFileWasTranscoded ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> inputFileWasTranscoded' text_bufferPtr
{# fun Fl_Text_Buffer_file_encoding_warning_message as fileEncodingWarningMessage' { id `Ptr ()' } -> `CString' #}
instance ( impl ~ (  IO T.Text)) => Op (FileEncodingWarningMessage ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> fileEncodingWarningMessage' text_bufferPtr >>= cStringToText
{# fun Fl_Text_Buffer_length as length' { id `Ptr ()' } -> `Int' #}
instance ( impl ~ (  IO (Int))) => Op (GetLength ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> length' text_bufferPtr
{# fun Fl_Text_Buffer_text as text' { id `Ptr ()' } -> `CString' #}
instance ( impl ~ (  IO T.Text)) => Op (GetText ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> text' text_bufferPtr >>= cStringToText
{# fun Fl_Text_Buffer_set_text as setText' { id `Ptr ()', `CString' } -> `()' #}
instance ( impl ~ ( T.Text ->  IO ())) => Op (SetText ()) TextBuffer orig impl where
   runOp _ _ text_buffer text = withRef text_buffer $ \text_bufferPtr -> copyTextToCString text >>= setText' text_bufferPtr
{# fun Fl_Text_Buffer_text_range as textRange' { id `Ptr ()',`Int',`Int' } -> `CString' #}
instance ( impl ~ ( IndexRange ->  IO T.Text)) => Op (TextRange ()) TextBuffer orig impl where
   runOp _ _ text_buffer (IndexRange (AtIndex start') (AtIndex end')) = withRef text_buffer $ \text_bufferPtr -> textRange' text_bufferPtr start' end' >>= cStringToText
{# fun Fl_Text_Buffer_char_at as charAt' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ ( AtIndex ->  IO (Char))) => Op (CharAt ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex pos) = withRef text_buffer $ \text_bufferPtr -> charAt' text_bufferPtr pos >>= return . toEnum
{# fun Fl_Text_Buffer_byte_at as byteAt' { id `Ptr ()',`Int' } -> `Char' castCCharToChar #}
instance ( impl ~ ( AtIndex ->  IO Char)) => Op (ByteAt ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex pos) = withRef text_buffer $ \text_bufferPtr -> byteAt' text_bufferPtr pos
{# fun Fl_Text_Buffer_insert as insert' { id `Ptr ()',`Int', `CString' } -> `()' #}
instance ( impl ~ ( AtIndex -> T.Text ->  IO ())) => Op (Insert ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex pos) text = withRef text_buffer $ \text_bufferPtr -> copyTextToCString text >>= insert' text_bufferPtr pos
{# fun Fl_Text_Buffer_append as append' { id `Ptr ()', `CString' } -> `()' #}
instance ( impl ~ ( T.Text ->  IO ())) => Op (AppendToBuffer ()) TextBuffer orig impl where
   runOp _ _ text_buffer t = withRef text_buffer $ \text_bufferPtr -> copyTextToCString t >>= append' text_bufferPtr
{# fun Fl_Text_Buffer_remove as remove' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance ( impl ~ ( IndexRange ->  IO ())) => Op (Remove ()) TextBuffer orig impl where
   runOp _ _ text_buffer (IndexRange (AtIndex start') (AtIndex end')) = withRef text_buffer $ \text_bufferPtr -> remove' text_bufferPtr start' end'
{# fun Fl_Text_Buffer_replace as replace' { id `Ptr ()',`Int',`Int', `CString' } -> `()' #}
instance ( impl ~ ( IndexRange -> T.Text ->  IO ())) => Op (Replace ()) TextBuffer orig impl where
   runOp _ _ text_buffer (IndexRange (AtIndex start') (AtIndex end')) text = withRef text_buffer $ \text_bufferPtr -> copyTextToCString text >>= replace' text_bufferPtr start' end'
{# fun Fl_Text_Buffer_copy as copy' { id `Ptr ()',id `Ptr ()',`Int',`Int',`Int' } -> `()' #}
instance ( Parent a TextBuffer, impl ~ ( Ref a -> IndexRange -> AtIndex ->  IO ())) => Op (Copy ()) TextBuffer orig impl where
   runOp _ _ text_buffer frombuf (IndexRange (AtIndex fromstart) (AtIndex fromend)) (AtIndex topos) = withRef text_buffer $ \text_bufferPtr -> withRef frombuf $ \frombufPtr -> copy' text_bufferPtr frombufPtr fromstart fromend topos
{# fun Fl_Text_Buffer_undo_with_cp as undo' { id `Ptr ()', id `Ptr CInt' } -> `Int' #}
instance ( impl ~ (  IO (Either NoChange AtIndex))) => Op (Undo ()) TextBuffer orig impl where
   runOp _ _ text_buffer =
     withRef text_buffer $ \text_bufferPtr ->
     alloca $ \prevAtIndexPtr ->
     undo' text_bufferPtr prevAtIndexPtr >>= \status' ->
     if (status' == 0)
      then return (Left NoChange)
      else peekIntConv prevAtIndexPtr >>= return . Right . AtIndex
{# fun Fl_Text_Buffer_canUndo_with_flag as canUndoWithFlag' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance ( impl ~ (Bool ->  IO ())) => Op (CanUndo ()) TextBuffer orig impl where
   runOp _ _ text_buffer flag = withRef text_buffer $ \text_bufferPtr -> canUndoWithFlag' text_bufferPtr flag

{# fun Fl_Text_Buffer_insertfile as insertfile' { id `Ptr ()', `CString',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> AtIndex -> IO (Either DataProcessingError ()))) => Op (Insertfile ()) TextBuffer orig impl where
   runOp _ _ text_buffer file (AtIndex pos) =
      withRef text_buffer $ \text_bufferPtr -> do
      withText file (\fs -> insertfile' text_bufferPtr fs pos) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_insertfile_with_buflen as insertfileWithBuflen' { id `Ptr ()', `CString',`Int',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> AtIndex -> Int -> IO (Either DataProcessingError ()))) => Op (InsertfileWithBuflen ()) TextBuffer orig impl where
   runOp _ _ text_buffer file (AtIndex pos) buflen =
      withRef text_buffer $ \text_bufferPtr -> do
      withText file (\fs -> insertfileWithBuflen' text_bufferPtr fs pos buflen) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_appendfile as appendfile' { id `Ptr ()', `CString' } -> `Int' #}
instance ( impl ~ ( T.Text ->  IO (Either DataProcessingError ()))) => Op (Appendfile ()) TextBuffer orig impl where
   runOp _ _ text_buffer file =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> appendfile' text_bufferPtr fs) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_appendfile_with_buflen as appendfileWithBuflen' { id `Ptr ()', `CString',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> Int ->  IO (Either DataProcessingError ()))) => Op (AppendfileWithBuflen ()) TextBuffer orig impl where
   runOp _ _ text_buffer file buflen =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> appendfileWithBuflen' text_bufferPtr fs buflen) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_loadfile as loadfile' { id `Ptr ()', `CString' } -> `Int' #}
instance ( impl ~ ( T.Text ->  IO (Either DataProcessingError ()))) => Op (Loadfile ()) TextBuffer orig impl where
   runOp _ _ text_buffer file =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> loadfile' text_bufferPtr fs) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_loadfile_with_buflen as loadfileWithBuflen' { id `Ptr ()', `CString',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> Int ->  IO (Either DataProcessingError ()))) => Op (LoadfileWithBuflen ()) TextBuffer orig impl where
   runOp _ _ text_buffer file buflen =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> loadfileWithBuflen' text_bufferPtr fs buflen) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_outputfile as outputfile' { id `Ptr ()', `CString',`Int',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> IndexRange ->  IO (Either DataProcessingError ()))) => Op (Outputfile ()) TextBuffer orig impl where
   runOp _ _ text_buffer file (IndexRange (AtIndex start') (AtIndex end')) =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> outputfile' text_bufferPtr fs start' end') >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_outputfile_with_buflen as outputfileWithBuflen' { id `Ptr ()', `CString',`Int',`Int',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> IndexRange -> Int ->  IO (Either DataProcessingError ()))) => Op (OutputfileWithBuflen ()) TextBuffer orig impl where
   runOp _ _ text_buffer file (IndexRange (AtIndex start') (AtIndex end')) buflen =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> outputfileWithBuflen' text_bufferPtr fs start' end' buflen) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_savefile as savefile' { id `Ptr ()', `CString' } -> `Int' #}
instance ( impl ~ ( T.Text ->  IO (Either DataProcessingError ()))) => Op (Savefile ()) TextBuffer orig impl where
   runOp _ _ text_buffer file =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> savefile' text_bufferPtr fs) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_savefile_with_buflen as savefileWithBuflen' { id `Ptr ()', `CString',`Int' } -> `Int' #}
instance ( impl ~ ( T.Text -> Int ->  IO (Either DataProcessingError ()))) => Op (SavefileWithBuflen ()) TextBuffer orig impl where
   runOp _ _ text_buffer file buflen =
     withRef text_buffer $ \text_bufferPtr -> do
     withText file (\fs -> savefileWithBuflen' text_bufferPtr fs buflen) >>= return . successOrDataProcessingError
{# fun Fl_Text_Buffer_tab_distance as tabDistance' { id `Ptr ()' } -> `Int' #}
instance ( impl ~ (  IO (Int))) => Op (GetTabDistance ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> tabDistance' text_bufferPtr
{# fun Fl_Text_Buffer_set_tab_distance as setTabDistance' { id `Ptr ()',`Int' } -> `()' #}
instance ( impl ~ ( Int ->  IO ())) => Op (SetTabDistance ()) TextBuffer orig impl where
   runOp _ _ text_buffer tabdist = withRef text_buffer $ \text_bufferPtr -> setTabDistance' text_bufferPtr tabdist
{# fun Fl_Text_Buffer_select as select' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance ( impl ~ ( IndexRange ->  IO ())) => Op (Select ()) TextBuffer orig impl where
   runOp _ _ text_buffer (IndexRange (AtIndex start') (AtIndex end')) = withRef text_buffer $ \text_bufferPtr -> select' text_bufferPtr start' end'
{# fun Fl_Text_Buffer_selected as selected' { id `Ptr ()' } -> `Bool' cToBool #}
instance ( impl ~ (  IO (Bool))) => Op (Selected ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> selected' text_bufferPtr
{# fun Fl_Text_Buffer_unselect as unselect' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (Unselect ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> unselect' text_bufferPtr
{# fun Fl_Text_Buffer_selection_position as selectionPosition' { id `Ptr ()', alloca- `Int' peekIntConv* , alloca- `Int' peekIntConv* } -> `()' #}
instance ( impl ~ IO (IndexRange)) => Op (SelectionPosition ()) TextBuffer orig impl where
   runOp _ _ text_buffer =
     withRef text_buffer $ \text_bufferPtr ->
     selectionPosition' text_bufferPtr >>= \(start',end') ->
     return (IndexRange (AtIndex start') (AtIndex end'))
{# fun Fl_Text_Buffer_selection_text as selectionText' { id `Ptr ()' } -> `CString' #}
instance ( impl ~ (  IO T.Text)) => Op (SelectionText ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> selectionText' text_bufferPtr >>= cStringToText
{# fun Fl_Text_Buffer_remove_selection as removeSelection' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (RemoveSelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> removeSelection' text_bufferPtr
{# fun Fl_Text_Buffer_replace_selection as replaceSelection' { id `Ptr ()', `CString' } -> `()' #}
instance ( impl ~ ( T.Text ->  IO ())) => Op (ReplaceSelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer text = withRef text_buffer $ \text_bufferPtr -> copyTextToCString text >>= replaceSelection' text_bufferPtr
{# fun Fl_Text_Buffer_secondary_select as secondarySelect' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance ( impl ~ ( IndexRange ->  IO ())) => Op (SecondarySelect ()) TextBuffer orig impl where
   runOp _ _ text_buffer (IndexRange (AtIndex start') (AtIndex end')) = withRef text_buffer $ \text_bufferPtr -> secondarySelect' text_bufferPtr start' end'
{# fun Fl_Text_Buffer_secondary_selected as secondarySelected' { id `Ptr ()' } -> `Bool' cToBool #}
instance ( impl ~ (  IO (Bool))) => Op (SecondarySelected ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> secondarySelected' text_bufferPtr
{# fun Fl_Text_Buffer_set_secondary_unselect as setSecondaryUnselect' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (SecondaryUnselect ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> setSecondaryUnselect' text_bufferPtr
{# fun Fl_Text_Buffer_secondary_selection_position as secondarySelectionPosition' { id `Ptr ()',alloca- `Int' peekIntConv*, alloca- `Int' peekIntConv* } -> `()' #}
instance ( impl ~ IO IndexRange) => Op (SecondarySelectionPosition ()) TextBuffer orig impl where
   runOp _ _ text_buffer =
     withRef text_buffer $ \text_bufferPtr ->
     secondarySelectionPosition' text_bufferPtr >>= \(start',end') ->
     return (IndexRange (AtIndex start') (AtIndex end'))
{# fun Fl_Text_Buffer_secondary_selection_text as secondarySelectionText' { id `Ptr ()' } -> `CString' #}
instance ( impl ~ (  IO T.Text)) => Op (SecondarySelectionText ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> secondarySelectionText' text_bufferPtr >>= cStringToText
{# fun Fl_Text_Buffer_remove_secondary_selection as removeSecondarySelection' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (RemoveSecondarySelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> removeSecondarySelection' text_bufferPtr
{# fun Fl_Text_Buffer_replace_secondary_selection as replaceSecondarySelection' { id `Ptr ()', `CString' } -> `()' #}
instance ( impl ~ ( T.Text ->  IO ())) => Op (ReplaceSecondarySelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer text = withRef text_buffer $ \text_bufferPtr -> copyTextToCString text >>= replaceSecondarySelection' text_bufferPtr
{# fun Fl_Text_Buffer_set_highlight as setHighlight' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance ( impl ~ ( IndexRange ->  IO ())) => Op (SetHighlight ()) TextBuffer orig impl where
   runOp _ _ text_buffer (IndexRange (AtIndex start') (AtIndex end')) = withRef text_buffer $ \text_bufferPtr -> setHighlight' text_bufferPtr start' end'
{# fun Fl_Text_Buffer_highlight as highlight' { id `Ptr ()' } -> `Bool' #}
instance ( impl ~ (  IO (Bool))) => Op (GetHighlight ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> highlight' text_bufferPtr
{# fun Fl_Text_Buffer_unhighlight as unhighlight' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (Unhighlight ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> unhighlight' text_bufferPtr
{# fun Fl_Text_Buffer_highlight_position as highlightPosition' { id `Ptr ()',id `Ptr CInt',id `Ptr CInt' } -> `Int' #}
instance ( impl ~ IO (Maybe IndexRange)) => Op (HighlightPosition ()) TextBuffer orig impl where
   runOp _ _ text_buffer =
     withRef text_buffer $ \text_bufferPtr ->
     statusToIndexRange (highlightPosition' text_bufferPtr)
{# fun Fl_Text_Buffer_highlight_text as highlightText' { id `Ptr ()' } -> `CString' #}
instance ( impl ~ (  IO T.Text)) => Op (HighlightText ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> highlightText' text_bufferPtr >>= cStringToText
{# fun Fl_Text_Buffer_add_modify_callback as addModifyCallback' { id `Ptr ()',id `FunPtr TextModifyCbPrim',id `Ptr ()' } -> `()' #}
instance (impl ~ (TextModifyCb -> IO (FunPtr ()))) => Op (AddModifyCallback ()) TextBuffer orig impl where
   runOp _ _ text_buffer bufmodifiedcb =
     withRef text_buffer $ \text_bufferPtr -> do
       funPtr' <- toTextModifyCbPrim bufmodifiedcb
       addModifyCallback' text_bufferPtr funPtr' nullPtr
       return (castFunPtr funPtr')
{# fun Fl_Text_Buffer_remove_modify_callback as removeModifyCallback' { id `Ptr ()',id `FunPtr TextModifyCbPrim',id `Ptr ()' } -> `()' #}
instance ( impl ~ (FunPtr () ->  IO ())) => Op (RemoveModifyCallback ()) TextBuffer orig impl where
   runOp _ _ text_buffer bufmodifiedcb =
     withRef text_buffer $ \text_bufferPtr ->
     removeModifyCallback' text_bufferPtr (castFunPtr  bufmodifiedcb) nullPtr
{# fun Fl_Text_Buffer_call_modify_callbacks as callModifyCallbacks' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (CallModifyCallbacks ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> callModifyCallbacks' text_bufferPtr
{# fun Fl_Text_Buffer_add_predelete_callback as addPredeleteCallback' { id `Ptr ()',id `FunPtr TextPredeleteCbPrim',id `Ptr ()' } -> `()' #}
instance ( impl ~ ( TextPredeleteCb ->  IO (FunPtr ()))) => Op (AddPredeleteCallback ()) TextBuffer orig impl where
   runOp _ _ text_buffer bufpredelcb =
     withRef text_buffer $ \text_bufferPtr -> do
       funPtr' <- toTextPredeleteCbPrim bufpredelcb
       addPredeleteCallback' text_bufferPtr funPtr' nullPtr
       return (castFunPtr funPtr')
{# fun Fl_Text_Buffer_remove_predelete_callback as removePredeleteCallback' { id `Ptr ()',id `FunPtr TextPredeleteCbPrim', id `Ptr ()' } -> `()' #}
instance ( impl ~ (FunPtr () -> IO ())) => Op (RemovePredeleteCallback ()) TextBuffer orig impl where
   runOp _ _ text_buffer predelcb =
     withRef text_buffer $ \text_bufferPtr ->
     removePredeleteCallback' text_bufferPtr (castFunPtr predelcb) nullPtr
{# fun Fl_Text_Buffer_call_predelete_callbacks as callPredeleteCallbacks' { id `Ptr ()' } -> `()' #}
instance ( impl ~ (  IO ())) => Op (CallPredeleteCallbacks ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> callPredeleteCallbacks' text_bufferPtr
{# fun Fl_Text_Buffer_line_text as lineText' { id `Ptr ()',`Int' } -> `Ptr CChar' id #}
instance ( impl ~ ( LineNumber ->  IO (Either OutOfRange String))) => Op (LineText ()) TextBuffer orig impl where
   runOp _ _ text_buffer (LineNumber pos) =
     withRef text_buffer $ \text_bufferPtr -> do
     r <- lineText' text_bufferPtr pos
     successOrOutOfRange r (r == nullPtr) peekCString
{# fun Fl_Text_Buffer_line_start as lineStart' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ ( LineNumber ->  IO (Either OutOfRange AtIndex))) => Op (LineStart ()) TextBuffer orig impl where
   runOp _ _ text_buffer (LineNumber pos) =
     withRef text_buffer $ \text_bufferPtr -> do
       bp <- lineStart' text_bufferPtr pos
       successOrOutOfRange bp (bp == 0) (return . AtIndex)
{# fun Fl_Text_Buffer_line_end as lineEnd' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ ( LineNumber ->  IO (Either OutOfRange AtIndex))) => Op (LineEnd ()) TextBuffer orig impl where
   runOp _ _ text_buffer (LineNumber pos) =
     withRef text_buffer $ \text_bufferPtr -> do
     bp <- lineEnd' text_bufferPtr pos
     successOrOutOfRange bp (bp == 0) (return . AtIndex)
{# fun Fl_Text_Buffer_word_start as wordStart' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex ->  IO (Either OutOfRange AtIndex))) => Op (WordStart ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex pos) = withRef text_buffer $ \text_bufferPtr -> do
     bp <- wordStart' text_bufferPtr pos
     successOrOutOfRange bp (bp == 0) (return . AtIndex)
{# fun Fl_Text_Buffer_word_end as wordEnd' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex ->  IO (Either OutOfRange AtIndex))) => Op (WordEnd ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex pos) = withRef text_buffer $ \text_bufferPtr -> do
     bp <- wordEnd' text_bufferPtr pos
     successOrOutOfRange bp (bp == 0) (return . AtIndex)
{# fun Fl_Text_Buffer_count_displayed_characters as countDisplayedCharacters' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance ( impl ~ (IndexRange ->  IO (Int))) => Op (CountDisplayedCharacters ()) TextBuffer orig impl where
  runOp _ _ text_buffer (IndexRange (AtIndex linestartpos) (AtIndex targetpos)) = withRef text_buffer $ \text_bufferPtr -> countDisplayedCharacters' text_bufferPtr linestartpos targetpos
{# fun Fl_Text_Buffer_skip_displayed_characters as skipDisplayedCharacters' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex-> Int -> IO (AtIndex))) => Op (SkipDisplayedCharacters ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex linestartpos) nchars =
     withRef text_buffer $ \text_bufferPtr -> skipDisplayedCharacters' text_bufferPtr linestartpos nchars >>= return . AtIndex
{# fun Fl_Text_Buffer_count_lines as countLines' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance ( impl ~ (IndexRange ->  IO (Lines))) => Op (CountLines ()) TextBuffer orig impl where
  runOp _ _ text_buffer (IndexRange (AtIndex startpos)(AtIndex endpos)) = withRef text_buffer $ \text_bufferPtr -> countLines' text_bufferPtr startpos endpos >>= return . Lines
{# fun Fl_Text_Buffer_skip_lines as skipLines' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex -> Lines ->  IO (AtIndex))) => Op (SkipLines ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex startpos) (Lines nlines) = withRef text_buffer $ \text_bufferPtr -> skipLines' text_bufferPtr startpos nlines >>= return . AtIndex
{# fun Fl_Text_Buffer_rewind_lines as rewindLines' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex -> Lines ->  IO (AtIndex))) => Op (RewindLines ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex startpos) (Lines nlines) = withRef text_buffer $ \text_bufferPtr -> rewindLines' text_bufferPtr startpos nlines >>= return . AtIndex
{# fun Fl_Text_Buffer_findchar_forward as findcharForward' { id `Ptr ()',`Int',`Int', id `Ptr CInt' } -> `Int' #}
instance ( impl ~ (AtIndex -> Char ->   IO (Either NotFound AtIndex))) => Op (FindcharForward ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex startpos) searchchar =
     withRef text_buffer $ \text_bufferPtr ->
     alloca $ \intPtr -> do
     status' <- findcharForward' text_bufferPtr startpos (fromIntegral $ castCharToCChar searchchar) intPtr
     if (status' == 0)
       then return (Left NotFound)
       else peekIntConv intPtr >>= return . Right . AtIndex
{# fun Fl_Text_Buffer_findchar_backward as findcharBackward' { id `Ptr ()',`Int',`Int',id `Ptr CInt' } -> `Int' #}
instance ( impl ~ (AtIndex -> Char -> IO (Either NotFound AtIndex))) => Op (FindcharBackward ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex startpos) searchchar =
     withRef text_buffer $ \text_bufferPtr ->
     alloca $ \intPtr -> do
     status' <- findcharBackward' text_bufferPtr startpos (fromIntegral $ castCharToCChar searchchar) intPtr
     if (status' == 0)
       then return (Left NotFound)
       else peekIntConv intPtr >>= return . Right . AtIndex
{# fun Fl_Text_Buffer_search_forward_with_matchcase as searchForwardWithMatchcase' { id `Ptr ()',`Int', `CString',id `Ptr CInt', cFromBool `Bool' } -> `Int' #}
instance ( impl ~ (AtIndex -> T.Text -> Bool ->  IO (Either NotFound AtIndex))) => Op (SearchForwardWithMatchcase ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex startpos) searchstring matchcase =
     withRef text_buffer $ \text_bufferPtr ->
     alloca $ \intPtr -> do
     status' <- withText searchstring (\s -> searchForwardWithMatchcase' text_bufferPtr startpos s intPtr matchcase)
     if (status' == 0)
       then return (Left NotFound)
       else peekIntConv intPtr >>= return .  Right . AtIndex
{# fun Fl_Text_Buffer_search_backward_with_matchcase as searchBackwardWithMatchcase' { id `Ptr ()',`Int', `CString',id `Ptr CInt', cFromBool `Bool' } -> `Int' #}
instance ( impl ~ (AtIndex -> T.Text -> Bool ->  IO (Either NotFound AtIndex))) => Op (SearchBackwardWithMatchcase ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex startpos) searchstring matchcase =
     withRef text_buffer $ \text_bufferPtr ->
     alloca $ \intPtr -> do
     status' <- withText searchstring (\s -> searchBackwardWithMatchcase' text_bufferPtr startpos s intPtr matchcase)
     if (status' == 0)
       then return (Left NotFound)
       else peekIntConv intPtr >>= return .  Right . AtIndex
{# fun Fl_Text_Buffer_primary_selection as primarySelection' { id `Ptr ()' } -> `Ptr ()' id #}
instance ( impl ~ (  IO (Maybe (Ref TextSelection)))) => Op (PrimarySelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> primarySelection' text_bufferPtr >>= toMaybeRef
{# fun Fl_Text_Buffer_secondary_selection as secondarySelection' { id `Ptr ()' } -> `Ptr ()' id #}
instance ( impl ~ (  IO (Maybe (Ref TextSelection)))) => Op (SecondarySelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> secondarySelection' text_bufferPtr >>= toMaybeRef
{# fun Fl_Text_Buffer_highlight_selection as highlightSelection' { id `Ptr ()' } -> `Ptr ()' id #}
instance ( impl ~ (  IO (Maybe (Ref TextSelection)))) => Op (HighlightSelection ()) TextBuffer orig impl where
   runOp _ _ text_buffer = withRef text_buffer $ \text_bufferPtr -> highlightSelection' text_bufferPtr >>= toMaybeRef
{# fun Fl_Text_Buffer_prev_char as prevChar' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ ( AtIndex ->  IO (Either OutOfRange AtIndex))) => Op (PrevChar ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex ix) =
     withRef text_buffer $ \text_bufferPtr -> do
       p' <- prevChar' text_bufferPtr ix
       successOrOutOfRange p' (p' == 0) (return . AtIndex)
{# fun Fl_Text_Buffer_prev_char_clipped as prevCharClipped' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex ->  IO (Either OutOfRange AtIndex))) => Op (PrevCharClipped ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex ix) =
     withRef text_buffer $ \text_bufferPtr -> do
     p' <- prevCharClipped' text_bufferPtr ix
     successOrOutOfRange p' (p' == 0) (return . AtIndex)
{# fun Fl_Text_Buffer_next_char as nextChar' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex ->  IO AtIndex)) => Op (NextChar ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex ix) = withRef text_buffer $ \text_bufferPtr -> nextChar' text_bufferPtr ix >>= return . AtIndex
{# fun Fl_Text_Buffer_next_char_clipped as nextCharClipped' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex ->  IO (AtIndex))) => Op (NextCharClipped ()) TextBuffer orig impl where
   runOp _ _ text_buffer (AtIndex ix) = withRef text_buffer $ \text_bufferPtr -> nextCharClipped' text_bufferPtr ix >>= return . AtIndex
{# fun Fl_Text_Buffer_utf8_align as utf8Align' { id `Ptr ()',`Int' } -> `Int' #}
instance ( impl ~ (AtIndex ->  IO (Either OutOfRange AtIndex))) => Op (Utf8Align ()) TextBuffer orig impl where
  runOp _ _ text_buffer (AtIndex align) =
     withRef text_buffer $ \text_bufferPtr -> do
     p' <- utf8Align' text_bufferPtr align
     successOrOutOfRange p' (p' == 0) (return . AtIndex)

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.TextBuffer"
-- @

-- $functions
-- @
-- addModifyCallback :: 'Ref' 'TextBuffer' -> 'TextModifyCb' -> 'IO' ('FunPtr' ())
--
-- addPredeleteCallback :: 'Ref' 'TextBuffer' -> 'TextPredeleteCb' -> 'IO' ('FunPtr' ())
--
-- appendToBuffer :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ()
--
-- appendfile :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- appendfileWithBuflen :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'Int' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- byteAt :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' 'Char'
--
-- callModifyCallbacks :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- callPredeleteCallbacks :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- canUndo :: 'Ref' 'TextBuffer' -> 'Bool' -> 'IO' ()
--
-- charAt :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('Char')
--
-- copy:: ('Parent' a 'TextBuffer') => 'Ref' 'TextBuffer' -> 'Ref' a -> 'IndexRange' -> 'AtIndex' -> 'IO' ()
--
-- countDisplayedCharacters :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' ('Int')
--
-- countLines :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' ('Lines')
--
-- destroy :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- fileEncodingWarningMessage :: 'Ref' 'TextBuffer' -> 'IO' 'T.Text'
--
-- findcharBackward :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'Char' -> 'IO' ('Either' 'NotFound' 'AtIndex')
--
-- findcharForward :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'Char' -> 'IO' ('Either' 'NotFound' 'AtIndex')
--
-- getHighlight :: 'Ref' 'TextBuffer' -> 'IO' ('Bool')
--
-- getLength :: 'Ref' 'TextBuffer' -> 'IO' ('Int')
--
-- getTabDistance :: 'Ref' 'TextBuffer' -> 'IO' ('Int')
--
-- getText :: 'Ref' 'TextBuffer' -> 'IO' 'T.Text'
--
-- highlightPosition :: 'Ref' 'TextBuffer' -> 'IO' ('Maybe' 'IndexRange')
--
-- highlightSelection :: 'Ref' 'TextBuffer' -> 'IO' ('Maybe' ('Ref' 'TextSelection'))
--
-- highlightText :: 'Ref' 'TextBuffer' -> 'IO' 'T.Text'
--
-- inputFileWasTranscoded :: 'Ref' 'TextBuffer' -> 'IO' ('Bool')
--
-- insert :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'T.Text' -> 'IO' ()
--
-- insertfile :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'AtIndex' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- insertfileWithBuflen :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'AtIndex' -> 'Int' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- lineEnd :: 'Ref' 'TextBuffer' -> 'LineNumber' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
--
-- lineStart :: 'Ref' 'TextBuffer' -> 'LineNumber' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
--
-- lineText :: 'Ref' 'TextBuffer' -> 'LineNumber' -> 'IO' ('Either' 'OutOfRange' 'String')
--
-- loadfile :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- loadfileWithBuflen :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'Int' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- nextChar :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' 'AtIndex'
--
-- nextCharClipped :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('AtIndex')
--
-- outputfile :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IndexRange' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- outputfileWithBuflen :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IndexRange' -> 'Int' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- prevChar :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
--
-- prevCharClipped :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
--
-- primarySelection :: 'Ref' 'TextBuffer' -> 'IO' ('Maybe' ('Ref' 'TextSelection'))
--
-- remove :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' ()
--
-- removeModifyCallback :: 'Ref' 'TextBuffer' -> 'FunPtr' () -> 'IO' ()
--
-- removePredeleteCallback :: 'Ref' 'TextBuffer' -> 'FunPtr' () -> 'IO' ()
--
-- removeSecondarySelection :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- removeSelection :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- replace :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'T.Text' -> 'IO' ()
--
-- replaceSecondarySelection :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ()
--
-- replaceSelection :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ()
--
-- rewindLines :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'Lines' -> 'IO' ('AtIndex')
--
-- savefile :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- savefileWithBuflen :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'Int' -> 'IO' ('Either' 'DataProcessingError' ())
--
-- searchBackwardWithMatchcase :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'T.Text' -> 'Bool' -> 'IO' ('Either' 'NotFound' 'AtIndex')
--
-- searchForwardWithMatchcase :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'T.Text' -> 'Bool' -> 'IO' ('Either' 'NotFound' 'AtIndex')
--
-- secondarySelect :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' ()
--
-- secondarySelected :: 'Ref' 'TextBuffer' -> 'IO' ('Bool')
--
-- secondarySelection :: 'Ref' 'TextBuffer' -> 'IO' ('Maybe' ('Ref' 'TextSelection'))
--
-- secondarySelectionPosition :: 'Ref' 'TextBuffer' -> 'IO' 'IndexRange'
--
-- secondarySelectionText :: 'Ref' 'TextBuffer' -> 'IO' 'T.Text'
--
-- secondaryUnselect :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- select :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' ()
--
-- selected :: 'Ref' 'TextBuffer' -> 'IO' ('Bool')
--
-- selectionPosition :: 'Ref' 'TextBuffer' -> 'IO' ('IndexRange')
--
-- selectionText :: 'Ref' 'TextBuffer' -> 'IO' 'T.Text'
--
-- setHighlight :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' ()
--
-- setTabDistance :: 'Ref' 'TextBuffer' -> 'Int' -> 'IO' ()
--
-- setText :: 'Ref' 'TextBuffer' -> 'T.Text' -> 'IO' ()
--
-- skipDisplayedCharacters :: 'Ref' 'TextBuffer' -> 'AtIndex'>- 'Int' -> 'IO' ('AtIndex')
--
-- skipLines :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'Lines' -> 'IO' ('AtIndex')
--
-- textRange :: 'Ref' 'TextBuffer' -> 'IndexRange' -> 'IO' 'T.Text'
--
-- undo :: 'Ref' 'TextBuffer' -> 'IO' ('Either' 'NoChange' 'AtIndex')
--
-- unhighlight :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- unselect :: 'Ref' 'TextBuffer' -> 'IO' ()
--
-- utf8Align :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
--
-- wordEnd :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
--
-- wordStart :: 'Ref' 'TextBuffer' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' 'AtIndex')
-- @
