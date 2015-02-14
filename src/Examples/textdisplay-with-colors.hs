module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
main :: IO ()
main = do
  let stes = [(StyleTableEntry (Just redColor) (Just courier) (Just $ FontSize 18)),
              (StyleTableEntry (Just darkYellowColor) (Just courier) (Just $ FontSize 18)),
              (StyleTableEntry (Just darkGreenColor) (Just courier) (Just $ FontSize 18)),
              (StyleTableEntry (Just blueColor) (Just courier) (Just $ FontSize 18))]
  win <- windowNew (toSize (640,480)) Nothing (Just $ "Simple Text Display With Colors")
  disp <- textDisplayNew (toRectangle (20,20,640-40,480-40)) Nothing
  tbuff <- textBufferNew Nothing Nothing
  sbuff <- textBufferNew Nothing Nothing
  setBuffer disp tbuff
  highlightData disp sbuff (indexStyleTableEntries stes) Nothing
  setText tbuff "Red Line 1\nYel Line 2\nGrn Line 3\nBlu Line 4\nRed Line 5\nYel Line 6\nGrn Line 7\nBlu Line 8\n"
  setText sbuff "AAAAAAAAAA\nBBBBBBBBBB\nCCCCCCCCCC\nDDDDDDDDDD\nAAAAAAAAAA\nBBBBBBBBBB\nCCCCCCCCCC\nDDDDDDDDDD\n"
  setResizable win disp
  showWidget win
  _ <- FL.run
  return ()
