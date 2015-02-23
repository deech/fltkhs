{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Browser
    (
     -- * Constructor
     browserNew,
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
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Widget

{# fun Fl_Browser_New as browserNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Browser_New_WithLabel as browserNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBrowser_New_WithLabel as overriddenBrowserNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `String', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenBrowser_New as overriddenBrowserNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
browserNew :: Rectangle -> Maybe String -> Maybe (CustomWidgetFuncs Browser) -> IO (Ref Browser)
browserNew rectangle l' funcs' =
  widgetMaker
    rectangle
    l'
    funcs'
    browserNew'
    browserNewWithLabel'
    overriddenBrowserNew'
    overriddenBrowserNewWithLabel'

{#fun Fl_Browser_handle as browserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO Int)) => Op (Handle ()) Browser orig impl where
  runOp _ _ browser event = withRef browser (\p -> browserHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Browser_Destroy as browserDestroy' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) Browser orig impl where
  runOp _ _ browser = swapRef browser $ \browserPtr -> do
    browserDestroy' browserPtr
    return nullPtr
{# fun unsafe Fl_Browser_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (Remove ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> remove' browserPtr line
{# fun unsafe Fl_Browser_add as add' { id `Ptr ()',unsafeToCString `String' } -> `()' #}
instance (impl ~ (String ->  IO ())) => Op (Add ()) Browser orig impl where
  runOp _ _ browser newtext = withRef browser $ \browserPtr -> add' browserPtr newtext
{# fun unsafe Fl_Browser_insert as insert' { id `Ptr ()',`Int',unsafeToCString `String' } -> `()' #}
instance (impl ~ (Int -> String ->  IO ())) => Op (Insert ()) Browser orig impl where
  runOp _ _ browser line newtext = withRef browser $ \browserPtr -> insert' browserPtr line newtext
{# fun unsafe Fl_Browser_move as move' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> Int ->  IO ())) => Op (Move ()) Browser orig impl where
  runOp _ _ browser to from = withRef browser $ \browserPtr -> move' browserPtr to from
{# fun unsafe Fl_Browser_load as load' { id `Ptr ()',unsafeToCString `String' } -> `Int' #}
instance (impl ~ (String ->  IO (Int))) => Op (Load ()) Browser orig impl where
  runOp _ _ browser filename = withRef browser $ \browserPtr -> load' browserPtr filename
{# fun unsafe Fl_Browser_swap as swap' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> Int ->  IO ())) => Op (Swap ()) Browser orig impl where
  runOp _ _ browser a b = withRef browser $ \browserPtr -> swap' browserPtr a b
{# fun unsafe Fl_Browser_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> clear' browserPtr
{# fun unsafe Fl_Browser_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> size' browserPtr
{# fun unsafe Fl_Browser_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> Int ->  IO ())) => Op (SetSize ()) Browser orig impl where
  runOp _ _ browser w h = withRef browser $ \browserPtr -> setSize' browserPtr w h
{# fun unsafe Fl_Browser_topline as topline' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetTopline ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> topline' browserPtr
{# fun unsafe Fl_Browser_lineposition as lineposition' { id `Ptr ()',`Int', cFromEnum `LinePosition' } -> `()' #}
instance (impl ~ (Int -> LinePosition ->  IO ())) => Op (Lineposition ()) Browser orig impl where
  runOp _ _ browser line pos = withRef browser $ \browserPtr -> lineposition' browserPtr line pos
{# fun unsafe Fl_Browser_set_topline as setTopline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetTopline ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> setTopline' browserPtr line
{# fun unsafe Fl_Browser_bottomline as bottomline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetBottomline ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> bottomline' browserPtr line
{# fun unsafe Fl_Browser_middleline as middleline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetMiddleline ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> middleline' browserPtr line
{# fun unsafe Fl_Browser_select_with_val as select' { id `Ptr ()',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (Int -> Bool -> IO (Int))) => Op (Select ()) Browser orig impl where
  runOp _ _ browser selectType line = withRef browser $ \browserPtr -> select' browserPtr selectType line
{# fun unsafe Fl_Browser_selected as selected' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (Int ->  IO (Bool))) => Op (Selected ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> selected' browserPtr line
{# fun unsafe Fl_Browser_show_with_line as showWithLine' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (ShowWidgetLine ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> showWithLine' browserPtr line
{# fun unsafe Fl_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (ShowWidget ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> show' browserPtr
{# fun unsafe Fl_Browser_hide_with_line as hideWithLine' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (HideLine ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> hideWithLine' browserPtr line
{# fun unsafe Fl_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Hide ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hide' browserPtr
{# fun unsafe Fl_Browser_visible as visible' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (Visible ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> visible' browserPtr line
{# fun unsafe Fl_Browser_value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetValue ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> value' browserPtr
{# fun unsafe Fl_Browser_set_value as setValue' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetValue ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> setValue' browserPtr line
{# fun unsafe Fl_Browser_text as text' { id `Ptr ()',`Int' } -> `String' #}
instance (impl ~ (Int ->  IO (String))) => Op (GetText ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> text' browserPtr line
{# fun unsafe Fl_Browser_set_text as setText' { id `Ptr ()',`Int', unsafeToCString `String' } -> `()' #}
instance (impl ~ (Int -> String ->  IO ())) => Op (SetText ()) Browser orig impl where
  runOp _ _ browser line newtext = withRef browser $ \browserPtr -> setText' browserPtr line newtext
{# fun unsafe Fl_Browser_format_char as formatChar' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (Char))) => Op (GetFormatChar ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> formatChar' browserPtr >>= return . castCCharToChar
{# fun unsafe Fl_Browser_set_format_char as setFormatChar' { id `Ptr ()', id `CChar' } -> `()' #}
instance (impl ~ (Char ->  IO ())) => Op (SetFormatChar ()) Browser orig impl where
  runOp _ _ browser c = withRef browser $ \browserPtr -> setFormatChar' browserPtr (castCharToCChar c)
{# fun unsafe Fl_Browser_column_char as columnChar' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (Char))) => Op (GetColumnChar ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> columnChar' browserPtr >>= return . castCCharToChar
{# fun unsafe Fl_Browser_set_column_char as setColumnChar' { id `Ptr ()',id `CChar' } -> `()' #}
instance (impl ~ (Char ->  IO ())) => Op (SetColumnChar ()) Browser orig impl where
  runOp _ _ browser c = withRef browser $ \browserPtr -> setColumnChar' browserPtr (castCharToCChar c)
{# fun unsafe Fl_Browser_column_widths as columnWidths' { id `Ptr ()' } -> `Ptr CInt' id #}
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

{# fun unsafe Fl_Browser_set_column_widths as setColumnWidths' { id `Ptr ()', id `Ptr CInt' } -> `()' #}
instance (impl ~ ([Int] ->  IO ())) => Op (SetColumnWidths ()) Browser orig impl where
  runOp _ _ browser arr =
    withRef browser $ \browserPtr -> do
      ptr <- newArray ((map fromIntegral arr) :: [CInt])
      setColumnWidths' browserPtr (castPtr ptr)
{# fun unsafe Fl_Browser_displayed as displayed' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (Int ->  IO (Bool))) => Op (Displayed ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> displayed' browserPtr line
{# fun unsafe Fl_Browser_make_visible as makeVisible' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (MakeVisible ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> makeVisible' browserPtr line
{# fun unsafe Fl_Browser_set_icon as setIcon' { id `Ptr ()',`Int',id `Ptr ()' } -> `()' #}
instance (impl ~ (Int -> Ref Image ->  IO ())) => Op (SetIcon ()) Browser orig impl where
  runOp _ _ browser line icon = withRef browser $ \browserPtr -> withRef icon $ \iconPtr -> setIcon' browserPtr line iconPtr
{# fun unsafe Fl_Browser_icon as icon' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ (Int ->  IO (Ref Image))) => Op (GetIcon ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> icon' browserPtr line >>= toRef
{# fun unsafe Fl_Browser_remove_icon as removeIcon' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (RemoveIcon ()) Browser orig impl where
  runOp _ _ browser line = withRef browser $ \browserPtr -> removeIcon' browserPtr line
{# fun unsafe Fl_Browser_deselect as deselect' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (Deselect ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> deselect' browserPtr
{# fun unsafe Fl_Browser_deselect_with_docallbacks as deselectWithDocallbacks' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Int ->  IO (Int))) => Op (DeselectAndCallback ()) Browser orig impl where
  runOp _ _ browser docallbacks = withRef browser $ \browserPtr -> deselectWithDocallbacks' browserPtr docallbacks
{# fun unsafe Fl_Browser_position as position' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetPosition ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> position' browserPtr
{# fun unsafe Fl_Browser_set_position as setPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetPosition ()) Browser orig impl where
  runOp _ _ browser pos = withRef browser $ \browserPtr -> setPosition' browserPtr pos
{# fun unsafe Fl_Browser_hposition as hposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetHposition ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hposition' browserPtr
{# fun unsafe Fl_Browser_set_hposition as setHposition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetHposition ()) Browser orig impl where
  runOp _ _ browser int = withRef browser $ \browserPtr -> setHposition' browserPtr int
{# fun unsafe Fl_Browser_has_scrollbar as hasScrollbar' { id `Ptr ()' } -> `ScrollbarMode' cToEnum #}
instance (impl ~ ( IO (ScrollbarMode))) => Op (GetHasScrollbar ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hasScrollbar' browserPtr
{# fun unsafe Fl_Browser_set_has_scrollbar as setHasScrollbar' { id `Ptr ()', cFromEnum `ScrollbarMode' } -> `()' #}
instance (impl ~ (ScrollbarMode->  IO ())) => Op (SetHasScrollbar ()) Browser orig impl where
  runOp _ _ browser mode = withRef browser $ \browserPtr -> setHasScrollbar' browserPtr mode
{# fun unsafe Fl_Browser_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textfont' browserPtr
{# fun unsafe Fl_Browser_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) Browser orig impl where
  runOp _ _ browser font = withRef browser $ \browserPtr -> setTextfont' browserPtr font
{# fun unsafe Fl_Browser_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textsize' browserPtr >>= return . FontSize
{# fun unsafe Fl_Browser_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) Browser orig impl where
  runOp _ _ browser (FontSize newsize) = withRef browser $ \browserPtr -> setTextsize' browserPtr newsize
{# fun unsafe Fl_Browser_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textcolor' browserPtr
{# fun unsafe Fl_Browser_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) Browser orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setTextcolor' browserPtr col
{# fun unsafe Fl_Browser_scrollbar_size as scrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarSize ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> scrollbarSize' browserPtr
{# fun unsafe Fl_Browser_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarSize ()) Browser orig impl where
  runOp _ _ browser newsize = withRef browser $ \browserPtr -> setScrollbarSize' browserPtr newsize
{# fun unsafe Fl_Browser_scrollbar_width as scrollbarWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarWidth ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> scrollbarWidth' browserPtr
{# fun unsafe Fl_Browser_set_scrollbar_width as setScrollbarWidth' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarWidth ()) Browser orig impl where
  runOp _ _ browser width = withRef browser $ \browserPtr -> setScrollbarWidth' browserPtr width
{# fun unsafe Fl_Browser_sort_with_flags as sortWithFlags' {id `Ptr ()', cFromEnum `SortType'} -> `()' #}
instance (impl ~ (SortType -> IO ())) => Op (SortWithSortType ()) Browser orig impl where
  runOp _ _ browser sorttype' = withRef browser $ \browserPtr -> sortWithFlags' browserPtr sorttype'
{# fun unsafe Fl_Browser_sort as sort' {id `Ptr ()'} -> `()' #}
instance (impl ~ IO ()) => Op (Sort ()) Browser orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> sort' browserPtr


-- $functions
-- @
--
-- add :: 'Ref' 'Browser' -> 'String' -> 'IO' ()
--
-- clear :: 'Ref' 'Browser' -> 'IO' ()
--
-- deselect :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- deselectAndCallback :: 'Ref' 'Browser' -> 'Int' -> 'IO' 'Int'
--
-- destroy :: 'Ref' 'Browser' -> 'IO' ()
--
-- displayed :: 'Ref' 'Browser' -> 'Int' -> 'IO' 'Bool'
--
-- getColumnChar :: 'Ref' 'Browser' -> 'IO' 'Char'
--
-- getColumnWidths :: 'Ref' 'Browser' -> 'IO' ['Int']
--
-- getFormatChar :: 'Ref' 'Browser' -> 'IO' 'Char'
--
-- getHasScrollbar :: 'Ref' 'Browser' -> 'IO' 'ScrollbarMode'
--
-- getHposition :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- getIcon :: 'Ref' 'Browser' -> 'Int' -> 'IO' ('Ref' 'Image')
--
-- getPosition :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- getScrollbarSize :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- getScrollbarWidth :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- getSize :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- getText :: 'Ref' 'Browser' -> 'Int' -> 'IO' 'String'
--
-- getTextcolor :: 'Ref' 'Browser' -> 'IO' 'Color'
--
-- getTextfont :: 'Ref' 'Browser' -> 'IO' 'Font'
--
-- getTextsize :: 'Ref' 'Browser' -> 'IO' 'FontSize'
--
-- getTopline :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- getValue :: 'Ref' 'Browser' -> 'IO' 'Int'
--
-- handle :: 'Ref' 'Browser' -> 'Event' -> 'IO' 'Int'
--
-- hide :: 'Ref' 'Browser' -> 'IO' ()
--
-- hideLine :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- insert :: 'Ref' 'Browser' -> 'Int' -> 'String' -> 'IO' ()
--
-- lineposition :: 'Ref' 'Browser' -> 'Int' -> 'LinePosition' -> 'IO' ()
--
-- load :: 'Ref' 'Browser' -> 'String' -> 'IO' 'Int'
--
-- makeVisible :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- move :: 'Ref' 'Browser' -> 'Int' -> 'Int' -> 'IO' ()
--
-- remove :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- removeIcon :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- select :: 'Ref' 'Browser' -> 'Int' -> 'Bool' -> 'IO' 'Int'
--
-- selected :: 'Ref' 'Browser' -> 'Int' -> 'IO' 'Bool'
--
-- setBottomline :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setColumnChar :: 'Ref' 'Browser' -> 'Char' -> 'IO' ()
--
-- setColumnWidths :: 'Ref' 'Browser' -> ['Int'] -> 'IO' ()
--
-- setFormatChar :: 'Ref' 'Browser' -> 'Char' -> 'IO' ()
--
-- setHasScrollbar :: 'Ref' 'Browser' -> 'ScrollbarMode' -> 'IO' ()
--
-- setHposition :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setIcon :: 'Ref' 'Browser' -> 'Int' -> 'Ref' 'Image' -> 'IO' ()
--
-- setMiddleline :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setPosition :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setScrollbarWidth :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setSize :: 'Ref' 'Browser' -> 'Int' -> 'Int' -> 'IO' ()
--
-- setText :: 'Ref' 'Browser' -> 'Int' -> 'String' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'Browser' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'Browser' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'Browser' -> 'FontSize' -> 'IO' ()
--
-- setTopline :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- setValue :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- showWidget :: 'Ref' 'Browser' -> 'IO' ()
--
-- showWidgetLine :: 'Ref' 'Browser' -> 'Int' -> 'IO' ()
--
-- sort :: 'Ref' 'Browser' -> 'IO' ()
--
-- sortWithSortType :: 'Ref' 'Browser' -> 'SortType' -> 'IO' ()
--
-- swap :: 'Ref' 'Browser' -> 'Int' -> 'Int' -> 'IO' ()
--
-- visible :: 'Ref' 'Browser' -> 'Int' -> 'IO' 'Int'
--
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