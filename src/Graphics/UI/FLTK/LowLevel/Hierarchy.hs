{-# LANGUAGE TypeSynonymInstances, TypeFamilies, GADTs, FlexibleContexts, EmptyDataDecls, CPP #-}
#ifdef CALLSTACK_AVAILABLE
{-# LANGUAGE ImplicitParams #-}
#endif

#ifdef CALLSTACK_AVAILABLE
#define MAKE_METHOD(Datatype, Method) \
data Datatype a; \
Method :: (?loc :: CallStack, Match r ~ FindOp a a (Datatype ()), Op (Datatype ()) r a impl) => Ref a -> impl; \
Method aRef = (unsafePerformIO $ withRef aRef (\_ -> return ())) `seq` dispatch (undefined :: Datatype()) aRef
#elif HASCALLSTACK_AVAILABLE
#define MAKE_METHOD(Datatype, Method) \
data Datatype a; \
Method :: (HasCallStack, Match r ~ FindOp a a (Datatype ()), Op (Datatype ()) r a impl) => Ref a -> impl; \
Method aRef = (unsafePerformIO $ withRef aRef (\_ -> return ())) `seq` dispatch (undefined :: Datatype()) aRef
#else
#define MAKE_METHOD(Datatype, Method) \
data Datatype a; \
Method :: (Match r ~ FindOp a a (Datatype ()), Op (Datatype ()) r a impl) => Ref a -> impl; \
Method aRef = dispatch (undefined :: Datatype ()) aRef
#endif

module Graphics.UI.FLTK.LowLevel.Hierarchy
       (
         -- * Region
         Region,
         -- * GlContext
         GlContext,
         -- * Widget
         Widget,
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
         -- * Group
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
         Range,
         range,
         SetStep,
         setStep,
         GetStep,
         getStep,
         Precision,
         precision,
         SetFormat,
         setFormat,
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
         -- * MenuBar
         MenuBar,
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
         Fail,
         fail,
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
         SetScrollValue,
         setScrollValue,
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
         -- * Output
         Output,
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
         -- * TableRow
         TableRow,
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
         Tile,
         Pack,
         setSpacing,
         SetSpacing,
         getSpacing,
         GetSpacing,
         isHorizontal,
         IsHorizontal,
         -- Scrolled AKA Scroll
         Scrolled,
         ScrollTo,
         scrollTo,
         Xposition,
         xposition,
         Yposition,
         yposition,
         -- Tabs
         Tabs,
         GetPush,
         getPush,
         SetPush,
         setPush,
         Which,
         which,
         ClientArea,
         clientArea,
         -- Spinner
         Spinner,
         GetFormat,
         getFormat,
         -- ColorChooser
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
         -- FileBrowser
         FileBrowser,
         SetIconsize,
         setIconsize,
         GetIconsize,
         getIconsize,
         SetFiletype,
         setFiletype,
         GetFiletype,
         getFiletype,
         -- RGBImage
         RGBImage,
         -- JPEGImage
         JPEGImage,
         -- BMPImage
         BMPImage,
         -- GIFImage
         GIFImage,
         -- XBMImage
         XBMImage,
         -- XPMImage
         XPMImage,
         -- PNGImage
         PNGImage,
         -- PNMImage
         PNMImage,
         -- FileInput
         FileInput,
         GetErrorColor,
         getErrorColor,
         SetErrorColor,
         setErrorColor
     )
where
import Prelude hiding (round, fail)
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Dispatch
#if defined(CALLSTACK_AVAILABLE) || defined(HASCALLSTACK_AVAILABLE)
import GHC.Stack
import System.IO.Unsafe
#endif
type instance Functions Base = ()
data CRegion parent
type Region = CRegion Base
type instance Functions Region = ()

data CGlContext parent
type GlContext = CGlContext Base
type instance Functions GlContext = ()

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
  (DoCallback
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
  (Changed
  (SetChanged
  (ClearChanged
  (SetActive
  (ClearActive
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
  (HasCallback
  (DrawBox
  (DrawBoxWithBoxtype
  (DrawBackdrop
  (DrawFocus
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
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
MAKE_METHOD(ClearDamageWithBitmask,clearDamageWithBitmask)
MAKE_METHOD(ClearDamage,clearDamage)
MAKE_METHOD(GetDamageWithText,getDamageWithText)
MAKE_METHOD(GetDamageInsideWidget,getDamageInsideWidget)
MAKE_METHOD(MeasureLabel,measureLabel)
MAKE_METHOD(GetWindow,getWindow)
MAKE_METHOD(GetTopWindow,getTopWindow)
MAKE_METHOD(GetTopWindowOffset,getTopWindowOffset)
MAKE_METHOD(ResizeSuper,resizeSuper)
MAKE_METHOD(Resize,resize)
MAKE_METHOD(SetCallback, setCallback)
MAKE_METHOD(HasCallback,hasCallback)
MAKE_METHOD(DrawBox,drawBox)
MAKE_METHOD(DrawBoxWithBoxtype,drawBoxWithBoxtype)
MAKE_METHOD(DrawBackdrop,drawBackdrop)
MAKE_METHOD(DrawFocus,drawFocus)

-- * Group
data CGroup parent
type Group = CGroup Widget
type GroupFuncs =
  (Destroy
  (DrawChild
  (DrawChildren
  (DrawOutsideLabel
  (UpdateChild
  (Begin
  (End
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
  (InsertWithBefore
  (GetArray
  (GetChild
  ()))))))))))))))))))))))))))
type instance Functions Group = GroupFuncs

MAKE_METHOD(DrawChild,drawChild)
MAKE_METHOD(DrawChildren,drawChildren)
MAKE_METHOD(DrawOutsideLabel,drawOutsideLabel)
MAKE_METHOD(UpdateChild,updateChild)
MAKE_METHOD(Begin,begin)
MAKE_METHOD(End,end)
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
MAKE_METHOD(InsertWithBefore,insertWithBefore)
MAKE_METHOD(GetArray,getArray)
MAKE_METHOD(GetChild,getChild)

data CWindow parent
type Window = CWindow Group
type WindowFuncs =
  (Destroy
  (SetType
  (GetType_
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
  ())))))))))))))))))))))))))))))))))))))))))))))))))
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
type instance Functions SingleWindow = SingleWindowFuncs


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

type instance Functions DoubleWindow = DoubleWindowFuncs


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

type instance Functions OverlayWindow = OverlayWindowFuncs


MAKE_METHOD(CanDoOverlay,canDoOverlay)
MAKE_METHOD(RedrawOverlay,redrawOverlay)
MAKE_METHOD(Flush,flush)

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
  (SetType
  (GetType_
  ()))))))))))))))))))))))))))

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

data CLightButton parent
type LightButtonFuncs =
  (Destroy
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))

type LightButton = CLightButton Button

type instance Functions LightButton = LightButtonFuncs

data CRadioLightButton parent
type RadioLightButton = CRadioLightButton LightButton

type instance Functions RadioLightButton = ()

data CCheckButton parent
type CheckButtonFuncs =
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  (Destroy ())))))))))
type CheckButton = CCheckButton Button

type instance Functions CheckButton = CheckButtonFuncs

data CReturnButton parent
type ReturnButton = CReturnButton Button
type ReturnButtonFuncs =
  (Destroy
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))

type instance Functions ReturnButton = ReturnButtonFuncs

data CRoundButton parent
type RoundButton = CRoundButton Button
type RoundButtonFuncs =
  (Destroy
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))

type instance Functions RoundButton = RoundButtonFuncs

data CRepeatButton parent
type RepeatButton = CRepeatButton Button
type RepeatButtonFuncs =
  (Destroy
  (Deactivate
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))

type instance Functions RepeatButton = RepeatButtonFuncs


data CToggleButton parent
type ToggleButton = CToggleButton Button
type ToggleButtonFuncs =
  (Destroy ())

type instance Functions ToggleButton = ToggleButtonFuncs

data CValuator parent
type Valuator = CValuator Widget
type ValuatorFuncs =
  (Destroy
  (Handle
  (HandleSuper
  (ResizeSuper
  (Resize
  (Hide
  (HideSuper
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
  (SetFormat
  (Round
  (Clamp
  (Increment
  (SetType
  (GetType_
  ()))))))))))))))))))))))))

type instance Functions Valuator = ValuatorFuncs

MAKE_METHOD(Bounds,bounds)
MAKE_METHOD(GetMinimum,getMinimum)
MAKE_METHOD(SetMinimum,setMinimum)
MAKE_METHOD(GetMaximum,getMaximum)
MAKE_METHOD(SetMaximum,setMaximum)
MAKE_METHOD(Range,range)
MAKE_METHOD(SetStep,setStep)
MAKE_METHOD(GetStep,getStep)
MAKE_METHOD(Precision,precision)
MAKE_METHOD(SetFormat,setFormat)
MAKE_METHOD(Round,round)
MAKE_METHOD(Clamp,clamp)
MAKE_METHOD(Increment,increment)

data CSlider parent
type Slider = CSlider Valuator
type SliderFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))

type instance Functions Slider = SliderFuncs

MAKE_METHOD(Scrollvalue,scrollvalue)
MAKE_METHOD(SetSliderSize,setSliderSize)
MAKE_METHOD(GetSliderSize,getSliderSize)
MAKE_METHOD(GetSlider,getSlider)
MAKE_METHOD(SetSlider,setSlider)

data CFillSlider parent
type FillSlider = CFillSlider Slider

type instance Functions FillSlider = ()

data CHorSlider parent
type HorSlider = CHorSlider Slider

type instance Functions HorSlider = ()

data CHorFillSlider parent
type HorFillSlider = CHorFillSlider Slider

type instance Functions HorFillSlider = ()

data CNiceSlider parent
type NiceSlider = CNiceSlider Slider

type instance Functions NiceSlider = ()

data CHorNiceSlider parent
type HorNiceSlider = CHorNiceSlider Slider

type instance Functions HorNiceSlider = ()

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
#if FLTK_API_VERSION == 10304
  (Setonly
#endif
  ())))))))))))))))))))))))))))))))))))))))))))))
#if FLTK_API_VERSION == 10304
  )
#endif

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

data CMenuBar parent
type MenuBar = CMenuBar MenuPrim
type MenuBarFuncs =
  (Destroy
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))
type instance Functions MenuBar = MenuBarFuncs


data CSysMenuBar parent
type SysMenuBar = CSysMenuBar MenuBar
type SysMenuBarFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))))))))))

type instance Functions SysMenuBar = SysMenuBarFuncs

data CChoice parent
type Choice = CChoice MenuPrim
type ChoiceFuncs =
  (Destroy
  (Handle
  (GetValue
  (SetValue
  (Draw
  (DrawSuper
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))

type instance Functions Choice = ChoiceFuncs


data CMenuButton parent
type MenuButton = CMenuButton MenuPrim
type MenuButtonFuncs =
  (Destroy
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  (Popup
  ()))))))))))

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
#if FLTK_API_VERSION == 10304
  (Fail
#endif
  ())))))))))))))
#if FLTK_API_VERSION == 10304
  )
#endif

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
  (ClassName
  (SetCurrent
  (Draw
  ()))))

type instance Functions CopySurface = CopySurfaceFuncs

MAKE_METHOD(ClassName,className)
MAKE_METHOD(SetCurrent,setCurrent)

data CImageSurface parent
type ImageSurface = CImageSurface Base
type ImageSurfaceFuncs =
  (Destroy
  (ClassName
  (SetCurrent
  (Draw
  ()))))

type instance Functions ImageSurface = ImageSurfaceFuncs


data CAdjuster parent
type Adjuster = CAdjuster Valuator
type AdjusterFuncs =
  (Destroy
  (SetSoft
  (GetSoft
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))

type instance Functions Adjuster = AdjusterFuncs


MAKE_METHOD(SetSoft,setSoft)
MAKE_METHOD(GetSoft,getSoft)

data CDial parent
type Dial = CDial Valuator
type DialFuncs =
  (Destroy
  (GetAngle1
  (SetAngle1
  (GetAngle2
  (SetAngle2
  (SetAngles
  (SetType
  (GetType_
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))))

type instance Functions Dial = DialFuncs

MAKE_METHOD(GetAngle1,getAngle1)
MAKE_METHOD(SetAngle1,setAngle1)
MAKE_METHOD(GetAngle2,getAngle2)
MAKE_METHOD(SetAngle2,setAngle2)
MAKE_METHOD(SetAngles,setAngles)

data CFillDial parent
type FillDial = CFillDial Dial

type instance Functions FillDial = ()

data CLineDial parent
type LineDial = CLineDial Dial

type instance Functions LineDial = ()

data CRoller parent
type Roller = CRoller Valuator
type RollerFuncs =
  (Destroy
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))

type instance Functions Roller = RollerFuncs

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
  (SetType
  (GetType_
  (Draw
  (DrawSuper
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))))))

type instance Functions Counter = CounterFuncs

MAKE_METHOD(SetLstep,setLstep)

data CSimpleCounter parent
type SimpleCounter = CSimpleCounter Counter

type instance Functions SimpleCounter = ()

data CScrollbar parent
type Scrollbar = CScrollbar Slider
type ScrollbarFuncs =
 (Destroy
 (SetScrollValue
 (SetLinesize
 (GetLinesize
 (SetType
 (GetType_
 (Draw
 (DrawSuper
 (Handle
 (HandleSuper
 (ShowWidget
 (ShowWidgetSuper
 (Hide
 (HideSuper
 ()))))))))))))))

type instance Functions Scrollbar = ScrollbarFuncs

MAKE_METHOD(SetLinesize,setLinesize)
MAKE_METHOD(GetLinesize,getLinesize)
MAKE_METHOD(SetScrollValue,setScrollValue)

data CValueSlider parent
type ValueSlider = CValueSlider Slider
type ValueSliderFuncs =
  (Destroy
  (GetTextfont
  (SetTextfont
  (GetTextsize
  (SetTextsize
  (GetTextcolor
  (SetTextcolor
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))

type instance Functions ValueSlider = ValueSliderFuncs

data CHorValueSlider parent
type HorValueSlider = CHorValueSlider ValueSlider

type instance Functions HorValueSlider = ()

data CInput parent
type Input = CInput Widget
type InputFuncs =
  (Destroy
  (SetType
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))))))))))))))))))))))))))))))))))

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

data COutput parent
type Output = COutput Input
type OutputFuncs =
  (SetType
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))

type instance Functions Output = OutputFuncs

data CValueInput parent
type ValueInput = CValueInput Valuator
type ValueInputFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))))

type instance Functions ValueInput = ValueInputFuncs

data CValueOutput parent
type ValueOutput = CValueOutput Valuator
type ValueOutputFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))

type instance Functions ValueOutput = ValueOutputFuncs

data CTimer parent
type Timer = CTimer Widget
type TimerFuncs =
  (Destroy
  (GetDirection
  (SetDirection
  (GetValue
  (SetValue
  (GetSuspended
  (SetSuspended
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))

type instance Functions Timer = TimerFuncs

MAKE_METHOD(GetDirection,getDirection)
MAKE_METHOD(SetDirection,setDirection)
MAKE_METHOD(GetSuspended,getSuspended)
MAKE_METHOD(SetSuspended,setSuspended)

data CHiddenTimer parent
type HiddenTimer = CHiddenTimer Widget

type instance Functions HiddenTimer = ()

data CValueTimer parent
type ValueTimer = CValueTimer Widget

type instance Functions ValueTimer = ()

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
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))

type instance Functions Progress = ProgressFuncs

data CPositioner parent
type Positioner = CPositioner Widget
type PositionerFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))))))))))

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

data CWizard parent
type Wizard = CWizard Group
type WizardFuncs =
  (Destroy
  (Next
  (Prev
  (SetValue
  (GetValue
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))

type instance Functions Wizard = WizardFuncs

MAKE_METHOD(Prev,prev)

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

data CTableRow parent
type TableRow = CTableRow Table
type TableRowFuncs =
  (Destroy
  (GetRows
  (SetType
  (GetType_
  (SetRows
  (SetCols
  (ClearSuper
  (Clear
  (SetRowsSuper
  (SetColsSuper
  (Handle
  (HandleSuper
  (ResizeSuper
  (Resize
  (GetRowSelected
  (SelectAllRows
  ()))))))))))))))))

type instance Functions TableRow = TableRowFuncs

MAKE_METHOD(GetRowSelected,getRowSelected)
MAKE_METHOD(SelectAllRows,selectAllRows)

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
  ())))))))))))))))))))))))))))))

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

data CBox parent
type Box = CBox Widget

type instance Functions Box = ()

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
  (SetType
  (GetType_
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

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
MAKE_METHOD(SortWithSortType,sortWithSortType)
MAKE_METHOD(Sort,sort)

data CSelectBrowser parent
type SelectBrowser = CSelectBrowser Browser

type instance Functions SelectBrowser = ()

data CIntInput parent
type IntInput = CIntInput Input

type instance Functions IntInput = ()

data CClock parent
type Clock = CClock Widget
type ClockFuncs =
  (Handle
  (GetValue
  (GetValueSinceEpoch
  (SetValue
  (SetType
  (GetType_
  (Draw
  (DrawSuper
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))


type instance Functions Clock = ClockFuncs
MAKE_METHOD(GetValueSinceEpoch,getValueSinceEpoch)

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
  ())))))))))))))))))))))))))))))))))))))))))))))))))

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
  (SelectWithVal
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
MAKE_METHOD(SelectWithVal,selectWithVal)
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

data CTree parent
type Tree = CTree Group
type TreeFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))


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

data CTextDisplay parent
type TextDisplay = CTextDisplay Group
type TextDisplayFuncs =
  (Destroy
  (Resize
  (Handle
  (SetBuffer
  (GetBuffer
  (RedisplayRange
  (Scroll
  (Overstrike
  (SetInsertPosition
  (GetInsertPosition
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
  ())))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

type instance Functions TextDisplay = TextDisplayFuncs

MAKE_METHOD(SetBuffer,setBuffer)
MAKE_METHOD(GetBuffer,getBuffer)
MAKE_METHOD(RedisplayRange,redisplayRange)
MAKE_METHOD(Scroll,scroll)
MAKE_METHOD(Overstrike,overstrike)
MAKE_METHOD(SetInsertPosition,setInsertPosition)
MAKE_METHOD(GetInsertPosition,getInsertPosition)
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

data CTextEditor parent
type TextEditor = CTextEditor TextDisplay
type TextEditorFuncs =
  (Destroy
  (SetInsertMode
  (GetInsertMode
  (GetDefaultKeyBindings
  (ReplaceKeyBindings
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))

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

data CTile parent
type Tile = CTile Group
type TileFuncs =
  (SetPosition
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  (Resize
  ()))))))))))

type instance Functions Tile = TileFuncs

data CPack parent
type Pack = CPack Group
type PackFuncs =
  (GetType_
  (SetType
  (SetSpacing
  (GetSpacing
  (IsHorizontal
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))

type instance Functions Pack = PackFuncs

MAKE_METHOD(SetSpacing,setSpacing)
MAKE_METHOD(GetSpacing,getSpacing)
MAKE_METHOD(IsHorizontal,isHorizontal)

data CScrolled parent
type Scrolled = CScrolled Group
type ScrolledFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))

type instance Functions Scrolled = ScrolledFuncs

MAKE_METHOD(ScrollTo,scrollTo)
MAKE_METHOD(Xposition,xposition)
MAKE_METHOD(Yposition,yposition)

data CTabs parent
type Tabs = CTabs Group
type TabsFuncs =
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  (GetValue
  (SetValue
  (GetPush
  (SetPush
  (Which
  (ClientArea ()))))))))))))))

type instance Functions Tabs = TabsFuncs

MAKE_METHOD(GetPush,getPush)
MAKE_METHOD(SetPush,setPush)
MAKE_METHOD(Which,which)
MAKE_METHOD(ClientArea,clientArea)

data CSpinner parent
type Spinner = CSpinner Group
type SpinnerFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))))))))))))))))


type instance Functions Spinner = SpinnerFuncs
MAKE_METHOD(GetFormat,getFormat)

data CColorChooser parent
type ColorChooser = CColorChooser Group
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))))))

type instance Functions ColorChooser = ColorChooserFuncs

MAKE_METHOD(GetHue, getHue)
MAKE_METHOD(GetSaturation, getSaturation)
MAKE_METHOD(GetR, getR)
MAKE_METHOD(GetG, getG)
MAKE_METHOD(GetB, getB)
MAKE_METHOD(SetHsv, setHsv)
MAKE_METHOD(SetRgb, setRgb)

data CFileBrowser parent
type FileBrowser = CFileBrowser Browser
type FileBrowserFuncs =
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
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ())))))))))))))))))
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

data CFileInput parent
type FileInput = CFileInput Input
type FileInputFuncs =
  (SetDownBox
  (GetDownBox
  (SetErrorColor
  (GetErrorColor
  (GetValue
  (SetValue
  (Draw
  (DrawSuper
  (Handle
  (HandleSuper
  (ShowWidget
  (ShowWidgetSuper
  (Hide
  (HideSuper
  ()))))))))))))))

type instance Functions FileInput = FileInputFuncs
MAKE_METHOD(SetErrorColor, setErrorColor)
MAKE_METHOD(GetErrorColor, getErrorColor)
