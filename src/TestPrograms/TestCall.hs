{-# LANGUAGE FlexibleContexts, ScopedTypeVariables #-}
module Main where
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import qualified Graphics.UI.FLTK.LowLevel.FL as FL

windowCallback ::  (Show a) => a -> Ref Window -> IO ()
windowCallback a _ = print a

showOverride :: Ref Window -> IO ()
showOverride wptr = do
  print "showOverride"
  showWidgetSuper wptr

drawOverride :: Ref Window -> IO ()
drawOverride wptr = do
  print "drawOverride"
  drawSuper wptr

addButton :: Int -> Int -> String -> IO (Ref Button)
addButton x_pos y_pos label = do
  button <- buttonNew
              (Rectangle (Position (X x_pos) (Y y_pos)) (Size (Width 80) (Height 30)) )
              (Just label)
  return button

addWindow :: IO (Ref Window)
addWindow = do
  window <- windowCustom
              (Size (Width 100) (Height 100))
              Nothing
              (Just "Test")
              (Just (defaultCustomWidgetFuncs {
                        drawCustom = (Just drawOverride)
                        }
                    ))
              (Just defaultCustomWindowFuncs)
  button1 <- addButton 10 30 "button 1"
  button2 <- addButton 10 70 "button 2"
  setCallback button1 (\btn -> setLabel btn "New Label")
  setCallback button2 (\_ -> FL.deleteWidget button1 >> redraw window)
  setCallback window (windowCallback "window's callback data")
  showWidget window
  return window

runAwakeHandler :: IO ()
runAwakeHandler = do
  awakeHandler <- FL.getAwakeHandler_
  awakeHandler

eventIntercept :: Event -> Ref Window -> IO Int
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
  _ <- addWindow
  print "added Window"
  _ <- FL.addAwakeHandler (print "awake handler's callback data")
  print "added awake handler"
  _ <- runAwakeHandler
  -- _ <- FL.setEventDispatch eventIntercept
  _ <- FL.setHandler globalEventHandler
  print "ran awake handler"
  _ <- FL.run
  return ()
