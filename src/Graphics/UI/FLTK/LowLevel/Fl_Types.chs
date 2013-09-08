{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Types where
#include "Fl_Types.h"
import Control.Monad
import Foreign
import Foreign.C
import Foreign.Ptr
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

data GLUTproc = GLUTproc {#type GLUTproc#}
newtype GLUTIdleFunction = GLUTIdleFunction (FunPtr (IO ()))
newtype GLUTMenuStateFunction = GLUTMenuStateFunction (FunPtr (CInt -> IO()))
newtype GLUTMenuStatusFunction = GLUTMenuStatusFunction (FunPtr (CInt -> CInt -> CInt -> IO ()))
{#pointer *Fl_Glut_Bitmap_Font as GlutBitmapFontPtr newtype #}
{#pointer *Fl_Glut_StrokeVertex as GlutStrokeVertexPtr newtype#}
{#pointer *Fl_Glut_StrokeStrip as GlutStrokeStripPtr newtype#}
{#pointer *Fl_Glut_StrokeFont as GlutStrokeFontPtr newtype#}
type FlIntPtr              = {#type fl_intptr_t #}
type FlUIntPtr             = {#type fl_uintptr_t#}
type ID                    = {#type ID#}
type Color                 = {#type Fl_Color#}
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
data Double_Window         = Double_Window
type Double_WindowPtr      = Ptr Double_Window
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
data Float_Input           = Float_Input
type Float_InputPtr        = Ptr Float_Input
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
data Radio_Round_Button    = Radio_Round_Button
type Radio_Round_ButtonPtr = Ptr Radio_Round_Button
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
data Value_Slider          = Value_Slider
type Value_SliderPtr       = Ptr Value_Slider
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
