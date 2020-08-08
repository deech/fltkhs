{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Input
    (
     FlInputType(..),
     -- * Constructor
     inputNew,
     inputCustom
   , drawInputBase
   , handleInputBase
   , resizeInputBase
   , hideInputBase
   , showWidgetInputBase
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Fl_Input functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_InputC.h"
#include "Fl_Input_C.h"
#include "Fl_Int_InputC.h"
#include "Fl_Float_InputC.h"
#include "Fl_Secret_InputC.h"
#include "Fl_Multiline_InputC.h"
#include "Fl_OutputC.h"
#include "Fl_Multiline_OutputC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Base.Widget

#c
enum FlInputType {
  FlNormalInput = FL_NORMAL_INPUT,
  FlFloatInput = FL_FLOAT_INPUT,
  FlIntInput = FL_INT_INPUT,
  FlMultilineInput = FL_MULTILINE_INPUT,
  FlSecretInput = FL_SECRET_INPUT,
  FlHiddenInput = FL_HIDDEN_INPUT
};
#endc
{#enum FlInputType {}#}
{# fun Fl_OverriddenInput_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenInput_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
inputCustom ::
       Rectangle                         -- ^ The bounds of this Input
    -> Maybe T.Text                      -- ^ The Input label
    -> Maybe FlInputType                 -- ^ The input type
    -> Maybe (Ref Input -> IO ())        -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs Input)   -- ^ Optional custom widget functions
    -> IO (Ref Input)
inputCustom rectangle l' itMaybe draw' funcs' = do
  i <- widgetMaker
         rectangle
         l'
         draw'
         funcs'
         overriddenWidgetNew'
         overriddenWidgetNewWithLabel'
  maybe
    (return ())
    (\it -> do
        setInputType i it
        case it of
          FlNormalInput -> return ()
          FlFloatInput -> clearFlag i WidgetFlagMacUseAccentsMenu
          FlIntInput -> clearFlag i WidgetFlagMacUseAccentsMenu
          FlMultilineInput -> return ()
          FlSecretInput -> clearFlag i WidgetFlagMacUseAccentsMenu
          FlHiddenInput -> return ()
        )
    itMaybe
  setFlag i WidgetFlagCopiedLabel
  setFlag i WidgetFlagCopiedTooltip
  return i

{# fun Fl_Multiline_Input_New as multilineInputNew' { `Int',`Int',`Int',`Int' , id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Multiline_Input_New_WithLabel as multilineInputNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Float_Input_New as floatInputNew' { `Int',`Int',`Int',`Int' , id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Float_Input_New_WithLabel as floatInputNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Int_Input_New as intInputNew' { `Int',`Int',`Int',`Int' , id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Int_Input_New_WithLabel as intInputNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Secret_Input_New as secretInputNew' { `Int',`Int',`Int',`Int' , id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
{# fun Fl_Secret_Input_New_WithLabel as secretInputNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `FunPtr DestroyCallbacksPrim' } -> `Ptr ()' id #}
inputNew :: Rectangle -> Maybe T.Text -> Maybe FlInputType -> IO (Ref Input)
inputNew rectangle l' flInputType =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
        construct =
          let normalInput = inputCustom rectangle l' (Just FlNormalInput) Nothing Nothing
              specialInput f = do
                lPtr <- maybe (return nullPtr) copyTextToCString l'
                destroyCallbacksFptr <- toDestroyCallbacksPrim defaultDestroyCallbacks
                f x_pos y_pos width height lPtr destroyCallbacksFptr >>= toRef
          in
          case flInputType of
            Just FlNormalInput -> normalInput
            Just FlHiddenInput -> normalInput
            Just FlFloatInput -> specialInput floatInputNewWithLabel'
            Just FlIntInput -> specialInput intInputNewWithLabel'
            Just FlMultilineInput -> specialInput multilineInputNewWithLabel'
            Just FlSecretInput -> specialInput secretInputNewWithLabel'
            Nothing -> inputCustom rectangle l' Nothing Nothing Nothing
    in do
    i <- construct
    case flInputType of { Just FlHiddenInput -> setInputType i FlHiddenInput; _ -> return () }
    setFlag i WidgetFlagCopiedLabel
    setFlag i WidgetFlagCopiedTooltip
    return i

{# fun Fl_Input_Destroy as inputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) InputBase orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    inputDestroy' winPtr
    return nullPtr

{# fun Fl_Input_set_value as setValue' { id `Ptr ()', `CString' } -> `Int' #}
instance (impl ~ (T.Text -> IO (Either NoChange ()))) => Op (SetValue ()) InputBase orig impl where
  runOp _ _ input text = withRef input $ \inputPtr -> copyTextToCString text >>= \t -> setValue' inputPtr t >>= return . successOrNoChange

{# fun Fl_Input_static_value as staticValue' { id `Ptr ()', `CString' } -> `Int' #}
instance (impl ~ (T.Text -> IO (Either NoChange ()))) => Op (StaticValue ()) InputBase orig impl where
  runOp _ _ input text = do
    status' <- withRef input $ \inputPtr -> copyTextToCString text >>= staticValue' inputPtr
    return $ successOrNoChange status'
{# fun Fl_Input_value as value' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetValue ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> value' inputPtr >>= cStringToText
{# fun Fl_Input_index as index' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (Char))) => Op (Index ()) InputBase orig impl where
  runOp _ _ input (AtIndex i) = withRef input $ \inputPtr -> index' inputPtr i >>= return . toEnum
{# fun Fl_Input_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Size ->  IO ())) => Op (SetSize ()) InputBase orig impl where
  runOp _ _ input (Size (Width w') (Height h')) = withRef input $ \inputPtr -> setSize' inputPtr w' h'
{# fun Fl_Input_maximum_size as maximumSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetMaximumSize ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> maximumSize' inputPtr
{# fun Fl_Input_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> size' inputPtr
{# fun Fl_Input_set_maximum_size as setMaximumSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetMaximumSize ()) InputBase orig impl where
  runOp _ _ input m = withRef input $ \inputPtr -> setMaximumSize' inputPtr m
{# fun Fl_Input_position as position' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetPosition ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> position' inputPtr
{# fun Fl_Input_mark as mark' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetMark ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> mark' inputPtr
{# fun Fl_Input_set_position_with_cursor_mark as setPositionWithCursorMark' { id `Ptr ()',`Int',`Int' } -> `Int' #}
{# fun Fl_Input_set_position_n_n as setPositionNN' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int -> Maybe Int -> IO (Either NoChange ()))) => Op (SetPosition ()) InputBase orig impl where
  runOp _ _ input point mark = do
   status' <- case mark of
      Just m ->  withRef input $ \inputPtr -> setPositionWithCursorMark' inputPtr point m
      Nothing -> withRef input $ \inputPtr -> setPositionNN' inputPtr point
   return $ successOrNoChange status'
{# fun Fl_Input_set_mark as setMark' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Either NoChange ()))) => Op (SetMark ()) InputBase orig impl where
  runOp _ _ input m = withRef input $ \inputPtr -> setMark' inputPtr m >>= return . successOrNoChange
{# fun Fl_Input_replace as replace' { id `Ptr ()',`Int',`Int', `CString' } -> `Int' #}
instance (impl ~ (IndexRange -> T.Text ->  IO (Either NoChange ()))) => Op (Replace ()) InputBase orig impl where
  runOp _ _ input (IndexRange (AtIndex b) (AtIndex e)) text = withRef input $ \inputPtr -> copyTextToCString text >>= \t -> replace' inputPtr b e t >>= return . successOrNoChange
{# fun Fl_Input_cut as cut' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (Cut ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> cut' inputPtr >>= return . successOrNoChange
{# fun Fl_Input_cut_bytes as cutBytes' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Either NoChange ()))) => Op (CutFromCursor ()) InputBase orig impl where
  runOp _ _ input n = withRef input $ \inputPtr -> cutBytes' inputPtr n >>= return . successOrNoChange
{# fun Fl_Input_cut_range as cutRange' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance (impl ~ (IndexRange ->  IO (Either NoChange ()))) => Op (CutRange ()) InputBase orig impl where
  runOp _ _ input (IndexRange (AtIndex a) (AtIndex b)) = withRef input $ \inputPtr -> cutRange' inputPtr a b >>= return . successOrNoChange
{# fun Fl_Input_insert as insert' { id `Ptr ()', `CString' } -> `Int' #}
instance (impl ~ (T.Text ->  IO (Either NoChange ()))) => Op (Insert ()) InputBase orig impl where
  runOp _ _ input t = withRef input $ \inputPtr -> copyTextToCString t >>= \t' -> insert' inputPtr t' >>= return . successOrNoChange
{# fun Fl_Input_insert_with_length as insertWithLength' { id `Ptr ()', `CString',`Int' } -> `Int' #}
instance (impl ~ (T.Text -> Int ->  IO (Either NoChange ()))) => Op (InsertWithLength ()) InputBase orig impl where
  runOp _ _ input t l = withRef input $ \inputPtr -> copyTextToCString t >>= \t' -> insertWithLength' inputPtr t' l >>= return . successOrNoChange
{# fun Fl_Input_copy as copy' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Clipboard ->  IO (Either NoChange ()))) => Op (Copy ()) InputBase orig impl where
  runOp _ _ input clipboard = do
    status' <- case clipboard of
      InternalClipboard -> withRef input $ \inputPtr -> copy' inputPtr 1
      SharedClipboard -> withRef input $ \inputPtr -> copy' inputPtr 0
    return $ successOrNoChange status'
{# fun Fl_Input_undo as undo' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (Undo ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> undo' inputPtr >>= return . successOrNoChange
{# fun Fl_Input_copy_cuts as copyCuts' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (CopyCuts ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> copyCuts' inputPtr >>= return . successOrNoChange
{# fun Fl_Input_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ ( IO (Maybe ShortcutKeySequence))) => Op (GetShortcut ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> shortcut' inputPtr >>= return . cIntToKeySequence
{# fun Fl_Input_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) InputBase orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)
{# fun Fl_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> textfont' inputPtr
{# fun Fl_Input_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) InputBase orig impl where
  runOp _ _ input s = withRef input $ \inputPtr -> setTextfont' inputPtr s
{# fun Fl_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> textsize' inputPtr >>= return . FontSize
{# fun Fl_Input_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) InputBase orig impl where
  runOp _ _ input (FontSize s) = withRef input $ \inputPtr -> setTextsize' inputPtr s
{# fun Fl_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> textcolor' inputPtr
{# fun Fl_Input_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) InputBase orig impl where
  runOp _ _ input n = withRef input $ \inputPtr -> setTextcolor' inputPtr n
{# fun Fl_Input_cursor_color as cursorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetCursorColor ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> cursorColor' inputPtr
{# fun Fl_Input_set_cursor_color as setCursorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetCursorColor ()) InputBase orig impl where
  runOp _ _ input n = withRef input $ \inputPtr -> setCursorColor' inputPtr n
{# fun Fl_Input_input_type as inputType' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (FlInputType))) => Op (GetInputType ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> inputType' inputPtr >>= return . toEnum . fromIntegral
{# fun Fl_Input_set_input_type as setInputType' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (FlInputType ->  IO ())) => Op (SetInputType ()) InputBase orig impl where
  runOp _ _ input t = withRef input $ \inputPtr -> setInputType' inputPtr (fromIntegral (fromEnum t))
{# fun Fl_Input_readonly as readonly' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ ( IO (Bool))) => Op (GetReadonly ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> readonly' inputPtr
{# fun Fl_Input_set_readonly as setReadonly' { id `Ptr ()',cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetReadonly ()) InputBase orig impl where
  runOp _ _ input b = withRef input $ \inputPtr -> setReadonly' inputPtr b
{# fun Fl_Input_wrap as wrap' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Bool))) => Op (GetWrap ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> wrap' inputPtr >>= return . cToBool
{# fun Fl_Input_set_wrap as setWrap' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetWrap ()) InputBase orig impl where
  runOp _ _ input b = withRef input $ \inputPtr -> setWrap' inputPtr (cFromBool b)
{# fun Fl_Input_set_tab_nav as setTabNav' { id `Ptr ()', `Int'} -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetTabNav ()) InputBase orig impl where
  runOp _ _ input val = withRef input $ \inputPtr -> setTabNav' inputPtr (cFromBool val)
{# fun Fl_Input_tab_nav as tabNav' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Bool))) => Op (GetTabNav ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> tabNav' inputPtr >>= return . cToBool

{# fun Fl_Input_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawInputBase ::  Ref InputBase -> IO ()
drawInputBase input = withRef input $ \inputPtr -> drawSuper' inputPtr
{# fun Fl_Input_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleInputBase :: Ref InputBase -> Event ->  IO (Either UnknownEvent ())
handleInputBase input event =
  withRef
    input
    (\p -> do
        t <- getInputType input
        case t of
         FlSecretInput -> secretInputHandle' p (fromIntegral . fromEnum $ event)
         _             -> inputHandle' p (fromIntegral . fromEnum $ event)
    )
  >>= return . successOrUnknownEvent
{# fun Fl_Input_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeInputBase :: Ref InputBase -> Rectangle -> IO ()
resizeInputBase input rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef input $ \inputPtr -> resizeSuper' inputPtr x_pos y_pos width height
{# fun Fl_Input_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideInputBase ::  Ref InputBase -> IO ()
hideInputBase input = withRef input $ \inputPtr -> hideSuper' inputPtr
{# fun Fl_Input_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetInputBase ::  Ref InputBase -> IO ()
showWidgetInputBase input = withRef input $ \inputPtr -> showSuper' inputPtr


{#fun Fl_Input_handle as inputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
{#fun Fl_Secret_Input_handle as secretInputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) InputBase orig impl where
  runOp _ _ input event =
    withRef
      input
      (\p -> do
          t <- getInputType input
          case t of
           FlSecretInput -> secretInputHandle' p (fromIntegral . fromEnum $ event)
           _             -> inputHandle' p (fromIntegral . fromEnum $ event)
      )
    >>= return . successOrUnknownEvent
{# fun Fl_Input_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> draw'' inputPtr
{# fun Fl_Input_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) InputBase orig impl where
  runOp _ _ input rectangle = withRef input $ \inputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' inputPtr x_pos y_pos w_pos h_pos
{# fun Fl_Input_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> hide' inputPtr
{# fun Fl_Input_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) InputBase orig impl where
  runOp _ _ input = withRef input $ \inputPtr -> show' inputPtr


{# fun Fl_Input_drawtext as drawtext' { id `Ptr ()', `Int', `Int', `Int', `Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (DrawText ()) InputBase orig impl where
  runOp _ _ input rectangle = withRef input (\inputPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 drawtext' inputPtr x_pos y_pos w_pos h_pos)


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Input"
-- @

-- $functions
-- @
-- copy :: 'Ref' 'InputBase' -> 'Clipboard' -> 'IO' ('Either' 'NoChange' ())
--
-- copyCuts :: 'Ref' 'InputBase' -> 'IO' ('Either' 'NoChange' ())
--
-- cut :: 'Ref' 'InputBase' -> 'IO' ('Either' 'NoChange' ())
--
-- cutFromCursor :: 'Ref' 'InputBase' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- cutRange :: 'Ref' 'InputBase' -> 'IndexRange' -> 'IO' ('Either' 'NoChange' ())
--
-- destroy :: 'Ref' 'InputBase' -> 'IO' ()
--
-- draw :: 'Ref' 'InputBase' -> 'IO' ()
--
-- drawText :: 'Ref' 'InputBase' -> 'Rectangle' -> 'IO' ()
--
-- getCursorColor :: 'Ref' 'InputBase' -> 'IO' ('Color')
--
-- getInputType :: 'Ref' 'InputBase' -> 'IO' ('FlInputType')
--
-- getMark :: 'Ref' 'InputBase' -> 'IO' ('Int')
--
-- getMaximumSize :: 'Ref' 'InputBase' -> 'IO' ('Int')
--
-- getPosition :: 'Ref' 'InputBase' -> 'IO' ('Int')
--
-- getReadonly :: 'Ref' 'InputBase' -> 'IO' ('Bool')
--
-- getShortcut :: 'Ref' 'InputBase' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getSize :: 'Ref' 'InputBase' -> 'IO' ('Int')
--
-- getTabNav :: 'Ref' 'InputBase' -> 'IO' ('Bool')
--
-- getTextcolor :: 'Ref' 'InputBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'InputBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'InputBase' -> 'IO' ('FontSize')
--
-- getValue :: 'Ref' 'InputBase' -> 'IO' 'T.Text'
--
-- getWrap :: 'Ref' 'InputBase' -> 'IO' ('Bool')
--
-- handle :: 'Ref' 'InputBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'InputBase' -> 'IO' ()
--
-- index :: 'Ref' 'InputBase' -> 'AtIndex' -> 'IO' ('Char')
--
-- insert :: 'Ref' 'InputBase' -> 'T.Text' -> 'IO' ('Either' 'NoChange' ())
--
-- insertWithLength :: 'Ref' 'InputBase' -> 'T.Text' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- replace :: 'Ref' 'InputBase' -> 'IndexRange' -> 'T.Text' -> 'IO' ('Either' 'NoChange' ())
--
-- resize :: 'Ref' 'InputBase' -> 'Rectangle' -> 'IO' ()
--
-- setCursorColor :: 'Ref' 'InputBase' -> 'Color' -> 'IO' ()
--
-- setInputType :: 'Ref' 'InputBase' -> 'FlInputType' -> 'IO' ()
--
-- setMark :: 'Ref' 'InputBase' -> 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- setMaximumSize :: 'Ref' 'InputBase' -> 'Int' -> 'IO' ()
--
-- setPosition :: 'Ref' 'InputBase' -> 'Int' -> 'Maybe' 'Int' -> 'IO' ('Either' 'NoChange' ())
--
-- setReadonly :: 'Ref' 'InputBase' -> 'Bool' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'InputBase' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setSize :: 'Ref' 'InputBase' -> 'Size' -> 'IO' ()
--
-- setTabNav :: 'Ref' 'InputBase' -> 'Bool' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'InputBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'InputBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'InputBase' -> 'FontSize' -> 'IO' ()
--
-- setValue :: 'Ref' 'InputBase' -> 'T.Text' -> 'IO' ('Either' 'NoChange' ())
--
-- setWrap :: 'Ref' 'InputBase' -> 'Bool' -> 'IO' ()
--
-- showWidget :: 'Ref' 'InputBase' -> 'IO' ()
--
-- staticValue :: 'Ref' 'InputBase' -> 'T.Text' -> 'IO' ('Either' 'NoChange' ())
--
-- undo :: 'Ref' 'InputBase' -> 'IO' ('Either' 'NoChange' ())
-- @
