module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS

type_cb :: Ref Scrolled -> Ref Pack -> PackType -> Ref LightButton -> IO ()
type_cb scrolled pack packType _ = do
                      cs <- getArray pack
                      mapM_ (\c -> resize c (toRectangle (0,0,25,25))) cs
                      rect <- getRectangle scrolled
                      resize pack rect
                      getParent pack >>=
                        maybe (return ())
                              (\p' -> redraw p' >> setType pack packType >> redraw pack)

spacing_cb :: Ref Scrolled -> Ref Pack -> Ref HorValueSlider -> IO ()
spacing_cb scrolled pack slider = do
  spacing <- getValue slider
  setSpacing pack (truncate spacing)
  redraw scrolled

main :: IO ()
main = do
  w <- doubleWindowNew (Size (Width 360) (Height 370)) Nothing Nothing
  scrolled <- scrolledNew (toRectangle (10,10,340,285)) Nothing
  begin scrolled
  pack <- packNew (toRectangle $ (10,10,340,285)) Nothing
  setBox pack DownFrame
  begin pack
  _ <- buttonNew (toRectangle (35, 35, 25, 25)) (Just "b1")
  _ <- buttonNew (toRectangle (45, 45, 25, 25)) (Just "b2")
  _ <- buttonNew (toRectangle (55, 55, 25, 25)) (Just "b3")
  _ <- buttonNew (toRectangle (65, 65, 25, 25)) (Just "b4")
  _ <- buttonNew (toRectangle (75, 75, 25, 25)) (Just "b5")
  _ <- buttonNew (toRectangle (85, 85, 25, 25)) (Just "b6")
  _ <- buttonNew (toRectangle (95, 95, 25, 25)) (Just "b7")
  _ <- buttonNew (toRectangle (105, 105, 25, 25)) (Just "b8")
  _ <- buttonNew (toRectangle (115, 115, 25, 25)) (Just "b9")
  _ <- buttonNew (toRectangle (125, 125, 25, 25)) (Just "b10")
  _ <- buttonNew (toRectangle (135, 135, 25, 25)) (Just "b11")
  _ <- buttonNew (toRectangle (145, 145, 25, 25)) (Just "b12")
  _ <- buttonNew (toRectangle (155, 155, 25, 25)) (Just "b13")
  _ <- buttonNew (toRectangle (165, 165, 25, 25)) (Just "b14")
  _ <- buttonNew (toRectangle (175, 175, 25, 25)) (Just "b15")
  _ <- buttonNew (toRectangle (185, 185, 25, 25)) (Just "b16")
  _ <- buttonNew (toRectangle (195, 195, 25, 25)) (Just "b17")
  _ <- buttonNew (toRectangle (205, 205, 25, 25)) (Just "b18")
  _ <- buttonNew (toRectangle (215, 215, 25, 25)) (Just "b19")
  _ <- buttonNew (toRectangle (225, 225, 25, 25)) (Just "b20")
  _ <- buttonNew (toRectangle (235, 235, 25, 25)) (Just "b21")
  _ <- buttonNew (toRectangle (245, 245, 25, 25)) (Just "b22")
  _ <- buttonNew (toRectangle (255, 255, 25, 25)) (Just "b23")
  _ <- buttonNew (toRectangle (265, 265, 25, 25)) (Just "b24")
  end pack
  setResizable w (Just w)
  end scrolled
  lb1 <- lightButtonNew (toRectangle (10, 305, 165, 25)) (Just "HORIZONTAL")
  setType lb1 RadioButtonType
  setCallback lb1 (type_cb scrolled pack PackHorizontal)
  lb2 <- lightButtonNew (toRectangle(185, 305, 165, 25)) (Just "VERTICAL")
  setType lb2 RadioButtonType
  _ <- setValue lb2 True
  setCallback lb2 (type_cb scrolled pack PackVertical)
  vs <- horValueSliderNew (toRectangle (100, 335, 250, 25)) (Just "Spacing: ")
  setAlign vs (Alignments [AlignTypeLeft])
  range vs 0 30
  setStep vs 1
  setCallback vs (spacing_cb scrolled pack)
  end w
  showWidget w
  _ <- FL.run
  return ()
