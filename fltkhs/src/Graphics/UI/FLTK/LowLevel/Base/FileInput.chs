{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.FileInput
    (
     fileInputNew,
     fileInputCustom
   , drawFileInputBase
   , handleFileInputBase
   , resizeFileInputBase
   , hideFileInputBase
   , showWidgetFileInputBase
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
#include "Fl_File_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Base.Widget

{# fun Fl_OverriddenFile_Input_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenFile_Input_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
fileInputCustom ::
       Rectangle                         -- ^ The bounds of this FileInput
    -> Maybe T.Text                      -- ^ The FileInput label
    -> Maybe (Ref FileInput -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs FileInput)      -- ^ Optional custom widget functions
    -> IO (Ref FileInput)
fileInputCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_File_Input_New as fileInputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_File_Input_New_WithLabel as fileInputNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
fileInputNew :: Rectangle -> Maybe T.Text -> IO (Ref FileInput)
fileInputNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_File_Input_down_box as downBox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ ( IO (Boxtype))) => Op (GetDownBox ()) FileInputBase orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> downBox' fileInputPtr
{# fun Fl_File_Input_set_down_box as setDownBox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetDownBox ()) FileInputBase orig impl where
  runOp _ _ fileInput b = withRef fileInput $ \fileInputPtr -> setDownBox' fileInputPtr b
{# fun Fl_File_Input_errorcolor as errorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetErrorColor ()) FileInputBase orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> errorColor' fileInputPtr
{# fun Fl_File_Input_set_errorcolor as setErrorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetErrorColor ()) FileInputBase orig impl where
  runOp _ _ fileInput b = withRef fileInput $ \fileInputPtr -> setErrorColor' fileInputPtr b
{# fun Fl_File_Input_set_value as setValue' { id `Ptr ()', `CString'} -> `()' #}
instance (impl ~ (T.Text -> IO ())) => Op (SetValue ()) FileInputBase orig impl where
  runOp _ _ fileInput s = withRef fileInput $ \fileInputPtr -> copyTextToCString s >>= setValue' fileInputPtr
{# fun Fl_File_Input_value as getValue' { id `Ptr ()' } -> `CString' #}
instance (impl ~ (IO T.Text)) => Op (GetValue ()) FileInputBase orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> getValue' fileInputPtr >>= cStringToText

{# fun Fl_File_Input_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawFileInputBase ::  Ref FileInputBase -> IO ()
drawFileInputBase fileInput = withRef fileInput $ \fileInputPtr -> drawSuper' fileInputPtr
{# fun Fl_File_Input_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleFileInputBase :: Ref FileInputBase -> Event ->  IO (Either UnknownEvent ())
handleFileInputBase fileInput event = withRef fileInput $ \fileInputPtr -> handleSuper' fileInputPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_File_Input_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeFileInputBase :: Ref FileInputBase -> Rectangle -> IO ()
resizeFileInputBase fileInput rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef fileInput $ \fileInputPtr -> resizeSuper' fileInputPtr x_pos y_pos width height
{# fun Fl_File_Input_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideFileInputBase ::  Ref FileInputBase -> IO ()
hideFileInputBase fileInput = withRef fileInput $ \fileInputPtr -> hideSuper' fileInputPtr
{# fun Fl_File_Input_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetFileInputBase ::  Ref FileInputBase -> IO ()
showWidgetFileInputBase fileInput = withRef fileInput $ \fileInputPtr -> showSuper' fileInputPtr

{# fun Fl_File_Input_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) FileInputBase orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> draw'' fileInputPtr
{#fun Fl_File_Input_handle as fileInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) FileInputBase orig impl where
  runOp _ _ fileInput event = withRef fileInput (\p -> fileInputHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_File_Input_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) FileInputBase orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> hide' fileInputPtr
{# fun Fl_File_Input_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) FileInputBase orig impl where
  runOp _ _ fileInput = withRef fileInput $ \fileInputPtr -> show' fileInputPtr
{# fun Fl_File_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) FileInputBase orig impl where
  runOp _ _ fileInput rectangle = withRef fileInput $ \fileInputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' fileInputPtr x_pos y_pos w_pos h_pos

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Input"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.FileInput"
-- @

-- $functions
-- @
-- draw :: 'Ref' 'FileInputBase' -> 'IO' ()
--
-- getDownBox :: 'Ref' 'FileInputBase' -> 'IO' ('Boxtype')
--
-- getErrorColor :: 'Ref' 'FileInputBase' -> 'IO' ('Color')
--
-- getValue :: 'Ref' 'FileInputBase' -> 'IO' 'T.Text'
--
-- handle :: 'Ref' 'FileInputBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'FileInputBase' -> 'IO' ()
--
-- resize :: 'Ref' 'FileInputBase' -> 'Rectangle' -> 'IO' ()
--
-- setDownBox :: 'Ref' 'FileInputBase' -> 'Boxtype' -> 'IO' ()
--
-- setErrorColor :: 'Ref' 'FileInputBase' -> 'Color' -> 'IO' ()
--
-- setValue :: 'Ref' 'FileInputBase' -> 'T.Text' -> 'IO' ()
--
-- showWidget :: 'Ref' 'FileInputBase' -> 'IO' ()
-- @
