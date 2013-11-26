module Main where
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.FL

callback ::  (Show a) => a -> IO ()
callback a = do
    print a

addWindow :: IO ()
addWindow = do
  windowPtr <- windowNewWithLabel 100 100 "Test"
  windowSetCallback windowPtr (callback "window's callback data")
  windowShow windowPtr

addAwakeHandler :: IO Int
addAwakeHandler = flAddAwakeHandler (callback "awake handler's callback data")

runAwakeHandler :: IO ()
runAwakeHandler = do
  awakeHandler <- flGetAwakeHandler_
  awakeHandler


main :: IO ()
main = do
  _ <- addWindow
  _ <- addAwakeHandler
  _ <- runAwakeHandler
  flRun
