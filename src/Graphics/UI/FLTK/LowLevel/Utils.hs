module Graphics.UI.FLTK.LowLevel.Utils where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Foreign
import Foreign.C

foreign import ccall "wrapper"
        mkCallbackPtr :: CallbackPrim -> IO (FunPtr CallbackPrim)

cFromEnum :: (Enum a, Integral b) => a -> b
cFromEnum = fromIntegral . fromEnum
cToEnum :: (Integral b, Enum a) => b -> a
cToEnum = toEnum . fromIntegral

cToBool :: CInt -> Bool
cToBool status = case status of
                   0 -> False
                   _ -> True

toFunPtr :: (a -> FunPtr a) -> a -> FunPtr a
toFunPtr f a = f a
