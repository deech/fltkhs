module Graphics.UI.FLTK.LowLevel.Utils where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Foreign
import Foreign.C
import Debug.Trace

foreign import ccall "wrapper"
        mkWidgetCallbackPtr :: CallbackWithUserDataPrim -> IO (FunPtr CallbackWithUserDataPrim)

foreign import ccall "wrapper"
        mkCallbackPtr :: CallbackPrim -> IO (FunPtr CallbackPrim)

foreign import ccall "wrapper"
        mkEventHandlerPtr :: WidgetEventHandlerPrim -> IO (FunPtr WidgetEventHandlerPrim)

foreign import ccall "wrapper"
        mkGlobalEventHandlerPtr :: GlobalEventHandlerPrim -> IO (FunPtr GlobalEventHandlerPrim)

foreign import ccall "dynamic"
        unwrapGlobalCallbackPtr :: FunPtr GlobalCallback -> GlobalCallback

cFromEnum :: (Enum a, Integral b) => a -> b
cFromEnum = fromIntegral . fromEnum
cToEnum :: (Integral b, Enum a) => b -> a
cToEnum = toEnum . fromIntegral
cToBool :: (Eq a, Num a) => a -> Bool
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
toRectangleFPrim ::  RectangleF a -> IO (FunPtr RectangleFPrim)
toRectangleFPrim f = mkRectanglePtr
                     (\wPtr x_pos y_pos width height ->
                          let rectangle = toRectangle (fromIntegral x_pos,
                                                       fromIntegral y_pos,
                                                       fromIntegral width,
                                                       fromIntegral height)
                          in
                            maybe (error "Null Pointer. toRectangleFPrim")
                                  (\p -> f p rectangle)
                                  (toObject wPtr))
ptrOrNull :: Maybe (Object a) -> IO (Ptr ())
ptrOrNull = maybe (return nullPtr) (\p -> withObject p return)
toEventHandlerPrim :: WidgetEventHandler a -> IO (FunPtr WidgetEventHandlerPrim)
toEventHandlerPrim f = wrapWidgetEventHandlerPrim
                       (\wPtr eventNumber ->
                            let event = cToEnum (eventNumber :: CInt)
                            in maybe (error "Null pointer: toEventHandlerPrim")
                                     (\p -> f p event >>= return . fromIntegral)
                                     (toObject wPtr))
toGlobalEventHandlerPrim :: GlobalEventHandlerF -> IO (FunPtr GlobalEventHandlerPrim)
toGlobalEventHandlerPrim f = mkGlobalEventHandlerPtr
                             (\eventNumber ->
                                let event = cToEnum (eventNumber :: CInt)
                                in f event >>= return . fromIntegral)
toGlobalCallbackPrim :: GlobalCallback -> IO (FunPtr CallbackPrim)
toGlobalCallbackPrim f = mkCallbackPtr (\_ -> f)
toCallbackPrim :: WidgetCallback a -> IO (FunPtr CallbackPrim)
toCallbackPrim f = mkCallbackPtr callback
    where
      callback :: CallbackPrim
      callback wPtr = maybe (error "Null pointer. toCallbackPrim")
                            f
                            (toObject wPtr)
toWidgetCallbackPrim :: WidgetCallback a -> IO (FunPtr CallbackWithUserDataPrim)
toWidgetCallbackPrim f = mkWidgetCallbackPtr (\ptr _ ->
                                                  maybe (error "Null pointer. toWidgetCallbackPrim")
                                                        (\p -> f p)
                                                        (toObject ptr))
toGetWindowFPrim :: GetWindowF a -> IO (FunPtr GetPointerF)
toGetWindowFPrim f = mkGetPointerPtr (\ptr ->
                                          maybe (error "Null pointer: toGetWindowFPrim")
                                                (\p -> f p >>= ptrOrNull)
                                                (toObject ptr))
toGetGlWindowFPrim :: GetGlWindowF a -> IO (FunPtr GetPointerF)
toGetGlWindowFPrim f = mkGetPointerPtr (\ptr ->
                                          maybe (error "Null pointer: toGetGlWindowFPrim")
                                                (\p -> f p >>= ptrOrNull)
                                                (toObject ptr))
toGetGroupFPrim :: GetGroupF a -> IO (FunPtr GetPointerF)
toGetGroupFPrim f = mkGetPointerPtr (\ptr ->
                                          maybe (error "Null pointer: toGetGroupFPrim")
                                                (\p -> f p >>= ptrOrNull)
                                                (toObject ptr))
orNullFunPtr :: (a -> IO (FunPtr b)) -> Maybe a -> IO (FunPtr b)
orNullFunPtr = maybe (return nullFunPtr)
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
