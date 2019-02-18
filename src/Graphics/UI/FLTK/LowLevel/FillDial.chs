module Graphics.UI.FLTK.LowLevel.FillDial
    (
     -- * Constructor
     fillDialNew
     -- * Hierarchy
     --
     -- $hierarchy
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_DialC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget
{# fun Fl_Fill_Dial_New as fillDialNew' { `Int',`Int',`Int',`Int', `CString' } -> `Ptr ()' id #}
fillDialNew :: Rectangle -> T.Text -> IO (Ref FillDial)
fillDialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in do
    ref <- copyTextToCString l' >>= \l'' -> fillDialNew' x_pos y_pos width height l'' >>= toRef
    setFlag ref WidgetFlagCopiedLabel
    setFlag ref WidgetFlagCopiedTooltip
    return ref


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
-- "Graphics.UI.FLTK.LowLevel.FillDial"
-- @
