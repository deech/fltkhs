{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.TextDisplay
       (
         mkStyleTableEntriesPtr,
         indexStyleTableEntries,
         textDisplayNew
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
#include "Fl_Text_DisplayC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import qualified Foreign.Concurrent as FC
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import qualified Foreign.ForeignPtr.Unsafe as Unsafe

mkStyleTableEntriesPtr :: (Parent a TextDisplay) => Ref a -> [StyleTableEntry] -> IO (ForeignPtr [StyleTableEntry])
mkStyleTableEntriesPtr td stes = do
  styleTableEntriesPtr <- mallocBytes ((length stes) * {#sizeof Style_Table_Entry #})
  mapM_
    (
      \(idx, (StyleTableEntry c f s)) -> do
        let currPtr = styleTableEntriesPtr `plusPtr` (idx * {#sizeof Style_Table_Entry #})
        {#set Style_Table_Entry->color #} currPtr $ maybe 0 (\(Color c') -> fromIntegral c') c
        {#set Style_Table_Entry->font  #} currPtr $ maybe 0 (\(Font f') -> fromIntegral f') f
        {#set Style_Table_Entry->size  #} currPtr $ maybe 0 (\(FontSize s') -> s') s
        {#set Style_Table_Entry->attr  #} currPtr 0
    )
    (zip [0..] stes)
  textDisplayAsPtr <- unsafeRefToPtr td
  let finalizerF = if (textDisplayAsPtr == nullPtr)
                   then free styleTableEntriesPtr
                   else return ()
  FC.newForeignPtr
   styleTableEntriesPtr
   finalizerF

indexStyleTableEntries :: [StyleTableEntry] -> [(Char, StyleTableEntry)]
indexStyleTableEntries = zip ['A'..]

{# fun Fl_Text_Display_New as textDisplayNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Text_Display_New_WithLabel as textDisplayNewWithLabel' { `Int',`Int',`Int',`Int',unsafeToCString `T.Text'} -> `Ptr ()' id #}
textDisplayNew :: Rectangle -> Maybe T.Text -> IO (Ref TextDisplay)
textDisplayNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> textDisplayNew' x_pos y_pos width height >>=
                             toRef
        Just l -> textDisplayNewWithLabel' x_pos y_pos width height l >>=
                             toRef

{# fun Fl_Text_Display_Destroy as textDisplayDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TextDisplay orig impl where
  runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textDisplayDestroy' text_displayPtr

{# fun Fl_Text_Display_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ ( Rectangle -> IO ())) => Op (Resize ()) TextDisplay orig impl where
  runOp _ _ text_display rectangle = withRef text_display $ \text_displayPtr -> do
    let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
    resize' text_displayPtr x_pos y_pos w_pos h_pos
{# fun Fl_Text_Display_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (Event ->  IO (Int))) => Op (Handle ()) TextDisplay orig impl where
   runOp _ _ text_display e = withRef text_display $ \text_displayPtr -> handle' text_displayPtr (fromEnum e)
{# fun Fl_Text_Display_set_buffer as setBuffer' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TextBuffer, impl ~ (Maybe ( Ref a ) ->  IO ())) => Op (SetBuffer ()) TextDisplay orig impl where
   runOp _ _ text_display buf = withRef text_display $ \text_displayPtr -> withMaybeRef buf $ \bufPtr -> setBuffer' text_displayPtr bufPtr
{# fun Fl_Text_Display_buffer as buffer' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TextBuffer)))) => Op (GetBuffer ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> buffer' text_displayPtr >>= toMaybeRef
{# fun Fl_Text_Display_redisplay_range as redisplayRange' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (BufferRange -> IO ())) => Op (RedisplayRange ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferRange (BufferOffset start') (BufferOffset end')) = withRef text_display $ \text_displayPtr -> redisplayRange' text_displayPtr start' end'
{# fun Fl_Text_Display_scroll as scroll' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (Int -> BufferOffset ->  IO ())) => Op (Scroll ()) TextDisplay orig impl where
  runOp _ _ text_display toplinenum (BufferOffset  horizoffset) = withRef text_display $ \text_displayPtr -> scroll' text_displayPtr toplinenum horizoffset
{# fun Fl_Text_Display_overstrike as overstrike' { id `Ptr ()',unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (Overstrike ()) TextDisplay orig impl where
   runOp _ _ text_display text = withRef text_display $ \text_displayPtr -> overstrike' text_displayPtr text
{# fun Fl_Text_Display_set_insert_position as setInsertPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (BufferOffset ->  IO ())) => Op (SetInsertPosition ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset newpos) = withRef text_display $ \text_displayPtr -> setInsertPosition' text_displayPtr newpos
{# fun Fl_Text_Display_insert_position as insertPosition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO BufferOffset)) => Op (GetInsertPosition ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> insertPosition' text_displayPtr >>= return . BufferOffset
{# fun Fl_Text_Display_position_to_xy as positionToXy' { id `Ptr ()',`Int', id `Ptr CInt', id `Ptr CInt'} -> `Int' #}
instance (impl ~ (BufferOffset ->  IO (Either OutOfRange Position))) => Op (PositionToXy ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset pos)  =
     withRef text_display $ \text_displayPtr ->
     alloca $ \xPtr ->
     alloca $ \yPtr -> do
     status' <- positionToXy' text_displayPtr pos xPtr yPtr
     successOrOutOfRange
       ((xPtr,yPtr))
       (status' == 0)
       (\(xp',yp') -> do
           x' <- peekIntConv xp'
           y' <- peekIntConv yp'
           return (Position (X x') (Y y'))
       )
{# fun Fl_Text_Display_in_selection as inSelection' { id `Ptr ()',`Int',`Int' } -> `Bool' cToBool #}
instance (impl ~ (Position ->  IO (Bool))) => Op (InSelection ()) TextDisplay orig impl where
   runOp _ _ text_display (Position (X x_pos') (Y y_pos')) = withRef text_display $ \text_displayPtr -> inSelection' text_displayPtr x_pos' y_pos'
{# fun Fl_Text_Display_show_insert_position as showInsertPosition' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (ShowInsertPosition ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> showInsertPosition' text_displayPtr
{# fun Fl_Text_Display_move_right as moveRight' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveRight ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr ->
     moveRight' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_move_left as moveLeft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveLeft ()) TextDisplay orig impl where
   runOp _ _ text_display =
     withRef text_display $ \text_displayPtr ->
     moveLeft' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_move_up as moveUp' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveUp ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr ->
     moveUp' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_move_down as moveDown' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveDown ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr ->
     moveDown' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_count_lines as countLines' { id `Ptr ()',`Int',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (BufferRange -> Bool ->  IO (Int))) => Op (CountLines ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferRange (BufferOffset start') (BufferOffset end')) start_pos_is_line_start =
    withRef text_display $ \text_displayPtr -> countLines' text_displayPtr start' end' start_pos_is_line_start
{# fun Fl_Text_Display_line_start as lineStart' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (BufferOffset ->  IO (BufferOffset))) => Op (LineStart ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset pos) = withRef text_display $ \text_displayPtr -> lineStart' text_displayPtr pos >>= return . BufferOffset
{# fun Fl_Text_Display_line_end as lineEnd' { id `Ptr ()',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (BufferOffset -> Bool ->  IO (BufferOffset))) => Op (LineEnd ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset startpos) startposislinestart = withRef text_display $ \text_displayPtr -> lineEnd' text_displayPtr startpos startposislinestart >>= return . BufferOffset
{# fun Fl_Text_Display_skip_lines as skipLines' { id `Ptr ()',`Int',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (BufferOffset -> Int -> Bool ->  IO (BufferOffset))) => Op (SkipLines ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset startpos) nlines startposislinestart = withRef text_display $ \text_displayPtr -> skipLines' text_displayPtr startpos nlines startposislinestart >>= return . BufferOffset
{# fun Fl_Text_Display_rewind_lines as rewindLines' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance (impl ~ (BufferOffset -> Int ->  IO (BufferOffset))) => Op (RewindLines ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset startpos) nlines = withRef text_display $ \text_displayPtr -> rewindLines' text_displayPtr startpos nlines >>= return . BufferOffset
{# fun Fl_Text_Display_next_word as nextWord' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (NextWord ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> nextWord' text_displayPtr
{# fun Fl_Text_Display_previous_word as previousWord' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (PreviousWord ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> previousWord' text_displayPtr
{# fun Fl_Text_Display_show_cursor_with_b as showCursorWithB' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (ShowCursor ()) TextDisplay orig impl where
   runOp _ _ text_display b = withRef text_display $ \text_displayPtr -> showCursorWithB' text_displayPtr b
{# fun Fl_Text_Display_set_cursor_style as cursorStyle' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (CursorType -> IO ())) => Op (SetCursorStyle ()) TextDisplay orig impl where
   runOp _ _ text_display ct = withRef text_display $ \text_displayPtr -> cursorStyle' text_displayPtr (fromEnum ct)
{# fun Fl_Text_Display_cursor_color as cursorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetCursorColor ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> cursorColor' text_displayPtr
{# fun Fl_Text_Display_set_cursor_color as setCursorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetCursorColor ()) TextDisplay orig impl where
   runOp _ _ text_display n = withRef text_display $ \text_displayPtr -> setCursorColor' text_displayPtr n
{# fun Fl_Text_Display_scrollbar_width as scrollbarWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Width))) => Op (GetScrollbarWidth ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> scrollbarWidth' text_displayPtr >>= return . Width
{# fun Fl_Text_Display_set_scrollbar_width as setScrollbarWidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Width ->  IO ())) => Op (SetScrollbarWidth ()) TextDisplay orig impl where
  runOp _ _ text_display (Width w) = withRef text_display $ \text_displayPtr -> setScrollbarWidth' text_displayPtr w
{# fun Fl_Text_Display_scrollbar_align as scrollbarAlign' { id `Ptr ()' } -> `AlignType' cToEnum #}
instance (impl ~ ( IO (AlignType))) => Op (GetScrollbarAlign ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> scrollbarAlign' text_displayPtr
{# fun Fl_Text_Display_set_scrollbar_align as setScrollbarAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' #}
instance (impl ~ (AlignType ->  IO ())) => Op (SetScrollbarAlign ()) TextDisplay orig impl where
   runOp _ _ text_display a = withRef text_display $ \text_displayPtr -> setScrollbarAlign' text_displayPtr a
{# fun Fl_Text_Display_word_start as wordStart' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (BufferOffset ->  IO (BufferOffset))) => Op (WordStart ()) TextDisplay orig impl where
   runOp _ _ text_display (BufferOffset pos) = withRef text_display $ \text_displayPtr -> wordStart' text_displayPtr pos >>= return . BufferOffset
{# fun Fl_Text_Display_word_end as wordEnd' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (BufferOffset ->  IO (BufferOffset))) => Op (WordEnd ()) TextDisplay orig impl where
   runOp _ _ text_display (BufferOffset pos) = withRef text_display $ \text_displayPtr -> wordEnd' text_displayPtr pos >>= return . BufferOffset
{# fun Fl_Text_Display_highlight_data as highlightData' { id `Ptr ()',id `Ptr ()',id `Ptr ()',`Int', id `CChar',id `FunPtr UnfinishedStyleCbPrim',id `Ptr ()' } -> `()' #}
instance (Parent a TextBuffer, impl ~ (Ref a -> [(Char, StyleTableEntry)] -> Maybe(Char,UnfinishedStyleCb) -> IO ())) => Op (HighlightData ()) TextDisplay orig impl where
   runOp _ _ text_display style_buffer indexedStyleTable cb =
     withRef text_display $ \text_displayPtr ->
     withRef style_buffer $ \style_bufferPtr -> do
       stesPtr <- mkStyleTableEntriesPtr text_display (map snd indexedStyleTable)
       (indexChar, fPtr) <- case cb of
         (Just (indexChar', unfinishedhighlightcb)) -> do
           fPtr' <- toUnfinishedStyleCbPrim unfinishedhighlightcb
           return ((fromEnum indexChar'), fPtr')
         Nothing -> return (0, nullFunPtr)
       highlightData' text_displayPtr style_bufferPtr (castPtr $ Unsafe.unsafeForeignPtrToPtr $ stesPtr) (length indexedStyleTable) (fromIntegral indexChar) fPtr nullPtr
{# fun Fl_Text_Display_position_style as positionStyle' { id `Ptr ()',`Int',`Int',`Int' } -> `Int' #}
instance (impl ~ (BufferOffset -> Int -> Int ->  IO TextDisplayStyle)) => Op (PositionStyle ()) TextDisplay orig impl where
  runOp _ _ text_display (BufferOffset linestartpos) linelen lineindex =
    withRef text_display $ \text_displayPtr ->
    positionStyle' text_displayPtr linestartpos linelen lineindex >>= return . TextDisplayStyle . fromIntegral
{# fun Fl_Text_Display_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ ( IO (Maybe ShortcutKeySequence))) => Op (GetShortcut ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> shortcut' text_displayPtr >>= return . cIntToKeySequence
{# fun Fl_Text_Display_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) TextDisplay orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)
{# fun Fl_Text_Display_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textfont' text_displayPtr
{# fun Fl_Text_Display_set_textfont as setTextfont' { id `Ptr ()', `CInt'} -> `()' #}
instance (impl ~ ( Font -> IO ())) => Op (SetTextfont ()) TextDisplay orig impl where
   runOp _ _ text_display font = withRef text_display $ \text_displayPtr -> setTextfont' text_displayPtr (cFromFont font)
{# fun Fl_Text_Display_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textsize' text_displayPtr >>= return . FontSize
{# fun Fl_Text_Display_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) TextDisplay orig impl where
   runOp _ _ text_display (FontSize s) = withRef text_display $ \text_displayPtr -> setTextsize' text_displayPtr s
{# fun Fl_Text_Display_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textcolor' text_displayPtr
{# fun Fl_Text_Display_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) TextDisplay orig impl where
   runOp _ _ text_display n = withRef text_display $ \text_displayPtr -> setTextcolor' text_displayPtr n
{# fun Fl_Text_Display_x_to_col as xToCol' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (XToCol ()) TextDisplay orig impl where
   runOp _ _ text_display pixelPos = withRef text_display $ \text_displayPtr -> xToCol' text_displayPtr pixelPos
{# fun Fl_Text_Display_col_to_x as colToX' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (ColToX ()) TextDisplay orig impl where
   runOp _ _ text_display col = withRef text_display $ \text_displayPtr -> colToX' text_displayPtr col
{# fun set_linenumber_width as setLinenumberWidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Width ->  IO ())) => Op (SetLinenumberWidth ()) TextDisplay orig impl where
  runOp _ _ text_display (Width width) = withRef text_display $ \text_displayPtr -> setLinenumberWidth' text_displayPtr width
{# fun linenumber_width as linenumberWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Width))) => Op (GetLinenumberWidth ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberWidth' text_displayPtr >>= return . Width
{# fun set_linenumber_font as setLinenumberFont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetLinenumberFont ()) TextDisplay orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberFont' text_displayPtr val
{# fun linenumber_font as linenumberFont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetLinenumberFont ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberFont' text_displayPtr
{# fun set_linenumber_size as setLinenumberSize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetLinenumberSize ()) TextDisplay orig impl where
  runOp _ _ text_display (FontSize val) = withRef text_display $ \text_displayPtr -> setLinenumberSize' text_displayPtr val
{# fun linenumber_size as linenumberSize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetLinenumberSize ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberSize' text_displayPtr >>= return . FontSize
{# fun set_linenumber_fgcolor as setLinenumberFgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLinenumberFgcolor ()) TextDisplay orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberFgcolor' text_displayPtr val
{# fun linenumber_fgcolor as linenumberFgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetLinenumberFgcolor ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberFgcolor' text_displayPtr
{# fun set_linenumber_bgcolor as setLinenumberBgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLinenumberBgcolor ()) TextDisplay orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberBgcolor' text_displayPtr val
{# fun linenumber_bgcolor as linenumberBgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetLinenumberBgcolor ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberBgcolor' text_displayPtr
{# fun set_linenumber_align as setLinenumberAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' #}
instance (impl ~ (AlignType ->  IO ())) => Op (SetLinenumberAlign ()) TextDisplay orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberAlign' text_displayPtr val
{# fun linenumber_align as linenumberAlign' { id `Ptr ()' } -> `AlignType' cToEnum #}
instance (impl ~ ( IO (AlignType))) => Op (GetLinenumberAlign ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberAlign' text_displayPtr
{# fun set_linenumber_format as setLinenumberFormat' { id `Ptr ()',unsafeToCString `T.Text' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetLinenumberFormat ()) TextDisplay orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberFormat' text_displayPtr val
{# fun linenumber_format as linenumberFormat' { id `Ptr ()' } -> `T.Text' unsafeFromCString #}
instance (impl ~ ( IO T.Text)) => Op (GetLinenumberFormat ()) TextDisplay orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberFormat' text_displayPtr

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.TextDisplay"
-- @

-- $functions
-- @
-- colToX :: 'Ref' 'TextDisplay' -> 'Double' -> 'IO' ('Double')
--
-- countLines :: 'Ref' 'TextDisplay' -> 'BufferRange' -> 'Bool' -> 'IO' ('Int')
--
-- destroy :: 'Ref' 'TextDisplay' -> 'IO' ()
--
-- getBuffer :: 'Ref' 'TextDisplay' -> 'IO' ('Maybe' ('Ref' 'TextBuffer'))
--
-- getCursorColor :: 'Ref' 'TextDisplay' -> 'IO' ('Color')
--
-- getInsertPosition :: 'Ref' 'TextDisplay' -> 'IO' 'BufferOffset'
--
-- getLinenumberAlign :: 'Ref' 'TextDisplay' -> 'IO' ('AlignType')
--
-- getLinenumberBgcolor :: 'Ref' 'TextDisplay' -> 'IO' ('Color')
--
-- getLinenumberFgcolor :: 'Ref' 'TextDisplay' -> 'IO' ('Color')
--
-- getLinenumberFont :: 'Ref' 'TextDisplay' -> 'IO' ('Font')
--
-- getLinenumberFormat :: 'Ref' 'TextDisplay' -> 'IO' 'T.Text'
--
-- getLinenumberSize :: 'Ref' 'TextDisplay' -> 'IO' ('FontSize')
--
-- getLinenumberWidth :: 'Ref' 'TextDisplay' -> 'IO' ('Width')
--
-- getScrollbarAlign :: 'Ref' 'TextDisplay' -> 'IO' ('AlignType')
--
-- getScrollbarWidth :: 'Ref' 'TextDisplay' -> 'IO' ('Width')
--
-- getShortcut :: 'Ref' 'TextDisplay' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getTextcolor :: 'Ref' 'TextDisplay' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'TextDisplay' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'TextDisplay' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'TextDisplay' -> 'Event' -> 'IO' ('Int')
--
-- highlightData:: ('Parent' a 'TextBuffer') => 'Ref' 'TextDisplay' -> 'Ref' a -> [('Char', 'StyleTableEntry']) -> 'Maybe(Char,UnfinishedStyleCb') -> 'IO' ()
--
-- inSelection :: 'Ref' 'TextDisplay' -> 'Position' -> 'IO' ('Bool')
--
-- lineEnd :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'Bool' -> 'IO' ('BufferOffset')
--
-- lineStart :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'IO' ('BufferOffset')
--
-- moveDown :: 'Ref' 'TextDisplay' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveLeft :: 'Ref' 'TextDisplay' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveRight :: 'Ref' 'TextDisplay' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveUp :: 'Ref' 'TextDisplay' -> 'IO' ('Either' 'OutOfRange' ())
--
-- nextWord :: 'Ref' 'TextDisplay' -> 'IO' ()
--
-- overstrike :: 'Ref' 'TextDisplay' -> 'T.Text' -> 'IO' ()
--
-- positionStyle :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'Int' -> 'Int' -> 'IO' 'TextDisplayStyle'
--
-- positionToXy :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'IO' ('Either' 'OutOfRange' 'Position')
--
-- previousWord :: 'Ref' 'TextDisplay' -> 'IO' ()
--
-- redisplayRange :: 'Ref' 'TextDisplay' -> 'BufferRange' -> 'IO' ()
--
-- resize :: 'Ref' 'TextDisplay' -> 'Rectangle' -> 'IO' ()
--
-- rewindLines :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'Int' -> 'IO' ('BufferOffset')
--
-- scroll :: 'Ref' 'TextDisplay' -> 'Int' -> 'BufferOffset' -> 'IO' ()
--
-- setBuffer:: ('Parent' a 'TextBuffer') => 'Ref' 'TextDisplay' -> 'Maybe' ( 'Ref' a ) -> 'IO' ()
--
-- setCursorColor :: 'Ref' 'TextDisplay' -> 'Color' -> 'IO' ()
--
-- setCursorStyle :: 'Ref' 'TextDisplay' -> 'CursorType' -> 'IO' ()
--
-- setInsertPosition :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'IO' ()
--
-- setLinenumberAlign :: 'Ref' 'TextDisplay' -> 'AlignType' -> 'IO' ()
--
-- setLinenumberBgcolor :: 'Ref' 'TextDisplay' -> 'Color' -> 'IO' ()
--
-- setLinenumberFgcolor :: 'Ref' 'TextDisplay' -> 'Color' -> 'IO' ()
--
-- setLinenumberFont :: 'Ref' 'TextDisplay' -> 'Font' -> 'IO' ()
--
-- setLinenumberFormat :: 'Ref' 'TextDisplay' -> 'T.Text' -> 'IO' ()
--
-- setLinenumberSize :: 'Ref' 'TextDisplay' -> 'FontSize' -> 'IO' ()
--
-- setLinenumberWidth :: 'Ref' 'TextDisplay' -> 'Width' -> 'IO' ()
--
-- setScrollbarAlign :: 'Ref' 'TextDisplay' -> 'AlignType' -> 'IO' ()
--
-- setScrollbarWidth :: 'Ref' 'TextDisplay' -> 'Width' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'TextDisplay' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'TextDisplay' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'TextDisplay' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'TextDisplay' -> 'FontSize' -> 'IO' ()
--
-- showCursor :: 'Ref' 'TextDisplay' -> 'Bool' -> 'IO' ()
--
-- showInsertPosition :: 'Ref' 'TextDisplay' -> 'IO' ()
--
-- skipLines :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'Int' -> 'Bool' -> 'IO' ('BufferOffset')
--
-- wordEnd :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'IO' ('BufferOffset')
--
-- wordStart :: 'Ref' 'TextDisplay' -> 'BufferOffset' -> 'IO' ('BufferOffset')
--
-- xToCol :: 'Ref' 'TextDisplay' -> 'Double' -> 'IO' ('Double')
-- @
