{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Browser
    (
     -- * Constructor
     browserNew,
     browserCustom
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $functions
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_BrowserC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)

import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_Browser_New as browserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Browser_New_WithLabel as browserNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBrowser_New_WithLabel as overriddenBrowserNewWithLabel' { `Int',`Int',`Int',`Int',`CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBrowser_New as overriddenBrowserNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
browserCustom :: Rectangle -> Maybe T.Text -> Maybe (Ref Browser -> IO ()) -> Maybe (CustomWidgetFuncs Browser) -> IO (Ref Browser)
browserCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenBrowserNew'
    overriddenBrowserNewWithLabel'

browserNew :: Rectangle -> Maybe T.Text -> IO (Ref Browser)
browserNew rectangle l' =
  widgetMaker
    rectangle
    l'
    Nothing
    Nothing
    overriddenBrowserNew'
    overriddenBrowserNewWithLabel'


{#fun Fl_Browser_handle as browserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Browser orig impl where
  runOp _ _ browser event = withRef browser (\p -> browserHandle' p (fromIntegral . fromEnum $ event)) >>= return . successOrUnknownEvent
{# fun Fl_Browser_Destroy as browserDestroy' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) Browser orig impl where
  runOp _ _ browser = swapRef browser $ \browserPtr -> do
    browserDestroy' browserPtr
    return nullPtr
{# fun Fl_Browser_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (Remove ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> remove' browserPtr line
{# fun Fl_Browser_add as add' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (Add ()) Browser orig impl where
  runOp _ _ browser newtext = withRef browser $ \browserPtr -> copyTextToCString newtext >>= add' browserPtr
{# fun Fl_Browser_insert as insert' { id `Ptr ()',`Int',`CString' } -> `()' #}
instance (impl ~ (LineNumber -> T.Text ->  IO ())) => Op (Insert ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) newtext = withRef browser $ \browserPtr -> copyTextToCString newtext >>= insert' browserPtr line
{# fun Fl_Browser_move as move' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (LineNumber -> LineNumber ->  IO ())) => Op (Move ()) Browser orig impl where
  runOp _ _ browser (LineNumber to) (LineNumber from) = withRef browser $ \browserPtr -> move' browserPtr to from
{# fun Fl_Browser_load as load' { id `Ptr ()',`CString' } -> `Int' #}
instance (impl ~ (T.Text ->  IO (Either UnknownError ()))) => Op (Load ()) Browser orig impl where
  runOp _ _ browser filename = do
    res <- withRef browser $ \browserPtr -> withText filename (\f -> load' browserPtr f)
    if (res == 0) then return (Left UnknownError) else return (Right ())
{# fun Fl_Browser_swap as swap' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (LineNumber -> LineNumber ->  IO ())) => Op (Swap ()) Browser orig impl where
  runOp _ _ browser (LineNumber a) (LineNumber b) = withRef browser $ \browserPtr -> swap' browserPtr a b
{# fun Fl_Browser_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> clear' browserPtr
{# fun Fl_Browser_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> size' browserPtr
{# fun Fl_Browser_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Size ->  IO ())) => Op (SetSize ()) Browser orig impl where
  runOp _ _ browser (Size (Width w) (Height h)) = withRef browser $ \browserPtr -> setSize' browserPtr w h
{# fun Fl_Browser_topline as topline' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (LineNumber))) => Op (GetTopline ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> topline' browserPtr >>= return . LineNumber
{# fun Fl_Browser_lineposition as lineposition' { id `Ptr ()',`Int', cFromEnum `LinePosition' } -> `()' #}
instance (impl ~ (LineNumber -> LinePosition ->  IO ())) => Op (Lineposition ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) pos = withRef browser $ \browserPtr -> lineposition' browserPtr line pos
{# fun Fl_Browser_set_topline as setTopline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetTopline ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> setTopline' browserPtr line
{# fun Fl_Browser_bottomline as bottomline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetBottomline ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> bottomline' browserPtr line
{# fun Fl_Browser_middleline as middleline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetMiddleline ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> middleline' browserPtr line
{# fun Fl_Browser_select_with_val as select' { id `Ptr ()',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (LineNumber -> Bool -> IO (Either NoChange ()))) => Op (Select ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) selectType = withRef browser $ \browserPtr -> select' browserPtr line selectType >>= return . successOrNoChange
{# fun Fl_Browser_selected as selected' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (LineNumber ->  IO (Bool))) => Op (Selected ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> selected' browserPtr line
{# fun Fl_Browser_show_with_line as showWithLine' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (ShowWidgetLine ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> showWithLine' browserPtr line
{# fun Fl_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> show' browserPtr
{# fun Fl_Browser_hide_with_line as hideWithLine' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (HideLine ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> hideWithLine' browserPtr line
{# fun Fl_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Hide ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hide' browserPtr
{# fun Fl_Browser_visible as visible' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (LineNumber ->  IO (Bool))) => Op (Visible ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> visible' browserPtr line
{# fun Fl_Browser_value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (LineNumber))) => Op (GetValue ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> value' browserPtr >>= return . LineNumber
{# fun Fl_Browser_set_value as setValue' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetValue ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> setValue' browserPtr line
{# fun Fl_Browser_text as text' { id `Ptr ()',`Int' } -> `CString' #}
instance (impl ~ (LineNumber ->  IO T.Text)) => Op (GetText ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> text' browserPtr line >>= cStringToText
{# fun Fl_Browser_set_text as setText' { id `Ptr ()',`Int', `CString' } -> `()' #}
instance (impl ~ (LineNumber -> T.Text ->  IO ())) => Op (SetText ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) newtext = withRef browser $ \browserPtr -> copyTextToCString newtext >>= setText' browserPtr line
{# fun Fl_Browser_format_char as formatChar' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (Char))) => Op (GetFormatChar ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> formatChar' browserPtr >>= return . castCCharToChar
{# fun Fl_Browser_set_format_char as setFormatChar' { id `Ptr ()', id `CChar' } -> `()' #}
instance (impl ~ (Char ->  IO ())) => Op (SetFormatChar ()) Browser orig impl where
  runOp _ _ browser c = withRef browser $ \browserPtr -> setFormatChar' browserPtr (castCharToCChar c)
{# fun Fl_Browser_column_char as columnChar' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (Char))) => Op (GetColumnChar ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> columnChar' browserPtr >>= return . castCCharToChar
{# fun Fl_Browser_set_column_char as setColumnChar' { id `Ptr ()',id `CChar' } -> `()' #}
instance (impl ~ (Char ->  IO ())) => Op (SetColumnChar ()) Browser orig impl where
  runOp _ _ browser c = withRef browser $ \browserPtr -> setColumnChar' browserPtr (castCharToCChar c)
{# fun Fl_Browser_column_widths as columnWidths' { id `Ptr ()' } -> `Ptr CInt' id #}
instance (impl ~ ( IO [Int])) => Op (GetColumnWidths ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> do
    ptr <- columnWidths' browserPtr
    if (ptr == nullPtr)
      then return []
      else go ptr []
    where
      go ptr accum = do
        curr <- peek ptr
        if (curr == 0)
          then return accum
          else go (ptr `plusPtr` (sizeOf (undefined :: CInt))) (accum ++ [fromIntegral curr])

{# fun Fl_Browser_set_column_widths as setColumnWidths' { id `Ptr ()', id `Ptr CInt' } -> `()' #}
instance (impl ~ ([Int] ->  IO ())) => Op (SetColumnWidths ()) Browser orig impl where
  runOp _ _ browser arr =
    withRef browser $ \browserPtr -> do
      ptr <- newArray ((map fromIntegral arr) :: [CInt])
      setColumnWidths' browserPtr (castPtr ptr)
{# fun Fl_Browser_displayed as displayed' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (LineNumber ->  IO (Bool))) => Op (Displayed ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> displayed' browserPtr line
{# fun Fl_Browser_make_visible as makeVisible' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (MakeVisible ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> makeVisible' browserPtr line
{# fun Fl_Browser_set_icon as setIcon' { id `Ptr ()',`Int',id `Ptr ()' } -> `()' #}
instance (impl ~ (LineNumber -> Ref Image ->  IO ())) => Op (SetIcon ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) icon = withRef browser $ \browserPtr -> withRef icon $ \iconPtr -> setIcon' browserPtr line iconPtr
{# fun Fl_Browser_icon as icon' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ (LineNumber ->  IO (Maybe (Ref Image)))) => Op (GetIcon ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> icon' browserPtr line >>= toMaybeRef
{# fun Fl_Browser_remove_icon as removeIcon' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (RemoveIcon ()) Browser orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> removeIcon' browserPtr line
{# fun Fl_Browser_deselect as deselect' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (Deselect ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> deselect' browserPtr >>= return . successOrNoChange
{# fun Fl_Browser_deselect_with_docallbacks as deselectWithDocallbacks' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (IO (Either NoChange ()))) => Op (DeselectAndCallback ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> deselectWithDocallbacks' browserPtr 1 >>= return . successOrNoChange
{# fun Fl_Browser_position as position' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (PixelPosition))) => Op (GetPosition ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> position' browserPtr >>= return . PixelPosition
{# fun Fl_Browser_set_position as setPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (PixelPosition ->  IO ())) => Op (SetPosition ()) Browser orig impl where
  runOp _ _ browser (PixelPosition pos) = withRef browser $ \browserPtr -> setPosition' browserPtr pos
{# fun Fl_Browser_hposition as hposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (PixelPosition))) => Op (GetHposition ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hposition' browserPtr >>= return . PixelPosition
{# fun Fl_Browser_set_hposition as setHposition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (PixelPosition ->  IO ())) => Op (SetHposition ()) Browser orig impl where
  runOp _ _ browser (PixelPosition int) = withRef browser $ \browserPtr -> setHposition' browserPtr int
{# fun Fl_Browser_has_scrollbar as hasScrollbar' { id `Ptr ()' } -> `ScrollbarMode' cToEnum #}
instance (impl ~ ( IO (ScrollbarMode))) => Op (GetHasScrollbar ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hasScrollbar' browserPtr
{# fun Fl_Browser_set_has_scrollbar as setHasScrollbar' { id `Ptr ()', cFromEnum `ScrollbarMode' } -> `()' #}
instance (impl ~ (ScrollbarMode ->  IO ())) => Op (SetHasScrollbar ()) Browser orig impl where
  runOp _ _ browser mode = withRef browser $ \browserPtr -> setHasScrollbar' browserPtr mode
{# fun Fl_Browser_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textfont' browserPtr
{# fun Fl_Browser_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) Browser orig impl where
  runOp _ _ browser font = withRef browser $ \browserPtr -> setTextfont' browserPtr font
{# fun Fl_Browser_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textsize' browserPtr >>= return . FontSize
{# fun Fl_Browser_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) Browser orig impl where
  runOp _ _ browser (FontSize newsize) = withRef browser $ \browserPtr -> setTextsize' browserPtr newsize
{# fun Fl_Browser_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textcolor' browserPtr
{# fun Fl_Browser_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) Browser orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setTextcolor' browserPtr col
{# fun Fl_Browser_set_scrollbar_color as setScrollbarColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetScrollbarColor ()) Browser orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setScrollbarColor' browserPtr col
{# fun Fl_Browser_set_scrollbar_selection_color as setScrollbarSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetScrollbarSelectionColor ()) Browser orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setScrollbarSelectionColor' browserPtr col
{# fun Fl_Browser_scrollbar_size as scrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarSize ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> scrollbarSize' browserPtr
{# fun Fl_Browser_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarSize ()) Browser orig impl where
  runOp _ _ browser newsize = withRef browser $ \browserPtr -> setScrollbarSize' browserPtr newsize
{# fun Fl_Browser_scrollbar_width as scrollbarWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarWidth ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> scrollbarWidth' browserPtr
{# fun Fl_Browser_set_scrollbar_width as setScrollbarWidth' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarWidth ()) Browser orig impl where
  runOp _ _ browser width = withRef browser $ \browserPtr -> setScrollbarWidth' browserPtr width
{# fun Fl_Browser_sort_with_flags as sortWithFlags' {id `Ptr ()', cFromEnum `SortType'} -> `()' #}
instance (impl ~ (SortType -> IO ())) => Op (SortWithSortType ()) Browser orig impl where
  runOp _ _ browser sorttype' = withRef browser $ \browserPtr -> sortWithFlags' browserPtr sorttype'
{# fun Fl_Browser_sort as sort' {id `Ptr ()'} -> `()' #}
instance (impl ~ IO ()) => Op (Sort ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> sort' browserPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (BrowserType ->  IO ())) => Op (SetType ()) Browser orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (BrowserType)) => Op (GetType_ ()) Browser orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger
{# fun Fl_Browser_handle_super as handleSuper' { id `Ptr ()', id `CInt'} -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (HandleSuper ()) Browser orig impl where
  runOp _ _ browser event = withRef browser (\p -> handleSuper' p (fromIntegral . fromEnum $ event)) >>= return . successOrUnknownEvent
{# fun Fl_Browser_draw_super as drawSuper' { id `Ptr ()' }  -> `()' #}
instance (impl ~ (IO ())) => Op (DrawSuper ()) Browser orig impl where
  runOp _ _ browser = withRef browser (\p -> drawSuper' p)

-- $functions
-- @
-- add :: 'Ref' 'Browser' -> 'T.Text' -> 'IO' ()
--
-- clear :: 'Ref' 'Browser' -> 'IO' ()
--
-- deselect :: 'Ref' 'Browser' -> 'IO' ('Either' 'NoChange' ())
--
-- deselectAndCallback :: 'Ref' 'Browser' -> 'IO' ('Either' 'NoChange' ())
--
-- destroy :: 'Ref' 'Browser' -> 'IO' ()
--
-- displayed :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ('Bool')
--
-- drawSuper :: 'Ref' 'Browser' -> 'IO' ()
--
-- getColumnChar :: 'Ref' 'Browser' -> 'IO' ('Char')
--
-- getColumnWidths :: 'Ref' 'Browser' -> 'IO' ['Int']
--
-- getFormatChar :: 'Ref' 'Browser' -> 'IO' ('Char')
--
-- getHasScrollbar :: 'Ref' 'Browser' -> 'IO' ('ScrollbarMode')
--
-- getHposition :: 'Ref' 'Browser' -> 'IO' ('PixelPosition')
--
-- getIcon :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getPosition :: 'Ref' 'Browser' -> 'IO' ('PixelPosition')
--
-- getScrollbarSize :: 'Ref' 'Browser' -> 'IO' ('Int')
--
-- getScrollbarWidth :: 'Ref' 'Browser' -> 'IO' ('Int')
--
-- getSize :: 'Ref' 'Browser' -> 'IO' ('Int')
--
-- getText :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' 'T.Text'
--
-- getTextcolor :: 'Ref' 'Browser' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'Browser' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'Browser' -> 'IO' ('FontSize')
--
-- getTopline :: 'Ref' 'Browser' -> 'IO' ('LineNumber')
--
-- getType_ :: 'Ref' 'Browser' -> 'IO' ('BrowserType')
--
-- getValue :: 'Ref' 'Browser' -> 'IO' ('LineNumber')
--
-- handle :: 'Ref' 'Browser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- handleSuper :: 'Ref' 'Browser' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'Browser' -> 'IO' ()
--
-- hideLine :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- insert :: 'Ref' 'Browser' -> 'LineNumber' -> 'T.Text' -> 'IO' ()
--
-- lineposition :: 'Ref' 'Browser' -> 'LineNumber' -> 'LinePosition' -> 'IO' ()
--
-- load :: 'Ref' 'Browser' -> 'T.Text' -> 'IO' ('Either' 'UnknownError' ())
--
-- makeVisible :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- move :: 'Ref' 'Browser' -> 'LineNumber' -> 'LineNumber' -> 'IO' ()
--
-- remove :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- removeIcon :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- select :: 'Ref' 'Browser' -> 'LineNumber' -> 'Bool' -> 'IO' ('Either' 'NoChange' ())
--
-- selected :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ('Bool')
--
-- setBottomline :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- setColumnChar :: 'Ref' 'Browser' -> 'Char' -> 'IO' ()
--
-- setColumnWidths :: 'Ref' 'Browser' -> ['Int'] -> 'IO' ()
--
-- setFormatChar :: 'Ref' 'Browser' -> 'Char' -> 'IO' ()
--
-- setHasScrollbar :: 'Ref' 'Browser' -> 'ScrollbarMode' -> 'IO' ()
--
-- setHposition :: 'Ref' 'Browser' -> 'PixelPosition' -> 'IO' ()
--
-- setIcon :: 'Ref' 'Browser' -> 'LineNumber' -> 'Ref' 'Image' -> 'IO' ()
--
-- setMiddleline :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- setPosition :: 'Ref' 'Browser' -> 'PixelPosition' -> 'IO' ()
--
-- setScrollbarColor :: 'Ref' 'Browser' -> 'Color' -> 'IO' ()
--
-- setScrollbarSelectionColor :: 'Ref' 'Browser' -> 'Color' -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setScrollbarWidth :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setSize :: 'Ref' 'Browser' -> 'Size' -> 'IO' ()
--
-- setText :: 'Ref' 'Browser' -> 'LineNumber' -> 'T.Text' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'Browser' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'Browser' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'Browser' -> 'FontSize' -> 'IO' ()
--
-- setTopline :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- setType :: 'Ref' 'Browser' -> 'BrowserType' -> 'IO' ()
--
-- setValue :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Browser' -> 'IO' ()
--
-- showWidgetLine :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ()
--
-- sort :: 'Ref' 'Browser' -> 'IO' ()
--
-- sortWithSortType :: 'Ref' 'Browser' -> 'SortType' -> 'IO' ()
--
-- swap :: 'Ref' 'Browser' -> 'LineNumber' -> 'LineNumber' -> 'IO' ()
--
-- visible :: 'Ref' 'Browser' -> 'LineNumber' -> 'IO' ('Bool')
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Browser"
-- @
