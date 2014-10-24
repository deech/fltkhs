module Graphics.UI.FLTK.LowLevel.Utils where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Foreign
import qualified Foreign.Concurrent as FC
import Foreign.C
import qualified Data.ByteString as B
import qualified System.IO.Unsafe as Unsafe

foreign import ccall "wrapper"
        mkWidgetCallbackPtr :: CallbackWithUserDataPrim -> IO (FunPtr CallbackWithUserDataPrim)

foreign import ccall "wrapper"
        mkCallbackPtr :: CallbackPrim -> IO (FunPtr CallbackPrim)

foreign import ccall "wrapper"
        mkColorAverageCallbackPtr :: ColorAverageCallbackPrim -> IO (FunPtr ColorAverageCallbackPrim)

foreign import ccall "wrapper"
        mkWidgetTransformCallbackPtr :: WidgetTransformCallbackPrim -> IO (FunPtr WidgetTransformCallbackPrim)

foreign import ccall "wrapper"
        mkEventHandlerPtr :: WidgetEventHandlerPrim -> IO (FunPtr WidgetEventHandlerPrim)

foreign import ccall "wrapper"
        mkGlobalEventHandlerPtr :: GlobalEventHandlerPrim -> IO (FunPtr GlobalEventHandlerPrim)

foreign import ccall "wrapper"
        mkDrawCallbackPrimPtr :: DrawCallbackPrim -> IO (FunPtr DrawCallbackPrim)

foreign import ccall "wrapper"
        mkImageDrawCallbackPrimPtr :: ImageDrawCallbackPrim -> IO (FunPtr ImageDrawCallbackPrim)

foreign import ccall "wrapper"
        mkImageCopyCallbackPrimPtr :: ImageCopyCallbackPrim -> IO (FunPtr ImageCopyCallbackPrim)

foreign import ccall "wrapper"
        mkFinalizer :: (Ptr a -> IO ()) -> IO (FinalizerPtr a)

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

wrapNonNull :: Ptr a -> String -> IO (ForeignPtr (Ptr a))
wrapNonNull ptr msg = if (ptr == nullPtr)
                      then error msg
                      else do
                        pptr <- malloc
                        poke pptr ptr
                        FC.newForeignPtr pptr (return ())

toRectangleFPrim ::  RectangleF a -> IO (FunPtr RectangleFPrim)
toRectangleFPrim f = mkRectanglePtr
                     (\wPtr x_pos y_pos width height ->
                          let rectangle = toRectangle (fromIntegral x_pos,
                                                       fromIntegral y_pos,
                                                       fromIntegral width,
                                                       fromIntegral height)
                          in do
                          fptr <- wrapNonNull wPtr "Null Pointer. toRectangleFPrim"
                          f (wrapObject fptr) rectangle
                     )

toGlobalEventHandlerPrim :: GlobalEventHandlerF -> IO (FunPtr GlobalEventHandlerPrim)
toGlobalEventHandlerPrim f = mkGlobalEventHandlerPtr
                             (\eventNumber ->
                                let event = cToEnum (eventNumber :: CInt)
                                in f event >>= return . fromIntegral)

toEventHandlerPrim :: WidgetEventHandler a -> IO (FunPtr WidgetEventHandlerPrim)
toEventHandlerPrim f = wrapWidgetEventHandlerPrim
                       (\wPtr eventNumber ->
                            let event = cToEnum (eventNumber :: CInt)
                            in do
                            fptr <- wrapNonNull wPtr "Null Pointer: toEventHandlerPrim"
                            result <- f (wrapObject fptr) event
                            return $ fromIntegral result
                       )
toGlobalCallbackPrim :: GlobalCallback -> IO (FunPtr CallbackPrim)
toGlobalCallbackPrim f = mkCallbackPtr (\_ -> f)
toCallbackPrim :: WidgetCallback a -> IO (FunPtr CallbackPrim)
toCallbackPrim f = mkCallbackPtr (\ptr ->
                                    wrapNonNull ptr "Null pointer. toCallbackPrim" >>=
                                    \pp -> f (wrapObject pp)
                                 )

toWidgetCallbackPrim :: WidgetCallback a -> IO (FunPtr CallbackWithUserDataPrim)
toWidgetCallbackPrim f = mkWidgetCallbackPtr
                         (\ptr _ -> wrapNonNull ptr "Null pointer: toWidgetCallbackPrim" >>=
                                    \pp -> f (wrapObject pp)
                         )
toImageDrawCallbackPrim :: ImageDrawCallback a -> IO (FunPtr ImageDrawCallbackPrim)
toImageDrawCallbackPrim f =
    mkImageDrawCallbackPrimPtr
    (\ptr x_pos' y_pos' width' height' x_offset' y_offset' ->
       let _x_offset = fmap X $ integralToMaybe x_offset'
           _y_offset = fmap Y $ integralToMaybe y_offset'
           position' = Position (X $ fromIntegral x_pos')
                                (Y $ fromIntegral y_pos')
           size' = Size (Width $ fromIntegral width')
                        (Height $ fromIntegral height')
       in
        toObject ptr >>= \objPtr -> f objPtr position' size' _x_offset _y_offset
    )

toColorAverageCallbackPrim :: ColorAverageCallback a -> IO (FunPtr ColorAverageCallbackPrim)
toColorAverageCallbackPrim f =
    mkColorAverageCallbackPtr
    (\ptr cint cfloat ->
         wrapNonNull ptr "Null pointer. toColorAverageCallbackPrim" >>= \pp ->
         f (wrapObject pp) (Color (fromIntegral cint)) (realToFrac cfloat)
    )

toImageCopyCallbackPrim :: ImageCopyCallback a b -> IO (FunPtr ImageCopyCallbackPrim)
toImageCopyCallbackPrim f =
    mkImageCopyCallbackPrimPtr
    (\ptr width' height' -> do
         pp <- wrapNonNull ptr "Null pointer. toImageCopyCallbackPrim"
         objPtr <- f (wrapObject pp) (Size (Width $ fromIntegral width')
                                           (Height $ fromIntegral height'))
         unsafeObjectToPtr objPtr
    )

toWidgetTransformCallbackPrim :: WidgetTransformCallback a b -> IO (FunPtr WidgetTransformCallbackPrim)
toWidgetTransformCallbackPrim f =
    mkWidgetTransformCallbackPtr
    (\ptr ->
         wrapNonNull ptr "Null pointer. toWidgetTransformCallbackPrim" >>= \pp ->
         do
           widget <- f (wrapObject pp)
           unsafeObjectToPtr widget
    )

toDrawCallback :: DrawCallback -> IO (FunPtr DrawCallbackPrim)
toDrawCallback f = mkDrawCallbackPrimPtr
                   (\string' length' x' y' -> do
                      str' <- peekCStringLen (string', fromIntegral length')
                      f str' (Position (X (fromIntegral x')) (Y (fromIntegral y'))))

runPointerF :: (Object a -> IO (Object b)) -> Ptr () -> String -> IO (Ptr c)
runPointerF f ptr msg = do
   pp <- wrapNonNull ptr msg
   result <- f (wrapObject pp)
   withObject result (return . castPtr)

toGetWindowFPrim :: GetWindowF a -> IO (FunPtr GetPointerF)
toGetWindowFPrim f = mkGetPointerPtr (\ptr -> runPointerF f ptr "Null pointer: toGetWindowFPrim")
toGetGlWindowFPrim :: GetGlWindowF a -> IO (FunPtr GetPointerF)
toGetGlWindowFPrim f = mkGetPointerPtr (\ptr -> runPointerF f ptr "Null pointer: toGetGlWindowFPrim")
toGetGroupFPrim :: GetGroupF a -> IO (FunPtr GetPointerF)
toGetGroupFPrim f = mkGetPointerPtr (\ptr -> runPointerF f ptr "Null pointer: toGetGroupFPrim")
orNullFunPtr :: (a -> IO (FunPtr b)) -> Maybe a -> IO (FunPtr b)
orNullFunPtr = maybe (return nullFunPtr)

arrayToObjects:: (Ptr (Ptr ())) -> Int -> IO [(Object a)]
arrayToObjects arrayPtr numElements =
    go arrayPtr numElements []
    where
      go _ 0 accum =  return accum
      go currPtr numLeft accum = do
        curr <- peek currPtr
        obj <- toObject curr
        go (currPtr `plusPtr` (sizeOf (undefined :: Ptr (Ptr a))))
           (numLeft - 1)
           ([obj] ++ accum)

objectOrError :: String -> Ptr () -> IO (Object b)
objectOrError errorMessage p = wrapNonNull p errorMessage >>=
                               return . wrapObject
toShortcut :: [KeyboardCode] -> FlShortcut
toShortcut = fromIntegral . sum . (map fromEnum)

toObject ::  Ptr () -> IO (Object a)
toObject ptr = throwStackOnError $
                  do
                    pp <- wrapNonNull ptr "Null Pointer Error"
                    let result = wrapObject pp
                    return $ result

unsafeToObject :: Ptr () -> (Object a)
unsafeToObject = Unsafe.unsafePerformIO . toObject

supressWarningAboutRes :: a -> ()
supressWarningAboutRes _ = ()

foldl1WithDefault :: a -> (a -> a -> a) -> [a] -> a
foldl1WithDefault emptyCase _ [] = emptyCase
foldl1WithDefault _ f as = foldl1 f as

integralToMaybe :: (Integral a, Integral b) => a -> Maybe b
integralToMaybe n = if (n == 0) then Nothing else (Just $ fromIntegral n)

withPixmap :: PixmapHs -> ((Ptr (Ptr CChar)) -> IO a) -> IO a
withPixmap (PixmapHs pixmap) f =
    B.useAsCString
      (foldl1 B.append pixmap)
      (\ptr -> new ptr >>= f)

withBitmap :: BitmapHs -> ((Ptr CChar) -> Int -> Int -> IO a) -> IO a
withBitmap (BitmapHs bitmap (Size (Width width') (Height height'))) f =
   B.useAsCString
     (foldl1 B.append bitmap)
     (\ptr -> f ptr width' height')
