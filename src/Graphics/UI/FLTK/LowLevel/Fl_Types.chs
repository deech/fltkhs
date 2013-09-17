{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Types where
#include "Fl_Types.h"
import Foreign
import Foreign.C
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

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
type FlIntPtr              = {#type fl_intptr_t #}
type FlUIntPtr             = {#type fl_uintptr_t#}
type ID                    = {#type ID#}
type Align                 = {#type Fl_Align#}
data Window                = Window
type WindowPtr             = ForeignPtr Window
data Group                 = Group
type GroupPtr              = ForeignPtr Group
data Label                 = Label
type LabelPtr              = ForeignPtr Label
data Adjuster              = Adjuster
type AdjusterPtr           = ForeignPtr Adjuster
data Bitmap                = Bitmap
type BitmapPtr             = ForeignPtr Bitmap
data BMPImage              = BMPImage
type BMPImagePtr           = ForeignPtr BMPImage
data Box                   = Box
type BoxPtr                = ForeignPtr Box
data BrowserPrim           = BrowserPrim
type BrowserPrimPtr        = ForeignPtr BrowserPrim
data Browser               = Browser
type BrowserPtr            = ForeignPtr Browser
data Button                = Button
type ButtonPtr             = ForeignPtr Button
data Cairo                 = Cairo
type CairoPtr              = ForeignPtr Cairo
data CairoWindow           = CairoWindow
type CairoWindowPtr        = ForeignPtr CairoWindow
data Chart                 = Chart
type ChartPtr              = ForeignPtr Chart
data CheckBrowser          = CheckBrowser
type CheckBrowserPtr       = ForeignPtr CheckBrowser
data CheckButton           = CheckButton
type CheckButtonPtr        = ForeignPtr CheckButton
data Choice                = Choice
type ChoicePtr             = ForeignPtr Choice
data Clock                 = Clock
type ClockPtr              = ForeignPtr Clock
data ColorChooser          = ColorChooser
type ColorChooserPtr       = ForeignPtr ColorChooser
data Counter               = Counter
type CounterPtr            = ForeignPtr Counter
data Device                = Device
type DevicePtr             = ForeignPtr Device
data Dial                  = Dial
type DialPtr               = ForeignPtr Dial
data DoubleWindow          = DoubleWindow
type DoubleWindowPtr       = Ptr DoubleWindow
data Export                = Export
type ExportPtr             = ForeignPtr Export
data FileBrowser           = FileBrowser
type FileBrowserPtr        = ForeignPtr FileBrowser
data FileChooser           = FileChooser
type FileChooserPtr        = ForeignPtr FileChooser
data FileIcon              = FileIcon
type FileIconPtr           = ForeignPtr FileIcon
data FileInput             = FileInput
type FileInputPtr          = ForeignPtr FileInput
data FillDial              = FillDial
type FillDialPtr           = ForeignPtr FillDial
data FillSlider            = FillSlider
type FillSliderPtr         = ForeignPtr FillSlider
data FloatInput           = FloatInput
type FloatInputPtr        = Ptr FloatInput
data FontDescriptor        = FontDescriptor
type FontDescriptorPtr     = ForeignPtr FontDescriptor
data FormsBitmap           = FormsBitmap
type FormsBitmapPtr        = ForeignPtr FormsBitmap
data FormsPixmap           = FormsPixmap
type FormsPixmapPtr        = ForeignPtr FormsPixmap
data Free                  = Free
type FreePtr               = ForeignPtr Free
data GIFImage              = GIFImage
type GIFImagePtr           = ForeignPtr GIFImage
data GlWindow              = GlWindow
type GlWindowPtr           = ForeignPtr GlWindow
data GlutWindow            = GlutWindow
type GlutWindowPtr         = ForeignPtr GlutWindow
data GraphicsDriver        = GraphicsDriver
type GraphicsDriverPtr     = ForeignPtr GraphicsDriver
data SurfaceDevice         = SurfaceDevice
type SurfaceDevicePtr      = ForeignPtr SurfaceDevice
data DisplayDevice         = DisplayDevice
type DisplayDevicePtr      = ForeignPtr DisplayDevice
data DevicePlugin          = DevicePlugin
type DevicePluginPtr       = ForeignPtr DevicePlugin
data HelpDialog            = HelpDialog
type HelpDialogPtr         = ForeignPtr HelpDialog
data HelpView              = HelpView
type HelpViewPtr           = ForeignPtr HelpView
data HoldBrowser           = HoldBrowser
type HoldBrowserPtr        = ForeignPtr HoldBrowser
data HorFillSlider         = HorFillSlider
type HorFillSliderPtr      = ForeignPtr HorFillSlider
data HorNiceSlider         = HorNiceSlider
type HorNiceSliderPtr      = ForeignPtr HorNiceSlider
data HorSlider             = HorSlider
type HorSliderPtr          = ForeignPtr HorSlider
data HorValueSlider        = HorValueSlider
type HorValueSliderPtr     = ForeignPtr HorValueSlider
data Image                 = Image
type ImagePtr              = ForeignPtr Image
data InputChoice           = InputChoice
type InputChoicePtr        = ForeignPtr InputChoice
data InputPrim             = InputPrim
type InputPrimPtr          = ForeignPtr InputPrim
data Input                 = Input
type InputPtr              = ForeignPtr Input
data IntInput              = IntInput
type IntInputPtr           = ForeignPtr IntInput
data JPEGImage             = JPEGImage
type JPEGImagePtr          = ForeignPtr JPEGImage
data LightButton           = LightButton
type LightButtonPtr        = ForeignPtr LightButton
data LineDial              = LineDial
type LineDialPtr           = ForeignPtr LineDial
data MenuBar               = MenuBar
type MenuBarPtr            = ForeignPtr MenuBar
data MenuButton            = MenuButton
type MenuButtonPtr         = ForeignPtr MenuButton
data MenuPrim              = MenuPrim
type MenuPrimPtr           = ForeignPtr MenuPrim
data Menu                  = Menu
type MenuPtr               = ForeignPtr Menu
data MenuItem              = MenuItem
type MenuItemPtr           = ForeignPtr MenuItem
data MenuWindow            = MenuWindow
type MenuWindowPtr         = ForeignPtr MenuWindow
data MultiBrowser          = MultiBrowser
type MultiBrowserPtr       = ForeignPtr MultiBrowser
data MultiLabel            = MultiLabel
type MultiLabelPtr         = ForeignPtr MultiLabel
data MultilineInput        = MultilineInput
type MultilineInputPtr     = ForeignPtr MultilineInput
data MultilineOutput       = MultilineOutput
type MultilineOutputPtr    = ForeignPtr MultilineOutput
data NativeFileChooser     = NativeFileChooser
type NativeFileChooserPtr  = ForeignPtr NativeFileChooser
data NiceSlider            = NiceSlider
type NiceSliderPtr         = ForeignPtr NiceSlider
data Object                = Object
type ObjectPtr             = ForeignPtr Object
data Output                = Output
type OutputPtr             = ForeignPtr Output
data OverlayWindow         = OverlayWindow
type OverlayWindowPtr      = ForeignPtr OverlayWindow
data Pack                  = Pack
type PackPtr               = ForeignPtr Pack
data PagedDevice           = PagedDevice
type PagedDevicePtr        = ForeignPtr PagedDevice
data Pixmap                = Pixmap
type PixmapPtr             = ForeignPtr Pixmap
data Plugin                = Plugin
type PluginPtr             = ForeignPtr Plugin
data PNGImage              = PNGImage
type PNGImagePtr           = ForeignPtr PNGImage
data PNMImage              = PNMImage
type PNMImagePtr           = ForeignPtr PNMImage
data Positioner            = Positioner
type PositionerPtr         = ForeignPtr Positioner
data PostScript            = PostScript
type PostScriptPtr         = ForeignPtr PostScript
data Preferences           = Preferences
type PreferencesPtr        = ForeignPtr Preferences
data Printer               = Printer
type PrinterPtr            = ForeignPtr Printer
data Progress              = Progress
type ProgressPtr           = ForeignPtr Progress
data RadioButton           = RadioButton
type RadioButtonPtr        = ForeignPtr RadioButton
data RadioLightButton      = RadioLightButton
type RadioLightButtonPtr   = ForeignPtr RadioLightButton
data RadioRoundButton    = RadioRoundButton
type RadioRoundButtonPtr = Ptr RadioRoundButton
data RepeatButton          = RepeatButton
type RepeatButtonPtr       = ForeignPtr RepeatButton
data ReturnButton          = ReturnButton
type ReturnButtonPtr       = ForeignPtr ReturnButton
data RGBImage              = RGBImage
type RGBImagePtr           = ForeignPtr RGBImage
data Roller                = Roller
type RollerPtr             = ForeignPtr Roller
data RoundButton           = RoundButton
type RoundButtonPtr        = ForeignPtr RoundButton
data RoundClock            = RoundClock
type RoundClockPtr         = ForeignPtr RoundClock
data Scrollbar             = Scrollbar
type ScrollbarPtr          = ForeignPtr Scrollbar
data Scroll                = Scroll
type ScrollPtr             = ForeignPtr Scroll
data SecretInput           = SecretInput
type SecretInputPtr        = ForeignPtr SecretInput
data SelectBrowser         = SelectBrowser
type SelectBrowserPtr      = ForeignPtr SelectBrowser
data SharedImage           = SharedImage
type SharedImagePtr        = ForeignPtr SharedImage
data SimpleCounter         = SimpleCounter
type SimpleCounterPtr      = ForeignPtr SimpleCounter
data SingleWindow          = SingleWindow
type SingleWindowPtr       = ForeignPtr SingleWindow
data Slider                = Slider
type SliderPtr             = ForeignPtr Slider
data Spinner               = Spinner
type SpinnerPtr            = ForeignPtr Spinner
data SysMenuBar            = SysMenuBar
type SysMenuBarPtr         = ForeignPtr SysMenuBar
data Table                 = Table
type TablePtr              = ForeignPtr Table
data TableRow              = TableRow
type TableRowPtr           = ForeignPtr TableRow
data Tabs                  = Tabs
type TabsPtr               = ForeignPtr Tabs
data TextBuffer            = TextBuffer
type TextBufferPtr         = ForeignPtr TextBuffer
data TextDisplay           = TextDisplay
type TextDisplayPtr        = ForeignPtr TextDisplay
data TextEditor            = TextEditor
type TextEditorPtr         = ForeignPtr TextEditor
data TextSelection         = TextSelection
type TextSelectionPtr      = ForeignPtr TextSelection
data TiledImage            = TiledImage
type TiledImagePtr         = ForeignPtr TiledImage
data Tile                  = Tile
type TilePtr               = ForeignPtr Tile
data Timer                 = Timer
type TimerPtr              = ForeignPtr Timer
data ToggleButton          = ToggleButton
type ToggleButtonPtr       = ForeignPtr ToggleButton
data ToggleLightButton     = ToggleLightButton
type ToggleLightButtonPtr  = ForeignPtr ToggleLightButton
data ToggleRoundButton     = ToggleRoundButton
type ToggleRoundButtonPtr  = ForeignPtr ToggleRoundButton
data Tooltip               = Tooltip
type TooltipPtr            = ForeignPtr Tooltip
data Tree                  = Tree
type TreePtr               = ForeignPtr Tree
data TreeItemArray         = TreeItemArray
type TreeItemArrayPtr      = ForeignPtr TreeItemArray
data TreeItem              = TreeItem
type TreeItemPtr           = ForeignPtr TreeItem
data TreePrefs             = TreePrefs
type TreePrefsPtr          = ForeignPtr TreePrefs
data Valuator              = Valuator
type ValuatorPtr           = ForeignPtr Valuator
data ValueInput            = ValueInput
type ValueInputPtr         = ForeignPtr ValueInput
data ValueOutput           = ValueOutput
type ValueOutputPtr        = ForeignPtr ValueOutput
data ValueSlider           = ValueSlider
type ValueSliderPtr        = Ptr ValueSlider
data Widget                = Widget
type WidgetPtr             = ForeignPtr Widget
data Wizard                = Wizard
type WizardPtr             = ForeignPtr Wizard
data XBMImage              = XBMImage
type XBMImagePtr           = ForeignPtr XBMImage
data XPMImage              = XPMImage
type XPMImagePtr           = ForeignPtr XPMImage
data Region                = Region
type RegionPtr             = ForeignPtr Region
data UserData              = UserData
type UserDataPtr           = ForeignPtr UserData
type Callback              = FunPtr (WidgetPtr -> UserDataPtr -> IO ())
type TextBufferCallback    = FunPtr (TextBufferPtr -> IO ())
type UnfinishedStyleCb     = FunPtr (CInt -> UserDataPtr -> IO ())
type FileChooserCallback   = FunPtr (FileChooserPtr -> UserDataPtr -> IO())
type SharedImageHandler    = FunPtr (CString -> CUChar -> CInt -> ImagePtr)

{#pointer *Style_Table_Entry as StyleTableEntryPtr foreign -> StyleTableEntry #}
data StyleTableEntry = StyleTableEntry {
      color :: Color,
      font :: Font,
      size :: FontSize,
      attr :: CUInt
    }

instance Storable StyleTableEntry where
    sizeOf _ = {# sizeof Style_Table_Entry #}
    alignment _ = {# alignof Style_Table_Entry #}
    poke p (StyleTableEntry (Color c) (Font f) (FontSize fs) attr') = do
                                   {#set Style_Table_Entry->color #} p c
                                   {#set Style_Table_Entry->font#} p f
                                   {#set Style_Table_Entry->size#} p fs
                                   {#set Style_Table_Entry->attr#} p attr'
    peek p  = do
      c    <- {#get Style_Table_Entry->color #} p
      f    <- {#get Style_Table_Entry->font#} p
      fs   <- {#get Style_Table_Entry->size#} p
      attr' <- {#get Style_Table_Entry->attr#} p
      return $ StyleTableEntry (Color c) (Font f) (FontSize fs) attr'

type KeyFunc = FunPtr (CInt -> TextEditorPtr -> CInt)
{#pointer *Key_BindingC as KeyBindingCPtr foreign -> KeyBinding #}
data KeyBinding = KeyBinding {
      key :: CInt,
      state :: CInt,
      keyFunc :: KeyFunc
    }
{#fun pure unsafe num_keybindings as
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
      tableDraw :: FunPtr (TablePtr -> IO ())
    , tableHandle :: FunPtr (TablePtr -> Event -> IO CInt)
    , tableResize :: FunPtr (TablePtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , tableShow :: FunPtr (TablePtr -> IO ())
    , tableHide :: FunPtr (TablePtr -> IO ())
    , tableAsWindow :: FunPtr (TablePtr -> IO WindowPtr)
    , tableAsGlWindow :: FunPtr (TablePtr -> IO GlWindowPtr)
    , tableAsGroup :: FunPtr (TablePtr -> IO Group)
    , tableDrawCell :: FunPtr (TablePtr ->
                               TableContext ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               IO ())
    , tableClear :: FunPtr (TablePtr -> IO  ())
    , tableSetRows :: FunPtr (TablePtr -> CInt -> IO ())
    , tableDestroyData :: FunPtr (TablePtr -> IO ())
    }

data WidgetVirtualFuncs = WidgetVirtualFuncs {
      widgetDraw :: FunPtr (WidgetPtr -> IO ())
    , widgetHandle :: FunPtr (WidgetPtr -> Event -> IO CInt)
    , widgetResize :: FunPtr (WidgetPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , widgetShow :: FunPtr (WidgetPtr -> IO ())
    , widgetHide :: FunPtr (WidgetPtr -> IO ())
    , widgetAsWindow :: FunPtr (WidgetPtr -> IO WindowPtr)
    , widgetAsGlWindow :: FunPtr (WidgetPtr -> IO GlWindowPtr)
    , widgetAsGroup :: FunPtr (WidgetPtr -> IO Group)
    , widgetDestroyData :: FunPtr (WidgetPtr -> IO ())
    }

data GroupVirtualFuncs = GroupVirtualFuncs {
      groupDraw :: FunPtr (GroupPtr -> IO ())
    , groupHandle :: FunPtr (GroupPtr -> Event -> IO CInt)
    , groupResize :: FunPtr (GroupPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , groupShow :: FunPtr (GroupPtr -> IO ())
    , groupHide :: FunPtr (GroupPtr -> IO ())
    , groupAsWindow :: FunPtr (GroupPtr -> IO WindowPtr)
    , groupAsGlWindow :: FunPtr (GroupPtr -> IO GlWindowPtr)
    , groupAsGroup :: FunPtr (GroupPtr -> IO Group)
    , groupDestroyData :: FunPtr (GroupPtr -> IO ())
    }

data WindowVirtualFuncs = WindowVirtualFuncs {
      windowDraw :: FunPtr (WindowPtr -> IO ())
    , windowHandle :: FunPtr (WindowPtr -> Event -> IO CInt)
    , windowResize :: FunPtr (WindowPtr ->
                              CInt ->
                              CInt ->
                              CInt ->
                              CInt ->
                              IO ())
    , windowShow :: FunPtr (WindowPtr -> IO ())
    , windowHide :: FunPtr (WindowPtr -> IO ())
    , windowAsWindow :: FunPtr (WindowPtr -> IO WindowPtr)
    , windowAsGlWindow :: FunPtr (WindowPtr -> IO GlWindowPtr)
    , windowAsGroup :: FunPtr (WindowPtr -> IO Group)
    , windowFlush :: FunPtr (WindowPtr -> IO ())
    , windowDestroyData :: FunPtr (WindowPtr -> IO ())
    }
data BrowserVirtualFuncs = BrowserVirtualFuncs {
      browserDraw :: FunPtr (BrowserPtr -> IO ())
    , browserHandle :: FunPtr (BrowserPtr -> Event -> IO CInt)
    , browserResize :: FunPtr (BrowserPtr ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               IO ())
    , browserShow :: FunPtr (BrowserPtr -> IO ())
    , browserShowWithLine :: FunPtr (BrowserPtr -> CInt -> IO ())
    , browserHide :: FunPtr (BrowserPtr -> IO ())
    , browserHideWithLine :: FunPtr (BrowserPtr -> CInt -> IO ())
    , browserAsWindow :: FunPtr (BrowserPtr -> IO WindowPtr)
    , browserAsGlWindow :: FunPtr (BrowserPtr -> IO GlWindowPtr)
    , browserAsGroup :: FunPtr (BrowserPtr -> IO Group)
    , browserDestroyData :: FunPtr (BrowserPtr -> IO ())
    }
data ImageVirtualFuncs = ImageVirtualFuncs {
      imageColorAverage :: FunPtr (ImagePtr -> Color -> CFloat -> IO ())
    , imageCopy :: FunPtr (ImagePtr -> CInt -> CInt -> IO ImagePtr)
    , imageDesaturate :: FunPtr (ImagePtr -> IO ())
    , imageLabel :: FunPtr (ImagePtr -> WidgetPtr)
    , imageLabelWithMenuItem :: FunPtr (ImagePtr -> MenuItemPtr -> IO ())
    , imageDraw :: FunPtr (ImagePtr ->
                           CInt ->
                           CInt ->
                           CInt ->
                           CInt ->
                           CInt ->
                           CInt ->
                           IO ())
    , imageUncache :: FunPtr (ImagePtr -> IO())
    , imageDestroyData :: FunPtr (ImagePtr -> IO())
    }

data ValuatorVirtualFuncs = ValuatorVirtualFuncs {
      valuatorDraw :: FunPtr (ValuatorPtr -> IO ())
    , valuatorHandle :: FunPtr (ValuatorPtr -> Event -> IO CInt)
    , valuatorResize :: FunPtr (ValuatorPtr ->
                                CInt ->
                                CInt ->
                                CInt ->
                                CInt ->
                                IO ())
    , valuatorShow :: FunPtr (ValuatorPtr -> IO ())
    , valuatorHide :: FunPtr (ValuatorPtr -> IO ())
    , valuatorAsWindow:: FunPtr (ValuatorPtr -> IO WindowPtr)
    , valuatorAsGlWindow :: FunPtr (ValuatorPtr -> IO GlWindowPtr)
    , valuatorAsGroup :: FunPtr (ValuatorPtr -> IO Group)
    , valuatorFormat :: FunPtr (ValuatorPtr -> String -> IO ())
    , valuatorDestroyData :: FunPtr (ValuatorPtr -> IO ())
    }

data TableRowVirtualFuncs = TableRowVirtualFuncs {
      tableRowDraw :: FunPtr (TableRowPtr -> IO ())
    , tableRowHandle :: FunPtr (TableRowPtr -> Event -> IO CInt)
    , tableRowResize :: FunPtr (TableRowPtr ->
                                CInt ->
                                CInt ->
                                CInt ->
                                CInt ->
                                IO ())
    , tableRowShow :: FunPtr (TableRowPtr -> IO ())
    , tableRowHide :: FunPtr (TableRowPtr -> IO ())
    , tableRowAsWindow :: FunPtr (TableRowPtr -> IO WindowPtr)
    , tableRowAsGlWindow :: FunPtr (TableRowPtr -> IO GlWindowPtr)
    , tableRowAsGroup :: FunPtr (TableRowPtr -> IO Group)
    , tableRowDrawCell :: FunPtr (TableRowPtr ->
                                  TableContext ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  CInt ->
                                  IO ())
    , tableRowClear :: FunPtr (TableRowPtr -> IO  ())
    , tableRowSetRows :: FunPtr (TableRowPtr -> CInt -> IO ())
    , tableRowDestroyData :: FunPtr (TableRowPtr -> IO ())
    }
data ButtonVirtualFuncs = ButtonVirtualFuncs {
      buttonDraw :: FunPtr (ButtonPtr -> IO ())
    , buttonHandle :: FunPtr (ButtonPtr -> Event -> IO CInt)
    , buttonResize :: FunPtr (ButtonPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , buttonShow :: FunPtr (ButtonPtr -> IO ())
    , buttonHide :: FunPtr (ButtonPtr -> IO ())
    , buttonAsWindow :: FunPtr (ButtonPtr -> IO WindowPtr)
    , buttonAsGlWindow :: FunPtr (ButtonPtr -> IO GlWindowPtr)
    , buttonAsGroup :: FunPtr (ButtonPtr -> IO Group)
    , buttonDestroyData :: FunPtr (ButtonPtr -> IO ())
    }
data IntInputVirtualFuncs = IntInputVirtualFuncs {
      intInputDraw :: FunPtr (IntInputPtr -> IO ())
    , intInputHandle :: FunPtr (IntInputPtr -> Event -> IO CInt)
    , intInputResize :: FunPtr (IntInputPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , intInputShow :: FunPtr (IntInputPtr -> IO ())
    , intInputHide :: FunPtr (IntInputPtr -> IO ())
    , intInputAsWindow :: FunPtr (IntInputPtr -> IO WindowPtr)
    , intInputAsGlWindow :: FunPtr (IntInputPtr -> IO GlWindowPtr)
    , intInputAsGroup :: FunPtr (IntInputPtr -> IO Group)
    , intInputDestroyData :: FunPtr (IntInputPtr -> IO ())
    }

data MultiBrowserVirtualFuncs = MultiBrowserVirtualFuncs {
      multiBrowserDraw :: FunPtr (MultiBrowserPtr -> IO ())
    , multiBrowserHandle :: FunPtr (MultiBrowserPtr -> Event -> IO CInt)
    , multiBrowserResize :: FunPtr (MultiBrowserPtr ->
                               CInt ->
                               CInt ->
                               CInt ->
                               CInt ->
                               IO ())
    , multiBrowserShow :: FunPtr (MultiBrowserPtr -> IO ())
    , multiBrowserShowWithLine :: FunPtr (MultiBrowserPtr -> CInt -> IO ())
    , multiBrowserHide :: FunPtr (MultiBrowserPtr -> IO ())
    , multiBrowserHideWithLine :: FunPtr (MultiBrowserPtr -> CInt -> IO ())
    , multiBrowserAsWindow :: FunPtr (MultiBrowserPtr -> IO WindowPtr)
    , multiBrowserAsGlWindow :: FunPtr (MultiBrowserPtr -> IO GlWindowPtr)
    , multiBrowserAsGroup :: FunPtr (MultiBrowserPtr -> IO Group)
    , multiBrowserDestroyData :: FunPtr (MultiBrowserPtr -> IO ())
    }
data MenuVirtualFuncs = MenuVirtualFuncs {
      menuDraw :: FunPtr (MenuPtr -> IO ())
    , menuHandle :: FunPtr (MenuPtr -> Event -> IO CInt)
    , menuResize :: FunPtr (MenuPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , menuShow :: FunPtr (MenuPtr -> IO ())
    , menuHide :: FunPtr (MenuPtr -> IO ())
    , menuAsWindow :: FunPtr (MenuPtr -> IO WindowPtr)
    , menuAsGlWindow :: FunPtr (MenuPtr -> IO GlWindowPtr)
    , menuAsGroup :: FunPtr (MenuPtr -> IO Group)
    , menuDestroyData :: FunPtr (MenuPtr -> IO ())
    }

data MenuBarVirtualFuncs = MenuBarVirtualFuncs {
      menuBarDraw :: FunPtr (MenuBarPtr -> IO ())
    , menuBarHandle :: FunPtr (MenuBarPtr -> Event -> IO CInt)
    , menuBarResize :: FunPtr (MenuBarPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , menuBarShow :: FunPtr (MenuBarPtr -> IO ())
    , menuBarHide :: FunPtr (MenuBarPtr -> IO ())
    , menuBarAsWindow :: FunPtr (MenuBarPtr -> IO WindowPtr)
    , menuBarAsGlWindow :: FunPtr (MenuBarPtr -> IO GlWindowPtr)
    , menuBarAsGroup :: FunPtr (MenuBarPtr -> IO Group)
    , menuBarDestroyData :: FunPtr (MenuBarPtr -> IO ())
    }

data BoxVirtualFuncs = BoxVirtualFuncs {
      boxDraw :: FunPtr (BoxPtr -> IO ())
    , boxHandle :: FunPtr (BoxPtr -> Event -> IO CInt)
    , boxResize :: FunPtr (BoxPtr -> CInt -> CInt -> CInt -> CInt -> IO ())
    , boxShow :: FunPtr (BoxPtr -> IO ())
    , boxHide :: FunPtr (BoxPtr -> IO ())
    , boxAsWindow :: FunPtr (BoxPtr -> IO WindowPtr)
    , boxAsGlWindow :: FunPtr (BoxPtr -> IO GlWindowPtr)
    , boxAsGroup :: FunPtr (BoxPtr -> IO Group)
    , boxDestroyData :: FunPtr (BoxPtr -> IO ())
    }

data GlWindowVirtualFuncs = GlWindowVirtualFuncs {
      glWindowDraw :: FunPtr (GlWindowPtr -> IO ())
    , glWindowHandle :: FunPtr (GlWindowPtr -> Event -> IO CInt)
    , glWindowResize :: FunPtr (GlWindowPtr ->
                              CInt ->
                              CInt ->
                              CInt ->
                              CInt ->
                              IO ())
    , glWindowShow :: FunPtr (GlWindowPtr -> IO ())
    , glWindowHide :: FunPtr (GlWindowPtr -> IO ())
    , glWindowAsWindow :: FunPtr (GlWindowPtr -> IO WindowPtr)
    , glWindowAsGlWindow :: FunPtr (GlWindowPtr -> IO GlWindowPtr)
    , glWindowAsGroup :: FunPtr (GlWindowPtr -> IO Group)
    , glWindowFlush :: FunPtr (GlWindowPtr -> IO ())
    , glWindowDestroyData :: FunPtr (GlWindowPtr -> IO ())
    }
data DoubleWindowVirtualFuncs = DoubleWindowVirtualFuncs {
      doubleWindowDraw :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowHandle :: FunPtr (DoubleWindowPtr -> Event -> IO CInt)
    , doubleWindowResize :: FunPtr (DoubleWindowPtr ->
                              CInt ->
                              CInt ->
                              CInt ->
                              CInt ->
                              IO ())
    , doubleWindowShow :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowHide :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowAsWindow :: FunPtr (DoubleWindowPtr -> IO WindowPtr)
    , doubleWindowAsGlWindow :: FunPtr (DoubleWindowPtr -> IO GlWindowPtr)
    , doubleWindowAsGroup :: FunPtr (DoubleWindowPtr -> IO Group)
    , doubleWindowFlush :: FunPtr (DoubleWindowPtr -> IO ())
    , doubleWindowDestroyData :: FunPtr (DoubleWindowPtr -> IO ())
    }

data SingleWindowVirtualFuncs = SingleWindowVirtualFuncs {
      singleWindowDraw :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowHandle :: FunPtr (SingleWindowPtr -> Event -> IO CInt)
    , singleWindowResize :: FunPtr (SingleWindowPtr ->
                              CInt ->
                              CInt ->
                              CInt ->
                              CInt ->
                              IO ())
    , singleWindowShow :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowHide :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowAsWindow :: FunPtr (SingleWindowPtr -> IO WindowPtr)
    , singleWindowAsGlWindow :: FunPtr (SingleWindowPtr -> IO GlWindowPtr)
    , singleWindowAsGroup :: FunPtr (SingleWindowPtr -> IO Group)
    , singleWindowFlush :: FunPtr (SingleWindowPtr -> IO ())
    , singleWindowDestroyData :: FunPtr (SingleWindowPtr -> IO ())
    }
                              
