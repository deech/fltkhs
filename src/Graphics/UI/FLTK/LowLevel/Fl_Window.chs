{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Window where
#include "Fl_C.h"
#include "Fl_WindowC.h"
import Foreign.Concurrent
import Foreign    
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils

{# fun unsafe Fl_Window_handle as windowHandle'
       {id `Ptr ()', cFromEnum `Event'} -> `Bool' cToBool #}
windowHandle :: WindowPtr -> Event -> IO Bool
windowHandle windowPtr event =
    withForeignPtr windowPtr
           (\p -> (windowHandle' (castPtr p) event))

{# fun unsafe Fl_Window_New_WithLabel as windowNewWithLabel'
       {`Int', `Int', `String'} -> `Ptr ()' id #}

testFinalizer ::  IO ()
testFinalizer = print "Window finalizer called."

windowNewWithLabel :: Int -> Int -> String -> IO WindowPtr
windowNewWithLabel w h title = do
  rawPtr <- windowNewWithLabel' w h title
  Foreign.Concurrent.newForeignPtr (castPtr rawPtr) testFinalizer

{# fun unsafe Fl_Window_show as windowShow' {id `Ptr ()'} -> `()' #}
windowShow :: WindowPtr -> IO ()
windowShow windowPtr = withForeignPtr windowPtr (\p -> windowShow' (castPtr p))

{# fun unsafe Fl_Window_set_callback as
              windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackPrim'}
              -> `()' #}

windowSetCallback :: WindowPtr -> IO () -> IO ()
windowSetCallback windowPtr callback =
    withForeignPtr windowPtr (\w -> do
                                  callbackPtr <- mkCallbackPtr callback
                                  windowSetCallback' (castPtr w) (castFunPtr callbackPtr))
