module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

main :: IO ()
main = do
  window <- doubleWindowNew (Size (Width 300) (Height 300)) Nothing Nothing
  setBox window NoBox
  _ <- setResizable window window
  tile <- tileNew (toRectangle (0,0,300,300)) Nothing
  box0 <- boxNew (toRectangle (0,0,150,150)) (Just "0") Nothing
  setBox box0 DownBox
  setColor box0 (Color 9)
  setLabelsize box0 (FontSize 36)
  setAlign box0 (Alignments [AlignTypeClip])

  w1 <- doubleWindowNew (Size (Width 150) (Height 150)) (Just (Position (X 150) (Y 0))) Nothing
  begin w1
  setBox w1 NoBox
  box1 <- boxNew (toRectangle (0,0,150,150)) (Just "1\nThis is a child window") Nothing
  setBox box1 DownBox
  setColor box1 (Color 19)
  setLabelsize box1 (FontSize 18)
  setAlign box1 (Alignments [AlignTypeClip, AlignTypeInside, AlignTypeWrap])
  _ <- setResizable w1 box1
  end w1

  box2a <- boxNew (toRectangle (0,150,70,150)) (Just "2a") Nothing
  setBox box2a DownBox
  setColor box2a (Color 12)
  setLabelsize box2a (FontSize 36)
  setAlign box2a (Alignments [AlignTypeClip])

  box2b <- boxNew (toRectangle (70,150,80,150)) (Just "2b") Nothing
  setBox box2b DownBox
  setColor box2b (Color 13)
  setLabelsize box2b (FontSize 36)
  setAlign box2b (Alignments [AlignTypeClip])

  box3a <- boxNew (toRectangle (150,150,150,70)) (Just "3a") Nothing
  setBox box3a DownBox
  setColor box3a (Color 12)
  setLabelsize box3a (FontSize 36)
  setAlign box3a (Alignments [AlignTypeClip])

  box3b <- boxNew (toRectangle (150,(150+70),150,80)) (Just "3b") Nothing
  setBox box3b DownBox
  setColor box3b (Color 13)
  setLabelsize box3b (FontSize 36)
  setAlign box3b (Alignments [AlignTypeClip])

  -- create the symmetrical resize box with dx and dy pixels distance, resp.
  -- from the borders of the Fl_Tile widget
  let dx = 20
  let dy = 20
  tileX <- getX tile
  tileY <- getY tile
  tileW <- getW tile
  tileH <- getH tile
  r <- boxNew (toRectangle ((tileX+dx), (tileY+dy), (tileW-(2*dx)), (tileH-(2*dy)))) Nothing Nothing
  _ <- setResizable tile r
  end tile
  end window

  _ <- showWidget w1
  _ <- showWidget window
  _ <- FL.run
  return ()
