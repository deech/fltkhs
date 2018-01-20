{-# LANGUAGE OverloadedStrings, PatternSynonyms #-}

{- | Ported from [cube.cxx]<https://github.com/IngwiePhoenix/FLTK/blob/master/test/cube.cxx>.

@
cabal configure -fopengl -fdemos
cabal run fltkhs-example-opengl
@

-}
module Main where

import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.FLTKHS
import qualified Graphics.UI.FLTK.LowLevel.FL              as FL
import qualified Graphics.UI.FLTK.LowLevel.GlWindow        as FL
import qualified Graphics.UI.FLTK.LowLevel.Gl              as FL
import qualified Graphics.UI.FLTK.LowLevel.Fl_Enumerations as FL

import Graphics.GL.Functions as GL
import Graphics.GL           as GL

import Data.Text as T

import Foreign.Marshal.Array (newArray)
import Foreign.Ptr (Ptr)
import Data.IORef
import Data.Bits
import System.Environment

----------------------------------------

data Wire = Line | Polygon
data CubeState =
  CubeState
  {
    lasttime :: Double,
    wire :: Wire,
    size :: Double,
    speed :: Double
  }

data UI =
  UI
  {
    form :: Ref Window,
    speedSlider :: Ref Slider,
    sizeSlider :: Ref Slider,
    wireSelect :: Ref RadioLightButton,
    flatSelect :: Ref RadioLightButton,
    cube1 :: Ref GlWindow,
    cube2 :: Ref GlWindow,
    exit :: Ref Button
  }

----------------------------------------

v0, v1, v2, v3, v4, v5, v6, v7 :: (GL.GLfloat, GL.GLfloat, GL.GLfloat)
v0 = ( 0.0, 0.0, 0.0 );
v1 = ( 1.0, 0.0, 0.0 );
v2 = ( 1.0, 1.0, 0.0 );
v3 = ( 0.0, 1.0, 0.0 );
v4 = ( 0.0, 0.0, 1.0 );
v5 = ( 1.0, 0.0, 1.0 );
v6 = ( 1.0, 1.0, 1.0 );
v7 = ( 0.0, 1.0, 1.0 );

----------------------------------------

drawCube :: Wire -> IO ()
drawCube wire = do
  let lineOrPolygon = case wire of
        Line -> GL.GL_LINE_LOOP
        Polygon -> GL.GL_POLYGON
  cube lineOrPolygon (0,0,255) v0 v1 v2 v3
  cube lineOrPolygon (0,255,255) v4 v5 v6 v7
  cube lineOrPolygon (255,0,255) v0 v1 v5 v4
  cube lineOrPolygon (255,255,0) v2 v3 v7 v6
  cube lineOrPolygon (0,255,0) v0 v4 v7 v3
  cube lineOrPolygon (255,0,0) v1 v2 v6 v5
  where
    v3f (xCoord, yCoord, zCoord) = glVertex3f xCoord yCoord zCoord
    cube lineOrPolygon (r,g,b) vertex1 vertex2 vertex3 vertex4 =
      do
        glBegin lineOrPolygon
        glColor3ub r g b
        v3f vertex1 >> v3f vertex2 >> v3f vertex3 >> v3f vertex4
        glEnd

handleCubeWindow :: Ref GlWindow -> FL.Event -> IO (Either UnknownEvent ())
handleCubeWindow window event =
  case event of
    FL.Enter -> setCursor window FL.CursorCross >> handleSuper window event
    FL.Leave -> setCursor window FL.CursorDefault >> handleSuper window event
    _ -> handleSuper window event

drawCubeWindow :: IORef CubeState -> Ref GlWindow -> IO()
drawCubeWindow stateRef window = do
  modifyIORef stateRef (\s -> s{ lasttime = (lasttime s) + (speed s)})
  state <- readIORef stateRef
  windowValid <- getValid window
  if (not windowValid)
    then do
      glLoadIdentity
      pW <- pixelW window
      pH <- pixelH window
      glViewport (fromIntegral 0) (fromIntegral 0) (fromIntegral pW) (fromIntegral pH)
      glEnable GL.GL_DEPTH_TEST
      glFrustum (-1) 1 (-1) 1 2 10000
      glTranslatef 0 0 (-10)
      FL.glFont FL.helvetica (FontSize 16)
    else return ()
  glClear (GL.GL_COLOR_BUFFER_BIT .|. GL.GL_DEPTH_BUFFER_BIT)
  glPushMatrix
  glRotatef (realToFrac (lasttime state ) * 1.6) 0.0 0.0 1.0
  glRotatef (realToFrac (lasttime state ) * 4.2) 1.0 0.0 0.0
  glRotatef (realToFrac (lasttime state ) * 2.3) 0.0 1.0 0.0
  glTranslatef (-1.0) 1.2 (-1.5)
  let fSize = (realToFrac (size state))
  glScalef fSize fSize fSize
  drawCube (wire state)
  glPopMatrix
  FL.glColor FL.grayColor
  glDisable GL.GL_DEPTH_TEST
  let cubeLabel = case (wire state) of
                   Line -> T.pack("Cube: wire")
                   Polygon -> T.pack("Cube: flat")
  FL.glDrawAt cubeLabel (-4.5) (-4.5)
  glEnable GL.GL_DEPTH_TEST

----------------------------------------

main :: IO ()
main = do
  FL.setScheme "gtk+"
  FL.setUseHighResGL True
  cube1State <- newIORef (CubeState 0.0 Line 1.0 1.0)
  cube2State <- newIORef (CubeState 0.0 Polygon 1.0 1.0)
  ui <- makeForm "Cube demo" cube1State cube2State
  bounds (speedSlider ui) 4.0 0.0
  setValue (speedSlider ui) 1.0
  bounds (sizeSlider ui) 4.0 0.01
  setValue (sizeSlider ui) 1.0
  setValue (flatSelect ui) True
  showWidget (form ui)
  showWidget (cube1 ui)
  showWidget (cube2 ui)
  doUntil (eventLoopEnds ui cube1State cube2State)
    where
      eventLoopEnds ui s1 s2 =  do
        let update = do
              lineDraw <- getValue (wireSelect ui)
              newSize <- getValue (sizeSlider ui)
              newSpeed <- getValue (speedSlider ui)
              mapM_
                (\(stateRef, newWire) ->
                   modifyIORef
                     stateRef
                     (\oldState ->
                         oldState
                         {
                           wire = newWire,
                           speed = newSpeed,
                           size = newSize
                         }
                      ))
                [(s1, if lineDraw then Line else Polygon),
                 (s2, if lineDraw then Polygon else Line)]
              redraw (cube1 ui)
              redraw (cube2 ui)
            continue todo =
              if (todo == 0) then return True
              else do
                update
                FL.readqueue >>=
                  maybe (return False) (\ref -> ref `refPtrEquals` (exit ui))
        isVisible <- getVisible (form ui)
        speed <- getValue (speedSlider ui)
        if (isVisible && (speed == 0))
          then FL.check >>= continue
          else FL.wait >>= continue

      doUntil action = do
        shouldStop <- action
        if shouldStop
          then return ()
          else doUntil action
      makeForm formName s1 s2 = do
        form <- windowNew (toSize (510 + 390, 390))
                Nothing
                (Just(T.pack formName))
        begin form
        b1 <- boxNew
                (toRectangle (20,20,350,350))
                Nothing
        setBox b1 FL.DownFrame
        b2 <- boxNew (toRectangle (510,20,350,350))
                    Nothing
        setBox b2 FL.DownFrame
        speed <- sliderNew (toRectangle (390,90,40,220))
                           (Just (T.pack "Speed"))
        setType speed VertSliderType
        size <- sliderNew (toRectangle (450,90,40,220))
                          (Just (T.pack "Size"))
        setType size VertSliderType
        wire <- radioLightButtonNew (toRectangle (390,20,100,30))
                                    (Just (T.pack "Wire"))
        flat <- radioLightButtonNew (toRectangle (390,50,100,30))
                                    (Just (T.pack "Flat"))
        button <- buttonNew (toRectangle (390,340,100,30))
                            (Just (T.pack "Exit"))
        cube1 <- FL.glWindowCustom
                   (Size (Width 344) (Height 344))
                   (Just (Position (X 23) (Y 23)))
                   Nothing
                   (Just (drawCubeWindow s1))
                   defaultCustomWidgetFuncs{handleCustom = Just handleCubeWindow}
                   defaultCustomWindowFuncs
        cube2 <- FL.glWindowCustom
                   (Size (Width 344) (Height 344))
                   (Just (Position (X 513) (Y 23)))
                   Nothing
                   (Just (drawCubeWindow s2))
                   defaultCustomWidgetFuncs{handleCustom = Just handleCubeWindow}
                   defaultCustomWindowFuncs
        cube1X <- getX cube1
        cube1W <- getW cube1
        cube2X <- getX cube2
        cube2W <- getW cube2
        sizeY <- getY size
        sizeH <- getH size
        b <- boxNew
               (toRectangle (cube1X, sizeY, (cube2X + cube2W) - cube1X, sizeH))
               Nothing
        setBox b FL.NoBox
        setResizable form (Just b)
        hide b
        end form
        return (UI{
                   form = form,
                   speedSlider = speed,
                   sizeSlider = size,
                   wireSelect = wire,
                   flatSelect = flat,
                   cube1 = cube1,
                   cube2 = cube2,
                   exit = button
                  })

----------------------------------------