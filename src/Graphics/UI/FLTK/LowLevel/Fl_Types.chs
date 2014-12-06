{-# LANGUAGE CPP #-}
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
  enum Orientation {
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
{#enum BrowserType {}#}
{#enum SortType {}#}
{#enum FileBrowserType {}#}
{#enum FileIconType {}#}
{#enum FileIconProps {}#}
{#enum FileChooserType {}#}
{#enum ButtonType {}#}
{#enum TreeReasonType {}#}
{#enum MenuProps {}#}
{#enum CursorType {}#}
{#enum PositionType {}#}
{#enum DragType {}#}
{#enum WrapType {}#}
{#enum PageFormat {}#}
{#enum PageLayout {}#}
{#enum TableRowSelectMode {} #}
{#enum TableContext {} #}
{#enum LinePosition {} #}
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
data Object a             = Object !(ForeignPtr (Ptr a)) deriving Show
type TManagedPtr a        = CManagedPtr a
data CManagedPtr a        = CManagedPtr
type GlContext            = Object ()
type Region               = Object ()
data CWidget a            = CWidget
type Widget a             = Object (CWidget a)
data CGroup a             = CGroup
type Group a              = Widget (CGroup a)
data CWindow a            = CWindow
type Window a             = Group (CWindow a)
data CLabel a             = CLabel
type Label a              = Object (CLabel a)
data CImage a             = CImage
type Image a              = Object (CImage a)
data CImageSurface a      = CImageSurface
type ImageSurface a       = Object (CImageSurface a)
data CAdjuster a          = CAdjuster
type Adjuster a           = Valuator (CAdjuster a)
data CBitmap a            = CBitmap
type Bitmap a             = Label (CBitmap a)
data CBMPImage a          = CBMPImage
type BMPImage a           = Label (CBMPImage a)
data CBox a               = CBox
type Box a                = Widget (CBox a)
data CBrowserPrim a       = CBrowserPrim
type BrowserPrim a        = Group (CBrowserPrim a)
data CBrowser a           = CBrowser
type Browser a            = BrowserPrim (CBrowser a)
data CButton a            = CButton
type Button a             = Widget (CButton a)
data CCairoWindow a       = CCairoWindow
type CairoWindow a        = DoubleWindow (CCairoWindow a)
data CChart a             = CChart
type Chart a              = Widget (CChart a)
data CCheckBrowser a      = CCheckBrowser
type CheckBrowser a       = Browser (CCheckBrowser a)
data CCheckButton a       = CCheckButton
type CheckButton a        = Button (CCheckButton a)
data CCopySurface a       = CCopySurface
type CopySurface a        = Button (CCopySurface a)
data CMenuPrim a          = CMenuPrim
type MenuPrim a           = Widget (CMenuPrim a)
data CChoice a            = CChoice
type Choice a             = MenuPrim (CChoice a)
data CScrollbar a         = CScrollbar
type Scrollbar a          = Slider (CScrollbar a)
data CClock a             = CClock
type Clock a              = Widget (CClock a)
data CColorChooser a      = CColorChooser
type ColorChooser a       = Group (CColorChooser a)
data CCounter a           = CCounter
type Counter a            = Valuator (CCounter a)
data CDevice a            = CDevice
type Device a             = Object (CDevice a)
data CDial a              = CDial
type Dial a               = Valuator (CDial a)
data CDoubleWindow a      = CDoubleWindow
type DoubleWindow a       = Window (CDoubleWindow a)
data CFileBrowser a       = CFileBrowser
type FileBrowser a        = Browser (CFileBrowser a)
data CFileChooser a       = CFileChooser
type FileChooser a        = Object (CFileChooser a)
data CFileIcon a          = CFileIcon
type FileIcon a           = Object (CFileIcon a)
data CFileInput a         = CFileInput
type FileInput a          = Input (CFileInput a)
data CFillDial a          = CFillDial
type FillDial a           = Dial (CFillDial a)
data CFillSlider a        = CFillSlider
type FillSlider a         = Slider (CFillSlider a)
data CFloatInput a        = CFloatInput
type FloatInput a         = Input (CFloatInput a)
data CGIFImage a          = CGIFImage
type GIFImage a           = Image (CGIFImage a)
data CGlWindow a          = CGlWindow
type GlWindow a           = Window (CGlWindow a)
data CGlutWindow a        = CGlutWindow
type GlutWindow a         = Window (CGlutWindow a)
data CHoldBrowser a       = CHoldBrowser
type HoldBrowser a        = Browser (CHoldBrowser a)
data CHorFillSlider a     = CHorFillSlider
type HorFillSlider a      = Slider (CHorFillSlider a)
data CHorNiceSlider a     = CHorNiceSlider
type HorNiceSlider a      = Slider (CHorNiceSlider a)
data CHorSlider a         = CHorSlider
type HorSlider a          = Slider (CHorSlider a)
data CHorValueSlider a    = CHorValueSlider
type HorValueSlider a     = ValueSlider (CHorValueSlider a)
data CInputChoice a       = CInputChoice
type InputChoice a        = Group (CInputChoice a)
data CInputPrim a         = CInputPrim
type InputPrim a          = Widget (CInputPrim a)
data CInput a             = CInput
type Input a              = InputPrim (CInput a)
data CIntInput a          = CIntInput
type IntInput a           = Input (CIntInput a)
data CJPEGImage a         = CJPEGImage
type JPEGImage a          = Image (CJPEGImage a)
data CLightButton a       = CLightButton
type LightButton a        = Button (CLightButton a)
data CLineDial a          = CLineDial
type LineDial a           = Dial (CLineDial a)
data CMenuButton a        = CMenuButton
type MenuButton a         = MenuPrim (CMenuButton a)
data CMenu a              = CMenu
type Menu a               = MenuPrim (CMenu a)
data CMenuItem a          = CMenuItem
type MenuItem a           = Object (CMenuItem a)
data CMenuWindow a        = CMenuWindow
type MenuWindow a         = SingleWindow (CMenuWindow a)
data CMultiBrowser a      = CMultiBrowser
type MultiBrowser a       = Browser (CMultiBrowser a)
data CMultiLabel a        = CMultiLabel
type MultiLabel a         = Label (CMultiLabel a)
data CMultilineInput a    = CMultilineInput
type MultilineInput a     = Input (CMultilineInput a)
data CMultilineOutput a   = CMultilineOutput
type MultilineOutput a    = Output (CMultilineOutput a)
data CNativeFileChooser a = CNativeFileChooser
type NativeFileChooser a  = Object (CNativeFileChooser a)
data CNiceSlider a        = CNiceSlider
type NiceSlider a         = Slider (CNiceSlider a)
data COutput a            = COutput
type Output a             = Input (COutput a)
data COverlayWindow a     = COverlayWindow
type OverlayWindow a      = DoubleWindow (COverlayWindow a)
data CPack a              = CPack
type Pack a               = Group (CPack a)
data CPagedDevice a       = CPagedDevice
type PagedDevice a        = Object (CPagedDevice a)
data CPixmap a            = CPixmap
type Pixmap a             = Image (CPixmap a)
data CPNGImage a          = CPNGImage
type PNGImage a           = Image (CPNGImage a)
data CPNMImage a          = CPNMImage
type PNMImage a           = Image (CPNMImage a)
data CPreferences a       = CPreferences
type Preferences a        = Object (CPreferences a)
data CPrinter a           = CPrinter
type Printer a            = Object (CPrinter a)
data CProgress a          = CProgress
type Progress a           = Widget (CProgress a)
data CPositioner a        = CPositioner
type Positioner a         = Widget (CPositioner a)
data CRadioButton a       = CRadioButton
type RadioButton a        = Button (CRadioButton a)
data CRadioLightButton a  = CRadioLightButton
type RadioLightButton a   = LightButton (CRadioLightButton a)
data CRadioRoundButton a  = CRadioRoundButton
type RadioRoundButton a   = RoundButton (CRadioRoundButton a)
data CRepeatButton a      = CRepeatButton
type RepeatButton a       = Button (CRepeatButton a)
data CReturnButton a      = CReturnButton
type ReturnButton a       = Button (CReturnButton a)
data CRGBImage a          = CRGBImage
type RGBImage a           = Image (CRGBImage a)
data CRoller a            = CRoller
type Roller a             = Valuator (CRoller a)
data CRoundButton a       = CRoundButton
type RoundButton a        = Button (CRoundButton a)
data CRoundClock a        = CRoundClock
type RoundClock a         = Clock (CRoundClock a)
data CScrollBar a         = CScrollBar
type ScrollBar a          = Slider (CScrollBar a)
data CScroll a            = CScroll
type Scroll a             = Group (CScroll a)
data CSecretInput a       = CSecretInput
type SecretInput a        = Input (CSecretInput a)
data CSelectBrowser a     = CSelectBrowser
type SelectBrowser a      = Browser (CSelectBrowser a)
data CSharedImage a       = CSharedImage
type SharedImage a        = Image (CSharedImage a)
data CSimpleCounter a     = CSimpleCounter
type SimpleCounter a      = Counter (CSimpleCounter a)
data CSingleWindow a      = CSingleWindow
type SingleWindow a       = Window (CSingleWindow a)
data CSlider a            = CSlider
type Slider a             = Valuator (CSlider a)
data CSpinner a           = CSpinner
type Spinner a            = Group (CSpinner a)
data CSysMenuBar a        = CSysMenuBar
type SysMenuBar a         = MenuPrim (CSysMenuBar a)
data CTable a             = CTable
type Table a              = Group (CTable a)
data CTableRow a          = CTableRow
type TableRow a           = Table (CTableRow a)
data CTabs a              = CTabs
type Tabs a               = Group (CTabs a)
data CTextBuffer a        = CTextBuffer
type TextBuffer a         = Object (CTextBuffer a)
data CTextDisplay a       = CTextDisplay
type TextDisplay a        = Group (CTextDisplay a)
data CTextEditor a        = CTextEditor
type TextEditor a         = TextDisplay (CTextEditor a)
data CTextSelection a     = CTextSelection
type TextSelection a      = Object (CTextSelection a)
data CTiledImage a        = CTiledImage
type TiledImage a         = Image (CTiledImage a)
data CTile a              = CTile
type Tile a               = Group (CTile a)
data CTimer a             = CTimer
type Timer a              = Widget (CTimer a)
data CValueTimer a        = CValueTimer
type ValueTimer a         = Timer (CValueTimer a)
data CHiddenTimer a       = CHiddenTimer
type HiddenTimer a        = Timer (CHiddenTimer a)
data CToggleButton a      = CToggleButton
type ToggleButton a       = Button (CToggleButton a)
type ToggleLightButton a  = LightButton a
type ToggleRoundButton a  = RoundButton a
data CTooltip a           = CTooltip
type Tooltip a            = Object (CTooltip a)
data CTree a              = CTree
type Tree a               = Group (CTree a)
data CTreeItem a          = CTreeItem
type TreeItem a           = Object (CTreeItem a)
data CTreePrefs a         = CTreePrefs
type TreePrefs a          = Object (CTreePrefs a)
data CValuator a          = CValuator
type Valuator a           = Widget (CValuator a)
data CValueInput a        = CValueInput
type ValueInput a         = Valuator (CValueInput a)
data CValueOutput a       = CValueOutput
type ValueOutput a        = Valuator (CValueOutput a)
data CValueSlider a       = CValueSlider
type ValueSlider a        = Slider (CValueSlider a)
data CWizard a            = CWizard
type Wizard a             = Group (CWizard a)
data CXBMImage a          = CXBMImage
type XBMImage a           = Image (CXBMImage a)
data CXPMImage a          = CXPMImage
type XPMImage a           = Image (CXPMImage a)

type GlobalCallback              = IO ()
type CallbackWithUserDataPrim    = Ptr () -> Ptr () -> IO ()
type CallbackPrim                = Ptr () -> IO ()
type ColorAverageCallback a      = Image a -> Color -> Float -> IO ()
type ColorAverageCallbackPrim    = Ptr () -> CUInt -> CFloat -> IO ()
type WidgetTransformCallback a b = Object a -> IO (Object b)
type WidgetTransformCallbackPrim = Ptr () -> IO (Ptr ())
type WidgetCallback a            = Object a -> IO ()
type ImageDrawCallback a         = Image a -> Position -> Size -> Maybe X -> Maybe Y -> IO ()
type ImageDrawCallbackPrim       = Ptr () -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> IO ()
type ImageCopyCallback a b       = Image a -> Size -> IO (Image b)
type ImageCopyCallbackPrim       = Ptr () -> CInt -> CInt -> IO (Ptr ())
type RectangleF a                = Widget a -> Rectangle -> IO ()
type RectangleFPrim              = Ptr () -> CInt -> CInt -> CInt -> CInt -> IO ()
type GetWindowF a                = Widget a -> IO (Window ())
type GetPointerF                 = Ptr () -> IO (Ptr ())
type GetGlWindowF a              = Widget a -> IO (GlWindow ())
type GetGroupF a                 = Widget a -> IO (Group ())
type WidgetEventHandlerPrim      = Ptr () -> CInt -> IO CInt
type WidgetEventHandler a        = Widget a -> Event -> IO Int
type GlobalEventHandlerPrim      = CInt -> IO CInt
type GlobalEventHandlerF         = Event -> IO Int
type DrawCallback                = String -> Position -> IO ()
type DrawCallbackPrim            = CString -> CInt -> CInt -> CInt -> IO ()
type TextBufferCallback          = FunPtr (Ptr () -> IO ())
type UnfinishedStyleCb           = FunPtr (CInt -> Ptr () -> IO ())
type FileChooserCallback         = FunPtr (Ptr () -> Ptr () -> IO())
type SharedImageHandler          = FunPtr (CString -> CUChar -> CInt -> Ptr ())
type TableDrawCellF a            = Table a -> TableContext -> Int -> Int -> Rectangle -> IO ()
type TableDrawCellFPrim          = Ptr () -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> CInt -> IO ()
type TableSetIntF a              = Table a -> Int -> IO ()
type TableSetIntFPrim            = Ptr () -> CInt -> IO ()
-- {#pointer *Style_Table_Entry as StyleTableEntryPtr foreign -> StyleTableEntry #}
-- data StyleTableEntry = StyleTableEntry {
--       color :: Color,
--       font :: Font,
--       size :: FontSize,
--       attr :: FontAttribute
--     }
{-
      widgetDraw_ :: FunPtr (WidgetPtr -> IO ())
    , widgetHandle_ :: FunPtr (WidgetPtr -> Event -> IO CInt)
    , widgetResize_ :: FunPtr (WidgetPtr ->
                               CInt ->
			       CInt ->
			       CInt ->
			       CInt ->
			       IO ())
    , widgetShow_ :: FunPtr (WidgetPtr -> IO ())
    , widgetHide_ :: FunPtr (WidgetPtr -> IO ())
    , widgetAsWindow_ :: FunPtr (WidgetPtr -> IO WindowPtr)
    , widgetAsGlWindow_ :: FunPtr (WidgetPtr -> IO GlWindowPtr)
    , widgetAsGroup_ :: FunPtr (WidgetPtr -> IO Group)
    , widgetDestroyData_ :: FunPtr (WidgetPtr -> IO ())
-}

{-
instance Storable StyleTableEntry where
    sizeOf _ = {# sizeof Style_Table_Entry #}
    alignment _ = {# alignof Style_Table_Entry #}
    poke p (StyleTableEntry (Color c) (Font f) (FontSize fs) attr') = do
                                   {#set Style_Table_Entry->color #} p (fromIntegral c)
                                   {#set Style_Table_Entry->font#} p (fromIntegral f)
                                   {#set Style_Table_Entry->size#} p fs
                                   {#set Style_Table_Entry->attr#} p (fromIntegral
                                                                      (cFromFontAttribute attr'))
    peek p  = do
      c    <- {#get Style_Table_Entry->color #} p
      f    <- {#get Style_Table_Entry->font#} p
      fs   <- {#get Style_Table_Entry->size#} p
      attrCode <- {#get Style_Table_Entry->attr#} p
      case (cToFontAttribute (fromIntegral attrCode)) of
        Just attr' -> return $ StyleTableEntry
                               (Color (fromIntegral c))
                               (Font (fromIntegral f))
                               (FontSize fs)
                               attr'
        Nothing -> error $ "Attribute code " ++ (show attrCode) ++ " is invalid."

type KeyFunc = FunPtr (CInt -> TextEditorPtr -> CInt)
{#pointer *Key_BindingC as KeyBindingCPtr foreign -> KeyBinding #}
data KeyBinding = KeyBinding {
      key :: CInt,
      state :: CInt,
      keyFunc :: KeyFunc
    }
{#fun pure unsafe Fl_Text_Editor_num_key_bindings as
      numKeybindings {castPtr `Ptr KeyBindings'} -> `Int' #}
newtype KeyBindings = KeyBindings [KeyBinding]

instance Storable KeyBinding where
    sizeOf _ = {# sizeof Key_BindingC #}
    alignment _ =  {# alignof Key_BindingC #}
    peek p   = do
      key' <- {#get Key_BindingC->key #} p
      state' <- {#get Key_BindingC->state #} p
      function' <- {#get Key_BindingC->function #} p
      return $ KeyBinding key' state' (asCPtr function')
      where
        asCPtr :: FunPtr (CInt -> Ptr () -> IO CInt) -> KeyFunc
        asCPtr = castFunPtr
    poke p (KeyBinding key' state' keyFunc')
        = do
      {#set Key_BindingC->key #} p key'
      {#set Key_BindingC->state #} p state'
      {#set Key_BindingC->function #} p (asCPtr keyFunc')
      {#set Key_BindingC->next #} p nullPtr
       where
         asCPtr :: KeyFunc -> FunPtr (CInt -> Ptr () -> IO CInt)
         asCPtr = castFunPtr

instance Storable KeyBindings where
    sizeOf (KeyBindings bs) = {# sizeof Key_BindingC #} * (length bs)
    alignment _ = {# alignof Key_BindingC #}
    peek p = convertToList p (numKeybindings p) >>= return . KeyBindings
    poke _ (KeyBindings []) = return () -- should never be called
    poke p (KeyBindings (binding:bindings)) = do
              poke (castPtr p) binding
              if (null bindings)
                 then
                     {#set Key_BindingC->next #} (castPtr p) nullPtr
                 else do
                   nextPtr <- malloc :: IO (Ptr KeyBinding)
                   poke (castPtr nextPtr) (KeyBindings bindings)
                   {#set Key_BindingC->next #} (castPtr p) (castPtr nextPtr)

convertToList :: Ptr KeyBindings -> Int -> IO [KeyBinding]
convertToList _ 0 = return []
convertToList p count = do
  binding <- peek (castPtr p)
  next' <- {#get Key_BindingC->next #} p
  rest <- convertToList (castPtr next') (count - 1)
  return $ [binding] ++ rest

data WindowSizeRangeArgs = WindowSizeRangeArgs {
      maxw :: CInt,
      maxh :: CInt,
      dw :: CInt,
      dh :: CInt,
      aspect :: CInt
    }

instance Storable WindowSizeRangeArgs where
    sizeOf _ = {# sizeof fl_Window_size_range_args #}
    alignment _ = {# alignof fl_Window_size_range_args #}
    peek p = do
      maxw' <- {#get fl_Window_size_range_args->maxw #} p
      maxh' <- {#get fl_Window_size_range_args->maxh #} p
      dw' <- {#get fl_Window_size_range_args->dw #} p
      dh' <- {#get fl_Window_size_range_args->dh #} p
      aspect' <- {#get fl_Window_size_range_args->aspect #} p
      return $ WindowSizeRangeArgs maxw' maxh' dw' dh' aspect'
    poke p (WindowSizeRangeArgs maxw' maxh' dw' dh' aspect') =
        do
          {#set fl_Window_size_range_args->maxw #} p maxw'
          {#set fl_Window_size_range_args->maxh #} p maxh'
          {#set fl_Window_size_range_args->dw #} p dw'
          {#set fl_Window_size_range_args->dh #} p dh'
          {#set fl_Window_size_range_args->aspect #} p aspect'

data WindowDrawCellArgs = WindowDrawCellArgs {
      drawCellR :: CInt,
      drawCellC :: CInt,
      drawCellX :: CInt,
      drawCellY :: CInt
    }

instance Storable WindowDrawCellArgs where
    sizeOf _ = {# sizeof fl_Window_draw_cell_default_args #}
    alignment _ = {# alignof fl_Window_draw_cell_default_args #}
    peek p = do
      drawCellR' <- {#get fl_Window_draw_cell_default_args->R #} p
      drawCellC' <- {#get fl_Window_draw_cell_default_args->C #} p
      drawCellX' <- {#get fl_Window_draw_cell_default_args->X #} p
      drawCellY' <- {#get fl_Window_draw_cell_default_args->Y #} p
      return $ WindowDrawCellArgs drawCellR' drawCellC' drawCellX' drawCellY'
    poke p (WindowDrawCellArgs drawCellR' drawCellC' drawCellX' drawCellY') =
        do
          {#set fl_Window_draw_cell_default_args->R #} p drawCellR'
          {#set fl_Window_draw_cell_default_args->C #} p drawCellC'
          {#set fl_Window_draw_cell_default_args->X #} p drawCellX'
          {#set fl_Window_draw_cell_default_args->Y #} p drawCellY'

data TableVirtualFuncs = TableVirtualFuncs {
      tableDraw_ :: FunPtr (TablePtr -> IO ())
    , tableHandle_ :: FunPtr (TablePtr -> Event -> IO CInt)
    , tableResize_ :: FunPtr (TablePtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , tableShow_ :: FunPtr (TablePtr -> IO ())
    , tableHide_ :: FunPtr (TablePtr -> IO ())
    , tableAsWindow_ :: FunPtr (TablePtr -> IO WindowPtr)
    , tableAsGlWindow_ :: FunPtr (TablePtr -> IO GlWindowPtr)
    , tableAsGroup_ :: FunPtr (TablePtr -> IO Group)
    , tableDrawCell_ :: FunPtr (TablePtr ->
                               TableContext ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               IO ())
    , tableClear_ :: FunPtr (TablePtr -> IO  ())
    , tableSetRows_ :: FunPtr (TablePtr -> CInt -> IO ())
    , tableDestroyData_ :: FunPtr (TablePtr -> IO ())
    }

data WidgetVirtualFuncs = WidgetVirtualFuncs {
      widgetDraw_ :: FunPtr (WidgetPtr -> IO ())
    , widgetHandle_ :: FunPtr (WidgetPtr -> Event -> IO CInt)
    , widgetResize_ :: FunPtr (WidgetPtr ->
                               CInt ->
			       CInt ->
			       CInt ->
			       CInt ->
			       IO ())
    , widgetShow_ :: FunPtr (WidgetPtr -> IO ())
    , widgetHide_ :: FunPtr (WidgetPtr -> IO ())
    , widgetAsWindow_ :: FunPtr (WidgetPtr -> IO WindowPtr)
    , widgetAsGlWindow_ :: FunPtr (WidgetPtr -> IO GlWindowPtr)
    , widgetAsGroup_ :: FunPtr (WidgetPtr -> IO Group)
    , widgetDestroyData_ :: FunPtr (WidgetPtr -> IO ())
    }

data GroupVirtualFuncs = GroupVirtualFuncs {
      groupDraw_ :: FunPtr (GroupPtr -> IO ())
    , groupHandle_ :: FunPtr (GroupPtr -> Event -> IO CInt)
    , groupResize_ :: FunPtr (GroupPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , groupShow_ :: FunPtr (GroupPtr -> IO ())
    , groupHide_ :: FunPtr (GroupPtr -> IO ())
    , groupAsWindow_ :: FunPtr (GroupPtr -> IO WindowPtr)
    , groupAsGlWindow_ :: FunPtr (GroupPtr -> IO GlWindowPtr)
    , groupAsGroup_ :: FunPtr (GroupPtr -> IO Group)
    , groupDestroyData_ :: FunPtr (GroupPtr -> IO ())
    }

data WindowVirtualFuncs = WindowVirtualFuncs {
      windowDraw_ :: FunPtr (WindowPtr -> IO ())
    , windowHandle_ :: FunPtr (WindowPtr -> Event -> IO CInt)
    , windowResize_ :: FunPtr (WindowPtr ->
                              CInt ->
                              CInt ->
                              CInt ->
                              CInt ->
                              IO ())
    , windowShow_ :: FunPtr (WindowPtr -> IO ())
    , windowHide_ :: FunPtr (WindowPtr -> IO ())
    , windowAsWindow_ :: FunPtr (WindowPtr -> IO WindowPtr)
    , windowAsGlWindow_ :: FunPtr (WindowPtr -> IO GlWindowPtr)
    , windowAsGroup_ :: FunPtr (WindowPtr -> IO Group)
    , windowFlush_ :: FunPtr (WindowPtr -> IO ())
    , windowDestroyData_ :: FunPtr (WindowPtr -> IO ())
    }
data BrowserVirtualFuncs = BrowserVirtualFuncs {
      browserDraw_ :: FunPtr (BrowserPtr -> IO ())
    , browserHandle_ :: FunPtr (BrowserPtr -> Event -> IO CInt)
    , browserResize_ :: FunPtr (BrowserPtr ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               IO ())
    , browserShow_ :: FunPtr (BrowserPtr -> IO ())
    , browserShowWithLine_ :: FunPtr (BrowserPtr -> CInt -> IO ())
    , browserHide_ :: FunPtr (BrowserPtr -> IO ())
    , browserHideWithLine_ :: FunPtr (BrowserPtr -> CInt -> IO ())
    , browserAsWindow_ :: FunPtr (BrowserPtr -> IO WindowPtr)
    , browserAsGlWindow_ :: FunPtr (BrowserPtr -> IO GlWindowPtr)
    , browserAsGroup_ :: FunPtr (BrowserPtr -> IO Group)
    , browserDestroyData_ :: FunPtr (BrowserPtr -> IO ())
    }
data ImageVirtualFuncs = ImageVirtualFuncs {
      imageColorAverage_ :: FunPtr (ImagePtr -> Color -> CFloat -> IO ())
    , imageCopy_ :: FunPtr (ImagePtr -> CInt -> CInt -> IO ImagePtr)
    , imageDesaturate_ :: FunPtr (ImagePtr -> IO ())
    , imageLabel_ :: FunPtr (ImagePtr -> WidgetPtr)
    , imageLabelWithMenuItem_ :: FunPtr (ImagePtr -> MenuItemPtr -> IO ())
    , imageDraw_ :: FunPtr (ImagePtr ->
                           CInt ->
                           CInt ->
                           CInt ->
                           CInt ->
                           CInt ->
                           CInt ->
                           IO ())
    , imageUncache_ :: FunPtr (ImagePtr -> IO())
    , imageDestroyData_ :: FunPtr (ImagePtr -> IO())
    }

data ValuatorVirtualFuncs = ValuatorVirtualFuncs {
      valuatorDraw_ :: FunPtr (ValuatorPtr -> IO ())
    , valuatorHandle_ :: FunPtr (ValuatorPtr -> Event -> IO CInt)
    , valuatorResize_ :: FunPtr (ValuatorPtr ->
                                CInt ->
                                CInt ->
                                CInt ->
                                CInt ->
                                IO ())
    , valuatorShow_ :: FunPtr (ValuatorPtr -> IO ())
    , valuatorHide_ :: FunPtr (ValuatorPtr -> IO ())
    , valuatorAsWindo_w:: FunPtr (ValuatorPtr -> IO WindowPtr)
    , valuatorAsGlWindow_ :: FunPtr (ValuatorPtr -> IO GlWindowPtr)
    , valuatorAsGroup_ :: FunPtr (ValuatorPtr -> IO Group)
    , valuatorFormat_ :: FunPtr (ValuatorPtr -> String -> IO ())
    , valuatorDestroyData_ :: FunPtr (ValuatorPtr -> IO ())
    }

data TableRowVirtualFuncs = TableRowVirtualFuncs {
      tableRowDraw_ :: FunPtr (TableRowPtr -> IO ())
    , tableRowHandle_ :: FunPtr (TableRowPtr -> Event -> IO CInt)
    , tableRowResize_ :: FunPtr (TableRowPtr ->
                                CInt ->
                                CInt ->
                                CInt ->
                                CInt ->
                                IO ())
    , tableRowShow_ :: FunPtr (TableRowPtr -> IO ())
    , tableRowHide_ :: FunPtr (TableRowPtr -> IO ())
    , tableRowAsWindow_ :: FunPtr (TableRowPtr -> IO WindowPtr)
    , tableRowAsGlWindow_ :: FunPtr (TableRowPtr -> IO GlWindowPtr)
    , tableRowAsGroup_ :: FunPtr (TableRowPtr -> IO Group)
    , tableRowDrawCell_ :: FunPtr (TableRowPtr ->
                                  TableContext ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  IO ())
    , tableRowClear_ :: FunPtr (TableRowPtr -> IO  ())
    , tableRowSetRows_ :: FunPtr (TableRowPtr -> CInt -> IO ())
    , tableRowDestroyData_ :: FunPtr (TableRowPtr -> IO ())
    }
data ButtonVirtualFuncs = ButtonVirtualFuncs {
      buttonDraw_ :: FunPtr (ButtonPtr -> IO ())
    , buttonHandle_ :: FunPtr (ButtonPtr -> Event -> IO CInt)
    , buttonResize_ :: FunPtr (ButtonPtr ->
                               CInt ->
			       CInt ->
			       CInt ->
			       CInt ->
			       IO ())
    , buttonShow_ :: FunPtr (ButtonPtr -> IO ())
    , buttonHide_ :: FunPtr (ButtonPtr -> IO ())
    , buttonAsWindow_ :: FunPtr (ButtonPtr -> IO WindowPtr)
    , buttonAsGlWindow_ :: FunPtr (ButtonPtr -> IO GlWindowPtr)
    , buttonAsGroup_ :: FunPtr (ButtonPtr -> IO Group)
    , buttonDestroyData_ :: FunPtr (ButtonPtr -> IO ())
    }
data IntInputVirtualFuncs = IntInputVirtualFuncs {
      intInputDraw_ :: FunPtr (IntInputPtr -> IO ())
    , intInputHandle_ :: FunPtr (IntInputPtr -> Event -> IO CInt)
    , intInputResize_ :: FunPtr (IntInputPtr ->
                                 CInt ->
				 CInt ->
				 CInt ->
				 CInt ->
				 IO ())
    , intInputShow_ :: FunPtr (IntInputPtr -> IO ())
    , intInputHide_ :: FunPtr (IntInputPtr -> IO ())
    , intInputAsWindow_ :: FunPtr (IntInputPtr -> IO WindowPtr)
    , intInputAsGlWindow_ :: FunPtr (IntInputPtr -> IO GlWindowPtr)
    , intInputAsGroup_ :: FunPtr (IntInputPtr -> IO Group)
    , intInputDestroyData_ :: FunPtr (IntInputPtr -> IO ())
    }

data MultiBrowserVirtualFuncs = MultiBrowserVirtualFuncs {
      multiBrowserDraw_ :: FunPtr (MultiBrowserPtr -> IO ())
    , multiBrowserHandle_ :: FunPtr (MultiBrowserPtr -> Event -> IO CInt)
    , multiBrowserResize_ :: FunPtr (MultiBrowserPtr ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               IO ())
    , multiBrowserShow_ :: FunPtr (MultiBrowserPtr -> IO ())
    , multiBrowserShowWithLine_ :: FunPtr (MultiBrowserPtr -> CInt -> IO ())
    , multiBrowserHide_ :: FunPtr (MultiBrowserPtr -> IO ())
    , multiBrowserHideWithLine_ :: FunPtr (MultiBrowserPtr -> CInt -> IO ())
    , multiBrowserAsWindow_ :: FunPtr (MultiBrowserPtr -> IO WindowPtr)
    , multiBrowserAsGlWindow_ :: FunPtr (MultiBrowserPtr -> IO GlWindowPtr)
    , multiBrowserAsGroup_ :: FunPtr (MultiBrowserPtr -> IO Group)
    , multiBrowserDestroyData_ :: FunPtr (MultiBrowserPtr -> IO ())
    }
data MenuVirtualFuncs = MenuVirtualFuncs {
      menuDraw_ :: FunPtr (MenuPtr -> IO ())
    , menuHandle_ :: FunPtr (MenuPtr -> Event -> IO CInt)
    , menuResize_ :: FunPtr (MenuPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , menuShow_ :: FunPtr (MenuPtr -> IO ())
    , menuHide_ :: FunPtr (MenuPtr -> IO ())
    , menuAsWindow_ :: FunPtr (MenuPtr -> IO WindowPtr)
    , menuAsGlWindow_ :: FunPtr (MenuPtr -> IO GlWindowPtr)
    , menuAsGroup_ :: FunPtr (MenuPtr -> IO Group)
    , menuDestroyData_ :: FunPtr (MenuPtr -> IO ())
    }

data MenuBarVirtualFuncs = MenuBarVirtualFuncs {
      menuBarDraw_ :: FunPtr (MenuBarPtr -> IO ())
    , menuBarHandle_ :: FunPtr (MenuBarPtr -> Event -> IO CInt)
    , menuBarResize_ :: FunPtr (MenuBarPtr ->
                                CInt ->
				CInt ->
				CInt ->
				CInt ->
				IO ())
    , menuBarShow_ :: FunPtr (MenuBarPtr -> IO ())
    , menuBarHide_ :: FunPtr (MenuBarPtr -> IO ())
    , menuBarAsWindow_ :: FunPtr (MenuBarPtr -> IO WindowPtr)
    , menuBarAsGlWindow_ :: FunPtr (MenuBarPtr -> IO GlWindowPtr)
    , menuBarAsGroup_ :: FunPtr (MenuBarPtr -> IO Group)
    , menuBarDestroyData_ :: FunPtr (MenuBarPtr -> IO ())
    }

data BoxVirtualFuncs = BoxVirtualFuncs {
      boxDraw_ :: FunPtr (BoxPtr -> IO ())
    , boxHandle_ :: FunPtr (BoxPtr -> Event -> IO CInt)
    , boxResize_ :: FunPtr (BoxPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , boxShow_ :: FunPtr (BoxPtr -> IO ())
    , boxHide_ :: FunPtr (BoxPtr -> IO ())
    , boxAsWindow_ :: FunPtr (BoxPtr -> IO WindowPtr)
    , boxAsGlWindow_ :: FunPtr (BoxPtr -> IO GlWindowPtr)
    , boxAsGroup_ :: FunPtr (BoxPtr -> IO Group)
    , boxDestroyData_ :: FunPtr (BoxPtr -> IO ())
    }

data GlWindowVirtualFuncs = GlWindowVirtualFuncs {
      glWindowDraw_ :: FunPtr (GlWindowPtr -> IO ())
    , glWindowHandle_ :: FunPtr (GlWindowPtr -> Event -> IO CInt)
    , glWindowResize_ :: FunPtr (GlWindowPtr ->
                                 CInt ->
                                 CInt ->
                                 CInt ->
                                 CInt ->
                                 IO ())
    , glWindowShow_ :: FunPtr (GlWindowPtr -> IO ())
    , glWindowHide_ :: FunPtr (GlWindowPtr -> IO ())
    , glWindowAsWindow_ :: FunPtr (GlWindowPtr -> IO WindowPtr)
    , glWindowAsGlWindow_ :: FunPtr (GlWindowPtr -> IO GlWindowPtr)
    , glWindowAsGroup_ :: FunPtr (GlWindowPtr -> IO Group)
    , glWindowFlush_ :: FunPtr (GlWindowPtr -> IO ())
    , glWindowDestroyData_ :: FunPtr (GlWindowPtr -> IO ())
    }
data DoubleWindowVirtualFuncs = DoubleWindowVirtualFuncs {
      doubleWindowDraw_ :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowHandle_ :: FunPtr (DoubleWindowPtr -> Event -> IO CInt)
    , doubleWindowResize_ :: FunPtr (DoubleWindowPtr ->
                                     CInt ->
                                     CInt ->
                                     CInt ->
                                     CInt ->
                                     IO ())
    , doubleWindowShow_ :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowHide_ :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowAsWindow_ :: FunPtr (DoubleWindowPtr -> IO WindowPtr)
    , doubleWindowAsGlWindow_ :: FunPtr (DoubleWindowPtr -> IO GlWindowPtr)
    , doubleWindowAsGroup_ :: FunPtr (DoubleWindowPtr -> IO Group)
    , doubleWindowFlush_ :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowDestroyData_ :: FunPtr (DoubleWindowPtr -> IO ())
    }

data SingleWindowVirtualFuncs = SingleWindowVirtualFuncs {
      singleWindowDraw_ :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowHandle_ :: FunPtr (SingleWindowPtr -> Event -> IO CInt)
    , singleWindowResize_ :: FunPtr (SingleWindowPtr ->
                                     CInt ->
                                     CInt ->
                                     CInt ->
                                     CInt ->
                                     IO ())
    , singleWindowShow_ :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowHide_ :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowAsWindow_ :: FunPtr (SingleWindowPtr -> IO WindowPtr)
    , singleWindowAsGlWindow_ :: FunPtr (SingleWindowPtr -> IO GlWindowPtr)
    , singleWindowAsGroup_ :: FunPtr (SingleWindowPtr -> IO Group)
    , singleWindowFlush_ :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowDestroyData_ :: FunPtr (SingleWindowPtr -> IO ())
    }
-}
newtype Width = Width Int
newtype Height = Height Int
newtype Depth = Depth Int
newtype X = X Int
newtype Y = Y Int
newtype ByX = ByX Double
newtype ByY = ByY Double
newtype Angle = Angle CShort
data Position = Position X Y
data CountDirection = CountUp | CountDown
data Measure = Measure Width Height
data DPI = DPI Float Float
newtype MenuItemIndex = MenuItemIndex Int
data MenuItemPointer a = MenuItemPointer (MenuItem a)
newtype MenuItemName = MenuItemName String
data MenuItemReference a = MenuItemIndexReference MenuItemIndex | MenuItemPointerReference (MenuItemPointer a)
data MenuItemLocator a = MenuItemPointerLocator (MenuItemPointer a) | MenuItemNameLocator MenuItemName
data Rectangle = Rectangle Position Size
data ByXY = ByXY ByX ByY
data Intersection = Contained | Partial
data Size = Size Width Height
data KeyboardInput = KeyboardInputCode KeyboardCode | KeyboardInputChar Char
data ShortcutKeySequence = ShortcutKeySequence [EventState] KeyboardInput
data Shortcut = KeySequence ShortcutKeySequence | KeyFormat String
data ScreenLocation = Intersect Rectangle
                    | ScreenNumber Int
                    | ScreenPosition Position
data PositionSpec a = ByPosition Position
                    | ByWidget (Widget a)
data CutInput = CutSelection | CutRange Int Int | CutFromCursor Int
newtype FontSize = FontSize CInt
newtype PixmapHs = PixmapHs [B.ByteString]
data BitmapHs = BitmapHs [B.ByteString] Size
data Clipboard = InternalClipboard | SharedClipboard

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

toObjectPtr :: Ptr (Ptr a) -> IO (Ptr a)
toObjectPtr ptrToObjPtr = do
  objPtr <- peek ptrToObjPtr
  if (objPtr == nullPtr)
   then error "Object does not exist"
   else return objPtr

withObject :: Object a -> (Ptr b -> IO c) -> IO c
withObject (Object fptr) f =
   throwStackOnError $
     withForeignPtr fptr
       (\ptrToObjPtr -> do
           objPtr <- toObjectPtr ptrToObjPtr
           f (castPtr objPtr)
       )

unsafeObjectToPtr :: Object a -> IO (Ptr ())
unsafeObjectToPtr (Object fptr) =
    throwStackOnError $ do
      objPtr <- toObjectPtr $ Unsafe.unsafeForeignPtrToPtr fptr
      return $ castPtr objPtr

withObjects :: [Object a] -> (Ptr (Ptr b) -> IO c) -> IO c
withObjects objs f =
  throwStackOnError
  $ withForeignPtrs
        (map (\(Object fptr) -> fptr) objs)
        (\ptrToObjPtrs -> do
           objPtrs <- mapM toObjectPtr ptrToObjPtrs
           arrayPtr <- newArray objPtrs
           f (castPtr arrayPtr)
        )

withMaybeObject :: Maybe (Object a) -> (Ptr b -> IO c) -> IO c
withMaybeObject (Just o) f = withObject o f
withMaybeObject Nothing f = f (castPtr nullPtr)

swapObject :: Object a -> (Ptr b -> IO (Ptr a)) -> IO ()
swapObject obj@(Object fptr) f = do
   result <- withObject obj f
   withForeignPtr fptr $ \p -> poke p result

wrapObject :: ForeignPtr (Ptr ()) -> Object a
wrapObject = Object . castForeignPtr
