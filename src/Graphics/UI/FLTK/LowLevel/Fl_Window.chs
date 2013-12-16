{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Window where
#include "Fl_C.h"
#include "Fl_WindowC.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils

{# fun unsafe Fl_Window_handle as windowHandle'
       {id `Ptr ()', cFromEnum `Event'} -> `Bool' cToBool #}
windowHandle :: Window a -> Event -> IO Bool
windowHandle win event = withWidget win $ \ptr -> windowHandle' (castPtr ptr) event

{# fun unsafe Fl_Window_New_WithLabel as windowNewWithLabel'
       {`Int', `Int', `String'} -> `Ptr ()' id #}

testFinalizer ::  IO ()
testFinalizer = print "Window finalizer called."

windowNewWithLabel :: Int -> Int -> String -> IO (Window ())
windowNewWithLabel w h title = do
  rawPtr <- windowNewWithLabel' w h title
  return $ toWidget (castPtr rawPtr)

{# fun unsafe Fl_Window_show as windowShow' {id `Ptr ()'} -> `()' #}
windowShow :: Window a -> IO ()
windowShow window = withWidget window $ (\p -> {#call unsafe Fl_Window_show as fl_Window_Show #} p)

{# fun unsafe Fl_Window_set_callback as
              windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackPrim'}
              -> `()' #}

windowSetCallback :: Window a -> IO () -> IO ()
windowSetCallback window callback =
   withWidget window $ (\p -> do
                               callbackPtr <- mkCallbackPtr callback
                               windowSetCallback' (castPtr p) (castFunPtr callbackPtr))
