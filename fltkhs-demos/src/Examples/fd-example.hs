{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE CPP #-}
module Main where
import qualified Graphics.UI.FLTK.LowLevel.FL as FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Foreign.C.String
import Foreign.C.Types
import Foreign.Ptr
import Foreign.Marshal.Alloc
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Data.Text as T
pingCommand :: T.Text
#ifdef mingw32_HOST_OS
type Fl_Socket = CULLong
pingCommand = "ping -n 10 localhost" -- 'slow command' under windows
#else
type Fl_Socket = CInt
pingCommand = "ping -i 2 -c 10 localhost"
#endif

handleFD :: Ptr () -> Ref Browser -> FlSocket -> IO ()
handleFD stream b (FlSocket fd) =
  getLineShim stream >>= maybe atEOF (add b)
  where
    atEOF = do
      FL.removeFd (fromIntegral fd)
      pcloseShim stream
      add b ""
      add b "<<DONE>>"

main :: IO ()
main = do
  w <- windowNew (Size (Width 600) (Height 600)) Nothing Nothing
  begin w
  b <- browserNew (toRectangle (10,10,580,580)) Nothing
  setType b MultiBrowserType
  pingCommandPtr <- copyTextToCString pingCommand
  stream <- popenShim pingCommandPtr
  fd <- filenoShim stream
  FL.addFd fd (handleFD stream b)
  end w
  setResizable w (Just b)
  showWidget w
  _ <- FL.run
  return ()

-- All of these C shims to popen, pclose etc. are necessary because
-- unfortunately there aren't portable equivalents in the Haskell
-- libraries. They all seem to depend on the `unix` package which
-- will not build on Windows.
getLineShim :: Ptr () -> IO (Maybe T.Text)
getLineShim stream = do
  linePtr <- getLineShim' stream
  if (linePtr == nullPtr)
    then return Nothing
    else do
     line <- cStringToText linePtr
     free linePtr
     return (Just line)

foreign import ccall safe "Examples/PopenShim.H popenShim" popenShim ::
    Ptr CChar -> IO (Ptr ())

foreign import ccall safe "Examples/popenShim.H filenoShim" filenoShim ::
    Ptr () -> IO CInt

foreign import ccall safe "Examples/popenShim.H pcloseShim" pcloseShim ::
    Ptr () -> IO ()

foreign import ccall safe "Examples/popenShim.H getLineShim" getLineShim' ::
    Ptr () -> IO (Ptr CChar)
