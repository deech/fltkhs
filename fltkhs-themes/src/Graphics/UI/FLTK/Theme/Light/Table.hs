{-|
Module: Graphics.UI.FLTK.Theme.Light.Table

A word on the table widgets, the theme does provide overrides of
[Table](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-Table.html)
and
[TableRow](http://hackage.haskell.org/package/fltkhs/docs/Graphics-UI-FLTK-LowLevel-TableRow.html)
but they are pretty lowlevel widgets requiring you to supply column\/row\/cell drawing functions. The
functions below draw nicely themed cells and can be passed the Table/TableRow constructors.

The idea is they are used in the generic table drawing cell function at each drawing context,
something like:

@
...
table <- tableRowNew
         (Rectangle ...)
         (Just "My Table")
         Nothing
         drawCell
         defaultCustomWidgetFuncs
         defaultCustomTableFuncs
...

drawCell :: (?assets :: Assets) => Ref TableRow -> TableContext -> TableCoordinate -> Rectangle -> IO ()
drawCell t tcontext ... =
  case tcontext of
    ContextRowHeader -> do
      ...
      drawHeader ...
    ContextColHeader -> do
      ...
      drawHeader ...
    ContextCell -> do
      ...
      drawDataCell ...
    _ -> return ()
@
-}
{-# LANGUAGE ImplicitParams, OverloadedStrings, AllowAmbiguousTypes, GADTs, CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
module Graphics.UI.FLTK.Theme.Light.Table
  (
    drawDataCell,
    drawHeader,
    drawHeaderWithImage,
    tableCustom,
    tableRowNew
  )
where
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.Theme.Light.Common
import qualified Data.Text as T
import qualified Graphics.UI.FLTK.LowLevel.FLTKHS as LowLevel
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.Theme.Light.Assets

drawHeader :: (?assets :: Assets) => Color -> Alignments -> T.Text -> Rectangle -> IO ()
drawHeader c labelAlign l rect = do
  spec <- fmap (\s -> s { fillCornerRadius = 0 }) (makeFillSpec rect c c)
  fillRectangle spec False
  borderRectangle spec True False
  f <- LowLevel.flcFont
  s <- LowLevel.flcSize
  LowLevel.flcSetFont commonFont commonFontSize
  oldC <- LowLevel.flcColor
  LowLevel.flcSetColor blackColor
  LowLevel.flcDrawInBox l rect labelAlign Nothing Nothing
  LowLevel.flcSetColor oldC
  LowLevel.flcSetFont f s

drawHeaderWithImage :: (LowLevel.Parent a LowLevel.Image, ?assets :: Assets) => Color -> Alignments -> T.Text -> Ref a -> Rectangle -> IO ()
drawHeaderWithImage c labelAlign l i rect = do
  spec <- fmap (\s -> s { fillCornerRadius = 0 }) (makeFillSpec rect c c)
  fillRectangle spec False
  borderRectangle spec True False
  f <- LowLevel.flcFont
  s <- LowLevel.flcSize
  LowLevel.flcSetFont commonFont commonFontSize
  oldC <- LowLevel.flcColor
  LowLevel.flcSetColor blackColor
  LowLevel.flcDrawInBoxWithImageReference l rect labelAlign Nothing i Nothing
  LowLevel.flcSetColor oldC
  LowLevel.flcSetFont f s

-- | Custom cell drawing function
drawDataCell :: (?assets :: Assets) => Color -> Alignments -> T.Text -> Rectangle -> IO ()
drawDataCell c contentsAlign contents rect = do
  spec <- fmap (\s -> s { fillCornerRadius = 0 }) (makeFillSpec rect c c)
  LowLevel.flcRectfWithColor rect c
  f <- LowLevel.flcFont
  s <- LowLevel.flcSize
  oldC <- LowLevel.flcColor
  LowLevel.flcSetFont commonFont commonFontSize
  LowLevel.flcSetColor blackColor
  let (x,y,w,h) = fromRectangle rect
  LowLevel.flcDrawInBox contents (toRectangle (x+1,y+1,w-2,h-2)) contentsAlign Nothing Nothing
  LowLevel.flcRectWithColor rect (fillBorderColor spec)
  LowLevel.flcSetColor oldC
  LowLevel.flcSetFont f s

tableCustom :: Rectangle                                                                              -- ^ Bounds of this table
            -> Maybe T.Text                                                                           -- ^ Optional label
            -> Maybe (Ref LowLevel.Table -> IO ())                                                    -- ^ Optional custom table drawing function
            -> (Ref LowLevel.Table -> TableContext -> LowLevel.TableCoordinate -> Rectangle -> IO ()) -- ^ Custom table cell drawing function
            -> LowLevel.CustomWidgetFuncs LowLevel.Table                                              -- ^ Widget overrides
            -> LowLevel.CustomTableFuncs LowLevel.Table                                               -- ^ Table overrides
            -> IO (Ref LowLevel.Table)
tableCustom rectangle label' draw'' drawCell' customWidgetFuncs' customTableFuncs' = do
  t <- LowLevel.tableCustom rectangle label' draw'' drawCell' customWidgetFuncs' customTableFuncs'
  c <- commonColor
  LowLevel.setColor t lightBackground
  LowLevel.setColHeaderColor t c
  LowLevel.setRowHeaderColor t c
  commonFillColor >>= LowLevel.setSelectionColor t
  return t

tableRowNew :: Rectangle                                                                                 -- ^ Bounds of this table
            -> Maybe T.Text                                                                              -- ^ Optional label
            -> Maybe (Ref LowLevel.TableRow -> IO ())                                                    -- ^ Optional custom table drawing function
            -> (Ref LowLevel.TableRow -> TableContext -> LowLevel.TableCoordinate -> Rectangle -> IO ()) -- ^ Custom table cell drawing function
            -> LowLevel.CustomWidgetFuncs LowLevel.TableRow                                              -- ^ Widget overrides
            -> LowLevel.CustomTableFuncs LowLevel.TableRow                                               -- ^ Table overrides
            -> IO (Ref LowLevel.TableRow)
tableRowNew rectangle label' draw'' drawCell' customWidgetFuncs' customTableFuncs' = do
  t <- LowLevel.tableRowNew rectangle label' draw'' drawCell' customWidgetFuncs' customTableFuncs'
  c <- commonColor
  LowLevel.setColor t lightBackground
  LowLevel.setColHeaderColor t c
  LowLevel.setRowHeaderColor t c
  commonFillColor >>= LowLevel.setSelectionColor t
  return t
