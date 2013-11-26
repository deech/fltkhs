module Main where
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.FL

callback ::  (Show a) => a -> IO ()
callback a = print a

addWindow :: IO ()
addWindow = do
  window <- windowNewWithLabel 100 100 "Test"
  windowSetCallback window (callback "window's callback data")
  windowShow window

addAwakeHandler :: IO Int
addAwakeHandler = flAddAwakeHandler (callback "awake handler's callback data")

runAwakeHandler :: IO ()
runAwakeHandler = do
  awakeHandler <- flGetAwakeHandler_
  awakeHandler

main :: IO ()
main = do
  _ <- addWindow
  print "added Window"
  _ <- addAwakeHandler
  print "added awake handler"
  _ <- runAwakeHandler
  print "ran awake handler"
  flRun
