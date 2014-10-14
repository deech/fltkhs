{-# LANGUAGE CPP #-}
#include "Fl_C.h"
#include "Fl_EnumerationsC.h"
module Graphics.UI.FLTK.LowLevel.Fl_Enumerations
    (
     -- * Events
     Event(..),
     When(..),
     FdWhen(..),
     -- * Tree Attributes
     TreeSort(..),
     TreeConnector(..),
     TreeSelect(..),
#if FLTK_ABI_VERSION >= 10302
     TreeItemReselectMode(..),
     TreeItemDrawMode(..),
#endif /*FLTK_ABI_VERSION*/
     -- * Keyboard and mouse codes
     KeyboardCode(..),
     MouseButton(..),
     kb_Command, kb_Control, kb_KpLast, kb_KeyMask,
     -- * Widget damage types
     Damage(..),
     -- * Glut attributes
     GlutDraw(..),
     GlutMouseCodes(..),
     GlutUpDown(..),
     GlutVisibility(..),
     GlutMenuProperties(..),
     GlutEnteredLeft(..),
     GlutKeyboardCodes(..),
     GlutConstants(..),
     GlutWindowProperties(..),
     GlutCursor(..),
     glutCursorFullCrossHair,
     -- * Cursor type
     Cursor(..),
     -- * Various modes
     Mode(..),
     single,
     -- * Alignment
     AlignType(..),
     alignNoWrap, alignImageOverText,
     alignTopLeft,
     alignTopRight,
     alignBottomLeft,
     alignBottomRight,
     -- * Box types
     Boxtype(..),
     frame,frameBox, circleBox, diamondBox,
     -- * Box functions
     defineRoundUpBox,
     defineShadowBox,
     defineRoundedBox,
     defineRflatBox,
     defineRshadowBox,
     defineDiamondBox,
     defineOvalBox,
     definePlasticUpBox,
     defineGtkUpBox,
     -- * Fonts
     Font(..),
     FontAttribute(..),
     FontSize(..),
     -- ** (Un-)marshalling
     cFromFont,
     cToFont,
     cFromFontAttribute,
     cToFontAttribute,
     -- ** Font Names
     helvetica,
     helveticaBold,
     helveticaItalic,
     helveticaBoldItalic,
     courier,
     courierBold,
     courierItalic,
     courierBoldItalic,
     times,
     timesBold,
     timesItalic,
     timesBoldItalic,
     symbol,
     screen,
     screenBold,
     zapfDingbats,
     freeFont,

     -- * Colors
     Color(..),
     -- ** (Un-)marshalling
     cFromColor,
     cToColor,
     -- ** Various Color Functions
     inactive,
     contrast,
     color_average,
     lighter,
     darker,
     rgbColorWithRgb,
     rgbColorWithGrayscale,
     grayRamp,
     colorCube,
     -- ** Color Names
     foregroundColor,
     background2Color,
     inactiveColor,
     selectionColor,
     gray0Color,
     dark3Color,
     dark2Color,
     dark1Color,
     backgroundColor,
     light1Color,
     light2Color,
     light3Color,
     blackColor,
     redColor,
     greenColor,
     yellowColor,
     blueColor,
     magentaColor,
     cyanColor,
     darkRedColor,
     darkGreenColor,
     darkYellowColor,
     darkBlueColor,
     darkMagentaColor,
     darkCyanColor,
     whiteColor,
     freeColor,
     numFreeColor,
     grayRampColor,
     numGray,
     grayColor,
     colorCubeColor,
     numRed,
     numGreen,
     numBlue,
     -- * Labels
     Labeltype(..),
     symbolLabel,
     defineShadowLabel,
     defineEngravedLabel,
     defineEmbossedLabel
    )
where
import C2HS
#c
enum VersionInfo {
  AbiVersion = FLTK_ABI_VERSION,
  MajorVersion = FL_MAJOR_VERSION,
  MinorVersion = FL_MINOR_VERSION,
  PatchVersion = FL_PATCH_VERSION,
  Version = FL_VERSION
};
enum Event {
  NoEvent = FL_NO_EVENT,
  Push = FL_PUSH,
  Release = FL_RELEASE,
  Enter = FL_ENTER,
  Leave = FL_LEAVE,
  Drag = FL_DRAG,
  Focus = FL_FOCUS,
  Unfocus = FL_UNFOCUS,
  Keydown = FL_KEYDOWN,
  // FL_KEYBOARD same as above,
  Keyup = FL_KEYUP,
  Close = FL_CLOSE,
  Move = FL_MOVE,
  Shortcut = FL_SHORTCUT,
  Deactivate = FL_DEACTIVATE,
  Activate = FL_ACTIVATE,
  Hide = FL_HIDE,
  Show = FL_SHOW,
  Paste = FL_PASTE,
  Selectionclear = FL_SELECTIONCLEAR,
  Mousewheel = FL_MOUSEWHEEL,
  DndEnter = FL_DND_ENTER,
  DndDrag = FL_DND_DRAG,
  DndLeave = FL_DND_LEAVE,
  DndRelease = FL_DND_RELEASE,
  ScreenConfigurationChanged = FL_SCREEN_CONFIGURATION_CHANGED,
  Fullscreen = FL_FULLSCREEN
};
enum When {
  WhenNever = FL_WHEN_NEVER,
  WhenChanged = FL_WHEN_CHANGED,
  WhenNotChanged = FL_WHEN_NOT_CHANGED,
  WhenRelease = FL_WHEN_RELEASE,
  WhenReleaseAlways=  FL_WHEN_RELEASE_ALWAYS,
  WhenEnterKey = FL_WHEN_ENTER_KEY,
  WhenEnterKeyAlways = FL_WHEN_ENTER_KEY_ALWAYS,
  WhenEnterKeyChanged = FL_WHEN_ENTER_KEY_CHANGED
};
enum FdWhen {
  CanRead = FL_READ,
  CanWrite = FL_WRITE,
  OnExcept = FL_EXCEPT
};
enum TreeSort{
  TreeSortNone = FL_TREE_SORT_NONE,
  TreeSortAscending = FL_TREE_SORT_ASCENDING,
  TreeSortDescending = FL_TREE_SORT_DESCENDING
};
enum TreeConnector{
  TreeConnectorNone = FL_TREE_CONNECTOR_NONE,
  TreeConnectorDotted = FL_TREE_CONNECTOR_DOTTED,
  TreeConnectorSolid = FL_TREE_CONNECTOR_SOLID
};
enum TreeSelect{
  TreeSelectNone = FL_TREE_SELECT_NONE,
  TreeSelectSingle = FL_TREE_SELECT_SINGLE,
  TreeSelectMulti = FL_TREE_SELECT_MULTI
};
#if FLTK_ABI_VERSION >= 10302
enum TreeItemReselectMode{
  TreeSelectableOnce = FL_TREE_SELECTABLE_ONCE,
  TreeSelectableAlways = FL_TREE_SELECTABLE_ALWAYS
};
enum Tree_Item_Draw_Mode{
  TreeItemDrawDefault = FL_TREE_ITEM_DRAW_DEFAULT,
  TreeItemDrawLabelAndWidget = FL_TREE_ITEM_DRAW_LABEL_AND_WIDGET,
  TreeItemHeightFromWidget = FL_TREE_ITEM_HEIGHT_FROM_WIDGET
};
#endif /*FLTK_ABI_VERSION*/
enum KeyboardCode {
  Button = FL_Button,
  Kb_Backspace = FL_BackSpace,
  Kb_Tab = FL_Tab,
  Kb_IsoKey = FL_Iso_Key,
  Kb_Enter = FL_Enter,
  Kb_Pause = FL_Pause,
  Kb_Escape = FL_Escape,
  Kb_Home = FL_Home,
  Kb_Left = FL_Left,
  Kb_Up = FL_Up,
  Kb_Right = FL_Right,
  Kb_Down = FL_Down,
  Kb_PageUp = FL_Page_Up,
  Kb_PageDown = FL_Page_Down,
  Kb_End = FL_End,
  Kb_Print = FL_Print,
  Kb_Insert = FL_Insert,
  Kb_Menu = FL_Menu,
  Kb_Help = FL_Help,
  Kb_Kp = FL_KP,
  Kb_KpEnter = FL_KP_Enter,
  Kb_F = FL_F,
  Kb_Flast = FL_F_Last,
  Kb_ShiftL = FL_Shift_L,
  Kb_ShiftR = FL_Shift_R,
  Kb_ControlL = FL_Control_L,
  Kb_ControlR = FL_Control_R,
  Kb_MetaL = FL_Meta_L,
  Kb_MetaR = FL_Meta_R,
  Kb_AltL = FL_Alt_L,
  Kb_AltR = FL_Alt_R,
  Kb_Delete = FL_Delete,
  Kb_VolumeDown = FL_Volume_Down,
  Kb_VolumeMute = FL_Volume_Mute,
  Kb_VolumeUp = FL_Volume_Up,
  Kb_MediaPlay = FL_Media_Play,
  Kb_MediaStop = FL_Media_Stop,
  Kb_MediaPrev = FL_Media_Prev,
  Kb_MediaNext = FL_Media_Next,
  Kb_HomePage = FL_Home_Page,
  Kb_Mail = FL_Mail,
  Kb_Search = FL_Search,
  Kb_Back = FL_Back,
  Kb_Forward = FL_Forward,
  Kb_Stop = FL_Stop,
  Kb_Refresh = FL_Refresh,
  Kb_Sleep = FL_Sleep,
  Kb_Favorites = FL_Favorites,
  Kb_Shift = FL_SHIFT,
  Kb_CapsLock = FL_CAPS_LOCK,
  Kb_Ctrl = FL_CTRL,
  Kb_Alt = FL_ALT,
  Kb_NumLock = FL_NUM_LOCK,
  Kb_Meta = FL_META,
  Kb_ScrollLock = FL_SCROLL_LOCK,
  Kb_Button1 = FL_BUTTON1,
  Kb_Button2 = FL_BUTTON2,
  Kb_Button3 = FL_BUTTON3,
  Kb_Buttons = FL_BUTTONS,
};
enum MouseButton {
  Mouse_Left = FL_LEFT_MOUSE,
  Mouse_Middle = FL_MIDDLE_MOUSE,
  Mouse_Right = FL_RIGHT_MOUSE,
};

enum Damage {
 DamageChild   = FL_DAMAGE_CHILD,
 DamageExpose  = FL_DAMAGE_EXPOSE,
 DamageScroll  = FL_DAMAGE_SCROLL,
 DamageOverlay = FL_DAMAGE_OVERLAY,
 DamageUser1   = FL_DAMAGE_USER1,
 DamageUser2   = FL_DAMAGE_USER2,
 DamageAll     = FL_DAMAGE_ALL
} Damage;
enum GlutDraw {
 GlutNormal = GLUT_NORMAL,
 GlutOverlay = GLUT_OVERLAY
};
enum GlutMouseCodes {
 GlutLeftButton = GLUT_LEFT_BUTTON,
 GlutRightButton = GLUT_RIGHT_BUTTON,
 GlutMiddleButton = GLUT_MIDDLE_BUTTON
};
enum GlutUpDown {
 GlutUp = GLUT_UP,
 GlutDown = GLUT_DOWN
};
enum GlutVisibility {
 GlutVisible = GLUT_VISIBLE,
 GlutNotVisible = GLUT_NOT_VISIBLE
};
enum GlutMenuProperties {
 GlutMenuNotInUse = GLUT_MENU_NOT_IN_USE,
 GlutMenuInUse = GLUT_MENU_IN_USE,
 GlutMenuNumItems = GLUT_MENU_NUM_ITEMS
};
enum GlutEnteredLeft {
 GlutEntered = GLUT_ENTERED,
 GlutLeft = GLUT_LEFT
};
enum GlutKeyboardCodes {
 GlutKeyF1 =  GLUT_KEY_F1,
 GlutKeyF2 =  GLUT_KEY_F2,
 GlutKeyF3 =  GLUT_KEY_F3,
 GlutKeyF4 =  GLUT_KEY_F4,
 GlutKeyF5 =  GLUT_KEY_F5,
 GlutKeyF6 =  GLUT_KEY_F6,
 GlutKeyF7 =  GLUT_KEY_F7,
 GlutKeyF8 =  GLUT_KEY_F8,
 GlutKeyF9 =  GLUT_KEY_F9,
 GlutKeyF10 =  GLUT_KEY_F10,
 GlutKeyF11 =  GLUT_KEY_F11,
 GlutKeyF12 =  GLUT_KEY_F12,
 GlutKeyLeft =  GLUT_KEY_LEFT,
 GlutKeyUp =  GLUT_KEY_UP,
 GlutKeyRight =  GLUT_KEY_RIGHT,
 GlutKeyDown =  GLUT_KEY_DOWN,
 GlutKeyPageUp =  GLUT_KEY_PAGE_UP,
 GlutKeyPageDown =  GLUT_KEY_PAGE_DOWN,
 GlutKeyHome =  GLUT_KEY_HOME,
 GlutKeyEnd =  GLUT_KEY_END,
 GlutKeyInsert =  GLUT_KEY_INSERT,
 GlutActiveShift =  GLUT_ACTIVE_SHIFT,
 GlutActiveCtrl  =  GLUT_ACTIVE_CTRL,
 GlutActiveAlt   =  GLUT_ACTIVE_ALT
};
enum GlutConstants {
 GlutReturnZero =  GLUT_RETURN_ZERO,
 GlutDisplayModePossible =  GLUT_DISPLAY_MODE_POSSIBLE,
 GlutVersion =  GLUT_VERSION,
 GlutOverlayPossible =  GLUT_OVERLAY_POSSIBLE,
 GlutTransparentIndex =  GLUT_TRANSPARENT_INDEX,
 GlutNormalDamaged =  GLUT_NORMAL_DAMAGED,
 GlutOverlayDamaged =  GLUT_OVERLAY_DAMAGED
};
enum GlutWindowProperties {
 GlutWindowX =  GLUT_WINDOW_X,
 GlutWindowY =  GLUT_WINDOW_Y,
 GlutWindowWidth =  GLUT_WINDOW_WIDTH,
 GlutWindowHeight =  GLUT_WINDOW_HEIGHT,
 GlutWindowParent =  GLUT_WINDOW_PARENT,
 GlutScreenWidth =  GLUT_SCREEN_WIDTH,
 GlutScreenHeight =  GLUT_SCREEN_HEIGHT,
 GlutInitWindowX =  GLUT_INIT_WINDOW_X,
 GlutInitWindowY =  GLUT_INIT_WINDOW_Y,
 GlutInitWindowWidth =  GLUT_INIT_WINDOW_WIDTH,
 GlutInitWindowHeight =  GLUT_INIT_WINDOW_HEIGHT,
 GlutInitDisplayMode =  GLUT_INIT_DISPLAY_MODE,
 GlutWindowBufferSize =  GLUT_WINDOW_BUFFER_SIZE,
 GlutWindowStencilSize =  GLUT_WINDOW_STENCIL_SIZE,
 GlutWindowDepthSize =  GLUT_WINDOW_DEPTH_SIZE,
 GlutWindowRedSize =  GLUT_WINDOW_RED_SIZE,
 GlutWindowGreenSize =  GLUT_WINDOW_GREEN_SIZE,
 GlutWindowBlueSize =  GLUT_WINDOW_BLUE_SIZE,
 GlutWindowAlphaSize =  GLUT_WINDOW_ALPHA_SIZE,
 GlutWindowAccumRedSize =  GLUT_WINDOW_ACCUM_RED_SIZE,
 GlutWindowAccumGreenSize =  GLUT_WINDOW_ACCUM_GREEN_SIZE,
 GlutWindowAccumBlueSize =  GLUT_WINDOW_ACCUM_BLUE_SIZE,
 GlutWindowAccumAlphaSize =  GLUT_WINDOW_ACCUM_ALPHA_SIZE,
 GlutWindowDoublebuffer =  GLUT_WINDOW_DOUBLEBUFFER,
 GlutWindowRgba =  GLUT_WINDOW_RGBA,
 GlutWindowColormapSize =  GLUT_WINDOW_COLORMAP_SIZE,
 GlutWindowNumSamples =  GLUT_WINDOW_NUM_SAMPLES,
 GlutWindowStereo =  GLUT_WINDOW_STEREO
};
enum GlutCursor {
  GlutCursorRightArrow = 2,
  GlutCursorLeftArrow = 67,
  GlutCursorDestroy = 45,
  GlutCursorCycle = 26,
  GlutCursorSpray = 63,
  GlutCursorInfo = FL_CURSOR_HAND,
  GlutCursorHelp = FL_CURSOR_HELP,
  GlutCursorWait = FL_CURSOR_WAIT,
  GlutCursorText = FL_CURSOR_INSERT,
  GlutCursorLeftRight = FL_CURSOR_WE,
  GlutCursorTopSide = FL_CURSOR_N,
  GlutCursorBottomSide = FL_CURSOR_S,
  GlutCursorLeftSide = FL_CURSOR_W,
  GlutCursorRightSide = FL_CURSOR_E,
  GlutCursorTopLeftCorner = FL_CURSOR_NW,
  GlutCursorTopRightCorner = FL_CURSOR_NE,
  GlutCursorBottomRightCorner = FL_CURSOR_SE,
  GlutCursorBottomLeftCorner = FL_CURSOR_SW,
  GlutCursorInherit = FL_CURSOR_DEFAULT,
  GlutCursorNone = FL_CURSOR_NONE,
  GlutCursorUpDown = FL_CURSOR_NS,
  GlutCursorCrosshair = FL_CURSOR_CROSS
};
enum Cursor {
 CursorDefault = FL_CURSOR_DEFAULT,
 CursorArrow   = FL_CURSOR_ARROW,
 CursorCross   = FL_CURSOR_CROSS,
 CursorWait    = FL_CURSOR_WAIT,
 CursorInsert  = FL_CURSOR_INSERT,
 CursorHand    = FL_CURSOR_HAND,
 CursorHelp    = FL_CURSOR_HELP,
 CursorMove    = FL_CURSOR_MOVE,
 CursorNS      = FL_CURSOR_NS,
 CursorWE      = FL_CURSOR_WE,
 CursorNWSE    = FL_CURSOR_NWSE,
 CursorNesw    = FL_CURSOR_NESW,
 CursorNone    = FL_CURSOR_NONE,
 CursorN       = FL_CURSOR_N,
 CursorNE      = FL_CURSOR_NE,
 CursorE       = FL_CURSOR_E,
 CursorSE      = FL_CURSOR_SE,
 CursorS       = FL_CURSOR_S,
 CursorSW      = FL_CURSOR_SW,
 CursorW       = FL_CURSOR_W,
 CursorNW      = FL_CURSOR_NW
};
enum Mode {
 ModeRGB         = FL_RGB,
 ModeIndex       = FL_INDEX,
 ModeDouble      = FL_DOUBLE,
 ModeAccum       = FL_ACCUM,
 ModeAlpha       = FL_ALPHA,
 ModeDepth       = FL_DEPTH,
 ModeStencil     = FL_STENCIL,
 ModeRGB8        = FL_RGB8,
 ModeMultisample = FL_MULTISAMPLE,
 ModeStereo      = FL_STEREO,
 ModeFakeSingle  = FL_FAKE_SINGLE
};
enum AlignType {
 AlignCenter          = 0,
 AlignTop             = 1,
 AlignBottom          = 2,
 AlignLeft            = 4,
 AlignRight           = 8,
 AlignInside          = 16,
 AlignTextOverImage   = 0x0020,
 AlignClip            = 64,
 AlignWrap            = 128,
 AlignImageNextToText = 0x0100,
 AlignTextNextToImage = 0x0120,
 AlignImageBackdrop   = 0x0200,
 AlignLeftTop         = 0x0007,
 AlignRightTop        = 0x000b,
 AlignLeftBottom      = 0x000d,
 AlignRightBottom     = 0x000e,
 AlignPositionMask    = 0x000f,
 AlignImageMask       = 0x0320
};
#endc
{#enum Event {} deriving (Show) #}
{#enum When {} deriving (Show) #}
{#enum FdWhen {} deriving (Show) #}
{#enum TreeSort {} deriving (Show) #}
{#enum TreeConnector {} deriving (Show) #}
{#enum TreeSelect {} deriving (Show) #}
#if FLTK_ABI_VERSION >= 10302
{#enum TreeItemReselectMode {} deriving (Show) #}
{#enum TreeItemDrawMode {} deriving (Show) #}
#endif /*FLTK_ABI_VERSION*/
{#enum KeyboardCode {} deriving (Show, Eq) #}
{#enum MouseButton {} deriving (Show, Eq) #}
kb_Command, kb_Control, kb_KpLast, kb_KeyMask :: KeyboardCode
#ifdef __APPLE__
kb_Command = Kb_Meta
kb_Control = Kb_Control
#else
kb_Command = Kb_Ctrl
kb_Control = Kb_Meta
#endif
kb_KpLast = Kb_F
kb_KeyMask = Kb_Delete
{#enum Damage {} deriving (Show) #}
{#enum GlutDraw {} deriving (Show) #}
{#enum GlutMouseCodes {} deriving (Show) #}
{#enum GlutUpDown {} deriving (Show) #}
{#enum GlutVisibility {} deriving (Show) #}
{#enum GlutMenuProperties {} deriving (Show) #}
{#enum GlutEnteredLeft {} deriving (Show) #}
{#enum GlutKeyboardCodes {} deriving (Show) #}
{#enum GlutConstants {} deriving (Show) #}
{#enum GlutWindowProperties {} deriving (Show) #}
{#enum GlutCursor {} deriving (Show) #}
glutCursorFullCrossHair :: GlutCursor
glutCursorFullCrossHair = GlutCursorCrosshair
{#enum Cursor {} deriving (Show) #}
{#enum Mode   {} deriving (Show) #}
{#enum AlignType {} deriving (Show) #}
alignNoWrap, alignImageOverText :: AlignType
alignNoWrap = AlignCenter
alignImageOverText = AlignCenter

data Boxtype = NoBox
             | FlatBox
             | UpBox
             | DownBox
             | UpFrame
             | DownFrame
             | ThinUpBox
             | ThinDownBox
             | ThinUpFrame
             | ThinDownFrame
             | EngravedBox
             | EmbossedBox
             | EngravedFrame
             | EmbossedFrame
             | BorderBox
             | ShadowBox
             | BorderFrame
             | ShadowFrame
             | RoundedBox
             | RshadowBox
             | RoundedFrame
             | RFlatBox
             | RoundUpBox
             | RoundDownBox
             | DiamondUpBox
             | DiamondDownBox
             | OvalBox
             | OshadowBox
             | OvalFrame
             | FloatBox
             | PlasticUpBox
             | PlasticDownBox
             | PlasticUpFrame
             | PlasticDownFrame
             | PlasticThinUpBox
             | PlasticThinDownBox
             | PlasticRoundUpBox
             | PlasticRoundDownBox
             | GtkUpBox
             | GtkDownBox
             | GtkUpFrame
             | GtkDownFrame
             | GtkThinUpBox
             | GtkThinDownBox
             | GtkThinUpFrame
             | GtkThinDownFrame
             | GtkRoundUpBox
             | GtkRoundDownBox
             | FreeBoxtype
             deriving (Show)
instance Enum Boxtype where
  fromEnum NoBox = 0
  fromEnum FlatBox = 1
  fromEnum UpBox = 2
  fromEnum DownBox = 3
  fromEnum UpFrame = 4
  fromEnum DownFrame = 5
  fromEnum ThinUpBox = 6
  fromEnum ThinDownBox = 7
  fromEnum ThinUpFrame = 8
  fromEnum ThinDownFrame = 9
  fromEnum EngravedBox = 10
  fromEnum EmbossedBox = 11
  fromEnum EngravedFrame = 12
  fromEnum EmbossedFrame = 13
  fromEnum BorderBox = 14
  fromEnum ShadowBox = defineShadowBox_
  fromEnum BorderFrame = 16
  fromEnum ShadowFrame = defineShadowBox_ + 2
  fromEnum RoundedBox = defineRoundedBox_
  fromEnum RshadowBox = defineRshadowBox_
  fromEnum RoundedFrame = defineRoundedBox_ + 2
  fromEnum RFlatBox = defineRflatBox_
  fromEnum RoundUpBox = defineRoundUpBox_
  fromEnum RoundDownBox = defineRoundUpBox_ + 1
  fromEnum DiamondUpBox = defineDiamondBox_
  fromEnum DiamondDownBox = defineDiamondBox_ + 1
  fromEnum OvalBox = defineOvalBox_
  fromEnum OshadowBox = defineOvalBox_ + 1
  fromEnum OvalFrame = defineOvalBox_ + 2
  fromEnum FloatBox = defineOvalBox_ + 3
  fromEnum PlasticUpBox = definePlasticUpBox_
  fromEnum PlasticDownBox = definePlasticUpBox_ + 1
  fromEnum PlasticUpFrame = definePlasticUpBox_ + 2
  fromEnum PlasticDownFrame = definePlasticUpBox_ + 3
  fromEnum PlasticThinUpBox = definePlasticUpBox_ + 4
  fromEnum PlasticThinDownBox = definePlasticUpBox_ + 5
  fromEnum PlasticRoundUpBox = definePlasticUpBox_ + 6
  fromEnum PlasticRoundDownBox = definePlasticUpBox_ + 7
  fromEnum GtkUpBox = defineGtkUpBox_
  fromEnum GtkDownBox = defineGtkUpBox_ + 1
  fromEnum GtkUpFrame = defineGtkUpBox_ + 2
  fromEnum GtkDownFrame = defineGtkUpBox_ + 3
  fromEnum GtkThinUpBox = defineGtkUpBox_ + 4
  fromEnum GtkThinDownBox = defineGtkUpBox_ + 5
  fromEnum GtkThinUpFrame = defineGtkUpBox_ + 6
  fromEnum GtkThinDownFrame = defineGtkUpBox_ + 7
  fromEnum GtkRoundUpBox = defineGtkUpBox_ + 8
  fromEnum GtkRoundDownBox = defineGtkUpBox_ + 9
  fromEnum FreeBoxtype = 48

  toEnum 0 = NoBox
  toEnum 1 = FlatBox
  toEnum 2 = UpBox
  toEnum 3 = DownBox
  toEnum 4 = UpFrame
  toEnum 5 = DownFrame
  toEnum 6 = ThinUpBox
  toEnum 7 = ThinDownBox
  toEnum 8 = ThinUpFrame
  toEnum 9 = ThinDownFrame
  toEnum 10 = EngravedBox
  toEnum 11 = EmbossedBox
  toEnum 12 = EngravedFrame
  toEnum 13 = EmbossedFrame
  toEnum 14 = BorderBox
  toEnum 16 = BorderFrame
  toEnum 48 = FreeBoxtype
  toEnum x | x == defineShadowBox_ = ShadowBox
           | x == defineShadowBox_ + 2 = ShadowFrame
           | x == defineRoundedBox_  = RoundedBox
           | x == defineRshadowBox_ = RshadowBox
           | x == defineRoundedBox_ + 2 = RoundedFrame
           | x == defineRflatBox_ = RFlatBox
           | x == defineRoundUpBox_ = RoundUpBox
           | x == defineRoundUpBox_ + 1 = RoundDownBox
           | x == defineDiamondBox_ = DiamondUpBox
           | x == defineDiamondBox_ + 1 = DiamondDownBox
           | x == defineOvalBox_ = OvalBox
           | x == defineOvalBox_ + 1 = OshadowBox
           | x == defineOvalBox_ + 2 = OvalFrame
           | x == defineOvalBox_ + 3 = FloatBox
           | x == definePlasticUpBox_ = PlasticUpBox
           | x == definePlasticUpBox_ + 1 = PlasticDownBox
           | x == definePlasticUpBox_ + 2 = PlasticUpFrame
           | x == definePlasticUpBox_ + 3 = PlasticDownFrame
           | x == definePlasticUpBox_ + 4 = PlasticThinUpBox
           | x == definePlasticUpBox_ + 5 = PlasticThinDownBox
           | x == definePlasticUpBox_ + 6 = PlasticRoundUpBox
           | x == definePlasticUpBox_ + 7 = PlasticRoundDownBox
           | x == defineGtkUpBox_  = GtkUpBox
           | x == defineGtkUpBox_ + 1 = GtkDownBox
           | x == defineGtkUpBox_ + 2 = GtkUpFrame
           | x == defineGtkUpBox_ + 3 = GtkDownFrame
           | x == defineGtkUpBox_ + 4 = GtkThinUpBox
           | x == defineGtkUpBox_ + 5 = GtkThinDownBox
           | x == defineGtkUpBox_ + 6 = GtkThinUpFrame
           | x == defineGtkUpBox_ + 7 = GtkThinDownFrame
           | x == defineGtkUpBox_ + 8 = GtkRoundUpBox
           | x == defineGtkUpBox_ + 9 = GtkRoundDownBox
           | otherwise = error ("Boxtype.toEnum: Cannot match " ++
	                                         show otherwise)
frame,frameBox, circleBox, diamondBox :: Boxtype
frame = EngravedFrame
frameBox = EngravedBox
circleBox = RoundDownBox
diamondBox = DiamondDownBox


-- Fonts
newtype Font = Font Int
data FontAttribute = Bold | Italic | BoldItalic deriving Enum
cFromFont :: Font -> CInt
cFromFont (Font f) = fromIntegral f
cToFont :: CInt -> Font
cToFont f = Font (fromIntegral f)

cFromFontAttribute :: FontAttribute -> CInt
cFromFontAttribute Bold = cFromFont helveticaBold
cFromFontAttribute Italic = cFromFont helveticaItalic
cFromFontAttribute BoldItalic = cFromFont helveticaBoldItalic

cToFontAttribute :: CInt -> Maybe FontAttribute
cToFontAttribute attributeCode =
      case (attributeCode `has` helveticaBold, attributeCode `has` helveticaItalic) of
        (True,True) -> Just BoldItalic
        (True,False) -> Just Bold
        (False,True) -> Just Italic
        (False,False) -> Nothing
      where
        has :: CInt -> Font -> Bool
        has code (Font f) = code .&. (fromIntegral f) /= 0

helvetica :: Font
helvetica = Font 0
helveticaBold :: Font
helveticaBold = Font 1
helveticaItalic :: Font
helveticaItalic = Font 2
helveticaBoldItalic :: Font
helveticaBoldItalic = Font 3
courier :: Font
courier = Font 4
courierBold :: Font
courierBold = Font 5
courierItalic :: Font
courierItalic = Font 6
courierBoldItalic :: Font
courierBoldItalic = Font 7
times :: Font
times = Font 8
timesBold :: Font
timesBold = Font 9
timesItalic :: Font
timesItalic = Font 10
timesBoldItalic :: Font
timesBoldItalic = Font 11
symbol :: Font
symbol = Font 12
screen :: Font
screen = Font 13
screenBold :: Font
screenBold = Font 14
zapfDingbats :: Font
zapfDingbats = Font 15
freeFont :: Font
freeFont = Font 16

-- Colors

newtype Color = Color Int deriving Show
foregroundColor :: Color
foregroundColor = Color 0
background2Color :: Color
background2Color = Color 7
inactiveColor :: Color
inactiveColor = Color 8
selectionColor :: Color
selectionColor = Color 15
gray0Color :: Color
gray0Color = Color 32
dark3Color :: Color
dark3Color = Color 39
dark2Color :: Color
dark2Color = Color 45
dark1Color :: Color
dark1Color = Color 47
backgroundColor :: Color
backgroundColor = Color 49
light1Color :: Color
light1Color = Color 50
light2Color :: Color
light2Color = Color 52
light3Color :: Color
light3Color = Color 54
blackColor :: Color
blackColor = Color 56
redColor :: Color
redColor = Color 88
greenColor :: Color
greenColor = Color 63
yellowColor :: Color
yellowColor = Color 95
blueColor :: Color
blueColor = Color 216
magentaColor :: Color
magentaColor = Color 248
cyanColor :: Color
cyanColor = Color 223
darkRedColor :: Color
darkRedColor = Color 72
darkGreenColor :: Color
darkGreenColor = Color 60
darkYellowColor :: Color
darkYellowColor = Color 76
darkBlueColor :: Color
darkBlueColor = Color 136
darkMagentaColor :: Color
darkMagentaColor = Color 152
darkCyanColor :: Color
darkCyanColor = Color 140
whiteColor :: Color
whiteColor = Color 255
freeColor :: Color
freeColor = Color 16
numFreeColor :: Color
numFreeColor =Color 16
grayRampColor :: Color
grayRampColor = Color 32
numGray:: Color
numGray= Color 24
grayColor :: Color
grayColor = backgroundColor
colorCubeColor :: Color
colorCubeColor = Color 56
numRed :: Color
numRed = Color 5
numGreen :: Color
numGreen = Color 8
numBlue :: Color
numBlue = Color 5

newtype FontSize = FontSize CInt

-- Fl_Mode Aliases

single :: Mode
single = ModeRGB


-- Fl_LabelType

data Labeltype = NormalLabel
               | NoLabel
               | ShadowLabel
               | EngravedLabel
               | EmbossedLabel
               | FreeLabelType

instance Enum Labeltype where
    fromEnum NormalLabel = 0
    fromEnum NoLabel = 1
    fromEnum ShadowLabel = defineShadowLabel_
    fromEnum EngravedLabel = defineEngravedLabel_
    fromEnum EmbossedLabel = defineEmbossedLabel_
    fromEnum FreeLabelType = 8

    toEnum 0 = NormalLabel
    toEnum 1 = NoLabel
    toEnum x | x == defineShadowLabel_ = ShadowLabel
             | x == defineEngravedLabel_ = EngravedLabel
             | x == defineEmbossedLabel_ = EmbossedLabel
    toEnum 8 = FreeLabelType

symbolLabel :: Labeltype
symbolLabel = NormalLabel

defineRoundUpBox_ :: (Num a) => a
defineRoundUpBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_ROUND_UP_BOXC #}

defineRoundUpBox :: Boxtype
defineRoundUpBox =
    toEnum defineRoundUpBox_

defineShadowBox_ :: (Num a) => a
defineShadowBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_SHADOW_BOXC #}

defineShadowBox :: Boxtype
defineShadowBox =
    toEnum defineShadowBox_

defineRoundedBox_ :: (Num a) => a
defineRoundedBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_ROUNDED_BOXC #}
defineRoundedBox :: Boxtype
defineRoundedBox = toEnum defineRoundedBox_

defineRflatBox_ :: (Num a) => a
defineRflatBox_ =
    fromIntegral $ {#call pure unsafe   fl_define_FL_RFLAT_BOXC #}
defineRflatBox :: Boxtype
defineRflatBox = toEnum defineRflatBox_

defineRshadowBox_ :: (Num a) => a
defineRshadowBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_RSHADOW_BOXC #}
defineRshadowBox :: Boxtype
defineRshadowBox = toEnum defineRshadowBox_

defineDiamondBox_ :: (Num a) => a
defineDiamondBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_DIAMOND_BOXC #}
defineDiamondBox :: Boxtype
defineDiamondBox = toEnum defineDiamondBox_

defineOvalBox_ :: (Num a) => a
defineOvalBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_OVAL_BOXC #}
defineOvalBox :: Boxtype
defineOvalBox = toEnum defineOvalBox_

definePlasticUpBox_ :: (Num a) => a
definePlasticUpBox_ =
    fromIntegral $ {#call pure unsafe fl_define_FL_PLASTIC_UP_BOXC #}
definePlasticUpBox :: Boxtype
definePlasticUpBox = toEnum definePlasticUpBox_

defineGtkUpBox_ :: (Num a) => a
defineGtkUpBox_ =
    fromIntegral $ {#call pure unsafe  fl_define_FL_GTK_UP_BOXC #}
defineGtkUpBox :: Boxtype
defineGtkUpBox = toEnum defineGtkUpBox_

defineShadowLabel_ :: (Num a) => a
defineShadowLabel_ =
   fromIntegral $ {#call pure unsafe fl_define_FL_SHADOW_LABELC #}
defineShadowLabel :: Labeltype
defineShadowLabel = toEnum defineShadowLabel_

defineEngravedLabel_ :: (Num a) => a
defineEngravedLabel_ =
   fromIntegral $ {#call pure unsafe fl_define_FL_ENGRAVED_LABELC #}

defineEngravedLabel :: Labeltype
defineEngravedLabel = toEnum defineEngravedLabel_

defineEmbossedLabel_ :: (Num a) => a
defineEmbossedLabel_ =
   fromIntegral $ {#call pure unsafe fl_define_FL_EMBOSSED_LABELC #}

defineEmbossedLabel :: Labeltype
defineEmbossedLabel = toEnum defineEmbossedLabel_

alignTopLeft :: AlignType
alignTopLeft = toEnum $ fromIntegral {#call pure unsafe FL_ALIGN_TOP_LEFTC as
                                                        aLIGN_TOP_LEFTC #}
alignTopRight :: AlignType
alignTopRight = toEnum $ fromIntegral {#call pure unsafe FL_ALIGN_TOP_RIGHTC as
                                                         aLIGN_TOP_RIGHTC #}

alignBottomLeft :: AlignType
alignBottomLeft =
       toEnum $ fromIntegral {#call pure unsafe FL_ALIGN_BOTTOM_LEFTC as
                                                aLIGN_BOTTOM_LEFTC #}

alignBottomRight :: AlignType
alignBottomRight =
      toEnum $ fromIntegral {#call pure unsafe FL_ALIGN_BOTTOM_RIGHTC as
                                               aLIGN_BOTTOM_RIGHTC #}
cFromColor :: Color -> CUInt
cFromColor (Color c) = fromIntegral c
cToColor :: CUInt-> Color
cToColor c = Color (fromIntegral c)

{#fun pure unsafe fl_inactiveC as
                 inactive {cFromColor `Color' } -> `Color' cToColor#}
{#fun pure unsafe fl_contrastC as
                  contrast {cFromColor `Color',cFromColor `Color'}
                  -> `Color' cToColor#}
{#fun pure unsafe fl_color_averageC as
                  color_average {cFromColor `Color',
                                 cFromColor `Color',
                                 realToFrac `Double'}
                  -> `Color' cToColor#}
{#fun pure unsafe fl_lighterC as
                  lighter {cFromColor `Color'} -> `Color' cToColor#}
{#fun pure unsafe fl_darkerC as
                  darker {cFromColor `Color'} -> `Color' cToColor#}
{#fun pure unsafe fl_rgb_color_with_rgbC as
                  rgbColorWithRgb {castCharToCUChar `Char',
                                   castCharToCUChar `Char',
                                   castCharToCUChar `Char'}
                  -> `Color' cToColor#}
{#fun pure unsafe fl_rgb_color_with_grayscaleC as
                  rgbColorWithGrayscale {castCharToCUChar `Char'}
                  -> `Color' cToColor#}
{#fun pure unsafe fl_gray_rampC as grayRamp {`Int'} -> `Color' cToColor#}
{#fun pure unsafe fl_color_cubeC as colorCube {`Int',`Int',`Int'}
                  -> `Color' cToColor#}
