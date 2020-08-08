{-# LANGUAGE OverloadedStrings #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Data.Text as T
treeCallback :: Ref Tree -> IO ()
treeCallback tree' = do
  (Just item') <- getCallbackItem tree'
  reason' <- getCallbackReason tree'
  label' <- getLabel item'
  case reason' of
    TreeReasonSelected -> do
      (Just path') <- itemPathname tree' item'
      print $ "TreeCallback: Item selected =" ++ (T.unpack label') ++ "Full pathname=" ++ (T.unpack path') ++ "\n"
    TreeReasonDeselected ->
      print $ "TreeCallback: Item deselected =" ++ (T.unpack label') ++ "\n"
    TreeReasonOpened ->
      print $ "TreeCallback: Item opened =" ++ (T.unpack label') ++ "\n"
    TreeReasonClosed ->
      print $ "TreeCallback: Item closed =" ++ (T.unpack label') ++ "\n"
    _ -> print ("" :: String)
main :: IO ()
main = do
  _ <- FL.setScheme "gtk+"
  window <- windowNew (toSize (250,400)) Nothing (Just "Simple Tree")
  begin window
  (Width windowWidth') <- getW window
  (Height windowHeight') <- getH window
  tree <- treeNew (toRectangle (10,10,windowWidth' - 20,windowHeight' - 20)) Nothing
  setShowroot tree False
  _ <- add tree "Flintstones/Fred"
  _ <- add tree "Flintstones/Wilma"
  _ <- add tree "Flintstones/Pebbles"
  _ <- add tree "Simpsons/Homer"
  _ <- add tree "Simpsons/Marge"
  _ <- add tree "Simpsons/Bart"
  _ <- add tree "Simpsons/Lisa"
  _ <- add tree "Pathnames/\\/bin"
  _ <- add tree "Pathnames/\\/usr\\/sbin"
  _ <- add tree "Pathnames/C:\\\\Program Files"
  _ <- add tree "Pathnames/C:\\\\Documents and Settings"
  close tree (TreeItemNameLocator (TreeItemName "Simpsons"))
  close tree (TreeItemNameLocator (TreeItemName "Pathnames"))
  setCallback tree treeCallback
  end window
  showWidget window
  _ <- FL.run
  return ()
