{-# LANGUAGE CPP, RankNTypes, UndecidableInstances, GADTs, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Group
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
     -- $functions
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
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Base.Widget
import Control.Exception (finally)

{# fun Fl_Group_set_current as groupSetCurrent' { id `Ptr ()' } -> `()' #}
{# fun Fl_Group_current as groupCurrent' {} -> `Ptr ()' id #}

groupSetCurrent :: (Parent a GroupBase) => Maybe (Ref a) -> IO ()
groupSetCurrent group = withMaybeRef group $ \groupPtr -> groupSetCurrent' groupPtr

groupCurrent :: IO (Maybe (Ref GroupBase))
groupCurrent = groupCurrent' >>= toMaybeRef

{# fun Fl_Group_New as groupNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Group_New_WithLabel as groupNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
groupNew :: Rectangle -> Maybe T.Text -> IO (Ref Group)
groupNew rectangle label' =
  widgetMaker
    rectangle
    label'
    Nothing
    Nothing
    overriddenGroupNew'
    overriddenGroupNewWithLabel'

{# fun Fl_OverriddenGroup_New_WithLabel as overriddenGroupNewWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenGroup_New as overriddenGroupNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
groupCustom :: Rectangle -> Maybe T.Text -> Maybe (Ref Group -> IO ()) -> CustomWidgetFuncs Group -> IO (Ref Group)
groupCustom rectangle l' draw' funcs' =
  widgetMaker rectangle l' draw' (Just funcs') overriddenGroupNew' overriddenGroupNewWithLabel'

{# fun Fl_Group_Destroy as groupDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Destroy ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> groupDestroy' groupPtr


{# fun Fl_Group_draw_child as drawChild' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a WidgetBase, impl ~ (Ref a -> IO ())) => Op (DrawChild ()) GroupBase orig impl where
  runOp _ _ group widget = withRef group $ \groupPtr -> withRef widget $ \widgetPtr -> drawChild' groupPtr widgetPtr

{# fun Fl_Group_draw_children as drawChildren' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (DrawChildren ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> drawChildren' groupPtr

{# fun Fl_Group_draw_outside_label as drawOutsideLabel' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a WidgetBase, impl ~ (Ref a -> IO ())) => Op (DrawOutsideLabel ()) GroupBase orig impl where
  runOp _ _ group widget = withRef group $ \groupPtr -> withRef widget $ \widgetPtr -> drawOutsideLabel' groupPtr widgetPtr

{# fun Fl_Group_update_child as updateChild' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a WidgetBase, impl ~ (Ref a -> IO ())) => Op (UpdateChild ()) GroupBase orig impl where
  runOp _ _ group widget = withRef group $ \groupPtr -> withRef widget $ \widgetPtr -> updateChild' groupPtr widgetPtr

{# fun Fl_Group_begin as begin' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (Begin ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> begin' groupPtr

{# fun Fl_Group_end as end' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (End ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> end' groupPtr

instance (
           Match obj ~ FindOp orig orig (Begin ()),
           Match obj ~ FindOp orig orig (End ()),
           Op (Begin ()) obj orig (IO ()),
           Op (End ()) obj orig (IO ()),
           impl ~ (IO a -> IO a)
         )
         =>
         Op (Within ()) GroupBase orig impl where
  runOp _ _ group action = do
    () <- begin (castTo group :: Ref orig)
    finally action ((end (castTo group :: Ref orig)) :: IO ())

{# fun Fl_Group_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (Parent a WidgetBase, impl ~ (Ref a ->  IO (AtIndex))) => Op (Find ()) GroupBase orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> find' groupPtr wPtr >>= return . AtIndex

{# fun Fl_Group_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Ref a->  IO ())) => Op (Add ()) GroupBase orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> add' groupPtr wPtr

{# fun Fl_Group_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Ref a-> AtIndex ->  IO ())) => Op (Insert ()) GroupBase orig impl where
  runOp _ _ group w (AtIndex i) = withRef group $ \groupPtr -> withRef w $ \wPtr -> insert' groupPtr wPtr i

{# fun Fl_Group_remove_index as removeIndex' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( AtIndex ->  IO ())) => Op (RemoveIndex ()) GroupBase orig impl where
  runOp _ _ group (AtIndex index') = withRef group $ \groupPtr -> removeIndex' groupPtr index'

{# fun Fl_Group_remove_widget as removeWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Ref a ->  IO ())) => Op (RemoveWidget ()) GroupBase orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> removeWidget' groupPtr wPtr

{# fun Fl_Group_clear as clear' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Clear ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> clear' groupPtr

{# fun Fl_Group_set_resizable as setResizable' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Maybe ( Ref a ) -> IO ())) => Op (SetResizable ()) GroupBase orig impl where
  runOp _ _ group o = withRef group $ \groupPtr -> withMaybeRef o $ \oPtr -> setResizable' groupPtr oPtr

instance (impl ~ IO ()) => Op (SetNotResizable ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> setResizable' groupPtr nullPtr

{# fun Fl_Group_resizable as resizable' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref Widget)))) => Op (GetResizable ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> resizable' groupPtr >>= toMaybeRef

{# fun Fl_Group_add_resizable as addResizable' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Ref a ->  IO ())) => Op (AddResizable ()) GroupBase orig impl where
  runOp _ _ group o = withRef group $ \groupPtr -> withRef o $ \oPtr -> addResizable' groupPtr oPtr

{# fun Fl_Group_init_sizes as initSizes' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( IO ())) => Op (InitSizes ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> initSizes' groupPtr

{# fun Fl_Group_children as children' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Children ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> children' groupPtr

{# fun Fl_Group_set_clip_children as setClipChildren' { id `Ptr ()', cFromBool `Bool' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Bool ->  IO ())) => Op (SetClipChildren ()) GroupBase orig impl where
  runOp _ _ group c = withRef group $ \groupPtr -> setClipChildren' groupPtr c

{# fun Fl_Group_clip_children as clipChildren' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (ClipChildren ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> clipChildren' groupPtr

{# fun Fl_Group_focus as focus' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Ref a ->  IO ())) => Op (Focus ()) GroupBase orig impl where
  runOp _ _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> focus' groupPtr wPtr

{# fun Fl_Group__ddfdesign_kludge as ddfdesignKludge' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Maybe (Ref WidgetBase)))) => Op (DdfdesignKludge ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> ddfdesignKludge' groupPtr >>= toMaybeRef

{# fun Fl_Group_insert_with_before as insertWithBefore' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (Parent a WidgetBase, impl ~ (Ref a -> Ref b ->  IO ())) => Op (InsertBefore ()) GroupBase orig impl where
  runOp _ _ self w before = withRef self $ \selfPtr -> withRef w $ \wPtr -> withRef before $ \beforePtr -> insertWithBefore' selfPtr wPtr beforePtr

{# fun Fl_Group_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id#}
instance (impl ~ (IO [Ref WidgetBase])) => Op (GetArray ()) GroupBase orig impl where
  runOp _ _ group = withRef group $ \groupPtr -> do
                    childArrayPtr <- array' groupPtr
                    numChildren <- children group
                    arrayToRefs childArrayPtr numChildren

{# fun Fl_Group_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ (AtIndex ->  IO (Maybe (Ref WidgetBase)))) => Op (GetChild ()) GroupBase orig impl where
  runOp _ _ self (AtIndex n) = withRef self $ \selfPtr -> child' selfPtr n >>= toMaybeRef

{#fun Fl_Group_handle as groupHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) GroupBase orig impl where
  runOp _ _ group event = withRef group (\p -> groupHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent

{# fun Fl_Group_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) GroupBase orig impl where
  runOp _ _ group rectangle = withRef group $ \groupPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' groupPtr x_pos y_pos w_pos h_pos


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
-- @

-- $functions
-- @
-- add:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a-> 'IO' ()
--
-- addResizable:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ()
--
-- begin :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- children :: 'Ref' 'GroupBase' -> 'IO' ('Int')
--
-- clear :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- clipChildren :: 'Ref' 'GroupBase' -> 'IO' ('Bool')
--
-- ddfdesignKludge :: 'Ref' 'GroupBase' -> 'IO' ('Maybe' ('Ref' 'WidgetBase'))
--
-- destroy :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- drawChild:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ()
--
-- drawChildren :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- drawOutsideLabel:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ()
--
-- end :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- find:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ('AtIndex')
--
-- focus:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ()
--
-- getArray :: 'Ref' 'GroupBase' -> 'IO' ['Ref' 'WidgetBase']
--
-- getChild :: 'Ref' 'GroupBase' -> 'AtIndex' -> 'IO' ('Maybe' ('Ref' 'WidgetBase'))
--
-- getResizable :: 'Ref' 'GroupBase' -> 'IO' ('Maybe' ('Ref' 'Widget'))
--
-- handle :: 'Ref' 'GroupBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- initSizes :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- insert:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a-> 'AtIndex' -> 'IO' ()
--
-- insertBefore:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'Ref' b -> 'IO' ()
--
-- removeIndex :: 'Ref' 'GroupBase' -> 'AtIndex' -> 'IO' ()
--
-- removeWidget:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ()
--
-- resize :: 'Ref' 'GroupBase' -> 'Rectangle' -> 'IO' ()
--
-- setClipChildren :: 'Ref' 'GroupBase' -> 'Bool' -> 'IO' ()
--
-- setNotResizable :: 'Ref' 'GroupBase' -> 'IO' ()
--
-- setResizable:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Maybe' ( 'Ref' a ) -> 'IO' ()
--
-- updateChild:: ('Parent' a 'WidgetBase') => 'Ref' 'GroupBase' -> 'Ref' a -> 'IO' ()
--
-- within:: ('Match' obj ~ 'FindOp' orig orig ('Begin' ()), 'Match' obj ~ 'FindOp' orig orig ('End' ()), 'Op' ('Begin' ()) obj orig ('IO' ()), 'Op' ('End' ()) obj orig ('IO' ()),) => 'Ref' 'GroupBase' -> 'IO' a -> 'IO' a
-- @
