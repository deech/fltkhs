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
windowHandle win event = withObject win $ \ptr -> windowHandle' (castPtr ptr) event

{# fun unsafe Fl_Window_New_WithLabel as windowNewWithLabel'
       {`Int', `Int', `String'} -> `Ptr ()' id #}

testFinalizer ::  IO ()
testFinalizer = print "Window finalizer called."

windowNewWithLabel :: Int -> Int -> String -> IO (Window ())
windowNewWithLabel w h title = do
  rawPtr <- windowNewWithLabel' w h title
  maybe (error "windowNewWithLabel : object construction returned a null pointer")
        return
        (toObject (castPtr rawPtr))

{# fun unsafe Fl_Window_show as windowShow' {id `Ptr ()'} -> `()' #}
windowShow :: Window a -> IO ()
windowShow window = withObject window $ (\p -> {#call unsafe Fl_Window_show as fl_Window_Show #} p)

{# fun unsafe Fl_Window_set_callback as
              windowSetCallback' {id `Ptr ()' , id `FunPtr CallbackWithUserDataPrim'}
              -> `()' #}
windowSetCallback :: Window a -> Callback -> IO ()
windowSetCallback window callback =
   withObject window $ (\p -> do
                               callbackPtr <- toWidgetCallbackPrim callback
                               windowSetCallback' (castPtr p) callbackPtr)
