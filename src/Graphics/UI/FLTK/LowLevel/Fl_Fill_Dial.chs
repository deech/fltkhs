module Graphics.UI.FLTK.LowLevel.Fl_Fill_Dial
    (
     -- * Constructor
     fillDialNew
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

{# fun Fl_Fill_Dial_New as fillDialNew' { `Int',`Int',`Int',`Int', `String' } -> `Ptr ()' id #}
fillDialNew :: Rectangle -> String -> IO (Ref FillDial)
fillDialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in
    fillDialNew' x_pos y_pos width height l' >>= toRef
