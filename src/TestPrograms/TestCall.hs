module Main where
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Foreign.C.Types

callback ::  (Show a) => a -> IO ()
callback a = print a

addWindow :: IO WindowPtr
addWindow = do
  window <- windowNewWithLabel 100 100 "Test"
  windowSetCallback window (callback "window's callback data")
  windowShow window
  return window

addAwakeHandler :: IO Int
addAwakeHandler = flAddAwakeHandler (callback "awake handler's callback data")

runAwakeHandler :: IO ()
runAwakeHandler = do
  awakeHandler <- flGetAwakeHandler_
  awakeHandler

eventIntercept :: Event -> WindowPtr -> IO CInt
eventIntercept e _ =
    case e of
      NoEvent                    -> do { putStrLn "NoEvent"; return 0; }
      Push                       -> do { putStrLn "Push"; return 0; }
      Release                    -> do { putStrLn "Release"; return 0; }
      Enter                      -> do { putStrLn "Enter"; return 0; }
      Leave                      -> do { putStrLn "Leave"; return 0; }
      Drag                       -> do { putStrLn "Drag"; return 0; }
      Focus                      -> do { putStrLn "Focus"; return 0; }
      Unfocus                    -> do { putStrLn "Unfocus"; return 0; }
      Keydown                    -> do { putStrLn "Keydown"; return 0; }
      Keyup                      -> do { putStrLn "Keyup"; return 0; }
      Close                      -> do { putStrLn "Close"; return 0; }
      Move                       -> do { putStrLn "Move"; return 0; }
      Shortcut                   -> do { putStrLn "Shortcut"; return 0; }
      Deactivate                 -> do { putStrLn "Deactivate"; return 0; }
      Activate                   -> do { putStrLn "Activate"; return 0; }
      Hide                       -> do { putStrLn "Hide"; return 0; }
      Show                       -> do { putStrLn "Show"; return 0; }
      Paste                      -> do { putStrLn "Paste"; return 0; }
      Selectionclear             -> do { putStrLn "Selectionclear"; return 0; }
      Mousewheel                 -> do { putStrLn "Mousewheel"; return 0; }
      DndEnter                   -> do { putStrLn "DndEnter"; return 0; }
      DndDrag                    -> do { putStrLn "DndDrag"; return 0; }
      DndLeave                   -> do { putStrLn "DndLeave"; return 0; }
      DndRelease                 -> do { putStrLn "DndRelease"; return 0; }
      ScreenConfigurationChanged -> do { putStrLn "ScreenConfigurationChanged"; return 0; }
      Fullscreen                 -> do { putStrLn "Fullscreen"; return 0; }

main :: IO ()
main = do
  win <- addWindow
  print "added Window"
  _ <- addAwakeHandler
  print "added awake handler"
  _ <- runAwakeHandler
  _ <- setEventDispatch eventIntercept
  f <- eventDispatch
  _ <- f DndDrag win
  print "ran awake handler"
  flRun
