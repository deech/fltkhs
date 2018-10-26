{-# LANGUAGE CPP, OverloadedStrings #-}
#ifdef CALLSTACK_AVAILABLE
{-# LANGUAGE ImplicitParams #-}
#endif

module Graphics.UI.FLTK.LowLevel.Utils where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Data.List
import qualified Data.Text.Foreign as TF
import qualified Data.Text.Encoding as E
import Foreign
import qualified Foreign.Concurrent as FC
import Foreign.C
import qualified Data.ByteString as B
import qualified System.IO.Unsafe as Unsafe
import Debug.Trace
#if defined(CALLSTACK_AVAILABLE) || defined(HASCALLSTACK_AVAILABLE)
import GHC.Stack
#endif

foreign import ccall "wrapper"
        mkWidgetCallbackPtr :: CallbackWithUserDataPrim -> IO (FunPtr CallbackWithUserDataPrim)
foreign import ccall "wrapper"
        mkCallbackPtr :: CallbackPrim -> IO (FunPtr CallbackPrim)
foreign import ccall "wrapper"
        mkCustomColorAveragePtr :: CustomColorAveragePrim -> IO (FunPtr CustomColorAveragePrim)
foreign import ccall "wrapper"
        mkGlobalEventHandlerPtr :: GlobalEventHandlerPrim -> IO (FunPtr GlobalEventHandlerPrim)
foreign import ccall "wrapper"
        mkDrawCallbackPrimPtr :: DrawCallbackPrim -> IO (FunPtr DrawCallbackPrim)
foreign import ccall "wrapper"
        mkCustomImageDrawPrimPtr :: CustomImageDrawPrim -> IO (FunPtr CustomImageDrawPrim)
foreign import ccall "wrapper"
        mkCustomImageCopyPrimPtr :: CustomImageCopyPrim -> IO (FunPtr CustomImageCopyPrim)
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
foreign import ccall "wrapper"
        mkFDHandlerPrim :: FDHandlerPrim -> IO (FunPtr FDHandlerPrim)
foreign import ccall "wrapper"
        mkGlobalCallbackPtr:: GlobalCallback -> IO (FunPtr GlobalCallback)
foreign import ccall "wrapper"
        mkMenuItemDrawFPtr :: MenuItemDrawF -> IO (FunPtr MenuItemDrawF)
foreign import ccall "wrapper"
        mkTabPositionsPrim :: TabPositionsPrim -> IO (FunPtr TabPositionsPrim)
foreign import ccall "wrapper"
        mkTabHeightPrim :: TabHeightPrim -> IO (FunPtr TabHeightPrim)
foreign import ccall "wrapper"
        mkTabWhichPrim :: TabWhichPrim -> IO (FunPtr TabWhichPrim)
foreign import ccall "wrapper"
        mkTabClientAreaPrim :: TabClientAreaPrim -> IO (FunPtr TabClientAreaPrim)
foreign import ccall "wrapper"
        mkGetDouble :: GetDoublePrim -> IO (FunPtr GetDoublePrim)
foreign import ccall "wrapper"
        mkGetInt :: GetIntPrim -> IO (FunPtr GetIntPrim)
foreign import ccall "wrapper"
        mkSetInt :: SetIntPrim -> IO (FunPtr SetIntPrim)
foreign import ccall "wrapper"
        mkColorSetPrim :: ColorSetPrim -> IO (FunPtr ColorSetPrim)

toTabPositionsPrim :: (Ref a -> IO (Maybe AtIndex, Int, [(X,Width)])) -> IO (FunPtr TabPositionsPrim)
toTabPositionsPrim f =
  mkTabPositionsPrim (\tabPtr posPtr widthPtr -> do
                          pp <- wrapNonNull tabPtr "Null pointer. toTabPositionsPrim"
                          (selected, padding, posAndWidths) <- f (castTo (wrapInRef pp))
                          pokeArray posPtr ([fromIntegral padding] ++ (map (\(X x,_) -> fromIntegral x) posAndWidths))
                          pokeArray widthPtr (map (\(_,Width w) -> fromIntegral w) posAndWidths)
                          maybe (return (0 :: CInt)) (\(AtIndex i) -> return (fromIntegral i)) selected
                      )

toTabHeightPrim ::
  (Ref a -> IO Height) ->
  IO (FunPtr TabHeightPrim)
toTabHeightPrim f =
  mkTabHeightPrim (\ptr -> do
                       pp <- wrapNonNull ptr "Null pointer. toTabHeightPrim"
                       (Height res) <- f (castTo (wrapInRef pp))
                       return (fromIntegral res)
                   )

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
cToBool :: (Eq a, Num a, Ord a) => a -> Bool
cToBool status =
  if (status > 0)
  then True
  else False

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
masks compoundCode code = (compoundCode .&. code) == code

keySequenceToCInt :: [EventState] -> KeyType -> CInt
keySequenceToCInt modifiers char =
  let charCode = case char of
        SpecialKeyType c' -> fromIntegral $ fromEnum c'
        NormalKeyType c' -> fromIntegral $ castCharToCChar c'
    in (fromIntegral $ combine modifiers) + charCode

cIntToKeySequence :: CInt -> Maybe ShortcutKeySequence
cIntToKeySequence i =
  let evs = extract allEventStates i
      masked = (i .&. (fromIntegral $ fromEnum Kb_KeyMask))
      special = map cToEnum $ filter ((==) masked) allShortcutSpecialKeys
  in
    if (i == 0)
    then Nothing
    else if (null special)
         then Just (ShortcutKeySequence evs (NormalKeyType $ toEnum $ fromIntegral masked))
         else Just (ShortcutKeySequence evs (SpecialKeyType $ head special))

#ifdef CALLSTACK_AVAILABLE
wrapNonNull :: (?loc :: CallStack) => Ptr a -> String -> IO (ForeignPtr (Ptr a))
#elif defined(HASCALLSTACK_AVAILABLE)
wrapNonNull :: (HasCallStack) => Ptr a -> String -> IO (ForeignPtr (Ptr a))
#else
wrapNonNull :: Ptr a -> String -> IO (ForeignPtr (Ptr a))
#endif
wrapNonNull ptr msg = if (ptr == nullPtr)
                      then error msg
                      else do
                        pptr <- malloc
                        poke pptr ptr
                        FC.newForeignPtr pptr (free pptr)


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
                      str' <- TF.peekCStringLen (string', fromIntegral length')
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
       cStringToText stringPtr >>= \deletedText ->
       f (AtIndex (fromIntegral pos'))
         (NumInserted (fromIntegral nInserted'))
         (NumDeleted (fromIntegral nDeleted'))
         (NumRestyled (fromIntegral nRestyled'))
         (DeletedText deletedText)
    )

toTextPredeleteCbPrim :: TextPredeleteCb -> IO (FunPtr TextPredeleteCbPrim)
toTextPredeleteCbPrim f =
  mkTextPredeleteCb
    (
      \pos' nDeleted' _ ->
       f (AtIndex (fromIntegral pos')) (NumDeleted (fromIntegral nDeleted'))
    )

toFDHandlerPrim :: FDHandler -> IO (FunPtr FDHandlerPrim)
toFDHandlerPrim f = mkFDHandlerPrim (\fd _ -> f (FlSocket fd))

toUnfinishedStyleCbPrim :: UnfinishedStyleCb -> IO (FunPtr UnfinishedStyleCbPrim)
toUnfinishedStyleCbPrim f =
    mkUnfinishedStyleCbPrim
     (
       \pos' _ -> f (AtIndex (fromIntegral pos'))
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

staticArrayToRefs:: (Ptr ()) -> Int -> IO [(Ref a)]
staticArrayToRefs arrayPtr numElements =
    go arrayPtr numElements []
    where
      go _ 0 accum =  return accum
      go currPtr numLeft accum = do
        let nextPtr = currPtr `plusPtr` (sizeOf (undefined :: Ptr a))
        ref <- toRef currPtr
        go nextPtr
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

unsafeToMaybeRef :: Ptr () -> Maybe (Ref a)
unsafeToMaybeRef = Unsafe.unsafePerformIO . toMaybeRef

unsafeToCString :: T.Text -> CString
unsafeToCString t = Unsafe.unsafePerformIO (copyTextToCString t)

unsafeFromCString :: CString -> T.Text
unsafeFromCString cstring = Unsafe.unsafePerformIO (cStringToText cstring)

#ifdef CALLSTACK_AVAILABLE
cStringToText :: (?loc :: CallStack) => CString -> IO T.Text
#elif defined(HASCALLSTACK_AVAILABLE)
cStringToText :: (HasCallStack) => CString -> IO T.Text
#else
cStringToText :: CString -> IO T.Text
#endif
cStringToText cstring =
    if (cstring == nullPtr) then return ""
    else do
      byteString <- B.packCString cstring
      either (\e -> traceStack (show e) (error ""))
             return
             (E.decodeUtf8' byteString)

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
intToAlignments alignmentCode = Alignments (extract allAlignTypes $ fromIntegral alignmentCode)

menuItemFlagsToInt :: MenuItemFlags -> Int
menuItemFlagsToInt (MenuItemFlags menuItemFlags') = combine menuItemFlags'
intToMenuItemFlags :: Int -> Maybe MenuItemFlags
intToMenuItemFlags flags' =
  if (flags' == 0)
  then Nothing
  else Just $ (MenuItemFlags . extract allMenuItemFlags . fromIntegral) flags'

modesToInt :: Modes -> Int
modesToInt (Modes ms) = combine ms
intToModes :: Int -> Modes
intToModes modeCode = Modes (extract allModes (fromIntegral modeCode))

withPixmap :: PixmapHs -> ((Ptr (Ptr CChar)) -> IO a) -> IO a
withPixmap (PixmapHs strings) f = do
  cStrings <- sequence (map copyTextToCString strings)
  ptr <- newArray cStrings
  f ptr

withBitmap :: BitmapHs -> ((Ptr CChar) -> Int -> Int -> IO a) -> IO a
withBitmap (BitmapHs bitmap (Size (Width width') (Height height'))) f =
   B.useAsCString
     bitmap
     (\ptr -> f ptr width' height')

withStrings :: [T.Text] -> (Ptr (Ptr CChar) -> IO a) -> IO a
withStrings ss f = do
  copies <- mapM
             (
               \s ->
                 B.useAsCStringLen
                   (E.encodeUtf8 s)
                   (
                     \(ptr, len) -> do
                         arrPtr <- mallocArray len
                         copyArray arrPtr ptr len
                         return arrPtr
                   )
             )
             ss
  result <- allocaArray (length copies) f
  mapM_ free copies
  return result

copyByteStringToCString :: B.ByteString -> IO CString
copyByteStringToCString bs =
  B.useAsCStringLen bs
    (\(cstring,len) -> do
        dest <- mallocArray (len+1)
        copyArray dest cstring len
        pokeElemOff dest len (0 :: CChar)
        return dest
    )

copyTextToCString :: T.Text -> IO CString
copyTextToCString t =
  let bs = E.encodeUtf8 t
  in
    copyByteStringToCString bs

withText :: T.Text -> (CString -> IO a) -> IO a
withText t f = B.useAsCString (E.encodeUtf8 t) f

#ifdef CALLSTACK_AVAILABLE
drawShortcutFromC :: (?loc :: CallStack) => CChar -> Maybe DrawShortcut
#elif defined(HASCALLSTACK_AVAILABLE)
drawShortcutFromC :: (HasCallStack) => CChar -> Maybe DrawShortcut
#else
drawShortcutFromC ::  CChar -> Maybe DrawShortcut
#endif
drawShortcutFromC c =
  case c of
    0 -> Nothing
    1 -> Just NormalDrawShortcut
    2 -> Just ElideAmpersandDrawShortcut
    _ -> error "fl_draw_shortcut should be 0,1 or 2."

drawShortcutToC :: Maybe DrawShortcut -> CChar
drawShortcutToC ds =
  case ds of
    Nothing -> 0
    Just NormalDrawShortcut -> 1
    Just ElideAmpersandDrawShortcut -> 2
