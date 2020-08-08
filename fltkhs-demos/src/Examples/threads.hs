{-# LANGUAGE OverloadedStrings #-}
-- This example shows how to run a CPU-intensive thread in the
-- background while keeping the UI responsive.  All FLTK calls are
-- done on the main thread.
--
-- Press the "start background thread" button to start the
-- CPU-intensive thread.  Then observe that clicking the "increment"
-- button remains responsive.

module Main where

import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS

import Control.Concurrent
import Control.Concurrent.STM
import Control.Exception (evaluate)
import Control.Monad
import Data.IORef
import qualified Data.Text as T
main :: IO ()
main = do
  -- Set up the window and widgets.
  w <- windowNew (Size (Width 260) (Height 110)) Nothing Nothing
  startButton <- buttonNew (Rectangle (Position (X 15) (Y 10)) (Size (Width 230) (Height 25))) (Just "start background thread")
  b <- outputNew (Rectangle (Position (X 135) (Y 40)) (Size (Width 110) (Height 25))) (Just "primes ") (Just FlNormalOutput)
  button <- buttonNew (Rectangle (Position (X 15) (Y 75)) (Size (Width 110) (Height 25))) (Just "increment")
  counter <- outputNew (Rectangle (Position (X 135) (Y 75)) (Size (Width 110) (Height 25)))  Nothing (Just FlNormalOutput)
  clearVisibleFocus b
  clearVisibleFocus counter

  -- The communication channel between the CPU-heavy thread and the
  -- main thread.
  c <- newTChanIO

  -- When the start button is pressed, start the CPU-heavy thread.
  setCallback startButton $ \_ -> do
    void $ forkIO $ computationThread c

  -- Start the click counter at zero.
  counterRef <- newIORef (0 :: Integer)
  _ <- setValue counter (T.pack (show (0 :: Integer)))

  -- When the button is pressed, increment the counter and update the
  -- label.
  setCallback button $ \_ -> do
    modifyIORef counterRef (+1)
    x <- readIORef counterRef
    void $ setValue counter (T.pack (show x))

  -- Every so often, check for messages from our worker thread.
  FL.addTimeout 0.025 (tick b c)

  -- Start the UI.
  showWidget w
  _ <- FL.run
  return ()

-- Check for a message from our worker thread.  If there is a message,
-- gobble all the messages up and set the label to the contents on the
-- most recent message.
tick :: Ref Output -> TChan Integer -> IO ()
tick b c = do
  mx <- atomically $ tryReadTChan c
  case mx of
    Nothing -> return ()
    Just x -> inner x
  _ <- FL.repeatTimeout 0.025 (tick b c)
  return ()
  where inner x = do
          mx <- atomically $ tryReadTChan c
          case mx of
            Nothing -> void $ setValue b (T.pack (show x))
            Just x' -> inner x'


-- Very slow prime-testing predicate.
isPrime :: Integer -> Bool
isPrime 1 = False
isPrime x = not $ any (\y -> x `mod` y == 0) [2..x-1]

-- Write prime numbers to a channel forever.
computationThread :: TChan Integer -> IO ()
computationThread channel = do
  let primes = filter isPrime [1000000..]
  forM_ primes $ \p -> do
    _ <- evaluate p
    atomically $ writeTChan channel p
