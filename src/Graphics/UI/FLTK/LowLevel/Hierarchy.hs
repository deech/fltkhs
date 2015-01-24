{-# LANGUAGE TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FunctionalDependencies, TypeFamilies, GADTs, FlexibleContexts, ScopedTypeVariables, EmptyDataDecls #-}
module Graphics.UI.FLTK.LowLevel.Hierarchy
       (
         -- * Region
         Region,
         -- * GlContext
         GlContext,
         -- * Widget
         Widget,
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
         GetRectangle,
         getRectangle,
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
         GetSelectionColor,
         getSelectionColor,
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
         -- * RadioLightButton
         RadioLightButton,
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
         Bounds,
         bounds,
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
         -- * MenuItem
         MenuItem,
         NextWithStep,
         nextWithStep,
         Next,
         next,
         GetFirst,
         getFirst,
         SetLabelWithLabeltype,
         setLabelWithLabeltype,
         Submenu,
         submenu,
         Checkbox,
         checkbox,
         Radio,
         radio,
         Visible,
         visible,
         Activevisible,
         activevisible,
         Measure,
         measure,
         DrawWithT,
         drawWithT,
         Draw,
         draw,
         GetFlags,
         getFlags,
         SetFlags,
         setFlags,
         GetText,
         getText,
         Pulldown,
         pulldown,
         Popup,
         popup,
         TestShortcut,
         testShortcut,
         FindShortcut,
         findShortcut,
         DoCallback,
         doCallback,
         GetSize,
         getSize,
         -- * MenuPrim
         MenuPrim,
         ItemPathname,
         itemPathname,
         Picked,
         picked,
         FindIndex,
         findIndex,
         Global,
         global,
         GetMenu,
         getMenu,
         SetMenu,
         setMenu,
         AddName,
         addName,
         Copy,
         copy,
         SetSize,
         setSize,
         ClearSubmenu,
         clearSubmenu,
         Replace,
         replace,
         Remove,
         remove,
         SetMode,
         setMode,
         GetMode,
         getMode,
         Mvalue,
         mvalue,
         GetTextWithIndex,
         getTextWithIndex,
         GetTextfont,
         getTextfont,
         SetTextfont,
         setTextfont,
         GetTextsize,
         getTextsize,
         SetTextsize,
         setTextsize,
         GetTextcolor,
         getTextcolor,
         SetTextcolor,
         setTextcolor,
         DownBox,
         downBox,
         -- * SysMenuBar
         SysMenuBar,
         -- * Choice,
         Choice,
         -- * MenuButton
         MenuButton,
         -- * Image
         Image,
         GetD,
         getD,
         GetLd,
         getLd,
         GetCount,
         getCount,
         ColorAverage,
         colorAverage,
         Inactive,
         inactive,
         Desaturate,
         desaturate,
         DrawResize,
         drawResize,
         Uncache,
         uncache,
         -- * Bitmap
         Bitmap,
         -- * Pixmap
         Pixmap,
         -- * CopySurface
         CopySurface,
         ClassName,
         className,
         SetCurrent,
         setCurrent,
         -- * ImageSurface
         ImageSurface,
         -- * Adjuster
         Adjuster,
         SetSoft,
         setSoft,
         GetSoft,
         getSoft,
         -- * Dial
         Dial,
         GetAngle1,
         getAngle1,
         SetAngle1,
         setAngle1,
         GetAngle2,
         getAngle2,
         SetAngle2,
         setAngle2,
         SetAngles,
         setAngles,
         -- * FillDial
         FillDial,
         -- * LineDial
         LineDial,
         -- * Roller
         Roller,
         -- * Counter
         Counter,
         SetLstep,
         setLstep,
         -- * SimpleCounter
         SimpleCounter,
         -- * Scrollbar
         Scrollbar,
         SetLinesize,
         setLinesize,
         GetLinesize,
         getLinesize,
         -- * ValueSlider
         ValueSlider,
         -- * HorValueSlider
         HorValueSlider,
         -- * Input
         Input,
         StaticValue,
         staticValue,
         Index,
         index,
         GetMaximumSize,
         getMaximumSize,
         SetMaximumSize,
         setMaximumSize,
         GetPosition,
         getPosition,
         GetMark,
         getMark,
         SetPosition,
         setPosition,
         SetMark,
         setMark,
         Cut,
         cut,
         CutFromCursor,
         cutFromCursor,
         CutRange,
         cutRange,
         InsertWithLength,
         insertWithLength,
         Undo,
         undo,
         CopyCuts,
         copyCuts,
         GetCursorColor,
         getCursorColor,
         SetCursorColor,
         setCursorColor,
         GetInputType,
         getInputType,
         SetInputType,
         setInputType,
         GetReadonly,
         getReadonly,
         SetReadonly,
         setReadonly,
         GetWrap,
         getWrap,
         SetWrap,
         setWrap,
         GetTabNav,
         getTabNav,
         SetTabNav,
         setTabNav,
         -- * ValueInput
         ValueInput,
         -- * ValueOutput
         ValueOutput,
         -- * Timer
         Timer,
         GetDirection,
         getDirection,
         SetDirection,
         setDirection,
         GetSuspended,
         getSuspended,
         SetSuspended,
         setSuspended,
         -- * HiddenTimer
         HiddenTimer,
         -- * ValueTimer
         ValueTimer,
         -- * Progress
         Progress,
         -- * Positioner
         Positioner,
         SetXvalue,
         setXvalue,
         GetXvalue,
         getXvalue,
         SetYvalue,
         setYvalue,
         GetYvalue,
         getYvalue,
         SetXminimum,
         setXminimum,
         GetXminimum,
         getXminimum,
         SetYminimum,
         setYminimum,
         GetYminimum,
         getYminimum,
         SetXmaximum,
         setXmaximum,
         GetXmaximum,
         getXmaximum,
         SetYmaximum,
         setYmaximum,
         GetYmaximum,
         getYmaximum,
         SetXbounds,
         setXbounds,
         SetYbounds,
         setYbounds,
         SetXstep,
         setXstep,
         SetYstep,
         setYstep,
         -- * Wizard
         Wizard,
         Prev,
         prev,
         -- * Table
         Table,
         SetTableBox,
         setTableBox,
         GetTableBox,
         getTableBox,
         SetRows,
         setRows,
         GetRows,
         getRows,
         SetCols,
         setCols,
         GetCols,
         getCols,
         SetVisibleCells,
         setVisibleCells,
         IsInteractiveResize,
         isInteractiveResize,
         GetRowResize,
         getRowResize,
         SetRowResize,
         setRowResize,
         GetColResize,
         getColResize,
         SetColResize,
         setColResize,
         GetColResizeMin,
         getColResizeMin,
         SetColResizeMin,
         setColResizeMin,
         GetRowResizeMin,
         getRowResizeMin,
         SetRowResizeMin,
         setRowResizeMin,
         GetRowHeader,
         getRowHeader,
         SetRowHeader,
         setRowHeader,
         GetColHeader,
         getColHeader,
         SetColHeader,
         setColHeader,
         SetColHeaderHeight,
         setColHeaderHeight,
         GetColHeaderHeight,
         getColHeaderHeight,
         SetRowHeaderWidth,
         setRowHeaderWidth,
         GetRowHeaderWidth,
         getRowHeaderWidth,
         SetRowHeaderColor,
         setRowHeaderColor,
         GetRowHeaderColor,
         getRowHeaderColor,
         SetColHeaderColor,
         setColHeaderColor,
         GetColHeaderColor,
         getColHeaderColor,
         SetRowHeight,
         setRowHeight,
         GetRowHeight,
         getRowHeight,
         SetColWidth,
         setColWidth,
         GetColWidth,
         getColWidth,
         SetRowHeightAll,
         setRowHeightAll,
         SetColWidthAll,
         setColWidthAll,
         SetRowPosition,
         setRowPosition,
         SetColPosition,
         setColPosition,
         GetRowPosition,
         getRowPosition,
         GetColPosition,
         getColPosition,
         SetTopRow,
         setTopRow,
         GetTopRow,
         getTopRow,
         IsSelected,
         isSelected,
         GetSelection,
         getSelection,
         SetSelection,
         setSelection,
         MoveCursor,
         moveCursor,
         CallbackRow,
         callbackRow,
         CallbackCol,
         callbackCol,
         CallbackContext,
         callbackContext,
         FindCell,
         findCell,
         ClearSuper,
         clearSuper,
         SetRowsSuper,
         setRowsSuper,
         SetColsSuper,
         setColsSuper,
         -- * TableRow
         TableRow,
         GetType,
         getType,
         GetRowSelected,
         getRowSelected,
         SelectAllRows,
         selectAllRows,
         -- * GlWindow
         GlWindow,
         GetValid,
         getValid,
         SetValid,
         setValid,
         Invalidate,
         invalidate,
         GetContextValid,
         getContextValid,
         SetContextValid,
         setContextValid,
         CanDoWithM,
         canDoWithM,
         CanDo,
         canDo,
         GetContext,
         getContext,
         SetContext,
         setContext,
         SetContextWithDestroyFlag,
         setContextWithDestroyFlag,
         SwapBuffers,
         swapBuffers,
         Ortho,
         ortho,
         HideOverlay,
         hideOverlay,
         MakeOverlayCurrent,
         makeOverlayCurrent,
         -- * Box
         Box,
         -- * Browser
         Browser,
         Move,
         move,
         Load,
         load,
         Swap,
         swap,
         GetTopline,
         getTopline,
         Lineposition,
         lineposition,
         SetTopline,
         setTopline,
         SetBottomline,
         setBottomline,
         SetMiddleline,
         setMiddleline,
         Select,
         select,
         Selected,
         selected,
         ShowWidgetLine,
         showWidgetLine,
         HideLine,
         hideLine,
         SetText,
         setText,
         GetFormatChar,
         getFormatChar,
         SetFormatChar,
         setFormatChar,
         GetColumnChar,
         getColumnChar,
         SetColumnChar,
         setColumnChar,
         GetColumnWidths,
         getColumnWidths,
         SetColumnWidths,
         setColumnWidths,
         Displayed,
         displayed,
         MakeVisible,
         makeVisible,
         RemoveIcon,
         removeIcon,
         SelectOnly,
         selectOnly,
         SelectOnlyAndCallback,
         selectOnlyAndCallback,
         Deselect,
         deselect,
         DeselectAndCallback,
         deselectAndCallback,
         GetHposition,
         getHposition,
         SetHposition,
         setHposition,
         GetHasScrollbar,
         getHasScrollbar,
         SetHasScrollbar,
         setHasScrollbar,
         GetScrollbarSize,
         getScrollbarSize,
         SetScrollbarSize,
         setScrollbarSize,
         GetScrollbarWidth,
         getScrollbarWidth,
         SetScrollbarWidth,
         setScrollbarWidth,
         Sort,
         sort,
         SortWithSortType,
         sortWithSortType,
         -- * SelectBrowser
         SelectBrowser,
         -- * IntInput
         IntInput,
         -- * Clock
         Clock,
         GetValueSinceEpoch,
         getValueSinceEpoch,
         -- * TreePrefs
         TreePrefs,
         GetItemLabelfont,
         getItemLabelfont,
         GetItemLabelsize,
         getItemLabelsize,
         SetItemLabelsize,
         setItemLabelsize,
         SetItemLabelfgcolor,
         setItemLabelfgcolor,
         GetItemLabelbgcolor,
         getItemLabelbgcolor,
         SetItemLabelbgcolor,
         setItemLabelbgcolor,
         GetLabelfgcolor,
         getLabelfgcolor,
         SetLabelfgcolor,
         setLabelfgcolor,
         GetLabelbgcolor,
         getLabelbgcolor,
         SetLabelbgcolor,
         setLabelbgcolor,
         GetMarginleft,
         getMarginleft,
         SetMarginleft,
         setMarginleft,
         GetMargintop,
         getMargintop,
         SetMargintop,
         setMargintop,
         GetOpenchildMarginbottom,
         getOpenchildMarginbottom,
         SetOpenchildMarginbottom,
         setOpenchildMarginbottom,
         GetUsericonmarginleft,
         getUsericonmarginleft,
         SetUsericonmarginleft,
         setUsericonmarginleft,
         GetLabelmarginleft,
         getLabelmarginleft,
         SetLabelmarginleft,
         setLabelmarginleft,
         GetLinespacing,
         getLinespacing,
         SetLinespacing,
         setLinespacing,
         GetConnectorcolor,
         getConnectorcolor,
         SetConnectorcolor,
         setConnectorcolor,
         GetConnectorstyle,
         getConnectorstyle,
         SetConnectorstyle,
         setConnectorstyle,
         GetConnectorwidth,
         getConnectorwidth,
         SetConnectorwidth,
         setConnectorwidth,
         GetOpenicon,
         getOpenicon,
         SetOpenicon,
         setOpenicon,
         GetCloseicon,
         getCloseicon,
         SetCloseicon,
         setCloseicon,
         GetUsericon,
         getUsericon,
         SetUsericon,
         setUsericon,
         GetShowcollapse,
         getShowcollapse,
         SetShowcollapse,
         setShowcollapse,
         GetSortorder,
         getSortorder,
         SetSortorder,
         setSortorder,
         GetSelectbox,
         getSelectbox,
         SetSelectbox,
         setSelectbox,
         GetShowroot,
         getShowroot,
         SetShowroot,
         setShowroot,
         GetSelectmode,
         getSelectmode,
         SetSelectmode,
         setSelectmode,
         -- * TreeItem
         TreeItem,
         ShowSelf,
         showSelf,
         SetWidget,
         setWidget,
         GetWidget,
         getWidget,
         Child,
         child,
         HasChildren,
         hasChildren,
         FindChild,
         findChild,
         RemoveChild,
         removeChild,
         ClearChildren,
         clearChildren,
         SwapChildren,
         swapChildren,
         SwapChildrenByTreeItem,
         swapChildrenByTreeItem,
         FindInChildren,
         findInChildren,
         FindItem,
         findItem,
         AddAt,
         addAt,
         InsertAbove,
         insertAbove,
         Deparent,
         deparent,
         Reparent,
         reparent,
         MoveTo,
         moveTo,
         GetDepth,
         getDepth,
         NextSibling,
         nextSibling,
         PrevSibling,
         prevSibling,
         UpdatePrevNext,
         updatePrevNext,
         NextDisplayed,
         nextDisplayed,
         PrevDisplayed,
         prevDisplayed,
         Open,
         open,
         Close,
         close,
         IsOpen,
         isOpen,
         IsClose,
         isClose,
         OpenToggle,
         openToggle,
         SelectWithVal,
         selectWithVal,
         SelectToggle,
         selectToggle,
         SelectAll,
         selectAll,
         DeselectAll,
         deselectAll,
         ActivateWithVal,
         activateWithVal,
         IsActive,
         isActive,
         IsVisible,
         isVisible,
         VisibleR,
         visibleR,
         FindClicked,
         findClicked,
         EventOnCollapseIcon,
         eventOnCollapseIcon,
         EventOnLabel,
         eventOnLabel,
         IsRoot,
         isRoot,
         LabelX,
         labelX,
         LabelY,
         labelY,
         LabelW,
         labelW,
         LabelH,
         labelH
       )
where
import Prelude hiding (round)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch

-- * Region
data CRegion parent
type Region = CRegion Base
instance Functions Region ()

-- * GlContext
data CGlContext parent
type GlContext = CGlContext Base
instance Functions GlContext ()

-- * Widget
data CWidget parent
type Widget = CWidget Base
type WidgetFuncs =
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
  (GetRectangle
  (SetAlign
  (GetAlign
  (GetBox
  (SetBox
  (GetColor
  (SetColor
  (SetColorWithBgSel
  (GetSelectionColor
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
  (ResizeSuper
  (Resize
  (SetCallback
  (DrawBox
  (DrawBoxWithBoxtype
  (DrawBackdrop
  (DrawFocus
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
instance Functions Widget WidgetFuncs

data Destroy a
destroy :: (FindOp a (Destroy ()) (Match r), Op (Destroy ()) r a impl) => Ref a -> impl
destroy = dispatch (undefined :: Destroy ())
data Handle a
handle :: (FindOp a (Handle ()) (Match r), Op (Handle ()) r a impl) => Ref a -> impl
handle = dispatch (undefined :: Handle ())
data GetParent a
getParent :: (FindOp a (GetParent ()) (Match r), Op (GetParent ()) r a impl) => Ref a -> impl
getParent = dispatch (undefined :: GetParent ())
data SetParent a
setParent :: (FindOp a (SetParent ()) (Match r), Op (SetParent ()) r a impl) => Ref a -> impl
setParent = dispatch (undefined :: SetParent ())
data GetType_ a
getType_:: (FindOp a (GetType_ ()) (Match r), Op (GetType_ ()) r a impl) => Ref a -> impl
getType_= dispatch (undefined :: GetType_ ())
data SetType a
setType :: (FindOp a (SetType ()) (Match r), Op (SetType ()) r a impl) => Ref a -> impl
setType = dispatch (undefined :: SetType ())
data DrawLabel a
drawLabel :: (FindOp a (DrawLabel ()) (Match r), Op (DrawLabel ()) r a impl) => Ref a -> impl
drawLabel = dispatch (undefined :: DrawLabel ())
data GetX a
getX :: (FindOp a (GetX ()) (Match r), Op (GetX ()) r a impl) => Ref a -> impl
getX = dispatch (undefined :: GetX ())
data GetY a
getY :: (FindOp a (GetY ()) (Match r), Op (GetY ()) r a impl) => Ref a -> impl
getY = dispatch (undefined :: GetY ())
data GetW a
getW :: (FindOp a (GetW ()) (Match r), Op (GetW ()) r a impl) => Ref a -> impl
getW = dispatch (undefined :: GetW ())
data GetH a
getH :: (FindOp a (GetH ()) (Match r), Op (GetH ()) r a impl) => Ref a -> impl
getH = dispatch (undefined :: GetH ())
data GetRectangle a
getRectangle :: (FindOp a (GetRectangle ()) (Match r), Op (GetRectangle ()) r a impl) => Ref a -> impl
getRectangle = dispatch (undefined :: GetRectangle ())
data SetAlign a
setAlign :: (FindOp a (SetAlign ()) (Match r), Op (SetAlign ()) r a impl) => Ref a -> impl
setAlign = dispatch (undefined :: SetAlign ())
data GetAlign a
getAlign :: (FindOp a (GetAlign ()) (Match r), Op (GetAlign ()) r a impl) => Ref a -> impl
getAlign = dispatch (undefined :: GetAlign ())
data GetBox a
getBox :: (FindOp a (GetBox ()) (Match r), Op (GetBox ()) r a impl) => Ref a -> impl
getBox = dispatch (undefined :: GetBox ())
data SetBox a
setBox :: (FindOp a (SetBox ()) (Match r), Op (SetBox ()) r a impl) => Ref a -> impl
setBox = dispatch (undefined :: SetBox ())
data GetColor a
getColor :: (FindOp a (GetColor ()) (Match r), Op (GetColor ()) r a impl) => Ref a -> impl
getColor = dispatch (undefined :: GetColor ())
data SetColor a
setColor :: (FindOp a (SetColor ()) (Match r), Op (SetColor ()) r a impl) => Ref a -> impl
setColor = dispatch (undefined :: SetColor ())
data SetColorWithBgSel a
setColorWithBgSel :: (FindOp a (SetColorWithBgSel ()) (Match r), Op (SetColorWithBgSel ()) r a impl) => Ref a -> impl
setColorWithBgSel = dispatch (undefined :: SetColorWithBgSel ())
data GetSelectionColor a
getSelectionColor :: (FindOp a (GetSelectionColor ()) (Match r), Op (GetSelectionColor ()) r a impl) => Ref a -> impl
getSelectionColor = dispatch (undefined :: GetSelectionColor ())
data SetSelectionColor a
setSelectionColor :: (FindOp a (SetSelectionColor ()) (Match r), Op (SetSelectionColor ()) r a impl) => Ref a -> impl
setSelectionColor = dispatch (undefined :: SetSelectionColor ())
data GetLabel a
getLabel :: (FindOp a (GetLabel ()) (Match r), Op (GetLabel ()) r a impl) => Ref a -> impl
getLabel = dispatch (undefined :: GetLabel ())
data CopyLabel a
copyLabel :: (FindOp a (CopyLabel ()) (Match r), Op (CopyLabel ()) r a impl) => Ref a -> impl
copyLabel = dispatch (undefined :: CopyLabel ())
data SetLabel a
setLabel :: (FindOp a (SetLabel ()) (Match r), Op (SetLabel ()) r a impl) => Ref a -> impl
setLabel = dispatch (undefined :: SetLabel ())
data GetLabeltype a
getLabeltype :: (FindOp a (GetLabeltype ()) (Match r), Op (GetLabeltype ()) r a impl) => Ref a -> impl
getLabeltype = dispatch (undefined :: GetLabeltype ())
data SetLabeltype a
setLabeltype :: (FindOp a (SetLabeltype ()) (Match r), Op (SetLabeltype ()) r a impl) => Ref a -> impl
setLabeltype = dispatch (undefined :: SetLabeltype ())
data GetLabelcolor a
getLabelcolor :: (FindOp a (GetLabelcolor ()) (Match r), Op (GetLabelcolor ()) r a impl) => Ref a -> impl
getLabelcolor = dispatch (undefined :: GetLabelcolor ())
data SetLabelcolor a
setLabelcolor :: (FindOp a (SetLabelcolor ()) (Match r), Op (SetLabelcolor ()) r a impl) => Ref a -> impl
setLabelcolor = dispatch (undefined :: SetLabelcolor ())
data GetLabelfont a
getLabelfont :: (FindOp a (GetLabelfont ()) (Match r), Op (GetLabelfont ()) r a impl) => Ref a -> impl
getLabelfont = dispatch (undefined :: GetLabelfont ())
data SetLabelfont a
setLabelfont :: (FindOp a (SetLabelfont ()) (Match r), Op (SetLabelfont ()) r a impl) => Ref a -> impl
setLabelfont = dispatch (undefined :: SetLabelfont ())
data GetLabelsize a
getLabelsize :: (FindOp a (GetLabelsize ()) (Match r), Op (GetLabelsize ()) r a impl) => Ref a -> impl
getLabelsize = dispatch (undefined :: GetLabelsize ())
data SetLabelsize a
setLabelsize :: (FindOp a (SetLabelsize ()) (Match r), Op (SetLabelsize ()) r a impl) => Ref a -> impl
setLabelsize = dispatch (undefined :: SetLabelsize ())
data GetImage a
getImage :: (FindOp a (GetImage ()) (Match r), Op (GetImage ()) r a impl) => Ref a -> impl
getImage = dispatch (undefined :: GetImage ())
data SetImage a
setImage :: (FindOp a (SetImage ()) (Match r), Op (SetImage ()) r a impl) => Ref a -> impl
setImage = dispatch (undefined :: SetImage ())
data GetDeimage a
getDeimage :: (FindOp a (GetDeimage ()) (Match r), Op (GetDeimage ()) r a impl) => Ref a -> impl
getDeimage = dispatch (undefined :: GetDeimage ())
data SetDeimage a
setDeimage :: (FindOp a (SetDeimage ()) (Match r), Op (SetDeimage ()) r a impl) => Ref a -> impl
setDeimage = dispatch (undefined :: SetDeimage ())
data GetTooltip a
getTooltip :: (FindOp a (GetTooltip ()) (Match r), Op (GetTooltip ()) r a impl) => Ref a -> impl
getTooltip = dispatch (undefined :: GetTooltip ())
data CopyTooltip a
copyTooltip :: (FindOp a (CopyTooltip ()) (Match r), Op (CopyTooltip ()) r a impl) => Ref a -> impl
copyTooltip = dispatch (undefined :: CopyTooltip ())
data SetTooltip a
setTooltip :: (FindOp a (SetTooltip ()) (Match r), Op (SetTooltip ()) r a impl) => Ref a -> impl
setTooltip = dispatch (undefined :: SetTooltip ())
data GetWhen a
getWhen :: (FindOp a (GetWhen ()) (Match r), Op (GetWhen ()) r a impl) => Ref a -> impl
getWhen = dispatch (undefined :: GetWhen ())
data SetWhen a
setWhen :: (FindOp a (SetWhen ()) (Match r), Op (SetWhen ()) r a impl) => Ref a -> impl
setWhen = dispatch (undefined :: SetWhen ())
data GetVisible a
getVisible :: (FindOp a (GetVisible ()) (Match r), Op (GetVisible ()) r a impl) => Ref a -> impl
getVisible = dispatch (undefined :: GetVisible ())
data GetVisibleR a
getVisibleR :: (FindOp a (GetVisibleR ()) (Match r), Op (GetVisibleR ()) r a impl) => Ref a -> impl
getVisibleR = dispatch (undefined :: GetVisibleR ())
data ShowWidgetSuper a
showWidgetSuper :: (FindOp a (ShowWidgetSuper ()) (Match r), Op (ShowWidgetSuper ()) r a impl) => Ref a -> impl
showWidgetSuper = dispatch (undefined :: ShowWidgetSuper ())
data ShowWidget a
showWidget :: (FindOp a (ShowWidget ()) (Match r), Op (ShowWidget ()) r a impl) => Ref a -> impl
showWidget = dispatch (undefined :: ShowWidget ())
data HideSuper a
hideSuper :: (FindOp a (HideSuper ()) (Match r), Op (HideSuper ()) r a impl) => Ref a -> impl
hideSuper = dispatch (undefined :: HideSuper ())
data Hide a
hide :: (FindOp a (Hide ()) (Match r), Op (Hide ()) r a impl) => Ref a -> impl
hide = dispatch (undefined :: Hide ())
data SetVisible a
setVisible :: (FindOp a (SetVisible ()) (Match r), Op (SetVisible ()) r a impl) => Ref a -> impl
setVisible = dispatch (undefined :: SetVisible ())
data ClearVisible a
clearVisible :: (FindOp a (ClearVisible ()) (Match r), Op (ClearVisible ()) r a impl) => Ref a -> impl
clearVisible = dispatch (undefined :: ClearVisible ())
data Active a
active :: (FindOp a (Active ()) (Match r), Op (Active ()) r a impl) => Ref a -> impl
active = dispatch (undefined :: Active ())
data ActiveR a
activeR :: (FindOp a (ActiveR ()) (Match r), Op (ActiveR ()) r a impl) => Ref a -> impl
activeR = dispatch (undefined :: ActiveR ())
data Activate a
activate :: (FindOp a (Activate ()) (Match r), Op (Activate ()) r a impl) => Ref a -> impl
activate = dispatch (undefined :: Activate ())
data Deactivate a
deactivate :: (FindOp a (Deactivate ()) (Match r), Op (Deactivate ()) r a impl) => Ref a -> impl
deactivate = dispatch (undefined :: Deactivate ())
data GetOutput a
getOutput :: (FindOp a (GetOutput ()) (Match r), Op (GetOutput ()) r a impl) => Ref a -> impl
getOutput = dispatch (undefined :: GetOutput ())
data SetOutput a
setOutput :: (FindOp a (SetOutput ()) (Match r), Op (SetOutput ()) r a impl) => Ref a -> impl
setOutput = dispatch (undefined :: SetOutput ())
data ClearOutput a
clearOutput :: (FindOp a (ClearOutput ()) (Match r), Op (ClearOutput ()) r a impl) => Ref a -> impl
clearOutput = dispatch (undefined :: ClearOutput ())
data Takesevents a
takesevents :: (FindOp a (Takesevents ()) (Match r), Op (Takesevents ()) r a impl) => Ref a -> impl
takesevents = dispatch (undefined :: Takesevents ())
data SetChanged a
setChanged :: (FindOp a (SetChanged ()) (Match r), Op (SetChanged ()) r a impl) => Ref a -> impl
setChanged = dispatch (undefined :: SetChanged ())
data GetClearChanged a
getClearChanged :: (FindOp a (GetClearChanged ()) (Match r), Op (GetClearChanged ()) r a impl) => Ref a -> impl
getClearChanged = dispatch (undefined :: GetClearChanged ())
data TakeFocus a
takeFocus :: (FindOp a (TakeFocus ()) (Match r), Op (TakeFocus ()) r a impl) => Ref a -> impl
takeFocus = dispatch (undefined :: TakeFocus ())
data SetVisibleFocus a
setVisibleFocus :: (FindOp a (SetVisibleFocus ()) (Match r), Op (SetVisibleFocus ()) r a impl) => Ref a -> impl
setVisibleFocus = dispatch (undefined :: SetVisibleFocus ())
data ClearVisibleFocus a
clearVisibleFocus :: (FindOp a (ClearVisibleFocus ()) (Match r), Op (ClearVisibleFocus ()) r a impl) => Ref a -> impl
clearVisibleFocus = dispatch (undefined :: ClearVisibleFocus ())
data ModifyVisibleFocus a
modifyVisibleFocus :: (FindOp a (ModifyVisibleFocus ()) (Match r), Op (ModifyVisibleFocus ()) r a impl) => Ref a -> impl
modifyVisibleFocus = dispatch (undefined :: ModifyVisibleFocus ())
data GetVisibleFocus a
getVisibleFocus :: (FindOp a (GetVisibleFocus ()) (Match r), Op (GetVisibleFocus ()) r a impl) => Ref a -> impl
getVisibleFocus = dispatch (undefined :: GetVisibleFocus ())
data Contains a
contains :: (FindOp a (Contains ()) (Match r), Op (Contains ()) r a impl) => Ref a -> impl
contains = dispatch (undefined :: Contains ())
data Inside a
inside :: (FindOp a (Inside ()) (Match r), Op (Inside ()) r a impl) => Ref a -> impl
inside = dispatch (undefined :: Inside ())
data Redraw a
redraw :: (FindOp a (Redraw ()) (Match r), Op (Redraw ()) r a impl) => Ref a -> impl
redraw = dispatch (undefined :: Redraw ())
data RedrawLabel a
redrawLabel :: (FindOp a (RedrawLabel ()) (Match r), Op (RedrawLabel ()) r a impl) => Ref a -> impl
redrawLabel = dispatch (undefined :: RedrawLabel ())
data GetDamage a
getDamage :: (FindOp a (GetDamage ()) (Match r), Op (GetDamage ()) r a impl) => Ref a -> impl
getDamage = dispatch (undefined :: GetDamage ())
data ClearDamageWithBitmask a
clearDamageWithBitmask :: (FindOp a (ClearDamageWithBitmask ()) (Match r), Op (ClearDamageWithBitmask ()) r a impl) => Ref a -> impl
clearDamageWithBitmask = dispatch (undefined :: ClearDamageWithBitmask ())
data ClearDamage a
clearDamage :: (FindOp a (ClearDamage ()) (Match r), Op (ClearDamage ()) r a impl) => Ref a -> impl
clearDamage = dispatch (undefined :: ClearDamage ())
data GetDamageWithText a
getDamageWithText :: (FindOp a (GetDamageWithText ()) (Match r), Op (GetDamageWithText ()) r a impl) => Ref a -> impl
getDamageWithText = dispatch (undefined :: GetDamageWithText ())
data GetDamageInsideWidget a
getDamageInsideWidget :: (FindOp a (GetDamageInsideWidget ()) (Match r), Op (GetDamageInsideWidget ()) r a impl) => Ref a -> impl
getDamageInsideWidget = dispatch (undefined :: GetDamageInsideWidget ())
data MeasureLabel a
measureLabel :: (FindOp a (MeasureLabel ()) (Match r), Op (MeasureLabel ()) r a impl) => Ref a -> impl
measureLabel = dispatch (undefined :: MeasureLabel ())
data GetWindow a
getWindow :: (FindOp a (GetWindow ()) (Match r), Op (GetWindow ()) r a impl) => Ref a -> impl
getWindow = dispatch (undefined :: GetWindow ())
data GetTopWindow a
getTopWindow :: (FindOp a (GetTopWindow ()) (Match r), Op (GetTopWindow ()) r a impl) => Ref a -> impl
getTopWindow = dispatch (undefined :: GetTopWindow ())
data GetTopWindowOffset a
getTopWindowOffset :: (FindOp a (GetTopWindowOffset ()) (Match r), Op (GetTopWindowOffset ()) r a impl) => Ref a -> impl
getTopWindowOffset = dispatch (undefined :: GetTopWindowOffset ())
data ResizeSuper a
resizeSuper :: (FindOp a (ResizeSuper ()) (Match r), Op (ResizeSuper ()) r a impl) => Ref a -> impl
resizeSuper = dispatch (undefined :: ResizeSuper ())
data Resize a
resize :: (FindOp a (Resize ()) (Match r), Op (Resize ()) r a impl) => Ref a -> impl
resize = dispatch (undefined :: Resize ())
data SetCallback a
setCallback :: forall a r impl.(FindOp a (SetCallback ()) (Match r), Op (SetCallback ()) r a impl) => Ref a -> impl
setCallback = dispatch (undefined :: SetCallback ())
data DrawBox a
drawBox :: (FindOp a (DrawBox ()) (Match r), Op (DrawBox ()) r a impl) => Ref a -> impl
drawBox = dispatch (undefined :: DrawBox ())
data DrawBoxWithBoxtype a
drawBoxWithBoxtype :: (FindOp a (DrawBoxWithBoxtype ()) (Match r), Op (DrawBoxWithBoxtype ()) r a impl) => Ref a -> impl
drawBoxWithBoxtype = dispatch (undefined :: DrawBoxWithBoxtype ())
data DrawBackdrop a
drawBackdrop :: (FindOp a (DrawBackdrop ()) (Match r), Op (DrawBackdrop ()) r a impl) => Ref a -> impl
drawBackdrop = dispatch (undefined :: DrawBackdrop ())
data DrawFocus a
drawFocus :: (FindOp a (DrawFocus ()) (Match r), Op (DrawFocus ()) r a impl) => Ref a -> impl
drawFocus = dispatch (undefined :: DrawFocus ())

-- * Group
data CGroup parent
type Group = CGroup Widget
type GroupFuncs =
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
instance Functions Group GroupFuncs


data Begin a
begin :: (FindOp a (Begin ()) (Match r), Op (Begin ()) r a impl) => Ref a -> impl
begin = dispatch (undefined :: Begin ())
data End a
end :: (FindOp a (End ()) (Match r), Op (End ()) r a impl) => Ref a -> impl
end = dispatch (undefined :: End ())
data Find a
find :: (FindOp a (Find ()) (Match r), Op (Find ()) r a impl) => Ref a -> impl
find = dispatch (undefined :: Find ())
data Add a
add :: (FindOp a (Add ()) (Match r), Op (Add ()) r a impl) => Ref a -> impl
add = dispatch (undefined :: Add ())
data Insert a
insert :: (FindOp a (Insert ()) (Match r), Op (Insert ()) r a impl) => Ref a -> impl
insert = dispatch (undefined :: Insert ())
data RemoveIndex a
removeIndex :: (FindOp a (RemoveIndex ()) (Match r), Op (RemoveIndex ()) r a impl) => Ref a -> impl
removeIndex = dispatch (undefined :: RemoveIndex ())
data RemoveWidget a
removeWidget :: (FindOp a (RemoveWidget ()) (Match r), Op (RemoveWidget ()) r a impl) => Ref a -> impl
removeWidget = dispatch (undefined :: RemoveWidget ())
data Clear a
clear :: (FindOp a (Clear ()) (Match r), Op (Clear ()) r a impl) => Ref a -> impl
clear = dispatch (undefined :: Clear ())
data SetResizable a
setResizable :: (FindOp a (SetResizable ()) (Match r), Op (SetResizable ()) r a impl) => Ref a -> impl
setResizable = dispatch (undefined :: SetResizable ())
data GetResizable a
getResizable :: (FindOp a (GetResizable ()) (Match r), Op (GetResizable ()) r a impl) => Ref a -> impl
getResizable = dispatch (undefined :: GetResizable ())
data AddResizable a
addResizable :: (FindOp a (AddResizable ()) (Match r), Op (AddResizable ()) r a impl) => Ref a -> impl
addResizable = dispatch (undefined :: AddResizable ())
data InitSizes a
initSizes :: (FindOp a (InitSizes ()) (Match r), Op (InitSizes ()) r a impl) => Ref a -> impl
initSizes = dispatch (undefined :: InitSizes ())
data Children a
children :: (FindOp a (Children ()) (Match r), Op (Children ()) r a impl) => Ref a -> impl
children = dispatch (undefined :: Children ())
data SetClipChildren a
setClipChildren :: (FindOp a (SetClipChildren ()) (Match r), Op (SetClipChildren ()) r a impl) => Ref a -> impl
setClipChildren = dispatch (undefined :: SetClipChildren ())
data ClipChildren a
clipChildren :: (FindOp a (ClipChildren ()) (Match r), Op (ClipChildren ()) r a impl) => Ref a -> impl
clipChildren = dispatch (undefined :: ClipChildren ())
data Focus a
focus :: (FindOp a (Focus ()) (Match r), Op (Focus ()) r a impl) => Ref a -> impl
focus = dispatch (undefined :: Focus ())
data DdfdesignKludge a
ddfdesignKludge :: (FindOp a (DdfdesignKludge ()) (Match r), Op (DdfdesignKludge ()) r a impl) => Ref a -> impl
ddfdesignKludge = dispatch (undefined :: DdfdesignKludge ())
data InsertWithBefore a
insertWithBefore :: (FindOp a (InsertWithBefore ()) (Match r), Op (InsertWithBefore ()) r a impl) => Ref a -> impl
insertWithBefore = dispatch (undefined :: InsertWithBefore ())
data GetArray a
getArray :: (FindOp a (GetArray ()) (Match r), Op (GetArray ()) r a impl) => Ref a -> impl
getArray = dispatch (undefined :: GetArray ())
data GetChild a
getChild :: (FindOp a (GetChild ()) (Match r), Op (GetChild ()) r a impl) => Ref a -> impl
getChild = dispatch (undefined :: GetChild ())

data CWindow parent
type Window = CWindow Group
type WindowFuncs =
  (Destroy
      (DrawSuper
      (HandleSuper
      (Resize
      (ResizeSuper
      (ShowWidget
      (ShowWidgetSuper
      (FlushSuper
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
      ())))))))))))))))))))))))))))))))))))))))))))))))
instance Functions Window WindowFuncs

data DrawSuper a
drawSuper :: (FindOp a (DrawSuper ()) (Match r), Op (DrawSuper ()) r a impl) => Ref a -> impl
drawSuper = dispatch (undefined :: DrawSuper ())
data HandleSuper a
handleSuper :: (FindOp a (HandleSuper ()) (Match r), Op (HandleSuper ()) r a impl) => Ref a -> impl
handleSuper = dispatch (undefined :: HandleSuper ())
data FlushSuper a
flushSuper :: (FindOp a (FlushSuper ()) (Match r), Op (FlushSuper ()) r a impl) => Ref a -> impl
flushSuper = dispatch (undefined :: FlushSuper ())
data Changed a
changed :: (FindOp a (Changed ()) (Match r), Op (Changed ()) r a impl) => Ref a -> impl
changed = dispatch (undefined :: Changed ())
data MakeFullscreen a
makeFullscreen :: (FindOp a (MakeFullscreen ()) (Match r), Op (MakeFullscreen ()) r a impl) => Ref a -> impl
makeFullscreen = dispatch (undefined :: MakeFullscreen ())
data FullscreenOff a
fullscreenOff :: (FindOp a (FullscreenOff ()) (Match r), Op (FullscreenOff ()) r a impl) => Ref a -> impl
fullscreenOff = dispatch (undefined :: FullscreenOff ())
data SetBorder a
setBorder :: (FindOp a (SetBorder ()) (Match r), Op (SetBorder ()) r a impl) => Ref a -> impl
setBorder = dispatch (undefined :: SetBorder ())
data ClearBorder a
clearBorder :: (FindOp a (ClearBorder ()) (Match r), Op (ClearBorder ()) r a impl) => Ref a -> impl
clearBorder = dispatch (undefined :: ClearBorder ())
data GetBorder a
getBorder :: (FindOp a (GetBorder ()) (Match r), Op (GetBorder ()) r a impl) => Ref a -> impl
getBorder = dispatch (undefined :: GetBorder ())
data SetOverride a
setOverride :: (FindOp a (SetOverride ()) (Match r), Op (SetOverride ()) r a impl) => Ref a -> impl
setOverride = dispatch (undefined :: SetOverride ())
data GetOverride a
getOverride :: (FindOp a (GetOverride ()) (Match r), Op (GetOverride ()) r a impl) => Ref a -> impl
getOverride = dispatch (undefined :: GetOverride ())
data SetModal a
setModal :: (FindOp a (SetModal ()) (Match r), Op (SetModal ()) r a impl) => Ref a -> impl
setModal = dispatch (undefined :: SetModal ())
data GetModal a
getModal :: (FindOp a (GetModal ()) (Match r), Op (GetModal ()) r a impl) => Ref a -> impl
getModal = dispatch (undefined :: GetModal ())
data SetNonModal a
setNonModal :: (FindOp a (SetNonModal ()) (Match r), Op (SetNonModal ()) r a impl) => Ref a -> impl
setNonModal = dispatch (undefined :: SetNonModal ())
data NonModal a
nonModal :: (FindOp a (NonModal ()) (Match r), Op (NonModal ()) r a impl) => Ref a -> impl
nonModal = dispatch (undefined :: NonModal ())
data SetMenuWindow a
setMenuWindow :: (FindOp a (SetMenuWindow ()) (Match r), Op (SetMenuWindow ()) r a impl) => Ref a -> impl
setMenuWindow = dispatch (undefined :: SetMenuWindow ())
data GetMenuWindow a
getMenuWindow :: (FindOp a (GetMenuWindow ()) (Match r), Op (GetMenuWindow ()) r a impl) => Ref a -> impl
getMenuWindow = dispatch (undefined :: GetMenuWindow ())
data SetTooltipWindow a
setTooltipWindow :: (FindOp a (SetTooltipWindow ()) (Match r), Op (SetTooltipWindow ()) r a impl) => Ref a -> impl
setTooltipWindow = dispatch (undefined :: SetTooltipWindow ())
data GetTooltipWindow a
getTooltipWindow :: (FindOp a (GetTooltipWindow ()) (Match r), Op (GetTooltipWindow ()) r a impl) => Ref a -> impl
getTooltipWindow = dispatch (undefined :: GetTooltipWindow ())
data HotSpot a
hotSpot :: (FindOp a (HotSpot ()) (Match r), Op (HotSpot ()) r a impl) => Ref a -> impl
hotSpot = dispatch (undefined :: HotSpot ())
data FreePosition a
freePosition :: (FindOp a (FreePosition ()) (Match r), Op (FreePosition ()) r a impl) => Ref a -> impl
freePosition = dispatch (undefined :: FreePosition ())
data SizeRange a
sizeRange :: (FindOp a (SizeRange ()) (Match r), Op (SizeRange ()) r a impl) => Ref a -> impl
sizeRange = dispatch (undefined :: SizeRange ())
data SizeRangeWithArgs a
sizeRangeWithArgs :: (FindOp a (SizeRangeWithArgs ()) (Match r), Op (SizeRangeWithArgs ()) r a impl) => Ref a -> impl
sizeRangeWithArgs = dispatch (undefined :: SizeRangeWithArgs ())
data GetIconlabel a
getIconlabel :: (FindOp a (GetIconlabel ()) (Match r), Op (GetIconlabel ()) r a impl) => Ref a -> impl
getIconlabel = dispatch (undefined :: GetIconlabel ())
data SetIconlabel a
setIconlabel :: (FindOp a (SetIconlabel ()) (Match r), Op (SetIconlabel ()) r a impl) => Ref a -> impl
setIconlabel = dispatch (undefined :: SetIconlabel ())
data SetLabelWithIconlabel a
setLabelWithIconlabel :: (FindOp a (SetLabelWithIconlabel ()) (Match r), Op (SetLabelWithIconlabel ()) r a impl) => Ref a -> impl
setLabelWithIconlabel = dispatch (undefined :: SetLabelWithIconlabel ())
data GetXclass a
getXclass :: (FindOp a (GetXclass ()) (Match r), Op (GetXclass ()) r a impl) => Ref a -> impl
getXclass = dispatch (undefined :: GetXclass ())
data SetXclass a
setXclass :: (FindOp a (SetXclass ()) (Match r), Op (SetXclass ()) r a impl) => Ref a -> impl
setXclass = dispatch (undefined :: SetXclass ())
data GetIcon a
getIcon :: (FindOp a (GetIcon ()) (Match r), Op (GetIcon ()) r a impl) => Ref a -> impl
getIcon = dispatch (undefined :: GetIcon ())
data SetIcon a
setIcon :: (FindOp a (SetIcon ()) (Match r), Op (SetIcon ()) r a impl) => Ref a -> impl
setIcon = dispatch (undefined :: SetIcon ())
data Shown a
shown :: (FindOp a (Shown ()) (Match r), Op (Shown ()) r a impl) => Ref a -> impl
shown = dispatch (undefined :: Shown ())
data Iconize a
iconize :: (FindOp a (Iconize ()) (Match r), Op (Iconize ()) r a impl) => Ref a -> impl
iconize = dispatch (undefined :: Iconize ())
data GetXRoot a
getXRoot :: (FindOp a (GetXRoot ()) (Match r), Op (GetXRoot ()) r a impl) => Ref a -> impl
getXRoot = dispatch (undefined :: GetXRoot ())
data GetYRoot a
getYRoot :: (FindOp a (GetYRoot ()) (Match r), Op (GetYRoot ()) r a impl) => Ref a -> impl
getYRoot = dispatch (undefined :: GetYRoot ())
data MakeCurrent a
makeCurrent :: (FindOp a (MakeCurrent ()) (Match r), Op (MakeCurrent ()) r a impl) => Ref a -> impl
makeCurrent = dispatch (undefined :: MakeCurrent ())
data SetCursor a
setCursor :: (FindOp a (SetCursor ()) (Match r), Op (SetCursor ()) r a impl) => Ref a -> impl
setCursor = dispatch (undefined :: SetCursor ())
data SetCursorWithFgBg a
setCursorWithFgBg :: (FindOp a (SetCursorWithFgBg ()) (Match r), Op (SetCursorWithFgBg ()) r a impl) => Ref a -> impl
setCursorWithFgBg = dispatch (undefined :: SetCursorWithFgBg ())
data SetDefaultCursor a
setDefaultCursor :: (FindOp a (SetDefaultCursor ()) (Match r), Op (SetDefaultCursor ()) r a impl) => Ref a -> impl
setDefaultCursor = dispatch (undefined :: SetDefaultCursor ())
data SetDefaultCursorWithFgBg a
setDefaultCursorWithFgBg :: (FindOp a (SetDefaultCursorWithFgBg ()) (Match r), Op (SetDefaultCursorWithFgBg ()) r a impl) => Ref a -> impl
setDefaultCursorWithFgBg = dispatch (undefined :: SetDefaultCursorWithFgBg ())
data GetDecoratedW a
getDecoratedW :: (FindOp a (GetDecoratedW ()) (Match r), Op (GetDecoratedW ()) r a impl) => Ref a -> impl
getDecoratedW = dispatch (undefined :: GetDecoratedW ())
data GetDecoratedH a
getDecoratedH :: (FindOp a (GetDecoratedH ()) (Match r), Op (GetDecoratedH ()) r a impl) => Ref a -> impl
getDecoratedH = dispatch (undefined :: GetDecoratedH ())
data WaitForExpose a
waitForExpose :: (FindOp a (WaitForExpose ()) (Match r), Op (WaitForExpose ()) r a impl) => Ref a -> impl
waitForExpose = dispatch (undefined :: WaitForExpose ())

data CSingleWindow parent
type SingleWindow = CSingleWindow Window
type SingleWindowFuncs =
  (Destroy
  (DrawSuper
  (HandleSuper
  (ResizeSuper
  (ShowWidgetSuper
  (HideSuper
  (Hide
  (FlushSuper
  (ShowWidget
  (Handle
  (Resize
  ())))))))))))
instance Functions SingleWindow SingleWindowFuncs


data CDoubleWindow parent
type DoubleWindow = CDoubleWindow Window
type DoubleWindowFuncs =
  (Destroy
  (DrawSuper
  (HandleSuper
  (ResizeSuper
  (ShowWidgetSuper
  (HideSuper
  (Hide
  (FlushSuper
  (ShowWidget
  (Handle
  (Resize
  ())))))))))))
instance Functions DoubleWindow DoubleWindowFuncs


data COverlayWindow parent
type OverlayWindow = COverlayWindow DoubleWindow
type OverlayWindowFuncs =
  (Destroy
  (ShowWidget
  (Flush
  (Resize
  (Hide
  (CanDoOverlay
  (RedrawOverlay
  ())))))))
instance Functions OverlayWindow OverlayWindowFuncs


data CanDoOverlay a
canDoOverlay :: (FindOp a (CanDoOverlay ()) (Match r), Op (CanDoOverlay ()) r a impl) => Ref a -> impl
canDoOverlay = dispatch (undefined :: CanDoOverlay ())

data RedrawOverlay a
redrawOverlay :: (FindOp a (RedrawOverlay ()) (Match r), Op (RedrawOverlay ()) r a impl) => Ref a -> impl
redrawOverlay = dispatch (undefined :: RedrawOverlay ())

data Flush a
flush :: (FindOp a (Flush ()) (Match r), Op (Flush ()) r a impl) => Ref a -> impl
flush = dispatch (undefined :: Flush ())

data CButton parent
type Button = CButton Widget
type ButtonFuncs =
  (Destroy
  (DrawSuper
  (HandleSuper
  (Handle
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
  ()))))))))))))))))))))))))
instance Functions Button ButtonFuncs

data GetValue a
getValue :: (FindOp a (GetValue ()) (Match r), Op (GetValue ()) r a impl) => Ref a -> impl
getValue = dispatch (undefined :: GetValue ())
data SetValue a
setValue :: (FindOp a (SetValue ()) (Match r), Op (SetValue ()) r a impl) => Ref a -> impl
setValue = dispatch (undefined :: SetValue ())
data Set a
set :: (FindOp a (Set ()) (Match r), Op (Set ()) r a impl) => Ref a -> impl
set = dispatch (undefined :: Set ())
data Setonly a
setonly :: (FindOp a (Setonly ()) (Match r), Op (Setonly ()) r a impl) => Ref a -> impl
setonly = dispatch (undefined :: Setonly ())
data GetShortcut a
getShortcut :: (FindOp a (GetShortcut ()) (Match r), Op (GetShortcut ()) r a impl) => Ref a -> impl
getShortcut = dispatch (undefined :: GetShortcut ())
data SetShortcut a
setShortcut :: (FindOp a (SetShortcut ()) (Match r), Op (SetShortcut ()) r a impl) => Ref a -> impl
setShortcut = dispatch (undefined :: SetShortcut ())
data GetDownBox a
getDownBox :: (FindOp a (GetDownBox ()) (Match r), Op (GetDownBox ()) r a impl) => Ref a -> impl
getDownBox = dispatch (undefined :: GetDownBox ())
data SetDownBox a
setDownBox :: (FindOp a (SetDownBox ()) (Match r), Op (SetDownBox ()) r a impl) => Ref a -> impl
setDownBox = dispatch (undefined :: SetDownBox ())
data GetDownColor a
getDownColor :: (FindOp a (GetDownColor ()) (Match r), Op (GetDownColor ()) r a impl) => Ref a -> impl
getDownColor = dispatch (undefined :: GetDownColor ())
data SetDownColor a
setDownColor :: (FindOp a (SetDownColor ()) (Match r), Op (SetDownColor ()) r a impl) => Ref a -> impl
setDownColor = dispatch (undefined :: SetDownColor ())

data CLightButton parent
type LightButtonFuncs =
  (Destroy ())
type LightButton = CLightButton Button
instance Functions LightButton LightButtonFuncs

data CRadioLightButton parent
type RadioLightButton = CRadioLightButton LightButton
instance Functions RadioLightButton ()

data CCheckButton parent
type CheckButtonFuncs =
  (Destroy ())
type CheckButton = CCheckButton Button
instance Functions CheckButton CheckButtonFuncs

data CReturnButton parent
type ReturnButton = CReturnButton Button
type ReturnButtonFuncs =
  (Destroy
  (Handle ()))
instance Functions ReturnButton ReturnButtonFuncs

data CRoundButton parent
type RoundButton = CRoundButton Button
type RoundButtonFuncs =
  (Destroy ())
instance Functions RoundButton RoundButtonFuncs

data CRepeatButton parent
type RepeatButton = CRepeatButton Button
type RepeatButtonFuncs =
  (Destroy
  (Handle
  (Deactivate
  ())))
instance Functions RepeatButton RepeatButtonFuncs


data CToggleButton parent
type ToggleButton = CToggleButton Button
type ToggleButtonFuncs =
  (Destroy ())
instance Functions ToggleButton ToggleButtonFuncs

data CValuator parent
type Valuator = CValuator Widget
type ValuatorFuncs =
  (Destroy
  (Handle
  (ResizeSuper
  (Resize
  (Bounds
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
  ())))))))))))))))))))
instance Functions Valuator ValuatorFuncs

data Bounds a
bounds :: (FindOp a (Bounds ()) (Match r), Op (Bounds ()) r a impl) => Ref a -> impl
bounds = dispatch (undefined :: Bounds())
data GetMinimum a
getMinimum :: (FindOp a (GetMinimum ()) (Match r), Op (GetMinimum ()) r a impl) => Ref a -> impl
getMinimum = dispatch (undefined :: GetMinimum())
data SetMinimum a
setMinimum :: (FindOp a (SetMinimum ()) (Match r), Op (SetMinimum ()) r a impl) => Ref a -> impl
setMinimum = dispatch (undefined :: SetMinimum())
data GetMaximum a
getMaximum :: (FindOp a (GetMaximum ()) (Match r), Op (GetMaximum ()) r a impl) => Ref a -> impl
getMaximum = dispatch (undefined :: GetMaximum())
data SetMaximum a
setMaximum :: (FindOp a (SetMaximum ()) (Match r), Op (SetMaximum ()) r a impl) => Ref a -> impl
setMaximum = dispatch (undefined :: SetMaximum())
data GetRange a
getRange :: (FindOp a (GetRange ()) (Match r), Op (GetRange ()) r a impl) => Ref a -> impl
getRange = dispatch (undefined :: GetRange())
data SetStep a
setStep :: (FindOp a (SetStep ()) (Match r), Op (SetStep ()) r a impl) => Ref a -> impl
setStep = dispatch (undefined :: SetStep())
data GetStep a
getStep :: (FindOp a (GetStep ()) (Match r), Op (GetStep ()) r a impl) => Ref a -> impl
getStep = dispatch (undefined :: GetStep())
data Precision a
precision :: (FindOp a (Precision ()) (Match r), Op (Precision ()) r a impl) => Ref a -> impl
precision = dispatch (undefined :: Precision())
data Format a
format :: (FindOp a (Format ()) (Match r), Op (Format ()) r a impl) => Ref a -> impl
format = dispatch (undefined :: Format())
data Round a
round :: (FindOp a (Round ()) (Match r), Op (Round ()) r a impl) => Ref a -> impl
round = dispatch (undefined :: Round())
data Clamp a
clamp :: (FindOp a (Clamp ()) (Match r), Op (Clamp ()) r a impl) => Ref a -> impl
clamp = dispatch (undefined :: Clamp())
data Increment a
increment :: (FindOp a (Increment ()) (Match r), Op (Increment ()) r a impl) => Ref a -> impl
increment = dispatch (undefined :: Increment())

data CSlider parent
type Slider = CSlider Valuator
type SliderFuncs =
  (Destroy
  (Handle
  (Bounds
  (Scrollvalue
  (SetSliderSize
  (GetSliderSize
  (GetSlider
  (SetSlider
  ()))))))))
instance Functions Slider SliderFuncs

data Scrollvalue a
scrollvalue :: (FindOp a (Scrollvalue ()) (Match r), Op (Scrollvalue ()) r a impl) => Ref a -> impl
scrollvalue = dispatch (undefined :: Scrollvalue ())
data SetSliderSize a
setSliderSize :: (FindOp a (SetSliderSize ()) (Match r), Op (SetSliderSize ()) r a impl) => Ref a -> impl
setSliderSize = dispatch (undefined :: SetSliderSize ())
data GetSliderSize a
getSliderSize :: (FindOp a (GetSliderSize ()) (Match r), Op (GetSliderSize ()) r a impl) => Ref a -> impl
getSliderSize = dispatch (undefined :: GetSliderSize ())
data GetSlider a
getSlider :: (FindOp a (GetSlider ()) (Match r), Op (GetSlider ()) r a impl) => Ref a -> impl
getSlider = dispatch (undefined :: GetSlider ())
data SetSlider a
setSlider :: (FindOp a (SetSlider ()) (Match r), Op (SetSlider ()) r a impl) => Ref a -> impl
setSlider = dispatch (undefined :: SetSlider ())

data CFillSlider parent
type FillSlider = CFillSlider Slider
instance Functions FillSlider ()

data CHorSlider parent
type HorSlider = CHorSlider Slider
instance Functions HorSlider ()

data CHorFillSlider parent
type HorFillSlider = CHorFillSlider Slider
instance Functions HorFillSlider ()

data CNiceSlider parent
type NiceSlider = CNiceSlider Slider
instance Functions NiceSlider ()

data CHorNiceSlider parent
type HorNiceSlider = CHorNiceSlider Slider
instance Functions HorNiceSlider ()

data CMenuItem parent
type MenuItem = CMenuItem Base
type MenuItemFuncs =
  (Destroy
  (NextWithStep
  (Next
  (GetFirst
  (GetLabel
  (SetLabel
  (SetLabelWithLabeltype
  (GetLabeltype
  (SetLabeltype
  (GetLabelcolor
  (SetLabelcolor
  (GetLabelfont
  (SetLabelfont
  (GetLabelsize
  (SetLabelsize
  (SetCallback
  (GetShortcut
  (SetShortcut
  (Submenu
  (Checkbox
  (Radio
  (GetValue
  (Set
  (Clear
  (Setonly
  (Visible
  (ShowWidget
  (Hide
  (Active
  (Activate
  (Deactivate
  (Activevisible
  (Measure
  (DrawWithT
  (Draw
  (GetFlags
  (SetFlags
  (GetText
  (Pulldown
  (Popup
  (TestShortcut
  (FindShortcut
  (DoCallback
  (Add
  (Insert
  (GetSize
  ()))))))))))))))))))))))))))))))))))))))))))))))
instance Functions MenuItem MenuItemFuncs

data NextWithStep a
nextWithStep :: (FindOp a (NextWithStep  ()) (Match r), Op (NextWithStep  ()) r a impl) => Ref a -> impl
nextWithStep = dispatch (undefined :: NextWithStep ())
data Next a
next :: (FindOp a (Next  ()) (Match r), Op (Next  ()) r a impl) => Ref a -> impl
next = dispatch (undefined :: Next ())
data GetFirst a
getFirst :: (FindOp a (GetFirst  ()) (Match r), Op (GetFirst  ()) r a impl) => Ref a -> impl
getFirst = dispatch (undefined :: GetFirst ())
data SetLabelWithLabeltype a
setLabelWithLabeltype :: (FindOp a (SetLabelWithLabeltype  ()) (Match r), Op (SetLabelWithLabeltype  ()) r a impl) => Ref a -> impl
setLabelWithLabeltype = dispatch (undefined :: SetLabelWithLabeltype ())
data Submenu a
submenu :: (FindOp a (Submenu  ()) (Match r), Op (Submenu  ()) r a impl) => Ref a -> impl
submenu = dispatch (undefined :: Submenu ())
data Checkbox a
checkbox :: (FindOp a (Checkbox  ()) (Match r), Op (Checkbox  ()) r a impl) => Ref a -> impl
checkbox = dispatch (undefined :: Checkbox ())
data Radio a
radio :: (FindOp a (Radio  ()) (Match r), Op (Radio  ()) r a impl) => Ref a -> impl
radio = dispatch (undefined :: Radio ())
data Visible a
visible :: (FindOp a (Visible  ()) (Match r), Op (Visible  ()) r a impl) => Ref a -> impl
visible = dispatch (undefined :: Visible ())
data Activevisible a
activevisible :: (FindOp a (Activevisible  ()) (Match r), Op (Activevisible  ()) r a impl) => Ref a -> impl
activevisible = dispatch (undefined :: Activevisible ())
data Measure a
measure :: (FindOp a (Measure  ()) (Match r), Op (Measure  ()) r a impl) => Ref a -> impl
measure = dispatch (undefined :: Measure ())
data DrawWithT a
drawWithT :: (FindOp a (DrawWithT  ()) (Match r), Op (DrawWithT  ()) r a impl) => Ref a -> impl
drawWithT = dispatch (undefined :: DrawWithT ())
data Draw a
draw :: (FindOp a (Draw  ()) (Match r), Op (Draw  ()) r a impl) => Ref a -> impl
draw = dispatch (undefined :: Draw ())
data GetFlags a
getFlags :: (FindOp a (GetFlags  ()) (Match r), Op (GetFlags  ()) r a impl) => Ref a -> impl
getFlags = dispatch (undefined :: GetFlags ())
data SetFlags a
setFlags :: (FindOp a (SetFlags  ()) (Match r), Op (SetFlags  ()) r a impl) => Ref a -> impl
setFlags = dispatch (undefined :: SetFlags ())
data Pulldown a
pulldown :: (FindOp a (Pulldown  ()) (Match r), Op (Pulldown  ()) r a impl) => Ref a -> impl
pulldown = dispatch (undefined :: Pulldown ())
data Popup a
popup :: (FindOp a (Popup  ()) (Match r), Op (Popup  ()) r a impl) => Ref a -> impl
popup = dispatch (undefined :: Popup ())
data TestShortcut a
testShortcut :: (FindOp a (TestShortcut  ()) (Match r), Op (TestShortcut  ()) r a impl) => Ref a -> impl
testShortcut = dispatch (undefined :: TestShortcut ())
data FindShortcut a
findShortcut :: (FindOp a (FindShortcut  ()) (Match r), Op (FindShortcut  ()) r a impl) => Ref a -> impl
findShortcut = dispatch (undefined :: FindShortcut ())
data DoCallback a
doCallback :: (FindOp a (DoCallback  ()) (Match r), Op (DoCallback  ()) r a impl) => Ref a -> impl
doCallback = dispatch (undefined :: DoCallback ())
data GetSize a
getSize :: (FindOp a (GetSize  ()) (Match r), Op (GetSize  ()) r a impl) => Ref a -> impl
getSize = dispatch (undefined :: GetSize ())

data CMenuPrim parent
type MenuPrim = CMenuPrim Widget
type MenuPrimFuncs =
  (Destroy
  (HandleSuper
  (Handle
  (ResizeSuper
  (Resize
  (HideSuper
  (Hide
  (ShowWidgetSuper
  (ShowWidget
  (ItemPathname
  (Picked
  (FindIndex
  (TestShortcut
  (Global
  (GetMenu
  (SetMenu
  (Copy
  (Insert
  (Add
  (AddName
  (GetSize
  (SetSize
  (Clear
  (ClearSubmenu
  (Replace
  (Remove
  (SetShortcut
  (SetMode
  (GetMode
  (Mvalue
  (GetValue
  (SetValue
  (GetText
  (GetTextWithIndex
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  (GetDownBox
  (SetDownBox
  (GetDownColor
  (SetDownColor
  ()))))))))))))))))))))))))))))))))))))))))))))
instance Functions MenuPrim MenuPrimFuncs

data ItemPathname a
itemPathname :: (FindOp a (ItemPathname ()) (Match r), Op (ItemPathname ()) r a impl) => Ref a -> impl
itemPathname = dispatch (undefined :: ItemPathname ())
data Picked a
picked :: (FindOp a (Picked ()) (Match r), Op (Picked ()) r a impl) => Ref a -> impl
picked = dispatch (undefined :: Picked ())
data FindIndex a
findIndex :: (FindOp a (FindIndex  ()) (Match r), Op (FindIndex  ()) r a impl) => Ref a -> impl
findIndex = dispatch (undefined :: FindIndex ())
data Global a
global :: (FindOp a (Global  ()) (Match r), Op (Global  ()) r a impl) => Ref a -> impl
global = dispatch (undefined :: Global ())
data GetMenu a
getMenu :: (FindOp a (GetMenu  ()) (Match r), Op (GetMenu  ()) r a impl) => Ref a -> impl
getMenu = dispatch (undefined :: GetMenu ())
data SetMenu a
setMenu :: (FindOp a (SetMenu  ()) (Match r), Op (SetMenu  ()) r a impl) => Ref a -> impl
setMenu = dispatch (undefined :: SetMenu ())
data Copy a
copy :: (FindOp a (Copy  ()) (Match r), Op (Copy  ()) r a impl) => Ref a -> impl
copy = dispatch (undefined :: Copy ())
data SetSize a
setSize :: (FindOp a (SetSize  ()) (Match r), Op (SetSize  ()) r a impl) => Ref a -> impl
setSize = dispatch (undefined :: SetSize ())
data ClearSubmenu a
clearSubmenu :: (FindOp a (ClearSubmenu  ()) (Match r), Op (ClearSubmenu  ()) r a impl) => Ref a -> impl
clearSubmenu = dispatch (undefined :: ClearSubmenu ())
data AddName a
addName :: (FindOp a (AddName  ()) (Match r), Op (AddName  ()) r a impl) => Ref a -> impl
addName = dispatch (undefined :: AddName ())
data Replace a
replace :: (FindOp a (Replace  ()) (Match r), Op (Replace  ()) r a impl) => Ref a -> impl
replace = dispatch (undefined :: Replace ())
data Remove a
remove :: (FindOp a (Remove  ()) (Match r), Op (Remove  ()) r a impl) => Ref a -> impl
remove = dispatch (undefined :: Remove ())
data SetMode a
setMode :: (FindOp a (SetMode  ()) (Match r), Op (SetMode  ()) r a impl) => Ref a -> impl
setMode = dispatch (undefined :: SetMode ())
data GetMode a
getMode :: (FindOp a (GetMode  ()) (Match r), Op (GetMode  ()) r a impl) => Ref a -> impl
getMode = dispatch (undefined :: GetMode ())
data Mvalue a
mvalue :: (FindOp a (Mvalue  ()) (Match r), Op (Mvalue  ()) r a impl) => Ref a -> impl
mvalue = dispatch (undefined :: Mvalue ())
data GetText a
getText :: (FindOp a (GetText  ()) (Match r), Op (GetText  ()) r a impl) => Ref a -> impl
getText = dispatch (undefined :: GetText ())
data GetTextWithIndex a
getTextWithIndex :: (FindOp a (GetTextWithIndex  ()) (Match r), Op (GetTextWithIndex  ()) r a impl) => Ref a -> impl
getTextWithIndex = dispatch (undefined :: GetTextWithIndex ())
data GetTextfont a
getTextfont :: (FindOp a (GetTextfont  ()) (Match r), Op (GetTextfont  ()) r a impl) => Ref a -> impl
getTextfont = dispatch (undefined :: GetTextfont ())
data SetTextfont a
setTextfont :: (FindOp a (SetTextfont  ()) (Match r), Op (SetTextfont  ()) r a impl) => Ref a -> impl
setTextfont = dispatch (undefined :: SetTextfont ())
data GetTextsize a
getTextsize :: (FindOp a (GetTextsize  ()) (Match r), Op (GetTextsize  ()) r a impl) => Ref a -> impl
getTextsize = dispatch (undefined :: GetTextsize ())
data SetTextsize a
setTextsize :: (FindOp a (SetTextsize  ()) (Match r), Op (SetTextsize  ()) r a impl) => Ref a -> impl
setTextsize = dispatch (undefined :: SetTextsize ())
data GetTextcolor a
getTextcolor :: (FindOp a (GetTextcolor  ()) (Match r), Op (GetTextcolor  ()) r a impl) => Ref a -> impl
getTextcolor = dispatch (undefined :: GetTextcolor ())
data SetTextcolor a
setTextcolor :: (FindOp a (SetTextcolor  ()) (Match r), Op (SetTextcolor  ()) r a impl) => Ref a -> impl
setTextcolor = dispatch (undefined :: SetTextcolor ())
data DownBox a
downBox :: (FindOp a (DownBox  ()) (Match r), Op (DownBox  ()) r a impl) => Ref a -> impl
downBox = dispatch (undefined :: DownBox ())

data CSysMenuBar parent
type SysMenuBar = CSysMenuBar MenuPrim
type SysMenuBarFuncs =
  (Destroy
  (GetMenu
  (SetMenu
  (Add
  (Insert
  (Remove
  (Replace
  (Clear
  (ClearSubmenu
  (Global
  (SetMode
  (GetMode
  (SetShortcut
  (Handle
  ()))))))))))))))
instance Functions SysMenuBar SysMenuBarFuncs

data CChoice parent
type Choice = CChoice MenuPrim
type ChoiceFuncs =
  (Destroy
  (Handle
  (GetValue
  (SetValue
  ()))))
instance Functions Choice ChoiceFuncs


data CMenuButton parent
type MenuButton = CMenuButton MenuPrim
type MenuButtonFuncs =
  (Destroy
  (Handle
  (Popup
  ())))
instance Functions MenuButton MenuButtonFuncs

data CImage parent
type Image = CImage Base
type ImageFuncs =
  (Destroy
  (GetW
  (GetH
  (GetD
  (GetLd
  (GetCount
  (Copy
  (ColorAverage
  (Inactive
  (Desaturate
  (DrawResize
  (Draw
  (Uncache
  ())))))))))))))
instance Functions Image ImageFuncs

data GetD a
getD :: (FindOp a (GetD ()) (Match r), Op (GetD ()) r a impl) => Ref a -> impl
getD = dispatch (undefined :: GetD ())
data GetLd a
getLd :: (FindOp a (GetLd ()) (Match r), Op (GetLd ()) r a impl) => Ref a -> impl
getLd = dispatch (undefined :: GetLd ())
data GetCount a
getCount :: (FindOp a (GetCount ()) (Match r), Op (GetCount ()) r a impl) => Ref a -> impl
getCount = dispatch (undefined :: GetCount ())
data ColorAverage a
colorAverage :: (FindOp a (ColorAverage ()) (Match r), Op (ColorAverage ()) r a impl) => Ref a -> impl
colorAverage = dispatch (undefined :: ColorAverage ())
data Inactive a
inactive :: (FindOp a (Inactive ()) (Match r), Op (Inactive ()) r a impl) => Ref a -> impl
inactive = dispatch (undefined :: Inactive ())
data Desaturate a
desaturate :: (FindOp a (Desaturate ()) (Match r), Op (Desaturate ()) r a impl) => Ref a -> impl
desaturate = dispatch (undefined :: Desaturate ())
data DrawResize a
drawResize :: (FindOp a (DrawResize ()) (Match r), Op (DrawResize ()) r a impl) => Ref a -> impl
drawResize = dispatch (undefined :: DrawResize ())
data Uncache a
uncache :: (FindOp a (Uncache ()) (Match r), Op (Uncache ()) r a impl) => Ref a -> impl
uncache = dispatch (undefined :: Uncache ())

data CBitmap parent
type Bitmap = CBitmap Image
type BitmapFuncs =
  (Destroy
 (GetW
 (GetH
 (GetD
 (GetLd
 (GetCount
 (Copy
 (ColorAverage
 (Inactive
 (Desaturate
 (DrawResize
 (Draw
 (Uncache
 ())))))))))))))
instance Functions Bitmap BitmapFuncs

data CPixmap parent
type Pixmap = CPixmap Image
type PixmapFuncs =
  (Destroy
  (GetW
  (GetH
  (GetD
  (GetLd
  (GetCount
  (Copy
  (ColorAverage
  (Inactive
  (Desaturate
  (DrawResize
  (Draw
  (Uncache
  ())))))))))))))
instance Functions Pixmap PixmapFuncs

data CCopySurface parent
type CopySurface = CCopySurface Base
type CopySurfaceFuncs =
  (Destroy
  (ClassName
  (SetCurrent
  (Draw
  ()))))
instance Functions CopySurface CopySurfaceFuncs

data ClassName a
className :: (FindOp a (ClassName ()) (Match r), Op (ClassName ()) r a impl) => Ref a -> impl
className = dispatch (undefined :: ClassName ())
data SetCurrent a
setCurrent :: (FindOp a (SetCurrent ()) (Match r), Op (SetCurrent ()) r a impl) => Ref a -> impl
setCurrent = dispatch (undefined :: SetCurrent ())

data CImageSurface parent
type ImageSurface = CImageSurface Base
type ImageSurfaceFuncs =
  (Destroy
  (ClassName
  (SetCurrent
  (Draw
  ()))))
instance Functions ImageSurface ImageSurfaceFuncs


data CAdjuster parent
type Adjuster = CAdjuster Valuator
type AdjusterFuncs =
  (Destroy
  (SetSoft
  (GetSoft
  ())))
instance Functions Adjuster AdjusterFuncs


data SetSoft a
setSoft :: (FindOp a (SetSoft ()) (Match r), Op (SetSoft ()) r a impl) => Ref a -> impl
setSoft = dispatch (undefined :: SetSoft ())
data GetSoft a
getSoft :: (FindOp a (GetSoft ()) (Match r), Op (GetSoft ()) r a impl) => Ref a -> impl
getSoft = dispatch (undefined :: GetSoft ())

data CDial parent
type Dial = CDial Valuator
type DialFuncs =
  (Destroy
 (GetAngle1
 (SetAngle1
 (GetAngle2
 (SetAngle2
 (SetAngles
 ()))))))
instance Functions Dial DialFuncs

data GetAngle1 a
getAngle1 :: (FindOp a (GetAngle1 ()) (Match r), Op (GetAngle1 ()) r a impl) => Ref a -> impl
getAngle1 = dispatch (undefined :: GetAngle1 ())
data SetAngle1 a
setAngle1 :: (FindOp a (SetAngle1 ()) (Match r), Op (SetAngle1 ()) r a impl) => Ref a -> impl
setAngle1 = dispatch (undefined :: SetAngle1 ())
data GetAngle2 a
getAngle2 :: (FindOp a (GetAngle2 ()) (Match r), Op (GetAngle2 ()) r a impl) => Ref a -> impl
getAngle2 = dispatch (undefined :: GetAngle2 ())
data SetAngle2 a
setAngle2 :: (FindOp a (SetAngle2 ()) (Match r), Op (SetAngle2 ()) r a impl) => Ref a -> impl
setAngle2 = dispatch (undefined :: SetAngle2 ())
data SetAngles a
setAngles :: (FindOp a (SetAngles ()) (Match r), Op (SetAngles ()) r a impl) => Ref a -> impl
setAngles = dispatch (undefined :: SetAngles ())

data CFillDial parent
type FillDial = CFillDial Dial
instance Functions FillDial ()

data CLineDial parent
type LineDial = CLineDial Dial
instance Functions LineDial ()

data CRoller parent
type Roller = CRoller Valuator
type RollerFuncs =
  (Destroy
  (Handle
  ()))
instance Functions Roller RollerFuncs

data CCounter parent
type Counter = CCounter Valuator
type CounterFuncs =
  (Destroy
  (Handle
  (SetLstep
  (SetTextfont
  (GetTextfont
  (SetTextsize
  (GetTextsize
  (SetTextcolor
  (GetTextcolor
  ())))))))))
instance Functions Counter CounterFuncs

data SetLstep a
setLstep :: (FindOp a (SetLstep ()) (Match r), Op (SetLstep ()) r a impl) => Ref a -> impl
setLstep = dispatch (undefined :: SetLstep ())

data CSimpleCounter parent
type SimpleCounter = CSimpleCounter Counter
instance Functions SimpleCounter ()

data CScrollbar parent
type Scrollbar = CScrollbar Slider
type ScrollbarFuncs =
  (Destroy
 (SetValue
 (Handle
 (SetLinesize
 (GetLinesize
 ())))))
instance Functions Scrollbar ScrollbarFuncs

data SetLinesize a
setLinesize :: (FindOp a (SetLinesize ()) (Match r), Op (SetLinesize ()) r a impl) => Ref a -> impl
setLinesize = dispatch (undefined :: SetLinesize ())
data GetLinesize a
getLinesize :: (FindOp a (GetLinesize ()) (Match r), Op (GetLinesize ()) r a impl) => Ref a -> impl
getLinesize = dispatch (undefined :: GetLinesize ())

data CValueSlider parent
type ValueSlider = CValueSlider Slider
type ValueSliderFuncs =
  (Destroy
  (Handle
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  ()))))))))
instance Functions ValueSlider ValueSliderFuncs

data CHorValueSlider parent
type HorValueSlider = CHorValueSlider ValueSlider
instance Functions HorValueSlider ()

data CInput parent
type Input = CInput Widget
type InputFuncs =
  (Destroy
  (Handle
  (SetValue
  (StaticValue
  (GetValue
  (Index
  (SetSize
  (GetMaximumSize
  (GetSize
  (SetMaximumSize
  (GetPosition
  (GetMark
  (SetPosition
  (SetMark
  (Replace
  (Cut
  (CutFromCursor
  (CutRange
  (Insert
  (InsertWithLength
  (Copy
  (Undo
  (CopyCuts
  (GetShortcut
  (SetShortcut
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  (GetCursorColor
  (SetCursorColor
  (GetInputType
  (SetInputType
  (GetReadonly
  (SetReadonly
  (GetWrap
  (SetWrap
  (GetTabNav
  (SetTabNav
  ())))))))))))))))))))))))))))))))))))))))))
instance Functions Input InputFuncs

data StaticValue a
staticValue :: (FindOp a (StaticValue ()) (Match r), Op (StaticValue ()) r a impl) => Ref a -> impl
staticValue = dispatch (undefined :: StaticValue ())
data Index a
index :: (FindOp a (Index ()) (Match r), Op (Index ()) r a impl) => Ref a -> impl
index = dispatch (undefined :: Index ())
data GetMaximumSize a
getMaximumSize :: (FindOp a (GetMaximumSize ()) (Match r), Op (GetMaximumSize ()) r a impl) => Ref a -> impl
getMaximumSize = dispatch (undefined :: GetMaximumSize ())
data SetMaximumSize a
setMaximumSize :: (FindOp a (SetMaximumSize ()) (Match r), Op (SetMaximumSize ()) r a impl) => Ref a -> impl
setMaximumSize = dispatch (undefined :: SetMaximumSize ())
data GetPosition a
getPosition :: (FindOp a (GetPosition ()) (Match r), Op (GetPosition ()) r a impl) => Ref a -> impl
getPosition = dispatch (undefined :: GetPosition ())
data GetMark a
getMark :: (FindOp a (GetMark ()) (Match r), Op (GetMark ()) r a impl) => Ref a -> impl
getMark = dispatch (undefined :: GetMark ())
data SetPosition a
setPosition :: (FindOp a (SetPosition ()) (Match r), Op (SetPosition ()) r a impl) => Ref a -> impl
setPosition = dispatch (undefined :: SetPosition ())
data SetMark a
setMark :: (FindOp a (SetMark ()) (Match r), Op (SetMark ()) r a impl) => Ref a -> impl
setMark = dispatch (undefined :: SetMark ())
data Cut a
cut :: (FindOp a (Cut ()) (Match r), Op (Cut ()) r a impl) => Ref a -> impl
cut = dispatch (undefined :: Cut ())
data CutFromCursor a
cutFromCursor :: (FindOp a (CutFromCursor ()) (Match r), Op (CutFromCursor ()) r a impl) => Ref a -> impl
cutFromCursor = dispatch (undefined :: CutFromCursor ())
data CutRange a
cutRange :: (FindOp a (CutRange ()) (Match r), Op (CutRange ()) r a impl) => Ref a -> impl
cutRange = dispatch (undefined :: CutRange ())
data InsertWithLength a
insertWithLength :: (FindOp a (InsertWithLength ()) (Match r), Op (InsertWithLength ()) r a impl) => Ref a -> impl
insertWithLength = dispatch (undefined :: InsertWithLength ())
data Undo a
undo :: (FindOp a (Undo ()) (Match r), Op (Undo ()) r a impl) => Ref a -> impl
undo = dispatch (undefined :: Undo ())
data CopyCuts a
copyCuts :: (FindOp a (CopyCuts ()) (Match r), Op (CopyCuts ()) r a impl) => Ref a -> impl
copyCuts = dispatch (undefined :: CopyCuts ())
data GetCursorColor a
getCursorColor :: (FindOp a (GetCursorColor ()) (Match r), Op (GetCursorColor ()) r a impl) => Ref a -> impl
getCursorColor = dispatch (undefined :: GetCursorColor ())
data SetCursorColor a
setCursorColor :: (FindOp a (SetCursorColor ()) (Match r), Op (SetCursorColor ()) r a impl) => Ref a -> impl
setCursorColor = dispatch (undefined :: SetCursorColor ())
data GetInputType a
getInputType :: (FindOp a (GetInputType ()) (Match r), Op (GetInputType ()) r a impl) => Ref a -> impl
getInputType = dispatch (undefined :: GetInputType ())
data SetInputType a
setInputType :: (FindOp a (SetInputType ()) (Match r), Op (SetInputType ()) r a impl) => Ref a -> impl
setInputType = dispatch (undefined :: SetInputType ())
data GetReadonly a
getReadonly :: (FindOp a (GetReadonly ()) (Match r), Op (GetReadonly ()) r a impl) => Ref a -> impl
getReadonly = dispatch (undefined :: GetReadonly ())
data SetReadonly a
setReadonly :: (FindOp a (SetReadonly ()) (Match r), Op (SetReadonly ()) r a impl) => Ref a -> impl
setReadonly = dispatch (undefined :: SetReadonly ())
data GetWrap a
getWrap :: (FindOp a (GetWrap ()) (Match r), Op (GetWrap ()) r a impl) => Ref a -> impl
getWrap = dispatch (undefined :: GetWrap ())
data SetWrap a
setWrap :: (FindOp a (SetWrap ()) (Match r), Op (SetWrap ()) r a impl) => Ref a -> impl
setWrap = dispatch (undefined :: SetWrap ())
data GetTabNav a
getTabNav :: (FindOp a (GetTabNav ()) (Match r), Op (GetTabNav ()) r a impl) => Ref a -> impl
getTabNav = dispatch (undefined :: GetTabNav ())
data SetTabNav a
setTabNav :: (FindOp a (SetTabNav ()) (Match r), Op (SetTabNav ()) r a impl) => Ref a -> impl
setTabNav = dispatch (undefined :: SetTabNav ())

data CValueInput parent
type ValueInput = CValueInput Valuator
type ValueInputFuncs =
  (Destroy
  (Handle
  (GetSoft
  (SetSoft
  (GetShortcut
  (SetShortcut
  (SetTextfont
  (GetTextfont
  (SetTextsize
  (GetTextsize
  (SetTextcolor
  (GetTextcolor
  ()))))))))))))
instance Functions ValueInput ValueInputFuncs

data CValueOutput parent
type ValueOutput = CValueOutput Valuator
type ValueOutputFuncs =
  (Destroy
  (Handle
  (GetSoft
  (SetSoft
  (SetTextfont
  (GetTextfont
  (SetTextsize
  (GetTextsize
  (SetTextcolor
  (GetTextcolor
  ()))))))))))
instance Functions ValueOutput ValueOutputFuncs

data CTimer parent
type Timer = CTimer Widget
type TimerFuncs =
  (Destroy
  (Handle
  (GetDirection
  (SetDirection
  (GetValue
  (SetValue
  (GetSuspended
  (SetSuspended
  ()))))))))
instance Functions Timer TimerFuncs

data GetDirection a
getDirection :: (FindOp a (GetDirection ()) (Match r), Op (GetDirection ()) r a impl) => Ref a -> impl
getDirection = dispatch (undefined :: GetDirection ())
data SetDirection a
setDirection :: (FindOp a (SetDirection ()) (Match r), Op (SetDirection ()) r a impl) => Ref a -> impl
setDirection = dispatch (undefined :: SetDirection ())
data GetSuspended a
getSuspended :: (FindOp a (GetSuspended ()) (Match r), Op (GetSuspended ()) r a impl) => Ref a -> impl
getSuspended = dispatch (undefined :: GetSuspended ())
data SetSuspended a
setSuspended :: (FindOp a (SetSuspended ()) (Match r), Op (SetSuspended ()) r a impl) => Ref a -> impl
setSuspended = dispatch (undefined :: SetSuspended ())

data CHiddenTimer parent
type HiddenTimer = CHiddenTimer Widget
instance Functions HiddenTimer ()

data CValueTimer parent
type ValueTimer = CValueTimer Widget
instance Functions ValueTimer ()

data CProgress parent
type Progress = CProgress Widget
type ProgressFuncs =
  (Destroy
  (SetMaximum
  (GetMaximum
  (SetMinimum
  (GetMinimum
  (SetValue
  (GetValue
  ())))))))
instance Functions Progress ProgressFuncs

data CPositioner parent
type Positioner = CPositioner Widget
type PositionerFuncs =
  (Destroy
  (Handle
  (SetXvalue
  (GetXvalue
  (SetYvalue
  (GetYvalue
  (SetXminimum
  (GetXminimum
  (SetYminimum
  (GetYminimum
  (SetXmaximum
  (GetXmaximum
  (SetYmaximum
  (GetYmaximum
  (SetXbounds
  (SetYbounds
  (SetXstep
  (SetYstep
  ()))))))))))))))))))
instance Functions Positioner PositionerFuncs

data SetXvalue a
setXvalue :: (FindOp a (SetXvalue ()) (Match r), Op (SetXvalue ()) r a impl) => Ref a -> impl
setXvalue = dispatch (undefined :: SetXvalue ())
data GetXvalue a
getXvalue :: (FindOp a (GetXvalue ()) (Match r), Op (GetXvalue ()) r a impl) => Ref a -> impl
getXvalue = dispatch (undefined :: GetXvalue ())
data SetYvalue a
setYvalue :: (FindOp a (SetYvalue ()) (Match r), Op (SetYvalue ()) r a impl) => Ref a -> impl
setYvalue = dispatch (undefined :: SetYvalue ())
data GetYvalue a
getYvalue :: (FindOp a (GetYvalue ()) (Match r), Op (GetYvalue ()) r a impl) => Ref a -> impl
getYvalue = dispatch (undefined :: GetYvalue ())
data SetXminimum a
setXminimum :: (FindOp a (SetXminimum ()) (Match r), Op (SetXminimum ()) r a impl) => Ref a -> impl
setXminimum = dispatch (undefined :: SetXminimum ())
data GetXminimum a
getXminimum :: (FindOp a (GetXminimum ()) (Match r), Op (GetXminimum ()) r a impl) => Ref a -> impl
getXminimum = dispatch (undefined :: GetXminimum ())
data SetYminimum a
setYminimum :: (FindOp a (SetYminimum ()) (Match r), Op (SetYminimum ()) r a impl) => Ref a -> impl
setYminimum = dispatch (undefined :: SetYminimum ())
data GetYminimum a
getYminimum :: (FindOp a (GetYminimum ()) (Match r), Op (GetYminimum ()) r a impl) => Ref a -> impl
getYminimum = dispatch (undefined :: GetYminimum ())
data SetXmaximum a
setXmaximum :: (FindOp a (SetXmaximum ()) (Match r), Op (SetXmaximum ()) r a impl) => Ref a -> impl
setXmaximum = dispatch (undefined :: SetXmaximum ())
data GetXmaximum a
getXmaximum :: (FindOp a (GetXmaximum ()) (Match r), Op (GetXmaximum ()) r a impl) => Ref a -> impl
getXmaximum = dispatch (undefined :: GetXmaximum ())
data SetYmaximum a
setYmaximum :: (FindOp a (SetYmaximum ()) (Match r), Op (SetYmaximum ()) r a impl) => Ref a -> impl
setYmaximum = dispatch (undefined :: SetYmaximum ())
data GetYmaximum a
getYmaximum :: (FindOp a (GetYmaximum ()) (Match r), Op (GetYmaximum ()) r a impl) => Ref a -> impl
getYmaximum = dispatch (undefined :: GetYmaximum ())
data SetXbounds a
setXbounds :: (FindOp a (SetXbounds ()) (Match r), Op (SetXbounds ()) r a impl) => Ref a -> impl
setXbounds = dispatch (undefined :: SetXbounds ())
data SetYbounds a
setYbounds :: (FindOp a (SetYbounds ()) (Match r), Op (SetYbounds ()) r a impl) => Ref a -> impl
setYbounds = dispatch (undefined :: SetYbounds ())
data SetXstep a
setXstep :: (FindOp a (SetXstep ()) (Match r), Op (SetXstep ()) r a impl) => Ref a -> impl
setXstep = dispatch (undefined :: SetXstep ())
data SetYstep a
setYstep :: (FindOp a (SetYstep ()) (Match r), Op (SetYstep ()) r a impl) => Ref a -> impl
setYstep = dispatch (undefined :: SetYstep ())

data CWizard parent
type Wizard = CWizard Widget
type WizardFuncs =
  (Destroy
  (Next
  (Prev
  (SetValue
  (GetValue
  ())))))
instance Functions Wizard WizardFuncs

data Prev a
prev :: (FindOp a (Prev ()) (Match r), Op (Prev ()) r a impl) => Ref a -> impl
prev = dispatch (undefined :: Prev ())

data CTable parent
type Table = CTable Group
type TableFuncs =
  (Destroy
  (SetTableBox
  (GetTableBox
  (SetRows
  (GetRows
  (SetCols
  (GetCols
  (SetVisibleCells
  (IsInteractiveResize
  (GetRowResize
  (SetRowResize
  (GetColResize
  (SetColResize
  (GetColResizeMin
  (SetColResizeMin
  (GetRowResizeMin
  (SetRowResizeMin
  (GetRowHeader
  (SetRowHeader
  (GetColHeader
  (SetColHeader
  (SetColHeaderHeight
  (GetColHeaderHeight
  (SetRowHeaderWidth
  (GetRowHeaderWidth
  (SetRowHeaderColor
  (GetRowHeaderColor
  (SetColHeaderColor
  (GetColHeaderColor
  (SetRowHeight
  (GetRowHeight
  (SetColWidth
  (GetColWidth
  (SetRowHeightAll
  (SetColWidthAll
  (SetRowPosition
  (SetColPosition
  (GetRowPosition
  (GetColPosition
  (SetTopRow
  (GetTopRow
  (IsSelected
  (GetSelection
  (SetSelection
  (MoveCursor
  (InitSizes
  (Add
  (Insert
  (InsertWithBefore
  (Begin
  (End
  (GetArray
  (GetChild
  (Children
  (Find
  (CallbackRow
  (CallbackCol
  (CallbackContext
  (DoCallback
  (FindCell
  (DrawSuper
  (Draw
  (Handle
  (ResizeSuper
  (Resize
  (ClearSuper
  (Clear
  (SetRowsSuper
  (SetColsSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
instance Functions Table TableFuncs

data SetTableBox a
setTableBox :: (FindOp a (SetTableBox ()) (Match r), Op (SetTableBox ()) r a impl) => Ref a -> impl
setTableBox = dispatch (undefined :: SetTableBox ())
data GetTableBox a
getTableBox :: (FindOp a (GetTableBox ()) (Match r), Op (GetTableBox ()) r a impl) => Ref a -> impl
getTableBox = dispatch (undefined :: GetTableBox ())
data SetRows a
setRows :: (FindOp a (SetRows ()) (Match r), Op (SetRows ()) r a impl) => Ref a -> impl
setRows = dispatch (undefined :: SetRows ())
data GetRows a
getRows :: (FindOp a (GetRows ()) (Match r), Op (GetRows ()) r a impl) => Ref a -> impl
getRows = dispatch (undefined :: GetRows ())
data SetCols a
setCols :: (FindOp a (SetCols ()) (Match r), Op (SetCols ()) r a impl) => Ref a -> impl
setCols = dispatch (undefined :: SetCols ())
data GetCols a
getCols :: (FindOp a (GetCols ()) (Match r), Op (GetCols ()) r a impl) => Ref a -> impl
getCols = dispatch (undefined :: GetCols ())
data SetVisibleCells a
setVisibleCells :: (FindOp a (SetVisibleCells ()) (Match r), Op (SetVisibleCells ()) r a impl) => Ref a -> impl
setVisibleCells = dispatch (undefined :: SetVisibleCells ())
data IsInteractiveResize a
isInteractiveResize :: (FindOp a (IsInteractiveResize ()) (Match r), Op (IsInteractiveResize ()) r a impl) => Ref a -> impl
isInteractiveResize = dispatch (undefined :: IsInteractiveResize ())
data GetRowResize a
getRowResize :: (FindOp a (GetRowResize ()) (Match r), Op (GetRowResize ()) r a impl) => Ref a -> impl
getRowResize = dispatch (undefined :: GetRowResize ())
data SetRowResize a
setRowResize :: (FindOp a (SetRowResize ()) (Match r), Op (SetRowResize ()) r a impl) => Ref a -> impl
setRowResize = dispatch (undefined :: SetRowResize ())
data GetColResize a
getColResize :: (FindOp a (GetColResize ()) (Match r), Op (GetColResize ()) r a impl) => Ref a -> impl
getColResize = dispatch (undefined :: GetColResize ())
data SetColResize a
setColResize :: (FindOp a (SetColResize ()) (Match r), Op (SetColResize ()) r a impl) => Ref a -> impl
setColResize = dispatch (undefined :: SetColResize ())
data GetColResizeMin a
getColResizeMin :: (FindOp a (GetColResizeMin ()) (Match r), Op (GetColResizeMin ()) r a impl) => Ref a -> impl
getColResizeMin = dispatch (undefined :: GetColResizeMin ())
data SetColResizeMin a
setColResizeMin :: (FindOp a (SetColResizeMin ()) (Match r), Op (SetColResizeMin ()) r a impl) => Ref a -> impl
setColResizeMin = dispatch (undefined :: SetColResizeMin ())
data GetRowResizeMin a
getRowResizeMin :: (FindOp a (GetRowResizeMin ()) (Match r), Op (GetRowResizeMin ()) r a impl) => Ref a -> impl
getRowResizeMin = dispatch (undefined :: GetRowResizeMin ())
data SetRowResizeMin a
setRowResizeMin :: (FindOp a (SetRowResizeMin ()) (Match r), Op (SetRowResizeMin ()) r a impl) => Ref a -> impl
setRowResizeMin = dispatch (undefined :: SetRowResizeMin ())
data GetRowHeader a
getRowHeader :: (FindOp a (GetRowHeader ()) (Match r), Op (GetRowHeader ()) r a impl) => Ref a -> impl
getRowHeader = dispatch (undefined :: GetRowHeader ())
data SetRowHeader a
setRowHeader :: (FindOp a (SetRowHeader ()) (Match r), Op (SetRowHeader ()) r a impl) => Ref a -> impl
setRowHeader = dispatch (undefined :: SetRowHeader ())
data GetColHeader a
getColHeader :: (FindOp a (GetColHeader ()) (Match r), Op (GetColHeader ()) r a impl) => Ref a -> impl
getColHeader = dispatch (undefined :: GetColHeader ())
data SetColHeader a
setColHeader :: (FindOp a (SetColHeader ()) (Match r), Op (SetColHeader ()) r a impl) => Ref a -> impl
setColHeader = dispatch (undefined :: SetColHeader ())
data SetColHeaderHeight a
setColHeaderHeight :: (FindOp a (SetColHeaderHeight ()) (Match r), Op (SetColHeaderHeight ()) r a impl) => Ref a -> impl
setColHeaderHeight = dispatch (undefined :: SetColHeaderHeight ())
data GetColHeaderHeight a
getColHeaderHeight :: (FindOp a (GetColHeaderHeight ()) (Match r), Op (GetColHeaderHeight ()) r a impl) => Ref a -> impl
getColHeaderHeight = dispatch (undefined :: GetColHeaderHeight ())
data SetRowHeaderWidth a
setRowHeaderWidth :: (FindOp a (SetRowHeaderWidth ()) (Match r), Op (SetRowHeaderWidth ()) r a impl) => Ref a -> impl
setRowHeaderWidth = dispatch (undefined :: SetRowHeaderWidth ())
data GetRowHeaderWidth a
getRowHeaderWidth :: (FindOp a (GetRowHeaderWidth ()) (Match r), Op (GetRowHeaderWidth ()) r a impl) => Ref a -> impl
getRowHeaderWidth = dispatch (undefined :: GetRowHeaderWidth ())
data SetRowHeaderColor a
setRowHeaderColor :: (FindOp a (SetRowHeaderColor ()) (Match r), Op (SetRowHeaderColor ()) r a impl) => Ref a -> impl
setRowHeaderColor = dispatch (undefined :: SetRowHeaderColor ())
data GetRowHeaderColor a
getRowHeaderColor :: (FindOp a (GetRowHeaderColor ()) (Match r), Op (GetRowHeaderColor ()) r a impl) => Ref a -> impl
getRowHeaderColor = dispatch (undefined :: GetRowHeaderColor ())
data SetColHeaderColor a
setColHeaderColor :: (FindOp a (SetColHeaderColor ()) (Match r), Op (SetColHeaderColor ()) r a impl) => Ref a -> impl
setColHeaderColor = dispatch (undefined :: SetColHeaderColor ())
data GetColHeaderColor a
getColHeaderColor :: (FindOp a (GetColHeaderColor ()) (Match r), Op (GetColHeaderColor ()) r a impl) => Ref a -> impl
getColHeaderColor = dispatch (undefined :: GetColHeaderColor ())
data SetRowHeight a
setRowHeight :: (FindOp a (SetRowHeight ()) (Match r), Op (SetRowHeight ()) r a impl) => Ref a -> impl
setRowHeight = dispatch (undefined :: SetRowHeight ())
data GetRowHeight a
getRowHeight :: (FindOp a (GetRowHeight ()) (Match r), Op (GetRowHeight ()) r a impl) => Ref a -> impl
getRowHeight = dispatch (undefined :: GetRowHeight ())
data SetColWidth a
setColWidth :: (FindOp a (SetColWidth ()) (Match r), Op (SetColWidth ()) r a impl) => Ref a -> impl
setColWidth = dispatch (undefined :: SetColWidth ())
data GetColWidth a
getColWidth :: (FindOp a (GetColWidth ()) (Match r), Op (GetColWidth ()) r a impl) => Ref a -> impl
getColWidth = dispatch (undefined :: GetColWidth ())
data SetRowHeightAll a
setRowHeightAll :: (FindOp a (SetRowHeightAll ()) (Match r), Op (SetRowHeightAll ()) r a impl) => Ref a -> impl
setRowHeightAll = dispatch (undefined :: SetRowHeightAll ())
data SetColWidthAll a
setColWidthAll :: (FindOp a (SetColWidthAll ()) (Match r), Op (SetColWidthAll ()) r a impl) => Ref a -> impl
setColWidthAll = dispatch (undefined :: SetColWidthAll ())
data SetRowPosition a
setRowPosition :: (FindOp a (SetRowPosition ()) (Match r), Op (SetRowPosition ()) r a impl) => Ref a -> impl
setRowPosition = dispatch (undefined :: SetRowPosition ())
data SetColPosition a
setColPosition :: (FindOp a (SetColPosition ()) (Match r), Op (SetColPosition ()) r a impl) => Ref a -> impl
setColPosition = dispatch (undefined :: SetColPosition ())
data GetRowPosition a
getRowPosition :: (FindOp a (GetRowPosition ()) (Match r), Op (GetRowPosition ()) r a impl) => Ref a -> impl
getRowPosition = dispatch (undefined :: GetRowPosition ())
data GetColPosition a
getColPosition :: (FindOp a (GetColPosition ()) (Match r), Op (GetColPosition ()) r a impl) => Ref a -> impl
getColPosition = dispatch (undefined :: GetColPosition ())
data SetTopRow a
setTopRow :: (FindOp a (SetTopRow ()) (Match r), Op (SetTopRow ()) r a impl) => Ref a -> impl
setTopRow = dispatch (undefined :: SetTopRow ())
data GetTopRow a
getTopRow :: (FindOp a (GetTopRow ()) (Match r), Op (GetTopRow ()) r a impl) => Ref a -> impl
getTopRow = dispatch (undefined :: GetTopRow ())
data IsSelected a
isSelected :: (FindOp a (IsSelected ()) (Match r), Op (IsSelected ()) r a impl) => Ref a -> impl
isSelected = dispatch (undefined :: IsSelected ())
data GetSelection a
getSelection :: (FindOp a (GetSelection ()) (Match r), Op (GetSelection ()) r a impl) => Ref a -> impl
getSelection = dispatch (undefined :: GetSelection ())
data SetSelection a
setSelection :: (FindOp a (SetSelection ()) (Match r), Op (SetSelection ()) r a impl) => Ref a -> impl
setSelection = dispatch (undefined :: SetSelection ())
data MoveCursor a
moveCursor :: (FindOp a (MoveCursor ()) (Match r), Op (MoveCursor ()) r a impl) => Ref a -> impl
moveCursor = dispatch (undefined :: MoveCursor ())
data CallbackRow a
callbackRow :: (FindOp a (CallbackRow ()) (Match r), Op (CallbackRow ()) r a impl) => Ref a -> impl
callbackRow = dispatch (undefined :: CallbackRow ())
data CallbackCol a
callbackCol :: (FindOp a (CallbackCol ()) (Match r), Op (CallbackCol ()) r a impl) => Ref a -> impl
callbackCol = dispatch (undefined :: CallbackCol ())
data CallbackContext a
callbackContext :: (FindOp a (CallbackContext ()) (Match r), Op (CallbackContext ()) r a impl) => Ref a -> impl
callbackContext = dispatch (undefined :: CallbackContext ())
data FindCell a
findCell :: (FindOp a (FindCell ()) (Match r), Op (FindCell ()) r a impl) => Ref a -> impl
findCell = dispatch (undefined :: FindCell ())
data ClearSuper a
clearSuper :: (FindOp a (ClearSuper ()) (Match r), Op (ClearSuper ()) r a impl) => Ref a -> impl
clearSuper = dispatch (undefined :: ClearSuper ())
data SetRowsSuper a
setRowsSuper :: (FindOp a (SetRowsSuper ()) (Match r), Op (SetRowsSuper ()) r a impl) => Ref a -> impl
setRowsSuper = dispatch (undefined :: SetRowsSuper ())
data SetColsSuper a
setColsSuper :: (FindOp a (SetColsSuper ()) (Match r), Op (SetColsSuper ()) r a impl) => Ref a -> impl
setColsSuper = dispatch (undefined :: SetColsSuper ())

data CTableRow parent
type TableRow = CTableRow Table
type TableRowFuncs =
  (Destroy
  (GetRows
  (SetType
  (GetType
  (SetRows
  (SetCols
  (ClearSuper
  (Clear
  (SetRowsSuper
  (SetColsSuper
  (Handle
  (ResizeSuper
  (Resize
  (GetRowSelected
  (SelectAllRows
  ())))))))))))))))
instance Functions TableRow TableRowFuncs

data GetType a
getType :: (FindOp a (GetType ()) (Match r), Op (GetType ()) r a impl) => Ref a -> impl
getType = dispatch (undefined :: GetType ())
data GetRowSelected a
getRowSelected :: (FindOp a (GetRowSelected ()) (Match r), Op (GetRowSelected ()) r a impl) => Ref a -> impl
getRowSelected = dispatch (undefined :: GetRowSelected ())
data SelectAllRows a
selectAllRows :: (FindOp a (SelectAllRows ()) (Match r), Op (SelectAllRows ()) r a impl) => Ref a -> impl
selectAllRows = dispatch (undefined :: SelectAllRows ())

data CGlWindow parent
type GlWindow = CGlWindow Window
type GlWindowFuncs =
  (DrawSuper
  (HideSuper
  (FlushSuper
  (Flush
  (ShowWidgetSuper
  (ResizeSuper
  (Hide
  (ShowWidget
  (Resize
  (Handle
  (HandleSuper
  (Destroy
  (GetValid
  (SetValid
  (Invalidate
  (GetContextValid
  (SetContextValid
  (CanDoWithM
  (CanDo
  (GetMode
  (SetMode
  (GetContext
  (SetContext
  (SetContextWithDestroyFlag
  (SwapBuffers
  (Ortho
  (CanDoOverlay
  (RedrawOverlay
  (HideOverlay
  (MakeOverlayCurrent
  ()))))))))))))))))))))))))))))))
instance Functions GlWindow GlWindowFuncs

data GetValid a
getValid :: (FindOp a (GetValid ()) (Match r), Op (GetValid ()) r a impl) => Ref a -> impl
getValid = dispatch (undefined :: GetValid ())
data SetValid a
setValid :: (FindOp a (SetValid ()) (Match r), Op (SetValid ()) r a impl) => Ref a -> impl
setValid = dispatch (undefined :: SetValid ())
data Invalidate a
invalidate :: (FindOp a (Invalidate ()) (Match r), Op (Invalidate ()) r a impl) => Ref a -> impl
invalidate = dispatch (undefined :: Invalidate ())
data GetContextValid a
getContextValid :: (FindOp a (GetContextValid ()) (Match r), Op (GetContextValid ()) r a impl) => Ref a -> impl
getContextValid = dispatch (undefined :: GetContextValid ())
data SetContextValid a
setContextValid :: (FindOp a (SetContextValid ()) (Match r), Op (SetContextValid ()) r a impl) => Ref a -> impl
setContextValid = dispatch (undefined :: SetContextValid ())
data CanDoWithM a
canDoWithM :: (FindOp a (CanDoWithM ()) (Match r), Op (CanDoWithM ()) r a impl) => Ref a -> impl
canDoWithM = dispatch (undefined :: CanDoWithM ())
data CanDo a
canDo :: (FindOp a (CanDo ()) (Match r), Op (CanDo ()) r a impl) => Ref a -> impl
canDo = dispatch (undefined :: CanDo ())
data GetContext a
getContext :: (FindOp a (GetContext ()) (Match r), Op (GetContext ()) r a impl) => Ref a -> impl
getContext = dispatch (undefined :: GetContext ())
data SetContext a
setContext :: (FindOp a (SetContext ()) (Match r), Op (SetContext ()) r a impl) => Ref a -> impl
setContext = dispatch (undefined :: SetContext ())
data SetContextWithDestroyFlag a
setContextWithDestroyFlag :: (FindOp a (SetContextWithDestroyFlag ()) (Match r), Op (SetContextWithDestroyFlag ()) r a impl) => Ref a -> impl
setContextWithDestroyFlag = dispatch (undefined :: SetContextWithDestroyFlag ())
data SwapBuffers a
swapBuffers :: (FindOp a (SwapBuffers ()) (Match r), Op (SwapBuffers ()) r a impl) => Ref a -> impl
swapBuffers = dispatch (undefined :: SwapBuffers ())
data Ortho a
ortho :: (FindOp a (Ortho ()) (Match r), Op (Ortho ()) r a impl) => Ref a -> impl
ortho = dispatch (undefined :: Ortho ())
data HideOverlay a
hideOverlay :: (FindOp a (HideOverlay ()) (Match r), Op (HideOverlay ()) r a impl) => Ref a -> impl
hideOverlay = dispatch (undefined :: HideOverlay ())
data MakeOverlayCurrent a
makeOverlayCurrent :: (FindOp a (MakeOverlayCurrent ()) (Match r), Op (MakeOverlayCurrent ()) r a impl) => Ref a -> impl
makeOverlayCurrent = dispatch (undefined :: MakeOverlayCurrent ())

data CBox parent
type Box = CBox Widget
instance Functions Box ()

data CBrowser parent
type Browser = CBrowser Group
type BrowserFuncs =
  (Handle
  (Destroy
  (Remove
  (Add
  (Insert
  (Move
  (Load
  (Swap
  (Clear
  (GetSize
  (SetSize
  (GetTopline
  (Lineposition
  (SetTopline
  (SetBottomline
  (SetMiddleline
  (Select
  (Selected
  (ShowWidgetLine
  (ShowWidget
  (HideLine
  (Hide
  (Visible
  (GetValue
  (SetValue
  (GetText
  (SetText
  (GetFormatChar
  (SetFormatChar
  (GetColumnChar
  (SetColumnChar
  (GetColumnWidths
  (SetColumnWidths
  (Displayed
  (MakeVisible
  (SetIcon
  (GetIcon
  (RemoveIcon
  (Deselect
  (DeselectAndCallback
  (GetPosition
  (SetPosition
  (GetHposition
  (SetHposition
  (GetHasScrollbar
  (SetHasScrollbar
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  (GetScrollbarSize
  (SetScrollbarSize
  (GetScrollbarWidth
  (SetScrollbarWidth
  (Sort
  (SortWithSortType
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
instance Functions Browser BrowserFuncs

data Move a
move :: (FindOp a (Move ()) (Match r), Op (Move ()) r a impl) => Ref a -> impl
move = dispatch (undefined :: Move ())
data Load a
load :: (FindOp a (Load ()) (Match r), Op (Load ()) r a impl) => Ref a -> impl
load = dispatch (undefined :: Load ())
data Swap a
swap :: (FindOp a (Swap ()) (Match r), Op (Swap ()) r a impl) => Ref a -> impl
swap = dispatch (undefined :: Swap ())
data GetTopline a
getTopline :: (FindOp a (GetTopline ()) (Match r), Op (GetTopline ()) r a impl) => Ref a -> impl
getTopline = dispatch (undefined :: GetTopline ())
data Lineposition a
lineposition :: (FindOp a (Lineposition ()) (Match r), Op (Lineposition ()) r a impl) => Ref a -> impl
lineposition = dispatch (undefined :: Lineposition ())
data SetTopline a
setTopline :: (FindOp a (SetTopline ()) (Match r), Op (SetTopline ()) r a impl) => Ref a -> impl
setTopline = dispatch (undefined :: SetTopline ())
data SetBottomline a
setBottomline :: (FindOp a (SetBottomline ()) (Match r), Op (SetBottomline ()) r a impl) => Ref a -> impl
setBottomline = dispatch (undefined :: SetBottomline ())
data SetMiddleline a
setMiddleline :: (FindOp a (SetMiddleline ()) (Match r), Op (SetMiddleline ()) r a impl) => Ref a -> impl
setMiddleline = dispatch (undefined :: SetMiddleline ())
data Select a
select :: (FindOp a (Select ()) (Match r), Op (Select ()) r a impl) => Ref a -> impl
select = dispatch (undefined :: Select ())
data Selected a
selected :: (FindOp a (Selected ()) (Match r), Op (Selected ()) r a impl) => Ref a -> impl
selected = dispatch (undefined :: Selected ())
data ShowWidgetLine a
showWidgetLine :: (FindOp a (ShowWidgetLine ()) (Match r), Op (ShowWidgetLine ()) r a impl) => Ref a -> impl
showWidgetLine = dispatch (undefined :: ShowWidgetLine ())
data HideLine a
hideLine :: (FindOp a (HideLine ()) (Match r), Op (HideLine ()) r a impl) => Ref a -> impl
hideLine = dispatch (undefined :: HideLine ())
data SetText a
setText :: (FindOp a (SetText ()) (Match r), Op (SetText ()) r a impl) => Ref a -> impl
setText = dispatch (undefined :: SetText ())
data GetFormatChar a
getFormatChar :: (FindOp a (GetFormatChar ()) (Match r), Op (GetFormatChar ()) r a impl) => Ref a -> impl
getFormatChar = dispatch (undefined :: GetFormatChar ())
data SetFormatChar a
setFormatChar :: (FindOp a (SetFormatChar ()) (Match r), Op (SetFormatChar ()) r a impl) => Ref a -> impl
setFormatChar = dispatch (undefined :: SetFormatChar ())
data GetColumnChar a
getColumnChar :: (FindOp a (GetColumnChar ()) (Match r), Op (GetColumnChar ()) r a impl) => Ref a -> impl
getColumnChar = dispatch (undefined :: GetColumnChar ())
data SetColumnChar a
setColumnChar :: (FindOp a (SetColumnChar ()) (Match r), Op (SetColumnChar ()) r a impl) => Ref a -> impl
setColumnChar = dispatch (undefined :: SetColumnChar ())
data GetColumnWidths a
getColumnWidths :: (FindOp a (GetColumnWidths ()) (Match r), Op (GetColumnWidths ()) r a impl) => Ref a -> impl
getColumnWidths = dispatch (undefined :: GetColumnWidths ())
data SetColumnWidths a
setColumnWidths :: (FindOp a (SetColumnWidths ()) (Match r), Op (SetColumnWidths ()) r a impl) => Ref a -> impl
setColumnWidths = dispatch (undefined :: SetColumnWidths ())
data Displayed a
displayed :: (FindOp a (Displayed ()) (Match r), Op (Displayed ()) r a impl) => Ref a -> impl
displayed = dispatch (undefined :: Displayed ())
data MakeVisible a
makeVisible :: (FindOp a (MakeVisible ()) (Match r), Op (MakeVisible ()) r a impl) => Ref a -> impl
makeVisible = dispatch (undefined :: MakeVisible ())
data RemoveIcon a
removeIcon :: (FindOp a (RemoveIcon ()) (Match r), Op (RemoveIcon ()) r a impl) => Ref a -> impl
removeIcon = dispatch (undefined :: RemoveIcon ())
data SelectOnly a
selectOnly :: (FindOp a (SelectOnly ()) (Match r), Op (SelectOnly ()) r a impl) => Ref a -> impl
selectOnly = dispatch (undefined :: SelectOnly ())
data SelectOnlyAndCallback a
selectOnlyAndCallback :: (FindOp a (SelectOnlyAndCallback ()) (Match r), Op (SelectOnlyAndCallback ()) r a impl) => Ref a -> impl
selectOnlyAndCallback = dispatch (undefined :: SelectOnlyAndCallback ())
data Deselect a
deselect :: (FindOp a (Deselect ()) (Match r), Op (Deselect ()) r a impl) => Ref a -> impl
deselect = dispatch (undefined :: Deselect ())
data DeselectAndCallback a
deselectAndCallback :: (FindOp a (DeselectAndCallback ()) (Match r), Op (DeselectAndCallback ()) r a impl) => Ref a -> impl
deselectAndCallback = dispatch (undefined :: DeselectAndCallback ())
data GetHposition a
getHposition :: (FindOp a (GetHposition ()) (Match r), Op (GetHposition ()) r a impl) => Ref a -> impl
getHposition = dispatch (undefined :: GetHposition ())
data SetHposition a
setHposition :: (FindOp a (SetHposition ()) (Match r), Op (SetHposition ()) r a impl) => Ref a -> impl
setHposition = dispatch (undefined :: SetHposition ())
data GetHasScrollbar a
getHasScrollbar :: (FindOp a (GetHasScrollbar ()) (Match r), Op (GetHasScrollbar ()) r a impl) => Ref a -> impl
getHasScrollbar = dispatch (undefined :: GetHasScrollbar ())
data SetHasScrollbar a
setHasScrollbar :: (FindOp a (SetHasScrollbar ()) (Match r), Op (SetHasScrollbar ()) r a impl) => Ref a -> impl
setHasScrollbar = dispatch (undefined :: SetHasScrollbar ())
data GetScrollbarSize a
getScrollbarSize :: (FindOp a (GetScrollbarSize ()) (Match r), Op (GetScrollbarSize ()) r a impl) => Ref a -> impl
getScrollbarSize = dispatch (undefined :: GetScrollbarSize ())
data SetScrollbarSize a
setScrollbarSize :: (FindOp a (SetScrollbarSize ()) (Match r), Op (SetScrollbarSize ()) r a impl) => Ref a -> impl
setScrollbarSize = dispatch (undefined :: SetScrollbarSize ())
data GetScrollbarWidth a
getScrollbarWidth :: (FindOp a (GetScrollbarWidth ()) (Match r), Op (GetScrollbarWidth ()) r a impl) => Ref a -> impl
getScrollbarWidth = dispatch (undefined :: GetScrollbarWidth ())
data SetScrollbarWidth a
setScrollbarWidth :: (FindOp a (SetScrollbarWidth ()) (Match r), Op (SetScrollbarWidth ()) r a impl) => Ref a -> impl
setScrollbarWidth = dispatch (undefined :: SetScrollbarWidth ())
data SortWithSortType a
sortWithSortType :: (FindOp a (SortWithSortType ()) (Match r), Op (SortWithSortType ()) r a impl) => Ref a -> impl
sortWithSortType = dispatch (undefined :: SortWithSortType ())
data Sort a
sort :: (FindOp a (Sort ()) (Match r), Op (Sort ()) r a impl) => Ref a -> impl
sort = dispatch (undefined :: Sort ())

data CSelectBrowser parent
type SelectBrowser = CSelectBrowser Browser
instance Functions SelectBrowser ()

data CIntInput parent
type IntInput = CIntInput Input
instance Functions IntInput ()

data CClock parent
type Clock = CClock Widget
type ClockFuncs =
  (Handle
  (GetValue
  (GetValueSinceEpoch
  (SetValue
  ()))))

instance Functions Clock ClockFuncs
data GetValueSinceEpoch a
getValueSinceEpoch :: (FindOp a (GetValueSinceEpoch ()) (Match r), Op (GetValueSinceEpoch ()) r a impl) => Ref a -> impl
getValueSinceEpoch = dispatch (undefined :: GetValueSinceEpoch ())

data CTreePrefs parent
type TreePrefs = CTreePrefs Base
type TreePrefsFuncs =
  (GetItemLabelfont
  (GetItemLabelsize
  (SetItemLabelsize
  (SetItemLabelfgcolor
  (GetItemLabelbgcolor
  (SetItemLabelbgcolor
  (GetLabelfont
  (SetLabelfont
  (GetLabelsize
  (SetLabelsize
  (GetLabelfgcolor
  (SetLabelfgcolor
  (GetLabelbgcolor
  (SetLabelbgcolor
  (GetMarginleft
  (SetMarginleft
  (GetMargintop
  (SetMargintop
  (GetOpenchildMarginbottom
  (SetOpenchildMarginbottom
  (GetUsericonmarginleft
  (SetUsericonmarginleft
  (GetLabelmarginleft
  (SetLabelmarginleft
  (GetLinespacing
  (SetLinespacing
  (GetConnectorcolor
  (SetConnectorcolor
  (GetConnectorstyle
  (SetConnectorstyle
  (GetConnectorwidth
  (SetConnectorwidth
  (GetOpenicon
  (SetOpenicon
  (GetCloseicon
  (SetCloseicon
  (GetUsericon
  (SetUsericon
  (GetShowcollapse
  (SetShowcollapse
  (GetSortorder
  (SetSortorder
  (GetSelectbox
  (SetSelectbox
  (GetShowroot
  (SetShowroot
  (GetSelectmode
  (SetSelectmode
  ()))))))))))))))))))))))))))))))))))))))))))))))))
instance Functions TreePrefs TreePrefsFuncs

data GetItemLabelfont a
getItemLabelfont :: (FindOp a (GetItemLabelfont ()) (Match r), Op (GetItemLabelfont ()) r a impl) => Ref a -> impl
getItemLabelfont = dispatch (undefined :: GetItemLabelfont ())
data GetItemLabelsize a
getItemLabelsize :: (FindOp a (GetItemLabelsize ()) (Match r), Op (GetItemLabelsize ()) r a impl) => Ref a -> impl
getItemLabelsize = dispatch (undefined :: GetItemLabelsize ())
data SetItemLabelsize a
setItemLabelsize :: (FindOp a (SetItemLabelsize ()) (Match r), Op (SetItemLabelsize ()) r a impl) => Ref a -> impl
setItemLabelsize = dispatch (undefined :: SetItemLabelsize ())
data SetItemLabelfgcolor a
setItemLabelfgcolor :: (FindOp a (SetItemLabelfgcolor ()) (Match r), Op (SetItemLabelfgcolor ()) r a impl) => Ref a -> impl
setItemLabelfgcolor = dispatch (undefined :: SetItemLabelfgcolor ())
data GetItemLabelbgcolor a
getItemLabelbgcolor :: (FindOp a (GetItemLabelbgcolor ()) (Match r), Op (GetItemLabelbgcolor ()) r a impl) => Ref a -> impl
getItemLabelbgcolor = dispatch (undefined :: GetItemLabelbgcolor ())
data SetItemLabelbgcolor a
setItemLabelbgcolor :: (FindOp a (SetItemLabelbgcolor ()) (Match r), Op (SetItemLabelbgcolor ()) r a impl) => Ref a -> impl
setItemLabelbgcolor = dispatch (undefined :: SetItemLabelbgcolor ())
data GetLabelfgcolor a
getLabelfgcolor :: (FindOp a (GetLabelfgcolor ()) (Match r), Op (GetLabelfgcolor ()) r a impl) => Ref a -> impl
getLabelfgcolor = dispatch (undefined :: GetLabelfgcolor ())
data SetLabelfgcolor a
setLabelfgcolor :: (FindOp a (SetLabelfgcolor ()) (Match r), Op (SetLabelfgcolor ()) r a impl) => Ref a -> impl
setLabelfgcolor = dispatch (undefined :: SetLabelfgcolor ())
data GetLabelbgcolor a
getLabelbgcolor :: (FindOp a (GetLabelbgcolor ()) (Match r), Op (GetLabelbgcolor ()) r a impl) => Ref a -> impl
getLabelbgcolor = dispatch (undefined :: GetLabelbgcolor ())
data SetLabelbgcolor a
setLabelbgcolor :: (FindOp a (SetLabelbgcolor ()) (Match r), Op (SetLabelbgcolor ()) r a impl) => Ref a -> impl
setLabelbgcolor = dispatch (undefined :: SetLabelbgcolor ())
data GetMarginleft a
getMarginleft :: (FindOp a (GetMarginleft ()) (Match r), Op (GetMarginleft ()) r a impl) => Ref a -> impl
getMarginleft = dispatch (undefined :: GetMarginleft ())
data SetMarginleft a
setMarginleft :: (FindOp a (SetMarginleft ()) (Match r), Op (SetMarginleft ()) r a impl) => Ref a -> impl
setMarginleft = dispatch (undefined :: SetMarginleft ())
data GetMargintop a
getMargintop :: (FindOp a (GetMargintop ()) (Match r), Op (GetMargintop ()) r a impl) => Ref a -> impl
getMargintop = dispatch (undefined :: GetMargintop ())
data SetMargintop a
setMargintop :: (FindOp a (SetMargintop ()) (Match r), Op (SetMargintop ()) r a impl) => Ref a -> impl
setMargintop = dispatch (undefined :: SetMargintop ())
data GetOpenchildMarginbottom a
getOpenchildMarginbottom :: (FindOp a (GetOpenchildMarginbottom ()) (Match r), Op (GetOpenchildMarginbottom ()) r a impl) => Ref a -> impl
getOpenchildMarginbottom = dispatch (undefined :: GetOpenchildMarginbottom ())
data SetOpenchildMarginbottom a
setOpenchildMarginbottom :: (FindOp a (SetOpenchildMarginbottom ()) (Match r), Op (SetOpenchildMarginbottom ()) r a impl) => Ref a -> impl
setOpenchildMarginbottom = dispatch (undefined :: SetOpenchildMarginbottom ())
data GetUsericonmarginleft a
getUsericonmarginleft :: (FindOp a (GetUsericonmarginleft ()) (Match r), Op (GetUsericonmarginleft ()) r a impl) => Ref a -> impl
getUsericonmarginleft = dispatch (undefined :: GetUsericonmarginleft ())
data SetUsericonmarginleft a
setUsericonmarginleft :: (FindOp a (SetUsericonmarginleft ()) (Match r), Op (SetUsericonmarginleft ()) r a impl) => Ref a -> impl
setUsericonmarginleft = dispatch (undefined :: SetUsericonmarginleft ())
data GetLabelmarginleft a
getLabelmarginleft :: (FindOp a (GetLabelmarginleft ()) (Match r), Op (GetLabelmarginleft ()) r a impl) => Ref a -> impl
getLabelmarginleft = dispatch (undefined :: GetLabelmarginleft ())
data SetLabelmarginleft a
setLabelmarginleft :: (FindOp a (SetLabelmarginleft ()) (Match r), Op (SetLabelmarginleft ()) r a impl) => Ref a -> impl
setLabelmarginleft = dispatch (undefined :: SetLabelmarginleft ())
data GetLinespacing a
getLinespacing :: (FindOp a (GetLinespacing ()) (Match r), Op (GetLinespacing ()) r a impl) => Ref a -> impl
getLinespacing = dispatch (undefined :: GetLinespacing ())
data SetLinespacing a
setLinespacing :: (FindOp a (SetLinespacing ()) (Match r), Op (SetLinespacing ()) r a impl) => Ref a -> impl
setLinespacing = dispatch (undefined :: SetLinespacing ())
data GetConnectorcolor a
getConnectorcolor :: (FindOp a (GetConnectorcolor ()) (Match r), Op (GetConnectorcolor ()) r a impl) => Ref a -> impl
getConnectorcolor = dispatch (undefined :: GetConnectorcolor ())
data SetConnectorcolor a
setConnectorcolor :: (FindOp a (SetConnectorcolor ()) (Match r), Op (SetConnectorcolor ()) r a impl) => Ref a -> impl
setConnectorcolor = dispatch (undefined :: SetConnectorcolor ())
data GetConnectorstyle a
getConnectorstyle :: (FindOp a (GetConnectorstyle ()) (Match r), Op (GetConnectorstyle ()) r a impl) => Ref a -> impl
getConnectorstyle = dispatch (undefined :: GetConnectorstyle ())
data SetConnectorstyle a
setConnectorstyle :: (FindOp a (SetConnectorstyle ()) (Match r), Op (SetConnectorstyle ()) r a impl) => Ref a -> impl
setConnectorstyle = dispatch (undefined :: SetConnectorstyle ())
data GetConnectorwidth a
getConnectorwidth :: (FindOp a (GetConnectorwidth ()) (Match r), Op (GetConnectorwidth ()) r a impl) => Ref a -> impl
getConnectorwidth = dispatch (undefined :: GetConnectorwidth ())
data SetConnectorwidth a
setConnectorwidth :: (FindOp a (SetConnectorwidth ()) (Match r), Op (SetConnectorwidth ()) r a impl) => Ref a -> impl
setConnectorwidth = dispatch (undefined :: SetConnectorwidth ())
data GetOpenicon a
getOpenicon :: (FindOp a (GetOpenicon ()) (Match r), Op (GetOpenicon ()) r a impl) => Ref a -> impl
getOpenicon = dispatch (undefined :: GetOpenicon ())
data SetOpenicon a
setOpenicon :: (FindOp a (SetOpenicon ()) (Match r), Op (SetOpenicon ()) r a impl) => Ref a -> impl
setOpenicon = dispatch (undefined :: SetOpenicon ())
data GetCloseicon a
getCloseicon :: (FindOp a (GetCloseicon ()) (Match r), Op (GetCloseicon ()) r a impl) => Ref a -> impl
getCloseicon = dispatch (undefined :: GetCloseicon ())
data SetCloseicon a
setCloseicon :: (FindOp a (SetCloseicon ()) (Match r), Op (SetCloseicon ()) r a impl) => Ref a -> impl
setCloseicon = dispatch (undefined :: SetCloseicon ())
data GetUsericon a
getUsericon :: (FindOp a (GetUsericon ()) (Match r), Op (GetUsericon ()) r a impl) => Ref a -> impl
getUsericon = dispatch (undefined :: GetUsericon ())
data SetUsericon a
setUsericon :: (FindOp a (SetUsericon ()) (Match r), Op (SetUsericon ()) r a impl) => Ref a -> impl
setUsericon = dispatch (undefined :: SetUsericon ())
data GetShowcollapse a
getShowcollapse :: (FindOp a (GetShowcollapse ()) (Match r), Op (GetShowcollapse ()) r a impl) => Ref a -> impl
getShowcollapse = dispatch (undefined :: GetShowcollapse ())
data SetShowcollapse a
setShowcollapse :: (FindOp a (SetShowcollapse ()) (Match r), Op (SetShowcollapse ()) r a impl) => Ref a -> impl
setShowcollapse = dispatch (undefined :: SetShowcollapse ())
data GetSortorder a
getSortorder :: (FindOp a (GetSortorder ()) (Match r), Op (GetSortorder ()) r a impl) => Ref a -> impl
getSortorder = dispatch (undefined :: GetSortorder ())
data SetSortorder a
setSortorder :: (FindOp a (SetSortorder ()) (Match r), Op (SetSortorder ()) r a impl) => Ref a -> impl
setSortorder = dispatch (undefined :: SetSortorder ())
data GetSelectbox a
getSelectbox :: (FindOp a (GetSelectbox ()) (Match r), Op (GetSelectbox ()) r a impl) => Ref a -> impl
getSelectbox = dispatch (undefined :: GetSelectbox ())
data SetSelectbox a
setSelectbox :: (FindOp a (SetSelectbox ()) (Match r), Op (SetSelectbox ()) r a impl) => Ref a -> impl
setSelectbox = dispatch (undefined :: SetSelectbox ())
data GetShowroot a
getShowroot :: (FindOp a (GetShowroot ()) (Match r), Op (GetShowroot ()) r a impl) => Ref a -> impl
getShowroot = dispatch (undefined :: GetShowroot ())
data SetShowroot a
setShowroot :: (FindOp a (SetShowroot ()) (Match r), Op (SetShowroot ()) r a impl) => Ref a -> impl
setShowroot = dispatch (undefined :: SetShowroot ())
data GetSelectmode a
getSelectmode :: (FindOp a (GetSelectmode ()) (Match r), Op (GetSelectmode ()) r a impl) => Ref a -> impl
getSelectmode = dispatch (undefined :: GetSelectmode ())
data SetSelectmode a
setSelectmode :: (FindOp a (SetSelectmode ()) (Match r), Op (SetSelectmode ()) r a impl) => Ref a -> impl
setSelectmode = dispatch (undefined :: SetSelectmode ())

data CTreeItem parent
type TreeItem = CTreeItem Base
type TreeItemFuncs =
  (Destroy
  (GetX
  (GetY
  (GetW
  (GetH
  (GetX
  (ShowSelf
  (SetLabel
  (GetLabel
  (SetLabelfont
  (GetLabelfont
  (SetLabelsize
  (GetLabelsize
  (SetLabelcolor
  (GetLabelcolor
  (GetLabelfgcolor
  (SetLabelfgcolor
  (SetLabelbgcolor
  (GetLabelbgcolor
  (SetWidget
  (GetWidget
  (Children
  (Child
  (HasChildren
  (FindChild
  (RemoveChild
  (RemoveChild
  (ClearChildren
  (SwapChildren
  (SwapChildrenByTreeItem
  (FindInChildren
  (FindItem
  (Add
  (AddAt
  (Insert
  (InsertAbove
  (Deparent
  (Reparent
  (Move
  (MoveTo
  (GetDepth
  (Prev
  (Next
  (NextSibling
  (PrevSibling
  (UpdatePrevNext
  (NextDisplayed
  (PrevDisplayed
  (GetParent
  (SetParent
  (Open
  (Close
  (IsOpen
  (IsClose
  (OpenToggle
  (Select
  (SelectWithVal
  (SelectToggle
  (SelectAll
  (Deselect
  (DeselectAll
  (IsSelected
  (Activate
  (ActivateWithVal
  (IsActive
  (Visible
  (IsVisible
  (VisibleR
  (SetUsericon
  (GetUsericon
  (FindClicked
  (EventOnCollapseIcon
  (EventOnLabel
  (IsRoot
  (LabelX
  (LabelY
  (LabelW
  (LabelH
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

instance Functions TreeItem TreeItemFuncs

data ShowSelf a
showSelf :: (FindOp a (ShowSelf ()) (Match r), Op (ShowSelf ()) r a impl) => Ref a -> impl
showSelf = dispatch (undefined :: ShowSelf ())
data SetWidget a
setWidget :: (FindOp a (SetWidget ()) (Match r), Op (SetWidget ()) r a impl) => Ref a -> impl
setWidget = dispatch (undefined :: SetWidget ())
data GetWidget a
getWidget :: (FindOp a (GetWidget ()) (Match r), Op (GetWidget ()) r a impl) => Ref a -> impl
getWidget = dispatch (undefined :: GetWidget ())
data Child a
child :: (FindOp a (Child ()) (Match r), Op (Child ()) r a impl) => Ref a -> impl
child = dispatch (undefined :: Child ())
data HasChildren a
hasChildren :: (FindOp a (HasChildren ()) (Match r), Op (HasChildren ()) r a impl) => Ref a -> impl
hasChildren = dispatch (undefined :: HasChildren ())
data FindChild a
findChild :: (FindOp a (FindChild ()) (Match r), Op (FindChild ()) r a impl) => Ref a -> impl
findChild = dispatch (undefined :: FindChild ())
data RemoveChild a
removeChild :: (FindOp a (RemoveChild ()) (Match r), Op (RemoveChild ()) r a impl) => Ref a -> impl
removeChild = dispatch (undefined :: RemoveChild ())
data ClearChildren a
clearChildren :: (FindOp a (ClearChildren ()) (Match r), Op (ClearChildren ()) r a impl) => Ref a -> impl
clearChildren = dispatch (undefined :: ClearChildren ())
data SwapChildren a
swapChildren :: (FindOp a (SwapChildren ()) (Match r), Op (SwapChildren ()) r a impl) => Ref a -> impl
swapChildren = dispatch (undefined :: SwapChildren ())
data SwapChildrenByTreeItem a
swapChildrenByTreeItem :: (FindOp a (SwapChildrenByTreeItem ()) (Match r), Op (SwapChildrenByTreeItem ()) r a impl) => Ref a -> impl
swapChildrenByTreeItem = dispatch (undefined :: SwapChildrenByTreeItem ())
data FindInChildren a
findInChildren :: (FindOp a (FindInChildren ()) (Match r), Op (FindInChildren ()) r a impl) => Ref a -> impl
findInChildren = dispatch (undefined :: FindInChildren ())
data FindItem a
findItem :: (FindOp a (FindItem ()) (Match r), Op (FindItem ()) r a impl) => Ref a -> impl
findItem = dispatch (undefined :: FindItem ())
data AddAt a
addAt :: (FindOp a (AddAt ()) (Match r), Op (AddAt ()) r a impl) => Ref a -> impl
addAt = dispatch (undefined :: AddAt ())
data InsertAbove a
insertAbove :: (FindOp a (InsertAbove ()) (Match r), Op (InsertAbove ()) r a impl) => Ref a -> impl
insertAbove = dispatch (undefined :: InsertAbove ())
data Deparent a
deparent :: (FindOp a (Deparent ()) (Match r), Op (Deparent ()) r a impl) => Ref a -> impl
deparent = dispatch (undefined :: Deparent ())
data Reparent a
reparent :: (FindOp a (Reparent ()) (Match r), Op (Reparent ()) r a impl) => Ref a -> impl
reparent = dispatch (undefined :: Reparent ())
data MoveTo a
moveTo :: (FindOp a (MoveTo ()) (Match r), Op (MoveTo ()) r a impl) => Ref a -> impl
moveTo = dispatch (undefined :: MoveTo ())
data GetDepth a
getDepth :: (FindOp a (GetDepth ()) (Match r), Op (GetDepth ()) r a impl) => Ref a -> impl
getDepth = dispatch (undefined :: GetDepth ())
data NextSibling a
nextSibling :: (FindOp a (NextSibling ()) (Match r), Op (NextSibling ()) r a impl) => Ref a -> impl
nextSibling = dispatch (undefined :: NextSibling ())
data PrevSibling a
prevSibling :: (FindOp a (PrevSibling ()) (Match r), Op (PrevSibling ()) r a impl) => Ref a -> impl
prevSibling = dispatch (undefined :: PrevSibling ())
data UpdatePrevNext a
updatePrevNext :: (FindOp a (UpdatePrevNext ()) (Match r), Op (UpdatePrevNext ()) r a impl) => Ref a -> impl
updatePrevNext = dispatch (undefined :: UpdatePrevNext ())
data NextDisplayed a
nextDisplayed :: (FindOp a (NextDisplayed ()) (Match r), Op (NextDisplayed ()) r a impl) => Ref a -> impl
nextDisplayed = dispatch (undefined :: NextDisplayed ())
data PrevDisplayed a
prevDisplayed :: (FindOp a (PrevDisplayed ()) (Match r), Op (PrevDisplayed ()) r a impl) => Ref a -> impl
prevDisplayed = dispatch (undefined :: PrevDisplayed ())
data Open a
open :: (FindOp a (Open ()) (Match r), Op (Open ()) r a impl) => Ref a -> impl
open = dispatch (undefined :: Open ())
data Close a
close :: (FindOp a (Close ()) (Match r), Op (Close ()) r a impl) => Ref a -> impl
close = dispatch (undefined :: Close ())
data IsOpen a
isOpen :: (FindOp a (IsOpen ()) (Match r), Op (IsOpen ()) r a impl) => Ref a -> impl
isOpen = dispatch (undefined :: IsOpen ())
data IsClose a
isClose :: (FindOp a (IsClose ()) (Match r), Op (IsClose ()) r a impl) => Ref a -> impl
isClose = dispatch (undefined :: IsClose ())
data OpenToggle a
openToggle :: (FindOp a (OpenToggle ()) (Match r), Op (OpenToggle ()) r a impl) => Ref a -> impl
openToggle = dispatch (undefined :: OpenToggle ())
data SelectWithVal a
selectWithVal :: (FindOp a (SelectWithVal ()) (Match r), Op (SelectWithVal ()) r a impl) => Ref a -> impl
selectWithVal = dispatch (undefined :: SelectWithVal ())
data SelectToggle a
selectToggle :: (FindOp a (SelectToggle ()) (Match r), Op (SelectToggle ()) r a impl) => Ref a -> impl
selectToggle = dispatch (undefined :: SelectToggle ())
data SelectAll a
selectAll :: (FindOp a (SelectAll ()) (Match r), Op (SelectAll ()) r a impl) => Ref a -> impl
selectAll = dispatch (undefined :: SelectAll ())
data DeselectAll a
deselectAll :: (FindOp a (DeselectAll ()) (Match r), Op (DeselectAll ()) r a impl) => Ref a -> impl
deselectAll = dispatch (undefined :: DeselectAll ())
data ActivateWithVal a
activateWithVal :: (FindOp a (ActivateWithVal ()) (Match r), Op (ActivateWithVal ()) r a impl) => Ref a -> impl
activateWithVal = dispatch (undefined :: ActivateWithVal ())
data IsActive a
isActive :: (FindOp a (IsActive ()) (Match r), Op (IsActive ()) r a impl) => Ref a -> impl
isActive = dispatch (undefined :: IsActive ())
data IsVisible a
isVisible :: (FindOp a (IsVisible ()) (Match r), Op (IsVisible ()) r a impl) => Ref a -> impl
isVisible = dispatch (undefined :: IsVisible ())
data VisibleR a
visibleR :: (FindOp a (VisibleR ()) (Match r), Op (VisibleR ()) r a impl) => Ref a -> impl
visibleR = dispatch (undefined :: VisibleR ())
data FindClicked a
findClicked :: (FindOp a (FindClicked ()) (Match r), Op (FindClicked ()) r a impl) => Ref a -> impl
findClicked = dispatch (undefined :: FindClicked ())
data EventOnCollapseIcon a
eventOnCollapseIcon :: (FindOp a (EventOnCollapseIcon ()) (Match r), Op (EventOnCollapseIcon ()) r a impl) => Ref a -> impl
eventOnCollapseIcon = dispatch (undefined :: EventOnCollapseIcon ())
data EventOnLabel a
eventOnLabel :: (FindOp a (EventOnLabel ()) (Match r), Op (EventOnLabel ()) r a impl) => Ref a -> impl
eventOnLabel = dispatch (undefined :: EventOnLabel ())
data IsRoot a
isRoot :: (FindOp a (IsRoot ()) (Match r), Op (IsRoot ()) r a impl) => Ref a -> impl
isRoot = dispatch (undefined :: IsRoot ())
data LabelX a
labelX :: (FindOp a (LabelX ()) (Match r), Op (LabelX ()) r a impl) => Ref a -> impl
labelX = dispatch (undefined :: LabelX ())
data LabelY a
labelY :: (FindOp a (LabelY ()) (Match r), Op (LabelY ()) r a impl) => Ref a -> impl
labelY = dispatch (undefined :: LabelY ())
data LabelW a
labelW :: (FindOp a (LabelW ()) (Match r), Op (LabelW ()) r a impl) => Ref a -> impl
labelW = dispatch (undefined :: LabelW ())
data LabelH a
labelH :: (FindOp a (LabelH ()) (Match r), Op (LabelH ()) r a impl) => Ref a -> impl
labelH = dispatch (undefined :: LabelH ())
