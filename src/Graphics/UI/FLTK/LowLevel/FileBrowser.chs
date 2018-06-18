{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.FileBrowser
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
import Graphics.UI.FLTK.LowLevel.Widget

{# pointer *Fl_File_Sort_F as FileSortF #}

{# fun Fl_OverriddenFile_Browser_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
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
{# fun Fl_File_Browser_New_WithLabel as fileBrowserNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
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
instance (impl ~ (CUChar ->  IO ())) => Op (SetIconsize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser text = withRef fileBrowser $ \fileBrowserPtr -> setIconsize' fileBrowserPtr text
{# fun Fl_File_Browser_iconsize as iconsize' { id `Ptr ()' } -> `CUChar' id #}
instance (impl ~ ( IO (CUChar))) => Op (GetIconsize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> iconsize' fileBrowserPtr
{# fun Fl_File_Browser_set_filter as setFilter' { id `Ptr ()', unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetFilter ()) FileBrowser orig impl where
  runOp _ _ fileBrowser text = withRef fileBrowser $ \fileBrowserPtr -> setFilter' fileBrowserPtr text
{# fun Fl_File_Browser_filter as filter' { id `Ptr ()' } -> `T.Text' unsafeFromCString #}
instance (impl ~ ( IO T.Text)) => Op (GetFilter ()) FileBrowser orig impl where
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
{# fun Fl_File_Browser_load as load' { id `Ptr ()', unsafeToCString `T.Text', id `FileSortF' } -> `CInt' id #}
instance (impl ~ (T.Text -> FileSortF -> IO (Either UnknownError ()))) => Op (Load ()) FileBrowser orig impl where
  runOp _ _ widget dir sortF = withRef widget $ \widgetPtr -> do
                               status <- load' widgetPtr dir sortF
                               return (if (status == 0) then (Left UnknownError) else (Right ()))

{# fun Fl_File_Browser_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> draw'' fileBrowserPtr
{# fun Fl_File_Browser_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> drawSuper' fileBrowserPtr
{#fun Fl_File_Browser_handle as fileBrowserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) FileBrowser orig impl where
  runOp _ _ fileBrowser event = withRef fileBrowser (\p -> fileBrowserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_File_Browser_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) FileBrowser orig impl where
  runOp _ _ fileBrowser event = withRef fileBrowser $ \fileBrowserPtr -> handleSuper' fileBrowserPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_File_Browser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) FileBrowser orig impl where
  runOp _ _ fileBrowser rectangle = withRef fileBrowser $ \fileBrowserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' fileBrowserPtr x_pos y_pos w_pos h_pos
{# fun Fl_File_Browser_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) FileBrowser orig impl where
  runOp _ _ fileBrowser rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef fileBrowser $ \fileBrowserPtr -> resizeSuper' fileBrowserPtr x_pos y_pos width height
{# fun Fl_File_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> hide' fileBrowserPtr
{# fun Fl_File_Browser_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> hideSuper' fileBrowserPtr
{# fun Fl_File_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> show' fileBrowserPtr
{# fun Fl_File_Browser_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) FileBrowser orig impl where
  runOp _ _ fileBrowser = withRef fileBrowser $ \fileBrowserPtr -> showSuper' fileBrowserPtr


{# fun fl_numericsort_reference     as numericSort     {} -> `FileSortF' #}
{# fun fl_alphasort_reference       as alphaSort       {} -> `FileSortF' #}
{# fun fl_casealphasort_reference   as caseAlphaSort   {} -> `FileSortF' #}
{# fun fl_casenumericsort_reference as caseNumericSort {} -> `FileSortF' #}

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Browser"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.FileBrowser"
-- @

-- $FileBrowserFunctions
-- @
-- draw :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- getFiletype :: 'Ref' 'FileBrowser' -> 'IO' ('FileBrowserType')
--
-- getFilter :: 'Ref' 'FileBrowser' -> 'IO' 'T.Text'
--
-- getIconsize :: 'Ref' 'FileBrowser' -> 'IO' ('CUChar')
--
-- getTextsize :: 'Ref' 'FileBrowser' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'FileBrowser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'FileBrowser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- load :: 'Ref' 'FileBrowser' -> 'T.Text' -> 'FileSortF' -> 'IO' ('Either' 'UnknownError' ())
--
-- resize :: 'Ref' 'FileBrowser' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'FileBrowser' -> 'Rectangle' -> 'IO' ()
--
-- setFiletype :: 'Ref' 'FileBrowser' -> 'FileBrowserType' -> 'IO' ()
--
-- setFilter :: 'Ref' 'FileBrowser' -> 'T.Text' -> 'IO' ()
--
-- setIconsize :: 'Ref' 'FileBrowser' -> 'CUChar' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'FileBrowser' -> 'FontSize' -> 'IO' ()
--
-- showWidget :: 'Ref' 'FileBrowser' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'FileBrowser' -> 'IO' ()
-- @
