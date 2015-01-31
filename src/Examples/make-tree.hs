module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Control.Monad

main :: IO ()
main = do
  win' <- windowNew (Size (Width 500) (Height 500)) Nothing (Just "FLTK Tree Window")
  begin win'
  tree' <- treeNew (toRectangle (50,50,200,200)) (Just "Tree")
  rootLabel tree' "Root Label With Items"
  prefs' <- treePrefsNew
  forM_ [0..(9 :: Int)] $ \_ -> do
    item' <- treeItemNew prefs'
    setLabel item' "test"
    addAt tree' "test" item'
  end win'
  showWidget win'
  _ <- FL.run
  return ()
