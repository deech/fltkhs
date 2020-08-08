{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Window
  (
    doubleWindowNew,
    singleWindowNew,
    windowNew
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel

windowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref LowLevel.Window)
windowNew size position label = do
  w <- LowLevel.windowNew size position label
  LowLevel.setColor w lightBackground
  return w

doubleWindowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref LowLevel.DoubleWindow)
doubleWindowNew size position label = do
  w <- LowLevel.doubleWindowNew size position label
  LowLevel.setColor w lightBackground
  return w

singleWindowNew :: Size -> Maybe Position -> Maybe T.Text -> IO (Ref LowLevel.SingleWindow)
singleWindowNew size position label = do
  w <- LowLevel.singleWindowNew size position label
  LowLevel.setColor w lightBackground
  return w
