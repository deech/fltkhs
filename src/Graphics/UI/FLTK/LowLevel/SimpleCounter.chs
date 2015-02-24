module Graphics.UI.FLTK.LowLevel.SimpleCounter
    (
     -- * Constructor
     simpleCounterNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_CounterC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Simple_Counter_New as simpleCounterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Simple_Counter_New_WithLabel as simpleCounterNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `String'} -> `Ptr ()' id #}
simpleCounterNew :: Rectangle -> Maybe String -> IO (Ref SimpleCounter)
simpleCounterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> simpleCounterNew' x_pos y_pos width height >>=
                             toRef
        Just l -> simpleCounterNewWithLabel' x_pos y_pos width height l >>=
                               toRef


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Counter"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.SimpleCounter"
-- @