{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Tabs
    (
     tabsNew,
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
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

data TabsHeightOffset = TabsAtTop (Maybe Int) | TabsAtBottom (Maybe Int)

{# fun Fl_Tabs_New as tabsNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Tabs_New_WithLabel as tabsNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String'} -> `Ptr ()' id #}
tabsNew :: Rectangle -> Maybe String -> IO (Ref Tabs)
tabsNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> tabsNew' x_pos y_pos width height >>= toRef
        Just l -> tabsNewWithLabel' x_pos y_pos width height l >>= toRef

{# fun Fl_Tabs_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Tabs orig impl where
  runOp _ _ tabs event = withRef tabs (\p -> handle' p (fromIntegral . fromEnum $ event))

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
-- handle :: 'Ref' 'Tabs' -> 'Event' -> 'IO' 'Int'
--
-- setPush:: ('Parent' a 'Widget') => 'Ref' 'Tabs' -> 'Maybe' ( 'Ref' a ) -> 'IO' ('Either' 'NoChange' ())
--
-- setValue:: ('Parent' a 'Widget') => 'Ref' 'Tabs' -> 'Maybe' ( 'Ref' a ) -> 'IO' ('Either' 'NoChange' ())
--
-- which :: 'Ref' 'Tabs' -> 'Position' -> 'IO' ('Maybe' ('Ref' 'Widget'))
-- @
