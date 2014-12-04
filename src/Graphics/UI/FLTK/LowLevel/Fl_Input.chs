{-# LANGUAGE CPP #-}
module Graphics.UI.FLTK.LowLevel.Fl_Input
    (
     -- * Constructor
     inputNew,
     inputDestroy,
     -- * Fl_Input specific
     inputParent,
     inputSetParent,
     inputType_,
     inputSetType,
     inputDrawLabel,
     inputX,
     inputY,
     inputW,
     inputH,
     inputSetAlign,
     inputAlign,
     inputBox,
     inputSetBox,
     inputColor,
     inputSetColor,
     inputSetColorWithBgSel,
     inputSelectionColor,
     inputSetSelectionColor,
     inputLabel,
     inputCopyLabel,
     inputSetLabel,
     inputLabeltype,
     inputSetLabeltype,
     inputLabelcolor,
     inputSetLabelcolor,
     inputLabelfont,
     inputSetLabelfont,
     inputLabelsize,
     inputSetLabelsize,
     inputImage,
     inputSetImage,
     inputDeimage,
     inputSetDeimage,
     inputTooltip,
     inputCopyTooltip,
     inputSetTooltip,
     inputWhen,
     inputSetWhen,
     inputVisible,
     inputVisibleR,
     inputShowSuper,
     inputShow,
     inputHideSuper,
     inputHide,
     inputSetVisible,
     inputClearVisible,
     inputActive,
     inputActiveR,
     inputActivate,
     inputDeactivate,
     inputOutput,
     inputSetOutput,
     inputClearOutput,
     inputTakesevents,
     inputSetChanged,
     inputClearChanged,
     inputTakeFocus,
     inputSetVisibleFocus,
     inputClearVisibleFocus,
     inputModifyVisibleFocus,
     inputVisibleFocus,
     inputContains,
     inputInside,
     inputRedraw,
     inputRedrawLabel,
     inputDamage,
     inputClearDamageWithBitmask,
     inputClearDamage,
     inputDamageWithText,
     inputMeasureLabel,
     inputWindow,
     inputTopWindow,
     inputTopWindowOffset,
     inputAsGlWindowSuper,
     inputAsGlWindow,
     inputResizeSuper,
     inputResize,
     inputSetCallback,
     inputDrawBox,
     inputDrawBoxWithBoxtype,
     inputDrawBackdrop,
     inputDrawFocus,
     inputValue,
     inputSetValue,
     inputHandle,
     inputStaticValue,
     inputIndex,
     inputSetSize,
     inputMaximumSize,
     inputSize,
     inputSetMaximumSize,
     inputPosition,
     inputMark,
     inputSetPosition,
     inputSetMark,
     inputReplace,
     inputCut,
     inputCutFromCursor,
     inputCutRange,
     inputInsert,
     inputInsertWithLength,
     inputCopy,
     inputUndo,
     inputCopyCuts,
     inputShortcut,
     inputSetShortcut,
     inputTextfont,
     inputSetTextfont,
     inputTextsize,
     inputSetTextsize,
     inputTextcolor,
     inputSetTextcolor,
     inputCursorColor,
     inputSetCursorColor,
     inputInputType,
     inputSetInputType,
     inputReadonly,
     inputSetReadonly,
     inputWrap,
     inputSetWrap,
     inputTabNav,
     inputSetTabNav,
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_InputC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Fl_Widget
import Graphics.UI.FLTK.LowLevel.Utils

{# fun Fl_Input_New as inputNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Input_New_WithLabel as inputNewWithLabel' { `Int',`Int',`Int',`Int',`String'} -> `Ptr ()' id #}
inputNew :: Rectangle -> Maybe String -> IO (Input ())
inputNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> inputNew' x_pos y_pos width height >>=
                             toObject
        Just l -> inputNewWithLabel' x_pos y_pos width height l >>=
                               toObject

{# fun Fl_Input_Destroy as inputDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
inputDestroy :: Input a -> IO ()
inputDestroy win = swapObject win $ \winPtr -> do
                                        inputDestroy' winPtr
                                        return nullPtr

inputParent :: Input a -> IO (Group ())
inputParent = widgetParent
inputSetParent :: Input a -> Group b -> IO ()
inputSetParent = widgetSetParent
inputType_ :: Input a  ->  IO (Word8)
inputType_ = widgetType_
inputSetType :: Input a  -> Word8 ->  IO (())
inputSetType = widgetSetType
inputDrawLabel :: Input a  -> Maybe (Rectangle,AlignType)->  IO (())
inputDrawLabel = widgetDrawLabel
inputX :: Input a  ->  IO (Int)
inputX = widgetX
inputY :: Input a  ->  IO (Int)
inputY = widgetY
inputW :: Input a  ->  IO (Int)
inputW = widgetW
inputH :: Input a  ->  IO (Int)
inputH = widgetH
inputSetAlign :: Input a  -> AlignType ->  IO (())
inputSetAlign = widgetSetAlign
inputAlign :: Input a  ->  IO (AlignType)
inputAlign = widgetAlign
inputBox :: Input a  ->  IO (Boxtype)
inputBox = widgetBox
inputSetBox :: Input a  -> Boxtype ->  IO (())
inputSetBox = widgetSetBox
inputColor :: Input a  ->  IO (Color)
inputColor = widgetColor
inputSetColor :: Input a  -> Color ->  IO (())
inputSetColor = widgetSetColor
inputSetColorWithBgSel :: Input a  -> Color -> Color ->  IO (())
inputSetColorWithBgSel = widgetSetColorWithBgSel
inputSelectionColor :: Input a  ->  IO (Color)
inputSelectionColor = widgetSelectionColor
inputSetSelectionColor :: Input a  -> Color ->  IO (())
inputSetSelectionColor = widgetSetSelectionColor
inputLabel :: Input a  ->  IO (String)
inputLabel = widgetLabel
inputCopyLabel :: Input a  -> String ->  IO (())
inputCopyLabel = widgetCopyLabel
inputSetLabel :: Input a  -> String ->  IO (())
inputSetLabel = widgetSetLabel
inputLabeltype :: Input a  ->  IO (Labeltype)
inputLabeltype = widgetLabeltype
inputSetLabeltype :: Input a  -> Labeltype ->  IO (())
inputSetLabeltype = widgetSetLabeltype
inputLabelcolor :: Input a  ->  IO (Color)
inputLabelcolor = widgetLabelcolor
inputSetLabelcolor :: Input a  -> Color ->  IO (())
inputSetLabelcolor = widgetSetLabelcolor
inputLabelfont :: Input a  ->  IO (Font)
inputLabelfont = widgetLabelfont
inputSetLabelfont :: Input a  -> Font ->  IO (())
inputSetLabelfont = widgetSetLabelfont
inputLabelsize :: Input a  ->  IO (FontSize)
inputLabelsize = widgetLabelsize
inputSetLabelsize :: Input a  -> FontSize ->  IO (())
inputSetLabelsize = widgetSetLabelsize
inputImage :: Input a  ->  IO (Image ())
inputImage = widgetImage
inputSetImage :: Input a  -> Image b ->  IO (())
inputSetImage = widgetSetImage
inputDeimage :: Input a  ->  IO (Image ())
inputDeimage = widgetDeimage
inputSetDeimage :: Input a  -> Image b ->  IO (())
inputSetDeimage = widgetSetDeimage
inputTooltip :: Input a  ->  IO (String)
inputTooltip = widgetTooltip
inputCopyTooltip :: Input a  -> String ->  IO (())
inputCopyTooltip = widgetCopyTooltip
inputSetTooltip :: Input a  -> String ->  IO (())
inputSetTooltip = widgetSetTooltip
inputWhen :: Input a  ->  IO (When)
inputWhen = widgetWhen
inputSetWhen :: Input a  -> Word8 ->  IO (())
inputSetWhen = widgetSetWhen
inputVisible :: Input a  ->  IO (Int)
inputVisible = widgetVisible
inputVisibleR :: Input a  ->  IO (Int)
inputVisibleR = widgetVisibleR
inputShowSuper :: Input a  ->  IO (())
inputShowSuper = widgetShowSuper
inputShow :: Input a  ->  IO (())
inputShow = widgetShow
inputHideSuper :: Input a  ->  IO (())
inputHideSuper = widgetHideSuper
inputHide :: Input a  ->  IO (())
inputHide = widgetHide
inputSetVisible :: Input a  ->  IO (())
inputSetVisible = widgetSetVisible
inputClearVisible :: Input a  ->  IO (())
inputClearVisible = widgetClearVisible
inputActive :: Input a  ->  IO (Int)
inputActive = widgetActive
inputActiveR :: Input a  ->  IO (Int)
inputActiveR = widgetActiveR
inputActivate :: Input a  ->  IO (())
inputActivate = widgetActivate
inputDeactivate :: Input a  ->  IO (())
inputDeactivate = widgetDeactivate
inputOutput :: Input a  ->  IO (Int)
inputOutput = widgetOutput
inputSetOutput :: Input a  ->  IO (())
inputSetOutput = widgetSetOutput
inputClearOutput :: Input a  ->  IO (())
inputClearOutput = widgetClearOutput
inputTakesevents :: Input a  ->  IO (Int)
inputTakesevents = widgetTakesevents
inputSetChanged :: Input a  ->  IO (())
inputSetChanged = widgetSetChanged
inputClearChanged :: Input a  ->  IO (())
inputClearChanged = widgetClearChanged
inputTakeFocus :: Input a  ->  IO (Int)
inputTakeFocus = widgetTakeFocus
inputSetVisibleFocus :: Input a  ->  IO (())
inputSetVisibleFocus = widgetSetVisibleFocus
inputClearVisibleFocus :: Input a  ->  IO (())
inputClearVisibleFocus = widgetClearVisibleFocus
inputModifyVisibleFocus :: Input a  -> Int ->  IO (())
inputModifyVisibleFocus = widgetModifyVisibleFocus
inputVisibleFocus :: Input a  ->  IO (Int)
inputVisibleFocus = widgetVisibleFocus
inputContains :: Input a  -> Input a  ->  IO (Int)
inputContains = widgetContains
inputInside :: Input a  -> Input a  ->  IO (Int)
inputInside = widgetInside
inputRedraw :: Input a  ->  IO (())
inputRedraw = widgetRedraw
inputRedrawLabel :: Input a  ->  IO (())
inputRedrawLabel = widgetRedrawLabel
inputDamage :: Input a  ->  IO (Word8)
inputDamage = widgetDamage
inputClearDamageWithBitmask :: Input a  -> Word8 ->  IO (())
inputClearDamageWithBitmask = widgetClearDamageWithBitmask
inputClearDamage :: Input a  ->  IO (())
inputClearDamage = widgetClearDamage
inputDamageWithText :: Input a  -> Word8 ->  IO (())
inputDamageWithText = widgetDamageWithText
inputMeasureLabel :: Input a  -> IO (Size)
inputMeasureLabel = widgetMeasureLabel
inputWindow :: Input a  ->  IO (Window ())
inputWindow = widgetWindow
inputTopWindow :: Input a  ->  IO (Window ())
inputTopWindow = widgetTopWindow
inputTopWindowOffset :: Input a -> IO (Position)
inputTopWindowOffset = widgetTopWindowOffset
inputAsGlWindowSuper :: Input a  ->  IO (GlWindow ())
inputAsGlWindowSuper = widgetAsGlWindowSuper
inputAsGlWindow :: Input a  ->  IO (GlWindow ())
inputAsGlWindow = widgetAsGlWindow
inputResizeSuper :: Input a  -> Rectangle ->  IO (())
inputResizeSuper = widgetResizeSuper
inputResize :: Input a  -> Rectangle -> IO (())
inputResize = widgetResize
inputSetCallback :: Input a -> (Input b -> IO ()) -> IO (())
inputSetCallback = widgetSetCallback
inputDrawBox :: Input a -> IO ()
inputDrawBox = widgetDrawBox
inputDrawBoxWithBoxtype :: Input a -> Boxtype -> Color -> Maybe Rectangle -> IO ()
inputDrawBoxWithBoxtype = widgetDrawBoxWithBoxtype
inputDrawBackdrop :: Input a -> IO ()
inputDrawBackdrop = widgetDrawBackdrop
inputDrawFocus :: Input a -> Maybe (Boxtype, Rectangle) -> IO ()
inputDrawFocus = widgetDrawFocus
{#fun Fl_Input_handle as inputHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
inputHandle :: Input a -> Event -> IO Int
inputHandle input event = withObject input (\p -> inputHandle' p (fromIntegral . fromEnum $ event))
{# fun unsafe Fl_Input_set_value as setValue' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Input_set_value_with_length as setValueWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
inputSetValue :: Input a  -> String -> Maybe Int -> IO (Int)
inputSetValue input text l' =
  case l' of 
   Nothing -> withObject input $ \inputPtr -> setValue' inputPtr text
   Just l -> withObject input $ \inputPtr -> setValueWithLength' inputPtr text l
{# fun unsafe Fl_Input_static_value as staticValue' { id `Ptr ()',`String' } -> `Int' #}
{# fun unsafe Fl_Input_static_value_with_length as staticValueWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
inputStaticValue :: Input a  -> String -> Maybe Int ->  IO (Int)
inputStaticValue input text l'= 
  case l' of 
   Nothing -> withObject input $ \inputPtr -> staticValue' inputPtr text
   Just l -> withObject input $ \inputPtr -> staticValueWithLength' inputPtr text l
{# fun unsafe Fl_Input_value as value' { id `Ptr ()' } -> `String' #}
inputValue :: Input a  ->  IO (String)
inputValue input = withObject input $ \inputPtr -> value' inputPtr
{# fun unsafe Fl_Input_index as index' { id `Ptr ()',`Int' } -> `Int' #}
inputIndex :: Input a  -> Int ->  IO (Char)
inputIndex input i = withObject input $ \inputPtr -> index' inputPtr i >>= return . toEnum
{# fun unsafe Fl_Input_set_size as setSize' { id `Ptr ()',`Int',`Int' } -> `()' #}
inputSetSize :: Input a  -> Size ->  IO ()
inputSetSize input (Size (Width w') (Height h')) = withObject input $ \inputPtr -> setSize' inputPtr w' h'
{# fun unsafe Fl_Input_maximum_size as maximumSize' { id `Ptr ()' } -> `Int' #}
inputMaximumSize :: Input a  ->  IO (Int)
inputMaximumSize input = withObject input $ \inputPtr -> maximumSize' inputPtr
{# fun unsafe Fl_Input_size as size' { id `Ptr ()' } -> `Int' #}
inputSize :: Input a  ->  IO (Int)
inputSize input = withObject input $ \inputPtr -> size' inputPtr
{# fun unsafe Fl_Input_set_maximum_size as setMaximumSize' { id `Ptr ()',`Int' } -> `()' #}
inputSetMaximumSize :: Input a  -> Int ->  IO ()
inputSetMaximumSize input m = withObject input $ \inputPtr -> setMaximumSize' inputPtr m
{# fun unsafe Fl_Input_position as position' { id `Ptr ()' } -> `Int' #}
inputPosition :: Input a  ->  IO (Int)
inputPosition input = withObject input $ \inputPtr -> position' inputPtr
{# fun unsafe Fl_Input_mark as mark' { id `Ptr ()' } -> `Int' #}
inputMark :: Input a  ->  IO (Int)
inputMark input = withObject input $ \inputPtr -> mark' inputPtr
{# fun unsafe Fl_Input_set_position_with_cursor_mark as setPositionWithCursorMark' { id `Ptr ()',`Int',`Int' } -> `Int' #}
{# fun unsafe Fl_Input_set_position_n_n as setPositionNN' { id `Ptr ()',`Int' } -> `Int' #}
inputSetPosition :: Input a -> Int -> Maybe Int -> IO (Int)
inputSetPosition input point mark =
  case mark of
     Just m ->  withObject input $ \inputPtr -> setPositionWithCursorMark' inputPtr point m
     Nothing -> withObject input $ \inputPtr -> setPositionNN' inputPtr point
{# fun unsafe Fl_Input_set_mark as setMark' { id `Ptr ()',`Int' } -> `Int' #}
inputSetMark :: Input a  -> Int ->  IO (Int)
inputSetMark input m = withObject input $ \inputPtr -> setMark' inputPtr m
{# fun unsafe Fl_Input_replace as replace' { id `Ptr ()',`Int',`Int',`String' } -> `Int' #}
inputReplace :: Input a  -> Int -> Int -> String ->  IO (Int)
inputReplace input b e text = withObject input $ \inputPtr -> replace' inputPtr b e  text
{# fun unsafe Fl_Input_cut as cut' { id `Ptr ()' } -> `Int' #}
inputCut :: Input a  ->  IO (Int)
inputCut input = withObject input $ \inputPtr -> cut' inputPtr
{# fun unsafe Fl_Input_cut_bytes as cutBytes' { id `Ptr ()',`Int' } -> `Int' #}
inputCutFromCursor :: Input a  -> Int ->  IO (Int)
inputCutFromCursor input n = withObject input $ \inputPtr -> cutBytes' inputPtr n
{# fun unsafe Fl_Input_cut_range as cutRange' { id `Ptr ()',`Int',`Int' } -> `Int' #}
inputCutRange :: Input a  -> Int -> Int ->  IO (Int)
inputCutRange input a b = withObject input $ \inputPtr -> cutRange' inputPtr a b
{# fun unsafe Fl_Input_insert as insert' { id `Ptr ()',`String' } -> `Int' #}
inputInsert :: Input a  -> String ->  IO (Int)
inputInsert input t = withObject input $ \inputPtr -> insert' inputPtr t
{# fun unsafe Fl_Input_insert_with_length as insertWithLength' { id `Ptr ()',`String',`Int' } -> `Int' #}
inputInsertWithLength :: Input a  -> String -> Int ->  IO (Int)
inputInsertWithLength input t l = withObject input $ \inputPtr -> insertWithLength' inputPtr t l
{# fun unsafe Fl_Input_copy as copy' { id `Ptr ()',`Int' } -> `Int' #}
inputCopy :: Input a  -> Clipboard ->  IO (Int)
inputCopy input clipboard = 
  case clipboard of
   InternalClipboard -> withObject input $ \inputPtr -> copy' inputPtr 1
   SharedClipboard -> withObject input $ \inputPtr -> copy' inputPtr 0
{# fun unsafe Fl_Input_undo as undo' { id `Ptr ()' } -> `Int' #}
inputUndo :: Input a  ->  IO (Int)
inputUndo input = withObject input $ \inputPtr -> undo' inputPtr
{# fun unsafe Fl_Input_copy_cuts as copyCuts' { id `Ptr ()' } -> `Int' #}
inputCopyCuts :: Input a  ->  IO (Int)
inputCopyCuts input = withObject input $ \inputPtr -> copyCuts' inputPtr
{# fun unsafe Fl_Input_shortcut as shortcut' { id `Ptr ()' } -> `Int' #}
inputShortcut :: Input a  ->  IO (Int)
inputShortcut input = withObject input $ \inputPtr -> shortcut' inputPtr
{# fun unsafe Fl_Input_set_shortcut as setShortcut' { id `Ptr ()',`Int' } -> `()' #}
inputSetShortcut :: Input a  -> Int ->  IO ()
inputSetShortcut input s = withObject input $ \inputPtr -> setShortcut' inputPtr s
{# fun unsafe Fl_Input_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
inputTextfont :: Input a  ->  IO (Font)
inputTextfont input = withObject input $ \inputPtr -> textfont' inputPtr
{# fun unsafe Fl_Input_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
inputSetTextfont :: Input a  -> Font ->  IO ()
inputSetTextfont input s = withObject input $ \inputPtr -> setTextfont' inputPtr s
{# fun unsafe Fl_Input_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
inputTextsize :: Input a  ->  IO (FontSize)
inputTextsize input = withObject input $ \inputPtr -> textsize' inputPtr >>= return . FontSize
{# fun unsafe Fl_Input_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
inputSetTextsize :: Input a  -> FontSize ->  IO ()
inputSetTextsize input (FontSize s) = withObject input $ \inputPtr -> setTextsize' inputPtr s
{# fun unsafe Fl_Input_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
inputTextcolor :: Input a  ->  IO (Color)
inputTextcolor input = withObject input $ \inputPtr -> textcolor' inputPtr
{# fun unsafe Fl_Input_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
inputSetTextcolor :: Input a  -> Color ->  IO ()
inputSetTextcolor input n = withObject input $ \inputPtr -> setTextcolor' inputPtr n
{# fun unsafe Fl_Input_cursor_color as cursorColor' { id `Ptr ()' } -> `Color' cToColor #}
inputCursorColor :: Input a  ->  IO (Color)
inputCursorColor input = withObject input $ \inputPtr -> cursorColor' inputPtr
{# fun unsafe Fl_Input_set_cursor_color as setCursorColor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
inputSetCursorColor :: Input a  -> Color ->  IO ()
inputSetCursorColor input n = withObject input $ \inputPtr -> setCursorColor' inputPtr n
{# fun unsafe Fl_Input_input_type as inputType' { id `Ptr ()' } -> `Int' #}
inputInputType :: Input a  ->  IO (Int)
inputInputType input = withObject input $ \inputPtr -> inputType' inputPtr
{# fun unsafe Fl_Input_set_input_type as setInputType' { id `Ptr ()',`Int' } -> `()' #}
inputSetInputType :: Input a  -> Int ->  IO ()
inputSetInputType input t = withObject input $ \inputPtr -> setInputType' inputPtr t
{# fun unsafe Fl_Input_readonly as readonly' { id `Ptr ()' } -> `Int' #}
inputReadonly :: Input a  ->  IO (Int)
inputReadonly input = withObject input $ \inputPtr -> readonly' inputPtr
{# fun unsafe Fl_Input_set_readonly as setReadonly' { id `Ptr ()',`Int' } -> `()' #}
inputSetReadonly :: Input a  -> Int ->  IO ()
inputSetReadonly input b = withObject input $ \inputPtr -> setReadonly' inputPtr b
{# fun unsafe Fl_Input_wrap as wrap' { id `Ptr ()' } -> `Int' #}
inputWrap :: Input a  ->  IO (Int)
inputWrap input = withObject input $ \inputPtr -> wrap' inputPtr
{# fun unsafe Fl_Input_set_wrap as setWrap' { id `Ptr ()',`Int' } -> `()' #}
inputSetWrap :: Input a  -> Int ->  IO ()
inputSetWrap input b = withObject input $ \inputPtr -> setWrap' inputPtr b
{# fun unsafe Fl_Input_tab_nav as tabNav' { id `Ptr ()',`Int' } -> `()' #}
inputTabNav :: Input a  -> Int ->  IO ()
inputTabNav input val = withObject input $ \inputPtr -> tabNav' inputPtr val
{# fun unsafe Fl_Input_set_tab_nav as setTabNav' { id `Ptr ()' } -> `Int' #}
inputSetTabNav :: Input a  ->  IO (Int)
inputSetTabNav input = withObject input $ \inputPtr -> setTabNav' inputPtr
