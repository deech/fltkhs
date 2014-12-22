{-# LANGUAGE EmptyDataDecls, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts #-}
module Graphics.UI.FLTK.LowLevel.Hierarchy
       (
         -- * Widget
         Widget,
         CWidget,
         Destroy,
         destroy,
         Handle,
         handle,
         GetParent,
         getParent,
         SetParent,
         setParent,
         GetType_,
         getType_,
         SetType,
         setType,
         DrawLabel,
         drawLabel,
         GetX,
         getX,
         GetY,
         getY,
         GetW,
         getW,
         GetH,
         getH,
         SetAlign,
         setAlign,
         GetAlign,
         getAlign,
         GetBox,
         getBox,
         SetBox,
         setBox,
         GetColor,
         getColor,
         SetColor,
         setColor,
         SetColorWithBgSel,
         setColorWithBgSel,
         SelectionColor,
         selectionColor,
         SetSelectionColor,
         setSelectionColor,
         GetLabel,
         getLabel,
         CopyLabel,
         copyLabel,
         SetLabel,
         setLabel,
         GetLabeltype,
         getLabeltype,
         SetLabeltype,
         setLabeltype,
         GetLabelcolor,
         getLabelcolor,
         SetLabelcolor,
         setLabelcolor,
         GetLabelfont,
         getLabelfont,
         SetLabelfont,
         setLabelfont,
         GetLabelsize,
         getLabelsize,
         SetLabelsize,
         setLabelsize,
         GetImage,
         getImage,
         SetImage,
         setImage,
         GetDeimage,
         getDeimage,
         SetDeimage,
         setDeimage,
         GetTooltip,
         getTooltip,
         CopyTooltip,
         copyTooltip,
         SetTooltip,
         setTooltip,
         GetWhen,
         getWhen,
         SetWhen,
         setWhen,
         GetVisible,
         getVisible,
         GetVisibleR,
         getVisibleR,
         ShowWidgetSuper,
         showWidgetSuper,
         ShowWidget,
         showWidget,
         HideSuper,
         hideSuper,
         Hide,
         hide,
         SetVisible,
         setVisible,
         ClearVisible,
         clearVisible,
         Active,
         active,
         ActiveR,
         activeR,
         Activate,
         activate,
         Deactivate,
         deactivate,
         GetOutput,
         getOutput,
         SetOutput,
         setOutput,
         ClearOutput,
         clearOutput,
         Takesevents,
         takesevents,
         SetChanged,
         setChanged,
         GetClearChanged,
         getClearChanged,
         TakeFocus,
         takeFocus,
         SetVisibleFocus,
         setVisibleFocus,
         ClearVisibleFocus,
         clearVisibleFocus,
         ModifyVisibleFocus,
         modifyVisibleFocus,
         GetVisibleFocus,
         getVisibleFocus,
         Contains,
         contains,
         Inside,
         inside,
         Redraw,
         redraw,
         RedrawLabel,
         redrawLabel,
         GetDamage,
         getDamage,
         ClearDamageWithBitmask,
         clearDamageWithBitmask,
         ClearDamage,
         clearDamage,
         GetDamageWithText,
         getDamageWithText,
         GetDamageInsideWidget,
         getDamageInsideWidget,
         MeasureLabel,
         measureLabel,
         GetWindow,
         getWindow,
         GetTopWindow,
         getTopWindow,
         GetTopWindowOffset,
         getTopWindowOffset,
         AsGroupSuper,
         asGroupSuper,
         AsGroup,
         asGroup,
         AsGlWindowSuper,
         asGlWindowSuper,
         AsGlWindow,
         asGlWindow,
         ResizeSuper,
         resizeSuper,
         Resize,
         resize,
         SetCallback,
         setCallback,
         DrawBox,
         drawBox,
         DrawBoxWithBoxtype,
         drawBoxWithBoxtype,
         DrawBackdrop,
         drawBackdrop,
         DrawFocus,
         drawFocus,
         -- * Group
         Group,
         Begin,
         begin,
         End,
         end,
         Find,
         find,
         Add,
         add,
         Insert,
         insert,
         RemoveIndex,
         removeIndex,
         RemoveWidget,
         removeWidget,
         Clear,
         clear,
         SetResizable,
         setResizable,
         GetResizable,
         getResizable,
         AddResizable,
         addResizable,
         InitSizes,
         initSizes,
         Children,
         children,
         SetClipChildren,
         setClipChildren,
         ClipChildren,
         clipChildren,
         Focus,
         focus,
         DdfdesignKludge,
         ddfdesignKludge,
         InsertWithBefore,
         insertWithBefore,
         GetArray,
         getArray,
         GetChild,
         getChild,
         -- * Window
         Window,
         DrawSuper,
         drawSuper,
         HandleSuper,
         handleSuper,
         FlushSuper,
         flushSuper,
         AsWindowSuper,
         asWindowSuper,
         AsWindow,
         asWindow,
         Changed,
         changed,
         MakeFullscreen,
         makeFullscreen,
         FullscreenOff,
         fullscreenOff,
         SetBorder,
         setBorder,
         ClearBorder,
         clearBorder,
         GetBorder,
         getBorder,
         SetOverride,
         setOverride,
         GetOverride,
         getOverride,
         SetModal,
         setModal,
         GetModal,
         getModal,
         SetNonModal,
         setNonModal,
         NonModal,
         nonModal,
         SetMenuWindow,
         setMenuWindow,
         GetMenuWindow,
         getMenuWindow,
         SetTooltipWindow,
         setTooltipWindow,
         GetTooltipWindow,
         getTooltipWindow,
         HotSpot,
         hotSpot,
         FreePosition,
         freePosition,
         SizeRange,
         sizeRange,
         SizeRangeWithArgs,
         sizeRangeWithArgs,
         GetIconlabel,
         getIconlabel,
         SetIconlabel,
         setIconlabel,
         SetLabelWithIconlabel,
         setLabelWithIconlabel,
         GetXclass,
         getXclass,
         SetXclass,
         setXclass,
         GetIcon,
         getIcon,
         SetIcon,
         setIcon,
         Shown,
         shown,
         Iconize,
         iconize,
         GetXRoot,
         getXRoot,
         GetYRoot,
         getYRoot,
         MakeCurrent,
         makeCurrent,
         SetCursor,
         setCursor,
         SetCursorWithFgBg,
         setCursorWithFgBg,
         SetDefaultCursor,
         setDefaultCursor,
         SetDefaultCursorWithFgBg,
         setDefaultCursorWithFgBg,
         GetDecoratedW,
         getDecoratedW,
         GetDecoratedH,
         getDecoratedH,
         WaitForExpose,
         waitForExpose,
         -- * SingleWindow
         SingleWindow,
         -- * DoubleWindow
         DoubleWindow,
         -- * OverlayWindow
         OverlayWindow,
         CanDoOverlay,
         canDoOverlay,
         RedrawOverlay,
         redrawOverlay,
         Flush,
         flush,
         -- * Button
         Button,
         GetValue,
         getValue,
         SetValue,
         setValue,
         Set,
         set,
         Setonly,
         setonly,
         GetShortcut,
         getShortcut,
         SetShortcut,
         setShortcut,
         GetDownBox,
         getDownBox,
         SetDownBox,
         setDownBox,
         GetDownColor,
         getDownColor,
         SetDownColor,
         setDownColor,
         -- * LightButton
         LightButton,
         -- * CheckButton
         CheckButton,
         -- * ReturnButton
         ReturnButton,
         -- * RoundButton
         RoundButton,
         -- * RepeatButton
         RepeatButton,
         -- * ToggleButton
         ToggleButton,
         -- * Valuator
         Valuator,
         GetBounds,
         getBounds,
         GetMinimum,
         getMinimum,
         SetMinimum,
         setMinimum,
         GetMaximum,
         getMaximum,
         SetMaximum,
         setMaximum,
         GetRange,
         getRange,
         SetStep,
         setStep,
         GetStep,
         getStep,
         Precision,
         precision,
         Format,
         format,
         Round,
         round,
         Clamp,
         clamp,
         Increment,
         increment,
         -- * Slider
         Slider,
         Scrollvalue,
         scrollvalue,
         SetSliderSize,
         setSliderSize,
         GetSliderSize,
         getSliderSize,
         GetSlider,
         getSlider,
         SetSlider,
         setSlider,
         -- * FillSlider
         FillSlider,
         -- * HorSlider
         HorSlider,
         -- * HorFillSider
         HorFillSlider,
         -- * NiceSlider
         NiceSlider,
         -- * HorNiceSlider
         HorNiceSlider,
         GlWindow,
         Table
       )
where
import Prelude hiding (round)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch

-- * Widget
data CWidget fs parent
type Widget = CWidget
               (Destroy
               (Handle
               (GetParent
               (SetParent
               (GetType_
               (SetType
               (DrawLabel
               (GetX
               (GetY
               (GetW
               (GetH
               (SetAlign
               (GetAlign
               (GetBox
               (SetBox
               (GetColor
               (SetColor
               (SetColorWithBgSel
               (SelectionColor
               (SetSelectionColor
               (GetLabel
               (CopyLabel
               (SetLabel
               (GetLabeltype
               (SetLabeltype
               (GetLabelcolor
               (SetLabelcolor
               (GetLabelfont
               (SetLabelfont
               (GetLabelsize
               (SetLabelsize
               (GetImage
               (SetImage
               (GetDeimage
               (SetDeimage
               (GetTooltip
               (CopyTooltip
               (SetTooltip
               (GetWhen
               (SetWhen
               (GetVisible
               (GetVisibleR
               (ShowWidgetSuper
               (ShowWidget
               (HideSuper
               (Hide
               (SetVisible
               (ClearVisible
               (Active
               (ActiveR
               (Activate
               (Deactivate
               (GetOutput
               (SetOutput
               (Takesevents
               (SetChanged
               (GetClearChanged
               (TakeFocus
               (SetVisibleFocus
               (ClearVisibleFocus
               (ModifyVisibleFocus
               (GetVisibleFocus
               (Contains
               (Inside
               (Redraw
               (RedrawLabel
               (GetDamage
               (ClearDamageWithBitmask
               (ClearDamage
               (GetDamageWithText
               (GetDamageInsideWidget
               (MeasureLabel
               (GetWindow
               (GetTopWindow
               (GetTopWindowOffset
               (AsGroupSuper
               (AsGroup
               (AsGlWindowSuper
               (AsGlWindow
               (ResizeSuper
               (Resize
               (SetCallback
               (DrawBox
               (DrawBoxWithBoxtype
               (DrawBackdrop
               (DrawFocus
               ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
              Base
data Destroy a
destroy :: (FindOp a (Destroy ()) (Match r), Op (Destroy ()) r impl) => Ref a -> impl
destroy = dispatch (undefined :: Destroy ())
data Handle a
handle :: (FindOp a (Handle ()) (Match r), Op (Handle ()) r impl) => Ref a -> impl
handle = dispatch (undefined :: Handle ())
data GetParent a
getParent :: (FindOp a (GetParent ()) (Match r), Op (GetParent ()) r impl) => Ref a -> impl
getParent = dispatch (undefined :: GetParent ())
data SetParent a
setParent :: (FindOp a (SetParent ()) (Match r), Op (SetParent ()) r impl) => Ref a -> impl
setParent = dispatch (undefined :: SetParent ())
data GetType_ a
getType_:: (FindOp a (GetType_ ()) (Match r), Op (GetType_ ()) r impl) => Ref a -> impl
getType_= dispatch (undefined :: GetType_ ())
data SetType a
setType :: (FindOp a (SetType ()) (Match r), Op (SetType ()) r impl) => Ref a -> impl
setType = dispatch (undefined :: SetType ())
data DrawLabel a
drawLabel :: (FindOp a (DrawLabel ()) (Match r), Op (DrawLabel ()) r impl) => Ref a -> impl
drawLabel = dispatch (undefined :: DrawLabel ())
data GetX a
getX :: (FindOp a (GetX ()) (Match r), Op (GetX ()) r impl) => Ref a -> impl
getX = dispatch (undefined :: GetX ())
data GetY a
getY :: (FindOp a (GetY ()) (Match r), Op (GetY ()) r impl) => Ref a -> impl
getY = dispatch (undefined :: GetY ())
data GetW a
getW :: (FindOp a (GetW ()) (Match r), Op (GetW ()) r impl) => Ref a -> impl
getW = dispatch (undefined :: GetW ())
data GetH a
getH :: (FindOp a (GetH ()) (Match r), Op (GetH ()) r impl) => Ref a -> impl
getH = dispatch (undefined :: GetH ())
data SetAlign a
setAlign :: (FindOp a (SetAlign ()) (Match r), Op (SetAlign ()) r impl) => Ref a -> impl
setAlign = dispatch (undefined :: SetAlign ())
data GetAlign a
getAlign :: (FindOp a (GetAlign ()) (Match r), Op (GetAlign ()) r impl) => Ref a -> impl
getAlign = dispatch (undefined :: GetAlign ())
data GetBox a
getBox :: (FindOp a (GetBox ()) (Match r), Op (GetBox ()) r impl) => Ref a -> impl
getBox = dispatch (undefined :: GetBox ())
data SetBox a
setBox :: (FindOp a (SetBox ()) (Match r), Op (SetBox ()) r impl) => Ref a -> impl
setBox = dispatch (undefined :: SetBox ())
data GetColor a
getColor :: (FindOp a (GetColor ()) (Match r), Op (GetColor ()) r impl) => Ref a -> impl
getColor = dispatch (undefined :: GetColor ())
data SetColor a
setColor :: (FindOp a (SetColor ()) (Match r), Op (SetColor ()) r impl) => Ref a -> impl
setColor = dispatch (undefined :: SetColor ())
data SetColorWithBgSel a
setColorWithBgSel :: (FindOp a (SetColorWithBgSel ()) (Match r), Op (SetColorWithBgSel ()) r impl) => Ref a -> impl
setColorWithBgSel = dispatch (undefined :: SetColorWithBgSel ())
data SelectionColor a
selectionColor :: (FindOp a (SelectionColor ()) (Match r), Op (SelectionColor ()) r impl) => Ref a -> impl
selectionColor = dispatch (undefined :: SelectionColor ())
data SetSelectionColor a
setSelectionColor :: (FindOp a (SetSelectionColor ()) (Match r), Op (SetSelectionColor ()) r impl) => Ref a -> impl
setSelectionColor = dispatch (undefined :: SetSelectionColor ())
data GetLabel a
getLabel :: (FindOp a (GetLabel ()) (Match r), Op (GetLabel ()) r impl) => Ref a -> impl
getLabel = dispatch (undefined :: GetLabel ())
data CopyLabel a
copyLabel :: (FindOp a (CopyLabel ()) (Match r), Op (CopyLabel ()) r impl) => Ref a -> impl
copyLabel = dispatch (undefined :: CopyLabel ())
data SetLabel a
setLabel :: (FindOp a (SetLabel ()) (Match r), Op (SetLabel ()) r impl) => Ref a -> impl
setLabel = dispatch (undefined :: SetLabel ())
data GetLabeltype a
getLabeltype :: (FindOp a (GetLabeltype ()) (Match r), Op (GetLabeltype ()) r impl) => Ref a -> impl
getLabeltype = dispatch (undefined :: GetLabeltype ())
data SetLabeltype a
setLabeltype :: (FindOp a (SetLabeltype ()) (Match r), Op (SetLabeltype ()) r impl) => Ref a -> impl
setLabeltype = dispatch (undefined :: SetLabeltype ())
data GetLabelcolor a
getLabelcolor :: (FindOp a (GetLabelcolor ()) (Match r), Op (GetLabelcolor ()) r impl) => Ref a -> impl
getLabelcolor = dispatch (undefined :: GetLabelcolor ())
data SetLabelcolor a
setLabelcolor :: (FindOp a (SetLabelcolor ()) (Match r), Op (SetLabelcolor ()) r impl) => Ref a -> impl
setLabelcolor = dispatch (undefined :: SetLabelcolor ())
data GetLabelfont a
getLabelfont :: (FindOp a (GetLabelfont ()) (Match r), Op (GetLabelfont ()) r impl) => Ref a -> impl
getLabelfont = dispatch (undefined :: GetLabelfont ())
data SetLabelfont a
setLabelfont :: (FindOp a (SetLabelfont ()) (Match r), Op (SetLabelfont ()) r impl) => Ref a -> impl
setLabelfont = dispatch (undefined :: SetLabelfont ())
data GetLabelsize a
getLabelsize :: (FindOp a (GetLabelsize ()) (Match r), Op (GetLabelsize ()) r impl) => Ref a -> impl
getLabelsize = dispatch (undefined :: GetLabelsize ())
data SetLabelsize a
setLabelsize :: (FindOp a (SetLabelsize ()) (Match r), Op (SetLabelsize ()) r impl) => Ref a -> impl
setLabelsize = dispatch (undefined :: SetLabelsize ())
data GetImage a
getImage :: (FindOp a (GetImage ()) (Match r), Op (GetImage ()) r impl) => Ref a -> impl
getImage = dispatch (undefined :: GetImage ())
data SetImage a
setImage :: (FindOp a (SetImage ()) (Match r), Op (SetImage ()) r impl) => Ref a -> impl
setImage = dispatch (undefined :: SetImage ())
data GetDeimage a
getDeimage :: (FindOp a (GetDeimage ()) (Match r), Op (GetDeimage ()) r impl) => Ref a -> impl
getDeimage = dispatch (undefined :: GetDeimage ())
data SetDeimage a
setDeimage :: (FindOp a (SetDeimage ()) (Match r), Op (SetDeimage ()) r impl) => Ref a -> impl
setDeimage = dispatch (undefined :: SetDeimage ())
data GetTooltip a
getTooltip :: (FindOp a (GetTooltip ()) (Match r), Op (GetTooltip ()) r impl) => Ref a -> impl
getTooltip = dispatch (undefined :: GetTooltip ())
data CopyTooltip a
copyTooltip :: (FindOp a (CopyTooltip ()) (Match r), Op (CopyTooltip ()) r impl) => Ref a -> impl
copyTooltip = dispatch (undefined :: CopyTooltip ())
data SetTooltip a
setTooltip :: (FindOp a (SetTooltip ()) (Match r), Op (SetTooltip ()) r impl) => Ref a -> impl
setTooltip = dispatch (undefined :: SetTooltip ())
data GetWhen a
getWhen :: (FindOp a (GetWhen ()) (Match r), Op (GetWhen ()) r impl) => Ref a -> impl
getWhen = dispatch (undefined :: GetWhen ())
data SetWhen a
setWhen :: (FindOp a (SetWhen ()) (Match r), Op (SetWhen ()) r impl) => Ref a -> impl
setWhen = dispatch (undefined :: SetWhen ())
data GetVisible a
getVisible :: (FindOp a (GetVisible ()) (Match r), Op (GetVisible ()) r impl) => Ref a -> impl
getVisible = dispatch (undefined :: GetVisible ())
data GetVisibleR a
getVisibleR :: (FindOp a (GetVisibleR ()) (Match r), Op (GetVisibleR ()) r impl) => Ref a -> impl
getVisibleR = dispatch (undefined :: GetVisibleR ())
data ShowWidgetSuper a
showWidgetSuper :: (FindOp a (ShowWidgetSuper ()) (Match r), Op (ShowWidgetSuper ()) r impl) => Ref a -> impl
showWidgetSuper = dispatch (undefined :: ShowWidgetSuper ())
data ShowWidget a
showWidget :: (FindOp a (ShowWidget ()) (Match r), Op (ShowWidget ()) r impl) => Ref a -> impl
showWidget = dispatch (undefined :: ShowWidget ())
data HideSuper a
hideSuper :: (FindOp a (HideSuper ()) (Match r), Op (HideSuper ()) r impl) => Ref a -> impl
hideSuper = dispatch (undefined :: HideSuper ())
data Hide a
hide :: (FindOp a (Hide ()) (Match r), Op (Hide ()) r impl) => Ref a -> impl
hide = dispatch (undefined :: Hide ())
data SetVisible a
setVisible :: (FindOp a (SetVisible ()) (Match r), Op (SetVisible ()) r impl) => Ref a -> impl
setVisible = dispatch (undefined :: SetVisible ())
data ClearVisible a
clearVisible :: (FindOp a (ClearVisible ()) (Match r), Op (ClearVisible ()) r impl) => Ref a -> impl
clearVisible = dispatch (undefined :: ClearVisible ())
data Active a
active :: (FindOp a (Active ()) (Match r), Op (Active ()) r impl) => Ref a -> impl
active = dispatch (undefined :: Active ())
data ActiveR a
activeR :: (FindOp a (ActiveR ()) (Match r), Op (ActiveR ()) r impl) => Ref a -> impl
activeR = dispatch (undefined :: ActiveR ())
data Activate a
activate :: (FindOp a (Activate ()) (Match r), Op (Activate ()) r impl) => Ref a -> impl
activate = dispatch (undefined :: Activate ())
data Deactivate a
deactivate :: (FindOp a (Deactivate ()) (Match r), Op (Deactivate ()) r impl) => Ref a -> impl
deactivate = dispatch (undefined :: Deactivate ())
data GetOutput a
getOutput :: (FindOp a (GetOutput ()) (Match r), Op (GetOutput ()) r impl) => Ref a -> impl
getOutput = dispatch (undefined :: GetOutput ())
data SetOutput a
setOutput :: (FindOp a (SetOutput ()) (Match r), Op (SetOutput ()) r impl) => Ref a -> impl
setOutput = dispatch (undefined :: SetOutput ())
data ClearOutput a
clearOutput :: (FindOp a (ClearOutput ()) (Match r), Op (ClearOutput ()) r impl) => Ref a -> impl
clearOutput = dispatch (undefined :: ClearOutput ())
data Takesevents a
takesevents :: (FindOp a (Takesevents ()) (Match r), Op (Takesevents ()) r impl) => Ref a -> impl
takesevents = dispatch (undefined :: Takesevents ())
data SetChanged a
setChanged :: (FindOp a (SetChanged ()) (Match r), Op (SetChanged ()) r impl) => Ref a -> impl
setChanged = dispatch (undefined :: SetChanged ())
data GetClearChanged a
getClearChanged :: (FindOp a (GetClearChanged ()) (Match r), Op (GetClearChanged ()) r impl) => Ref a -> impl
getClearChanged = dispatch (undefined :: GetClearChanged ())
data TakeFocus a
takeFocus :: (FindOp a (TakeFocus ()) (Match r), Op (TakeFocus ()) r impl) => Ref a -> impl
takeFocus = dispatch (undefined :: TakeFocus ())
data SetVisibleFocus a
setVisibleFocus :: (FindOp a (SetVisibleFocus ()) (Match r), Op (SetVisibleFocus ()) r impl) => Ref a -> impl
setVisibleFocus = dispatch (undefined :: SetVisibleFocus ())
data ClearVisibleFocus a
clearVisibleFocus :: (FindOp a (ClearVisibleFocus ()) (Match r), Op (ClearVisibleFocus ()) r impl) => Ref a -> impl
clearVisibleFocus = dispatch (undefined :: ClearVisibleFocus ())
data ModifyVisibleFocus a
modifyVisibleFocus :: (FindOp a (ModifyVisibleFocus ()) (Match r), Op (ModifyVisibleFocus ()) r impl) => Ref a -> impl
modifyVisibleFocus = dispatch (undefined :: ModifyVisibleFocus ())
data GetVisibleFocus a
getVisibleFocus :: (FindOp a (GetVisibleFocus ()) (Match r), Op (GetVisibleFocus ()) r impl) => Ref a -> impl
getVisibleFocus = dispatch (undefined :: GetVisibleFocus ())
data Contains a
contains :: (FindOp a (Contains ()) (Match r), Op (Contains ()) r impl) => Ref a -> impl
contains = dispatch (undefined :: Contains ())
data Inside a
inside :: (FindOp a (Inside ()) (Match r), Op (Inside ()) r impl) => Ref a -> impl
inside = dispatch (undefined :: Inside ())
data Redraw a
redraw :: (FindOp a (Redraw ()) (Match r), Op (Redraw ()) r impl) => Ref a -> impl
redraw = dispatch (undefined :: Redraw ())
data RedrawLabel a
redrawLabel :: (FindOp a (RedrawLabel ()) (Match r), Op (RedrawLabel ()) r impl) => Ref a -> impl
redrawLabel = dispatch (undefined :: RedrawLabel ())
data GetDamage a
getDamage :: (FindOp a (GetDamage ()) (Match r), Op (GetDamage ()) r impl) => Ref a -> impl
getDamage = dispatch (undefined :: GetDamage ())
data ClearDamageWithBitmask a
clearDamageWithBitmask :: (FindOp a (ClearDamageWithBitmask ()) (Match r), Op (ClearDamageWithBitmask ()) r impl) => Ref a -> impl
clearDamageWithBitmask = dispatch (undefined :: ClearDamageWithBitmask ())
data ClearDamage a
clearDamage :: (FindOp a (ClearDamage ()) (Match r), Op (ClearDamage ()) r impl) => Ref a -> impl
clearDamage = dispatch (undefined :: ClearDamage ())
data GetDamageWithText a
getDamageWithText :: (FindOp a (GetDamageWithText ()) (Match r), Op (GetDamageWithText ()) r impl) => Ref a -> impl
getDamageWithText = dispatch (undefined :: GetDamageWithText ())
data GetDamageInsideWidget a
getDamageInsideWidget :: (FindOp a (GetDamageInsideWidget ()) (Match r), Op (GetDamageInsideWidget ()) r impl) => Ref a -> impl
getDamageInsideWidget = dispatch (undefined :: GetDamageInsideWidget ())
data MeasureLabel a
measureLabel :: (FindOp a (MeasureLabel ()) (Match r), Op (MeasureLabel ()) r impl) => Ref a -> impl
measureLabel = dispatch (undefined :: MeasureLabel ())
data GetWindow a
getWindow :: (FindOp a (GetWindow ()) (Match r), Op (GetWindow ()) r impl) => Ref a -> impl
getWindow = dispatch (undefined :: GetWindow ())
data GetTopWindow a
getTopWindow :: (FindOp a (GetTopWindow ()) (Match r), Op (GetTopWindow ()) r impl) => Ref a -> impl
getTopWindow = dispatch (undefined :: GetTopWindow ())
data GetTopWindowOffset a
getTopWindowOffset :: (FindOp a (GetTopWindowOffset ()) (Match r), Op (GetTopWindowOffset ()) r impl) => Ref a -> impl
getTopWindowOffset = dispatch (undefined :: GetTopWindowOffset ())
data AsGroupSuper a
asGroupSuper :: (FindOp a (AsGroupSuper ()) (Match r), Op (AsGroupSuper ()) r impl) => Ref a -> impl
asGroupSuper = dispatch (undefined :: AsGroupSuper ())
data AsGroup a
asGroup :: (FindOp a (AsGroup ()) (Match r), Op (AsGroup ()) r impl) => Ref a -> impl
asGroup = dispatch (undefined :: AsGroup ())
data AsGlWindowSuper a
asGlWindowSuper :: (FindOp a (AsGlWindowSuper ()) (Match r), Op (AsGlWindowSuper ()) r impl) => Ref a -> impl
asGlWindowSuper = dispatch (undefined :: AsGlWindowSuper ())
data AsGlWindow a
asGlWindow :: (FindOp a (AsGlWindow ()) (Match r), Op (AsGlWindow ()) r impl) => Ref a -> impl
asGlWindow = dispatch (undefined :: AsGlWindow ())
data ResizeSuper a
resizeSuper :: (FindOp a (ResizeSuper ()) (Match r), Op (ResizeSuper ()) r impl) => Ref a -> impl
resizeSuper = dispatch (undefined :: ResizeSuper ())
data Resize a
resize :: (FindOp a (Resize ()) (Match r), Op (Resize ()) r impl) => Ref a -> impl
resize = dispatch (undefined :: Resize ())
data SetCallback a
setCallback :: (FindOp a (SetCallback ()) (Match r), Op (SetCallback ()) r impl) => Ref a -> impl
setCallback = dispatch (undefined :: SetCallback ())
data DrawBox a
drawBox :: (FindOp a (DrawBox ()) (Match r), Op (DrawBox ()) r impl) => Ref a -> impl
drawBox = dispatch (undefined :: DrawBox ())
data DrawBoxWithBoxtype a
drawBoxWithBoxtype :: (FindOp a (DrawBoxWithBoxtype ()) (Match r), Op (DrawBoxWithBoxtype ()) r impl) => Ref a -> impl
drawBoxWithBoxtype = dispatch (undefined :: DrawBoxWithBoxtype ())
data DrawBackdrop a
drawBackdrop :: (FindOp a (DrawBackdrop ()) (Match r), Op (DrawBackdrop ()) r impl) => Ref a -> impl
drawBackdrop = dispatch (undefined :: DrawBackdrop ())
data DrawFocus a
drawFocus :: (FindOp a (DrawFocus ()) (Match r), Op (DrawFocus ()) r impl) => Ref a -> impl
drawFocus = dispatch (undefined :: DrawFocus ())

-- * Group
data CGroup fs parent
type Group = CGroup
               (Destroy
               (Begin
               (End
               (Find
               (Add
               (Insert
               (RemoveIndex
               (RemoveWidget
               (Clear
               (SetResizable
               (GetResizable
               (AddResizable
               (InitSizes
               (Children
               (SetClipChildren
               (ClipChildren
               (Focus
               (DdfdesignKludge
               (InsertWithBefore
               (GetArray
               (GetChild
               ())))))))))))))))))))))
               Widget

data Begin a
begin :: (FindOp a (Begin ()) (Match r), Op (Begin ()) r impl) => Ref a -> impl
begin = dispatch (undefined :: Begin ())
data End a
end :: (FindOp a (End ()) (Match r), Op (End ()) r impl) => Ref a -> impl
end = dispatch (undefined :: End ())
data Find a
find :: (FindOp a (Find ()) (Match r), Op (Find ()) r impl) => Ref a -> impl
find = dispatch (undefined :: Find ())
data Add a
add :: (FindOp a (Add ()) (Match r), Op (Add ()) r impl) => Ref a -> impl
add = dispatch (undefined :: Add ())
data Insert a
insert :: (FindOp a (Insert ()) (Match r), Op (Insert ()) r impl) => Ref a -> impl
insert = dispatch (undefined :: Insert ())
data RemoveIndex a
removeIndex :: (FindOp a (RemoveIndex ()) (Match r), Op (RemoveIndex ()) r impl) => Ref a -> impl
removeIndex = dispatch (undefined :: RemoveIndex ())
data RemoveWidget a
removeWidget :: (FindOp a (RemoveWidget ()) (Match r), Op (RemoveWidget ()) r impl) => Ref a -> impl
removeWidget = dispatch (undefined :: RemoveWidget ())
data Clear a
clear :: (FindOp a (Clear ()) (Match r), Op (Clear ()) r impl) => Ref a -> impl
clear = dispatch (undefined :: Clear ())
data SetResizable a
setResizable :: (FindOp a (SetResizable ()) (Match r), Op (SetResizable ()) r impl) => Ref a -> impl
setResizable = dispatch (undefined :: SetResizable ())
data GetResizable a
getResizable :: (FindOp a (GetResizable ()) (Match r), Op (GetResizable ()) r impl) => Ref a -> impl
getResizable = dispatch (undefined :: GetResizable ())
data AddResizable a
addResizable :: (FindOp a (AddResizable ()) (Match r), Op (AddResizable ()) r impl) => Ref a -> impl
addResizable = dispatch (undefined :: AddResizable ())
data InitSizes a
initSizes :: (FindOp a (InitSizes ()) (Match r), Op (InitSizes ()) r impl) => Ref a -> impl
initSizes = dispatch (undefined :: InitSizes ())
data Children a
children :: (FindOp a (Children ()) (Match r), Op (Children ()) r impl) => Ref a -> impl
children = dispatch (undefined :: Children ())
data SetClipChildren a
setClipChildren :: (FindOp a (SetClipChildren ()) (Match r), Op (SetClipChildren ()) r impl) => Ref a -> impl
setClipChildren = dispatch (undefined :: SetClipChildren ())
data ClipChildren a
clipChildren :: (FindOp a (ClipChildren ()) (Match r), Op (ClipChildren ()) r impl) => Ref a -> impl
clipChildren = dispatch (undefined :: ClipChildren ())
data Focus a
focus :: (FindOp a (Focus ()) (Match r), Op (Focus ()) r impl) => Ref a -> impl
focus = dispatch (undefined :: Focus ())
data DdfdesignKludge a
ddfdesignKludge :: (FindOp a (DdfdesignKludge ()) (Match r), Op (DdfdesignKludge ()) r impl) => Ref a -> impl
ddfdesignKludge = dispatch (undefined :: DdfdesignKludge ())
data InsertWithBefore a
insertWithBefore :: (FindOp a (InsertWithBefore ()) (Match r), Op (InsertWithBefore ()) r impl) => Ref a -> impl
insertWithBefore = dispatch (undefined :: InsertWithBefore ())
data GetArray a
getArray :: (FindOp a (GetArray ()) (Match r), Op (GetArray ()) r impl) => Ref a -> impl
getArray = dispatch (undefined :: GetArray ())
data GetChild a
getChild :: (FindOp a (GetChild ()) (Match r), Op (GetChild ()) r impl) => Ref a -> impl
getChild = dispatch (undefined :: GetChild ())

data CTable fs parent
type Table = CTable () Group
data CWindow fs parent
type Window =
    CWindow
      (Destroy
      (DrawSuper
      (HandleSuper
      (Resize
      (ResizeSuper
      (ShowWidget
      (ShowWidgetSuper
      (AsGlWindow
      (AsGlWindowSuper
      (AsGroupSuper
      (FlushSuper
      (AsWindowSuper
      (AsWindow
      (Changed
      (MakeFullscreen
      (FullscreenOff
      (SetBorder
      (ClearBorder
      (GetBorder
      (SetOverride
      (GetOverride
      (SetModal
      (GetModal
      (SetNonModal
      (NonModal
      (SetMenuWindow
      (GetMenuWindow
      (SetTooltipWindow
      (GetTooltipWindow
      (HotSpot
      (FreePosition
      (SizeRange
      (SizeRangeWithArgs
      (GetIconlabel
      (SetIconlabel
      (SetLabelWithIconlabel
      (GetXclass
      (SetXclass
      (GetIcon
      (SetIcon
      (Shown
      (Iconize
      (GetXRoot
      (GetYRoot
      (MakeCurrent
      (SetCursor
      (SetCursorWithFgBg
      (SetDefaultCursor
      (SetDefaultCursorWithFgBg
      (GetDecoratedW
      (GetDecoratedH
      (WaitForExpose
      ()))))))))))))))))))))))))))))))))))))))))))))))))))))
      Group
data CGlWindow fs parent
type GlWindow = CGlWindow () Window

data DrawSuper a
drawSuper :: (FindOp a (DrawSuper ()) (Match r), Op (DrawSuper ()) r impl) => Ref a -> impl
drawSuper = dispatch (undefined :: DrawSuper ())
data HandleSuper a
handleSuper :: (FindOp a (HandleSuper ()) (Match r), Op (HandleSuper ()) r impl) => Ref a -> impl
handleSuper = dispatch (undefined :: HandleSuper ())
data FlushSuper a
flushSuper :: (FindOp a (FlushSuper ()) (Match r), Op (FlushSuper ()) r impl) => Ref a -> impl
flushSuper = dispatch (undefined :: FlushSuper ())
data AsWindowSuper a
asWindowSuper :: (FindOp a (AsWindowSuper ()) (Match r), Op (AsWindowSuper ()) r impl) => Ref a -> impl
asWindowSuper = dispatch (undefined :: AsWindowSuper ())
data AsWindow a
asWindow :: (FindOp a (AsWindow ()) (Match r), Op (AsWindow ()) r impl) => Ref a -> impl
asWindow = dispatch (undefined :: AsWindow ())
data Changed a
changed :: (FindOp a (Changed ()) (Match r), Op (Changed ()) r impl) => Ref a -> impl
changed = dispatch (undefined :: Changed ())
data MakeFullscreen a
makeFullscreen :: (FindOp a (MakeFullscreen ()) (Match r), Op (MakeFullscreen ()) r impl) => Ref a -> impl
makeFullscreen = dispatch (undefined :: MakeFullscreen ())
data FullscreenOff a
fullscreenOff :: (FindOp a (FullscreenOff ()) (Match r), Op (FullscreenOff ()) r impl) => Ref a -> impl
fullscreenOff = dispatch (undefined :: FullscreenOff ())
data SetBorder a
setBorder :: (FindOp a (SetBorder ()) (Match r), Op (SetBorder ()) r impl) => Ref a -> impl
setBorder = dispatch (undefined :: SetBorder ())
data ClearBorder a
clearBorder :: (FindOp a (ClearBorder ()) (Match r), Op (ClearBorder ()) r impl) => Ref a -> impl
clearBorder = dispatch (undefined :: ClearBorder ())
data GetBorder a
getBorder :: (FindOp a (GetBorder ()) (Match r), Op (GetBorder ()) r impl) => Ref a -> impl
getBorder = dispatch (undefined :: GetBorder ())
data SetOverride a
setOverride :: (FindOp a (SetOverride ()) (Match r), Op (SetOverride ()) r impl) => Ref a -> impl
setOverride = dispatch (undefined :: SetOverride ())
data GetOverride a
getOverride :: (FindOp a (GetOverride ()) (Match r), Op (GetOverride ()) r impl) => Ref a -> impl
getOverride = dispatch (undefined :: GetOverride ())
data SetModal a
setModal :: (FindOp a (SetModal ()) (Match r), Op (SetModal ()) r impl) => Ref a -> impl
setModal = dispatch (undefined :: SetModal ())
data GetModal a
getModal :: (FindOp a (GetModal ()) (Match r), Op (GetModal ()) r impl) => Ref a -> impl
getModal = dispatch (undefined :: GetModal ())
data SetNonModal a
setNonModal :: (FindOp a (SetNonModal ()) (Match r), Op (SetNonModal ()) r impl) => Ref a -> impl
setNonModal = dispatch (undefined :: SetNonModal ())
data NonModal a
nonModal :: (FindOp a (NonModal ()) (Match r), Op (NonModal ()) r impl) => Ref a -> impl
nonModal = dispatch (undefined :: NonModal ())
data SetMenuWindow a
setMenuWindow :: (FindOp a (SetMenuWindow ()) (Match r), Op (SetMenuWindow ()) r impl) => Ref a -> impl
setMenuWindow = dispatch (undefined :: SetMenuWindow ())
data GetMenuWindow a
getMenuWindow :: (FindOp a (GetMenuWindow ()) (Match r), Op (GetMenuWindow ()) r impl) => Ref a -> impl
getMenuWindow = dispatch (undefined :: GetMenuWindow ())
data SetTooltipWindow a
setTooltipWindow :: (FindOp a (SetTooltipWindow ()) (Match r), Op (SetTooltipWindow ()) r impl) => Ref a -> impl
setTooltipWindow = dispatch (undefined :: SetTooltipWindow ())
data GetTooltipWindow a
getTooltipWindow :: (FindOp a (GetTooltipWindow ()) (Match r), Op (GetTooltipWindow ()) r impl) => Ref a -> impl
getTooltipWindow = dispatch (undefined :: GetTooltipWindow ())
data HotSpot a
hotSpot :: (FindOp a (HotSpot ()) (Match r), Op (HotSpot ()) r impl) => Ref a -> impl
hotSpot = dispatch (undefined :: HotSpot ())
data FreePosition a
freePosition :: (FindOp a (FreePosition ()) (Match r), Op (FreePosition ()) r impl) => Ref a -> impl
freePosition = dispatch (undefined :: FreePosition ())
data SizeRange a
sizeRange :: (FindOp a (SizeRange ()) (Match r), Op (SizeRange ()) r impl) => Ref a -> impl
sizeRange = dispatch (undefined :: SizeRange ())
data SizeRangeWithArgs a
sizeRangeWithArgs :: (FindOp a (SizeRangeWithArgs ()) (Match r), Op (SizeRangeWithArgs ()) r impl) => Ref a -> impl
sizeRangeWithArgs = dispatch (undefined :: SizeRangeWithArgs ())
data GetIconlabel a
getIconlabel :: (FindOp a (GetIconlabel ()) (Match r), Op (GetIconlabel ()) r impl) => Ref a -> impl
getIconlabel = dispatch (undefined :: GetIconlabel ())
data SetIconlabel a
setIconlabel :: (FindOp a (SetIconlabel ()) (Match r), Op (SetIconlabel ()) r impl) => Ref a -> impl
setIconlabel = dispatch (undefined :: SetIconlabel ())
data SetLabelWithIconlabel a
setLabelWithIconlabel :: (FindOp a (SetLabelWithIconlabel ()) (Match r), Op (SetLabelWithIconlabel ()) r impl) => Ref a -> impl
setLabelWithIconlabel = dispatch (undefined :: SetLabelWithIconlabel ())
data GetXclass a
getXclass :: (FindOp a (GetXclass ()) (Match r), Op (GetXclass ()) r impl) => Ref a -> impl
getXclass = dispatch (undefined :: GetXclass ())
data SetXclass a
setXclass :: (FindOp a (SetXclass ()) (Match r), Op (SetXclass ()) r impl) => Ref a -> impl
setXclass = dispatch (undefined :: SetXclass ())
data GetIcon a
getIcon :: (FindOp a (GetIcon ()) (Match r), Op (GetIcon ()) r impl) => Ref a -> impl
getIcon = dispatch (undefined :: GetIcon ())
data SetIcon a
setIcon :: (FindOp a (SetIcon ()) (Match r), Op (SetIcon ()) r impl) => Ref a -> impl
setIcon = dispatch (undefined :: SetIcon ())
data Shown a
shown :: (FindOp a (Shown ()) (Match r), Op (Shown ()) r impl) => Ref a -> impl
shown = dispatch (undefined :: Shown ())
data Iconize a
iconize :: (FindOp a (Iconize ()) (Match r), Op (Iconize ()) r impl) => Ref a -> impl
iconize = dispatch (undefined :: Iconize ())
data GetXRoot a
getXRoot :: (FindOp a (GetXRoot ()) (Match r), Op (GetXRoot ()) r impl) => Ref a -> impl
getXRoot = dispatch (undefined :: GetXRoot ())
data GetYRoot a
getYRoot :: (FindOp a (GetYRoot ()) (Match r), Op (GetYRoot ()) r impl) => Ref a -> impl
getYRoot = dispatch (undefined :: GetYRoot ())
data MakeCurrent a
makeCurrent :: (FindOp a (MakeCurrent ()) (Match r), Op (MakeCurrent ()) r impl) => Ref a -> impl
makeCurrent = dispatch (undefined :: MakeCurrent ())
data SetCursor a
setCursor :: (FindOp a (SetCursor ()) (Match r), Op (SetCursor ()) r impl) => Ref a -> impl
setCursor = dispatch (undefined :: SetCursor ())
data SetCursorWithFgBg a
setCursorWithFgBg :: (FindOp a (SetCursorWithFgBg ()) (Match r), Op (SetCursorWithFgBg ()) r impl) => Ref a -> impl
setCursorWithFgBg = dispatch (undefined :: SetCursorWithFgBg ())
data SetDefaultCursor a
setDefaultCursor :: (FindOp a (SetDefaultCursor ()) (Match r), Op (SetDefaultCursor ()) r impl) => Ref a -> impl
setDefaultCursor = dispatch (undefined :: SetDefaultCursor ())
data SetDefaultCursorWithFgBg a
setDefaultCursorWithFgBg :: (FindOp a (SetDefaultCursorWithFgBg ()) (Match r), Op (SetDefaultCursorWithFgBg ()) r impl) => Ref a -> impl
setDefaultCursorWithFgBg = dispatch (undefined :: SetDefaultCursorWithFgBg ())
data GetDecoratedW a
getDecoratedW :: (FindOp a (GetDecoratedW ()) (Match r), Op (GetDecoratedW ()) r impl) => Ref a -> impl
getDecoratedW = dispatch (undefined :: GetDecoratedW ())
data GetDecoratedH a
getDecoratedH :: (FindOp a (GetDecoratedH ()) (Match r), Op (GetDecoratedH ()) r impl) => Ref a -> impl
getDecoratedH = dispatch (undefined :: GetDecoratedH ())
data WaitForExpose a
waitForExpose :: (FindOp a (WaitForExpose ()) (Match r), Op (WaitForExpose ()) r impl) => Ref a -> impl
waitForExpose = dispatch (undefined :: WaitForExpose ())

data CSingleWindow fs parent
type SingleWindow =
    CSingleWindow
      (Destroy
      (DrawSuper
      (HandleSuper
      (ResizeSuper
      (ShowWidgetSuper
      (HideSuper
      (Hide
      (FlushSuper
      (AsWindowSuper
      (AsGlWindowSuper
      (AsGroupSuper
      (ShowWidget
      (Handle
      (Resize
      (AsWindow
      (AsGlWindow
      (AsGroup
      (MakeCurrent
      ()))))))))))))))))))
    Window

data CDoubleWindow fs parent
type DoubleWindow =
    CDoubleWindow
      (Destroy
      (DrawSuper
      (HandleSuper
      (ResizeSuper
      (ShowWidgetSuper
      (HideSuper
      (Hide
      (FlushSuper
      (AsWindowSuper
      (AsGlWindowSuper
      (AsGroupSuper
      (ShowWidget
      (Handle
      (Resize
      (AsWindow
      (AsGlWindow
      (AsGroup
      ())))))))))))))))))
    Window

data COverlayWindow fs parent
type OverlayWindow =
     COverlayWindow
       (Destroy
       (ShowWidget
       (Flush
       (Resize
       (Hide
       (CanDoOverlay
       (RedrawOverlay
       ())))))))
       DoubleWindow

data CanDoOverlay a
canDoOverlay :: (FindOp a (CanDoOverlay ()) (Match r), Op (CanDoOverlay ()) r impl) => Ref a -> impl
canDoOverlay = dispatch (undefined :: CanDoOverlay ())

data RedrawOverlay a
redrawOverlay :: (FindOp a (RedrawOverlay ()) (Match r), Op (RedrawOverlay ()) r impl) => Ref a -> impl
redrawOverlay = dispatch (undefined :: RedrawOverlay ())

data Flush a
flush :: (FindOp a (Flush ()) (Match r), Op (Flush ()) r impl) => Ref a -> impl
flush = dispatch (undefined :: Flush ())

data CButton fs parent
type Button =
    CButton
     (Destroy
     (DrawSuper
     (HandleSuper
     (Handle
     (AsGroupSuper
     (AsGroup
     (AsGlWindow
     (AsWindowSuper
     (AsWindow
     (ResizeSuper
     (Resize
     (HideSuper
     (Hide
     (ShowWidgetSuper
     (ShowWidget
     (GetValue
     (SetValue
     (Set
     (Clear
     (Setonly
     (GetShortcut
     (SetShortcut
     (GetDownBox
     (SetDownBox
     (GetDownColor
     (SetDownColor
     (DrawBox
     (DrawBackdrop
     (DrawFocus
     ())))))))))))))))))))))))))))))
     Widget

data GetValue a
getValue :: (FindOp a (GetValue ()) (Match r), Op (GetValue ()) r impl) => Ref a -> impl
getValue = dispatch (undefined :: GetValue ())
data SetValue a
setValue :: (FindOp a (SetValue ()) (Match r), Op (SetValue ()) r impl) => Ref a -> impl
setValue = dispatch (undefined :: SetValue ())
data Set a
set :: (FindOp a (Set ()) (Match r), Op (Set ()) r impl) => Ref a -> impl
set = dispatch (undefined :: Set ())
data Setonly a
setonly :: (FindOp a (Setonly ()) (Match r), Op (Setonly ()) r impl) => Ref a -> impl
setonly = dispatch (undefined :: Setonly ())
data GetShortcut a
getShortcut :: (FindOp a (GetShortcut ()) (Match r), Op (GetShortcut ()) r impl) => Ref a -> impl
getShortcut = dispatch (undefined :: GetShortcut ())
data SetShortcut a
setShortcut :: (FindOp a (SetShortcut ()) (Match r), Op (SetShortcut ()) r impl) => Ref a -> impl
setShortcut = dispatch (undefined :: SetShortcut ())
data GetDownBox a
getDownBox :: (FindOp a (GetDownBox ()) (Match r), Op (GetDownBox ()) r impl) => Ref a -> impl
getDownBox = dispatch (undefined :: GetDownBox ())
data SetDownBox a
setDownBox :: (FindOp a (SetDownBox ()) (Match r), Op (SetDownBox ()) r impl) => Ref a -> impl
setDownBox = dispatch (undefined :: SetDownBox ())
data GetDownColor a
getDownColor :: (FindOp a (GetDownColor ()) (Match r), Op (GetDownColor ()) r impl) => Ref a -> impl
getDownColor = dispatch (undefined :: GetDownColor ())
data SetDownColor a
setDownColor :: (FindOp a (SetDownColor ()) (Match r), Op (SetDownColor ()) r impl) => Ref a -> impl
setDownColor = dispatch (undefined :: SetDownColor ())

data CLightButton fs parent
type LightButton =
    CLightButton (Destroy ()) Button

data CCheckButton fs parent
type CheckButton =
    CCheckButton (Destroy ()) Button

data CReturnButton fs parent
type ReturnButton =
    CReturnButton
      (Destroy
      (Handle ()))
      Button

data CRoundButton fs parent
type RoundButton =
    CRoundButton (Destroy ()) Button

data CRepeatButton fs parent
type RepeatButton =
    CRepeatButton
     (Destroy
     (Handle
     (Deactivate
      ())))
     Button

data CToggleButton fs parent
type ToggleButton =
    CToggleButton (Destroy ()) Button

data CValuator fs parent
type Valuator =
    CValuator
     (Destroy
     (Handle
     (AsGlWindowSuper
     (AsGlWindow
     (ResizeSuper
     (Resize
     (GetBounds
     (GetMinimum
     (SetMinimum
     (GetMaximum
     (SetMaximum
     (GetRange
     (SetStep
     (GetStep
     (Precision
     (GetValue
     (SetValue
     (Format
     (Round
     (Clamp
     (Increment
     ())))))))))))))))))))))
     Widget

data GetBounds a
getBounds :: (FindOp a (GetBounds ()) (Match r), Op (GetBounds ()) r impl) => Ref a -> impl
getBounds = dispatch (undefined :: GetBounds())
data GetMinimum a
getMinimum :: (FindOp a (GetMinimum ()) (Match r), Op (GetMinimum ()) r impl) => Ref a -> impl
getMinimum = dispatch (undefined :: GetMinimum())
data SetMinimum a
setMinimum :: (FindOp a (SetMinimum ()) (Match r), Op (SetMinimum ()) r impl) => Ref a -> impl
setMinimum = dispatch (undefined :: SetMinimum())
data GetMaximum a
getMaximum :: (FindOp a (GetMaximum ()) (Match r), Op (GetMaximum ()) r impl) => Ref a -> impl
getMaximum = dispatch (undefined :: GetMaximum())
data SetMaximum a
setMaximum :: (FindOp a (SetMaximum ()) (Match r), Op (SetMaximum ()) r impl) => Ref a -> impl
setMaximum = dispatch (undefined :: SetMaximum())
data GetRange a
getRange :: (FindOp a (GetRange ()) (Match r), Op (GetRange ()) r impl) => Ref a -> impl
getRange = dispatch (undefined :: GetRange())
data SetStep a
setStep :: (FindOp a (SetStep ()) (Match r), Op (SetStep ()) r impl) => Ref a -> impl
setStep = dispatch (undefined :: SetStep())
data GetStep a
getStep :: (FindOp a (GetStep ()) (Match r), Op (GetStep ()) r impl) => Ref a -> impl
getStep = dispatch (undefined :: GetStep())
data Precision a
precision :: (FindOp a (Precision ()) (Match r), Op (Precision ()) r impl) => Ref a -> impl
precision = dispatch (undefined :: Precision())
data Format a
format :: (FindOp a (Format ()) (Match r), Op (Format ()) r impl) => Ref a -> impl
format = dispatch (undefined :: Format())
data Round a
round :: (FindOp a (Round ()) (Match r), Op (Round ()) r impl) => Ref a -> impl
round = dispatch (undefined :: Round())
data Clamp a
clamp :: (FindOp a (Clamp ()) (Match r), Op (Clamp ()) r impl) => Ref a -> impl
clamp = dispatch (undefined :: Clamp())
data Increment a
increment :: (FindOp a (Increment ()) (Match r), Op (Increment ()) r impl) => Ref a -> impl
increment = dispatch (undefined :: Increment())

data CSlider fs parent
type Slider =
  CSlider
    (Destroy
    (Scrollvalue
    (SetSliderSize
    (GetSliderSize
    (GetSlider
    (SetSlider
    ()))))))
    Widget

data Scrollvalue a
scrollvalue :: (FindOp a (Scrollvalue ()) (Match r), Op (Scrollvalue ()) r impl) => Ref a -> impl
scrollvalue = dispatch (undefined :: Scrollvalue ())
data SetSliderSize a
setSliderSize :: (FindOp a (SetSliderSize ()) (Match r), Op (SetSliderSize ()) r impl) => Ref a -> impl
setSliderSize = dispatch (undefined :: SetSliderSize ())
data GetSliderSize a
getSliderSize :: (FindOp a (GetSliderSize ()) (Match r), Op (GetSliderSize ()) r impl) => Ref a -> impl
getSliderSize = dispatch (undefined :: GetSliderSize ())
data GetSlider a
getSlider :: (FindOp a (GetSlider ()) (Match r), Op (GetSlider ()) r impl) => Ref a -> impl
getSlider = dispatch (undefined :: GetSlider ())
data SetSlider a
setSlider :: (FindOp a (SetSlider ()) (Match r), Op (SetSlider ()) r impl) => Ref a -> impl
setSlider = dispatch (undefined :: SetSlider ())

data CFillSlider fs parent
type FillSlider =
  CFillSlider
    ()
    Widget

data CHorSlider fs parent
type HorSlider =
  CHorSlider
    ()
    Widget

data CHorFillSlider fs parent
type HorFillSlider =
  CHorFillSlider
    ()
    Widget

data CNiceSlider fs parent
type NiceSlider =
  CNiceSlider
    ()
    Widget
data CHorNiceSlider fs parent
type HorNiceSlider =
  CHorNiceSlider
    ()
    Widget
