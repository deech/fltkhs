{-# LANGUAGE CPP, EmptyDataDecls, ExistentialQuantification #-}
module Graphics.UI.FLTK.LowLevel.Fl_Types where
#include "Fl_Types.h"
#include "Fl_Text_EditorC.h"
import Foreign
import Foreign.C hiding (CClock)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import qualified Foreign.ForeignPtr.Unsafe as Unsafe
import Debug.Trace
import Control.Exception
import qualified Data.ByteString as B
#c
  enum SliderType {
    VertSliderType = FL_VERT_SLIDER,
    HorSliderType = FL_HOR_SLIDER,
    VertFillSlideType = FL_VERT_FILL_SLIDER,
    HorFillSliderType = FL_HOR_FILL_SLIDER,
    VertNiceSliderType = FL_VERT_NICE_SLIDER,
    HorNiceSliderType = FL_HOR_NICE_SLIDER
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
#if FLTK_ABI_VERSION >= 10302
    TreeReasonReselected = FL_TREE_REASON_RESELECTED,
#endif /*FLTK_ABI_VERSION*/
    TreeReasonOpened = FL_TREE_REASON_OPENED,
    TreeReasonClosed = FL_TREE_REASON_CLOSED
  };
  enum MenuProps{
     MenuInactive = FL_MENU_INACTIVE,
     MenuToggle = FL_MENU_TOGGLE,
     MenuValue = FL_MENU_VALUE,
     MenuRadio = FL_MENU_RADIO,
     MenuInvisible = FL_MENU_INVISIBLE,
     SubmenuPointer = FL_SUBMENU_POINTER,
     Submenu = FL_SUBMENU,
     MenuDivider = FL_MENU_DIVIDER,
     MenuHorizontal = FL_MENU_HORIZONTAL
  };
  enum ScrollbarMode {
    Horizontal = HORIZONTAL,
    Vertical = VERTICAL,
    Both = BOTH,
    AlwaysOn = ALWAYS_ON,
    HorizontalAlways = HORIZONTAL_ALWAYS,
    VerticalAlways = VERTICAL_ALWAYS,
    BothAlways = BOTH_ALWAYS
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
  enum WrapType {
    WrapNone = WRAP_NONE,
    WrapAtColumn = WRAP_AT_COLUMN,
    WrapAtPixel = WRAP_AT_PIXEL,
    WrapAtBounds = WRAP_AT_BOUNDS
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
  typedef FL_SOCKET Fl_Socket;
#endc
{#enum SliderType {} deriving (Show, Eq) #}
{#enum BrowserType {} deriving (Show, Eq) #}
{#enum SortType {} deriving (Show, Eq) #}
{#enum FileBrowserType {} deriving (Show, Eq) #}
{#enum FileIconType {} deriving (Show, Eq) #}
{#enum FileIconProps {} deriving (Show, Eq) #}
{#enum FileChooserType {} deriving (Show, Eq) #}
{#enum ButtonType {} deriving (Show, Eq) #}
{#enum TreeReasonType {} deriving (Show, Eq) #}
{#enum MenuProps {} deriving (Show, Eq) #}
{#enum CursorType {} deriving (Show, Eq) #}
{#enum PositionType {} deriving (Show, Eq) #}
{#enum DragType {} deriving (Show, Eq) #}
{#enum WrapType {} deriving (Show, Eq) #}
{#enum PageFormat {} deriving (Show, Eq) #}
{#enum PageLayout {} deriving (Show, Eq) #}
{#enum TableRowSelectMode {} deriving (Show, Eq)  #}
{#enum TableContext {} deriving (Show, Eq) #}
{#enum LinePosition {} deriving (Show, Eq)  #}
{#enum ScrollbarMode {} deriving (Show, Eq) #}
data GLUTproc = GLUTproc {#type GLUTproc#}
newtype GLUTIdleFunction = GLUTIdleFunction (FunPtr (IO ()))
newtype GLUTMenuStateFunction = GLUTMenuStateFunction (FunPtr (CInt -> IO()))
newtype GLUTMenuStatusFunction = GLUTMenuStatusFunction
                                     (FunPtr (CInt -> CInt -> CInt -> IO ()))
{#pointer *Fl_Glut_Bitmap_Font as GlutBitmapFontPtr newtype #}
{#pointer *Fl_Glut_StrokeVertex as GlutStrokeVertexPtr newtype#}
{#pointer *Fl_Glut_StrokeStrip as GlutStrokeStripPtr newtype#}
{#pointer *Fl_Glut_StrokeFont as GlutStrokeFontPtr newtype#}
type FlShortcut           = {#type Fl_Shortcut #}
type FlColor              = {#type Fl_Color #}
type FlFont               = {#type Fl_Font #}
type FlAlign              = {#type Fl_Align #}
type RGB                  = (Word8, Word8, Word8)
type LineDelta            = Maybe Int
type Delta                = Maybe Int
type FlIntPtr             = {#type fl_intptr_t #}
type FlUIntPtr            = {#type fl_uintptr_t#}
type ID                   = {#type ID#}
data Ref a                = Ref !(ForeignPtr (Ptr ())) deriving Show
-- * The FLTK widget hierarchy
data CBase parent
type Base = CBase ()

type GlobalCallback              = IO ()
type CallbackWithUserDataPrim    = Ptr () -> Ptr () -> IO ()
type CallbackPrim                = Ptr () -> IO ()
type ColorAverageCallbackPrim    = Ptr () -> CUInt -> CFloat -> IO ()
type ImageDrawCallbackPrim       = Ptr () -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> IO ()
type ImageCopyCallbackPrim       = Ptr () -> CInt -> CInt -> IO (Ptr ())
type GlobalEventHandlerPrim      = CInt -> IO CInt
type GlobalEventHandlerF         = Event -> IO Int
type DrawCallback                = String -> Position -> IO ()
type DrawCallbackPrim            = CString -> CInt -> CInt -> CInt -> IO ()
type TextBufferCallback          = FunPtr (Ptr () -> IO ())
type UnfinishedStyleCb           = FunPtr (CInt -> Ptr () -> IO ())
type FileChooserCallback         = FunPtr (Ptr () -> Ptr () -> IO())
type SharedImageHandler          = FunPtr (CString -> CUChar -> CInt -> Ptr ())
type BoxDrawF                    = Rectangle -> Color -> IO ()
type BoxDrawFPrim                = CInt -> CInt -> CInt -> CInt -> FlColor -> IO ()

newtype Width = Width Int deriving (Eq, Show)
newtype Height = Height Int deriving (Eq, Show)
newtype Depth = Depth Int
newtype LineSize = LineSize Int
newtype X = X Int deriving (Eq, Show)
newtype Y = Y Int deriving (Eq, Show)
newtype ByX = ByX Double
newtype ByY = ByY Double
newtype Angle = Angle CShort
data Position = Position X Y deriving (Eq,Show)
data CountDirection = CountUp | CountDown
data DPI = DPI Float Float
data Rectangle = Rectangle Position Size deriving (Eq,Show)
data ByXY = ByXY ByX ByY
data Intersection = Contained | Partial
data Size = Size Width Height deriving (Eq, Show)
data KeyType = SpecialKeyType SpecialKey | NormalKeyType Char deriving (Show, Eq)
data ShortcutKeySequence = ShortcutKeySequence [EventState] KeyType
data Shortcut = KeySequence ShortcutKeySequence | KeyFormat String
data ScreenLocation = Intersect Rectangle
                    | ScreenNumber Int
                    | ScreenPosition Position
data CutInput = CutSelection | CutRange Int Int | CutFromCursor Int
newtype FontSize = FontSize CInt
newtype PixmapHs = PixmapHs [B.ByteString]
data BitmapHs = BitmapHs B.ByteString Size
data Clipboard = InternalClipboard | SharedClipboard

data UnknownError = UnknownError
data OutOfRange = OutOfRange deriving Show

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

toRefPtr :: Ptr (Ptr a) -> IO (Ptr a)
toRefPtr ptrToRefPtr = do
  refPtr <- peek ptrToRefPtr
  if (refPtr == nullPtr)
   then error "Ref does not exist"
   else return refPtr

withRef :: Ref a -> (Ptr b -> IO c) -> IO c
withRef (Ref fptr) f =
   throwStackOnError $
     withForeignPtr fptr
       (\ptrToRefPtr -> do
           refPtr <- toRefPtr ptrToRefPtr
           f (castPtr refPtr)
       )

unsafeRefToPtr :: Ref a -> IO (Ptr ())
unsafeRefToPtr (Ref fptr) =
    throwStackOnError $ do
      refPtr <- toRefPtr $ Unsafe.unsafeForeignPtrToPtr fptr
      return $ castPtr refPtr

withRefs :: [Ref a] -> (Ptr (Ptr b) -> IO c) -> IO c
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
