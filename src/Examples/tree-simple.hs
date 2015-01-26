module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS

treeCallback :: Ref Tree -> IO ()
treeCallback tree' = do
  (Just item') <- getCallbackItem tree'
  reason' <- getCallbackReason tree'
  label' <- getLabel item'
  case reason' of
    TreeReasonSelected -> do
      (Just path') <- itemPathname tree' item'
      print $ "TreeCallback: Item selected =" ++ label' ++ "Full pathname=" ++ path' ++ "\n"
    TreeReasonDeselected ->
      print $ "TreeCallback: Item deselected =" ++ label' ++ "\n"
    TreeReasonOpened ->
      print $ "TreeCallback: Item opened =" ++ label' ++ "\n"
    TreeReasonClosed ->
      print $ "TreeCallback: Item closed =" ++ label' ++ "\n"
    _ -> print ""
main :: IO ()
main = do
  _ <- FL.setScheme "gtk+"
  window <- windowNew (toSize (250,400)) Nothing (Just "Simple Tree")
  begin window
  windowWidth' <- getW window
  windowHeight' <- getH window
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
