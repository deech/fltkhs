module Main where

import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Window
import Graphics.UI.FLTK.LowLevel.Fl_Button
import Graphics.UI.FLTK.LowLevel.Fl_Return_Button
import Graphics.UI.FLTK.LowLevel.Fl_Repeat_Button
import Graphics.UI.FLTK.LowLevel.Fl_Check_Button
import Graphics.UI.FLTK.LowLevel.Fl_Light_Button
import Graphics.UI.FLTK.LowLevel.Fl_Round_Button
import Graphics.UI.FLTK.LowLevel.Fl_Toggle_Button
import Graphics.UI.FLTK.LowLevel.Fl_Types

main :: IO ()
main = do
     window <- windowNew
                (Size (Width 320) (Height 170))
                Nothing
                Nothing
                Nothing
     b <- buttonNew
           (Rectangle (Position (X 10) (Y 10)) (Size (Width 130) (Height 30)))
           (Just "Fl_Button")
           Nothing
     buttonSetTooltip b "This is a tooltip."
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
     windowEnd window
     windowShow window
     _ <- run
     return ()
