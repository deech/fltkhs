{-# LANGUAGE CPP, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-name-shadowing #-}
module Graphics.UI.FLTK.LowLevel.Glut
  (
   -- * Glut attributes
   GlutDraw(..),
   GlutMouseCodes(..),
   GlutUpDown(..),
   GlutVisibility(..),
   GlutMenuState(..),
   GlutMenuItems(..),
   GlutEnteredLeft(..),
   GlutKeyboardCodes(..),
   GlutConstants(..),
   GlutWindowProperties(..),
   GlutCursor(..),
   GlutDisplayMode(..),
   GlutWindow(..),
   GlutMenu(..),
   glutInitDisplayMode ,
   glutInitWindowPosition,
   glutInitWindowSize,
   glutCursorFullCrossHair,
   glutMainLoop,
   glutCreateWindow,
   glutCreateSubWindow,
   glutDestroyWindow,
   glutPostRedisplay,
   glutPostWindowRedisplay,
   glutSwapBuffers,
   glutGetWindow,
   glutSetWindow,
   glutSetWindowTitle,
   glutSetIconTitle,
   glutPositionWindow,
   glutReshapeWindow,
   glutPopWindow,
   glutPushWindow,
   glutIconifyWindow,
   glutShowWindow,
   glutHideWindow,
   glutFullScreen,
   glutSetCursor,
   glutWarpPointer,
   glutEstablishOverlay,
   glutRemoveOverlay,
   glutUseLayer,
   glutPostOverlayRedisplay,
   glutShowOverlay,
   glutHideOverlay,
   glutCreateMenu,
   glutDestroyMenu,
   glutGetMenu,
   glutSetMenu,
   glutAddMenuEntry,
   glutAddSubMenu,
   glutChangeToMenuEntry,
   glutChangeToSubMenu,
   glutRemoveMenuItem,
   glutAttachMenu,
   glutDetachMenu,
   glutDisplayFunc,
   glutReshapeFunc,
   glutKeyboardFunc,
   glutMouseFunc,
   glutMotionFunc,
   glutPassiveMotionFunc,
   glutEntryFunc,
   glutVisibilityFunc,
   glutIdleFunc,
   glutTimerFunc,
   glutMenuStateFunc,
   glutMenuStatusFunc,
   glutSpecialFunc,
   glutOverlayDisplayFunc,
   glutGetWindowRectangle,
   glutGetWindowParent,
   glutGetScreenSize,
   glutGetMenuNumItems,
   glutDisplayModePossible,
   glutWindowBufferSize,
   glutVersion,
   glutOther,
   glutGetModifiers,
   glutHasKeyboard,
   glutHasMouse,
   glutNumMouseButtons,
   glutOverlayPossible,
   glutTransparencyIndex,
   glutNormalDamaged,
   glutOverlayDamaged,
   -- glutGetProcAddress,
   -- glutBitmapCharacter,
   -- glutBitmapHeight,
   -- glutBitmapLength,
   -- glutBitmapString,
   -- glutBitmapWidth,
   -- glutExtensionSupported,
   -- glutStrokeCharacter,
   -- glutStrokeHeight,
   -- glutStrokeLength,
   -- glutStrokeString,
   -- glutStrokeWidth,
   glutWireSphere,
   glutSolidSphere,
   glutWireCone,
   glutSolidCone,
   glutWireCube,
   glutSolidCube,
   glutWireTorus,
   glutSolidTorus,
   glutWireDodecahedron,
   glutSolidDodecahedron,
   glutWireTeapot,
   glutSolidTeapot,
   glutWireOctahedron,
   glutSolidOctahedron,
   glutWireTetrahedron,
   glutSolidTetrahedron,
   glutWireIcosahedron,
   glutSolidIcosahedron
  )
where
#include "Fl_C.h"
#include "glutC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.FL
import Graphics.UI.FLTK.LowLevel.Fl_Types
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations

#c
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
enum GlutMenuState {
 GlutMenuNotInUse = GLUT_MENU_NOT_IN_USE,
 GlutMenuInUse = GLUT_MENU_IN_USE,
};
enum GlutMenuItems {
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
 GlutWindowStereo =  GLUT_WINDOW_STEREO,
};

enum GlutPeripheralProperties {
 GlutPeripheralHasKeyboard = GLUT_HAS_KEYBOARD,
 GlutPeripheralHasMouse = GLUT_HAS_MOUSE,
 GlutPeripheralHasSpaceball = GLUT_HAS_SPACEBALL,
 GlutPeripheralHasDialAndButtonBox = GLUT_HAS_DIAL_AND_BUTTON_BOX,
 GlutPeripheralHasTablet = GLUT_HAS_TABLET,
 GlutPeripheralNumMouseButtons = GLUT_NUM_MOUSE_BUTTONS,
 GlutPeripheralNumSpaceballButtons = GLUT_NUM_SPACEBALL_BUTTONS,
 GlutPeripheralNumButtonBoxButtons = GLUT_NUM_BUTTON_BOX_BUTTONS,
 GlutPeripheralNumDials = GLUT_NUM_DIALS,
 GlutPeripheralNumTabletButtons = GLUT_NUM_TABLET_BUTTONS
};

enum GlutDisplayMode {
 GlutDisplayModeRgb = GLUT_RGB,
 GlutDisplayModeRgba = GLUT_RGBA,
 GlutDisplayModeIndex = GLUT_INDEX,
 GlutDisplayModeSingle = GLUT_SINGLE,
 GlutDisplayModeDouble = GLUT_DOUBLE,
 GlutDisplayModeAccum = GLUT_ACCUM,
 GlutDisplayModeAlpha = GLUT_ALPHA,
 GlutDisplayModeDepth = GLUT_DEPTH,
 GlutDisplayModeStencil = GLUT_STENCIL,
 GlutDisplayModeMultisample = GLUT_MULTISAMPLE,
 GlutDisplayModeStereo = GLUT_STEREO
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
#endc

{#enum GlutDraw {} deriving (Show) #}
{#enum GlutMouseCodes {} deriving (Show) #}
{#enum GlutUpDown {} deriving (Show) #}
{#enum GlutVisibility {} deriving (Show) #}
{#enum GlutMenuState {} deriving (Show) #}
{#enum GlutMenuItems {} deriving (Show) #}
{#enum GlutEnteredLeft {} deriving (Show) #}
{#enum GlutKeyboardCodes {} deriving (Show) #}
{#enum GlutConstants {} deriving (Show) #}
{#enum GlutWindowProperties {} deriving (Show) #}
{#enum GlutDisplayMode {} deriving (Show) #}
{#enum GlutCursor {} deriving (Show) #}
{#enum GlutPeripheralProperties {} deriving (Show) #}

type GlutCreateMenuPrim = CInt -> IO ()
type GlutSizePrim = CInt -> CInt -> IO ()
type GlutPositionPrim = CInt -> CInt -> IO ()
type GlutKeyboardPrim = CUChar -> CInt -> CInt -> IO ()
type GlutMousePrim = CInt -> CInt -> CInt -> CInt -> IO ()
type GlutEntryPrim = CInt -> IO ()
type GlutVisibilityPrim = CInt -> IO ()
type GlutTimerPrim = CInt -> IO ()
type GlutMenuStatePrim = CInt -> IO ()
type GlutMenuStatusPrim = CInt -> CInt -> CInt -> IO ()
type GlutSpecialPrim = CInt -> CInt -> CInt -> IO ()

data GlutWindow = GlutWindow { windowNumber :: CInt } deriving (Eq, Show)
data GlutMenu = GlutMenu { menuNumber :: CInt } deriving (Eq, Show)

glutCursorFullCrossHair :: GlutCursor
glutCursorFullCrossHair = GlutCursorCrosshair
data GLUTproc = GLUTproc {#type GLUTproc#} deriving Show

foreign import ccall "wrapper"
        mkGlutCreateMenuPtr :: GlutCreateMenuPrim -> IO (FunPtr GlutCreateMenuPrim)

foreign import ccall "wrapper"
        mkGlutSizeFPrim:: GlutSizePrim -> IO (FunPtr GlutSizePrim)

foreign import ccall "wrapper"
        mkGlutPositionFPrim:: GlutPositionPrim -> IO (FunPtr GlutPositionPrim)

foreign import ccall "wrapper"
        mkGlutKeyboardFPrim:: GlutKeyboardPrim -> IO (FunPtr GlutKeyboardPrim)

foreign import ccall "wrapper"
        mkGlutMousePrim:: GlutMousePrim -> IO (FunPtr GlutMousePrim)

foreign import ccall "wrapper"
        mkGlutEntryPrim:: GlutEntryPrim -> IO (FunPtr GlutEntryPrim)

foreign import ccall "wrapper"
        mkGlutVisibilityPrim:: GlutVisibilityPrim -> IO (FunPtr GlutVisibilityPrim)

foreign import ccall "wrapper"
        mkGlutTimerPtr :: GlutTimerPrim -> IO (FunPtr GlutTimerPrim)

foreign import ccall "wrapper"
        mkGlutMenuStatePrim:: GlutMenuStatePrim -> IO (FunPtr GlutMenuStatePrim)

foreign import ccall "wrapper"
        mkGlutMenuStatusPrim:: GlutMenuStatusPrim -> IO (FunPtr GlutMenuStatusPrim)

foreign import ccall "wrapper"
        mkGlutSpecialPrim:: GlutMenuStatusPrim -> IO (FunPtr GlutMenuStatusPrim)

toGlutCreateMenuPrim :: (IO ()) -> IO (FunPtr GlutCreateMenuPrim)
toGlutCreateMenuPrim f = mkGlutCreateMenuPtr (\_ -> f)

toGlutSizePrim :: (Size -> IO ()) -> IO (FunPtr GlutSizePrim)
toGlutSizePrim sizeF = mkGlutSizeFPrim (\w' h' ->
                                           let s = Size (Width (fromIntegral w')) (Height (fromIntegral h'))
                                           in sizeF s
                                        )

toGlutPositionPrim :: (Position -> IO ()) -> IO (FunPtr GlutPositionPrim)
toGlutPositionPrim positionF = mkGlutPositionFPrim (\x' y' ->
                                               let p = Position (X (fromIntegral x')) (Y (fromIntegral y'))
                                               in positionF p
                                            )

toGlutKeyboardPrim :: (Char -> Position -> IO ()) -> IO (FunPtr GlutKeyboardPrim)
toGlutKeyboardPrim keyboardF = mkGlutKeyboardFPrim (\k' x' y' ->
                                                      let p = Position (X (fromIntegral x')) (Y (fromIntegral y'))
                                                      in
                                                      keyboardF (castCUCharToChar k') p
                                                   )

toGlutMousePrim :: (MouseButton -> GlutUpDown -> Position -> IO ()) -> IO (FunPtr GlutMousePrim)
toGlutMousePrim mouseF = mkGlutMousePrim (\mb' downup x' y' ->
                                             let p = Position (X (fromIntegral x')) (Y (fromIntegral y'))
                                             in mouseF (cToEnum mb') (cToEnum downup) p
                                         )

toGlutEntryPrim :: (GlutEnteredLeft -> IO ()) -> IO (FunPtr GlutEntryPrim)
toGlutEntryPrim f = mkGlutEntryPrim (\entry' -> f (toEnum (fromIntegral entry')))

toGlutVisibilityPrim :: (GlutVisibility -> IO ()) -> IO (FunPtr GlutVisibilityPrim)
toGlutVisibilityPrim f = mkGlutVisibilityPrim (\entry' -> f (toEnum (fromIntegral entry')))

toGlutTimerPrim :: (IO ()) -> IO (FunPtr GlutTimerPrim)
toGlutTimerPrim f = mkGlutTimerPtr (\_ -> f)

toGlutMenuStatePrim :: (GlutMenuState -> IO ()) -> IO (FunPtr GlutMenuStatePrim)
toGlutMenuStatePrim f = mkGlutMenuStatePrim (\ms' -> f (toEnum (fromIntegral ms')))

toGlutMenuStatusPrim :: (GlutMenuState -> Position -> IO ()) -> IO (FunPtr GlutMenuStatusPrim)
toGlutMenuStatusPrim f = mkGlutMenuStatusPrim (\ms' x' y' ->
                                                let p = Position (X (fromIntegral x')) (Y (fromIntegral y'))
                                                in f (toEnum (fromIntegral ms')) p
                                            )
toGlutSpecialPrim :: (GlutKeyboardCodes -> Position -> IO ()) -> IO (FunPtr GlutSpecialPrim)
toGlutSpecialPrim f = mkGlutSpecialPrim (\k' x' y' ->
                                            let p = Position (X (fromIntegral x')) (Y (fromIntegral y'))
                                            in f (toEnum (fromIntegral k')) p
                                        )
{# fun flc_glutInitDisplayMode as glutInitDisplayMode {cFromEnum `GlutDisplayMode' } -> `()' #}
{# fun flc_glutInitWindowPosition as glutInitWindowPosition' {`CInt', `CInt'} -> `()' #}
glutInitWindowPosition :: Position -> IO ()
glutInitWindowPosition (Position (X x) (Y y)) = glutInitWindowPosition' (fromIntegral x) (fromIntegral y)
{# fun flc_glutInitWindowSize as glutInitWindowSize' {`CInt', `CInt'} -> `()' #}
glutInitWindowSize :: Size -> IO ()
glutInitWindowSize (Size (Width w) (Height h)) = glutInitWindowSize' (fromIntegral w) (fromIntegral h)
{# fun flc_glutMainLoop as glutMainLoop { } -> `()' #}
{# fun flc_glutCreateWindow as glutCreateWindow {unsafeToCString `T.Text'} -> `GlutWindow' GlutWindow #}
{# fun flc_glutCreateSubWindow as glutCreateSubWindow' {windowNumber `GlutWindow',`Int',`Int',`Int',`Int'} -> `GlutWindow' GlutWindow #}
glutCreateSubWindow :: GlutWindow -> Rectangle -> IO GlutWindow
glutCreateSubWindow glutWindow (Rectangle (Position (X x) (Y y)) (Size (Width w) (Height h))) =
  glutCreateSubWindow' glutWindow x y w h
{# fun flc_glutDestroyWindow as glutDestroyWindow {windowNumber `GlutWindow' } -> `()' #}
{# fun flc_glutPostRedisplay as glutPostRedisplay { } -> `()' #}
{# fun flc_glutPostWindowRedisplay as glutPostWindowRedisplay {windowNumber `GlutWindow' } -> `()' #}
{# fun flc_glutSwapBuffers as glutSwapBuffers { } -> `()' #}
{# fun flc_glutGetWindow as glutGetWindow { } -> `GlutWindow' GlutWindow #}
{# fun flc_glutSetWindow as glutSetWindow {windowNumber `GlutWindow' } -> `()' #}
{# fun flc_glutSetWindowTitle as glutSetWindowTitle {unsafeToCString `T.Text' } -> `()' #}
{# fun flc_glutSetIconTitle as glutSetIconTitle {unsafeToCString `T.Text' } -> `()' #}
{# fun flc_glutPositionWindow as glutPositionWindow' {`Int', `Int' } -> `()' #}
glutPositionWindow :: Position -> IO ()
glutPositionWindow (Position (X x) (Y y)) = glutPositionWindow' x y
{# fun flc_glutReshapeWindow as glutReshapeWindow' {`Int', `Int' } -> `()' #}
glutReshapeWindow :: Size -> IO ()
glutReshapeWindow (Size (Width w) (Height h)) = glutReshapeWindow' w h
{# fun flc_glutPopWindow as glutPopWindow { } -> `()' #}
{# fun flc_glutPushWindow as glutPushWindow { } -> `()' #}
{# fun flc_glutIconifyWindow as glutIconifyWindow { } -> `()' #}
{# fun flc_glutShowWindow as glutShowWindow { } -> `()' #}
{# fun flc_glutHideWindow as glutHideWindow { } -> `()' #}
{# fun flc_glutFullScreen as glutFullScreen { } -> `()' #}
{# fun flc_glutSetCursor as glutSetCursor {cFromEnum `GlutCursor'} -> `()' #}
{# fun flc_glutWarpPointer as glutWarpPointer' {`Int', `Int'} -> `()' #}
glutWarpPointer :: Position -> IO ()
glutWarpPointer (Position (X x) (Y y)) = glutWarpPointer' x y
{# fun flc_glutEstablishOverlay as glutEstablishOverlay { } -> `()' #}
{# fun flc_glutRemoveOverlay as glutRemoveOverlay { } -> `()' #}
{# fun flc_glutUseLayer as glutUseLayer {`Word32'} -> `()' #}
{# fun flc_glutPostOverlayRedisplay as glutPostOverlayRedisplay { } -> `()' #}
{# fun flc_glutShowOverlay as glutShowOverlay { } -> `()' #}
{# fun flc_glutHideOverlay as glutHideOverlay { } -> `()' #}
{# fun flc_glutCreateMenu as glutCreateMenu' {id `FunPtr GlutCreateMenuPrim'} -> `()' #}
glutCreateMenu :: IO () -> IO ()
glutCreateMenu f = (toGlutCreateMenuPrim f) >>= glutCreateMenu'
{# fun flc_glutDestroyMenu as glutDestroyMenu {menuNumber `GlutMenu'} -> `()' #}
{# fun flc_glutGetMenu as glutGetMenu { } -> `GlutMenu' GlutMenu #}
{# fun flc_glutSetMenu as glutSetMenu {menuNumber `GlutMenu'} -> `()' #}
{# fun flc_glutAddMenuEntry as glutAddMenuEntry' {unsafeToCString `T.Text', `Int' } -> `()' #}
glutAddMenuEntry :: T.Text -> IO ()
glutAddMenuEntry l = glutAddMenuEntry' l 0
{# fun flc_glutAddSubMenu as glutAddSubMenu {unsafeToCString `T.Text', menuNumber `GlutMenu' } -> `()' #}
{# fun flc_glutChangeToMenuEntry as glutChangeToMenuEntry' {`Int', unsafeToCString `T.Text', `Int'} -> `()' #}
glutChangeToMenuEntry :: Int -> T.Text -> IO ()
glutChangeToMenuEntry index label = glutChangeToMenuEntry' index label 0
{# fun flc_glutChangeToSubMenu as glutChangeToSubMenu {`Int', unsafeToCString `T.Text', menuNumber `GlutMenu' } -> `()' #}
{# fun flc_glutRemoveMenuItem as glutRemoveMenuItem {`Int' } -> `()' #}
{# fun flc_glutAttachMenu as glutAttachMenu {menuNumber `GlutMenu'} -> `()' #}
{# fun flc_glutDetachMenu as glutDetachMenu {menuNumber `GlutMenu'} -> `()' #}
{# fun flc_glutDisplayFunc as glutDisplayFunc' {id `FunPtr GlobalCallback' } -> `()' #}
glutDisplayFunc :: (IO ()) -> IO ()
glutDisplayFunc f = (mkGlobalCallbackPtr f) >>= glutDisplayFunc'
{# fun flc_glutReshapeFunc as glutReshapeFunc' {id `FunPtr GlutSizePrim' } -> `()' #}
glutReshapeFunc :: (Size -> IO ()) -> IO ()
glutReshapeFunc f = toGlutSizePrim f >>= glutReshapeFunc'
{# fun flc_glutKeyboardFunc as glutKeyboardFunc' {id `FunPtr GlutKeyboardPrim' } -> `()' #}
glutKeyboardFunc :: (Char -> Position -> IO ()) -> IO ()
glutKeyboardFunc f = toGlutKeyboardPrim f >>= glutKeyboardFunc'
{# fun flc_glutMouseFunc as glutMouseFunc' {id `FunPtr GlutMousePrim' } -> `()' #}
glutMouseFunc :: (MouseButton -> GlutUpDown -> Position -> IO ()) -> IO ()
glutMouseFunc f = toGlutMousePrim f >>= glutMouseFunc'
{# fun flc_glutMotionFunc as glutMotionFunc' {id `FunPtr GlutPositionPrim' } -> `()' #}
glutMotionFunc :: (Position -> IO ()) -> IO ()
glutMotionFunc f = toGlutPositionPrim f >>= glutMotionFunc'
{# fun flc_glutPassiveMotionFunc as glutPassiveMotionFunc' {id `FunPtr GlutPositionPrim' } -> `()' #}
glutPassiveMotionFunc :: (Position -> IO ()) -> IO ()
glutPassiveMotionFunc f = toGlutPositionPrim f >>= glutPassiveMotionFunc'
{# fun flc_glutEntryFunc as glutEntryFunc' { id `FunPtr GlutEntryPrim' } -> `()' #}
glutEntryFunc :: (GlutEnteredLeft -> IO ()) -> IO ()
glutEntryFunc f = toGlutEntryPrim f >>= glutEntryFunc'
{# fun flc_glutVisibilityFunc as glutVisibilityFunc' { id `FunPtr GlutVisibilityPrim' } -> `()' #}
glutVisibilityFunc :: (GlutVisibility -> IO ()) -> IO ()
glutVisibilityFunc f = toGlutVisibilityPrim f >>= glutVisibilityFunc'
{# fun flc_glutIdleFunc as glutIdleFunc' { id `FunPtr GlobalCallback' } -> `()' #}
glutIdleFunc :: (IO ()) -> IO ()
glutIdleFunc f = (mkGlobalCallbackPtr f) >>= glutIdleFunc'
{# fun flc_glutTimerFunc as glutTimerFunc' { `Int', id `FunPtr GlutTimerPrim', `Int'} -> `()' #}
glutTimerFunc :: Int -> (IO ()) -> IO ()
glutTimerFunc timeout' f = (toGlutTimerPrim f) >>= \f' -> glutTimerFunc' timeout' f' 0
{# fun flc_glutMenuStateFunc as glutMenuStateFunc' {id `FunPtr GlutMenuStatePrim' } -> `()' #}
glutMenuStateFunc :: (GlutMenuState -> IO()) -> IO ()
glutMenuStateFunc f = toGlutMenuStatePrim f >>= glutMenuStateFunc'
{# fun flc_glutMenuStatusFunc as glutMenuStatusFunc' {id `FunPtr GlutMenuStatusPrim' } -> `()' #}
glutMenuStatusFunc :: (GlutMenuState -> Position -> IO ()) -> IO ()
glutMenuStatusFunc f = toGlutMenuStatusPrim f >>= glutMenuStatusFunc'
{# fun flc_glutSpecialFunc as glutSpecialFunc' { id `FunPtr GlutSpecialPrim' } -> `()' #}
glutSpecialFunc :: (GlutKeyboardCodes -> Position -> IO ()) -> IO ()
glutSpecialFunc f = toGlutSpecialPrim f >>= glutSpecialFunc'
{# fun flc_glutOverlayDisplayFunc as glutOverlayDisplayFunc' { id `FunPtr GlobalCallback' } -> `()' #}
glutOverlayDisplayFunc :: (IO ()) -> IO ()
glutOverlayDisplayFunc f = mkGlobalCallbackPtr f >>= glutOverlayDisplayFunc'
{# fun flc_glutGet as glutGet' {`Word32' } -> `Int' #}
glutGetWindowRectangle :: IO Rectangle
glutGetWindowRectangle = do
  x <- glutGet' (fromIntegral (fromEnum GlutWindowX))
  y <- glutGet' (fromIntegral (fromEnum GlutWindowY))
  w <- glutGet' (fromIntegral (fromEnum GlutWindowWidth))
  h <- glutGet' (fromIntegral (fromEnum GlutWindowHeight))
  return (toRectangle (x,y,w,h))
glutGetWindowParent :: IO (Maybe GlutWindow)
glutGetWindowParent = do
  n <- glutGet' (fromIntegral (fromEnum GlutWindowParent))
  return (if (n == 0) then Nothing else (Just (GlutWindow (fromIntegral n))))
glutGetScreenSize :: IO Size
glutGetScreenSize = do
  w <- glutGet' (fromIntegral (fromEnum GlutScreenWidth))
  h <- glutGet' (fromIntegral (fromEnum GlutScreenHeight))
  return (toSize (w,h))
glutGetMenuNumItems :: IO Int
glutGetMenuNumItems = glutGet' (fromIntegral (fromEnum GlutMenuNumItems))
glutDisplayModePossible :: IO Bool
glutDisplayModePossible = glutGet' (fromIntegral (fromEnum GlutDisplayModePossible)) >>= return . cToBool
glutWindowBufferSize :: IO Int
glutWindowBufferSize = glutGet' (fromIntegral (fromEnum GlutWindowBufferSize))
glutVersion :: IO Int
glutVersion = glutGet' (fromIntegral (fromEnum GlutVersion))
glutOther :: Word32 -> IO Int
glutOther constant = glutGet' (fromIntegral constant)
{# fun flc_glutLayerGet as glutLayerGet' {`Word32'} -> `Int' #}
glutOverlayPossible :: IO Bool
glutOverlayPossible = glutLayerGet' (fromIntegral (fromEnum GlutOverlayPossible)) >>= return . cToBool
glutTransparencyIndex :: IO Int
glutTransparencyIndex = glutLayerGet' (fromIntegral (fromEnum GlutTransparentIndex))
glutNormalDamaged :: IO Bool
glutNormalDamaged = glutLayerGet' (fromIntegral (fromEnum GlutNormalDamaged)) >>= return . cToBool
glutOverlayDamaged :: IO Bool
glutOverlayDamaged = glutLayerGet' (fromIntegral (fromEnum GlutOverlayDamaged)) >>= return . cToBool
{# fun flc_glutDeviceGet as glutDeviceGet' {`Word32'} -> `Int' #}
glutHasKeyboard :: IO Bool
glutHasKeyboard = glutDeviceGet' (fromIntegral (fromEnum GlutPeripheralHasKeyboard)) >>= return . cToBool
glutHasMouse :: IO Bool
glutHasMouse = glutDeviceGet' (fromIntegral (fromEnum GlutPeripheralHasMouse)) >>= return . cToBool
glutNumMouseButtons :: IO Int
glutNumMouseButtons = glutDeviceGet' (fromIntegral (fromEnum GlutPeripheralNumMouseButtons))
{# fun flc_glutGetModifiers as glutGetModifiers { } -> `[EventState]' extractEventStates #}
-- {# fun flc_glutGetProcAddress as glutGetProcAddress {const char* procName } -> `GLUTproc' #}
-- {# fun flc_glutBitmapCharacter as glutBitmapCharacter {void* font, int character } -> `()' #}
-- {# fun flc_glutBitmapHeight as glutBitmapHeight {void* font } -> `int' #}
-- {# fun flc_glutBitmapLength as glutBitmapLength {void* font, const unsigned char* string } -> `int' #}
-- {# fun flc_glutBitmapString as glutBitmapString {void* font, const unsigned char* string } -> `()' #}
-- {# fun flc_glutBitmapWidth as glutBitmapWidth {void* font, int character } -> `int' #}
-- {# fun flc_glutExtensionSupported as glutExtensionSupported {char* name } -> `int' #}
-- {# fun flc_glutStrokeCharacter as glutStrokeCharacter {void* font, int character } -> `()' #}
-- {# fun flc_glutStrokeHeight as glutStrokeHeight {void* font } -> `GLfloat' #}
-- {# fun flc_glutStrokeLength as glutStrokeLength {void* font, const unsigned char* string } -> `int' #}
-- {# fun flc_glutStrokeString as glutStrokeString {void* font, const unsigned char* string } -> `()' #}
-- {# fun flc_glutStrokeWidth as glutStrokeWidth {void* font, int character } -> `int' #}
{# fun flc_glutWireSphere as glutWireSphere {`Double', `Int32' , `Int32' } -> `()' #}
{# fun flc_glutSolidSphere as glutSolidSphere {`Double', `Int32' , `Int32' } -> `()' #}
{# fun flc_glutWireCone as glutWireCone {`Double', `Double', `Int32' , `Int32' } -> `()' #}
{# fun flc_glutSolidCone as glutSolidCone {`Double', `Double', `Int32' , `Int32' } -> `()' #}
{# fun flc_glutWireCube as glutWireCube {`Double'} -> `()' #}
{# fun flc_glutSolidCube as glutSolidCube {`Double'} -> `()' #}
{# fun flc_glutWireTorus as glutWireTorus {`Double', `Double', `Int32' , `Int32' } -> `()' #}
{# fun flc_glutSolidTorus as glutSolidTorus {`Double', `Double', `Int32' , `Int32' } -> `()' #}
{# fun flc_glutWireDodecahedron as glutWireDodecahedron { } -> `()' #}
{# fun flc_glutSolidDodecahedron as glutSolidDodecahedron { } -> `()' #}
{# fun flc_glutWireTeapot as glutWireTeapot {`Double'} -> `()' #}
{# fun flc_glutSolidTeapot as glutSolidTeapot {`Double'} -> `()' #}
{# fun flc_glutWireOctahedron as glutWireOctahedron { } -> `()' #}
{# fun flc_glutSolidOctahedron as glutSolidOctahedron { } -> `()' #}
{# fun flc_glutWireTetrahedron as glutWireTetrahedron { } -> `()' #}
{# fun flc_glutSolidTetrahedron as glutSolidTetrahedron { } -> `()' #}
{# fun flc_glutWireIcosahedron as glutWireIcosahedron { } -> `()' #}
{# fun flc_glutSolidIcosahedron as glutSolidIcosahedron { } -> `()' #}
