{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.NativeFileChooser
    (
     NativeFileChooserType(..),
     NativeFileChooserOption(..),
     NativeFileChooserUserAction(..),
     allNativeFileChooserOptions,
     -- * Constructor
     nativeFileChooserNew
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Native_File_Chooser
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Native_File_ChooserC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T

#c
enum NativeFileChooserType {
    BrowseFile           = BROWSE_FILE,
    BrowseDirectory      = BROWSE_DIRECTORY,
    BrowseMultiFile      = BROWSE_MULTI_FILE,
    BrowseMultiDirectory = BROWSE_MULTI_DIRECTORY,
    BrowseSaveFile       = BROWSE_SAVE_FILE,
    BrowseSaveDirectory  = BROWSE_SAVE_DIRECTORY
};

enum NativeFileChooserOption {
 NoOptions     = NO_OPTIONS,
 SaveasConfirm = SAVEAS_CONFIRM,
 NewFolder     = NEW_FOLDER,
 Preview       = PREVIEW,
 UseFilterExt  = USE_FILTER_EXT
};
#endc

{#enum NativeFileChooserType {} deriving (Show, Eq, Ord) #}
{#enum NativeFileChooserOption {} deriving (Show, Eq, Ord) #}

data NativeFileChooserUserAction =
  NativeFileChooserPicked |
  NativeFileChooserCancelled |
  NativeFileChooserError

allNativeFileChooserOptions :: [NativeFileChooserOption]
allNativeFileChooserOptions =
  [
   NoOptions,
   SaveasConfirm,
   NewFolder,
   Preview,
   UseFilterExt
  ]

{# fun Fl_Native_File_Chooser_New_WithVal as newWithVal' { `Int' } -> `Ptr ()' id #}
{# fun Fl_Native_File_Chooser_New as new' {  } -> `Ptr ()' id #}
nativeFileChooserNew :: Maybe NativeFileChooserType -> IO (Ref NativeFileChooser)
nativeFileChooserNew t =
  case t of
   (Just t') -> newWithVal' (fromEnum t') >>= toRef
   Nothing -> new' >>= toRef

{# fun Fl_Native_File_Chooser_Destroy as nativeFileChooserDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ IO ()) => Op (Destroy ()) NativeFileChooser orig impl where
  runOp _ _ chooser = swapRef chooser $ \chooserPtr -> do
    nativeFileChooserDestroy' chooserPtr
    return nullPtr
{# fun Fl_Native_File_Chooser_set_type as setType' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (NativeFileChooserType ->  IO ())) => Op (SetType ()) NativeFileChooser orig impl where
  runOp _ _ chooser type'' = withRef chooser $ \chooserPtr -> setType' chooserPtr (fromEnum type'')
{# fun Fl_Native_File_Chooser_type as type' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (NativeFileChooserType))) => Op (GetType_ ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> type' chooserPtr >>= return . toEnum
{# fun Fl_Native_File_Chooser_set_options as setOptions' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ ([NativeFileChooserOption] ->  IO ())) => Op (SetOptions ()) NativeFileChooser orig impl where
   runOp _ _ chooser options = withRef chooser $ \chooserPtr -> setOptions' chooserPtr (combine options)
{# fun Fl_Native_File_Chooser_options as options' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO ([NativeFileChooserOption]))) => Op (GetOptions ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> do
     opts <- options' chooserPtr
     if (opts == 0)
       then return []
       else return (extract allNativeFileChooserOptions $ fromIntegral opts)
{# fun Fl_Native_File_Chooser_count as count' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetCount ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> count' chooserPtr
{# fun Fl_Native_File_Chooser_filename as filename' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetFilename ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> filename' chooserPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_filename_with_i as filenameWithI' { id `Ptr ()',`Int' } -> `CString' #}
instance (impl ~ (AtIndex ->  IO (Maybe T.Text))) => Op (GetFilenameAt ()) NativeFileChooser orig impl where
   runOp _ _ chooser (AtIndex i) = withRef chooser $ \chooserPtr -> filenameWithI' chooserPtr i >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_set_directory as setDirectory' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetDirectory ()) NativeFileChooser orig impl where
   runOp _ _ chooser val = withRef chooser $ \chooserPtr -> copyTextToCString val >>= setDirectory' chooserPtr
{# fun Fl_Native_File_Chooser_directory as directory' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetDirectory ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> directory' chooserPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_set_title as setTitle' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetTitle ()) NativeFileChooser orig impl where
   runOp _ _ chooser title'' = withRef chooser $ \chooserPtr -> copyTextToCString title'' >>= setTitle' chooserPtr
{# fun Fl_Native_File_Chooser_title as title' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetTitle ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> title' chooserPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_filter as filter' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetFilter ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> filter' chooserPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_set_filter as setFilter' { id `Ptr ()', `CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetFilter ()) NativeFileChooser orig impl where
   runOp _ _ chooser filter'' = withRef chooser $ \chooserPtr -> copyTextToCString filter'' >>= setFilter' chooserPtr
{# fun Fl_Native_File_Chooser_filters as filters' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Filters ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> filters' chooserPtr
{# fun Fl_Native_File_Chooser_set_filter_value as setFilterValue' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (SetFilterValue ()) NativeFileChooser orig impl where
   runOp _ _ chooser (AtIndex i) = withRef chooser $ \chooserPtr -> setFilterValue' chooserPtr i
{# fun Fl_Native_File_Chooser_filter_value as filterValue' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (AtIndex))) => Op (GetFilterValue ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> filterValue' chooserPtr >>= return . AtIndex
{# fun Fl_Native_File_Chooser_set_preset_file as setPresetFile' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetPresetFile ()) NativeFileChooser orig impl where
   runOp _ _ chooser preset' = withRef chooser $ \chooserPtr -> copyTextToCString preset' >>= setPresetFile' chooserPtr
{# fun Fl_Native_File_Chooser_preset_file as presetFile' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetPresetFile ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> presetFile' chooserPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_errmsg as errmsg' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO (Maybe T.Text))) => Op (GetErrmsg ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> errmsg' chooserPtr >>= \s -> cStringToText s >>= \s ->
     if (T.null s) then return Nothing else return (Just s)
{# fun Fl_Native_File_Chooser_show as show' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (NativeFileChooserUserAction))) => Op (ShowWidget ()) NativeFileChooser orig impl where
   runOp _ _ chooser = withRef chooser $ \chooserPtr -> do
     res' <- show' chooserPtr
     return $ case res' of
       0    -> NativeFileChooserPicked
       1    -> NativeFileChooserCancelled
       (-1) -> NativeFileChooserError
       x''  -> error $ "NativeFileChooser::showWidget, unknown option:" ++ (show  x'')


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.NativeFileChooser"
-- @

-- $functions
-- @
-- destroy :: 'Ref' 'NativeFileChooser' -> 'IO' ()
--
-- filters :: 'Ref' 'NativeFileChooser' -> 'IO' ('Int')
--
-- getCount :: 'Ref' 'NativeFileChooser' -> 'IO' ('Int')
--
-- getDirectory :: 'Ref' 'NativeFileChooser' -> 'IO' ('Maybe' 'T.Text')
--
-- getErrmsg :: 'Ref' 'NativeFileChooser' -> 'IO' ('Maybe' 'T.Text')
--
-- getFilename :: 'Ref' 'NativeFileChooser' -> 'IO' ('Maybe' 'T.Text')
--
-- getFilenameAt :: 'Ref' 'NativeFileChooser' -> 'AtIndex' -> 'IO' ('Maybe' 'T.Text')
--
-- getFilter :: 'Ref' 'NativeFileChooser' -> 'IO' ('Maybe' 'T.Text')
--
-- getFilterValue :: 'Ref' 'NativeFileChooser' -> 'IO' ('AtIndex')
--
-- getOptions :: 'Ref' 'NativeFileChooser' -> 'IO' (['NativeFileChooserOption')]
--
-- getPresetFile :: 'Ref' 'NativeFileChooser' -> 'IO' ('Maybe' 'T.Text')
--
-- getTitle :: 'Ref' 'NativeFileChooser' -> 'IO' ('Maybe' 'T.Text')
--
-- getType_ :: 'Ref' 'NativeFileChooser' -> 'IO' ('NativeFileChooserType')
--
-- setDirectory :: 'Ref' 'NativeFileChooser' -> 'T.Text' -> 'IO' ()
--
-- setFilter :: 'Ref' 'NativeFileChooser' -> 'T.Text' -> 'IO' ()
--
-- setFilterValue :: 'Ref' 'NativeFileChooser' -> 'AtIndex' -> 'IO' ()
--
-- setOptions :: 'Ref' 'NativeFileChooser' -> ['NativeFileChooserOption'] -> 'IO' ()
--
-- setPresetFile :: 'Ref' 'NativeFileChooser' -> 'T.Text' -> 'IO' ()
--
-- setTitle :: 'Ref' 'NativeFileChooser' -> 'T.Text' -> 'IO' ()
--
-- setType :: 'Ref' 'NativeFileChooser' -> 'NativeFileChooserType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'NativeFileChooser' -> 'IO' ('NativeFileChooserUserAction')
-- @
