module Graphics.UI.FLTK.LowLevel.Utils where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Dispatch
import Data.List
import Foreign
import qualified Foreign.Concurrent as FC
import Foreign.C
import qualified Data.ByteString.Char8 as C
import qualified Data.ByteString as B
import qualified System.IO.Unsafe as Unsafe

foreign import ccall "wrapper"
        mkWidgetCallbackPtr :: CallbackWithUserDataPrim -> IO (FunPtr CallbackWithUserDataPrim)
foreign import ccall "wrapper"
        mkCallbackPtr :: CallbackPrim -> IO (FunPtr CallbackPrim)
foreign import ccall "wrapper"
        mkColorAverageCallbackPtr :: ColorAverageCallbackPrim -> IO (FunPtr ColorAverageCallbackPrim)
foreign import ccall "wrapper"
        mkGlobalEventHandlerPtr :: GlobalEventHandlerPrim -> IO (FunPtr GlobalEventHandlerPrim)
foreign import ccall "wrapper"
        mkDrawCallbackPrimPtr :: DrawCallbackPrim -> IO (FunPtr DrawCallbackPrim)
foreign import ccall "wrapper"
        mkImageDrawCallbackPrimPtr :: ImageDrawCallbackPrim -> IO (FunPtr ImageDrawCallbackPrim)
foreign import ccall "wrapper"
        mkImageCopyCallbackPrimPtr :: ImageCopyCallbackPrim -> IO (FunPtr ImageCopyCallbackPrim)
foreign import ccall "wrapper"
        mkUnfinishedStyleCbPrim :: UnfinishedStyleCbPrim -> IO (FunPtr UnfinishedStyleCbPrim)
foreign import ccall "wrapper"
        mkFinalizer :: (Ptr a -> IO ()) -> IO (FinalizerPtr a)
foreign import ccall "wrapper"
        mkFinalizerEnv :: (Ptr env -> Ptr a -> IO ()) -> IO (FinalizerEnvPtr env a)
foreign import ccall "wrapper"
        wrapBoxDrawFPrim :: BoxDrawFPrim -> IO (FunPtr BoxDrawFPrim)
foreign import ccall "dynamic"
        unwrapGlobalCallbackPtr :: FunPtr GlobalCallback -> GlobalCallback
foreign import ccall "dynamic"
        unwrapBoxDrawFPrim :: FunPtr BoxDrawFPrim -> BoxDrawFPrim
foreign import ccall "wrapper"
        mkTextModifyCb :: TextModifyCbPrim -> IO (FunPtr TextModifyCbPrim)
foreign import ccall "wrapper"
        mkTextPredeleteCb :: TextPredeleteCbPrim -> IO (FunPtr TextPredeleteCbPrim)

toCallbackPrim :: (Ref a -> IO ()) ->
                  IO (FunPtr (Ptr () -> IO ()))
toCallbackPrim f = mkCallbackPtr $ \ptr -> do
  pp <- wrapNonNull ptr "Null pointer. toCallbackPrim"
  f (castTo (wrapInRef pp))

toCallbackPrimWithUserData :: (Ref a -> IO ()) ->
                              IO (FunPtr (Ptr () -> Ptr () -> IO ()))
toCallbackPrimWithUserData f = mkWidgetCallbackPtr $ \ptr _ -> do
  pp <- wrapNonNull ptr "Null pointer: toWidgetCallbackPrim"
  f (castTo (wrapInRef pp))

cFromEnum :: (Enum a, Integral b) => a -> b
cFromEnum = fromIntegral . fromEnum
cToEnum :: (Integral b, Enum a) => b -> a
cToEnum = toEnum . fromIntegral
cToBool :: (Eq a, Num a) => a -> Bool
cToBool status = case status of
                   0 -> False
                   _ -> True
cFromBool :: (Eq a, Num a) => Bool -> a
cFromBool status = if status then 1 else 0

toFunPtr :: (a -> FunPtr a) -> a -> FunPtr a
toFunPtr f a = f a

extract :: (Enum a) => [a] -> CInt -> [a]
extract allCodes compoundCode
    = map cToEnum $
      filter (masks compoundCode) $
      map cFromEnum allCodes

combine :: (Enum a, Ord a) => [a] -> Int
combine = sum . map (fromEnum . head) . group . sort

masks :: CInt -> CInt -> Bool
masks compoundCode code = (compoundCode .&. code) /= 0

keySequenceToCInt :: [EventState] -> KeyType -> CInt
keySequenceToCInt modifiers char =
  let charCode = case char of
        SpecialKeyType c' -> fromIntegral $ fromEnum c'
        NormalKeyType c' -> fromIntegral $ castCharToCChar c'
    in (fromIntegral $ combine modifiers) + charCode

wrapNonNull :: Ptr a -> String -> IO (ForeignPtr (Ptr a))
wrapNonNull ptr msg = if (ptr == nullPtr)
                      then error msg
                      else do
                        pptr <- malloc
                        poke pptr ptr
                        FC.newForeignPtr pptr (return ())


toGlobalEventHandlerPrim :: GlobalEventHandlerF -> IO (FunPtr GlobalEventHandlerPrim)
toGlobalEventHandlerPrim f = mkGlobalEventHandlerPtr
                             (\eventNumber ->
                                let event = cToEnum (eventNumber :: CInt)
                                in f event >>= return . fromIntegral)

toGlobalCallbackPrim :: GlobalCallback -> IO (FunPtr CallbackPrim)
toGlobalCallbackPrim f = mkCallbackPtr (\_ -> f)

toDrawCallback :: DrawCallback -> IO (FunPtr DrawCallbackPrim)
toDrawCallback f = mkDrawCallbackPrimPtr
                   (\string' length' x' y' -> do
                      str' <- peekCStringLen (string', fromIntegral length')
                      f str' (Position (X (fromIntegral x')) (Y (fromIntegral y'))))

toBoxDrawF :: BoxDrawFPrim -> BoxDrawF
toBoxDrawF boxDrawPrim =
    (\r c ->
       let (x_pos,y_pos,width,height) = fromRectangle r
           colorPrim = cFromColor c
       in
         boxDrawPrim ((fromIntegral x_pos) :: CInt)
                     ((fromIntegral y_pos) :: CInt)
                     ((fromIntegral width) :: CInt)
                     ((fromIntegral height) :: CInt)
                     colorPrim
    )

toBoxDrawFPrim :: BoxDrawF -> BoxDrawFPrim
toBoxDrawFPrim f =
    (\xPrim yPrim wPrim hPrim colorPrim ->
       let r = toRectangle (fromIntegral xPrim,
                            fromIntegral yPrim,
                            fromIntegral wPrim,
                            fromIntegral hPrim)
           c = cToColor colorPrim
       in
           f r c)

toTextModifyCbPrim :: TextModifyCb -> IO (FunPtr TextModifyCbPrim)
toTextModifyCbPrim f =
  mkTextModifyCb
    (
      \pos' nInserted' nDeleted' nRestyled' stringPtr _ ->
       peekCString stringPtr >>=
       f (fromIntegral pos')
         (fromIntegral nInserted')
         (fromIntegral nDeleted')
         (fromIntegral nRestyled')
    )

toTextPredeleteCbPrim :: TextPredeleteCb -> IO (FunPtr TextPredeleteCbPrim)
toTextPredeleteCbPrim f =
  mkTextPredeleteCb
    (
      \pos' nDeleted' _ ->
       f (BufferOffset (fromIntegral pos')) (fromIntegral nDeleted')
    )

toUnfinishedStyleCbPrim :: UnfinishedStyleCb -> IO (FunPtr UnfinishedStyleCbPrim)
toUnfinishedStyleCbPrim f =
    mkUnfinishedStyleCbPrim
     (
       \pos' _ -> f (BufferOffset (fromIntegral pos'))
     )

orNullFunPtr :: (a -> IO (FunPtr b)) -> Maybe a -> IO (FunPtr b)
orNullFunPtr = maybe (return nullFunPtr)

arrayToRefs:: (Ptr (Ptr ())) -> Int -> IO [(Ref a)]
arrayToRefs arrayPtr numElements =
    go arrayPtr numElements []
    where
      go _ 0 accum =  return accum
      go currPtr numLeft accum = do
        curr <- peek currPtr
        ref <- toRef curr
        go (currPtr `plusPtr` (sizeOf (undefined :: Ptr (Ptr a))))
           (numLeft - 1)
           (accum ++ [ref])

refOrError :: String -> Ptr () -> IO (Ref b)
refOrError errorMessage p = wrapNonNull p errorMessage >>=
                               return . wrapInRef
toShortcut :: [KeyType] -> FlShortcut
toShortcut =
  fromIntegral .
  sum .
  map
   (\k -> case k of
     (SpecialKeyType sk') -> fromEnum sk'
     (NormalKeyType c') -> fromEnum c'
   )

cToKeyType :: CInt -> KeyType
cToKeyType cint =
  let findSpecialKey = find
                        (\sk -> cint == (fromIntegral $ fromEnum sk))
                        allSpecialKeys
  in
  case findSpecialKey of
    Just sk -> SpecialKeyType sk
    Nothing -> NormalKeyType (toEnum $ fromIntegral cint)

cFromKeyType :: KeyType -> CInt
cFromKeyType kt = case kt of
  SpecialKeyType sk -> fromIntegral $ fromEnum sk
  NormalKeyType nk -> fromIntegral $ fromEnum nk

toRef ::  Ptr () -> IO (Ref a)
toRef ptr = throwStackOnError $
                  do
                    pp <- wrapNonNull ptr "Null Pointer Error"
                    let result = wrapInRef pp
                    return $ result

unsafeToRef :: Ptr () -> (Ref a)
unsafeToRef = Unsafe.unsafePerformIO . toRef

unsafeToCString :: String -> CString
unsafeToCString = Unsafe.unsafePerformIO . newCString

toMaybeRef :: Ptr () -> IO (Maybe (Ref a))
toMaybeRef ptr' = if ptr' == nullPtr then return Nothing else toRef ptr' >>= return . Just

supressWarningAboutRes :: a -> ()
supressWarningAboutRes _ = ()

foldl1WithDefault :: a -> (a -> a -> a) -> [a] -> a
foldl1WithDefault emptyCase _ [] = emptyCase
foldl1WithDefault _ f as = foldl1 f as

integralToMaybe :: (Integral a, Integral b) => a -> Maybe b
integralToMaybe n = if (n == 0) then Nothing else (Just $ fromIntegral n)

countDirectionToCChar :: CountDirection -> CChar
countDirectionToCChar d =
  case d of
   CountUp -> 1
   CountDown -> 0

ccharToCountDirection :: CChar -> CountDirection
ccharToCountDirection c = if (c == 0) then CountDown else CountUp

oneKb :: Int
oneKb = 1024

alignmentsToInt :: Alignments -> Int
alignmentsToInt (Alignments aligntypes') = combine aligntypes'
intToAlignments :: Int -> Alignments
intToAlignments = Alignments . extract allAlignTypes . fromIntegral

menuItemFlagsToInt :: MenuItemFlags -> Int
menuItemFlagsToInt (MenuItemFlags menuItemFlags') = combine menuItemFlags'
intToMenuItemFlags :: Int -> MenuItemFlags
intToMenuItemFlags = MenuItemFlags . extract allMenuItemFlags . fromIntegral

withByteStrings :: [B.ByteString] -> (Ptr (Ptr CChar) -> IO a) -> IO a
withByteStrings bs f = B.useAsCString (foldl1 B.append bs) (\ptr -> new ptr >>= f)

withPixmap :: PixmapHs -> ((Ptr (Ptr CChar)) -> IO a) -> IO a
withPixmap (PixmapHs pixmap) f = withByteStrings pixmap f

withBitmap :: BitmapHs -> ((Ptr CChar) -> Int -> Int -> IO a) -> IO a
withBitmap (BitmapHs bitmap (Size (Width width') (Height height'))) f =
   B.useAsCString
     bitmap
     (\ptr -> f ptr width' height')

withStrings :: [String] -> (Ptr (Ptr CChar) -> IO a) -> IO a
withStrings ss f = withByteStrings (map C.pack ss) f
