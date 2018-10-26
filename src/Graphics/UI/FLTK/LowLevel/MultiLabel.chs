{-# LANGUAGE ScopedTypeVariables, ExistentialQuantification, CPP, UndecidableInstances, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.MultiLabel
    (
     multiLabelNew,
     MultiLabelContent(..),
     getMultiLabelContents,
     setMultiLabelContents
     -- * Functions
     --
     -- $functions

    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Multi_LabelC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import qualified Data.Text as T

{# fun Fl_Multi_Label_New as multiLabelNew' { id `Ptr CChar', id `Ptr CChar', cFromEnum `Labeltype', cFromEnum `Labeltype'} -> `Ptr ()' id #}
{# fun Fl_Multi_Label_labela as labela'                 { `Ptr ()' } -> `Ptr CChar' id #}
{# fun Fl_Multi_Label_set_labela as setLabela'          { `Ptr ()' , id `Ptr CChar' } -> `()' #}
{# fun Fl_Multi_Label_labelb as labelb'                 { `Ptr ()' } -> `Ptr CChar' id #}
{# fun Fl_Multi_Label_set_labelb as setLabelb'          { `Ptr ()' , id `Ptr CChar' } -> `()' #}
{# fun Fl_Multi_Label_typea as typea'                   { `Ptr ()' } -> `Labeltype' cToEnum #}
{# fun Fl_Multi_Label_set_typea as setTypea'            { `Ptr ()' , cFromEnum `Labeltype' } -> `()' #}
{# fun Fl_Multi_Label_typeb as typeb'                   { `Ptr ()' } -> `Labeltype' cToEnum #}
{# fun Fl_Multi_Label_set_typeb as setTypeb'            { `Ptr ()' , cFromEnum `Labeltype' } -> `()' #}
{# fun Fl_Multi_Label_label_widget as setWidgetLabel'      { `Ptr ()' , `Ptr ()' } -> `()' #}
{# fun Fl_Multi_Label_label_menu_item as setMenuItemLabel' { `Ptr ()' , `Ptr ()' } -> `()' #}

data MultiLabelContent
   = MultiLabelContentText (Labeltype, T.Text)
   | forall a.(Parent a Image) => MultiLabelContentImage (Ref a)

toLabelTypePtr :: MultiLabelContent -> IO (Labeltype, Ptr CChar)
toLabelTypePtr mlc =
  case mlc of
    MultiLabelContentText (lt, t) -> do
      t' <- copyTextToCString t
      return (lt, t')
    MultiLabelContentImage i -> do
      i' <- unsafeRefToPtr i
      return (ImageLabelType, (castPtr i'))

getMultiLabelContents :: Ref MultiLabel -> IO [MultiLabelContent]
getMultiLabelContents ml =
  withRef ml $ \mlPtr -> extractMultiLabels [] mlPtr
  where
    extractMultiLabels :: [MultiLabelContent] -> Ptr () -> IO [MultiLabelContent]
    extractMultiLabels accum mlPtr = do
      tA <- typea' mlPtr
      tB <- typeb' mlPtr
      case (tA, tB) of
        (NoLabelType, NoLabelType) -> return []
        (ImageLabelType,_) -> do
          (i :: Ref Image) <- labela' mlPtr >>= toRef . castPtr
          let soFar = accum ++ [(MultiLabelContentImage i)]
          rest <- labelb' mlPtr
          extractMultiLabels soFar (castPtr rest)
        (lt,_) -> do
          t <- labela' mlPtr >>= cStringToText
          let soFar = accum ++ [(MultiLabelContentText (lt, t))]
          rest <- labelb' mlPtr
          extractMultiLabels soFar (castPtr rest)

multiLabelNew :: [MultiLabelContent] -> IO (Ref MultiLabel)
multiLabelNew mlcs =
  chainMultiLabels mlcs >>= toRef
  where
    chainMultiLabels :: [MultiLabelContent] -> IO (Ptr ())
    chainMultiLabels [] = multiLabelNew' (castPtr nullPtr) (castPtr nullPtr) NoLabelType NoLabelType
    chainMultiLabels (mlc:mlcs) = do
      (lt,ptr) <- toLabelTypePtr mlc
      mls <- chainMultiLabels mlcs
      multiLabelNew' ptr (castPtr mls) lt MultiLabelType

setMultiLabelContents :: Ref MultiLabel -> [MultiLabelContent] -> IO ()
setMultiLabelContents ml mlcs = do
  currMlcs <- getMultiLabelContents ml
  withRef ml $ \mlPtr -> do
    freeTextLabels mlPtr currMlcs
    insertNewContents mlPtr mlcs
  where
    freeTextLabels :: Ptr () -> [MultiLabelContent] -> IO ()
    freeTextLabels mlPtr [] = return ()
    freeTextLabels mlPtr (mlc:mlcs)=
      case mlc of
        MultiLabelContentText _ -> do
          t <- labela' mlPtr
          free t
          rest <- labelb' mlPtr
          freeTextLabels (castPtr rest) mlcs
        _ -> do
          rest <- labelb' mlPtr
          freeTextLabels (castPtr rest) mlcs
    insertNewContents :: Ptr () -> [MultiLabelContent] -> IO ()
    insertNewContents mlPtr [] = do
      setTypeb' mlPtr MultiLabelType
      end <- multiLabelNew' (castPtr nullPtr) (castPtr nullPtr) NoLabelType NoLabelType
      setLabelb' mlPtr (castPtr end)
    insertNewContents mlPtr mlcs = do
      rest <- setPtr mlPtr (head mlcs)
      if (null (tail mlcs))
      then do
        setTypeb' mlPtr MultiLabelType
        end <- multiLabelNew' (castPtr nullPtr) (castPtr nullPtr) NoLabelType NoLabelType
        setLabelb' mlPtr (castPtr end)
      else insertNewContents (castPtr rest) (tail mlcs)
    setPtr :: Ptr () -> MultiLabelContent -> IO (Ptr ())
    setPtr mlPtr mlc = do
      (lt,ptr) <- toLabelTypePtr mlc
      setTypea' mlPtr lt
      setLabela' mlPtr ptr
      labelb' mlPtr >>= return . castPtr

instance (Parent a Widget, impl ~ (Ref a -> IO ())) => Op (WidgetLabel ()) MultiLabel orig impl where
  runOp _ _ widget widget' =
    withRef widget $ \widgetPtr ->
    withRef widget' $ \widget'Ptr ->
      setWidgetLabel' widgetPtr widget'Ptr
instance (Parent a MenuItem, impl ~ (Ref a -> IO ())) => Op (MenuItemLabel ()) MultiLabel orig impl where
  runOp _ _ widget widget' =
    withRef widget $ \widgetPtr ->
    withRef widget' $ \widget'Ptr ->
      setMenuItemLabel' widgetPtr widget'Ptr

-- $functions
-- @
-- menuItemLabel:: ('Parent' a 'MenuItem') => 'Ref' 'MultiLabel' -> 'Ref' a -> 'IO' ()
--
-- widgetLabel:: ('Parent' a 'Widget') => 'Ref' 'MultiLabel' -> 'Ref' a -> 'IO' ()
-- @
