{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.FileBrowser
    (
     -- * Constructor
     fileBrowserNew,
     FileBrowserType(..),
     FileSortF,
     numericSort,
     alphaSort,
     caseAlphaSort,
     caseNumericSort
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $FileBrowserfunctions
     --
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_File_BrowserC.h"
#include "Fl_WidgetC.h"
#include "FL/filename.H"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
{# pointer *Fl_File_Sort_F as FileSortF #}
{# fun Fl_File_Browser_New as fileBrowserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_File_Browser_New_WithLabel as fileBrowserNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
fileBrowserNew :: Rectangle -> Maybe String -> IO (Ref FileBrowser)
fileBrowserNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> fileBrowserNew' x_pos y_pos width height >>=
                             toRef
        Just l -> fileBrowserNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_File_Browser_set_iconsize as setIconsize' { id `Ptr ()', id `CUChar' } -> `()' #}
instance (impl ~ (CUChar ->  IO ())) => Op (SetIconsize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser text = withRef fileBrowser $ \fileBrowserPtr -> setIconsize' fileBrowserPtr text
{# fun Fl_File_Browser_iconsize as iconsize' { id `Ptr ()' } -> `CUChar' id #}
instance (impl ~ ( IO (CUChar))) => Op (GetIconsize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> iconsize' fileBrowserPtr
{# fun Fl_File_Browser_set_filter as setFilter' { id `Ptr ()', `String' } -> `()' #}
instance (impl ~ (String ->  IO ())) => Op (SetFilter ()) FileBrowser orig impl where
  runOp _ _ fileBrowser text = withRef fileBrowser $ \fileBrowserPtr -> setFilter' fileBrowserPtr text
{# fun Fl_File_Browser_filter as filter' { id `Ptr ()' } -> `String' unsafeFromCString #}
instance (impl ~ ( IO (String))) => Op (GetFilter ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> filter' fileBrowserPtr
{# fun Fl_File_Browser_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser (FontSize text) = withRef fileBrowser $ \fileBrowserPtr -> setTextsize' fileBrowserPtr text
{# fun Fl_File_Browser_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> textsize' fileBrowserPtr >>= return . FontSize
{# fun Fl_File_Browser_set_filetype as setFileType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (FileBrowserType ->  IO ())) => Op (SetFiletype ()) FileBrowser orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setFileType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_File_Browser_filetype as filetype' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (FileBrowserType)) => Op (GetFiletype ()) FileBrowser orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> filetype' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_File_Browser_load as load' { id `Ptr ()', `String', id `FileSortF' } -> `CInt' id #}
instance (impl ~ (String -> FileSortF -> IO (Either UnknownError ()))) => Op (Load ()) FileBrowser orig impl where
  runOp _ _ widget dir sortF = withRef widget $ \widgetPtr -> do
                               status <- load' widgetPtr dir sortF
                               return (if (status == 0) then (Left UnknownError) else (Right ()))

{# fun fl_numericsort_reference     as numericSort     {} -> `FileSortF' #}
{# fun fl_alphasort_reference       as alphaSort       {} -> `FileSortF' #}
{# fun fl_casealphasort_reference   as caseAlphaSort   {} -> `FileSortF' #}
{# fun fl_casenumericsort_reference as caseNumericSort {} -> `FileSortF' #}