{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables, UndecidableInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Base.TextDisplay
       (
         mkStyleTableEntriesPtr,
         toStyleTableEntries,
         indexStyleTableEntries,
         textDisplayNew,
         textDisplayCustom
  , drawTextDisplayBase
  , handleTextDisplayBase
  , resizeTextDisplayBase
  , hideTextDisplayBase
  , showWidgetTextDisplayBase
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
import Graphics.UI.FLTK.LowLevel.Base.Widget
import qualified Foreign.Concurrent as FC
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
import qualified Foreign.ForeignPtr.Unsafe as Unsafe

mkStyleTableEntriesPtr :: (Parent a TextDisplayBase) => Ref a -> [StyleTableEntry] -> IO (ForeignPtr [StyleTableEntry])
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

toStyleTableEntries :: Int -> Ptr () -> IO (Maybe [StyleTableEntry])
toStyleTableEntries len ptr = do
  entries <- mapM toStyleTableEntry [0 .. (len - 1)]
  return (sequence entries)
  where
    toStyleTableEntry :: Int  -> IO (Maybe StyleTableEntry)
    toStyleTableEntry idx =
      let entryPtr = ptr `plusPtr` (idx * {#sizeof Style_Table_Entry#}) in
      if (entryPtr == nullPtr)
       then return Nothing
       else do
       color <- {#get Style_Table_Entry->color #} entryPtr
       font <- {#get Style_Table_Entry->font #} entryPtr
       fontSize <- {#get Style_Table_Entry->size #} entryPtr
       return
        (Just
           (
             StyleTableEntry
               (if (color == 0) then Nothing else Just (Color (fromIntegral color)))
               (if (font == 0) then Nothing else Just (Font (fromIntegral font)))
               (if (fontSize == 0) then Nothing else Just (FontSize (fromIntegral fontSize)))
           )
        )

indexStyleTableEntries :: [StyleTableEntry] -> [(Char, StyleTableEntry)]
indexStyleTableEntries = zip ['A'..]

{# fun Fl_OverriddenText_Display_New_WithLabel as overriddenWidgetNewWithLabel' { `Int',`Int',`Int',`Int', `CString', id `Ptr ()'} -> `Ptr ()' id #}
{# fun Fl_OverriddenText_Display_New as overriddenWidgetNew' { `Int',`Int',`Int',`Int', id `Ptr ()'} -> `Ptr ()' id #}
textDisplayCustom ::
       Rectangle                         -- ^ The bounds of this TextDisplay
    -> Maybe T.Text                      -- ^ The TextDisplay label
    -> Maybe (Ref TextDisplay -> IO ())           -- ^ Optional custom drawing function
    -> Maybe (CustomWidgetFuncs TextDisplay)      -- ^ Optional custom widget functions
    -> IO (Ref TextDisplay)
textDisplayCustom rectangle l' draw' funcs' =
  widgetMaker
    rectangle
    l'
    draw'
    funcs'
    overriddenWidgetNew'
    overriddenWidgetNewWithLabel'

{# fun Fl_Text_Display_New as textDisplayNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Text_Display_New_WithLabel as textDisplayNewWithLabel' { `Int',`Int',`Int',`Int',`CString'} -> `Ptr ()' id #}
textDisplayNew :: Rectangle -> Maybe T.Text -> IO (Ref TextDisplay)
textDisplayNew rectangle l' =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in do
     r <- case l' of
           Nothing -> textDisplayNew' x_pos y_pos width height >>= toRef
           Just l -> copyTextToCString l >>= \l' -> textDisplayNewWithLabel' x_pos y_pos width height l' >>= toRef
     setFlag r WidgetFlagCopiedLabel
     setFlag r WidgetFlagCopiedTooltip
     return r

{# fun Fl_Text_Display_Destroy as textDisplayDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) TextDisplayBase orig impl where
  runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textDisplayDestroy' text_displayPtr
{# fun Fl_Text_Display_set_buffer as setBuffer' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a TextBuffer, impl ~ (Maybe ( Ref a ) ->  IO ())) => Op (SetBuffer ()) TextDisplayBase orig impl where
   runOp _ _ text_display buf = withRef text_display $ \text_displayPtr -> withMaybeRef buf $ \bufPtr -> setBuffer' text_displayPtr bufPtr
{# fun Fl_Text_Display_buffer as buffer' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ ( IO (Maybe (Ref TextBuffer)))) => Op (GetBuffer ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> buffer' text_displayPtr >>= toMaybeRef
{# fun Fl_Text_Display_redisplay_range as redisplayRange' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (IndexRange -> IO ())) => Op (RedisplayRange ()) TextDisplayBase orig impl where
  runOp _ _ text_display (IndexRange (AtIndex start') (AtIndex end')) = withRef text_display $ \text_displayPtr -> redisplayRange' text_displayPtr start' end'
{# fun Fl_Text_Display_scroll as scroll' { id `Ptr ()',`Int',`Int' } -> `()' #}
instance (impl ~ (LineNumber -> AtIndex ->  IO ())) => Op (Scroll ()) TextDisplayBase orig impl where
  runOp _ _ text_display (LineNumber toplinenum) (AtIndex  horizoffset) = withRef text_display $ \text_displayPtr -> scroll' text_displayPtr toplinenum horizoffset
{# fun Fl_Text_Display_overstrike as overstrike' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (Overstrike ()) TextDisplayBase orig impl where
   runOp _ _ text_display text = withRef text_display $ \text_displayPtr -> copyTextToCString text >>= overstrike' text_displayPtr
{# fun Fl_Text_Display_set_insert_position as setInsertPosition' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (AtIndex ->  IO ())) => Op (SetInsertPosition ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex newpos) = withRef text_display $ \text_displayPtr -> setInsertPosition' text_displayPtr newpos
{# fun Fl_Text_Display_insert_position as insertPosition' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO AtIndex)) => Op (GetInsertPosition ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> insertPosition' text_displayPtr >>= return . AtIndex
{# fun Fl_Text_Display_xy_to_position as xyToPosition' { id `Ptr ()',`Int',`Int',`Int'} -> `Int' #}
instance (impl ~ (Position -> Maybe PositionType -> IO AtIndex)) => Op (XyToPosition ()) TextDisplayBase orig impl where
  runOp _ _ text_display (Position (X x) (Y y)) mPosType =
    withRef text_display $ \text_displayPtr ->
    xyToPosition' text_displayPtr x y ((fromIntegral . fromEnum) posType) >>= return . AtIndex
      where
        posType = maybe CharacterPos id mPosType
{# fun Fl_Text_Display_position_to_xy as positionToXy' { id `Ptr ()',`Int', id `Ptr CInt', id `Ptr CInt'} -> `Int' #}
instance (impl ~ (AtIndex ->  IO (Either OutOfRange Position))) => Op (PositionToXy ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex pos)  =
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
instance (impl ~ (Position ->  IO (Bool))) => Op (InSelection ()) TextDisplayBase orig impl where
   runOp _ _ text_display (Position (X x_pos') (Y y_pos')) = withRef text_display $ \text_displayPtr -> inSelection' text_displayPtr x_pos' y_pos'
{# fun Fl_Text_Display_show_insert_position as showInsertPosition' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (ShowInsertPosition ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> showInsertPosition' text_displayPtr
{# fun Fl_Text_Display_move_right as moveRight' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveRight ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr ->
     moveRight' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_move_left as moveLeft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveLeft ()) TextDisplayBase orig impl where
   runOp _ _ text_display =
     withRef text_display $ \text_displayPtr ->
     moveLeft' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_move_up as moveUp' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveUp ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr ->
     moveUp' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_move_down as moveDown' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Either OutOfRange ()))) => Op (MoveDown ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr ->
     moveDown' text_displayPtr >>= \s -> successOrOutOfRange () (s == 0) return
{# fun Fl_Text_Display_count_lines as countLines' { id `Ptr ()',`Int',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (IndexRange -> Bool ->  IO (Int))) => Op (CountLines ()) TextDisplayBase orig impl where
  runOp _ _ text_display (IndexRange (AtIndex start') (AtIndex end')) start_pos_is_line_start =
    withRef text_display $ \text_displayPtr -> countLines' text_displayPtr start' end' start_pos_is_line_start
{# fun Fl_Text_Display_line_start as lineStart' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (AtIndex))) => Op (LineStart ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex pos) = withRef text_display $ \text_displayPtr -> lineStart' text_displayPtr pos >>= return . AtIndex
{# fun Fl_Text_Display_line_end as lineEnd' { id `Ptr ()',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (AtIndex -> Bool ->  IO (AtIndex))) => Op (LineEnd ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex startpos) startposislinestart = withRef text_display $ \text_displayPtr -> lineEnd' text_displayPtr startpos startposislinestart >>= return . AtIndex
{# fun Fl_Text_Display_skip_lines as skipLines' { id `Ptr ()',`Int',`Int', cFromBool `Bool' } -> `Int' #}
instance (impl ~ (AtIndex -> Int -> Bool ->  IO (AtIndex))) => Op (SkipLines ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex startpos) nlines startposislinestart = withRef text_display $ \text_displayPtr -> skipLines' text_displayPtr startpos nlines startposislinestart >>= return . AtIndex
{# fun Fl_Text_Display_rewind_lines as rewindLines' { id `Ptr ()',`Int',`Int' } -> `Int' #}
instance (impl ~ (AtIndex -> Int ->  IO (AtIndex))) => Op (RewindLines ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex startpos) nlines = withRef text_display $ \text_displayPtr -> rewindLines' text_displayPtr startpos nlines >>= return . AtIndex
{# fun Fl_Text_Display_next_word as nextWord' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (NextWord ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> nextWord' text_displayPtr
{# fun Fl_Text_Display_previous_word as previousWord' { id `Ptr ()' } -> `()' #}
instance (impl ~ ( IO ())) => Op (PreviousWord ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> previousWord' text_displayPtr
{# fun Fl_Text_Display_show_cursor_with_b as showCursorWithB' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (ShowCursor ()) TextDisplayBase orig impl where
   runOp _ _ text_display b = withRef text_display $ \text_displayPtr -> showCursorWithB' text_displayPtr b
{# fun Fl_Text_Display_set_cursor_style as cursorStyle' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (CursorType -> IO ())) => Op (SetCursorStyle ()) TextDisplayBase orig impl where
   runOp _ _ text_display ct = withRef text_display $ \text_displayPtr -> cursorStyle' text_displayPtr (fromEnum ct)
{# fun Fl_Text_Display_cursor_color as cursorColor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetCursorColor ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> cursorColor' text_displayPtr
{# fun Fl_Text_Display_set_cursor_color as setCursorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetCursorColor ()) TextDisplayBase orig impl where
   runOp _ _ text_display n = withRef text_display $ \text_displayPtr -> setCursorColor' text_displayPtr n
{# fun Fl_Text_Display_scrollbar_width as scrollbarWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Width))) => Op (GetScrollbarWidth ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> scrollbarWidth' text_displayPtr >>= return . Width
{# fun Fl_Text_Display_set_scrollbar_width as setScrollbarWidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Width ->  IO ())) => Op (SetScrollbarWidth ()) TextDisplayBase orig impl where
  runOp _ _ text_display (Width w) = withRef text_display $ \text_displayPtr -> setScrollbarWidth' text_displayPtr w
{# fun Fl_Text_Display_scrollbar_align as scrollbarAlign' { id `Ptr ()' } -> `AlignType' cToEnum #}
instance (impl ~ ( IO (AlignType))) => Op (GetScrollbarAlign ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> scrollbarAlign' text_displayPtr
{# fun Fl_Text_Display_set_scrollbar_align as setScrollbarAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' #}
instance (impl ~ (AlignType ->  IO ())) => Op (SetScrollbarAlign ()) TextDisplayBase orig impl where
   runOp _ _ text_display a = withRef text_display $ \text_displayPtr -> setScrollbarAlign' text_displayPtr a
{# fun Fl_Text_Display_word_start as wordStart' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (AtIndex))) => Op (WordStart ()) TextDisplayBase orig impl where
   runOp _ _ text_display (AtIndex pos) = withRef text_display $ \text_displayPtr -> wordStart' text_displayPtr pos >>= return . AtIndex
{# fun Fl_Text_Display_word_end as wordEnd' { id `Ptr ()',`Int' } -> `Int' #}
instance (impl ~ (AtIndex ->  IO (AtIndex))) => Op (WordEnd ()) TextDisplayBase orig impl where
   runOp _ _ text_display (AtIndex pos) = withRef text_display $ \text_displayPtr -> wordEnd' text_displayPtr pos >>= return . AtIndex
{# fun Fl_Text_Display_highlight_data as highlightData' { id `Ptr ()',id `Ptr ()',id `Ptr ()',`Int', id `CChar',id `FunPtr UnfinishedStyleCbPrim',id `Ptr ()' } -> `()' #}
instance (Parent a TextBuffer, impl ~ (Ref a -> [(Char, StyleTableEntry)] -> Maybe(Char,UnfinishedStyleCb) -> IO ())) => Op (HighlightData ()) TextDisplayBase orig impl where
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
instance (impl ~ (AtIndex -> Int -> LineNumber ->  IO TextDisplayStyle)) => Op (PositionStyle ()) TextDisplayBase orig impl where
  runOp _ _ text_display (AtIndex linestartpos) linelen (LineNumber lineindex) =
    withRef text_display $ \text_displayPtr ->
    positionStyle' text_displayPtr linestartpos linelen lineindex >>= return . TextDisplayStyle . fromIntegral
{# fun Fl_Text_Display_shortcut as shortcut' { id `Ptr ()' } -> `CInt' #}
instance (impl ~ ( IO (Maybe ShortcutKeySequence))) => Op (GetShortcut ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> shortcut' text_displayPtr >>= return . cIntToKeySequence
{# fun Fl_Text_Display_set_shortcut as setShortcut' { id `Ptr ()',id `CInt' } -> `()' #}
instance (impl ~ (ShortcutKeySequence ->  IO ())) => Op (SetShortcut ()) TextDisplayBase orig impl where
  runOp _ _ input (ShortcutKeySequence modifiers char) =
    withRef input $ \inputPtr -> setShortcut' inputPtr (keySequenceToCInt modifiers char)
{# fun Fl_Text_Display_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textfont' text_displayPtr
{# fun Fl_Text_Display_set_textfont as setTextfont' { id `Ptr ()', `CInt'} -> `()' #}
instance (impl ~ ( Font -> IO ())) => Op (SetTextfont ()) TextDisplayBase orig impl where
   runOp _ _ text_display font = withRef text_display $ \text_displayPtr -> setTextfont' text_displayPtr (cFromFont font)
{# fun Fl_Text_Display_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textsize' text_displayPtr >>= return . FontSize
{# fun Fl_Text_Display_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) TextDisplayBase orig impl where
   runOp _ _ text_display (FontSize s) = withRef text_display $ \text_displayPtr -> setTextsize' text_displayPtr s
{# fun Fl_Text_Display_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> textcolor' text_displayPtr
{# fun Fl_Text_Display_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) TextDisplayBase orig impl where
   runOp _ _ text_display n = withRef text_display $ \text_displayPtr -> setTextcolor' text_displayPtr n
{# fun Fl_Text_Display_x_to_col as xToCol' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (XToCol ()) TextDisplayBase orig impl where
   runOp _ _ text_display pixelPos = withRef text_display $ \text_displayPtr -> xToCol' text_displayPtr pixelPos
{# fun Fl_Text_Display_col_to_x as colToX' { id `Ptr ()',`Double' } -> `Double' #}
instance (impl ~ (Double ->  IO (Double))) => Op (ColToX ()) TextDisplayBase orig impl where
   runOp _ _ text_display col = withRef text_display $ \text_displayPtr -> colToX' text_displayPtr col
{# fun set_linenumber_width as setLinenumberWidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Width ->  IO ())) => Op (SetLinenumberWidth ()) TextDisplayBase orig impl where
  runOp _ _ text_display (Width width) = withRef text_display $ \text_displayPtr -> setLinenumberWidth' text_displayPtr width
{# fun linenumber_width as linenumberWidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ ( IO (Width))) => Op (GetLinenumberWidth ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberWidth' text_displayPtr >>= return . Width
{# fun set_linenumber_font as setLinenumberFont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetLinenumberFont ()) TextDisplayBase orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberFont' text_displayPtr val
{# fun linenumber_font as linenumberFont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetLinenumberFont ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberFont' text_displayPtr
{# fun set_linenumber_size as setLinenumberSize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetLinenumberSize ()) TextDisplayBase orig impl where
  runOp _ _ text_display (FontSize val) = withRef text_display $ \text_displayPtr -> setLinenumberSize' text_displayPtr val
{# fun linenumber_size as linenumberSize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetLinenumberSize ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberSize' text_displayPtr >>= return . FontSize
{# fun set_linenumber_fgcolor as setLinenumberFgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLinenumberFgcolor ()) TextDisplayBase orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberFgcolor' text_displayPtr val
{# fun linenumber_fgcolor as linenumberFgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetLinenumberFgcolor ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberFgcolor' text_displayPtr
{# fun set_linenumber_bgcolor as setLinenumberBgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLinenumberBgcolor ()) TextDisplayBase orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberBgcolor' text_displayPtr val
{# fun linenumber_bgcolor as linenumberBgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetLinenumberBgcolor ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberBgcolor' text_displayPtr
{# fun set_linenumber_align as setLinenumberAlign' { id `Ptr ()',cFromEnum `AlignType' } -> `()' #}
instance (impl ~ (AlignType ->  IO ())) => Op (SetLinenumberAlign ()) TextDisplayBase orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> setLinenumberAlign' text_displayPtr val
{# fun linenumber_align as linenumberAlign' { id `Ptr ()' } -> `AlignType' cToEnum #}
instance (impl ~ ( IO (AlignType))) => Op (GetLinenumberAlign ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberAlign' text_displayPtr
{# fun set_linenumber_format as setLinenumberFormat' { id `Ptr ()',`CString' } -> `()' #}
instance (impl ~ (T.Text ->  IO ())) => Op (SetLinenumberFormat ()) TextDisplayBase orig impl where
   runOp _ _ text_display val = withRef text_display $ \text_displayPtr -> copyTextToCString val >>= setLinenumberFormat' text_displayPtr
{# fun linenumber_format as linenumberFormat' { id `Ptr ()' } -> `CString' #}
instance (impl ~ ( IO T.Text)) => Op (GetLinenumberFormat ()) TextDisplayBase orig impl where
   runOp _ _ text_display = withRef text_display $ \text_displayPtr -> linenumberFormat' text_displayPtr >>= cStringToText
{# fun Fl_Text_Display_wrap_mode as wrapMode' { id `Ptr ()', `CInt', `CInt'} -> `()' #}
instance (impl ~ (WrapType -> IO ())) => Op (WrapMode ()) TextDisplayBase orig impl where
  runOp _ _ textDisplay wt =
    withRef textDisplay $ \textDisplayPtr ->
      (case wt of
        (WrapAtPixel (PixelPosition p')) -> wrapMode' textDisplayPtr ((fromIntegral . fromEnum) WrapAtPixelFl) (fromIntegral p')
        (WrapAtColumn (ColumnNumber c')) -> wrapMode' textDisplayPtr ((fromIntegral . fromEnum) WrapAtColumnFl) (fromIntegral c')
        WrapAtBounds -> wrapMode' textDisplayPtr ((fromIntegral . fromEnum) WrapAtBoundsFl) (fromIntegral (0 :: Int))
        WrapNone -> wrapMode' textDisplayPtr ((fromIntegral . fromEnum) WrapNoneFl) (fromIntegral (0 :: Int))
      )

{# fun Fl_Text_Display_draw_super as drawSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
drawTextDisplayBase ::  Ref TextDisplayBase -> IO ()
drawTextDisplayBase textDisplay = withRef textDisplay $ \textDisplayPtr -> drawSuper' textDisplayPtr
{# fun Fl_Text_Display_handle_super as handleSuper' { id `Ptr ()',`Int' } -> `Int' #}
handleTextDisplayBase :: Ref TextDisplayBase -> Event ->  IO (Either UnknownEvent ())
handleTextDisplayBase textDisplay event = withRef textDisplay $ \textDisplayPtr -> handleSuper' textDisplayPtr (fromIntegral (fromEnum event)) >>= return . successOrUnknownEvent
{# fun Fl_Text_Display_resize_super as resizeSuper' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
resizeTextDisplayBase :: Ref TextDisplayBase -> Rectangle -> IO ()
resizeTextDisplayBase textDisplay rectangle =
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in withRef textDisplay $ \textDisplayPtr -> resizeSuper' textDisplayPtr x_pos y_pos width height
{# fun Fl_Text_Display_hide_super as hideSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
hideTextDisplayBase ::  Ref TextDisplayBase -> IO ()
hideTextDisplayBase textDisplay = withRef textDisplay $ \textDisplayPtr -> hideSuper' textDisplayPtr
{# fun Fl_Text_Display_show_super as showSuper' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
showWidgetTextDisplayBase ::  Ref TextDisplayBase -> IO ()
showWidgetTextDisplayBase textDisplay = withRef textDisplay $ \textDisplayPtr -> showSuper' textDisplayPtr

{# fun Fl_Text_Display_hide as hide' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Hide ()) TextDisplayBase orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> hide' textDisplayPtr
{# fun Fl_Text_Display_resize as resize' { id `Ptr ()',`Int',`Int',`Int',`Int' } -> `()' supressWarningAboutRes #}
instance (impl ~ (Rectangle -> IO ())) => Op (Resize ()) TextDisplayBase orig impl where
  runOp _ _ textDisplay rectangle = withRef textDisplay $ \textDisplayPtr -> do
                                 let (x_pos,y_pos,w_pos,h_pos) = fromRectangle rectangle
                                 resize' textDisplayPtr x_pos y_pos w_pos h_pos
{#fun Fl_Text_Display_handle as textDisplayHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) TextDisplayBase orig impl where
  runOp _ _ textDisplay event = withRef textDisplay (\p -> textDisplayHandle' p (fromIntegral . fromEnum $ event)) >>= return  . successOrUnknownEvent
{# fun Fl_Text_Display_show as show' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (ShowWidget ()) TextDisplayBase orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> show' textDisplayPtr
{# fun Fl_Text_Display_draw as draw'' { id `Ptr ()' } -> `()' #}
instance (impl ~ (  IO ())) => Op (Draw ()) TextDisplayBase orig impl where
  runOp _ _ textDisplay = withRef textDisplay $ \textDisplayPtr -> draw'' textDisplayPtr


-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Base.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.Group"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Base.TextDisplay"
-- @

-- $functions
-- @
-- colToX :: 'Ref' 'TextDisplayBase' -> 'Double' -> 'IO' ('Double')
--
-- countLines :: 'Ref' 'TextDisplayBase' -> 'IndexRange' -> 'Bool' -> 'IO' ('Int')
--
-- destroy :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- draw :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- getBuffer :: 'Ref' 'TextDisplayBase' -> 'IO' ('Maybe' ('Ref' 'TextBuffer'))
--
-- getCursorColor :: 'Ref' 'TextDisplayBase' -> 'IO' ('Color')
--
-- getInsertPosition :: 'Ref' 'TextDisplayBase' -> 'IO' 'AtIndex'
--
-- getLinenumberAlign :: 'Ref' 'TextDisplayBase' -> 'IO' ('AlignType')
--
-- getLinenumberBgcolor :: 'Ref' 'TextDisplayBase' -> 'IO' ('Color')
--
-- getLinenumberFgcolor :: 'Ref' 'TextDisplayBase' -> 'IO' ('Color')
--
-- getLinenumberFont :: 'Ref' 'TextDisplayBase' -> 'IO' ('Font')
--
-- getLinenumberFormat :: 'Ref' 'TextDisplayBase' -> 'IO' 'T.Text'
--
-- getLinenumberSize :: 'Ref' 'TextDisplayBase' -> 'IO' ('FontSize')
--
-- getLinenumberWidth :: 'Ref' 'TextDisplayBase' -> 'IO' ('Width')
--
-- getScrollbarAlign :: 'Ref' 'TextDisplayBase' -> 'IO' ('AlignType')
--
-- getScrollbarWidth :: 'Ref' 'TextDisplayBase' -> 'IO' ('Width')
--
-- getShortcut :: 'Ref' 'TextDisplayBase' -> 'IO' ('Maybe' 'ShortcutKeySequence')
--
-- getTextcolor :: 'Ref' 'TextDisplayBase' -> 'IO' ('Color')
--
-- getTextfont :: 'Ref' 'TextDisplayBase' -> 'IO' ('Font')
--
-- getTextsize :: 'Ref' 'TextDisplayBase' -> 'IO' ('FontSize')
--
-- handle :: 'Ref' 'TextDisplayBase' -> 'Event' -> 'IO' ('Either' 'UnknownEvent' ())
--
-- hide :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- highlightData:: ('Parent' a 'TextBuffer') => 'Ref' 'TextDisplayBase' -> 'Ref' a -> [('Char', 'StyleTableEntry']) -> 'Maybe(Char,UnfinishedStyleCb') -> 'IO' ()
--
-- inSelection :: 'Ref' 'TextDisplayBase' -> 'Position' -> 'IO' ('Bool')
--
-- lineEnd :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'Bool' -> 'IO' ('AtIndex')
--
-- lineStart :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'IO' ('AtIndex')
--
-- moveDown :: 'Ref' 'TextDisplayBase' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveLeft :: 'Ref' 'TextDisplayBase' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveRight :: 'Ref' 'TextDisplayBase' -> 'IO' ('Either' 'OutOfRange' ())
--
-- moveUp :: 'Ref' 'TextDisplayBase' -> 'IO' ('Either' 'OutOfRange' ())
--
-- nextWord :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- overstrike :: 'Ref' 'TextDisplayBase' -> 'T.Text' -> 'IO' ()
--
-- positionStyle :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'Int' -> 'LineNumber' -> 'IO' 'TextDisplayStyle'
--
-- positionToXy :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'IO' ('Either' 'OutOfRange' 'Position')
--
-- previousWord :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- redisplayRange :: 'Ref' 'TextDisplayBase' -> 'IndexRange' -> 'IO' ()
--
-- resize :: 'Ref' 'TextDisplayBase' -> 'Rectangle' -> 'IO' ()
--
-- rewindLines :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'Int' -> 'IO' ('AtIndex')
--
-- scroll :: 'Ref' 'TextDisplayBase' -> 'LineNumber' -> 'AtIndex' -> 'IO' ()
--
-- setBuffer:: ('Parent' a 'TextBuffer') => 'Ref' 'TextDisplayBase' -> 'Maybe' ( 'Ref' a ) -> 'IO' ()
--
-- setCursorColor :: 'Ref' 'TextDisplayBase' -> 'Color' -> 'IO' ()
--
-- setCursorStyle :: 'Ref' 'TextDisplayBase' -> 'CursorType' -> 'IO' ()
--
-- setInsertPosition :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'IO' ()
--
-- setLinenumberAlign :: 'Ref' 'TextDisplayBase' -> 'AlignType' -> 'IO' ()
--
-- setLinenumberBgcolor :: 'Ref' 'TextDisplayBase' -> 'Color' -> 'IO' ()
--
-- setLinenumberFgcolor :: 'Ref' 'TextDisplayBase' -> 'Color' -> 'IO' ()
--
-- setLinenumberFont :: 'Ref' 'TextDisplayBase' -> 'Font' -> 'IO' ()
--
-- setLinenumberFormat :: 'Ref' 'TextDisplayBase' -> 'T.Text' -> 'IO' ()
--
-- setLinenumberSize :: 'Ref' 'TextDisplayBase' -> 'FontSize' -> 'IO' ()
--
-- setLinenumberWidth :: 'Ref' 'TextDisplayBase' -> 'Width' -> 'IO' ()
--
-- setScrollbarAlign :: 'Ref' 'TextDisplayBase' -> 'AlignType' -> 'IO' ()
--
-- setScrollbarWidth :: 'Ref' 'TextDisplayBase' -> 'Width' -> 'IO' ()
--
-- setShortcut :: 'Ref' 'TextDisplayBase' -> 'ShortcutKeySequence' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'TextDisplayBase' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'TextDisplayBase' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'TextDisplayBase' -> 'FontSize' -> 'IO' ()
--
-- showCursor :: 'Ref' 'TextDisplayBase' -> 'Bool' -> 'IO' ()
--
-- showInsertPosition :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- showWidget :: 'Ref' 'TextDisplayBase' -> 'IO' ()
--
-- skipLines :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'Int' -> 'Bool' -> 'IO' ('AtIndex')
--
-- wordEnd :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'IO' ('AtIndex')
--
-- wordStart :: 'Ref' 'TextDisplayBase' -> 'AtIndex' -> 'IO' ('AtIndex')
--
-- wrapMode :: 'Ref' 'TextDisplayBase' -> 'WrapType' -> 'IO' ()
--
-- xToCol :: 'Ref' 'TextDisplayBase' -> 'Double' -> 'IO' ('Double')
--
-- xyToPosition :: 'Ref' 'TextDisplayBase' -> 'Position' -> 'Maybe' 'PositionType' -> 'IO' 'AtIndex'
-- @
