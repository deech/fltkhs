{-# LANGUAGE OverloadedStrings #-}
{-
This is a test of how the browser draws lines.
This is a second line.
This is a third.

That was a blank line above this.

@r@_Right justify
@c@_Center justify
@_Left justify

@bBold text
@iItalic text
@b@iBold Italic
@fFixed width
@f@bBold Fixed
@f@iItalic Fixed
@f@i@bBold Italic Fixed
@lLarge
@l@bLarge bold
@sSmall
@s@bSmall bold
@s@iSmall italic
@s@i@bSmall italic bold
@uunderscore
@C1RED
@C2Green
@C4Blue

	You should try different browser types:
	Fl_Browser
	Fl_Select_Browser
	Fl_Hold_Browser
	Fl_Multi_Browser
-}

module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Control.Monad
import System.Environment
import qualified Data.Text as T
data CallbackType = Top | Middle | Bottom | Visible | Browser
bCb :: Ref SelectBrowser -> IO ()
bCb browser' = do
  lineNumber <- getValue browser'
  clicks <- FL.eventClicks
  putStrLn ("callback, selection = " ++ (show lineNumber) ++ " eventClicks = " ++ (show clicks))

showCb :: CallbackType -> Ref Input -> Ref SelectBrowser -> IO ()
showCb buttontype' field' browser' = do
  line' <- getValue field'
  if (T.null line')
    then print ("Please enter a number in the text field before clicking on the buttons." :: String)
    else do
    let lineNumber' = read (T.unpack line')
    case buttontype' of
     Top -> setTopline browser' (LineNumber lineNumber')
     Bottom -> setBottomline browser' (LineNumber lineNumber')
     Middle -> setMiddleline browser' (LineNumber lineNumber')
     _ -> makeVisible browser' (LineNumber lineNumber')

swapCb :: Ref SelectBrowser -> Ref Button -> IO ()
swapCb browser' _ =
  do
    browserSize' <- getSize browser'
    linesSelected' <- filterM (selected browser') (map LineNumber [0..(browserSize' - 1)])
    case linesSelected' of
     (l1:l2:_) -> swap browser' l1 l2
     (l1:[]) -> swap browser' l1 (LineNumber (-1))
     _ -> swap browser' (LineNumber (-1)) (LineNumber (-1))

sortCb :: Ref SelectBrowser -> Ref Button -> IO ()
sortCb browser' _ = sortWithSortType browser' SortAscending

btypeCb :: Ref SelectBrowser -> Ref Choice -> IO ()
btypeCb browser' btype' = do
  numLines' <- getSize browser'
  forM_ [1..(numLines' - 1)] (\l -> select browser' (LineNumber l) False)
  _ <- select browser' (LineNumber 1) False -- leave focus box on first line
  choice' <- getText btype'
  case choice' of
   "Normal" -> setType browser' NormalBrowserType
   "Select" -> setType browser' SelectBrowserType
   "Hold" -> setType browser' HoldBrowserType
   "Multi" -> setType browser' MultiBrowserType
   _ -> return ()
  redraw browser'

main :: IO ()
main = do
  args <- getArgs
  if (null args) then print ("Enter the path to a text file as an argument. As an example use this file (./src/Examples/browser.hs) to see what Fl_Browser can do." :: String)
    else do
     let fname = T.pack (head args)
     window <- doubleWindowNew (Size (Width 560) (Height 400)) Nothing (Just fname)
     browser' <- selectBrowserNew (Rectangle (Position (X 0) (Y 0)) (Size (Width 560) (Height 350))) Nothing
     setType browser' MultiBrowserType
     setCallback browser' bCb
     loadStatus' <- load browser' fname
     case loadStatus' of
       Left _ -> print ("Can't load " ++ T.unpack fname)
       _ -> do
         setPosition browser' (PixelPosition 0)
         field <- inputNew (toRectangle (55,350,505,25)) (Just "Line #:") (Just FlIntInput)
         setCallback field (\_ -> showCb Browser field browser')
         top' <- buttonNew (toRectangle (0,375,80,25)) (Just "Top")
         setCallback top' (\_ -> showCb Top field browser')
         bottom' <- buttonNew (toRectangle (80,375,80,25)) (Just "Bottom")
         setCallback bottom' (\_ -> showCb Bottom field browser')
         middle' <- buttonNew (toRectangle (160,375,80,25)) (Just "Middle")
         setCallback middle' (\_ -> showCb Middle field browser')
         visible' <- buttonNew (toRectangle (240,375,80,25)) (Just "Make Vis.")
         setCallback visible' (\_ -> showCb Visible field browser')
         swap' <- buttonNew (toRectangle (320,375,80,25)) (Just "Swap")
         setCallback swap' $ swapCb browser'
         setTooltip swap' "Swaps two selected lines\n(Use CTRL-click to select two lines)"
         sort' <- buttonNew (toRectangle (400,375,80,25)) (Just "Sort")
         setCallback sort' (sortCb browser')
         btype <- choiceNew (toRectangle (480,375,80,25)) Nothing
         addName btype "Normal"
         addName btype "Select"
         addName btype "Hold"
         addName btype "Multi"
         setCallback btype $ btypeCb browser'
         _ <- setValue btype (MenuItemByIndex (AtIndex 3))
         setResizable window (Just browser')
         showWidget window
         _ <- FL.run
         return ()
