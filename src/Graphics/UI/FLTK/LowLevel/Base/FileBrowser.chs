{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.FileBrowser
    (
     -- * Constructor
     fileBrowserNew,
     fileBrowserCustom,
     FileBrowserType(..),
     FileSortF,
     numericSort,
     alphaSort,
     caseAlphaSort,
     caseNumericSort
   , drawFileBrowserBase
   , handleFileBrowserBase
   , resizeFileBrowserBase
   , hideFileBrowserBase
   , showWidgetFileBrowserBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $FileBrowserFunctions
     --
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_File_BrowserC.h"
#include "Fl_WidgetC.h"
#include "FL/filename.H"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# pointer *Fl_File_Sort_F as FileSortF #}

{# fun Fl_OverriddenFile_Browser_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenFile_Browser_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
fileBrowserCustom ::
       Rectangle                         -- ^ The bounds of this FileBrowser
    -> Maybe T.Text                      -- ^ The FileBrowser label
    -> Maybe (Ref FileBrowser -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs FileBrowser)      -- ^ Optional custom widget functions
    -> IO (Ref FileBrowser)
fileBrowserCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_File_Browser_New as fileBrowserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_File_Browser_New_WithLabel as fileBrowserNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
fileBrowserNew :: Rectangle -> Maybe T.Text -> IO (Ref FileBrowser)
fileBrowserNew rectangle l'=
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_File_Browser_set_iconsize as setIconsize' { id `Ptr ()', id `CUChar' } -> `()' #}
instance (impl ~ (CUChar ->  IO ())) => Op (SetIconsize ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser text = withRef fileBrowser $ \fileBrowserPtr -> setIconsize' fileBrowserPtr text
{# fun Fl_File_Browser_iconsize as iconsize' { id `Ptr ()' } -> `CUChar' id #}
instance (impl ~ ( IO (CUChar))) => Op (GetIconsize ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> iconsize' fileBrowserPtr
{# fun Fl_File_Browser_set_filter as setFilter' { id `Ptr ()', `CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetFilter ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser text = withRef fileBrowser $ \fileBrowserPtr -> copyTextToCString text >>= setFilter' fileBrowserPtr
{# fun Fl_File_Browser_filter as filter' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetFilter ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> filter' fileBrowserPtr >>= cStringToText
{# fun Fl_File_Browser_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser (FontSize text) = withRef fileBrowser $ \fileBrowserPtr -> setTextsize' fileBrowserPtr text
{# fun Fl_File_Browser_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> textsize' fileBrowserPtr >>= return . FontSize
{# fun Fl_File_Browser_set_filetype as setFileType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (FileBrowserType ->  IO ())) => Op (SetFiletype ()) FileBrowserBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setFileType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_File_Browser_filetype as filetype' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (FileBrowserType)) => Op (GetFiletype ()) FileBrowserBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> filetype' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_File_Browser_load as load' { id `Ptr ()', `CString', id `FileSortF' } -> `CInt' id #}
instance (impl ~ (T.Text -> FileSortF -> IO (Either UnknownError ()))) => Op (Load ()) FileBrowserBase orig impl where
  runOp _ _ widget dir sortF = withRef widget $ \widgetPtr -> do
                               status <- copyTextToCString dir >>= \d -> load' widgetPtr d sortF
                               return (if (status == 0) then (Left UnknownError) else (Right ()))

{# fun Fl_File_Browser_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawFileBrowserBase ::  Ref FileBrowserBase -> IO ()
drawFileBrowserBase fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> drawSuper' fileBrowserPtr
{# fun Fl_File_Browser_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleFileBrowserBase :: Ref FileBrowserBase -> Event ->  IO (Either UnknownEvent ())
handleFileBrowserBase fileBrowser event = withRef fileBrowser $ \fileBrowserPtr -> handleSuper' fileBrowserPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_File_Browser_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeFileBrowserBase :: Ref FileBrowserBase -> Rectangle -> IO ()
resizeFileBrowserBase fileBrowser rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef fileBrowser $ \fileBrowserPtr -> resizeSuper' fileBrowserPtr x_pos y_pos width height
{# fun Fl_File_Browser_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideFileBrowserBase ::  Ref FileBrowserBase -> IO ()
hideFileBrowserBase fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> hideSuper' fileBrowserPtr
{# fun Fl_File_Browser_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetFileBrowserBase ::  Ref FileBrowserBase -> IO ()
showWidgetFileBrowserBase fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> showSuper' fileBrowserPtr

{# fun Fl_File_Browser_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> draw'' fileBrowserPtr
{#fun Fl_File_Browser_handle as fileBrowserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser event = withRef fileBrowser (\p -> fileBrowserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_File_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> hide' fileBrowserPtr
{# fun Fl_File_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> show' fileBrowserPtr
{# fun Fl_File_Browser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) FileBrowserBase orig impl where
  runOp _ _ fileBrowser rectangle = withRef fileBrowser $ \fileBrowserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' fileBrowserPtr x_pos y_pos w_pos h_pos


{# fun fl_numericsort_reference     as numericSort     {} -> `FileSortF' #}
{# fun fl_alphasort_reference       as alphaSort       {} -> `FileSortF' #}
{# fun fl_casealphasort_reference   as caseAlphaSort   {} -> `FileSortF' #}
{# fun fl_casenumericsort_reference as caseNumericSort {} -> `FileSortF' #}


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Browser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.FileBrowser"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'FileBrowserBase' -> 'IO' ()
--
-- getFiletype :: 'Ref' 'FileBrowserBase' -> 'IO' ('FileBrowserType')
--
-- getFilter :: 'Ref' 'FileBrowserBase' -> 'IO' 'T.Text'
--
-- getIconsize :: 'Ref' 'FileBrowserBase' -> 'IO' ('CUChar')
--
-- getTextsize :: 'Ref' 'FileBrowserBase' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'FileBrowserBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'FileBrowserBase' -> 'IO' ()
--
-- load :: 'Ref' 'FileBrowserBase' -> 'T.Text' -> 'FileSortF' -> 'IO' ('Either' 'UnknownError' ())
--
-- resize :: 'Ref' 'FileBrowserBase' -> 'Rectangle' -> 'IO' ()
--
-- setFiletype :: 'Ref' 'FileBrowserBase' -> 'FileBrowserType' -> 'IO' ()
--
-- setFilter :: 'Ref' 'FileBrowserBase' -> 'T.Text' -> 'IO' ()
--
-- setIconsize :: 'Ref' 'FileBrowserBase' -> 'CUChar' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'FileBrowserBase' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'FileBrowserBase' -> 'IO' ()
-- @
