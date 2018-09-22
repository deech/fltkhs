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
     SearchDirection(..),
     TreeItemReselectMode(..),
     TreeItemDrawMode(..),
     -- * Keyboard and mouse codes
     SpecialKey(..),
     allSpecialKeys,
     allShortcutSpecialKeys,
     MouseButton(..),
     EventState(..),
     KeyboardKeyMask(..),
     MouseButtonsMask(..),
     allEventStates,
     kb_CommandState, kb_ControlState, kb_KpLast,
     -- * Widget damage types
     Damage(..),
     allDamages,
     -- * Cursor type
     Cursor(..),
     -- * Various modes
     Mode(..),
     Modes(..),
     single,
     allModes,
     allTreeItemDrawModes,
     -- * Alignmenkt
     Alignments(..),
     AlignType(..),
     alignCenter,
     alignTop,
     alignBottom,
     alignLeft,
     alignRight,
     alignInside,
     alignTextOverImage,
     alignClip,
     alignWrap,
     alignImageNextToText,
     alignTextNextToImage,
     alignImageBackdrop,
     alignLeftTop,
     alignRightTop,
     alignLeftBottom,
     alignRightBottom,
     alignPositionMask,
     alignImageMask,
     alignNoWrap,
     alignImageOverText,
     alignTopLeft,
     alignTopRight,
     alignBottomLeft,
     alignBottomRight,
     allAlignTypes,
     allWhen,
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
     defineIconLabel,
     -- * Fonts
     Font(..),
     FontAttribute(..),
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
     colorAverage,
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
     defineEmbossedLabel,
     defineMultiLabel,
     -- defineIconLabel,
     defineImageLabel,
     -- * Color
     RGB
    )
where
import C2HS
#c
enum VersionInfo {
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
  Fullscreen = FL_FULLSCREEN,
  ZoomGesture = FL_ZOOM_GESTURE
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

enum TabsWhen {
  TabsWhenNever = FL_WHEN_NEVER,
  TabsWhenChanged = FL_WHEN_CHANGED,
  TabsWhenNotChanged = FL_WHEN_NOT_CHANGED,
  TabsWhenRelease = FL_WHEN_RELEASE
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
  TreeSelectMulti = FL_TREE_SELECT_MULTI,
  TreeSelectSingleDraggable = FL_TREE_SELECT_SINGLE_DRAGGABLE
};
enum SearchDirection {
  SearchDirectionDown = FL_Down,
  SearchDirectionUp = FL_Up
};
enum  TreeItemReselectMode{
  TreeSelectableOnce = FL_TREE_SELECTABLE_ONCE,
  TreeSelectableAlways = FL_TREE_SELECTABLE_ALWAYS
};
enum TreeItemDrawMode{
  TreeItemDrawDefault = FL_TREE_ITEM_DRAW_DEFAULT,
  TreeItemDrawLabelAndWidget = FL_TREE_ITEM_DRAW_LABEL_AND_WIDGET,
  TreeItemHeightFromWidget = FL_TREE_ITEM_HEIGHT_FROM_WIDGET
};
enum SpecialKey {
  Button = FL_Button,
  Kb_Clear = FL_Clear,
  Kb_Backspace = FL_BackSpace,
  Kb_Tab = FL_Tab,
  Kb_IsoKey = FL_Iso_Key,
  Kb_Enter = FL_Enter,
  Kb_Pause = FL_Pause,
  Kb_Escape = FL_Escape,
  Kb_Kana = FL_Kana,
  Kb_Eisu = FL_Eisu,
  Kb_Yen = FL_Yen,
  Kb_JisUnderscore = FL_JIS_Underscore,
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
  Kb_CapsLock = FL_Caps_Lock,
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
};
enum MouseButton {
  Mouse_Left = FL_LEFT_MOUSE,
  Mouse_Middle = FL_MIDDLE_MOUSE,
  Mouse_Right = FL_RIGHT_MOUSE,
};
enum EventState {
  Kb_ShiftState = FL_SHIFT,
  Kb_CapsLockState = FL_CAPS_LOCK,
  Kb_CtrlState = FL_CTRL,
  Kb_AltState = FL_ALT,
  Kb_NumLockState = FL_NUM_LOCK,
  Kb_MetaState = FL_META,
  Kb_ScrollLockState = FL_SCROLL_LOCK,
  Mouse_Button1State = FL_BUTTON1,
  Mouse_Button2State = FL_BUTTON2,
  Mouse_Button3State= FL_BUTTON3,
};
enum KeyboardKeyMask {
  Kb_KeyMask = FL_KEY_MASK
};
enum MouseButtonsMask {
  Mouse_ButtonsMask = FL_BUTTONS,
};
enum Damage {
 DamageChild   = FL_DAMAGE_CHILD,
 DamageExpose  = FL_DAMAGE_EXPOSE,
 DamageScroll  = FL_DAMAGE_SCROLL,
 DamageOverlay = FL_DAMAGE_OVERLAY,
 DamageUser1   = FL_DAMAGE_USER1,
 DamageUser2   = FL_DAMAGE_USER2,
 DamageAll     = FL_DAMAGE_ALL
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
 ModeRGB8        = FL_RGB8,
 ModeIndex       = FL_INDEX,
 ModeDouble      = FL_DOUBLE,
 ModeAccum       = FL_ACCUM,
 ModeAlpha       = FL_ALPHA,
 ModeDepth       = FL_DEPTH,
 ModeStencil     = FL_STENCIL,
 ModeMultisample = FL_MULTISAMPLE,
 ModeStereo      = FL_STEREO,
 ModeFakeSingle  = FL_FAKE_SINGLE
#ifdef GLSUPPORT
 , ModeOpenGL3     = FL_OPENGL3
#endif
};
enum AlignType {
 AlignTypeCenter          = 0,
 AlignTypeTop             = 1,
 AlignTypeBottom          = 2,
 AlignTypeLeft            = 4,
 AlignTypeRight           = 8,
 AlignTypeInside          = 16,
 AlignTypeTextOverImage   = 0x0020,
 AlignTypeClip            = 64,
 AlignTypeWrap            = 128,
 AlignTypeImageNextToText = 0x0100,
 AlignTypeTextNextToImage = 0x0120,
 AlignTypeImageBackdrop   = 0x0200,
 AlignTypeLeftTop         = 0x0007,
 AlignTypeRightTop        = 0x000b,
 AlignTypeLeftBottom      = 0x000d,
 AlignTypeRightBottom     = 0x000e,
};
#endc
{#enum Event {} deriving (Show, Eq) #}
{#enum When {} deriving (Show, Eq, Ord) #}
{#enum FdWhen {} deriving (Show, Eq, Ord) #}
{#enum TreeSort {} deriving (Show, Eq) #}
{#enum TreeConnector {} deriving (Show, Eq) #}
{#enum TreeSelect {} deriving (Show, Eq) #}
{#enum SearchDirection {} deriving (Show, Eq) #}
{#enum TreeItemReselectMode {} deriving (Show, Eq) #}
{#enum TreeItemDrawMode {} deriving (Show, Eq, Ord) #}
{#enum SpecialKey {} deriving (Show, Eq, Ord) #}

allShortcutSpecialKeys :: [CInt]
allShortcutSpecialKeys = [
  fromIntegral $ fromEnum (Kb_Backspace),
  fromIntegral $ fromEnum (Kb_Tab),
  fromIntegral $ fromEnum (Kb_Clear),
  fromIntegral $ fromEnum (Kb_Enter),
  fromIntegral $ fromEnum (Kb_Pause),
  fromIntegral $ fromEnum (Kb_ScrollLockState),
  fromIntegral $ fromEnum (Kb_Escape),
  fromIntegral $ fromEnum (Kb_Home),
  fromIntegral $ fromEnum (Kb_Left),
  fromIntegral $ fromEnum (Kb_Up),
  fromIntegral $ fromEnum (Kb_Right),
  fromIntegral $ fromEnum (Kb_Down),
  fromIntegral $ fromEnum (Kb_PageUp),
  fromIntegral $ fromEnum (Kb_PageDown),
  fromIntegral $ fromEnum (Kb_End),
  fromIntegral $ fromEnum (Kb_Print),
  fromIntegral $ fromEnum (Kb_Insert),
  fromIntegral $ fromEnum (Kb_Menu),
  fromIntegral $ fromEnum (Kb_NumLockState),
  fromIntegral $ fromEnum (Kb_KpEnter),
  fromIntegral $ fromEnum (Kb_ShiftL),
  fromIntegral $ fromEnum (Kb_ShiftR),
  fromIntegral $ fromEnum (Kb_ControlL),
  fromIntegral $ fromEnum (Kb_ControlR),
  fromIntegral $ fromEnum (Kb_CapsLock),
  fromIntegral $ fromEnum (Kb_MetaL),
  fromIntegral $ fromEnum (Kb_MetaR),
  fromIntegral $ fromEnum (Kb_AltL),
  fromIntegral $ fromEnum (Kb_AltR),
  fromIntegral $ fromEnum (Kb_Delete)
  ]

allSpecialKeys :: [SpecialKey]
allSpecialKeys = [
    Button,
    Kb_Backspace,
    Kb_Clear,
    Kb_Tab,
    Kb_IsoKey,
    Kb_Enter,
    Kb_Pause,
    Kb_Escape,
    Kb_Kana,
    Kb_Eisu,
    Kb_Yen,
    Kb_JisUnderscore,
    Kb_Home,
    Kb_Left,
    Kb_Up,
    Kb_Right,
    Kb_Down,
    Kb_PageUp,
    Kb_PageDown,
    Kb_End,
    Kb_Print,
    Kb_Insert,
    Kb_Menu,
    Kb_Help,
    Kb_Kp,
    Kb_KpEnter,
    Kb_F,
    Kb_Flast,
    Kb_ShiftL,
    Kb_ShiftR,
    Kb_ControlL,
    Kb_ControlR,
    Kb_CapsLock,
    Kb_MetaL,
    Kb_MetaR,
    Kb_AltL,
    Kb_AltR,
    Kb_Delete,
    Kb_VolumeDown,
    Kb_VolumeMute,
    Kb_VolumeUp,
    Kb_MediaPlay,
    Kb_MediaStop,
    Kb_MediaPrev,
    Kb_MediaNext,
    Kb_HomePage,
    Kb_Mail,
    Kb_Search,
    Kb_Back,
    Kb_Forward,
    Kb_Stop,
    Kb_Refresh,
    Kb_Sleep,
    Kb_Favorites
  ]

{#enum MouseButton {} deriving (Show, Eq) #}
{#enum EventState {} deriving (Show, Eq, Ord) #}
{#enum KeyboardKeyMask {} deriving (Show, Eq, Ord) #}
{#enum MouseButtonsMask {} deriving (Show, Eq, Ord) #}
kb_CommandState, kb_ControlState :: EventState
#ifdef __APPLE__
kb_CommandState = Kb_MetaState
kb_ControlState = Kb_CtrlState
#else
kb_CommandState = Kb_CtrlState
kb_ControlState = Kb_MetaState
#endif
kb_KpLast :: SpecialKey
kb_KpLast = Kb_F
{#enum Damage {} deriving (Show, Eq, Ord) #}
allDamages :: [Damage]
allDamages =
  [
   DamageChild
   , DamageExpose
   , DamageScroll
   , DamageOverlay
   , DamageUser1
   , DamageUser2
   , DamageAll
  ]

{#enum Cursor {} deriving (Show, Eq, Ord) #}
{#enum Mode   {} deriving (Show,Eq,Ord) #}
-- Fl_Mode Aliases
single :: Mode
single = ModeRGB
newtype Modes = Modes [Mode] deriving (Show,Eq,Ord)
allModes :: [Mode]
allModes =
  [
    ModeRGB,
    ModeIndex,
    ModeDouble,
    ModeAccum,
    ModeAlpha,
    ModeDepth,
    ModeStencil,
    ModeRGB8,
    ModeMultisample,
    ModeStereo,
    ModeFakeSingle
#ifdef GLSUPPORT
    , ModeOpenGL3
#endif
  ]

{#enum AlignType {} deriving (Show, Eq, Ord) #}
newtype Alignments = Alignments [AlignType] deriving (Eq, Show, Ord)
alignCenter :: Alignments
alignCenter = Alignments [AlignTypeCenter]
alignTop :: Alignments
alignTop = Alignments [AlignTypeTop]
alignBottom :: Alignments
alignBottom = Alignments [AlignTypeBottom]
alignLeft :: Alignments
alignLeft = Alignments [AlignTypeLeft]
alignRight :: Alignments
alignRight = Alignments [AlignTypeRight]
alignInside :: Alignments
alignInside = Alignments [AlignTypeInside]
alignTextOverImage :: Alignments
alignTextOverImage = Alignments [AlignTypeTextOverImage]
alignClip :: Alignments
alignClip = Alignments [AlignTypeClip]
alignWrap :: Alignments
alignWrap = Alignments [AlignTypeWrap]
alignImageNextToText :: Alignments
alignImageNextToText = Alignments [AlignTypeImageNextToText]
alignTextNextToImage :: Alignments
alignTextNextToImage = Alignments [AlignTypeTextNextToImage]
alignImageBackdrop :: Alignments
alignImageBackdrop = Alignments [AlignTypeImageBackdrop]
alignLeftTop :: Alignments
alignLeftTop = Alignments [AlignTypeLeftTop]
alignRightTop :: Alignments
alignRightTop = Alignments [AlignTypeRightTop]
alignLeftBottom :: Alignments
alignLeftBottom = Alignments [AlignTypeLeftBottom]
alignRightBottom :: Alignments
alignRightBottom = Alignments [AlignTypeRightBottom]
alignPositionMask :: Alignments
alignPositionMask = Alignments [AlignTypeLeft, AlignTypeRight, AlignTypeTop, AlignTypeBottom]
alignImageMask :: Alignments
alignImageMask = Alignments [AlignTypeImageBackdrop, AlignTypeImageNextToText, AlignTypeTextOverImage]
alignNoWrap :: Alignments
alignNoWrap = alignCenter
alignImageOverText :: Alignments
alignImageOverText = alignCenter
alignTopLeft :: Alignments
alignTopLeft = Alignments [AlignTypeTop, AlignTypeLeft]
alignTopRight :: Alignments
alignTopRight = Alignments [AlignTypeTop, AlignTypeRight]
alignBottomLeft :: Alignments
alignBottomLeft = Alignments [AlignTypeBottom, AlignTypeLeft]
alignBottomRight :: Alignments
alignBottomRight = Alignments [AlignTypeBottom, AlignTypeRight]
allAlignTypes :: [AlignType]
allAlignTypes = [
      AlignTypeCenter,
      AlignTypeTop,
      AlignTypeBottom,
      AlignTypeLeft,
      AlignTypeRight,
      AlignTypeInside,
      AlignTypeTextOverImage,
      AlignTypeClip,
      AlignTypeWrap,
      AlignTypeImageNextToText,
      AlignTypeTextNextToImage,
      AlignTypeImageBackdrop,
      AlignTypeLeftTop,
      AlignTypeRightTop,
      AlignTypeLeftBottom,
      AlignTypeRightBottom
      ]
allWhen :: [When]
allWhen = [
    WhenNever,
    WhenChanged,
    WhenNotChanged,
    WhenRelease,
    WhenReleaseAlways,
    WhenEnterKey,
    WhenEnterKeyAlways,
    WhenEnterKeyChanged
  ]

allEventStates :: [EventState]
allEventStates = [
    Kb_ShiftState,
    Kb_CapsLockState,
    Kb_CtrlState,
    Kb_AltState,
    Kb_NumLockState,
    Kb_MetaState,
    Kb_ScrollLockState,
    Mouse_Button1State,
    Mouse_Button2State,
    Mouse_Button3State
  ]

allTreeItemDrawModes :: [TreeItemDrawMode]
allTreeItemDrawModes = [
    TreeItemDrawDefault,
    TreeItemDrawLabelAndWidget,
    TreeItemHeightFromWidget
  ]

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
             | GleamUpBox
             | GleamDownBox
             | GleamUpFrame
             | GleamDownFrame
             | GleamThinUpBox
             | GleamThinDownBox
             | GleamRoundUpBox
             | GleamRoundDownBox
             | FreeBoxtype
             deriving (Show, Eq, Ord)
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
  fromEnum GleamUpBox = defineGleamUpBox_
  fromEnum GleamDownBox = defineGleamUpBox_ + 1
  fromEnum GleamUpFrame = defineGleamUpBox_ + 2
  fromEnum GleamDownFrame = defineGleamUpBox_ + 3
  fromEnum GleamThinUpBox = defineGleamUpBox_ + 4
  fromEnum GleamThinDownBox = defineGleamUpBox_ + 5
  fromEnum GleamRoundUpBox = defineGleamUpBox_ + 6
  fromEnum GleamRoundDownBox = defineGleamUpBox_ + 7
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
           | x == defineGleamUpBox_  = GleamUpBox
           | x == defineGleamUpBox_ + 1 = GleamDownBox
           | x == defineGleamUpBox_ + 2 = GleamUpFrame
           | x == defineGleamUpBox_ + 3 = GleamDownFrame
           | x == defineGleamUpBox_ + 4 = GleamThinUpBox
           | x == defineGleamUpBox_ + 5 = GleamThinDownBox
           | x == defineGleamUpBox_ + 6 = GleamRoundUpBox
           | x == defineGleamUpBox_ + 7 = GleamRoundDownBox
           | otherwise = error ("Boxtype.toEnum: Cannot match " ++ show otherwise)
frame,frameBox, circleBox, diamondBox :: Boxtype
frame = EngravedFrame
frameBox = EngravedBox
circleBox = RoundDownBox
diamondBox = DiamondDownBox


-- Fonts
newtype Font = Font Int deriving (Eq, Show, Ord)
data FontAttribute = Bold | Italic | BoldItalic deriving (Show, Eq, Ord, Enum)
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

newtype Color = Color CUInt deriving (Eq,Show,Ord)
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

-- Fl_LabelType

data Labeltype = NormalLabelType
               | NoLabelType
               | ShadowLabelType
               | EngravedLabelType
               | EmbossedLabelType
               | IconLabelType
               | MultiLabelType
               | ImageLabelType
               | FreeLabelType deriving (Eq, Show, Ord)

instance Enum Labeltype where
    fromEnum NormalLabelType = 0
    fromEnum NoLabelType = 1
    fromEnum ShadowLabelType = defineShadowLabel_
    fromEnum EngravedLabelType = defineEngravedLabel_
    fromEnum EmbossedLabelType = defineEmbossedLabel_
    fromEnum MultiLabelType = defineMultiLabel_
    fromEnum ImageLabelType = defineImageLabel_
    fromEnum IconLabelType = defineIconLabel_
    fromEnum FreeLabelType = 8

    toEnum 0 = NormalLabelType
    toEnum 1 = NoLabelType
    toEnum x | x == defineShadowLabel_ = ShadowLabelType
             | x == defineEngravedLabel_ = EngravedLabelType
             | x == defineEmbossedLabel_ = EmbossedLabelType
             | x == defineMultiLabel_ = MultiLabelType
             | x == defineIconLabel_ = IconLabelType
             | x == defineImageLabel_ = ImageLabelType
    toEnum 8 = FreeLabelType
    toEnum otherwise = error ("LabelType.toEnum: Cannot match " ++ show otherwise)

symbolLabel :: Labeltype
symbolLabel = NormalLabelType

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

defineGleamUpBox_ :: (Num a ) => a
defineGleamUpBox_ =
  fromIntegral $ {#call pure unsafe fl_define_FL_GLEAM_UP_BOXC #}

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

defineIconLabel_ :: (Num a) => a
defineIconLabel_ =
   fromIntegral $ {#call pure unsafe fl_define_FL_ICON_LABELC #}

defineIconLabel :: Labeltype
defineIconLabel = toEnum defineIconLabel_

defineMultiLabel_ :: (Num a) => a
defineMultiLabel_ =
   fromIntegral $ {#call pure unsafe fl_define_FL_MULTI_LABELC #}

defineMultiLabel :: Labeltype
defineMultiLabel = toEnum defineMultiLabel_

defineImageLabel_ :: (Num a) => a
defineImageLabel_ =
   fromIntegral $ {#call pure unsafe fl_define_FL_IMAGE_LABELC #}

defineImageLabel :: Labeltype
defineImageLabel = toEnum defineImageLabel_

cFromColor :: Color -> CUInt
cFromColor (Color c) = fromIntegral c
cToColor :: CUInt-> Color
cToColor c = Color (fromIntegral c)

type RGB = (CUChar, CUChar, CUChar)

{#fun pure fl_inactiveC as
                 inactive {cFromColor `Color' } -> `Color' cToColor#}
{#fun pure fl_contrastC as
                  contrast {cFromColor `Color',cFromColor `Color'}
                  -> `Color' cToColor#}
{#fun pure fl_color_averageC as
                  colorAverage {cFromColor `Color',
                                 cFromColor `Color',
                                 realToFrac `Double'}
                  -> `Color' cToColor#}
{#fun pure fl_lighterC as
                  lighter {cFromColor `Color'} -> `Color' cToColor#}
{#fun pure fl_darkerC as
                  darker {cFromColor `Color'} -> `Color' cToColor#}
{#fun fl_rgb_color_with_rgbC as
                  rgbColorWithRgb' {id `CUChar',
                                    id `CUChar',
                                    id `CUChar'}
                  -> `CUInt' #}
rgbColorWithRgb :: RGB -> IO Color
rgbColorWithRgb (r,g,b) = rgbColorWithRgb' r g b >>= return . Color

{#fun pure fl_rgb_color_with_grayscaleC as
                  rgbColorWithGrayscale {castCharToCUChar `Char'}
                  -> `Color' cToColor#}
{#fun pure fl_gray_rampC as grayRamp {`Int'} -> `Color' cToColor#}
{#fun pure fl_color_cubeC as colorCube {`Int',`Int',`Int'}
                  -> `Color' cToColor#}
