{-# LANGUAGE OverloadedStrings #-}

{- | Ported from [buttons.cxx]<https://github.com/IngwiePhoenix/FLTK/blob/master/test/buttons.cxx>,
which is also included in @fltkhs@ at @c-examples\/buttons.c@.

@
cabal configure -fdemos
cabal run fltkhs-buttons
@

-}
module Main where

import Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.FLTKHS

ui :: IO ()
ui = do
     window <- windowNew
                (Size (Width 320) (Height 170))
                Nothing
                Nothing
     within window $ do
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
       return ()
     showWidget window
     _ <- FL.run
     return ()

main :: IO ()
main = ui >> FL.flush
