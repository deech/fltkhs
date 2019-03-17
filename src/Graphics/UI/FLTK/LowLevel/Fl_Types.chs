{-# LANGUAGE CPP, EmptyDataDecls, ExistentialQuantification #-}

#ifdef CALLSTACK_AVAILABLE
{-# LANGUAGE ImplicitParams #-}
#endif

module Graphics.UI.FLTK.LowLevel.Fl_Types where
#include "Fl_Types.h"
#include "Fl_Text_EditorC.h"
#include "FL/platform_types.h"
import Foreign
import Foreign.C hiding (CClock)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import qualified Foreign.ForeignPtr.Unsafe as Unsafe
import Debug.Trace
import Control.Exception
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import qualified Data.Text as T
#if defined(CALLSTACK_AVAILABLE) || defined(HASCALLSTACK_AVAILABLE)
import GHC.Stack
#endif
import qualified Data.ByteString as B
#c
  enum SliderType {
    VertSliderType = FL_VERT_SLIDER,
    HorSliderType = FL_HOR_SLIDER,
    VertFillSliderType = FL_VERT_FILL_SLIDER,
    HorFillSliderType = FL_HOR_FILL_SLIDER,
    VertNiceSliderType = FL_VERT_NICE_SLIDER,
    HorNiceSliderType = FL_HOR_NICE_SLIDER
  };
  enum ScrollbarType {
    VertScrollbar = FL_VERT_SLIDER,
    HorScrollbar = FL_HOR_SLIDER
  };
  enum BrowserType {
    NormalBrowserType = FL_NORMAL_BROWSER,
    SelectBrowserType = FL_SELECT_BROWSER,
    HoldBrowserType = FL_HOLD_BROWSER,
    MultiBrowserType = FL_MULTI_BROWSER
  };
  enum SortType {
    SortAscending = FL_SORT_ASCENDING,
    SortDescending = FL_SORT_DESCENDING
  };
  enum FileBrowserType {
    FileBrowserFiles = FL_FILE_BROWSER_FILES,
    FileBrowserDirectories = FL_FILE_BROWSER_DIRECTORIES,
  };
  enum FileIconType {
 FileIconAny = FL_FILE_ICON_ANY,
 FileIconPlain = FL_FILE_ICON_PLAIN,
 FileIconFifo = FL_FILE_ICON_FIFO,
 FileIconDevice = FL_FILE_ICON_DEVICE,
 FileIconLink = FL_FILE_ICON_LINK,
 FileIconDirectory = FL_FILE_ICON_DIRECTORY
  };
  enum FileIconProps {
 FileIconEnd = FL_FILE_ICON_END,
 FileIconColor = FL_FILE_ICON_COLOR,
 FileIconLine = FL_FILE_ICON_LINE,
 FileIconClosedline = FL_FILE_ICON_CLOSEDLINE,
 FileIconPolygon = FL_FILE_ICON_POLYGON,
 FileIconOutlinepolygon = FL_FILE_ICON_OUTLINEPOLYGON,
 FileIconVertex = FL_FILE_ICON_VERTEX
  };
  enum FileChooserType {
 FileChooserSingle = FL_FILE_CHOOSER_SINGLE,
 FileChooserMulti = FL_FILE_CHOOSER_MULTI,
 FileChooserCreate = FL_FILE_CHOOSER_CREATE,
 FileChooserDirectory = FL_FILE_CHOOSER_DIRECTORY
  };
  enum ButtonType{
   NormalButtonType = FL_NORMAL_BUTTON,
   ToggleButtonType = FL_TOGGLE_BUTTON,
   RadioButtonType = FL_RADIO_BUTTON,
   HiddenButtonType = FL_HIDDEN_BUTTON
  };
  enum TreeReasonType {
    TreeReasonNone = FL_TREE_REASON_NONE,
    TreeReasonSelected = FL_TREE_REASON_SELECTED,
    TreeReasonDeselected = FL_TREE_REASON_DESELECTED,
    TreeReasonReselected = FL_TREE_REASON_RESELECTED,
    TreeReasonOpened = FL_TREE_REASON_OPENED,
    TreeReasonClosed = FL_TREE_REASON_CLOSED,
    TreeReasonDragged = FL_TREE_REASON_DRAGGED
  };
  enum MenuItemFlag{
     MenuItemNormal = 0,
     MenuItemInactive = FL_MENU_INACTIVE,
     MenuItemToggle = FL_MENU_TOGGLE,
     MenuItemValue = FL_MENU_VALUE,
     MenuItemRadio = FL_MENU_RADIO,
     MenuItemInvisible = FL_MENU_INVISIBLE,
     SubmenuPointer = FL_SUBMENU_POINTER,
     Submenu = FL_SUBMENU,
     MenuItemDivider = FL_MENU_DIVIDER,
     MenuItemHorizontal = FL_MENU_HORIZONTAL
  };
  enum ScrollbarMode {
    HorizontalScrollBar = HORIZONTAL,
    VerticalScrollBar = VERTICAL,
    BothScrollBar = BOTH,
    AlwaysOnScrollBar = ALWAYS_ON,
    HorizontalAlwaysScrollBar = HORIZONTAL_ALWAYS,
    VerticalAlwaysScrollBar = VERTICAL_ALWAYS,
    BothAlwaysScrollBar = BOTH_ALWAYS
  };
  enum CursorType {
    NormalCursor = NORMAL_CURSOR,
    CaretCursor = CARET_CURSOR,
    DimCursor = DIM_CURSOR,
    BlockCursor = BLOCK_CURSOR,
    HeavyCursor = HEAVY_CURSOR,
    SimpleCursor = SIMPLE_CURSOR
  };
  enum PositionType {
    CursorPos = CURSOR_POS,
    CharacterPos = CHARACTER_POS
  };
  enum DragType {
    DragNone = DRAG_NONE,
    DragStartDnd = DRAG_START_DND,
    DragChar = DRAG_CHAR,
    DragWord = DRAG_WORD,
    DragLine = DRAG_LINE
  };
  enum WrapTypeFl {
    WrapNoneFl = WRAP_NONE,
    WrapAtColumnFl = WRAP_AT_COLUMN,
    WrapAtPixelFl = WRAP_AT_PIXEL,
    WrapAtBoundsFl = WRAP_AT_BOUNDS
  };
  enum PageFormat {
    A0 = 0,
    A1 = 1,
    A2 = 2,
    A3 = 3,
    A4 = 4,
    A5 = 5,
    A6 = 6,
    A7 = 7,
    A8 = 8,
    A9 = 9,
    B0 = 10,
    B1 = 11,
    B2 = 12,
    B3 = 13,
    B4 = 14,
    B5 = 15,
    B6 = 16,
    B7 = 17,
    B8 = 18,
    B9 = 19,
    B10 = 20,
    C5E = 21,
    DLE = 22,
    Executive = EXECUTIVE,
    Folio = FOLIO,
    Ledger = LEDGER,
    Legal = LEGAL,
    Letter = LETTER,
    Tabloid = TABLOID,
    Envelope = ENVELOPE,
    Media = MEDIA
  };
  enum PageLayout {
    Portrait = PORTRAIT,
    Landscape = LANDSCAPE,
    Reversed = REVERSED,
    Orientation = ORIENTATION
  };
  typedef struct KeyBinding {
    int key;
    int state;
    fl_Key_Func* function;
  } KeyBinding;
  enum TableRowSelectMode {
     SelectNone = SELECT_NONEC,
     SelectSingle = SELECT_SINGLEC,
     SelectMulti = SELECT_MULTIC
  };
  enum TableContext {
     ContextNone = CONTEXT_NONEC,
     ContextStartPage = CONTEXT_STARTPAGEC,
     ContextEndPage = CONTEXT_ENDPAGEC,
     ContextRowHeader = CONTEXT_ROW_HEADERC,
     ContextColHeader = CONTEXT_COL_HEADERC,
     ContextCell = CONTEXT_CELLC,
     ContextTable = CONTEXT_TABLEC,
     ContextRCResize = CONTEXT_RC_RESIZEC
  };
  enum LinePosition {
    LinePositionTop = TOP,
    LinePositionMiddle = MIDDLE,
    LinePositionBottom = BOTTOM
  };
  enum PackType {
    PackVertical = PACK_VERTICAL,
    PackHorizontal = PACK_HORIZONTAL
  };
  enum ColorChooserMode {
    RgbMode = 0,
    ByteMode = 1,
    HexMode = 2,
    HsvMode = 3
  };
#endc
{#enum SliderType {} deriving (Show, Eq, Ord) #}
{#enum ScrollbarType {} deriving (Show, Eq, Ord) #}
{#enum BrowserType {} deriving (Show, Eq, Ord) #}
{#enum SortType {} deriving (Show, Eq, Ord) #}
{#enum FileBrowserType {} deriving (Show, Eq, Ord) #}
{#enum FileIconType {} deriving (Show, Eq, Ord) #}
{#enum FileIconProps {} deriving (Show, Eq, Ord) #}
{#enum FileChooserType {} deriving (Show, Eq, Ord) #}
{#enum ButtonType {} deriving (Show, Eq, Ord) #}
{#enum TreeReasonType {} deriving (Show, Eq, Ord) #}
{#enum MenuItemFlag {} deriving (Show, Eq, Ord) #}
{#enum ColorChooserMode {} deriving (Show, Eq, Ord) #}
newtype MenuItemFlags = MenuItemFlags [MenuItemFlag] deriving (Eq, Show, Ord)
allMenuItemFlags :: [MenuItemFlag]
allMenuItemFlags =
  [
     MenuItemInactive,
     MenuItemToggle,
     MenuItemValue,
     MenuItemRadio,
     MenuItemInvisible,
     SubmenuPointer,
     Submenu,
     MenuItemDivider,
     MenuItemHorizontal
  ]
{#enum CursorType {} deriving (Show, Eq, Ord) #}
{#enum PositionType {} deriving (Show, Eq, Ord) #}
{#enum DragType {} deriving (Show, Eq, Ord) #}
{#enum WrapTypeFl {} deriving (Show, Eq, Ord) #}
data WrapType = WrapNone | WrapAtColumn ColumnNumber | WrapAtPixel PixelPosition | WrapAtBounds deriving (Eq, Show, Ord)
{#enum PageFormat {} deriving (Show, Eq, Ord) #}
{#enum PageLayout {} deriving (Show, Eq, Ord) #}
{#enum TableRowSelectMode {} deriving (Show, Eq, Ord)  #}
{#enum TableContext {} deriving (Show, Eq, Ord) #}
{#enum LinePosition {} deriving (Show, Eq, Ord)  #}
{#enum ScrollbarMode {} deriving (Show, Eq, Ord) #}
data StyleTableEntry = StyleTableEntry (Maybe Color) (Maybe Font) (Maybe FontSize) deriving (Eq, Show, Ord)
{#enum PackType{} deriving (Show, Eq, Ord) #}
type FlShortcut      = {#type Fl_Shortcut #}
type FlColor         = {#type Fl_Color #}
type FlFont          = {#type Fl_Font #}
type FlAlign         = {#type Fl_Align #}
type LineDelta       = Maybe Int
type Delta           = Maybe Int
type FlIntPtr        = {#type fl_intptr_t #}
type FlUIntPtr       = {#type fl_uintptr_t#}
type ID              = {#type ID#}
type Fl_Offscreen = {#type Fl_Offscreen #}
type Fl_Socket = {#type FL_SOCKET #}
type Fl_Bitmask = {#type Fl_Bitmask #}
type Fl_Region = {#type Fl_Region #}
newtype WindowHandle = WindowHandle (Ptr ())

newtype NumInserted = NumInserted Int deriving (Show, Eq, Ord)
newtype NumDeleted = NumDeleted Int deriving (Show, Eq, Ord)
newtype NumRestyled = NumRestyled Int deriving (Show, Eq, Ord)
newtype DeletedText = DeletedText T.Text deriving (Show, Eq, Ord)

data Ref a           = Ref !(ForeignPtr (Ptr ())) deriving (Eq, Show, Ord)
data FunRef          = FunRef !(FunPtr ())
-- * The FLTK widget hierarchy
data CBase parent
type Base = CBase ()

type GlobalCallback              = IO ()
type CallbackWithUserDataPrim    = Ptr () -> Ptr () -> IO ()
type CallbackPrim                = Ptr () -> IO ()
type CustomColorAveragePrim    = Ptr () -> CUInt -> CFloat -> IO ()
type CustomImageDrawPrim       = Ptr () -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> IO ()
type CustomImageCopyPrim       = Ptr () -> CInt -> CInt -> IO (Ptr ())
type GlobalEventHandlerPrim      = CInt -> IO CInt
type GlobalEventHandlerF         = Event -> IO Int
type DrawCallback                = T.Text -> Position -> IO ()
type DrawCallbackPrim            = CString -> CInt -> CInt -> CInt -> IO ()
type TextBufferCallback          = FunPtr (Ptr () -> IO ())
type FileChooserCallback         = FunPtr (Ptr () -> Ptr () -> IO())
type SharedImageHandler          = FunPtr (CString -> CUChar -> CInt -> Ptr ())
type BoxDrawF                    = Rectangle -> Color -> IO ()
type BoxDrawFPrim                = CInt -> CInt -> CInt -> CInt -> FlColor -> IO ()
type FDHandlerPrim               = Fl_Socket -> Ptr () -> IO ()
type FDHandler                   = FlSocket -> IO ()
type TextModifyCb                = AtIndex -> NumInserted -> NumDeleted -> NumRestyled -> DeletedText -> IO ()
type TextModifyCbPrim            = CInt -> CInt -> CInt -> CInt -> Ptr CChar -> Ptr () -> IO ()
type TextPredeleteCb             = AtIndex -> NumDeleted -> IO ()
type TextPredeleteCbPrim         = CInt -> CInt -> Ptr () -> IO ()
type UnfinishedStyleCb           = AtIndex -> IO ()
type UnfinishedStyleCbPrim       = CInt -> Ptr () -> IO ()
type MenuItemDrawF               = Ptr () -> CInt -> CInt -> CInt -> CInt -> Ptr () -> CInt -> IO ()
type TabPositionsPrim            = Ptr () -> Ptr CInt -> Ptr CInt -> IO CInt
type TabHeightPrim               = Ptr () -> IO CInt
type TabWhichPrim                = Ptr () -> CInt -> CInt -> IO (Ptr ())
type TabClientAreaPrim           = Ptr () -> Ptr CInt -> Ptr CInt ->  Ptr CInt -> Ptr CInt -> CInt -> IO ()
type GetDoublePrim               = Ptr () -> IO (CDouble)
type GetIntPrim                  = Ptr () -> IO CInt
type SetIntPrim                  = Ptr () -> CInt -> IO ()
type ColorSetPrim                = Ptr () -> CDouble -> CDouble -> CDouble -> IO CInt
type DestroyCallbacksPrim        = Ptr () -> Ptr () -> IO ()

newtype Width = Width Int deriving (Eq, Show, Ord)
newtype Height = Height Int deriving (Eq, Show, Ord)
newtype PreciseWidth = PreciseWidth Double deriving (Eq, Show, Ord)
newtype PreciseHeight = PreciseHeight Double deriving (Eq, Show, Ord)
newtype Depth = Depth Int deriving (Eq, Show, Ord)
newtype LineSize = LineSize Int deriving (Eq, Show, Ord)
newtype X = X Int deriving (Eq, Show, Ord)
newtype PreciseX = PreciseX Double deriving (Eq, Show, Ord)
newtype Y = Y Int deriving (Eq, Show, Ord)
newtype PreciseY = PreciseY Double deriving (Eq, Show, Ord)
newtype ByX = ByX Double deriving (Eq, Show, Ord)
newtype ByY = ByY Double deriving (Eq, Show, Ord)
newtype Angle = Angle CShort deriving (Eq, Show, Ord)
newtype PreciseAngle = PreciseAngle Double deriving (Eq, Show, Ord)
data Position = Position X Y deriving (Eq, Show, Ord)
data PrecisePosition = PrecisePosition PreciseX PreciseY deriving (Eq, Show, Ord)
data CountDirection = CountUp | CountDown deriving (Eq, Show, Ord)
data DPI = DPI Float Float deriving (Eq, Show, Ord)
newtype TextDisplayStyle = TextDisplayStyle CInt deriving (Eq, Show, Ord)
data IndexRange = IndexRange AtIndex AtIndex deriving (Eq, Show, Ord)
statusToIndexRange :: (Ptr CInt -> Ptr CInt -> IO Int) -> IO (Maybe IndexRange)
statusToIndexRange f =
  alloca $ \start' ->
  alloca $ \end' ->
  f start' end' >>= \status' ->
  case status' of
    0 -> return Nothing
    _ -> do
      start'' <- peekIntConv start'
      end'' <- peekIntConv end'
      return (Just (IndexRange (AtIndex start'') (AtIndex end'')))

data ColorChooserRGB = Decimals (Between0And1, Between0And1, Between0And1) | Words RGB deriving (Eq, Show, Ord)
data Rectangle = Rectangle { rectanglePosition :: Position , rectangleSize :: Size } deriving (Eq, Show, Ord)
data ByXY = ByXY ByX ByY deriving (Eq, Show, Ord)
data Intersection = Contained | Partial deriving (Eq, Show, Ord)
data Size = Size Width Height deriving (Eq, Show, Ord)
data PreciseSize = PreciseSize PreciseWidth PreciseHeight deriving (Eq, Show, Ord)
newtype Lines = Lines Int deriving (Eq,Show,Ord)
newtype LineNumber = LineNumber Int deriving (Eq,Show,Ord)
newtype ColumnNumber = ColumnNumber Int deriving (Eq, Show, Ord)
newtype PixelPosition = PixelPosition Int deriving (Eq,Show,Ord)
newtype AtIndex = AtIndex Int deriving (Eq,Show,Ord)
newtype Rows = Rows Int deriving (Eq,Show,Ord)
newtype Columns = Columns Int deriving (Eq,Show,Ord)
data KeyType = SpecialKeyType SpecialKey | NormalKeyType Char deriving (Eq, Show, Ord)
data ShortcutKeySequence = ShortcutKeySequence [EventState] KeyType deriving (Eq, Show, Ord)
data Shortcut = KeySequence ShortcutKeySequence | KeyFormat T.Text deriving (Eq, Show, Ord)
data KeyBindingKeySequence = KeyBindingKeySequence (Maybe [EventState]) KeyType deriving (Eq, Show, Ord)
newtype Between0And1 = Between0And1 Double deriving (Eq, Show, Ord)
newtype Between0And6 = Between0And6 Double deriving (Eq, Show, Ord)
data ScreenLocation = Intersect Rectangle
                    | ScreenNumber Int
                    | ScreenPosition Position deriving (Eq, Show, Ord)
newtype FontSize = FontSize CInt deriving (Eq, Show, Ord)
newtype PixmapHs = PixmapHs [T.Text] deriving (Eq, Show, Ord)
data BitmapHs = BitmapHs B.ByteString Size deriving (Eq, Show, Ord)
data Clipboard = InternalClipboard | SharedClipboard deriving (Eq, Show, Ord)
data OutOfRangeOrNotSubmenu = OutOfRangeOrNotSubmenu deriving (Eq, Show, Ord)
-- | The type of 'Fl_Offscreen' varies wildly from platform to platform. Feel free to examine the insides when debugging
-- but any computation based on it will probably not be portable.
newtype FlOffscreen = FlOffscreen Fl_Offscreen
newtype FlBitmask = FlBitmask Fl_Bitmask
newtype FlRegion = FlRegion Fl_Region
newtype FlSocket = FlSocket Fl_Socket
#if GLSUPPORT
type Fl_GlContext = {#type GLContext #}
newtype FlGlContext = FlGlContext Fl_GlContext
#endif
successOrOutOfRangeOrNotSubmenu :: Int -> Either OutOfRangeOrNotSubmenu ()
successOrOutOfRangeOrNotSubmenu status = if (status == (-1)) then Left OutOfRangeOrNotSubmenu else Right ()
data AwakeRingFull = AwakeRingFull deriving (Eq, Show, Ord)
successOrAwakeRingFull :: Int -> Either AwakeRingFull ()
successOrAwakeRingFull status = if (status == (-1)) then Left AwakeRingFull else Right ()
data UnknownEvent = UnknownEvent deriving (Eq, Show, Ord)
successOrUnknownEvent :: Int -> Either UnknownEvent ()
successOrUnknownEvent status = if (status == 0) then Left UnknownEvent else Right ()
data UnknownError = UnknownError deriving (Eq, Show, Ord)
successOrUnknownError :: a -> Int -> Either UnknownError a
successOrUnknownError a result = if (result == 0) then (Left UnknownError) else (Right a)
data NotFound = NotFound deriving (Eq, Show, Ord)
data OutOfRange = OutOfRange deriving (Eq, Show, Ord)
successOrOutOfRange :: a -> Bool -> (a -> IO b) -> IO (Either OutOfRange b)
successOrOutOfRange a pred' tr = if pred' then return (Left OutOfRange) else tr a >>= return . Right
data NoChange = NoChange deriving (Eq, Show, Ord)
successOrNoChange :: Int -> Either NoChange ()
successOrNoChange status = if (status == 0) then Left NoChange else Right ()
data DataProcessingError = NoDataProcessedError | PartialDataProcessedError | UnknownDataError Int
successOrDataProcessingError :: Int -> Either DataProcessingError ()
successOrDataProcessingError status = case status of
  0 -> Right ()
  1 -> Left NoDataProcessedError
  2 -> Left PartialDataProcessedError
  x -> Left $ UnknownDataError x
newtype PreferredSize = PreferredSize Int deriving (Eq, Show, Ord)
newtype GapSize = GapSize Int deriving (Eq, Show, Ord)
data DrawShortcut = NormalDrawShortcut | ElideAmpersandDrawShortcut deriving (Eq,Show,Ord)
data ResolveImageLabelConflict = ResolveImageLabelOverwrite | ResolveImageLabelDoNothing deriving (Show)
data MultiLabelShrinkError = MultiLabelShrinkError deriving Show
toRectangle :: (Int,Int,Int,Int) -> Rectangle
toRectangle (x_pos, y_pos, width, height) =
    Rectangle (Position
               (X x_pos)
               (Y y_pos))
              (Size
               (Width width)
               (Height height))

fromRectangle ::  Rectangle -> (Int,Int,Int,Int)
fromRectangle (Rectangle (Position
                          (X x_pos)
                          (Y y_pos))
                         (Size
                          (Width width)
                          (Height height))) =
              (x_pos, y_pos, width, height)

toSize :: (Int, Int) -> Size
toSize (width', height') = Size (Width width') (Height height')

toPosition :: (Int,Int) -> Position
toPosition (xPos', yPos') = Position (X xPos') (Y yPos')

toPrecisePosition :: Position -> PrecisePosition
toPrecisePosition (Position (X xPos') (Y yPos')) =
  PrecisePosition
    (PreciseX (fromIntegral xPos'))
    (PreciseY (fromIntegral yPos'))

toPreciseSize :: Size -> PreciseSize
toPreciseSize (Size (Width w) (Height h)) =
  PreciseSize
    (PreciseWidth (fromIntegral w))
    (PreciseHeight (fromIntegral h))

throwStackOnError :: IO a -> IO a
throwStackOnError f =
  f `catch` throwStack
  where
  throwStack :: SomeException -> IO b
  throwStack e = traceStack (show e) $ error ""

withForeignPtrs :: [ForeignPtr a] -> ([Ptr a] -> IO c) -> IO c
withForeignPtrs fptrs io = do
  let ptrs = map Unsafe.unsafeForeignPtrToPtr fptrs
  r <- io ptrs
  mapM_ touchForeignPtr fptrs
  return r

#ifdef CALLSTACK_AVAILABLE
toRefPtr :: (?loc :: CallStack) => Ptr (Ptr a) -> IO (Ptr a)
#elif defined(HASCALLSTACK_AVAILABLE)
toRefPtr :: HasCallStack => Ptr (Ptr a) -> IO (Ptr a)
#else
toRefPtr :: Ptr (Ptr a) -> IO (Ptr a)
#endif
toRefPtr ptrToRefPtr = do
  refPtr <- peek ptrToRefPtr
  if (refPtr == nullPtr)
#ifdef CALLSTACK_AVAILABLE
   then error $ "Ref does not exist. " ++ (showCallStack ?loc)
#elif defined(HASCALLSTACK_AVAILABLE)
   then error $ "Ref does not exist. " ++ (prettyCallStack callStack)
#else
   then error "Ref does not exist. "
#endif
   else return refPtr

#ifdef CALLSTACK_AVAILABLE
withRef :: (?loc :: CallStack) => Ref a -> (Ptr b -> IO c) -> IO c
#elif defined(HASCALLSTACK_AVAILABLE)
withRef :: HasCallStack => Ref a -> (Ptr b -> IO c) -> IO c
#else
withRef :: Ref a -> (Ptr b -> IO c) -> IO c
#endif
withRef (Ref fptr) f =
   throwStackOnError $
     withForeignPtr fptr
       (\ptrToRefPtr -> do
           refPtr <- toRefPtr ptrToRefPtr
           f (castPtr refPtr)
       )

isNull :: Ref a -> IO Bool
isNull (Ref fptr) =
  withForeignPtr fptr
   (\ptrToRefPtr -> do
        refPtr <- peek ptrToRefPtr
        return (refPtr == nullPtr)
   )

#ifdef CALLSTACK_AVAILABLE
unsafeRefToPtr :: (?loc :: CallStack) => Ref a -> IO (Ptr ())
#elif defined(HASCALLSTACK_AVAILABLE)
unsafeRefToPtr :: HasCallStack => Ref a -> IO (Ptr ())
#else
unsafeRefToPtr :: Ref a -> IO (Ptr ())
#endif
unsafeRefToPtr (Ref fptr) =
    throwStackOnError $ do
      refPtr <- toRefPtr $ Unsafe.unsafeForeignPtrToPtr fptr
      return $ castPtr refPtr

#ifdef CALLSTACK_AVAILABLE
withRefs :: (?loc :: CallStack) => [Ref a] -> (Ptr (Ptr b) -> IO c) -> IO c
#elif HASCALLSTACK_AVAILABLE
withRefs :: HasCallStack => [Ref a] -> (Ptr (Ptr b) -> IO c) -> IO c
#else
withRefs :: [Ref a] -> (Ptr (Ptr b) -> IO c) -> IO c
#endif
withRefs refs f =
  throwStackOnError
  $ withForeignPtrs
        (map (\(Ref fptr) -> fptr) refs)
        (\ptrToRefPtrs -> do
           refPtrs <- mapM toRefPtr ptrToRefPtrs
           arrayPtr <- newArray refPtrs
           f (castPtr arrayPtr)
        )

withMaybeRef :: Maybe (Ref a) -> (Ptr () -> IO c) -> IO c
withMaybeRef (Just o) f = withRef o f
withMaybeRef Nothing f = f (castPtr nullPtr)

swapRef :: Ref a -> (Ptr b -> IO (Ptr ())) -> IO ()
swapRef ref@(Ref fptr) f = do
   result <- withRef ref f
   withForeignPtr fptr $ \p -> poke p result

wrapInRef :: ForeignPtr (Ptr ()) -> Ref a
wrapInRef = Ref . castForeignPtr

toFunRef :: FunPtr a -> FunRef
toFunRef fptr = FunRef $ castFunPtr fptr

fromFunRef :: FunRef -> (FunPtr ())
fromFunRef (FunRef f) = castFunPtr f

refPtrEquals :: Ref a -> Ref b -> IO Bool
refPtrEquals w1 w2 = do
  w1Null <- isNull w1
  w2Null <- isNull w2
  if (w1Null || w2Null) then return False
    else withRef w1 (\w1Ptr -> withRef w2 (\w2Ptr -> return (w1Ptr == w2Ptr)))

unpackFunctionPointerToFreeStruct :: Ptr () -> IO (CInt, Ptr (FunPtr (IO ())))
unpackFunctionPointerToFreeStruct fpts = do
  numFps <- {#get Function_Pointers_To_Free->length #} fpts
  fpArray <- {#get Function_Pointers_To_Free->function_pointer_array #} fpts
  return (numFps, fpArray)
