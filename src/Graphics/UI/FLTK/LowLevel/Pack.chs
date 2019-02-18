{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Pack
  (
    PackType(..),
    packNew,
    packCustom
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
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
{# fun Fl_OverriddenPack_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenPack_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
packCustom ::
       Rectangle                         -- ^ The bounds of this Pack
    -> Maybe T.Text                      -- ^ The Pack label
    -> Maybe (Ref Pack -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Pack)      -- ^ Optional custom widget functions
    -> IO (Ref Pack)
packCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Pack_New as packNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Pack_New_WithLabel as packNewWithLabel' { `Int',`Int',`Int',`Int', `CString'} -> `Ptr ()' id #}
packNew :: Rectangle -> Maybe T.Text -> IO (Ref Pack)
packNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Pack_get_spacing as getSpacing' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetSpacing ()) Pack orig impl where
   runOp _ _ p = withRef p $ \pPtr -> getSpacing' pPtr
{# fun Fl_Pack_set_spacing as setSpacing' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetSpacing ()) Pack orig impl where
   runOp _ _ p pixels = withRef p $ \pPtr -> setSpacing' pPtr pixels
{# fun Fl_Pack_horizontal as horizontal' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO Bool)) => Op (IsHorizontal ()) Pack orig impl where
   runOp _ _ p = withRef p $ \pPtr -> do
     orientation <- horizontal' pPtr >>= return . cToEnum
     case orientation of
       PackHorizontal -> return True
       _  -> return False
{# fun Fl_Pack_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ ( IO (PackType))) => Op (GetType_ ()) Pack orig impl where
   runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . cToEnum
{# fun Fl_Pack_set_type as setType' { id `Ptr ()',`Word8' } -> `()' #}
instance (impl ~ (PackType ->  IO ())) => Op (SetType ()) Pack orig impl where
   runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (cFromEnum t)
{# fun Fl_Pack_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Pack orig impl where
  runOp _ _ pack = withRef pack $ \packPtr -> draw'' packPtr
{# fun Fl_Pack_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Pack orig impl where
  runOp _ _ pack = withRef pack $ \packPtr -> drawSuper' packPtr
{#fun Fl_Pack_handle as packHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Pack orig impl where
  runOp _ _ pack event = withRef pack (\p -> packHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Pack_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Pack orig impl where
  runOp _ _ pack event = withRef pack $ \packPtr -> handleSuper' packPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Pack_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Pack orig impl where
  runOp _ _ pack rectangle = withRef pack $ \packPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' packPtr x_pos y_pos w_pos h_pos
{# fun Fl_Pack_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Pack orig impl where
  runOp _ _ pack rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef pack $ \packPtr -> resizeSuper' packPtr x_pos y_pos width height
{# fun Fl_Pack_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Pack orig impl where
  runOp _ _ pack = withRef pack $ \packPtr -> hide' packPtr
{# fun Fl_Pack_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Pack orig impl where
  runOp _ _ pack = withRef pack $ \packPtr -> hideSuper' packPtr
{# fun Fl_Pack_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Pack orig impl where
  runOp _ _ pack = withRef pack $ \packPtr -> show' packPtr
{# fun Fl_Pack_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Pack orig impl where
  runOp _ _ pack = withRef pack $ \packPtr -> showSuper' packPtr
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
-- draw :: 'Ref' 'Pack' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'Pack' -> 'IO' ()
--
-- getSpacing :: 'Ref' 'Pack' -> 'IO' ('Int')
--
-- getType_ :: 'Ref' 'Pack' -> 'IO' ('PackType')
--
-- handle :: 'Ref' 'Pack' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Pack' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Pack' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'Pack' -> 'IO' ()
--
-- isHorizontal :: 'Ref' 'Pack' -> 'IO' 'Bool'
--
-- resize :: 'Ref' 'Pack' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'Pack' -> 'Rectangle' -> 'IO' ()
--
-- setSpacing :: 'Ref' 'Pack' -> 'Int' -> 'IO' ()
--
-- setType :: 'Ref' 'Pack' -> 'PackType' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Pack' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'Pack' -> 'IO' ()
-- @
