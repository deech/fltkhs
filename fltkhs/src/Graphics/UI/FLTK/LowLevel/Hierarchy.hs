{-# LANGUAGE TypeSynonymInstances, FlexibleContexts, EmptyDataDecls, CPP #-}
#define MAKE_METHOD(Datatype, Method) \
data Datatype a; \
Method :: (HasCallStack, Match r ~ FindOp a a (Datatype ()), Op (Datatype ()) r a impl) => Ref a -> impl; \
Method aRef = (unsafePerformIO $ withRef aRef (\_ -> return ())) `seq` dispatch (undefined :: Datatype()) aRef

module Graphics.UI.FLTK.LowLevel.Hierarchy
       (
         -- * Widget
         WidgetBase,
         Widget,
         WidgetBaseFuncs,
         WidgetFuncs,
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
         ClearChanged,
         clearChanged,
         Changed,
         changed,
         SetActive,
         setActive,
         ClearActive,
         clearActive,
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
         ClearDamageThenSet,
         clearDamageThenSet,
         ClearDamage,
         clearDamage,
         SetDamage,
         setDamage,
         SetDamageInside,
         setDamageInside,
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
         GetCallback,
         getCallback,
         SetCallback,
         setCallback,
         HasCallback,
         hasCallback,
         DrawBox,
         drawBox,
         DrawBoxWithBoxtype,
         drawBoxWithBoxtype,
         DrawBackdrop,
         drawBackdrop,
         DrawFocus,
         drawFocus,
         Flags,
         flags,
         SetFlag,
         setFlag,
         ClearFlag,
         clearFlag,
         -- * Group
         GroupBase,
         Group,
         DrawChild,
         drawChild,
         DrawChildren,
         drawChildren,
         DrawOutsideLabel,
         drawOutsideLabel,
         UpdateChild,
         updateChild,
         Begin,
         begin,
         End,
         end,
         Within,
         within,
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
         SetNotResizable,
         setNotResizable,
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
         InsertBefore,
         insertBefore,
         GetArray,
         getArray,
         GetChild,
         getChild,
         -- * Window
         WindowBase,
         Window,
         DrawSuper,
         drawSuper,
         HandleSuper,
         handleSuper,
         FlushSuper,
         flushSuper,
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
         SetIconRaw,
         setIconRaw,
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
         SingleWindowBase,
         SingleWindow,
         -- * DoubleWindow
         DoubleWindowBase,
         DoubleWindow,
         -- * OverlayWindow
         OverlayWindowBase,
         OverlayWindow,
         CanDoOverlay,
         canDoOverlay,
         RedrawOverlay,
         redrawOverlay,
         Flush,
         flush,
         -- * Button
         ButtonBase,
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
         LightButtonBase,
         LightButton,
         -- * RadioLightButton
         RadioLightButtonBase,
         RadioLightButton,
         -- * CheckButton
         CheckButtonBase,
         CheckButton,
         -- * ReturnButton
         ReturnButtonBase,
         ReturnButton,
         -- * RoundButton
         RoundButtonBase,
         RoundButton,
         -- * RepeatButton
         RepeatButtonBase,
         RepeatButton,
         -- * ToggleButton
         ToggleButtonBase,
         ToggleButton,
         -- * Valuator
         ValuatorBase,
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
         Range,
         range,
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
         SliderBase,
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
         FillSliderBase,
         FillSlider,
         -- * HorSlider
         HorSliderBase,
         HorSlider,
         -- * HorFillSider
         HorFillSliderBase,
         HorFillSlider,
         -- * NiceSlider
         NiceSliderBase,
         NiceSlider,
         -- * HorNiceSlider
         HorNiceSliderBase,
         HorNiceSlider,
         -- * MenuItem
         MenuItemBase,
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
         MenuPrimBase,
         MenuPrim,
         ItemPathname,
         itemPathname,
         ItemPathnameRecent,
         itemPathnameRecent,
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
         AddAndGetMenuItem,
         addAndGetMenuItem,
         -- * MenuBar
         MenuBarBase,
         MenuBar,
         -- * SysMenuBar
         SysMenuBarBase,
         SysMenuBar,
         -- * Choice,
         ChoiceBase,
         Choice,
         -- * MenuButton
         MenuButtonBase,
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
         Fail,
         fail,
         Scale,
         scale,
         GetDataW,
         getDataW,
         GetDataH,
         getDataH,
         GetDataSize,
         getDataSize,
         -- * Bitmap
         Bitmap,
         -- * Pixmap
         Pixmap,
         -- * CopySurface
         CopySurface,
         SetCurrent,
         setCurrent,
         -- * ImageSurface
         ImageSurface,
         GetOrigin,
         getOrigin,
         PrintableRect,
         printableRect,
         SetOrigin,
         setOrigin,
         GetOffscreenBeforeDelete,
         getOffscreenBeforeDelete,
         GetOffscreen,
         getOffscreen,
         -- * Adjuster
         AdjusterBase,
         Adjuster,
         SetSoft,
         setSoft,
         GetSoft,
         getSoft,
         -- * Dial
         DialBase,
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
         RollerBase,
         Roller,
         -- * Counter
         CounterBase,
         Counter,
         SetLstep,
         setLstep,
         -- * Scrollbar
         ScrollbarBase,
         Scrollbar,
         SetLinesize,
         setLinesize,
         GetLinesize,
         getLinesize,
         -- * ValueSlider
         ValueSliderBase,
         ValueSlider,
         -- * HorValueSlider
         HorValueSlider,
         -- * Input
         InputBase,
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
         DrawText,
         drawText,
         -- * Output
         OutputBase,
         Output,
         -- * ValueInput
         ValueInputBase,
         ValueInput,
         -- * ValueOutput
         ValueOutputBase,
         ValueOutput,
         -- * Progress
         ProgressBase,
         Progress,
         -- * Positioner
         PositionerBase,
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
         WizardBase,
         Wizard,
         Prev,
         prev,
         -- * Table
         TableBase,
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
         GetVisibleCells,
         getVisibleCells,
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
         SetTabCellNav,
         setTabCellNav,
         GetTabCellNav,
         getTabCellNav,
         -- * TableRow
         TableRowBase,
         TableRow,
         GetRowSelected,
         getRowSelected,
         SelectAllRows,
         selectAllRows,
         -- * GlWindow
         GlWindowBase,
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
         PixelsPerUnit,
         pixelsPerUnit,
         PixelH,
         pixelH,
         PixelW,
         pixelW,
         -- * Box
         Box,
         -- * Browser
         BrowserBase,
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
         SetScrollbarColor,
         setScrollbarColor,
         SetScrollbarSelectionColor,
         setScrollbarSelectionColor,
         Sort,
         sort,
         SortWithSortType,
         sortWithSortType,
         -- * SelectBrowser
         SelectBrowser,
         -- * IntInput
         IntInput,
         -- * Clock
         ClockBase,
         Clock,
         GetValueSinceEpoch,
         getValueSinceEpoch,
         GetShadow,
         getShadow,
         SetShadow,
         setShadow,
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
         SelectSet,
         selectSet,
         SelectToggle,
         selectToggle,
         SelectAll,
         selectAll,
         DeselectAll,
         deselectAll,
         ActivateWith,
         activateWith,
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
         labelH,
         -- * Tree
         TreeBase,
         Tree,
         RootLabel,
         rootLabel,
         Root,
         root,
         ItemClicked,
         itemClicked,
         FirstVisible,
         firstVisible,
         NextItem,
         nextItem,
         NextAfterItem,
         nextAfterItem,
         PrevBeforeItem,
         prevBeforeItem,
         GetLast,
         getLast,
         LastVisible,
         lastVisible,
         FirstSelectedItem,
         firstSelectedItem,
         LastSelectedItem,
         lastSelectedItem,
         NextSelectedItem,
         nextSelectedItem,
         NextSelectedItemAfterItem,
         nextSelectedItemAfterItem,
         OpenAndCallback,
         openAndCallback,
         OpenToggleAndCallback,
         openToggleAndCallback,
         TreeMenuItemLocator,
         treeMenuItemLocator,
         CloseAndCallback,
         closeAndCallback,
         SelectAndCallback,
         selectAndCallback,
         SelectToggleAndCallback,
         selectToggleAndCallback,
         SelectAllAndCallback,
         selectAllAndCallback,
         DeselectAllAndCallback,
         deselectAllAndCallback,
         SetItemFocus,
         setItemFocus,
         GetItemFocus,
         getItemFocus,
         IsSelectedWithItem,
         isSelectedWithItem,
         SetItemLabelfont,
         setItemLabelfont,
         GetItemLabelfgcolor,
         getItemLabelfgcolor,
         Selectmode,
         selectmode,
         ShowItemWithYoff,
         showItemWithYoff,
         ShowItemTop,
         showItemTop,
         ShowItemMiddle,
         showItemMiddle,
         ShowItemBottom,
         showItemBottom,
         Display,
         display,
         GetVposition,
         getVposition,
         SetVposition,
         setVposition,
         IsScrollbar,
         isScrollbar,
         IsVscrollVisible,
         isVscrollVisible,
         SetCallbackItem,
         setCallbackItem,
         GetCallbackItem,
         getCallbackItem,
         SetCallbackReason,
         setCallbackReason,
         GetCallbackReason,
         getCallbackReason,
         RecalcTree,
         recalcTree,
         SetMarginbottom,
         setMarginbottom,
         GetMarginbottom,
         getMarginbottom,
         SetWidgetmarginleft,
         setWidgetmarginleft,
         GetWidgetmarginleft,
         getWidgetmarginleft,
         SetItemReselectMode,
         setItemReselectMode,
         GetItemReselectMode,
         getItemReselectMode,
         SetItemDrawMode,
         setItemDrawMode,
         GetItemDrawMode,
         getItemDrawMode,
         -- * TextSelection
         TextSelection,
         Update,
         update,
         Start,
         start,
         SetSelected,
         setSelected,
         Includes,
         includes,
         -- * TextBuffer
         TextBuffer,
         InputFileWasTranscoded,
         inputFileWasTranscoded,
         FileEncodingWarningMessage,
         fileEncodingWarningMessage,
         GetLength,
         getLength,
         TextRange,
         textRange,
         CharAt,
         charAt,
         ByteAt,
         byteAt,
         AppendToBuffer,
         appendToBuffer,
         CanUndo,
         canUndo,
         Insertfile,
         insertfile,
         InsertfileWithBuflen,
         insertfileWithBuflen,
         Appendfile,
         appendfile,
         AppendfileWithBuflen,
         appendfileWithBuflen,
         Loadfile,
         loadfile,
         LoadfileWithBuflen,
         loadfileWithBuflen,
         Outputfile,
         outputfile,
         OutputfileWithBuflen,
         outputfileWithBuflen,
         Savefile,
         savefile,
         SavefileWithBuflen,
         savefileWithBuflen,
         GetTabDistance,
         getTabDistance,
         SetTabDistance,
         setTabDistance,
         Unselect,
         unselect,
         SelectionPosition,
         selectionPosition,
         SelectionText,
         selectionText,
         RemoveSelection,
         removeSelection,
         ReplaceSelection,
         replaceSelection,
         SecondarySelect,
         secondarySelect,
         SecondarySelected,
         secondarySelected,
         SecondaryUnselect,
         secondaryUnselect,
         SecondarySelectionPosition,
         secondarySelectionPosition,
         SecondarySelectionText,
         secondarySelectionText,
         RemoveSecondarySelection,
         removeSecondarySelection,
         ReplaceSecondarySelection,
         replaceSecondarySelection,
         GetHighlight,
         getHighlight,
         SetHighlight,
         setHighlight,
         Unhighlight,
         unhighlight,
         HighlightPosition,
         highlightPosition,
         HighlightText,
         highlightText,
         AddModifyCallback,
         addModifyCallback,
         RemoveModifyCallback,
         removeModifyCallback,
         CallModifyCallbacks,
         callModifyCallbacks,
         AddPredeleteCallback,
         addPredeleteCallback,
         RemovePredeleteCallback,
         removePredeleteCallback,
         CallPredeleteCallbacks,
         callPredeleteCallbacks,
         LineText,
         lineText,
         LineStart,
         lineStart,
         LineEnd,
         lineEnd,
         WordStart,
         wordStart,
         WordEnd,
         wordEnd,
         CountDisplayedCharacters,
         countDisplayedCharacters,
         SkipDisplayedCharacters,
         skipDisplayedCharacters,
         CountLines,
         countLines,
         SkipLines,
         skipLines,
         RewindLines,
         rewindLines,
         FindcharForward,
         findcharForward,
         FindcharBackward,
         findcharBackward,
         SearchForwardWithMatchcase,
         searchForwardWithMatchcase,
         SearchBackwardWithMatchcase,
         searchBackwardWithMatchcase,
         PrimarySelection,
         primarySelection,
         SecondarySelection,
         secondarySelection,
         HighlightSelection,
         highlightSelection,
         PrevChar,
         prevChar,
         PrevCharClipped,
         prevCharClipped,
         NextChar,
         nextChar,
         NextCharClipped,
         nextCharClipped,
         Utf8Align,
         utf8Align,
         -- * TextDisplay,
         TextDisplayBase,
         TextDisplay,
         SetBuffer,
         setBuffer,
         GetBuffer,
         getBuffer,
         RedisplayRange,
         redisplayRange,
         Scroll,
         scroll,
         Overstrike,
         overstrike,
         SetInsertPosition,
         setInsertPosition,
         GetInsertPosition,
         getInsertPosition,
         XyToPosition,
         xyToPosition,
         PositionToXy,
         positionToXy,
         InSelection,
         inSelection,
         ShowInsertPosition,
         showInsertPosition,
         MoveRight,
         moveRight,
         MoveLeft,
         moveLeft,
         MoveUp,
         moveUp,
         MoveDown,
         moveDown,
         NextWord,
         nextWord,
         PreviousWord,
         previousWord,
         ShowCursor,
         showCursor,
         SetCursorStyle,
         setCursorStyle,
         GetScrollbarAlign,
         getScrollbarAlign,
         SetScrollbarAlign,
         setScrollbarAlign,
         HighlightData,
         highlightData,
         PositionStyle,
         positionStyle,
         XToCol,
         xToCol,
         ColToX,
         colToX,
         SetLinenumberWidth,
         setLinenumberWidth,
         GetLinenumberWidth,
         getLinenumberWidth,
         SetLinenumberFont,
         setLinenumberFont,
         GetLinenumberFont,
         getLinenumberFont,
         SetLinenumberSize,
         setLinenumberSize,
         GetLinenumberSize,
         getLinenumberSize,
         SetLinenumberFgcolor,
         setLinenumberFgcolor,
         GetLinenumberFgcolor,
         getLinenumberFgcolor,
         SetLinenumberBgcolor,
         setLinenumberBgcolor,
         GetLinenumberBgcolor,
         getLinenumberBgcolor,
         SetLinenumberAlign,
         setLinenumberAlign,
         GetLinenumberAlign,
         getLinenumberAlign,
         SetLinenumberFormat,
         setLinenumberFormat,
         GetLinenumberFormat,
         getLinenumberFormat,
         WrapMode,
         wrapMode,
         -- * TextEditor
         TextEditorBase,
         TextEditor,
         SetInsertMode,
         setInsertMode,
         GetInsertMode,
         getInsertMode,
         GetDefaultKeyBindings,
         getDefaultKeyBindings,
         ReplaceKeyBindings,
         replaceKeyBindings,
         -- * NativeFileChooser
         NativeFileChooser,
         SetOptions,
         setOptions,
         GetOptions,
         getOptions,
         GetFilename,
         getFilename,
         GetFilenameAt,
         getFilenameAt,
         SetDirectory,
         setDirectory,
         GetDirectory,
         getDirectory,
         SetTitle,
         setTitle,
         GetTitle,
         getTitle,
         GetFilter,
         getFilter,
         SetFilter,
         setFilter,
         Filters,
         filters,
         SetFilterValue,
         setFilterValue,
         GetFilterValue,
         getFilterValue,
         SetPresetFile,
         setPresetFile,
         GetPresetFile,
         getPresetFile,
         GetErrmsg,
         getErrmsg,
         -- * Tile
         TileBase,
         Tile,
         PackBase,
         Pack,
         setSpacing,
         SetSpacing,
         getSpacing,
         GetSpacing,
         isHorizontal,
         IsHorizontal,
         -- * Scrolled AKA Scroll
         ScrolledBase,
         Scrolled,
         ScrollTo,
         scrollTo,
         Xposition,
         xposition,
         Yposition,
         yposition,
         -- * Tabs
         TabsBase,
         Tabs,
         GetPush,
         getPush,
         SetPush,
         setPush,
         Which,
         which,
         ClientArea,
         clientArea,
         TabPositions,
         tabPositions,
         TabHeight,
         tabHeight,
         GetTabAlign,
         getTabAlign,
         SetTabAlign,
         setTabAlign,
         -- * Spinner
         SpinnerBase,
         Spinner,
         GetFormat,
         getFormat,
         SetFormat,
         setFormat,
         -- * ColorChooser
         ColorChooserBase,
         ColorChooser,
         GetHue,
         getHue,
         GetSaturation,
         getSaturation,
         GetR,
         getR,
         GetG,
         getG,
         GetB,
         getB,
         SetHsv,
         setHsv,
         SetRgb,
         setRgb,
         GetRgb,
         getRgb,
         GetHsv,
         getHsv,
         -- * FileBrowser
         FileBrowserBase,
         FileBrowser,
         SetIconsize,
         setIconsize,
         GetIconsize,
         getIconsize,
         SetFiletype,
         setFiletype,
         GetFiletype,
         getFiletype,
         -- * RGBImage
         RGBImage,
         -- * JPEGImage
         JPEGImage,
         -- * BMPImage
         BMPImage,
         -- * GIFImage
         GIFImage,
         -- * XBMImage
         XBMImage,
         -- * XPMImage
         XPMImage,
         -- * PNGImage
         PNGImage,
         -- * PNMImage
         PNMImage,
         -- * FileInput
         FileInputBase,
         FileInput,
         GetErrorColor,
         getErrorColor,
         SetErrorColor,
         setErrorColor,
         ScreenDriver,
         SystemDriver,
         -- * SVGImage
         SVGImage,
         -- * SimpleTerminal
         SimpleTerminalBase,
         SimpleTerminal,
         SetStayAtBottom,
         setStayAtBottom,
         GetStayAtBottom,
         getStayAtBottom,
         SetHistoryLines,
         setHistoryLines,
         GetHistoryLines,
         getHistoryLines,
         SetAnsi,
         setAnsi,
         GetAnsi,
         getAnsi,
         SetStyleTable,
         setStyleTable,
         GetStyleTable,
         getStyleTable,
         GetStyleTableSize,
         getStyleTableSize,
         SetNormalStyleIndex,
         setNormalStyleIndex,
         GetNormalStyleIndex,
         getNormalStyleIndex,
         SetCurrentStyleIndex,
         setCurrentStyleIndex,
         GetCurrentStyleIndex,
         getCurrentStyleIndex,
         RemoveLines,
         removeLines,
         -- * MultiLabel
         MultiLabel,
         WidgetLabel,
         widgetLabel,
         MenuItemLabel,
         menuItemLabel
     )
where
import Prelude hiding (round, fail)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch
import GHC.Stack
import System.IO.Unsafe
type instance Functions Base = ()

data CWidgetBase parent
type WidgetBase = CWidgetBase Base
type WidgetBaseFuncs =
  (Activate
  (Active
  (ActiveR
  (Changed
  (ClearActive
  (ClearChanged
  (ClearDamage
  (ClearDamageThenSet
  (ClearFlag
  (ClearOutput
  (ClearVisible
  (ClearVisibleFocus
  (Contains
  (CopyTooltip
  (Deactivate
  (Destroy
  (DoCallback
  (DrawBackdrop
  (DrawBox
  (DrawBoxWithBoxtype
  (DrawFocus
  (DrawLabel
  (Flags
  (GetAlign
  (GetBox
  (GetCallback
  (GetColor
  (GetDamage
  (GetDeimage
  (GetH
  (GetImage
  (GetLabel
  (GetLabelcolor
  (GetLabelfont
  (GetLabelsize
  (GetLabeltype
  (GetOutput
  (GetParent
  (GetRectangle
  (GetSelectionColor
  (GetTooltip
  (GetTopWindow
  (GetTopWindowOffset
  (GetType_
  (GetVisible
  (GetVisibleFocus
  (GetVisibleR
  (GetW
  (GetWhen
  (GetWindow
  (GetX
  (GetY
  (Handle
  (HasCallback
  (Hide
  (Inside
  (MeasureLabel
  (ModifyVisibleFocus
  (Redraw
  (RedrawLabel
  (Resize
  (SetActive
  (SetAlign
  (SetBox
  (SetCallback
  (SetChanged
  (SetColor
  (SetColorWithBgSel
  (SetDamage
  (SetDamageInside
  (SetDeimage
  (SetFlag
  (SetImage
  (SetLabel
  (SetLabelcolor
  (SetLabelfont
  (SetLabelsize
  (SetLabeltype
  (SetOutput
  (SetParent
  (SetSelectionColor
  (SetTooltip
  (SetType
  (SetVisible
  (SetVisibleFocus
  (SetWhen
  (ShowWidget
  (TakeFocus
  (Takesevents
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
type instance Functions WidgetBase = WidgetBaseFuncs

data CWidget parent
type Widget = CWidget WidgetBase
type WidgetFuncs =
  (Draw
  (Destroy
  (Handle
  (Hide
  (Resize
  (ShowWidget
  ()))))))
type instance Functions Widget = WidgetFuncs

MAKE_METHOD(Destroy, destroy)
MAKE_METHOD(Handle, handle)
MAKE_METHOD(GetParent, getParent)
MAKE_METHOD(SetParent, setParent)
MAKE_METHOD(GetType_, getType_)
MAKE_METHOD(SetType, setType)
MAKE_METHOD(DrawLabel, drawLabel)
MAKE_METHOD(GetX, getX)
MAKE_METHOD(GetY, getY)
MAKE_METHOD(GetW, getW)
MAKE_METHOD(GetH, getH)
MAKE_METHOD(GetRectangle, getRectangle)
MAKE_METHOD(SetAlign, setAlign)
MAKE_METHOD(GetAlign, getAlign)
MAKE_METHOD(GetBox, getBox)
MAKE_METHOD(SetBox, setBox)
MAKE_METHOD(GetColor, getColor)
MAKE_METHOD(SetColor, setColor)
MAKE_METHOD(SetColorWithBgSel, setColorWithBgSel)
MAKE_METHOD(GetSelectionColor, getSelectionColor)
MAKE_METHOD(SetSelectionColor, setSelectionColor)
MAKE_METHOD(GetLabel, getLabel)
MAKE_METHOD(CopyLabel, copyLabel)
MAKE_METHOD(SetLabel, setLabel)
MAKE_METHOD(GetLabeltype,getLabeltype)
MAKE_METHOD(SetLabeltype,setLabeltype)
MAKE_METHOD(GetLabelcolor,getLabelcolor)
MAKE_METHOD(SetLabelcolor,setLabelcolor)
MAKE_METHOD(GetLabelfont,getLabelfont)
MAKE_METHOD(SetLabelfont,setLabelfont)
MAKE_METHOD(GetLabelsize,getLabelsize)
MAKE_METHOD(SetLabelsize,setLabelsize)
MAKE_METHOD(GetImage,getImage)
MAKE_METHOD(SetImage,setImage)
MAKE_METHOD(GetDeimage,getDeimage)
MAKE_METHOD(SetDeimage,setDeimage)
MAKE_METHOD(GetTooltip,getTooltip)
MAKE_METHOD(CopyTooltip,copyTooltip)
MAKE_METHOD(SetTooltip,setTooltip)
MAKE_METHOD(GetWhen,getWhen)
MAKE_METHOD(SetWhen,setWhen)
MAKE_METHOD(GetVisible,getVisible)
MAKE_METHOD(GetVisibleR,getVisibleR)
MAKE_METHOD(ShowWidgetSuper,showWidgetSuper)
MAKE_METHOD(ShowWidget,showWidget)
MAKE_METHOD(HideSuper,hideSuper)
MAKE_METHOD(Hide,hide)
MAKE_METHOD(SetVisible,setVisible)
MAKE_METHOD(ClearVisible,clearVisible)
MAKE_METHOD(Active,active)
MAKE_METHOD(ActiveR,activeR)
MAKE_METHOD(Activate,activate)
MAKE_METHOD(Deactivate,deactivate)
MAKE_METHOD(GetOutput,getOutput)
MAKE_METHOD(SetOutput,setOutput)
MAKE_METHOD(ClearOutput,clearOutput)
MAKE_METHOD(Takesevents,takesevents)
MAKE_METHOD(SetChanged,setChanged)
MAKE_METHOD(ClearChanged,clearChanged)
MAKE_METHOD(SetActive,setActive)
MAKE_METHOD(ClearActive,clearActive)
MAKE_METHOD(TakeFocus,takeFocus)
MAKE_METHOD(SetVisibleFocus,setVisibleFocus)
MAKE_METHOD(ClearVisibleFocus,clearVisibleFocus)
MAKE_METHOD(ModifyVisibleFocus,modifyVisibleFocus)
MAKE_METHOD(GetVisibleFocus,getVisibleFocus)
MAKE_METHOD(Contains,contains)
MAKE_METHOD(Inside,inside)
MAKE_METHOD(Redraw,redraw)
MAKE_METHOD(RedrawLabel,redrawLabel)
MAKE_METHOD(GetDamage,getDamage)
MAKE_METHOD(ClearDamageThenSet,clearDamageThenSet)
MAKE_METHOD(ClearDamage,clearDamage)
MAKE_METHOD(SetDamage,setDamage)
MAKE_METHOD(SetDamageInside,setDamageInside)
MAKE_METHOD(MeasureLabel,measureLabel)
MAKE_METHOD(GetWindow,getWindow)
MAKE_METHOD(GetTopWindow,getTopWindow)
MAKE_METHOD(GetTopWindowOffset,getTopWindowOffset)
MAKE_METHOD(ResizeSuper,resizeSuper)
MAKE_METHOD(Resize,resize)
MAKE_METHOD(GetCallback, getCallback)
MAKE_METHOD(SetCallback, setCallback)
MAKE_METHOD(HasCallback,hasCallback)
MAKE_METHOD(DrawBox,drawBox)
MAKE_METHOD(DrawBoxWithBoxtype,drawBoxWithBoxtype)
MAKE_METHOD(DrawBackdrop,drawBackdrop)
MAKE_METHOD(DrawFocus,drawFocus)
MAKE_METHOD(Flags,flags)
MAKE_METHOD(SetFlag, setFlag)
MAKE_METHOD(ClearFlag, clearFlag)

-- * Group
data CGroupBase parent
type GroupBase = CGroupBase WidgetBase
type GroupBaseFuncs =
  (Destroy
  (DrawChild
  (DrawChildren
  (DrawOutsideLabel
  (UpdateChild
  (Begin
  (Handle
  (Resize
  (End
  (Within
  (Find
  (Add
  (Insert
  (RemoveIndex
  (RemoveWidget
  (Clear
  (SetResizable
  (SetNotResizable
  (GetResizable
  (AddResizable
  (InitSizes
  (Children
  (SetClipChildren
  (ClipChildren
  (Focus
  (DdfdesignKludge
  (InsertBefore
  (GetArray
  (GetChild
  ())))))))))))))))))))))))))))))
type instance Functions GroupBase = GroupBaseFuncs

data CGroup parent
type Group = CGroup GroupBase
type GroupFuncs =
  (Handle
  (Resize
  (Destroy
  ())))
type instance Functions Group = GroupFuncs

MAKE_METHOD(DrawChild,drawChild)
MAKE_METHOD(DrawChildren,drawChildren)
MAKE_METHOD(DrawOutsideLabel,drawOutsideLabel)
MAKE_METHOD(UpdateChild,updateChild)
MAKE_METHOD(Begin,begin)
MAKE_METHOD(End,end)
MAKE_METHOD(Within, within)
MAKE_METHOD(Find,find)
MAKE_METHOD(Add,add)
MAKE_METHOD(Insert,insert)
MAKE_METHOD(RemoveIndex,removeIndex)
MAKE_METHOD(RemoveWidget,removeWidget)
MAKE_METHOD(Clear,clear)
MAKE_METHOD(SetResizable,setResizable)
MAKE_METHOD(SetNotResizable,setNotResizable)
MAKE_METHOD(GetResizable,getResizable)
MAKE_METHOD(AddResizable,addResizable)
MAKE_METHOD(InitSizes,initSizes)
MAKE_METHOD(Children,children)
MAKE_METHOD(SetClipChildren,setClipChildren)
MAKE_METHOD(ClipChildren,clipChildren)
MAKE_METHOD(Focus,focus)
MAKE_METHOD(DdfdesignKludge,ddfdesignKludge)
MAKE_METHOD(InsertBefore,insertBefore)
MAKE_METHOD(GetArray,getArray)
MAKE_METHOD(GetChild,getChild)

data CWindowBase parent
type WindowBase = CWindowBase GroupBase
type WindowBaseFuncs =
  (Changed
  (ClearBorder
  (CopyLabel
  (Destroy
  (DrawBackdrop
  (DrawBox
  (DrawBoxWithBoxtype
  (DrawFocus
  (FreePosition
  (FullscreenOff
  (GetBorder
  (GetDecoratedH
  (GetDecoratedW
  (GetIcon
  (GetIconlabel
  (GetLabel
  (GetMenuWindow
  (GetModal
  (GetOverride
  (GetTooltipWindow
  (GetType_
  (GetXRoot
  (GetXclass
  (GetYRoot
  (Handle
  (Hide
  (HotSpot
  (Iconize
  (MakeCurrent
  (MakeFullscreen
  (NonModal
  (Resize
  (SetBorder
  (SetCallback
  (SetCursor
  (SetCursorWithFgBg
  (SetDefaultCursor
  (SetDefaultCursorWithFgBg
  (SetIcon
  (SetIconRaw
  (SetIconlabel
  (SetLabel
  (SetLabelWithIconlabel
  (SetMenuWindow
  (SetModal
  (SetNonModal
  (SetOverride
  (SetTooltipWindow
  (SetType
  (SetXclass
  (ShowWidget
  (Shown
  (SizeRange
  (SizeRangeWithArgs
  (WaitForExpose
  (Flush
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))
type instance Functions WindowBase = WindowBaseFuncs

data CWindow parent
type Window = CWindow WindowBase
type WindowFuncs =
  (Flush
  (Handle
  (Hide
  (Resize
  (ShowWidget
  ())))))
type instance Functions Window = WindowFuncs
MAKE_METHOD(DrawSuper,drawSuper)
MAKE_METHOD(HandleSuper,handleSuper)
MAKE_METHOD(FlushSuper,flushSuper)
MAKE_METHOD(Changed,changed)
MAKE_METHOD(MakeFullscreen,makeFullscreen)
MAKE_METHOD(FullscreenOff,fullscreenOff)
MAKE_METHOD(SetBorder,setBorder)
MAKE_METHOD(ClearBorder,clearBorder)
MAKE_METHOD(GetBorder,getBorder)
MAKE_METHOD(SetOverride,setOverride)
MAKE_METHOD(GetOverride,getOverride)
MAKE_METHOD(SetModal,setModal)
MAKE_METHOD(GetModal,getModal)
MAKE_METHOD(SetNonModal,setNonModal)
MAKE_METHOD(NonModal,nonModal)
MAKE_METHOD(SetMenuWindow,setMenuWindow)
MAKE_METHOD(GetMenuWindow,getMenuWindow)
MAKE_METHOD(SetTooltipWindow,setTooltipWindow)
MAKE_METHOD(GetTooltipWindow,getTooltipWindow)
MAKE_METHOD(HotSpot,hotSpot)
MAKE_METHOD(FreePosition,freePosition)
MAKE_METHOD(SizeRange,sizeRange)
MAKE_METHOD(SizeRangeWithArgs,sizeRangeWithArgs)
MAKE_METHOD(GetIconlabel,getIconlabel)
MAKE_METHOD(SetIconlabel,setIconlabel)
MAKE_METHOD(SetLabelWithIconlabel,setLabelWithIconlabel)
MAKE_METHOD(GetXclass,getXclass)
MAKE_METHOD(SetXclass,setXclass)
MAKE_METHOD(GetIcon,getIcon)
MAKE_METHOD(SetIcon,setIcon)
MAKE_METHOD(SetIconRaw,setIconRaw)
MAKE_METHOD(Shown,shown)
MAKE_METHOD(Iconize,iconize)
MAKE_METHOD(GetXRoot,getXRoot)
MAKE_METHOD(GetYRoot,getYRoot)
MAKE_METHOD(MakeCurrent,makeCurrent)
MAKE_METHOD(SetCursor,setCursor)
MAKE_METHOD(SetCursorWithFgBg,setCursorWithFgBg)
MAKE_METHOD(SetDefaultCursor,setDefaultCursor)
MAKE_METHOD(SetDefaultCursorWithFgBg,setDefaultCursorWithFgBg)
MAKE_METHOD(GetDecoratedW,getDecoratedW)
MAKE_METHOD(GetDecoratedH,getDecoratedH)
MAKE_METHOD(WaitForExpose,waitForExpose)

data CSingleWindowBase parent
type SingleWindowBase = CSingleWindowBase WindowBase
type SingleWindowBaseFuncs =
  (Destroy
  (Hide
  (ShowWidget
  (Handle
  (Resize
  ())))))
type instance Functions SingleWindowBase = SingleWindowBaseFuncs

data CSingleWindow parent
type SingleWindow = CSingleWindow SingleWindowBase
type SingleWindowFuncs =
  (Destroy
  (Hide
  (ShowWidget
  (Handle
  (Resize
  ())))))
type instance Functions SingleWindow = SingleWindowFuncs


data CDoubleWindowBase parent
type DoubleWindowBase = CDoubleWindowBase WindowBase
type DoubleWindowBaseFuncs =
  (Destroy
  (Flush
  (Handle
  (Hide
  (Resize
  (ShowWidget
  ()))))))
type instance Functions DoubleWindowBase = DoubleWindowBaseFuncs

data CDoubleWindow parent
type DoubleWindow = CDoubleWindow DoubleWindowBase
type DoubleWindowFuncs =
  (Destroy
  (Flush
  (Handle
  (Hide
  (Resize
  (ShowWidget
  ()))))))
type instance Functions DoubleWindow = DoubleWindowFuncs

data COverlayWindowBase parent
type OverlayWindowBase = COverlayWindowBase DoubleWindowBase
type OverlayWindowBaseFuncs =
  (CanDoOverlay
  (Destroy
  (Flush
  (Hide
  (RedrawOverlay
  (Resize
  (ShowWidget
  ())))))))
type instance Functions OverlayWindowBase = OverlayWindowBaseFuncs

data COverlayWindow parent
type OverlayWindow = COverlayWindow OverlayWindowBase
type OverlayWindowFuncs =
  (Destroy
  (Flush
  (Hide
  (Resize
  (ShowWidget
  ())))))
type instance Functions OverlayWindow = OverlayWindowFuncs


MAKE_METHOD(CanDoOverlay,canDoOverlay)
MAKE_METHOD(RedrawOverlay,redrawOverlay)
MAKE_METHOD(Flush,flush)

data CButtonBase parent
type ButtonBase = CButtonBase WidgetBase
type ButtonBaseFuncs =
  (Destroy
  (Handle
  (Resize
  (Hide
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
  (SetType
  (GetType_
  (DrawBoxWithBoxtype
  ()))))))))))))))))))))))

type instance Functions ButtonBase = ButtonBaseFuncs

data CButton parent
type Button = CButton ButtonBase
type ButtonFuncs =
  (Handle
  (Resize
  (Hide
  (ShowWidget
  ()))))
type instance Functions Button = ButtonFuncs


MAKE_METHOD(GetValue,getValue)
MAKE_METHOD(SetValue,setValue)
MAKE_METHOD(Set,set)
MAKE_METHOD(Setonly,setonly)
MAKE_METHOD(GetShortcut,getShortcut)
MAKE_METHOD(SetShortcut,setShortcut)
MAKE_METHOD(GetDownBox,getDownBox)
MAKE_METHOD(SetDownBox,setDownBox)
MAKE_METHOD(GetDownColor,getDownColor)
MAKE_METHOD(SetDownColor,setDownColor)

data CLightButtonBase parent
type LightButtonBaseFuncs =
  (Destroy
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))

type LightButtonBase = CLightButtonBase ButtonBase
type instance Functions LightButtonBase = LightButtonBaseFuncs

data CLightButton parent
type LightButtonFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type LightButton = CLightButton LightButtonBase
type instance Functions LightButton = LightButtonFuncs

data CRadioLightButtonBase parent
type RadioLightButtonBase = CRadioLightButtonBase LightButtonBase

type instance Functions RadioLightButtonBase = ()

data CRadioLightButton parent
type RadioLightButton = CRadioLightButton RadioLightButtonBase

type instance Functions RadioLightButton = ()

data CCheckButtonBase parent
type CheckButtonBaseFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Destroy
  (Resize
  ()))))))
type CheckButtonBase = CCheckButtonBase LightButtonBase

type instance Functions CheckButtonBase = CheckButtonBaseFuncs

data CCheckButton parent
type CheckButtonFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))
type CheckButton = CCheckButton CheckButtonBase

type instance Functions CheckButton = CheckButtonFuncs

data CReturnButtonBase parent
type ReturnButtonBase = CReturnButtonBase ButtonBase
type ReturnButtonBaseFuncs =
  (Destroy
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))

type instance Functions ReturnButtonBase = ReturnButtonBaseFuncs

data CReturnButton parent
type ReturnButton = CReturnButton ReturnButtonBase
type ReturnButtonFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions ReturnButton = ReturnButtonFuncs

data CRoundButtonBase parent
type RoundButtonBase = CRoundButtonBase ButtonBase
type RoundButtonBaseFuncs =
  (Destroy
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))

type instance Functions RoundButtonBase = RoundButtonBaseFuncs

data CRoundButton parent
type RoundButton = CRoundButton RoundButtonBase
type RoundButtonFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions RoundButton = RoundButtonFuncs

data CRepeatButtonBase parent
type RepeatButtonBase = CRepeatButtonBase ButtonBase
type RepeatButtonBaseFuncs =
  (Destroy
  (Deactivate
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))

type instance Functions RepeatButtonBase = RepeatButtonBaseFuncs

data CRepeatButton parent
type RepeatButton = CRepeatButton RepeatButtonBase
type RepeatButtonFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions RepeatButton = RepeatButtonFuncs


data CToggleButtonBase parent
type ToggleButtonBase = CToggleButtonBase ButtonBase
type ToggleButtonBaseFuncs =
  (Destroy
  ())

type instance Functions ToggleButtonBase = ToggleButtonBaseFuncs

data CToggleButton parent
type ToggleButton = CToggleButton ToggleButtonBase
type ToggleButtonFuncs =
  ()
type instance Functions ToggleButton = ToggleButtonFuncs

data CValuatorBase parent
type ValuatorBase = CValuatorBase WidgetBase
type ValuatorBaseFuncs =
  (Destroy
  (Handle
  (Resize
  (Hide
  (Bounds
  (GetMinimum
  (SetMinimum
  (GetMaximum
  (SetMaximum
  (Range
  (SetStep
  (GetStep
  (Precision
  (GetValue
  (SetValue
  (Format
  (Round
  (Clamp
  (Increment
  (SetType
  (GetType_
  ())))))))))))))))))))))

type instance Functions ValuatorBase = ValuatorBaseFuncs

data CValuator parent
type Valuator = CValuator ValuatorBase
type ValuatorFuncs =
  (Handle
  (Resize
  (Hide
  ())))

type instance Functions Valuator = ValuatorFuncs

MAKE_METHOD(Bounds,bounds)
MAKE_METHOD(GetMinimum,getMinimum)
MAKE_METHOD(SetMinimum,setMinimum)
MAKE_METHOD(GetMaximum,getMaximum)
MAKE_METHOD(SetMaximum,setMaximum)
MAKE_METHOD(Range,range)
-- MAKE_METHOD(SetRange,setRange)
MAKE_METHOD(SetStep,setStep)
MAKE_METHOD(GetStep,getStep)
MAKE_METHOD(Precision,precision)
MAKE_METHOD(Format,format)
MAKE_METHOD(Round,round)
MAKE_METHOD(Clamp,clamp)
MAKE_METHOD(Increment,increment)

data CSliderBase parent
type SliderBase = CSliderBase ValuatorBase
type SliderBaseFuncs =
  (Destroy
  (Bounds
  (Scrollvalue
  (SetSliderSize
  (GetSliderSize
  (GetSlider
  (SetSlider
  (SetType
  (GetType_
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))))

type instance Functions SliderBase = SliderBaseFuncs

data CSlider parent
type Slider = CSlider SliderBase
type SliderFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Slider = SliderFuncs

MAKE_METHOD(Scrollvalue,scrollvalue)
MAKE_METHOD(SetSliderSize,setSliderSize)
MAKE_METHOD(GetSliderSize,getSliderSize)
MAKE_METHOD(GetSlider,getSlider)
MAKE_METHOD(SetSlider,setSlider)

data CFillSliderBase parent
type FillSliderBase = CFillSliderBase SliderBase

type instance Functions FillSliderBase = ()

data CFillSlider parent
type FillSlider = CFillSlider FillSliderBase

type instance Functions FillSlider = ()

data CHorSliderBase parent
type HorSliderBase = CHorSliderBase SliderBase

type instance Functions HorSliderBase = ()

data CHorSlider parent
type HorSlider = CHorSlider HorSliderBase

type instance Functions HorSlider = ()

data CHorFillSliderBase parent
type HorFillSliderBase = CHorFillSliderBase SliderBase

type instance Functions HorFillSliderBase = ()

data CHorFillSlider parent
type HorFillSlider = CHorFillSlider HorFillSliderBase

type instance Functions HorFillSlider = ()

data CNiceSliderBase parent
type NiceSliderBase = CNiceSliderBase SliderBase

type instance Functions NiceSliderBase = ()

data CNiceSlider parent
type NiceSlider = CNiceSlider NiceSliderBase

type instance Functions NiceSlider = ()

data CHorNiceSliderBase parent
type HorNiceSliderBase = CHorNiceSliderBase SliderBase

type instance Functions HorNiceSliderBase = ()

data CHorNiceSlider parent
type HorNiceSlider = CHorNiceSlider HorNiceSliderBase

type instance Functions HorNiceSlider = ()

data CMenuItemBase parent
type MenuItemBase = CMenuItemBase Base
type MenuItemBaseFuncs =
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
  (GetCallback
  ())))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions MenuItemBase = MenuItemBaseFuncs

data CMenuItem parent
type MenuItem = CMenuItem MenuItemBase
type MenuItemFuncs =
  (Draw
  ())

type instance Functions MenuItem = MenuItemFuncs

MAKE_METHOD(NextWithStep,nextWithStep)
MAKE_METHOD(Next,next)
MAKE_METHOD(GetFirst,getFirst)
MAKE_METHOD(SetLabelWithLabeltype,setLabelWithLabeltype)
MAKE_METHOD(Submenu,submenu)
MAKE_METHOD(Checkbox,checkbox)
MAKE_METHOD(Radio,radio)
MAKE_METHOD(Visible,visible)
MAKE_METHOD(Activevisible,activevisible)
MAKE_METHOD(Measure,measure)
MAKE_METHOD(DrawWithT,drawWithT)
MAKE_METHOD(Draw,draw)
MAKE_METHOD(GetFlags,getFlags)
MAKE_METHOD(SetFlags,setFlags)
MAKE_METHOD(Pulldown,pulldown)
MAKE_METHOD(Popup,popup)
MAKE_METHOD(TestShortcut,testShortcut)
MAKE_METHOD(FindShortcut,findShortcut)
MAKE_METHOD(DoCallback,doCallback)
MAKE_METHOD(GetSize,getSize)

data CMenuPrimBase parent
type MenuPrimBase = CMenuPrimBase WidgetBase
type MenuPrimBaseFuncs =
  (Destroy
  (Handle
  (Resize
  (Hide
  (ShowWidget
  (ItemPathname
  (ItemPathnameRecent
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
  (Setonly
  (AddAndGetMenuItem
  ())))))))))))))))))))))))))))))))))))))))))))

type instance Functions MenuPrimBase = MenuPrimBaseFuncs

data CMenuPrim parent
type MenuPrim = CMenuPrim MenuPrimBase
type MenuPrimFuncs =
  (Handle
  (Resize
  (Hide
  (ShowWidget
  ()))))

type instance Functions MenuPrim = MenuPrimFuncs

MAKE_METHOD(ItemPathname,itemPathname)
MAKE_METHOD(ItemPathnameRecent,itemPathnameRecent)
MAKE_METHOD(Picked,picked)
MAKE_METHOD(FindIndex,findIndex)
MAKE_METHOD(Global,global)
MAKE_METHOD(GetMenu,getMenu)
MAKE_METHOD(SetMenu,setMenu)
MAKE_METHOD(Copy,copy)
MAKE_METHOD(SetSize,setSize)
MAKE_METHOD(ClearSubmenu,clearSubmenu)
MAKE_METHOD(AddName,addName)
MAKE_METHOD(Replace,replace)
MAKE_METHOD(Remove,remove)
MAKE_METHOD(SetMode,setMode)
MAKE_METHOD(GetMode,getMode)
MAKE_METHOD(Mvalue,mvalue)
MAKE_METHOD(GetText,getText)
MAKE_METHOD(GetTextWithIndex,getTextWithIndex)
MAKE_METHOD(GetTextfont,getTextfont)
MAKE_METHOD(SetTextfont,setTextfont)
MAKE_METHOD(GetTextsize,getTextsize)
MAKE_METHOD(SetTextsize,setTextsize)
MAKE_METHOD(GetTextcolor,getTextcolor)
MAKE_METHOD(SetTextcolor,setTextcolor)
MAKE_METHOD(DownBox,downBox)
MAKE_METHOD(AddAndGetMenuItem, addAndGetMenuItem)

data CMenuBarBase parent
type MenuBarBase = CMenuBarBase MenuPrimBase
type MenuBarBaseFuncs =
  (Destroy
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))
type instance Functions MenuBarBase = MenuBarBaseFuncs

data CMenuBar parent
type MenuBar = CMenuBar MenuBarBase
type MenuBarFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))
type instance Functions MenuBar = MenuBarFuncs

data CSysMenuBarBase parent
type SysMenuBarBase = CSysMenuBarBase MenuBarBase
type SysMenuBarBaseFuncs =
  (Destroy
  (SetMenu
  (Insert
  (Remove
  (Replace
  (Clear
  (ClearSubmenu
  (Global
  (SetMode
  (GetMode
  (SetShortcut
  (Add
  (AddName
  (Insert
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))))))))))

type instance Functions SysMenuBarBase = SysMenuBarBaseFuncs

data CSysMenuBar parent
type SysMenuBar = CSysMenuBar SysMenuBarBase
type SysMenuBarFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions SysMenuBar = SysMenuBarFuncs

data CChoiceBase parent
type ChoiceBase = CChoiceBase MenuPrimBase
type ChoiceBaseFuncs =
  (Destroy
  (Handle
  (GetValue
  (SetValue
  (Draw
  (ShowWidget
  (Hide
  (Resize
  ()))))))))

type instance Functions ChoiceBase = ChoiceBaseFuncs

data CChoice parent
type Choice = CChoice ChoiceBase
type ChoiceFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Choice = ChoiceFuncs

data CMenuButtonBase parent
type MenuButtonBase = CMenuButtonBase MenuPrimBase
type MenuButtonBaseFuncs =
  (Destroy
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Popup
  (Resize
  ())))))))

type instance Functions MenuButtonBase = MenuButtonBaseFuncs

data CMenuButton parent
type MenuButton = CMenuButton MenuButtonBase
type MenuButtonFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions MenuButton = MenuButtonFuncs

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
  (Scale
  (GetDataW
  (GetDataH
  (GetDataSize
  (Fail
  ()))))))))))))))))))

type instance Functions Image = ImageFuncs

MAKE_METHOD(GetD,getD)
MAKE_METHOD(GetLd,getLd)
MAKE_METHOD(GetCount,getCount)
MAKE_METHOD(ColorAverage,colorAverage)
MAKE_METHOD(Inactive,inactive)
MAKE_METHOD(Desaturate,desaturate)
MAKE_METHOD(DrawResize,drawResize)
MAKE_METHOD(Uncache,uncache)
MAKE_METHOD(Fail,fail)
MAKE_METHOD(Scale,scale)
MAKE_METHOD(GetDataW,getDataW)
MAKE_METHOD(GetDataH,getDataH)
MAKE_METHOD(GetDataSize,getDataSize)

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

type instance Functions Bitmap = BitmapFuncs

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

type instance Functions Pixmap = PixmapFuncs

data CCopySurface parent
type CopySurface = CCopySurface Base
type CopySurfaceFuncs =
  (Destroy
  (SetCurrent
  (Draw
  ())))

type instance Functions CopySurface = CopySurfaceFuncs

MAKE_METHOD(SetCurrent,setCurrent)

data CImageSurface parent
type ImageSurface = CImageSurface Base
type ImageSurfaceFuncs =
  (Destroy
  (SetCurrent
  (Draw
  (GetOrigin
  (PrintableRect
  (SetOrigin
  (GetOffscreen
  ())))))))

type instance Functions ImageSurface = ImageSurfaceFuncs

MAKE_METHOD(GetOrigin, getOrigin)
MAKE_METHOD(PrintableRect, printableRect)
MAKE_METHOD(SetOrigin, setOrigin)
MAKE_METHOD(GetOffscreenBeforeDelete, getOffscreenBeforeDelete)
MAKE_METHOD(GetOffscreen, getOffscreen)

data CAdjusterBase parent
type AdjusterBase = CAdjusterBase ValuatorBase
type AdjusterBaseFuncs =
  (Destroy
  (SetSoft
  (GetSoft
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))

type instance Functions AdjusterBase = AdjusterBaseFuncs

data CAdjuster parent
type Adjuster = CAdjuster AdjusterBase
type AdjusterFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Adjuster = AdjusterFuncs


MAKE_METHOD(SetSoft,setSoft)
MAKE_METHOD(GetSoft,getSoft)

data CDialBase parent
type DialBase = CDialBase ValuatorBase
type DialBaseFuncs =
  (Destroy
  (GetAngle1
  (SetAngle1
  (GetAngle2
  (SetAngle2
  (SetAngles
  (SetType
  (GetType_
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))))

type instance Functions DialBase = DialBaseFuncs

data CDial parent
type Dial = CDial DialBase
type DialFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Dial = DialFuncs

MAKE_METHOD(GetAngle1,getAngle1)
MAKE_METHOD(SetAngle1,setAngle1)
MAKE_METHOD(GetAngle2,getAngle2)
MAKE_METHOD(SetAngle2,setAngle2)
MAKE_METHOD(SetAngles,setAngles)

data CFillDial parent
type FillDial = CFillDial DialBase

type instance Functions FillDial = ()

data CLineDial parent
type LineDial = CLineDial DialBase

type instance Functions LineDial = ()

data CRollerBase parent
type RollerBase = CRollerBase ValuatorBase
type RollerBaseFuncs =
  (Destroy
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))

type instance Functions RollerBase = RollerBaseFuncs

data CRoller parent
type Roller = CRoller RollerBase
type RollerFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Roller = RollerFuncs

data CCounterBase parent
type CounterBase = CCounterBase ValuatorBase
type CounterBaseFuncs =
  (Destroy
  (Handle
  (SetLstep
  (SetTextfont
  (GetTextfont
  (SetTextsize
  (GetTextsize
  (SetTextcolor
  (GetTextcolor
  (SetType
  (GetType_
  (Draw
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))))))

type instance Functions CounterBase = CounterBaseFuncs

MAKE_METHOD(SetLstep,setLstep)

data CCounter parent
type Counter = CCounter CounterBase
type CounterFuncs =
  (Handle
  (Draw
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Counter = CounterFuncs

data CScrollbarBase parent
type ScrollbarBase = CScrollbarBase SliderBase
type ScrollbarBaseFuncs =
  (Destroy
  (Scrollvalue
  (SetLinesize
  (GetLinesize
  (SetType
  (GetType_
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))

type instance Functions ScrollbarBase = ScrollbarBaseFuncs

data CScrollbar parent
type Scrollbar = CScrollbar ScrollbarBase
type ScrollbarFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Scrollbar = ScrollbarFuncs

MAKE_METHOD(SetLinesize,setLinesize)
MAKE_METHOD(GetLinesize,getLinesize)

data CValueSliderBase parent
type ValueSliderBase = CValueSliderBase SliderBase
type ValueSliderBaseFuncs =
  (Destroy
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))

type instance Functions ValueSliderBase = ValueSliderBaseFuncs

data CValueSlider parent
type ValueSlider = CValueSlider ValueSliderBase
type ValueSliderFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions ValueSlider = ValueSliderFuncs

data CHorValueSlider parent
type HorValueSlider = CHorValueSlider ValueSliderBase

type instance Functions HorValueSlider = ()

data CInputBase parent
type InputBase = CInputBase WidgetBase
type InputBaseFuncs =
  (Destroy
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
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (DrawText
  (Resize
  ()))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions InputBase = InputBaseFuncs

data CInput parent
type Input = CInput InputBase
type InputFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Input = InputFuncs

MAKE_METHOD(StaticValue,staticValue)
MAKE_METHOD(Index,index)
MAKE_METHOD(GetMaximumSize,getMaximumSize)
MAKE_METHOD(SetMaximumSize,setMaximumSize)
MAKE_METHOD(GetPosition,getPosition)
MAKE_METHOD(GetMark,getMark)
MAKE_METHOD(SetPosition,setPosition)
MAKE_METHOD(SetMark,setMark)
MAKE_METHOD(Cut,cut)
MAKE_METHOD(CutFromCursor,cutFromCursor)
MAKE_METHOD(CutRange,cutRange)
MAKE_METHOD(InsertWithLength,insertWithLength)
MAKE_METHOD(Undo,undo)
MAKE_METHOD(CopyCuts,copyCuts)
MAKE_METHOD(GetCursorColor,getCursorColor)
MAKE_METHOD(SetCursorColor,setCursorColor)
MAKE_METHOD(GetInputType,getInputType)
MAKE_METHOD(SetInputType,setInputType)
MAKE_METHOD(GetReadonly,getReadonly)
MAKE_METHOD(SetReadonly,setReadonly)
MAKE_METHOD(GetWrap,getWrap)
MAKE_METHOD(SetWrap,setWrap)
MAKE_METHOD(GetTabNav,getTabNav)
MAKE_METHOD(SetTabNav,setTabNav)
MAKE_METHOD(DrawText,drawText)

data COutputBase parent
type OutputBase = COutputBase InputBase
type OutputBaseFuncs =
  (SetType
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))

type instance Functions OutputBase = OutputBaseFuncs

data COutput parent
type Output = COutput OutputBase
type OutputFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Output = OutputFuncs

data CValueInputBase parent
type ValueInputBase = CValueInputBase ValuatorBase
type ValueInputBaseFuncs =
  (Destroy
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
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))))))

type instance Functions ValueInputBase = ValueInputBaseFuncs

data CValueInput parent
type ValueInput = CValueInput ValueInputBase
type ValueInputFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions ValueInput = ValueInputFuncs

data CValueOutputBase parent
type ValueOutputBase = CValueOutputBase ValuatorBase
type ValueOutputBaseFuncs =
  (Destroy
  (GetSoft
  (SetSoft
  (SetTextfont
  (GetTextfont
  (SetTextsize
  (GetTextsize
  (SetTextcolor
  (GetTextcolor
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))))

type instance Functions ValueOutputBase = ValueOutputBaseFuncs

data CValueOutput parent
type ValueOutput = CValueOutput ValueOutputBase
type ValueOutputFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions ValueOutput = ValueOutputFuncs

data CProgressBase parent
type ProgressBase = CProgressBase WidgetBase
type ProgressBaseFuncs =
  (Destroy
  (SetMaximum
  (GetMaximum
  (SetMinimum
  (GetMinimum
  (SetValue
  (GetValue
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))

type instance Functions ProgressBase = ProgressBaseFuncs

data CProgress parent
type Progress = CProgress ProgressBase
type ProgressFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Progress = ProgressFuncs

data CPositionerBase parent
type PositionerBase = CPositionerBase WidgetBase
type PositionerBaseFuncs =
  (Destroy
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
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))))))))))))

type instance Functions PositionerBase = PositionerBaseFuncs

data CPositioner parent
type Positioner = CPositioner PositionerBase
type PositionerFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Positioner = PositionerFuncs

MAKE_METHOD(SetXvalue,setXvalue)
MAKE_METHOD(GetXvalue,getXvalue)
MAKE_METHOD(SetYvalue,setYvalue)
MAKE_METHOD(GetYvalue,getYvalue)
MAKE_METHOD(SetXminimum,setXminimum)
MAKE_METHOD(GetXminimum,getXminimum)
MAKE_METHOD(SetYminimum,setYminimum)
MAKE_METHOD(GetYminimum,getYminimum)
MAKE_METHOD(SetXmaximum,setXmaximum)
MAKE_METHOD(GetXmaximum,getXmaximum)
MAKE_METHOD(SetYmaximum,setYmaximum)
MAKE_METHOD(GetYmaximum,getYmaximum)
MAKE_METHOD(SetXbounds,setXbounds)
MAKE_METHOD(SetYbounds,setYbounds)
MAKE_METHOD(SetXstep,setXstep)
MAKE_METHOD(SetYstep,setYstep)

data CWizardBase parent
type WizardBase = CWizardBase GroupBase
type WizardBaseFuncs =
  (Destroy
  (Next
  (Prev
  (SetValue
  (GetValue
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))

type instance Functions WizardBase = WizardBaseFuncs

data CWizard parent
type Wizard = CWizard WizardBase
type WizardFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Wizard = WizardFuncs

MAKE_METHOD(Prev,prev)

data CTableBase parent
type TableBase = CTableBase GroupBase
type TableBaseFuncs =
  (Destroy
  (SetTableBox
  (GetTableBox
  (SetRows
  (GetRows
  (SetCols
  (GetCols
  (GetVisibleCells
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
  (InsertBefore
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
  (Draw
  (Handle
  (Resize
  (Clear
  (ShowWidget
  (Hide
  (GetTabCellNav
  (SetTabCellNav
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions TableBase = TableBaseFuncs

data CTable parent
type Table = CTable TableBase
type TableFuncs =
  (SetRows
  (SetCols
  (Draw
  (Handle
  (Resize
  (Clear
  (ShowWidget
  (Hide
  ()))))))))

type instance Functions Table = TableFuncs
MAKE_METHOD(SetTableBox,setTableBox)
MAKE_METHOD(GetTableBox,getTableBox)
MAKE_METHOD(SetRows,setRows)
MAKE_METHOD(GetRows,getRows)
MAKE_METHOD(SetCols,setCols)
MAKE_METHOD(GetCols,getCols)
MAKE_METHOD(GetVisibleCells,getVisibleCells)
MAKE_METHOD(IsInteractiveResize,isInteractiveResize)
MAKE_METHOD(GetRowResize,getRowResize)
MAKE_METHOD(SetRowResize,setRowResize)
MAKE_METHOD(GetColResize,getColResize)
MAKE_METHOD(SetColResize,setColResize)
MAKE_METHOD(GetColResizeMin,getColResizeMin)
MAKE_METHOD(SetColResizeMin,setColResizeMin)
MAKE_METHOD(GetRowResizeMin,getRowResizeMin)
MAKE_METHOD(SetRowResizeMin,setRowResizeMin)
MAKE_METHOD(GetRowHeader,getRowHeader)
MAKE_METHOD(SetRowHeader,setRowHeader)
MAKE_METHOD(GetColHeader,getColHeader)
MAKE_METHOD(SetColHeader,setColHeader)
MAKE_METHOD(SetColHeaderHeight,setColHeaderHeight)
MAKE_METHOD(GetColHeaderHeight,getColHeaderHeight)
MAKE_METHOD(SetRowHeaderWidth,setRowHeaderWidth)
MAKE_METHOD(GetRowHeaderWidth,getRowHeaderWidth)
MAKE_METHOD(SetRowHeaderColor,setRowHeaderColor)
MAKE_METHOD(GetRowHeaderColor,getRowHeaderColor)
MAKE_METHOD(SetColHeaderColor,setColHeaderColor)
MAKE_METHOD(GetColHeaderColor,getColHeaderColor)
MAKE_METHOD(SetRowHeight,setRowHeight)
MAKE_METHOD(GetRowHeight,getRowHeight)
MAKE_METHOD(SetColWidth,setColWidth)
MAKE_METHOD(GetColWidth,getColWidth)
MAKE_METHOD(SetRowHeightAll,setRowHeightAll)
MAKE_METHOD(SetColWidthAll,setColWidthAll)
MAKE_METHOD(SetRowPosition,setRowPosition)
MAKE_METHOD(SetColPosition,setColPosition)
MAKE_METHOD(GetRowPosition,getRowPosition)
MAKE_METHOD(GetColPosition,getColPosition)
MAKE_METHOD(SetTopRow,setTopRow)
MAKE_METHOD(GetTopRow,getTopRow)
MAKE_METHOD(IsSelected,isSelected)
MAKE_METHOD(GetSelection,getSelection)
MAKE_METHOD(SetSelection,setSelection)
MAKE_METHOD(MoveCursor,moveCursor)
MAKE_METHOD(CallbackRow,callbackRow)
MAKE_METHOD(CallbackCol,callbackCol)
MAKE_METHOD(CallbackContext,callbackContext)
MAKE_METHOD(FindCell,findCell)
MAKE_METHOD(ClearSuper,clearSuper)
MAKE_METHOD(SetRowsSuper,setRowsSuper)
MAKE_METHOD(SetColsSuper,setColsSuper)
MAKE_METHOD(SetTabCellNav, setTabCellNav)
MAKE_METHOD(GetTabCellNav, getTabCellNav)

data CTableRowBase parent
type TableRowBase = CTableRowBase TableBase
type TableRowBaseFuncs =
  (Destroy
  (GetRows
  (SetType
  (GetType_
  (SetRows
  (SetCols
  (Clear
  (Handle
  (Resize
  (GetRowSelected
  (SelectAllRows
  (Draw
  (Hide
  (ShowWidget
  ()))))))))))))))

type instance Functions TableRowBase = TableRowBaseFuncs

data CTableRow parent
type TableRow = CTableRow TableRowBase
type TableRowFuncs =
  (Clear
  (SetRows
  (SetCols
  (Handle
  (Resize
  (Draw
  (Hide
  (ShowWidget
  ()))))))))

type instance Functions TableRow = TableRowFuncs

MAKE_METHOD(GetRowSelected,getRowSelected)
MAKE_METHOD(SelectAllRows,selectAllRows)

data CGlWindowBase parent
type GlWindowBase = CGlWindowBase WindowBase
type GlWindowBaseFuncs =
  (CanDo
  (CanDoOverlay
  (Destroy
  (Flush
  (GetContext
  (GetContextValid
  (GetMode
  (GetValid
  (Handle
  (Hide
  (HideOverlay
  (Invalidate
  (MakeOverlayCurrent
  (Ortho
  (PixelH
  (PixelW
  (PixelsPerUnit
  (RedrawOverlay
  (Resize
  (SetContext
  (SetContextValid
  (SetContextWithDestroyFlag
  (SetMode
  (SetValid
  (ShowWidget
  (SwapBuffers
  ()))))))))))))))))))))))))))

type instance Functions GlWindowBase = GlWindowBaseFuncs

data CGlWindow parent
type GlWindow = CGlWindow GlWindowBase
type GlWindowFuncs =
  (Destroy
  (Flush
  (Handle
  (Hide
  (Resize
  (ShowWidget
  ()))))))

type instance Functions GlWindow = GlWindowFuncs

MAKE_METHOD(GetValid,getValid)
MAKE_METHOD(SetValid,setValid)
MAKE_METHOD(Invalidate,invalidate)
MAKE_METHOD(GetContextValid,getContextValid)
MAKE_METHOD(SetContextValid,setContextValid)
MAKE_METHOD(CanDo,canDo)
MAKE_METHOD(GetContext,getContext)
MAKE_METHOD(SetContext,setContext)
MAKE_METHOD(SetContextWithDestroyFlag,setContextWithDestroyFlag)
MAKE_METHOD(SwapBuffers,swapBuffers)
MAKE_METHOD(Ortho,ortho)
MAKE_METHOD(HideOverlay,hideOverlay)
MAKE_METHOD(MakeOverlayCurrent,makeOverlayCurrent)
MAKE_METHOD(PixelsPerUnit,pixelsPerUnit)
MAKE_METHOD(PixelH,pixelH)
MAKE_METHOD(PixelW,pixelW)

data CBox parent
type Box = CBox WidgetBase

type instance Functions Box = ()

data CBrowserBase parent
type BrowserBase = CBrowserBase GroupBase
type BrowserBaseFuncs =
  (Add
  (Clear
  (Deselect
  (DeselectAndCallback
  (Destroy
  (Displayed
  (Draw
  (GetColumnChar
  (GetColumnWidths
  (GetFormatChar
  (GetHasScrollbar
  (GetHposition
  (GetIcon
  (GetPosition
  (GetScrollbarSize
  (GetScrollbarWidth
  (GetSize
  (GetText
  (GetTextcolor
  (GetTextfont
  (GetTextsize
  (GetTopline
  (GetType_
  (GetValue
  (Handle
  (Hide
  (HideLine
  (Insert
  (Lineposition
  (Load
  (MakeVisible
  (Move
  (Remove
  (RemoveIcon
  (Select
  (Selected
  (SetBottomline
  (SetColumnChar
  (SetColumnWidths
  (SetFormatChar
  (SetHasScrollbar
  (SetHposition
  (SetIcon
  (SetMiddleline
  (SetPosition
  (SetScrollbarColor
  (SetScrollbarSelectionColor
  (SetScrollbarSize
  (SetScrollbarWidth
  (SetSize
  (SetText
  (SetTextcolor
  (SetTextfont
  (SetTextsize
  (SetTopline
  (SetType
  (SetValue
  (ShowWidget
  (ShowWidgetLine
  (Sort
  (SortWithSortType
  (Swap
  (Visible
  (Resize
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions BrowserBase = BrowserBaseFuncs

data CBrowser parent
type Browser = CBrowser BrowserBase
type BrowserFuncs =
  (Handle
  (Resize
  (ShowWidget
  (Hide
  (Draw
  ())))))

type instance Functions Browser = BrowserFuncs

MAKE_METHOD(Move,move)
MAKE_METHOD(Load,load)
MAKE_METHOD(Swap,swap)
MAKE_METHOD(GetTopline,getTopline)
MAKE_METHOD(Lineposition,lineposition)
MAKE_METHOD(SetTopline,setTopline)
MAKE_METHOD(SetBottomline,setBottomline)
MAKE_METHOD(SetMiddleline,setMiddleline)
MAKE_METHOD(Select,select)
MAKE_METHOD(Selected,selected)
MAKE_METHOD(ShowWidgetLine,showWidgetLine)
MAKE_METHOD(HideLine,hideLine)
MAKE_METHOD(SetText,setText)
MAKE_METHOD(GetFormatChar,getFormatChar)
MAKE_METHOD(SetFormatChar,setFormatChar)
MAKE_METHOD(GetColumnChar,getColumnChar)
MAKE_METHOD(SetColumnChar,setColumnChar)
MAKE_METHOD(GetColumnWidths,getColumnWidths)
MAKE_METHOD(SetColumnWidths,setColumnWidths)
MAKE_METHOD(Displayed,displayed)
MAKE_METHOD(MakeVisible,makeVisible)
MAKE_METHOD(RemoveIcon,removeIcon)
MAKE_METHOD(SelectOnly,selectOnly)
MAKE_METHOD(SelectOnlyAndCallback,selectOnlyAndCallback)
MAKE_METHOD(Deselect,deselect)
MAKE_METHOD(DeselectAndCallback,deselectAndCallback)
MAKE_METHOD(GetHposition,getHposition)
MAKE_METHOD(SetHposition,setHposition)
MAKE_METHOD(GetHasScrollbar,getHasScrollbar)
MAKE_METHOD(SetHasScrollbar,setHasScrollbar)
MAKE_METHOD(GetScrollbarSize,getScrollbarSize)
MAKE_METHOD(SetScrollbarSize,setScrollbarSize)
MAKE_METHOD(GetScrollbarWidth,getScrollbarWidth)
MAKE_METHOD(SetScrollbarWidth,setScrollbarWidth)
MAKE_METHOD(SetScrollbarColor,setScrollbarColor)
MAKE_METHOD(SetScrollbarSelectionColor,setScrollbarSelectionColor)
MAKE_METHOD(SortWithSortType,sortWithSortType)
MAKE_METHOD(Sort,sort)

data CSelectBrowser parent
type SelectBrowser = CSelectBrowser BrowserBase

type instance Functions SelectBrowser = ()

data CIntInput parent
type IntInput = CIntInput InputBase

type instance Functions IntInput = ()

data CClockBase parent
type ClockBase = CClockBase WidgetBase
type ClockBaseFuncs =
  (Handle
  (GetValue
  (GetValueSinceEpoch
  (SetValue
  (SetType
  (GetType_
  (Draw
  (ShowWidget
  (Hide
  (SetShadow
  (GetShadow
  (Resize
  ()))))))))))))

type instance Functions ClockBase = ClockBaseFuncs
data CClock parent
type Clock = CClock ClockBase
type ClockFuncs =
  (Handle
  (Draw
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Clock = ClockFuncs
MAKE_METHOD(GetValueSinceEpoch,getValueSinceEpoch)
MAKE_METHOD(GetShadow,getShadow)
MAKE_METHOD(SetShadow,setShadow)

data CTreePrefs parent
type TreePrefs = CTreePrefs Base
type TreePrefsFuncs =
  (GetItemLabelfont
  (SetItemLabelfont
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
  (GetMarginbottom
  (SetMarginbottom
  (GetWidgetmarginleft
  (SetWidgetmarginleft
  (GetItemReselectMode
  (SetItemReselectMode
  (GetItemDrawMode
  (SetItemDrawMode
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions TreePrefs = TreePrefsFuncs

MAKE_METHOD(GetItemLabelfont,getItemLabelfont)
MAKE_METHOD(GetItemLabelsize,getItemLabelsize)
MAKE_METHOD(SetItemLabelsize,setItemLabelsize)
MAKE_METHOD(SetItemLabelfgcolor,setItemLabelfgcolor)
MAKE_METHOD(GetItemLabelbgcolor,getItemLabelbgcolor)
MAKE_METHOD(SetItemLabelbgcolor,setItemLabelbgcolor)
MAKE_METHOD(GetLabelfgcolor,getLabelfgcolor)
MAKE_METHOD(SetLabelfgcolor,setLabelfgcolor)
MAKE_METHOD(GetLabelbgcolor,getLabelbgcolor)
MAKE_METHOD(SetLabelbgcolor,setLabelbgcolor)
MAKE_METHOD(GetMarginleft,getMarginleft)
MAKE_METHOD(SetMarginleft,setMarginleft)
MAKE_METHOD(GetMargintop,getMargintop)
MAKE_METHOD(SetMargintop,setMargintop)
MAKE_METHOD(GetOpenchildMarginbottom,getOpenchildMarginbottom)
MAKE_METHOD(SetOpenchildMarginbottom,setOpenchildMarginbottom)
MAKE_METHOD(GetUsericonmarginleft,getUsericonmarginleft)
MAKE_METHOD(SetUsericonmarginleft,setUsericonmarginleft)
MAKE_METHOD(GetLabelmarginleft,getLabelmarginleft)
MAKE_METHOD(SetLabelmarginleft,setLabelmarginleft)
MAKE_METHOD(GetLinespacing,getLinespacing)
MAKE_METHOD(SetLinespacing,setLinespacing)
MAKE_METHOD(GetConnectorcolor,getConnectorcolor)
MAKE_METHOD(SetConnectorcolor,setConnectorcolor)
MAKE_METHOD(GetConnectorstyle,getConnectorstyle)
MAKE_METHOD(SetConnectorstyle,setConnectorstyle)
MAKE_METHOD(GetConnectorwidth,getConnectorwidth)
MAKE_METHOD(SetConnectorwidth,setConnectorwidth)
MAKE_METHOD(GetOpenicon,getOpenicon)
MAKE_METHOD(SetOpenicon,setOpenicon)
MAKE_METHOD(GetCloseicon,getCloseicon)
MAKE_METHOD(SetCloseicon,setCloseicon)
MAKE_METHOD(GetUsericon,getUsericon)
MAKE_METHOD(SetUsericon,setUsericon)
MAKE_METHOD(GetShowcollapse,getShowcollapse)
MAKE_METHOD(SetShowcollapse,setShowcollapse)
MAKE_METHOD(GetSortorder,getSortorder)
MAKE_METHOD(SetSortorder,setSortorder)
MAKE_METHOD(GetSelectbox,getSelectbox)
MAKE_METHOD(SetSelectbox,setSelectbox)
MAKE_METHOD(GetShowroot,getShowroot)
MAKE_METHOD(SetShowroot,setShowroot)
MAKE_METHOD(GetSelectmode,getSelectmode)
MAKE_METHOD(SetSelectmode,setSelectmode)

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
  (SelectSet
  (SelectToggle
  (SelectAll
  (Deselect
  (DeselectAll
  (IsSelected
  (Activate
  (ActivateWith
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


type instance Functions TreeItem = TreeItemFuncs

MAKE_METHOD(ShowSelf,showSelf)
MAKE_METHOD(SetWidget,setWidget)
MAKE_METHOD(GetWidget,getWidget)
MAKE_METHOD(Child,child)
MAKE_METHOD(HasChildren,hasChildren)
MAKE_METHOD(FindChild,findChild)
MAKE_METHOD(RemoveChild,removeChild)
MAKE_METHOD(ClearChildren,clearChildren)
MAKE_METHOD(SwapChildren,swapChildren)
MAKE_METHOD(SwapChildrenByTreeItem,swapChildrenByTreeItem)
MAKE_METHOD(FindInChildren,findInChildren)
MAKE_METHOD(FindItem,findItem)
MAKE_METHOD(AddAt,addAt)
MAKE_METHOD(InsertAbove,insertAbove)
MAKE_METHOD(Deparent,deparent)
MAKE_METHOD(Reparent,reparent)
MAKE_METHOD(MoveTo,moveTo)
MAKE_METHOD(GetDepth,getDepth)
MAKE_METHOD(NextSibling,nextSibling)
MAKE_METHOD(PrevSibling,prevSibling)
MAKE_METHOD(UpdatePrevNext,updatePrevNext)
MAKE_METHOD(NextDisplayed,nextDisplayed)
MAKE_METHOD(PrevDisplayed,prevDisplayed)
MAKE_METHOD(Open,open)
MAKE_METHOD(Close,close)
MAKE_METHOD(IsOpen,isOpen)
MAKE_METHOD(IsClose,isClose)
MAKE_METHOD(OpenToggle,openToggle)
MAKE_METHOD(SelectSet,selectSet)
MAKE_METHOD(SelectToggle,selectToggle)
MAKE_METHOD(SelectAll,selectAll)
MAKE_METHOD(DeselectAll,deselectAll)
MAKE_METHOD(ActivateWith,activateWith)
MAKE_METHOD(IsActive,isActive)
MAKE_METHOD(IsVisible,isVisible)
MAKE_METHOD(VisibleR,visibleR)
MAKE_METHOD(FindClicked,findClicked)
MAKE_METHOD(EventOnCollapseIcon,eventOnCollapseIcon)
MAKE_METHOD(EventOnLabel,eventOnLabel)
MAKE_METHOD(IsRoot,isRoot)
MAKE_METHOD(LabelX,labelX)
MAKE_METHOD(LabelY,labelY)
MAKE_METHOD(LabelW,labelW)
MAKE_METHOD(LabelH,labelH)

data CTreeBase parent
type TreeBase = CTreeBase GroupBase
type TreeBaseFuncs =
  (Destroy
  (ShowSelf
  (RootLabel
  (Root
  (Add
  (AddAt
  (InsertAbove
  (Insert
  (Remove
  (Clear
  (ClearChildren
  (FindItem
  (ItemPathname
  (ItemClicked
  (GetFirst
  (FirstVisible
  (Next
  (NextItem
  (NextAfterItem
  (Prev
  (PrevBeforeItem
  (GetLast
  (LastVisible
  (FirstSelectedItem
  (LastSelectedItem
  (NextSelectedItem
  (NextSelectedItemAfterItem
  (Open
  (OpenAndCallback
  (OpenToggle
  (OpenToggleAndCallback
  (Close
  (CloseAndCallback
  (IsOpen
  (IsClose
  (Select
  (SelectAndCallback
  (SelectToggle
  (SelectToggleAndCallback
  (Deselect
  (DeselectAndCallback
  (SelectOnly
  (SelectOnlyAndCallback
  (SelectAll
  (SelectAllAndCallback
  (DeselectAll
  (DeselectAllAndCallback
  (SetItemFocus
  (GetItemFocus
  (IsSelected
  (GetItemLabelfont
  (SetItemLabelfont
  (GetItemLabelsize
  (SetItemLabelsize
  (GetItemLabelfgcolor
  (SetItemLabelfgcolor
  (GetItemLabelbgcolor
  (SetItemLabelbgcolor
  (GetConnectorcolor
  (SetConnectorcolor
  (GetMarginleft
  (SetMarginleft
  (GetMargintop
  (SetMargintop
  (GetLinespacing
  (SetLinespacing
  (GetOpenchildMarginbottom
  (SetOpenchildMarginbottom
  (GetUsericonmarginleft
  (SetUsericonmarginleft
  (GetLabelmarginleft
  (SetLabelmarginleft
  (GetConnectorwidth
  (SetConnectorwidth
  (GetUsericon
  (SetUsericon
  (GetOpenicon
  (SetOpenicon
  (GetCloseicon
  (SetCloseicon
  (GetShowcollapse
  (SetShowcollapse
  (GetShowroot
  (SetShowroot
  (GetConnectorstyle
  (SetConnectorstyle
  (GetSortorder
  (SetSortorder
  (GetSelectbox
  (SetSelectbox
  (Selectmode
  (SetSelectmode
  (Displayed
  (ShowItemWithYoff
  (ShowItemTop
  (ShowItemMiddle
  (ShowItemBottom
  (Display
  (GetVposition
  (SetVposition
  (IsScrollbar
  (GetScrollbarSize
  (SetScrollbarSize
  (IsVscrollVisible
  (SetCallbackItem
  (GetCallbackItem
  (SetCallbackReason
  (GetCallbackReason
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (RecalcTree
  (GetMarginbottom
  (SetMarginbottom
  (GetWidgetmarginleft
  (SetWidgetmarginleft
  (GetItemReselectMode
  (SetItemReselectMode
  (Resize
  (GetItemDrawMode
  (SetItemDrawMode
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions TreeBase = TreeBaseFuncs

data CTree parent
type Tree = CTree TreeBase
type TreeFuncs =
 (Draw
 (Handle
 (ShowWidget
 (Hide
 (Resize
 ())))))


type instance Functions Tree = TreeFuncs

MAKE_METHOD(RootLabel,rootLabel)
MAKE_METHOD(Root,root)
MAKE_METHOD(ItemClicked,itemClicked)
MAKE_METHOD(FirstVisible,firstVisible)
MAKE_METHOD(NextAfterItem,nextAfterItem)
MAKE_METHOD(NextItem,nextItem)
MAKE_METHOD(PrevBeforeItem,prevBeforeItem)
MAKE_METHOD(GetLast,getLast)
MAKE_METHOD(LastVisible,lastVisible)
MAKE_METHOD(FirstSelectedItem,firstSelectedItem)
MAKE_METHOD(LastSelectedItem,lastSelectedItem)
MAKE_METHOD(NextSelectedItem,nextSelectedItem)
MAKE_METHOD(NextSelectedItemAfterItem,nextSelectedItemAfterItem)
MAKE_METHOD(OpenAndCallback,openAndCallback)
MAKE_METHOD(OpenToggleAndCallback,openToggleAndCallback)
MAKE_METHOD(TreeMenuItemLocator,treeMenuItemLocator)
MAKE_METHOD(CloseAndCallback,closeAndCallback)
MAKE_METHOD(SelectAndCallback,selectAndCallback)
MAKE_METHOD(SelectToggleAndCallback,selectToggleAndCallback)
MAKE_METHOD(SelectAllAndCallback,selectAllAndCallback)
MAKE_METHOD(DeselectAllAndCallback,deselectAllAndCallback)
MAKE_METHOD(SetItemFocus,setItemFocus)
MAKE_METHOD(GetItemFocus,getItemFocus)
MAKE_METHOD(IsSelectedWithItem,isSelectedWithItem)
MAKE_METHOD(SetItemLabelfont,setItemLabelfont)
MAKE_METHOD(GetItemLabelfgcolor,getItemLabelfgcolor)
MAKE_METHOD(Selectmode,selectmode)
MAKE_METHOD(ShowItemWithYoff,showItemWithYoff)
MAKE_METHOD(ShowItemTop,showItemTop)
MAKE_METHOD(ShowItemMiddle,showItemMiddle)
MAKE_METHOD(ShowItemBottom,showItemBottom)
MAKE_METHOD(Display,display)
MAKE_METHOD(GetVposition,getVposition)
MAKE_METHOD(SetVposition,setVposition)
MAKE_METHOD(IsScrollbar,isScrollbar)
MAKE_METHOD(IsVscrollVisible,isVscrollVisible)
MAKE_METHOD(SetCallbackItem,setCallbackItem)
MAKE_METHOD(GetCallbackItem,getCallbackItem)
MAKE_METHOD(SetCallbackReason,setCallbackReason)
MAKE_METHOD(GetCallbackReason,getCallbackReason)
MAKE_METHOD(RecalcTree, recalcTree)
MAKE_METHOD(SetMarginbottom,setMarginbottom)
MAKE_METHOD(GetMarginbottom,getMarginbottom)
MAKE_METHOD(SetWidgetmarginleft,setWidgetmarginleft)
MAKE_METHOD(GetWidgetmarginleft,getWidgetmarginleft)
MAKE_METHOD(SetItemReselectMode,setItemReselectMode)
MAKE_METHOD(GetItemReselectMode,getItemReselectMode)
MAKE_METHOD(SetItemDrawMode,setItemDrawMode)
MAKE_METHOD(GetItemDrawMode,getItemDrawMode)

data CTextSelection parent
type TextSelection = CTextSelection Base
type TextSelectionFuncs =
  (Set
  (Update
  (Start
  (End
  (Selected
  (SetSelected
  (Includes
  (GetPosition
  ()))))))))

type instance Functions TextSelection = TextSelectionFuncs
MAKE_METHOD(Update,update)
MAKE_METHOD(Start,start)
MAKE_METHOD(SetSelected,setSelected)
MAKE_METHOD(Includes,includes)

data CTextBuffer parent
type TextBuffer = CTextBuffer Base
type TextBufferFuncs =
  (Destroy
  (InputFileWasTranscoded
  (FileEncodingWarningMessage
  (GetLength
  (GetText
  (SetText
  (TextRange
  (CharAt
  (ByteAt
  (Insert
  (AppendToBuffer
  (Remove
  (Replace
  (Copy
  (Undo
  (CanUndo
  (Insertfile
  (InsertfileWithBuflen
  (Appendfile
  (AppendfileWithBuflen
  (Loadfile
  (LoadfileWithBuflen
  (Outputfile
  (OutputfileWithBuflen
  (Savefile
  (SavefileWithBuflen
  (GetTabDistance
  (SetTabDistance
  (Select
  (Selected
  (Unselect
  (SelectionPosition
  (SelectionText
  (RemoveSelection
  (ReplaceSelection
  (SecondarySelect
  (SecondarySelected
  (SecondaryUnselect
  (SecondarySelectionPosition
  (SecondarySelectionText
  (RemoveSecondarySelection
  (ReplaceSecondarySelection
  (SetHighlight
  (GetHighlight
  (Unhighlight
  (HighlightPosition
  (HighlightText
  (AddModifyCallback
  (RemoveModifyCallback
  (CallModifyCallbacks
  (AddPredeleteCallback
  (RemovePredeleteCallback
  (CallPredeleteCallbacks
  (LineText
  (LineStart
  (LineEnd
  (WordStart
  (WordEnd
  (CountDisplayedCharacters
  (SkipDisplayedCharacters
  (CountLines
  (SkipLines
  (RewindLines
  (FindcharForward
  (FindcharBackward
  (SearchForwardWithMatchcase
  (SearchBackwardWithMatchcase
  (PrimarySelection
  (SecondarySelection
  (HighlightSelection
  (PrevChar
  (PrevCharClipped
  (NextChar
  (NextCharClipped
  (Utf8Align
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions TextBuffer = TextBufferFuncs

MAKE_METHOD(InputFileWasTranscoded,inputFileWasTranscoded)
MAKE_METHOD(FileEncodingWarningMessage,fileEncodingWarningMessage)
MAKE_METHOD(GetLength,getLength)
MAKE_METHOD(TextRange,textRange)
MAKE_METHOD(CharAt,charAt)
MAKE_METHOD(ByteAt,byteAt)
MAKE_METHOD(AppendToBuffer,appendToBuffer)
MAKE_METHOD(CanUndo,canUndo)
MAKE_METHOD(Insertfile,insertfile)
MAKE_METHOD(InsertfileWithBuflen,insertfileWithBuflen)
MAKE_METHOD(Appendfile,appendfile)
MAKE_METHOD(AppendfileWithBuflen,appendfileWithBuflen)
MAKE_METHOD(Loadfile,loadfile)
MAKE_METHOD(LoadfileWithBuflen,loadfileWithBuflen)
MAKE_METHOD(Outputfile,outputfile)
MAKE_METHOD(OutputfileWithBuflen,outputfileWithBuflen)
MAKE_METHOD(Savefile,savefile)
MAKE_METHOD(SavefileWithBuflen,savefileWithBuflen)
MAKE_METHOD(GetTabDistance,getTabDistance)
MAKE_METHOD(SetTabDistance,setTabDistance)
MAKE_METHOD(Unselect,unselect)
MAKE_METHOD(SelectionPosition,selectionPosition)
MAKE_METHOD(SelectionText,selectionText)
MAKE_METHOD(RemoveSelection,removeSelection)
MAKE_METHOD(ReplaceSelection,replaceSelection)
MAKE_METHOD(SecondarySelect,secondarySelect)
MAKE_METHOD(SecondarySelected,secondarySelected)
MAKE_METHOD(SecondaryUnselect,secondaryUnselect)
MAKE_METHOD(SecondarySelectionPosition,secondarySelectionPosition)
MAKE_METHOD(SecondarySelectionText,secondarySelectionText)
MAKE_METHOD(RemoveSecondarySelection,removeSecondarySelection)
MAKE_METHOD(ReplaceSecondarySelection,replaceSecondarySelection)
MAKE_METHOD(GetHighlight,getHighlight)
MAKE_METHOD(SetHighlight,setHighlight)
MAKE_METHOD(Unhighlight,unhighlight)
MAKE_METHOD(HighlightPosition,highlightPosition)
MAKE_METHOD(HighlightText,highlightText)
MAKE_METHOD(AddModifyCallback,addModifyCallback)
MAKE_METHOD(RemoveModifyCallback,removeModifyCallback)
MAKE_METHOD(CallModifyCallbacks,callModifyCallbacks)
MAKE_METHOD(AddPredeleteCallback,addPredeleteCallback)
MAKE_METHOD(RemovePredeleteCallback,removePredeleteCallback)
MAKE_METHOD(CallPredeleteCallbacks,callPredeleteCallbacks)
MAKE_METHOD(LineText,lineText)
MAKE_METHOD(LineStart,lineStart)
MAKE_METHOD(LineEnd,lineEnd)
MAKE_METHOD(WordStart,wordStart)
MAKE_METHOD(WordEnd,wordEnd)
MAKE_METHOD(CountDisplayedCharacters,countDisplayedCharacters)
MAKE_METHOD(SkipDisplayedCharacters,skipDisplayedCharacters)
MAKE_METHOD(CountLines,countLines)
MAKE_METHOD(SkipLines,skipLines)
MAKE_METHOD(RewindLines,rewindLines)
MAKE_METHOD(FindcharForward,findcharForward)
MAKE_METHOD(FindcharBackward,findcharBackward)
MAKE_METHOD(SearchForwardWithMatchcase,searchForwardWithMatchcase)
MAKE_METHOD(SearchBackwardWithMatchcase,searchBackwardWithMatchcase)
MAKE_METHOD(PrimarySelection,primarySelection)
MAKE_METHOD(SecondarySelection,secondarySelection)
MAKE_METHOD(HighlightSelection,highlightSelection)
MAKE_METHOD(PrevChar,prevChar)
MAKE_METHOD(PrevCharClipped,prevCharClipped)
MAKE_METHOD(NextChar,nextChar)
MAKE_METHOD(NextCharClipped,nextCharClipped)
MAKE_METHOD(Utf8Align,utf8Align)

data CTextDisplayBase parent
type TextDisplayBase = CTextDisplayBase GroupBase
type TextDisplayBaseFuncs =
  (Destroy
  (Hide
  (Resize
  (Handle
  (SetBuffer
  (GetBuffer
  (RedisplayRange
  (Scroll
  (Overstrike
  (SetInsertPosition
  (GetInsertPosition
  (XyToPosition
  (PositionToXy
  (InSelection
  (ShowInsertPosition
  (MoveRight
  (MoveLeft
  (MoveUp
  (MoveDown
  (CountLines
  (LineStart
  (LineEnd
  (SkipLines
  (RewindLines
  (NextWord
  (PreviousWord
  (ShowCursor
  (SetCursorStyle
  (GetCursorColor
  (SetCursorColor
  (GetScrollbarWidth
  (SetScrollbarWidth
  (GetScrollbarAlign
  (SetScrollbarAlign
  (WordStart
  (WordEnd
  (HighlightData
  (PositionStyle
  (GetShortcut
  (SetShortcut
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  (XToCol
  (ColToX
  (SetLinenumberWidth
  (GetLinenumberWidth
  (SetLinenumberFont
  (GetLinenumberFont
  (SetLinenumberSize
  (GetLinenumberSize
  (SetLinenumberFgcolor
  (GetLinenumberFgcolor
  (SetLinenumberBgcolor
  (GetLinenumberBgcolor
  (SetLinenumberAlign
  (GetLinenumberAlign
  (SetLinenumberFormat
  (GetLinenumberFormat
  (WrapMode
  (Draw
  (ShowWidget
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions TextDisplayBase = TextDisplayBaseFuncs

data CTextDisplay parent
type TextDisplay = CTextDisplay TextDisplayBase
type TextDisplayFuncs =
  (Draw
  (Hide
  (Resize
  (Handle
  (ShowWidget
  ())))))

type instance Functions TextDisplay = TextDisplayFuncs

MAKE_METHOD(SetBuffer,setBuffer)
MAKE_METHOD(GetBuffer,getBuffer)
MAKE_METHOD(RedisplayRange,redisplayRange)
MAKE_METHOD(Scroll,scroll)
MAKE_METHOD(Overstrike,overstrike)
MAKE_METHOD(SetInsertPosition,setInsertPosition)
MAKE_METHOD(GetInsertPosition,getInsertPosition)
MAKE_METHOD(XyToPosition,xyToPosition)
MAKE_METHOD(PositionToXy,positionToXy)
MAKE_METHOD(InSelection,inSelection)
MAKE_METHOD(ShowInsertPosition,showInsertPosition)
MAKE_METHOD(MoveRight,moveRight)
MAKE_METHOD(MoveLeft,moveLeft)
MAKE_METHOD(MoveUp,moveUp)
MAKE_METHOD(MoveDown,moveDown)
MAKE_METHOD(NextWord,nextWord)
MAKE_METHOD(PreviousWord,previousWord)
MAKE_METHOD(ShowCursor,showCursor)
MAKE_METHOD(SetCursorStyle,setCursorStyle)
MAKE_METHOD(GetScrollbarAlign,getScrollbarAlign)
MAKE_METHOD(SetScrollbarAlign,setScrollbarAlign)
MAKE_METHOD(HighlightData,highlightData)
MAKE_METHOD(PositionStyle,positionStyle)
MAKE_METHOD(XToCol,xToCol)
MAKE_METHOD(ColToX,colToX)
MAKE_METHOD(SetLinenumberWidth,setLinenumberWidth)
MAKE_METHOD(GetLinenumberWidth,getLinenumberWidth)
MAKE_METHOD(SetLinenumberFont,setLinenumberFont)
MAKE_METHOD(GetLinenumberFont,getLinenumberFont)
MAKE_METHOD(SetLinenumberSize,setLinenumberSize)
MAKE_METHOD(GetLinenumberSize,getLinenumberSize)
MAKE_METHOD(SetLinenumberFgcolor,setLinenumberFgcolor)
MAKE_METHOD(GetLinenumberFgcolor,getLinenumberFgcolor)
MAKE_METHOD(SetLinenumberBgcolor,setLinenumberBgcolor)
MAKE_METHOD(GetLinenumberBgcolor,getLinenumberBgcolor)
MAKE_METHOD(SetLinenumberAlign,setLinenumberAlign)
MAKE_METHOD(GetLinenumberAlign,getLinenumberAlign)
MAKE_METHOD(SetLinenumberFormat,setLinenumberFormat)
MAKE_METHOD(GetLinenumberFormat,getLinenumberFormat)
MAKE_METHOD(WrapMode,wrapMode)

data CTextEditorBase parent
type TextEditorBase = CTextEditorBase TextDisplayBase
type TextEditorBaseFuncs =
  (Destroy
  (SetInsertMode
  (GetInsertMode
  (GetDefaultKeyBindings
  (ReplaceKeyBindings
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))

type instance Functions TextEditorBase = TextEditorBaseFuncs

data CTextEditor parent
type TextEditor = CTextEditor TextEditorBase
type TextEditorFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions TextEditor = TextEditorFuncs

MAKE_METHOD(SetInsertMode,setInsertMode)
MAKE_METHOD(GetInsertMode,getInsertMode)
MAKE_METHOD(GetDefaultKeyBindings,getDefaultKeyBindings)
MAKE_METHOD(ReplaceKeyBindings,replaceKeyBindings)

data CNativeFileChooser parent
type NativeFileChooser = CNativeFileChooser Base
type NativeFileChooserFuncs =
  (Destroy
  (SetType
  (GetType_
  (SetOptions
  (GetOptions
  (GetCount
  (GetFilename
  (GetFilenameAt
  (SetDirectory
  (GetDirectory
  (SetTitle
  (GetTitle
  (GetFilter
  (SetFilter
  (Filters
  (SetFilterValue
  (GetFilterValue
  (SetPresetFile
  (GetPresetFile
  (GetErrmsg
  (ShowWidget
  ())))))))))))))))))))))

type instance Functions NativeFileChooser = NativeFileChooserFuncs

MAKE_METHOD(SetOptions,setOptions)
MAKE_METHOD(GetOptions,getOptions)
MAKE_METHOD(GetFilename,getFilename)
MAKE_METHOD(GetFilenameAt,getFilenameAt)
MAKE_METHOD(SetDirectory,setDirectory)
MAKE_METHOD(GetDirectory,getDirectory)
MAKE_METHOD(SetTitle,setTitle)
MAKE_METHOD(GetTitle,getTitle)
MAKE_METHOD(GetFilter,getFilter)
MAKE_METHOD(SetFilter,setFilter)
MAKE_METHOD(Filters,filters)
MAKE_METHOD(SetFilterValue,setFilterValue)
MAKE_METHOD(GetFilterValue,getFilterValue)
MAKE_METHOD(SetPresetFile,setPresetFile)
MAKE_METHOD(GetPresetFile,getPresetFile)
MAKE_METHOD(GetErrmsg,getErrmsg)

data CTileBase parent
type TileBase = CTileBase GroupBase
type TileBaseFuncs =
  (SetPosition
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))

type instance Functions TileBase = TileBaseFuncs

data CTile parent
type Tile = CTile TileBase
type TileFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions Tile = TileFuncs

data CPackBase parent
type PackBase = CPackBase GroupBase
type PackBaseFuncs =
  (GetType_
  (SetType
  (SetSpacing
  (GetSpacing
  (IsHorizontal
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))

type instance Functions PackBase = PackBaseFuncs
data CPack parent
type Pack = CPack PackBase
type PackFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))
type instance Functions Pack = PackFuncs

MAKE_METHOD(SetSpacing,setSpacing)
MAKE_METHOD(GetSpacing,getSpacing)
MAKE_METHOD(IsHorizontal,isHorizontal)

data CScrolledBase parent
type ScrolledBase = CScrolledBase GroupBase
type ScrolledBaseFuncs =
  (SetScrollbarSize
  (GetScrollbarSize
  (Clear
  (ScrollTo
  (Yposition
  (Xposition
  (GetType_
  (SetType
  (Resize
  (Draw
  (Handle
  (ShowWidget
  (Hide
  ())))))))))))))

type instance Functions ScrolledBase = ScrolledBaseFuncs

data CScrolled parent
type Scrolled = CScrolled ScrolledBase
type ScrolledFuncs =
  (Resize
  (Draw
  (Handle
  (ShowWidget
  (Hide
  ())))))

type instance Functions Scrolled = ScrolledFuncs

MAKE_METHOD(ScrollTo,scrollTo)
MAKE_METHOD(Xposition,xposition)
MAKE_METHOD(Yposition,yposition)

data CTabsBase parent
type TabsBase = CTabsBase GroupBase
type TabsBaseFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Resize
  (Hide
  (GetValue
  (SetValue
  (GetPush
  (SetPush
  (Which
  (ClientArea
  (TabPositions
  (TabHeight
  (GetTabAlign
  (SetTabAlign
  (Resize
  ()))))))))))))))))

type instance Functions TabsBase = TabsBaseFuncs

data CTabs parent
type Tabs = CTabs TabsBase
type TabsFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Resize
  (Hide
  (Resize
  ()))))))

type instance Functions Tabs = TabsFuncs

MAKE_METHOD(GetPush,getPush)
MAKE_METHOD(SetPush,setPush)
MAKE_METHOD(Which,which)
MAKE_METHOD(ClientArea,clientArea)
MAKE_METHOD(TabPositions, tabPositions)
MAKE_METHOD(TabHeight, tabHeight)
MAKE_METHOD(GetTabAlign,getTabAlign)
MAKE_METHOD(SetTabAlign,setTabAlign)

data CSpinnerBase parent
type SpinnerBase = CSpinnerBase GroupBase
type SpinnerBaseFuncs =
  (GetValue
  (SetValue
  (Handle
  (SetTextfont
  (GetTextfont
  (SetTextsize
  (GetTextsize
  (SetTextcolor
  (GetTextcolor
  (SetType
  (GetType_
  (SetFormat
  (GetFormat
  (SetMinimum
  (GetMinimum
  (SetMaximum
  (GetMaximum
  (SetStep
  (GetStep
  (Resize
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (GetWrap
  (SetWrap
  (Resize
  (Range
  ()))))))))))))))))))))))))))))


type instance Functions SpinnerBase = SpinnerBaseFuncs
data CSpinner parent
type Spinner = CSpinner SpinnerBase
type SpinnerFuncs =
  (Handle
  (Resize
  (Draw
  (Handle
  (ShowWidget
  (Hide
  ()))))))


type instance Functions Spinner = SpinnerFuncs

MAKE_METHOD(GetFormat,getFormat)
MAKE_METHOD(SetFormat,setFormat)

data CColorChooserBase parent
type ColorChooserBase = CColorChooserBase GroupBase
type ColorChooserBaseFuncs =
  (GetMode
  (SetMode
  (GetHue
  (GetSaturation
  (GetValue
  (GetR
  (GetG
  (GetB
  (GetHsv
  (GetRgb
  (SetHsv
  (SetRgb
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))))))))

type instance Functions ColorChooserBase = ColorChooserBaseFuncs

data CColorChooser parent
type ColorChooser = CColorChooser ColorChooserBase
type ColorChooserFuncs =
  (GetMode
  (SetMode
  (GetHue
  (GetSaturation
  (GetValue
  (GetR
  (GetG
  (GetB
  (SetHsv
  (SetRgb
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))))))

type instance Functions ColorChooser = ColorChooserFuncs

MAKE_METHOD(GetHue, getHue)
MAKE_METHOD(GetSaturation, getSaturation)
MAKE_METHOD(GetR, getR)
MAKE_METHOD(GetG, getG)
MAKE_METHOD(GetB, getB)
MAKE_METHOD(SetHsv, setHsv)
MAKE_METHOD(SetRgb, setRgb)
MAKE_METHOD(GetRgb, getRgb)
MAKE_METHOD(GetHsv, getHsv)

data CFileBrowserBase parent
type FileBrowserBase = CFileBrowserBase BrowserBase
type FileBrowserBaseFuncs =
  (SetIconsize
  (GetIconsize
  (SetFilter
  (GetFilter
  (SetTextsize
  (GetTextsize
  (GetFiletype
  (SetFiletype
  (Load
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ()))))))))))))))
type instance Functions FileBrowserBase = FileBrowserBaseFuncs

data CFileBrowser parent
type FileBrowser = CFileBrowser FileBrowserBase
type FileBrowserFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))
type instance Functions FileBrowser = FileBrowserFuncs

MAKE_METHOD(SetIconsize, setIconsize)
MAKE_METHOD(GetIconsize, getIconsize)
MAKE_METHOD(SetFiletype, setFiletype)
MAKE_METHOD(GetFiletype, getFiletype)

data CRGBImage parent
type RGBImage = CRGBImage Image
type RGBImageFuncs =
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

type instance Functions RGBImage = RGBImageFuncs

data CJPEGImage parent
type JPEGImage = CJPEGImage RGBImage
type instance Functions JPEGImage = ()

data CBMPImage parent
type BMPImage = CBMPImage RGBImage
type instance Functions BMPImage = ()

data CGIFImage parent
type GIFImage = CGIFImage RGBImage
type instance Functions GIFImage = ()

data CXBMImage parent
type XBMImage = CXBMImage RGBImage
type instance Functions XBMImage = ()

data CXPMImage parent
type XPMImage = CXPMImage RGBImage
type instance Functions XPMImage = ()

data CPNGImage parent
type PNGImage = CPNGImage RGBImage
type instance Functions PNGImage = ()

data CPNMImage parent
type PNMImage = CPNMImage RGBImage
type instance Functions PNMImage = ()

data CFileInputBase parent
type FileInputBase = CFileInputBase InputBase
type FileInputBaseFuncs =
  (SetDownBox
  (GetDownBox
  (SetErrorColor
  (GetErrorColor
  (GetValue
  (SetValue
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))))))))

type instance Functions FileInputBase = FileInputBaseFuncs

data CFileInput parent
type FileInput = CFileInput FileInputBase
type FileInputFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions FileInput = FileInputFuncs

MAKE_METHOD(SetErrorColor, setErrorColor)
MAKE_METHOD(GetErrorColor, getErrorColor)

data CScreenDriver parent
type ScreenDriver = CScreenDriver Base
type instance Functions ScreenDriver = ()

data CSystemDriver parent
type SystemDriver = CSystemDriver Base
type instance Functions SystemDriver = ()

data CSVGImage parent
type SVGImage = CSVGImage RGBImage
type SVGImageFuncs =
  (Destroy
  (Copy
  (ColorAverage
  (Desaturate
  (DrawResize
  (Draw
  (Resize
  ())))))))
type instance Functions SVGImage = SVGImageFuncs

data CSimpleTerminalBase parent
type SimpleTerminalBase = CSimpleTerminalBase TextDisplayBase
type SimpleTerminalBaseFuncs =
    (SetStayAtBottom
    (GetStayAtBottom
    (SetHistoryLines
    (GetHistoryLines
    (SetAnsi
    (GetAnsi
    (SetStyleTable
    (GetStyleTable
    (GetStyleTableSize
    (SetNormalStyleIndex
    (GetNormalStyleIndex
    (SetCurrentStyleIndex
    (GetCurrentStyleIndex
    (SetText
    (GetText
    (Clear
    (RemoveLines
    (Draw
    (Resize
    (Handle
    (Hide
    (ShowWidget
    ()))))))))))))))))))))))
type instance Functions SimpleTerminalBase = SimpleTerminalBaseFuncs

data CSimpleTerminal parent
type SimpleTerminal = CSimpleTerminal SimpleTerminalBase
type SimpleTerminalFuncs =
  (Draw
  (Handle
  (ShowWidget
  (Hide
  (Resize
  ())))))

type instance Functions SimpleTerminal = SimpleTerminalFuncs

MAKE_METHOD(SetStayAtBottom,setStayAtBottom)
MAKE_METHOD(GetStayAtBottom,getStayAtBottom)
MAKE_METHOD(SetHistoryLines,setHistoryLines)
MAKE_METHOD(GetHistoryLines,getHistoryLines)
MAKE_METHOD(SetAnsi,setAnsi)
MAKE_METHOD(GetAnsi,getAnsi)
MAKE_METHOD(SetStyleTable,setStyleTable)
MAKE_METHOD(GetStyleTable,getStyleTable)
MAKE_METHOD(GetStyleTableSize,getStyleTableSize)
MAKE_METHOD(SetNormalStyleIndex,setNormalStyleIndex)
MAKE_METHOD(GetNormalStyleIndex,getNormalStyleIndex)
MAKE_METHOD(SetCurrentStyleIndex,setCurrentStyleIndex)
MAKE_METHOD(GetCurrentStyleIndex,getCurrentStyleIndex)
MAKE_METHOD(RemoveLines,removeLines)

data CMultiLabel parent
type MultiLabel = CMultiLabel Base
type MultiLabelFuncs =
  (WidgetLabel
  (MenuItemLabel
  ()))
type instance Functions MultiLabel = MultiLabelFuncs

MAKE_METHOD(WidgetLabel, widgetLabel)
MAKE_METHOD(MenuItemLabel, menuItemLabel)
