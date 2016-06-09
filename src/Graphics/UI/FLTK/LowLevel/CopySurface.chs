{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.CopySurface
       (
         copySurfaceNew
         -- * Hierarchy
         --
         -- $hierarchy

         -- * CopySurface
         --
         -- $CopySurfacefunctions
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Copy_SurfaceC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch

{# fun Fl_Copy_Surface_New as copySurfaceNew' {`Int', `Int'} -> `Ptr ()' id #}
copySurfaceNew :: Size -> IO (Ref CopySurface)
copySurfaceNew (Size (Width w') (Height h')) = copySurfaceNew' w' h' >>= toRef

{# fun Fl_Copy_Surface_Destroy as copySurfaceDestroy' {id `Ptr ()'} -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) CopySurface orig impl where
  runOp _ _ copy_surface = withRef copy_surface $ \copy_surfacePtr -> copySurfaceDestroy' copy_surfacePtr

{# fun Fl_Copy_Surface_class_name as className' { id `Ptr () ' } -> `String' unsafeFromCString #}
instance (impl ~ (IO (String))) => Op (ClassName ()) Image orig impl where
  runOp _ _ copy_surface = withRef copy_surface $ \copy_surfacePtr -> className' copy_surfacePtr

{# fun Fl_Copy_Surface_set_current as setCurrent' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (SetCurrent ()) CopySurface orig impl where
  runOp _ _ copy_surface = withRef copy_surface $ \copy_surfacePtr -> setCurrent' copy_surfacePtr

{# fun Fl_Copy_Surface_draw as draw' { id `Ptr ()',id `Ptr ()',`Int',`Int' } -> `()' #}
instance (Parent a Widget, impl ~ ( Ref a  -> Position -> IO ())) => Op (Draw ()) CopySurface orig impl where
  runOp _ _ copy_surface widget (Position (X delta_x) (Y delta_y)) = withRef copy_surface $ \copy_surfacePtr -> withRef widget $ \widgetPtr -> draw' copy_surfacePtr widgetPtr delta_x delta_y

{# fun Fl_Copy_Surface_draw_decorated_window as drawDecoratedWindow' { id `Ptr ()',id `Ptr ()',`Int',`Int' } -> `()' #}
instance (Parent a Window, impl ~ ( Ref a  -> Position -> IO ())) => Op (DrawDecoratedWindow ()) CopySurface orig impl where
  runOp _ _ copy_surface window (Position (X delta_x) (Y delta_y)) = withRef copy_surface $ \copy_surfacePtr -> withRef window $ \windowPtr -> drawDecoratedWindow' copy_surfacePtr windowPtr delta_x delta_y

{#fun Fl_Copy_Surface_w as w' {id `Ptr ()' } -> `Int' #}
instance (impl ~ IO Int) => Op (GetW ()) CopySurface orig impl where
  runOp _ _ copy_surface = withRef copy_surface $ \copy_surfacePtr -> w' copy_surfacePtr

{#fun Fl_Copy_Surface_h as h' {id `Ptr ()' } -> `Int' #}
instance (impl ~ IO Int) => Op (GetH ()) CopySurface orig impl where
  runOp _ _ copy_surface = withRef copy_surface $ \copy_surfacePtr -> h' copy_surfacePtr


-- $CopySurfacefunctions
--
-- @
-- className :: 'Ref' 'Image' -> 'IO' ('String')
--
-- destroy :: 'Ref' 'CopySurface' -> 'IO' ()
--
-- draw:: ('Parent' a 'Widget') => 'Ref' 'CopySurface' -> 'Ref' a -> 'Position' -> 'IO' ()
--
-- drawDecoratedWindow:: ('Parent' a 'Window') => 'Ref' 'CopySurface' -> 'Ref' a -> 'Position' -> 'IO' ()
--
-- getH :: 'Ref' 'CopySurface' -> 'IO' 'Int'
--
-- getW :: 'Ref' 'CopySurface' -> 'IO' 'Int'
--
-- setCurrent :: 'Ref' 'CopySurface' -> 'IO' ()
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.CopySurface"
-- @
