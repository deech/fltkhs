{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tabs
    (
     tabsNew,
     tabsCustom,
     TabsHeightOffset(..)
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
#include "Fl_TabsC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Widget
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Hierarchy

data TabsHeightOffset = TabsAtTop (Maybe Int) | TabsAtBottom (Maybe Int)

{# fun Fl_OverriddenTabs_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenTabs_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
tabsCustom ::
       Rectangle                         -- ^ The bounds of this Tabs
    -> Maybe T.Text                      -- ^ The Tabs label
    -> Maybe (Ref Tabs -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Tabs)      -- ^ Optional custom widget functions
    -> IO (Ref Tabs)
tabsCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'


{# fun Fl_Tabs_New as tabsNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Tabs_New_WithLabel as tabsNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
tabsNew :: Rectangle -> Maybe T.Text -> IO (Ref Tabs)
tabsNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> tabsNew' x_pos y_pos width height >>= toRef
        Just l -> tabsNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Tabs_value as value' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref Widget)))) => Op (GetValue ()) Tabs orig impl where
   runOp _ _ tabs = withRef tabs $ \tabsPtr -> value' tabsPtr >>= toMaybeRef

{# fun Fl_Tabs_set_value as setValue' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Maybe ( Ref a ) ->  IO (Either NoChange ()))) => Op (SetValue ()) Tabs orig impl where
   runOp _ _ tabs w = withRef tabs $ \tabsPtr -> withMaybeRef w $ \wPtr -> setValue' tabsPtr wPtr >>= return . successOrNoChange

{# fun Fl_Tabs_push as push' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref Widget)))) => Op (GetPush ()) Tabs orig impl where
   runOp _ _ tabs = withRef tabs $ \tabsPtr -> push' tabsPtr >>= toMaybeRef

{# fun Fl_Tabs_set_push as setPush' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Maybe ( Ref a ) ->  IO (Either NoChange ()))) => Op (SetPush ()) Tabs orig impl where
   runOp _ _ tabs w = withRef tabs $ \tabsPtr -> withMaybeRef w $ \wPtr -> setPush' tabsPtr wPtr >>= return . successOrNoChange

{# fun Fl_Tabs_which as which' { id `Ptr ()',`Int',`Int' } -> `Ptr ()' id #}
instance (impl ~ (Position -> IO (Maybe (Ref Widget)))) => Op (Which ()) Tabs orig impl where
   runOp _ _ tabs (Position (X event_x) (Y event_y)) = withRef tabs $ \tabsPtr -> which' tabsPtr event_x event_y >>= toMaybeRef

{# fun Fl_Tabs_client_area_with_tabh as clientAreaWithTabh' { id `Ptr ()', alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*,alloca- `Int' peekIntConv*, `Int'} -> `()' #}
instance (impl ~ (TabsHeightOffset -> IO Rectangle)) => Op (ClientArea ()) Tabs orig impl where
   runOp _ _ tabs tabh =
     withRef tabs $ \tabsPtr ->
     case tabh of
       TabsAtTop Nothing -> clientAreaWithTabh' tabsPtr 0 >>= return . toRectangle
       TabsAtTop (Just o) -> clientAreaWithTabh' tabsPtr o >>= return . toRectangle
       TabsAtBottom Nothing -> clientAreaWithTabh' tabsPtr (-1) >>= return . toRectangle
       TabsAtBottom (Just o) -> clientAreaWithTabh' tabsPtr (0 - o) >>= return . toRectangle

{# fun Fl_Tabs_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> draw'' tabsPtr
{# fun Fl_Tabs_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (DrawSuper ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> drawSuper' tabsPtr
{#fun Fl_Tabs_handle as tabsHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Tabs orig impl where
  runOp _ _ tabs event = withRef tabs (\p -> tabsHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Tabs_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Tabs orig impl where
  runOp _ _ tabs event = withRef tabs $ \tabsPtr -> handleSuper' tabsPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Tabs_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) Tabs orig impl where
  runOp _ _ tabs rectangle = withRef tabs $ \tabsPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' tabsPtr x_pos y_pos w_pos h_pos
{# fun Fl_Tabs_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (ResizeSuper ()) Tabs orig impl where
  runOp _ _ tabs rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef tabs $ \tabsPtr -> resizeSuper' tabsPtr x_pos y_pos width height
{# fun Fl_Tabs_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> hide' tabsPtr
{# fun Fl_Tabs_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (HideSuper ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> hideSuper' tabsPtr
{# fun Fl_Tabs_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> show' tabsPtr
{# fun Fl_Tabs_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (ShowWidgetSuper ()) Tabs orig impl where
  runOp _ _ tabs = withRef tabs $ \tabsPtr -> showSuper' tabsPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Tabs"
-- @

-- $functions
-- @
-- clientArea :: 'Ref' 'Tabs' -> 'TabsHeightOffset' -> 'IO' 'Rectangle'
--
-- getPush :: 'Ref' 'Tabs' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- getValue :: 'Ref' 'Tabs' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- handle :: 'Ref' 'Tabs' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- setPush:: ('Parent' a 'Widget') => 'Ref' 'Tabs' -> 'Maybe' ( 'Ref' a ) -> 'IO' ('Either' 'NoChange' ())
--
-- setValue:: ('Parent' a 'Widget') => 'Ref' 'Tabs' -> 'Maybe' ( 'Ref' a ) -> 'IO' ('Either' 'NoChange' ())
--
-- which :: 'Ref' 'Tabs' -> 'Position' -> 'IO' ('Maybe' ('Ref' 'Widget'))
-- @
