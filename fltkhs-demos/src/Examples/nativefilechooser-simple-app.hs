{-# LANGUAGE OverloadedStrings #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.FLTKHS
import System.Directory
import System.Exit
import qualified Data.Text as T
openFile :: FilePath -> IO ()
openFile fp = print $ "Open '" ++ fp ++ "''"

saveFile :: FilePath -> IO ()
saveFile fp = do
  print $ "Saving '" ++ fp ++ "'"
  exists' <- doesFileExist fp
  if not exists'
    then writeFile fp "Hello world.\n"
    else return ()

openCb :: Ref NativeFileChooser -> Ref MenuItem ->  IO ()
openCb fc _ = do
  setTitle fc "Open"
  res' <- showWidget fc
  case res' of
   NativeFileChooserPicked -> do
     f' <- getFilename fc
     case f' of
      (Just f'') -> do
        setPresetFile fc f''
        openFile (T.unpack f'')
      _ -> return ()
   _ -> return ()

saveAsCb :: Ref NativeFileChooser -> Ref MenuItem ->  IO ()
saveAsCb fc _ = do
  setTitle fc "Open"
  res' <- showWidget fc
  case res' of
   NativeFileChooserPicked -> do
     f' <- getFilename fc
     case f' of
      (Just f'') -> do
        setPresetFile fc f''
        saveFile (T.unpack f'')
      _ -> return ()
   _ -> return ()

saveCb :: Ref NativeFileChooser -> Ref MenuItem ->  IO ()
saveCb fc w' = do
  f' <- getFilename fc
  case f' of
   Nothing -> saveAsCb fc w'
   (Just f'') -> saveFile (T.unpack f'')

quitCb :: Ref MenuItem -> IO ()
quitCb _ = exitSuccess

initializeWindow :: Ref Window -> IO ()
initializeWindow w' = do
  chooser <- nativeFileChooserNew Nothing
  setFilter chooser "Text\t*.txt\n"
  setPresetFile chooser "untitiled.txt"
  begin w'
  menu <- sysMenuBarNew (toRectangle (0,0,400,25)) Nothing
  _ <- add menu "&File/&Open" (Just (KeySequence (ShortcutKeySequence [kb_CommandState] (NormalKeyType 'o')))) (Just (openCb chooser)) (MenuItemFlags [])
  _ <- add menu "&File/&Save" (Just (KeySequence (ShortcutKeySequence [kb_CommandState] (NormalKeyType 's')))) (Just (saveCb chooser)) (MenuItemFlags [])
  _ <- add menu "&File/&Save As" Nothing (Just (saveAsCb chooser)) (MenuItemFlags [])
  _ <- add menu "&File/&Quit" (Just (KeySequence (ShortcutKeySequence [kb_CommandState] (NormalKeyType 'q')))) (Just quitCb) (MenuItemFlags [])
  (Width w_w') <- getW w'
  (Height w_h') <- getH w'
  box' <- boxNew (toRectangle (20,25+20,w_w'-40,w_h'-40-25)) Nothing
  setColor box' whiteColor
  setBox box' FlatBox
  setAlign box' (Alignments [AlignTypeCenter, AlignTypeInside, AlignTypeWrap])
  setLabel box' $ "This demo shows an example of implementing " `T.append`
                  "common 'File' menu operations like:\n" `T.append`
                  "    File/Open, File/Save, File/Save As\n" `T.append`
                  "..using the Fl_Native_File_Chooser widget.\n\n" `T.append`
                  "Note 'Save' and 'Save As' really *does* create files! " `T.append`
                  "This is to show how behavior differs when " `T.append`
                  "files exist vs. do not.";
  setLabelsize box' (FontSize 12)
  end w'

main :: IO ()
main = do
  _ <- FL.setScheme "gtk+"
  app <- windowNew (toSize (400,200)) Nothing (Just "Native File Chooser Example")
  initializeWindow app
  showWidget app
  _ <- FL.run
  return ()
