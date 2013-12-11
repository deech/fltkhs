module Main where
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types

callback ::  (Show a) => a -> IO ()
callback a = print a

addWindow :: IO WindowPtr
addWindow = do
  window <- windowNewWithLabel 100 100 "Test"
  windowSetCallback window (callback "window's callback data")
  windowShow window
  return window

runAwakeHandler :: IO ()
runAwakeHandler = do
  awakeHandler <- getAwakeHandler_
  awakeHandler

eventIntercept :: Event -> WindowPtr -> IO Int
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

globalEventHandler :: Event -> IO Int
globalEventHandler e =
    case e of
      NoEvent                    -> do { putStrLn "Global NoEvent"; return 0; }
      Push                       -> do { putStrLn "Global Push"; return 0; }
      Release                    -> do { putStrLn "Global Release"; return 0; }
      Enter                      -> do { putStrLn "Global Enter"; return 0; }
      Leave                      -> do { putStrLn "Global Leave"; return 0; }
      Drag                       -> do { putStrLn "Global Drag"; return 0; }
      Focus                      -> do { putStrLn "Global Focus"; return 0; }
      Unfocus                    -> do { putStrLn "Global Unfocus"; return 0; }
      Keydown                    -> do { putStrLn "Global Keydown"; return 0; }
      Keyup                      -> do { putStrLn "Global Keyup"; return 0; }
      Close                      -> do { putStrLn "Global Close"; return 0; }
      Move                       -> do { putStrLn "Global Move"; return 0; }
      Shortcut                   -> do { putStrLn "Global Shortcut"; return 0; }
      Deactivate                 -> do { putStrLn "Global Deactivate"; return 0; }
      Activate                   -> do { putStrLn "Global Activate"; return 0; }
      Hide                       -> do { putStrLn "Global Hide"; return 0; }
      Show                       -> do { putStrLn "Global Show"; return 0; }
      Paste                      -> do { putStrLn "Global Paste"; return 0; }
      Selectionclear             -> do { putStrLn "Global Selectionclear"; return 0; }
      Mousewheel                 -> do { putStrLn "Global Mousewheel"; return 0; }
      DndEnter                   -> do { putStrLn "Global DndEnter"; return 0; }
      DndDrag                    -> do { putStrLn "Global DndDrag"; return 0; }
      DndLeave                   -> do { putStrLn "Global DndLeave"; return 0; }
      DndRelease                 -> do { putStrLn "Global DndRelease"; return 0; }
      ScreenConfigurationChanged -> do { putStrLn "Global ScreenConfigurationChanged"; return 0; }
      Fullscreen                 -> do { putStrLn "Global Fullscreen"; return 0; }

main :: IO ()
main = do
  win <- addWindow
  print "added Window"
  _ <- addAwakeHandler (callback "awake handler's callback data")
  print "added awake handler"
  _ <- runAwakeHandler
  _ <- setEventDispatch eventIntercept
  f <- eventDispatch
  _ <- f DndDrag win
  _ <- setHandler globalEventHandler
  print "ran awake handler"
  _ <- run
  return ()
