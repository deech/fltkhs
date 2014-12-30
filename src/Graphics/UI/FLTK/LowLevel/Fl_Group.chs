{-# LANGUAGE CPP, EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Group
    (
     groupNew
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_WidgetC.h"
#include "Fl_GroupC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Group_New as groupNew' {  `Int',`Int', `Int', `Int'} -> `Ptr ()' id #}
{# fun Fl_Group_New_WithLabel as groupNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
groupNew :: Rectangle -> Maybe String -> IO (Ref Group)
groupNew rectangle label' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case label' of
        (Just l') -> groupNewWithLabel' x_pos y_pos width height l' >>= toRef
        Nothing -> groupNew' x_pos y_pos width height >>= toRef

{# fun Fl_Group_Destroy as groupDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Destroy ()) Group (IO ()) where
  runOp _ group = withRef group $ \groupPtr -> groupDestroy' groupPtr

{# fun Fl_Group_begin as begin' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Begin ()) Group (IO (())) where
  runOp _ group = withRef group $ \groupPtr -> begin' groupPtr

{# fun Fl_Group_end as end' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (End ()) Group ( IO (())) where
  runOp _ group = withRef group $ \groupPtr -> end' groupPtr

{# fun Fl_Group_find as find' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
instance (FindObj a Widget Same) => Op (Find ()) Group (Ref a->  IO (Int)) where
  runOp _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> find' groupPtr wPtr

{# fun Fl_Group_add as add' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same) => Op (Add ()) Group (Ref a->  IO (())) where
  runOp _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> add' groupPtr wPtr

{# fun Fl_Group_insert as insert' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same) => Op (Insert ()) Group (Ref a-> Int ->  IO (())) where
  runOp _ group w i = withRef group $ \groupPtr -> withRef w $ \wPtr -> insert' groupPtr wPtr i

{# fun Fl_Group_remove_index as removeIndex' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance Op (RemoveIndex ()) Group (Int ->  IO (())) where
  runOp _ group index' = withRef group $ \groupPtr -> removeIndex' groupPtr index'

{# fun Fl_Group_remove_widget as removeWidget' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same) => Op (RemoveWidget ()) Group (Ref a->  IO (())) where
  runOp _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> removeWidget' groupPtr wPtr

{# fun Fl_Group_clear as clear' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (Clear ()) Group ( IO (())) where
  runOp _ group = withRef group $ \groupPtr -> clear' groupPtr

{# fun Fl_Group_set_resizable as setResizable' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same) => Op (SetResizable ()) Group (Ref a ->  IO (())) where
  runOp _ group o = withRef group $ \groupPtr -> withRef o $ \oPtr -> setResizable' groupPtr oPtr

{# fun Fl_Group_resizable as resizable' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (GetResizable ()) Group (  IO (Ref Widget)) where
  runOp _ group = withRef group $ \groupPtr -> resizable' groupPtr >>= toRef

{# fun Fl_Group_add_resizable as addResizable' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same) => Op (AddResizable ()) Group (Ref a ->  IO (())) where
  runOp _ group o = withRef group $ \groupPtr -> withRef o $ \oPtr -> addResizable' groupPtr oPtr

{# fun Fl_Group_init_sizes as initSizes' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance Op (InitSizes ()) Group (  IO (())) where
  runOp _ group = withRef group $ \groupPtr -> initSizes' groupPtr

{# fun Fl_Group_children as children' { id `Ptr ()' } -> `Int' #}
instance Op (Children ()) Group (  IO (Int)) where
  runOp _ group = withRef group $ \groupPtr -> children' groupPtr

{# fun Fl_Group_set_clip_children as setClipChildren' { id `Ptr ()',`Int' } -> `()' supressWarningAboutRes #}
instance Op (SetClipChildren ()) Group ( Int ->  IO (())) where
  runOp _ group c = withRef group $ \groupPtr -> setClipChildren' groupPtr c

{# fun Fl_Group_clip_children as clipChildren' { id `Ptr ()' } -> `Int' #}
instance Op (ClipChildren ()) Group (  IO (Int)) where
  runOp _ group = withRef group $ \groupPtr -> clipChildren' groupPtr

{# fun Fl_Group_focus as focus' { id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same) => Op (Focus ()) Group (Ref a ->  IO (())) where
  runOp _ group w = withRef group $ \groupPtr -> withRef w $ \wPtr -> focus' groupPtr wPtr

{# fun Fl_Group__ddfdesign_kludge as ddfdesignKludge' { id `Ptr ()' } -> `Ptr ()' id #}
instance Op (DdfdesignKludge ()) Group (  IO (Ref Widget)) where
  runOp _ group = withRef group $ \groupPtr -> ddfdesignKludge' groupPtr >>= toRef

{# fun Fl_Group_insert_with_before as insertWithBefore' { id `Ptr ()',id `Ptr ()',id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (FindObj a Widget Same, FindObj b Widget Same) => Op (InsertWithBefore ()) Group (Ref a -> Ref b ->  IO (())) where
  runOp _ self w before = withRef self $ \selfPtr -> withRef w $ \wPtr -> withRef before $ \beforePtr -> insertWithBefore' selfPtr wPtr beforePtr

{# fun Fl_Group_array as array' { id `Ptr ()' } -> `Ptr (Ptr ())' id#}
instance Op (GetArray ()) Group (IO [Ref Widget]) where
  runOp _ group = withRef group $ \groupPtr -> do
                    childArrayPtr <- array' groupPtr
                    numChildren <- children group
                    arrayToRefs childArrayPtr numChildren

{# fun Fl_Group_child as child' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance Op (GetChild ()) Group ( Int ->  IO (Ref Widget)) where
  runOp _ self n = withRef self $ \selfPtr -> child' selfPtr n >>= toRef
