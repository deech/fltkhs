module Graphics.UI.FLTK.LowLevel.Utils where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Foreign
import Foreign.C

foreign import ccall "wrapper"
        mkWidgetCallbackPtr :: CallbackWithUserDataPrim -> IO (FunPtr CallbackWithUserDataPrim)

foreign import ccall "wrapper"
        mkCallbackPtr :: CallbackPrim -> IO (FunPtr CallbackPrim)

foreign import ccall "wrapper"
        mkEventHandlerPtr :: WidgetEventHandlerPrim -> IO (FunPtr WidgetEventHandlerPrim)

foreign import ccall "wrapper"
        mkGlobalEventHandlerPtr :: GlobalEventHandlerPrim -> IO (FunPtr GlobalEventHandlerPrim)

foreign import ccall "dynamic"
        unwrapCallbackPtr :: FunPtr Callback -> Callback

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

masks :: CInt -> CInt -> Bool
masks compoundCode code = (code .|. compoundCode) /= 0

foreign import ccall "wrapper"
        wrapWidgetEventHandlerPrim :: WidgetEventHandlerPrim ->
                                      IO (FunPtr WidgetEventHandlerPrim)
foreign import ccall "wrapper"
        mkRectanglePtr :: RectangleFPrim -> IO (FunPtr RectangleFPrim)
foreign import ccall "wrapper"
        mkGetPointerPtr :: GetPointerF -> IO (FunPtr GetPointerF)
toRectangleFPrim ::  RectangleF -> IO (FunPtr RectangleFPrim)
toRectangleFPrim f = mkRectanglePtr
                     (\_ x_pos y_pos width height ->
                          let rectangle = toRectangle (fromIntegral x_pos, fromIntegral y_pos, fromIntegral width, fromIntegral height)
                          in f rectangle)
ptrOrNull :: Maybe (Object a) -> IO (Ptr ())
ptrOrNull = maybe (return nullPtr) (\p -> withObject p return)
toEventHandlerPrim :: EventHandlerF -> IO (FunPtr WidgetEventHandlerPrim)
toEventHandlerPrim f = wrapWidgetEventHandlerPrim
                       (\_ eventNumber ->
                            let event = cToEnum (eventNumber :: CInt)
                            in f event >>= return . fromIntegral)
toGlobalEventHandlerPrim :: EventHandlerF -> IO (FunPtr GlobalEventHandlerPrim)
toGlobalEventHandlerPrim f = mkGlobalEventHandlerPtr
                             (\eventNumber ->
                                let event = cToEnum (eventNumber :: CInt)
                                in f event >>= return . fromIntegral)
toCallbackPrim :: Callback -> IO (FunPtr CallbackPrim)
toCallbackPrim f = mkCallbackPtr (\_ -> f >> return ())
toWidgetCallbackPrim :: Callback -> IO (FunPtr CallbackWithUserDataPrim)
toWidgetCallbackPrim f = mkWidgetCallbackPtr (\_ _ -> f >> return ())
toGetWindowFPrim :: GetWindowF -> IO (FunPtr GetPointerF)
toGetWindowFPrim f = mkGetPointerPtr (\_ -> f >>= ptrOrNull )
toGetGlWindowFPrim :: GetGlWindowF -> IO (FunPtr GetPointerF)
toGetGlWindowFPrim f = mkGetPointerPtr (\_ -> f >>= ptrOrNull)
toGetGroupFPrim :: GetGroupF -> IO (FunPtr GetPointerF)
toGetGroupFPrim f = mkGetPointerPtr (\_ -> f >>= ptrOrNull)
orNullPtr :: (a -> IO (FunPtr b)) -> Maybe a -> IO (FunPtr b)
orNullPtr = maybe (return nullFunPtr)
arrayToObjects:: (Ptr (Ptr ())) -> Int -> IO [Maybe (Object a)]
arrayToObjects arrayPtr numElements =
    go arrayPtr numElements []
    where
      go _ 0 accum =  return accum
      go currPtr numLeft accum = do
        curr <- peek currPtr
        go (currPtr `plusPtr` (sizeOf (undefined :: Ptr())))
           (numLeft - 1)
           ([toObject curr] ++ accum)
