{-# LANGUAGE CPP, FlexibleContexts #-}

module Graphics.UI.FLTK.LowLevel.X (flcOpenDisplay, flcXid, openCallback) where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Utils
import Foreign.Ptr
import qualified Data.Text as T
#include "Fl_C.h"
#include "xC.h"

{# fun flc_open_display as flcOpenDisplay {} -> `()' #}

{# fun flc_xid as flcXid' {`Ptr ()'} -> `Ptr ()' #}
flcXid :: (Parent a WindowBase) => Ref a -> IO (Maybe WindowHandle)
flcXid win =
  withRef
    win
    (
      \winPtr -> do
         res <- flcXid' winPtr
         if (res == nullPtr)
         then return Nothing
         else return (Just (WindowHandle res))
    )

{# fun flc_open_callback as openCallback' { id `FunPtr OpenCallbackPrim' } -> `()' #}

openCallback :: Maybe OpenCallback -> IO ()
openCallback Nothing   = openCallback' nullFunPtr
openCallback (Just cb) = do
  ptr <- mkOpenCallbackPtr $ \cstr -> do
    txt <- cStringToText cstr
    cb txt
  openCallback' ptr
