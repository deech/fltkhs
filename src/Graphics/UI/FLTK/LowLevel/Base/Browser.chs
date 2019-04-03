{-# LANGUAGE CPP, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.Browser
    (
     -- * Constructor
     browserNew,
     browserCustom
    , handleBrowserBase
    , drawBrowserBase
    , hideBrowserBase
    , resizeBrowserBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget

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


{# fun Fl_Browser_Destroy as browserDestroy' { id `Ptr ()' } -> `()' #}
instance (impl ~ (IO ())) => Op (Destroy ()) BrowserBase orig impl where
  runOp _ _ browser = swapRef browser $ \browserPtr -> do
    browserDestroy' browserPtr
    return nullPtr
{# fun Fl_Browser_remove as remove' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (Remove ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> remove' browserPtr line
{# fun Fl_Browser_add as add' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (Add ()) BrowserBase orig impl where
  runOp _ _ browser newtext = withRef browser $ \browserPtr -> copyTextToCString newtext >>= add' browserPtr
{# fun Fl_Browser_insert as insert' { id `Ptr ()',`Int',`CString' } -> `()' #}
instance (impl ~ (LineNumber -> T.Text ->  IO ())) => Op (Insert ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) newtext = withRef browser $ \browserPtr -> copyTextToCString newtext >>= insert' browserPtr line
{# fun Fl_Browser_move as move' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (LineNumber -> LineNumber ->  IO ())) => Op (Move ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber to) (LineNumber from) = withRef browser $ \browserPtr -> move' browserPtr to from
{# fun Fl_Browser_load as load' { id `Ptr ()',`CString' } -> `Int' #}
instance (impl ~ (T.Text ->  IO (Either UnknownError ()))) => Op (Load ()) BrowserBase orig impl where
  runOp _ _ browser filename = do
    res <- withRef browser $ \browserPtr -> withText filename (\f -> load' browserPtr f)
    if (res == 0) then return (Left UnknownError) else return (Right ())
{# fun Fl_Browser_swap as swap' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (LineNumber -> LineNumber ->  IO ())) => Op (Swap ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber a) (LineNumber b) = withRef browser $ \browserPtr -> swap' browserPtr a b
{# fun Fl_Browser_clear as clear' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (Clear ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> clear' browserPtr
{# fun Fl_Browser_size as size' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetSize ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> size' browserPtr
{# fun Fl_Browser_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Size ->  IO ())) => Op (SetSize ()) BrowserBase orig impl where
  runOp _ _ browser (Size (Width w) (Height h)) = withRef browser $ \browserPtr -> setSize' browserPtr w h
{# fun Fl_Browser_topline as topline' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (LineNumber))) => Op (GetTopline ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> topline' browserPtr >>= return . LineNumber
{# fun Fl_Browser_lineposition as lineposition' { id `Ptr ()',`Int', cFromEnum `LinePosition' } -> `()' #}
instance (impl ~ (LineNumber -> LinePosition ->  IO ())) => Op (Lineposition ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) pos = withRef browser $ \browserPtr -> lineposition' browserPtr line pos
{# fun Fl_Browser_set_topline as setTopline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetTopline ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> setTopline' browserPtr line
{# fun Fl_Browser_bottomline as bottomline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetBottomline ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> bottomline' browserPtr line
{# fun Fl_Browser_middleline as middleline' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetMiddleline ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> middleline' browserPtr line
{# fun Fl_Browser_select_with_val as select' { id `Ptr ()',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (LineNumber -> Bool -> IO (Either NoChange ()))) => Op (Select ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) selectType = withRef browser $ \browserPtr -> select' browserPtr line selectType >>= return . successOrNoChange
{# fun Fl_Browser_selected as selected' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (LineNumber ->  IO (Bool))) => Op (Selected ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> selected' browserPtr line
{# fun Fl_Browser_show_with_line as showWithLine' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (ShowWidgetLine ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> showWithLine' browserPtr line
{# fun Fl_Browser_hide_with_line as hideWithLine' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (HideLine ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> hideWithLine' browserPtr line
{# fun Fl_Browser_visible as visible' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (LineNumber ->  IO (Bool))) => Op (Visible ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> visible' browserPtr line
{# fun Fl_Browser_value as value' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (LineNumber))) => Op (GetValue ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> value' browserPtr >>= return . LineNumber
{# fun Fl_Browser_set_value as setValue' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (SetValue ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> setValue' browserPtr line
{# fun Fl_Browser_text as text' { id `Ptr ()',`Int' } -> `CString' #}
instance (impl ~ (LineNumber ->  IO T.Text)) => Op (GetText ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> text' browserPtr line >>= cStringToText
{# fun Fl_Browser_set_text as setText' { id `Ptr ()',`Int', `CString' } -> `()' #}
instance (impl ~ (LineNumber -> T.Text ->  IO ())) => Op (SetText ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) newtext = withRef browser $ \browserPtr -> copyTextToCString newtext >>= setText' browserPtr line
{# fun Fl_Browser_format_char as formatChar' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (Char))) => Op (GetFormatChar ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> formatChar' browserPtr >>= return . castCCharToChar
{# fun Fl_Browser_set_format_char as setFormatChar' { id `Ptr ()', id `CChar' } -> `()' #}
instance (impl ~ (Char ->  IO ())) => Op (SetFormatChar ()) BrowserBase orig impl where
  runOp _ _ browser c = withRef browser $ \browserPtr -> setFormatChar' browserPtr (castCharToCChar c)
{# fun Fl_Browser_column_char as columnChar' { id `Ptr ()' } -> `CChar' id #}
instance (impl ~ ( IO (Char))) => Op (GetColumnChar ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> columnChar' browserPtr >>= return . castCCharToChar
{# fun Fl_Browser_set_column_char as setColumnChar' { id `Ptr ()',id `CChar' } -> `()' #}
instance (impl ~ (Char ->  IO ())) => Op (SetColumnChar ()) BrowserBase orig impl where
  runOp _ _ browser c = withRef browser $ \browserPtr -> setColumnChar' browserPtr (castCharToCChar c)
{# fun Fl_Browser_column_widths as columnWidths' { id `Ptr ()' } -> `Ptr CInt' id #}
instance (impl ~ ( IO [Int])) => Op (GetColumnWidths ()) BrowserBase orig impl where
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
instance (impl ~ ([Int] ->  IO ())) => Op (SetColumnWidths ()) BrowserBase orig impl where
  runOp _ _ browser arr =
    withRef browser $ \browserPtr -> do
      ptr <- newArray ((map fromIntegral arr) :: [CInt])
      setColumnWidths' browserPtr (castPtr ptr)
{# fun Fl_Browser_displayed as displayed' { id `Ptr ()',`Int' } -> `Bool' cToBool #}
instance (impl ~ (LineNumber ->  IO (Bool))) => Op (Displayed ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> displayed' browserPtr line
{# fun Fl_Browser_make_visible as makeVisible' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (MakeVisible ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> makeVisible' browserPtr line
{# fun Fl_Browser_set_icon as setIcon' { id `Ptr ()',`Int',id `Ptr ()' } -> `()' #}
instance (impl ~ (LineNumber -> Ref Image ->  IO ())) => Op (SetIcon ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) icon = withRef browser $ \browserPtr -> withRef icon $ \iconPtr -> setIcon' browserPtr line iconPtr
{# fun Fl_Browser_icon as icon' { id `Ptr ()',`Int' } -> `Ptr ()' id #}
instance (impl ~ (LineNumber ->  IO (Maybe (Ref Image)))) => Op (GetIcon ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> icon' browserPtr line >>= toMaybeRef
{# fun Fl_Browser_remove_icon as removeIcon' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (LineNumber ->  IO ())) => Op (RemoveIcon ()) BrowserBase orig impl where
  runOp _ _ browser (LineNumber line) = withRef browser $ \browserPtr -> removeIcon' browserPtr line
{# fun Fl_Browser_deselect as deselect' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either NoChange ()))) => Op (Deselect ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> deselect' browserPtr >>= return . successOrNoChange
{# fun Fl_Browser_deselect_with_docallbacks as deselectWithDocallbacks' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (IO (Either NoChange ()))) => Op (DeselectAndCallback ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> deselectWithDocallbacks' browserPtr 1 >>= return . successOrNoChange
{# fun Fl_Browser_position as position' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (PixelPosition))) => Op (GetPosition ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> position' browserPtr >>= return . PixelPosition
{# fun Fl_Browser_set_position as setPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (PixelPosition ->  IO ())) => Op (SetPosition ()) BrowserBase orig impl where
  runOp _ _ browser (PixelPosition pos) = withRef browser $ \browserPtr -> setPosition' browserPtr pos
{# fun Fl_Browser_hposition as hposition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (PixelPosition))) => Op (GetHposition ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hposition' browserPtr >>= return . PixelPosition
{# fun Fl_Browser_set_hposition as setHposition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (PixelPosition ->  IO ())) => Op (SetHposition ()) BrowserBase orig impl where
  runOp _ _ browser (PixelPosition int) = withRef browser $ \browserPtr -> setHposition' browserPtr int
{# fun Fl_Browser_has_scrollbar as hasScrollbar' { id `Ptr ()' } -> `ScrollbarMode' cToEnum #}
instance (impl ~ ( IO (ScrollbarMode))) => Op (GetHasScrollbar ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hasScrollbar' browserPtr
{# fun Fl_Browser_set_has_scrollbar as setHasScrollbar' { id `Ptr ()', cFromEnum `ScrollbarMode' } -> `()' #}
instance (impl ~ (ScrollbarMode ->  IO ())) => Op (SetHasScrollbar ()) BrowserBase orig impl where
  runOp _ _ browser mode = withRef browser $ \browserPtr -> setHasScrollbar' browserPtr mode
{# fun Fl_Browser_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textfont' browserPtr
{# fun Fl_Browser_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) BrowserBase orig impl where
  runOp _ _ browser font = withRef browser $ \browserPtr -> setTextfont' browserPtr font
{# fun Fl_Browser_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textsize' browserPtr >>= return . FontSize
{# fun Fl_Browser_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) BrowserBase orig impl where
  runOp _ _ browser (FontSize newsize) = withRef browser $ \browserPtr -> setTextsize' browserPtr newsize
{# fun Fl_Browser_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> textcolor' browserPtr
{# fun Fl_Browser_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) BrowserBase orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setTextcolor' browserPtr col
{# fun Fl_Browser_set_scrollbar_color as setScrollbarColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetScrollbarColor ()) BrowserBase orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setScrollbarColor' browserPtr col
{# fun Fl_Browser_set_scrollbar_selection_color as setScrollbarSelectionColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetScrollbarSelectionColor ()) BrowserBase orig impl where
  runOp _ _ browser col = withRef browser $ \browserPtr -> setScrollbarSelectionColor' browserPtr col
{# fun Fl_Browser_scrollbar_size as scrollbarSize' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarSize ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> scrollbarSize' browserPtr
{# fun Fl_Browser_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarSize ()) BrowserBase orig impl where
  runOp _ _ browser newsize = withRef browser $ \browserPtr -> setScrollbarSize' browserPtr newsize
{# fun Fl_Browser_scrollbar_width as scrollbarWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Int))) => Op (GetScrollbarWidth ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> scrollbarWidth' browserPtr
{# fun Fl_Browser_set_scrollbar_width as setScrollbarWidth' { id `Ptr ()', `Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetScrollbarWidth ()) BrowserBase orig impl where
  runOp _ _ browser width = withRef browser $ \browserPtr -> setScrollbarWidth' browserPtr width
{# fun Fl_Browser_sort_with_flags as sortWithFlags' {id `Ptr ()', cFromEnum `SortType'} -> `()' #}
instance (impl ~ (SortType -> IO ())) => Op (SortWithSortType ()) BrowserBase orig impl where
  runOp _ _ browser sorttype' = withRef browser $ \browserPtr -> sortWithFlags' browserPtr sorttype'
{# fun Fl_Browser_sort as sort' {id `Ptr ()'} -> `()' #}
instance (impl ~ IO ()) => Op (Sort ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> sort' browserPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (BrowserType ->  IO ())) => Op (SetType ()) BrowserBase orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (BrowserType)) => Op (GetType_ ()) BrowserBase orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

{# fun Fl_Browser_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> draw'' browserPtr
{#fun Fl_Browser_handle as browserHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) BrowserBase orig impl where
  runOp _ _ browser event = withRef browser (\p -> browserHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Browser_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) BrowserBase orig impl where
  runOp _ _ browser rectangle = withRef browser $ \browserPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' browserPtr x_pos y_pos w_pos h_pos
{# fun Fl_Browser_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> hide' browserPtr
{# fun Fl_Browser_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) BrowserBase orig impl where
  runOp _ _ browser = withRef browser $ \browserPtr -> show' browserPtr

{# fun Fl_Browser_handle_super as handleSuper' { id `Ptr ()', id `CInt'} -> `Int' #}
handleBrowserBase :: Ref BrowserBase -> Event -> IO (Either UnknownEvent ())
handleBrowserBase browser event = withRef browser (\p -> handleSuper' p (fromIntegral . fromEnum $ event)) >>= return . successOrUnknownEvent
{# fun Fl_Browser_draw_super as drawSuper' { id `Ptr ()' }  -> `()' #}
drawBrowserBase :: Ref BrowserBase -> IO ()
drawBrowserBase browser = withRef browser (\p -> drawSuper' p)
{# fun Fl_Browser_hide_super as hideSuper' { id `Ptr ()' }  -> `()' #}
hideBrowserBase :: Ref BrowserBase -> IO ()
hideBrowserBase browser = withRef browser (\p -> hideSuper' p)
{# fun Fl_Browser_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeBrowserBase :: Ref BrowserBase -> Rectangle -> IO ()
resizeBrowserBase browser rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef browser $ \browserPtr -> resizeSuper' browserPtr x_pos y_pos width height


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Browser"
-- @

-- $functions
-- @
-- add :: 'Ref' 'BrowserBase' -> 'T.Text' -> 'IO' ()
--
-- clear :: 'Ref' 'BrowserBase' -> 'IO' ()
--
-- deselect :: 'Ref' 'BrowserBase' -> 'IO' ('Either' 'NoChange' ())
--
-- deselectAndCallback :: 'Ref' 'BrowserBase' -> 'IO' ('Either' 'NoChange' ())
--
-- destroy :: 'Ref' 'BrowserBase' -> 'IO' ()
--
-- displayed :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ('Bool')
--
-- draw :: 'Ref' 'BrowserBase' -> 'IO' ()
--
-- getColumnChar :: 'Ref' 'BrowserBase' -> 'IO' ('Char')
--
-- getColumnWidths :: 'Ref' 'BrowserBase' -> 'IO' ['Int']
--
-- getFormatChar :: 'Ref' 'BrowserBase' -> 'IO' ('Char')
--
-- getHasScrollbar :: 'Ref' 'BrowserBase' -> 'IO' ('ScrollbarMode')
--
-- getHposition :: 'Ref' 'BrowserBase' -> 'IO' ('PixelPosition')
--
-- getIcon :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ('Maybe' ('Ref' 'Image'))
--
-- getPosition :: 'Ref' 'BrowserBase' -> 'IO' ('PixelPosition')
--
-- getScrollbarSize :: 'Ref' 'BrowserBase' -> 'IO' ('Int')
--
-- getScrollbarWidth :: 'Ref' 'BrowserBase' -> 'IO' ('Int')
--
-- getSize :: 'Ref' 'BrowserBase' -> 'IO' ('Int')
--
-- getText :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' 'T.Text'
--
-- getTextcolor :: 'Ref' 'BrowserBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'BrowserBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'BrowserBase' -> 'IO' ('FontSize')
--
-- getTopline :: 'Ref' 'BrowserBase' -> 'IO' ('LineNumber')
--
-- getType_ :: 'Ref' 'BrowserBase' -> 'IO' ('BrowserType')
--
-- getValue :: 'Ref' 'BrowserBase' -> 'IO' ('LineNumber')
--
-- handle :: 'Ref' 'BrowserBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'BrowserBase' -> 'IO' ()
--
-- hideLine :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- insert :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'T.Text' -> 'IO' ()
--
-- lineposition :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'LinePosition' -> 'IO' ()
--
-- load :: 'Ref' 'BrowserBase' -> 'T.Text' -> 'IO' ('Either' 'UnknownError' ())
--
-- makeVisible :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- move :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'LineNumber' -> 'IO' ()
--
-- remove :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- removeIcon :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- resize :: 'Ref' 'BrowserBase' -> 'Rectangle' -> 'IO' ()
--
-- select :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'Bool' -> 'IO' ('Either' 'NoChange' ())
--
-- selected :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ('Bool')
--
-- setBottomline :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- setColumnChar :: 'Ref' 'BrowserBase' -> 'Char' -> 'IO' ()
--
-- setColumnWidths :: 'Ref' 'BrowserBase' -> ['Int'] -> 'IO' ()
--
-- setFormatChar :: 'Ref' 'BrowserBase' -> 'Char' -> 'IO' ()
--
-- setHasScrollbar :: 'Ref' 'BrowserBase' -> 'ScrollbarMode' -> 'IO' ()
--
-- setHposition :: 'Ref' 'BrowserBase' -> 'PixelPosition' -> 'IO' ()
--
-- setIcon :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'Ref' 'Image' -> 'IO' ()
--
-- setMiddleline :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- setPosition :: 'Ref' 'BrowserBase' -> 'PixelPosition' -> 'IO' ()
--
-- setScrollbarColor :: 'Ref' 'BrowserBase' -> 'Color' -> 'IO' ()
--
-- setScrollbarSelectionColor :: 'Ref' 'BrowserBase' -> 'Color' -> 'IO' ()
--
-- setScrollbarSize :: 'Ref' 'BrowserBase' -> 'Int' -> 'IO' ()
--
-- setScrollbarWidth :: 'Ref' 'BrowserBase' -> 'Int' -> 'IO' ()
--
-- setSize :: 'Ref' 'BrowserBase' -> 'Size' -> 'IO' ()
--
-- setText :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'T.Text' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'BrowserBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'BrowserBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'BrowserBase' -> 'FontSize' -> 'IO' ()
--
-- setTopline :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- setType :: 'Ref' 'BrowserBase' -> 'BrowserType' -> 'IO' ()
--
-- setValue :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- showWidget :: 'Ref' 'BrowserBase' -> 'IO' ()
--
-- showWidgetLine :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ()
--
-- sort :: 'Ref' 'BrowserBase' -> 'IO' ()
--
-- sortWithSortType :: 'Ref' 'BrowserBase' -> 'SortType' -> 'IO' ()
--
-- swap :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'LineNumber' -> 'IO' ()
--
-- visible :: 'Ref' 'BrowserBase' -> 'LineNumber' -> 'IO' ('Bool')
-- @
