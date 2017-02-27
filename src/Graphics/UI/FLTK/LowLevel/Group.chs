{-# LANGUAGE CPP,EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Group
    (
    -- * Constructor
     groupNew,
     groupCustom,
     groupSetCurrent,
     groupCurrent,
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Group functions
     --
     -- $groupfunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_Group_set_current as groupSetCurrent' { id `Ptr ()' } -> `()' #}
{# fun Fl_Group_current as groupCurrent' {} -> `Ptr ()' id #}

groupSetCurrent :: (Parent a Group) => Maybe (Ref a) -> IO ()
groupSetCurrent group = withMaybeRef group $ \groupPtr -> groupSetCurrent' groupPtr

groupCurrent :: IO (Maybe (Ref Group))
groupCurrent = groupCurrent' >>= toMaybeRef

{# fun Fl_Group_New as groupNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Group_New_WithLabel as groupNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
groupNew :: Rectangle -> Maybe T.Text -> IO (Ref Group)
groupNew rectangle label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case label' of
        (Just l') -> groupNewWithLabel' x_pos y_pos width height l' >>= toRef
        Nothing -> groupNew' x_pos y_pos width height >>= toRef

{# fun Fl_OverriddenGroup_New_WithLabel as overriddenGroupNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGroup_New as overriddenGroupNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
groupCustom :: Rectangle -> Maybe T.Text -> Maybe (Ref Group -> IO ()) -> CustomWidgetFuncs Group -> IO (Ref Group)
groupCustom rectangle l' draw' funcs' =
  widgetMaker rectangle l' draw' (Just funcs') overriddenGroupNew' overriddenGroupNewWithLabel'

{# fun Fl_Group_Destroy as groupDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> groupDestroy' groupPtr


{# fun Fl_Group_draw_child as drawChild' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, impl ~ (Ref a -> IO ())) => Op (DrawChild ()) Group orig impl where
  runOp _ _ group widget = withRef group $ \groupPtr -> withRef widget $ \widgetPtr -> drawChild' groupPtr widgetPtr

{# fun Fl_Group_draw_children as drawChildren' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (DrawChildren ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> drawChildren' groupPtr

{# fun Fl_Group_draw_outside_label as drawOutsideLabel' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, impl ~ (Ref a -> IO ())) => Op (DrawOutsideLabel ()) Group orig impl where
  runOp _ _ group widget = withRef group $ \groupPtr -> withRef widget $ \widgetPtr -> drawOutsideLabel' groupPtr widgetPtr

{# fun Fl_Group_update_child as updateChild' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Widget, impl ~ (Ref a -> IO ())) => Op (UpdateChild ()) Group orig impl where
  runOp _ _ group widget = withRef group $ \groupPtr -> withRef widget $ \widgetPtr -> updateChild' groupPtr widgetPtr

{# fun Fl_Group_begin as begin' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Begin ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> begin' groupPtr

{# fun Fl_Group_end as end' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (End ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> end' groupPtr

{# fun Fl_Group_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a Widget, impl ~ (Ref a ->  IO (Int))) => Op (Find ()) Group orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> find' groupPtr wPtr

{# fun Fl_Group_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Ref a->  IO ())) => Op (Add ()) Group orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> add' groupPtr wPtr

{# fun Fl_Group_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Ref a-> Int ->  IO ())) => Op (Insert ()) Group orig impl where
  runOp _ _ group w i = withRef group $ \groupPtr -> withRef w $ \wPtr -> insert' groupPtr wPtr i

{# fun Fl_Group_remove_index as removeIndex' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Int ->  IO ())) => Op (RemoveIndex ()) Group orig impl where
  runOp _ _ group index' = withRef group $ \groupPtr -> removeIndex' groupPtr index'

{# fun Fl_Group_remove_widget as removeWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Ref a ->  IO ())) => Op (RemoveWidget ()) Group orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> removeWidget' groupPtr wPtr

{# fun Fl_Group_clear as clear' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Clear ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> clear' groupPtr

{# fun Fl_Group_set_resizable as setResizable' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Maybe ( Ref a ) -> IO ())) => Op (SetResizable ()) Group orig impl where
  runOp _ _ group o = withRef group $ \groupPtr -> withMaybeRef o $ \oPtr -> setResizable' groupPtr oPtr

instance (impl ~ IO ()) => Op (SetNotResizable ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> setResizable' groupPtr nullPtr

{# fun Fl_Group_resizable as resizable' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Widget)))) => Op (GetResizable ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> resizable' groupPtr >>= toMaybeRef

{# fun Fl_Group_add_resizable as addResizable' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Ref a ->  IO ())) => Op (AddResizable ()) Group orig impl where
  runOp _ _ group o = withRef group $ \groupPtr -> withRef o $ \oPtr -> addResizable' groupPtr oPtr

{# fun Fl_Group_init_sizes as initSizes' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (InitSizes ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> initSizes' groupPtr

{# fun Fl_Group_children as children' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Children ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> children' groupPtr

{# fun Fl_Group_set_clip_children as setClipChildren' { id `Ptr ()', cFromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetClipChildren ()) Group orig impl where
  runOp _ _ group c = withRef group $ \groupPtr -> setClipChildren' groupPtr c

{# fun Fl_Group_clip_children as clipChildren' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (ClipChildren ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> clipChildren' groupPtr

{# fun Fl_Group_focus as focus' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Ref a ->  IO ())) => Op (Focus ()) Group orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> focus' groupPtr wPtr

{# fun Fl_Group__ddfdesign_kludge as ddfdesignKludge' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref Widget)))) => Op (DdfdesignKludge ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> ddfdesignKludge' groupPtr >>= toMaybeRef

{# fun Fl_Group_insert_with_before as insertWithBefore' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a Widget, impl ~ (Ref a -> Ref b ->  IO ())) => Op (InsertWithBefore ()) Group orig impl where
  runOp _ _ self w before = withRef self $ \selfPtr -> withRef w $ \wPtr -> withRef before $ \beforePtr -> insertWithBefore' selfPtr wPtr beforePtr

{# fun Fl_Group_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id#}
instance (impl ~ (IO [Ref Widget])) => Op (GetArray ()) Group orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> do
                    childArrayPtr <- array' groupPtr
                    numChildren <- children group
                    arrayToRefs childArrayPtr numChildren

{# fun Fl_Group_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ (Int ->  IO (Maybe (Ref Widget)))) => Op (GetChild ()) Group orig impl where
  runOp _ _ self n = withRef self $ \selfPtr -> child' selfPtr n >>= toMaybeRef

-- $groupfunctions
-- @
-- add:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a-> 'IO' ()
--
-- addResizable:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ()
--
-- begin :: 'Ref' 'Group' -> 'IO' ()
--
-- children :: 'Ref' 'Group' -> 'IO' ('Int')
--
-- clear :: 'Ref' 'Group' -> 'IO' ()
--
-- clipChildren :: 'Ref' 'Group' -> 'IO' ('Bool')
--
-- ddfdesignKludge :: 'Ref' 'Group' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- destroy :: 'Ref' 'Group' -> 'IO' ()
--
-- drawChild:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ()
--
-- drawChildren :: 'Ref' 'Group' -> 'IO' ()
--
-- drawOutsideLabel:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ()
--
-- end :: 'Ref' 'Group' -> 'IO' ()
--
-- find:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ('Int')
--
-- focus:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ()
--
-- getArray :: 'Ref' 'Group' -> 'IO' ['Ref' 'Widget']
--
-- getChild :: 'Ref' 'Group' -> 'Int' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- getResizable :: 'Ref' 'Group' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- initSizes :: 'Ref' 'Group' -> 'IO' ()
--
-- insert:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a-> 'Int' -> 'IO' ()
--
-- insertWithBefore:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'Ref' b -> 'IO' ()
--
-- removeIndex :: 'Ref' 'Group' -> 'Int' -> 'IO' ()
--
-- removeWidget:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ()
--
-- setClipChildren :: 'Ref' 'Group' -> 'Bool' -> 'IO' ()
--
-- setNotResizable :: 'Ref' 'Group' -> 'IO' ()
--
-- setResizable:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Maybe' ( 'Ref' a ) -> 'IO' ()
--
-- updateChild:: ('Parent' a 'Widget') => 'Ref' 'Group' -> 'Ref' a -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
-- @
