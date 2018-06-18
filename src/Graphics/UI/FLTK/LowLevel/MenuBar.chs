{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MenuBar
    (
     menuBarNew,
     menuBarCustom
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
#include "Fl_Menu_BarC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_OverriddenMenu_Bar_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenMenu_Bar_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
menuBarCustom ::
       Rectangle                         -- ^ The bounds of this MenuBar
    -> Maybe T.Text                      -- ^ The MenuBar label
    -> Maybe (Ref MenuBar -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs MenuBar)      -- ^ Optional custom widget functions
    -> IO (Ref MenuBar)
menuBarCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Menu_Bar_New as widgetNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Menu_Bar_New_WithLabel as widgetNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
menuBarNew :: Rectangle -> Maybe T.Text -> IO (Ref MenuBar)
menuBarNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Menu_Bar_Destroy as widgetDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) MenuBar orig impl where
  runOp _ _ menuBar = swapRef menuBar $
                          \menuBarPtr ->
                             widgetDestroy' menuBarPtr >>
                             return nullPtr
{# fun Fl_Menu_Bar_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> draw'' menuBarPtr
{# fun Fl_Menu_Bar_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> drawSuper' menuBarPtr
{#fun Fl_Menu_Bar_handle as menuBarHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) MenuBar orig impl where
  runOp _ _ menuBar event = withRef menuBar (\p -> menuBarHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Menu_Bar_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) MenuBar orig impl where
  runOp _ _ menuBar event = withRef menuBar $ \menuBarPtr -> handleSuper' menuBarPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Menu_Bar_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) MenuBar orig impl where
  runOp _ _ menuBar rectangle = withRef menuBar $ \menuBarPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' menuBarPtr x_pos y_pos w_pos h_pos
{# fun Fl_Menu_Bar_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) MenuBar orig impl where
  runOp _ _ menuBar rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef menuBar $ \menuBarPtr -> resizeSuper' menuBarPtr x_pos y_pos width height
{# fun Fl_Menu_Bar_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> hide' menuBarPtr
{# fun Fl_Menu_Bar_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> hideSuper' menuBarPtr
{# fun Fl_Menu_Bar_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> show' menuBarPtr
{# fun Fl_Menu_Bar_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) MenuBar orig impl where
  runOp _ _ menuBar = withRef menuBar $ \menuBarPtr -> showSuper' menuBarPtr

-- $functions
--
-- @
-- destroy :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- draw :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- drawSuper :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- handle :: 'Ref' 'MenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'MenuBar' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- hideSuper :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- resize :: 'Ref' 'MenuBar' -> 'Rectangle' -> 'IO' ()
--
-- resizeSuper :: 'Ref' 'MenuBar' -> 'Rectangle' -> 'IO' ()
--
-- showWidget :: 'Ref' 'MenuBar' -> 'IO' ()
--
-- showWidgetSuper :: 'Ref' 'MenuBar' -> 'IO' ()
-- @

-- $hierarchy
--
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuPrim"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.MenuBar"
--
-- @
