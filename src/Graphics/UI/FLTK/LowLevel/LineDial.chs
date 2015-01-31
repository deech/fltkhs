module Graphics.UI.FLTK.LowLevel.LineDial
    (
     -- * Constructor
     lineDialNew
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
#include "Fl_DialC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun Fl_Line_Dial_New as lineDialNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Line_Dial_New_WithLabel as lineDialNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
lineDialNew :: Rectangle -> Maybe String -> IO (Ref LineDial)
lineDialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> lineDialNew' x_pos y_pos width height >>=
                             toRef
        Just l -> lineDialNewWithLabel' x_pos y_pos width height l >>=
                               toRef
-- $functions
-- @
--

-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Dial"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.LineDial"
-- @