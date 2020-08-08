{-# LANGUAGE OverloadedStrings #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import Data.IORef
import qualified Data.Text as T
import Control.Monad

senderHandler :: Ref Box -> Event -> IO (Either UnknownEvent ())
senderHandler _ e =
  case e of
    -- do 'copy/dnd' when someone clicks on box
    Push -> do
      let message = "It works!"
      _ <- FL.copyToClipboard message
      _ <- FL.dnd
      return (Right ())
    e' |   e' == Enter
        || e' == Leave -> return (Right ())
    _ -> return (Left UnknownEvent)

receiverHandler :: Ref Box -> Event -> IO (Either UnknownEvent ())
receiverHandler box e =
  case e of
    e' |    e' == Enter
         || e' == Leave -> return (Right ())
    -- return (Right ()) for these events to 'accept' dnd
    e' |    e' == DndEnter
         || e' == DndDrag
         || e' == DndRelease -> return (Right ())
    -- handle actual drop (paste) operation
    Paste -> do
      et <- FL.eventText
      setLabel box et
      print et
      return (Right ())
    _ -> return (Left UnknownEvent)

main = do
  winA <- windowNew
            (toSize (200,100))
            Nothing
            (Just "Sender")
  a <- boxCustom
         (toRectangle (0,0,100,100))
         Nothing
         Nothing
         (Just (defaultCustomWidgetFuncs {
                   handleCustom = (Just senderHandler)
               }))
  setBox a FlatBox
  setLabelsize a (FontSize 12)
  setColor a (Color 10)
  setLabel a ("Drag\nfrom\nhere..")
  end winA
  showWidget winA

  winB <- windowNew
            (toSize (200,100))
            (Just (Position (X 400) (Y 0)))
            (Just "receiver")
  b <- boxCustom
         (toRectangle (100,0,100,100))
         Nothing
         Nothing
         (Just (defaultCustomWidgetFuncs {
                  handleCustom = (Just receiverHandler)
                }))
  setBox b FlatBox
  setLabelsize b (FontSize 12)
  setColor b (Color 9)
  setLabel b ("...to\nhere")
  end winB
  showWidget winB
  _ <- FL.run
  return ()
