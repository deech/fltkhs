module Main where

import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.FLTKHS

main :: IO ()
main = do
     window <- windowNew
                (Size (Width 320) (Height 170))
                Nothing
                Nothing
     b <- buttonNew
           (Rectangle (Position (X 10) (Y 10)) (Size (Width 130) (Height 30)))
           (Just "Fl_Button")
     setTooltip b "This is a tooltip."
     _ <- repeatButtonNew
           (Rectangle (Position (X 10) (Y 50)) (Size (Width 130) (Height 30)))
           (Just "Fl_Repeat_Button")
     _ <- lightButtonNew
           (Rectangle (Position (X 10) (Y 90)) (Size (Width 130) (Height 30)))
           (Just "Fl_Light_Button")
     _ <- toggleButtonNew
           (Rectangle (Position (X 10) (Y 130)) (Size (Width 130) (Height 30)))
           (Just "Fl_Toggle_Button")
     _ <- returnButtonNew
           (Rectangle (Position (X 150) (Y 10)) (Size (Width 160) (Height 30)))
           (Just  "Fl_Return_Button")
     _ <- roundButtonNew
           (Rectangle (Position (X 150) (Y 50)) (Size (Width 160) (Height 30)))
           (Just "Fl_Round_Button")
     _ <- checkButtonNew
           (Rectangle (Position (X 150) (Y 90)) (Size (Width 160) (Height 30)))
           (Just "Fl_Check_Button")
     end window
     showWidget window
     _ <- run
     return ()
