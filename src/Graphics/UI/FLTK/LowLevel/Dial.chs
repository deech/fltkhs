{-# LANGUAGE TypeFamilies,CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Dial
    (
     -- * Constructor
     dialNew
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Dial functions
     --
     -- $Dialfunctions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_DialC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Dial_New as dialNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Dial_New_WithLabel as dialNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
dialNew :: Rectangle -> Maybe String -> IO (Ref Dial)
dialNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> dialNew' x_pos y_pos width height >>=
                             toRef
        Just l -> dialNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Dial_Destroy as dialDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Dial orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    dialDestroy' winPtr
    return nullPtr

{# fun unsafe Fl_Dial_set_angle1 as setAngle1' { id `Ptr ()',id `CShort' } -> `()' #}
instance (impl ~ ( Angle -> IO ())) => Op (SetAngle1 ()) Dial orig impl where
  runOp _ _ dial (Angle a) = withRef dial $ \dialPtr -> setAngle1' dialPtr a
{# fun unsafe Fl_Dial_set_angle2 as setAngle2' { id `Ptr ()',id `CShort' } -> `()' #}
instance (impl ~ ( Angle -> IO ())) => Op (SetAngle2 ()) Dial orig impl where
  runOp _ _ dial (Angle a) = withRef dial $ \dialPtr -> setAngle2' dialPtr a
{# fun unsafe Fl_Dial_angle1 as angle1' { id `Ptr ()' } -> `CShort' id #}
instance (impl ~ ( IO (Angle))) => Op (GetAngle1 ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> angle1' dialPtr >>= return . Angle
{# fun unsafe Fl_Dial_angle2 as angle2' { id `Ptr ()' } -> `CShort' id #}
instance (impl ~ ( IO (Angle))) => Op (GetAngle2 ()) Dial orig impl where
  runOp _ _ dial = withRef dial $ \dialPtr -> angle2' dialPtr >>= return . Angle
{#fun Fl_Dial_handle as dialHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Dial orig impl where
  runOp _ _ dial event = withRef dial (\p -> dialHandle' p (fromIntegral . fromEnum $ event))
instance (impl ~ ( Angle -> Angle -> IO ())) => Op (SetAngles ()) Dial orig impl where
  runOp _ _ dial a1' a2' = do
    setAngle1 dial a1'
    setAngle2 dial a2'

-- $Dialfunctions
--
-- @
-- destroy :: 'Ref' 'Dial' -> 'IO' ()
--
-- getAngle1 :: 'Ref' 'Dial' -> 'IO' 'Angle'
--
-- getAngle2 :: 'Ref' 'Dial' -> 'IO' 'Angle'
--
-- handle :: 'Ref' 'Dial' -> 'Event' -> 'IO' 'Int'
--
-- setAngle1 :: 'Ref' 'Dial' -> 'Angle' -> 'IO' ()
--
-- setAngle2 :: 'Ref' 'Dial' -> 'Angle' -> 'IO' ()
--
-- setAngles :: 'Ref' 'Dial' -> 'Angle' -> 'Angle' -> 'IO' ()
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
-- @