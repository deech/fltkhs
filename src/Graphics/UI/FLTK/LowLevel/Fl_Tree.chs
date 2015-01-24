{# fun unsafe Fl_Tree_handle as handle' { id `Ptr ()',`Int' } -> `Int' #}
handle :: Tree a  -> Int ->  IO (Int)
handle tree e = withObject tree $ \treePtr -> handle' treePtr e
{# fun unsafe Fl_Tree_draw as draw' { id `Ptr ()' } -> `()' #}
draw :: Tree a  ->  IO ()
draw tree = withObject tree $ \treePtr -> draw' treePtr
{# fun unsafe Fl_Tree_show_self as showSelf' { id `Ptr ()' } -> `()' #}
showSelf :: Tree a  ->  IO ()
showSelf tree = withObject tree $ \treePtr -> showSelf' treePtr
{# fun unsafe Fl_Tree_root_label as rootLabel' { id `Ptr ()',`const char' } -> `()' #}
rootLabel :: Tree a  -> const char ->  IO ()
rootLabel tree *new_label = withObject tree $ \treePtr -> rootLabel' treePtr *new_label
{# fun unsafe Fl_Tree_root as root' { id `Ptr ()' } -> `Ptr ()' id #}
root :: Tree a  ->  IO (Ptr ())
root tree = withObject tree $ \treePtr -> root' treePtr
{# fun unsafe Fl_Tree_add as add' { id `Ptr ()',`const char' } -> `Ptr ()' id #}
add :: Tree a  -> const char ->  IO (Ptr ())
add tree *path = withObject tree $ \treePtr -> add' treePtr *path
{# fun unsafe Fl_Tree_add_with_item_name as addWithItemName' { id `Ptr ()',id `Ptr ()',`const char' } -> `Ptr ()' id #}
addWithItemName :: Tree a  -> TreeItem a  -> const char ->  IO (Ptr ())
addWithItemName tree item *name = withObject tree $ \treePtr -> withObject item $ \itemPtr -> addWithItemName' treePtr itemPtr *name
{# fun unsafe Fl_Tree_insert_above as insertAbove' { id `Ptr ()',id `Ptr ()',`const char' } -> `Ptr ()' id #}
insertAbove :: Tree a  -> TreeItem a  -> const char ->  IO (Ptr ())
insertAbove tree above *name = withObject tree $ \treePtr -> withObject above $ \abovePtr -> insertAbove' treePtr abovePtr *name
{# fun unsafe Fl_Tree_insert as insert' { id `Ptr ()',id `Ptr ()',`const char',`Int' } -> `Ptr ()' id #}
insert :: Tree a  -> TreeItem a  -> const char -> Int ->  IO (Ptr ())
insert tree item *name pos = withObject tree $ \treePtr -> withObject item $ \itemPtr -> insert' treePtr itemPtr *name pos
{# fun unsafe Fl_Tree_remove as remove' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
remove :: Tree a  -> TreeItem a  ->  IO (Int)
remove tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> remove' treePtr itemPtr
{# fun unsafe Fl_Tree_clear as clear' { id `Ptr ()' } -> `()' #}
clear :: Tree a  ->  IO ()
clear tree = withObject tree $ \treePtr -> clear' treePtr
{# fun unsafe Fl_Tree_clear_children as clearChildren' { id `Ptr ()',id `Ptr ()' } -> `()' #}
clearChildren :: Tree a  -> TreeItem a  ->  IO ()
clearChildren tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> clearChildren' treePtr itemPtr
{# fun unsafe Fl_Tree_find_item as findItem' { id `Ptr ()',`const char' } -> `Ptr ()' id #}
findItem :: Tree a  -> const char ->  IO (Ptr ())
findItem tree *path = withObject tree $ \treePtr -> findItem' treePtr *path
{# fun unsafe Fl_Tree_item_pathname as itemPathname' { id `Ptr ()',`char',`Int',`const fl_Tree_Item' } -> `Int' #}
itemPathname :: Tree a  -> char -> Int -> const fl_Tree_Item ->  IO (Int)
itemPathname tree *pathname pathnamelen item = withObject tree $ \treePtr -> itemPathname' treePtr *pathname pathnamelen item
{# fun unsafe Fl_Tree_item_clicked as itemClicked' { id `Ptr ()' } -> `Ptr ()' id #}
itemClicked :: Tree a  ->  IO (Ptr ())
itemClicked tree = withObject tree $ \treePtr -> itemClicked' treePtr
{# fun unsafe Fl_Tree_first as first' { id `Ptr ()' } -> `Ptr ()' id #}
first :: Tree a  ->  IO (Ptr ())
first tree = withObject tree $ \treePtr -> first' treePtr
{# fun unsafe Fl_Tree_first_visible as firstVisible' { id `Ptr ()' } -> `Ptr ()' id #}
firstVisible :: Tree a  ->  IO (Ptr ())
firstVisible tree = withObject tree $ \treePtr -> firstVisible' treePtr
{# fun unsafe Fl_Tree_next as next' { id `Ptr ()' } -> `Ptr ()' id #}
next :: Tree a  ->  IO (Ptr ())
next tree = withObject tree $ \treePtr -> next' treePtr
{# fun unsafe Fl_Tree_next_with_item as nextWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
nextWithItem :: Tree a  -> TreeItem a  ->  IO (Ptr ())
nextWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> nextWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_prev as prev' { id `Ptr ()' } -> `Ptr ()' id #}
prev :: Tree a  ->  IO (Ptr ())
prev tree = withObject tree $ \treePtr -> prev' treePtr
{# fun unsafe Fl_Tree_prev_with_item as prevWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
prevWithItem :: Tree a  -> TreeItem a  ->  IO (Ptr ())
prevWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> prevWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_last as last' { id `Ptr ()' } -> `Ptr ()' id #}
last :: Tree a  ->  IO (Ptr ())
last tree = withObject tree $ \treePtr -> last' treePtr
{# fun unsafe Fl_Tree_last_visible as lastVisible' { id `Ptr ()' } -> `Ptr ()' id #}
lastVisible :: Tree a  ->  IO (Ptr ())
lastVisible tree = withObject tree $ \treePtr -> lastVisible' treePtr
{# fun unsafe Fl_Tree_first_selected_item as firstSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
firstSelectedItem :: Tree a  ->  IO (Ptr ())
firstSelectedItem tree = withObject tree $ \treePtr -> firstSelectedItem' treePtr
{# fun unsafe Fl_Tree_next_selected_item as nextSelectedItem' { id `Ptr ()' } -> `Ptr ()' id #}
nextSelectedItem :: Tree a  ->  IO (Ptr ())
nextSelectedItem tree = withObject tree $ \treePtr -> nextSelectedItem' treePtr
{# fun unsafe Fl_Tree_next_selected_item_with_item as nextSelectedItemWithItem' { id `Ptr ()',id `Ptr ()' } -> `Ptr ()' id #}
nextSelectedItemWithItem :: Tree a  -> TreeItem a  ->  IO (Ptr ())
nextSelectedItemWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> nextSelectedItemWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_open_with_item as openWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
openWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
openWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> openWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_open_with_item_docallback as openWithItemDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
openWithItemDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
openWithItemDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> openWithItemDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_open_with_path as openWithPath' { id `Ptr ()',`const char' } -> `Int' #}
openWithPath :: Tree a  -> const char ->  IO (Int)
openWithPath tree *path = withObject tree $ \treePtr -> openWithPath' treePtr *path
{# fun unsafe Fl_Tree_open_with_path_docallback as openWithPathDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
openWithPathDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
openWithPathDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> openWithPathDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_open_toggle as openToggle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
openToggle :: Tree a  -> TreeItem a  ->  IO ()
openToggle tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> openToggle' treePtr itemPtr
{# fun unsafe Fl_Tree_open_toggle_with_docallback as openToggleWithDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
openToggleWithDocallback :: Tree a  -> TreeItem a  -> Int ->  IO ()
openToggleWithDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> openToggleWithDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_close_with_item as closeWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
closeWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
closeWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> closeWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_close_with_item_docallback as closeWithItemDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
closeWithItemDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
closeWithItemDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> closeWithItemDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_close_with_path as closeWithPath' { id `Ptr ()',`const char' } -> `Int' #}
closeWithPath :: Tree a  -> const char ->  IO (Int)
closeWithPath tree *path = withObject tree $ \treePtr -> closeWithPath' treePtr *path
{# fun unsafe Fl_Tree_close_with_path_docallback as closeWithPathDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
closeWithPathDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
closeWithPathDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> closeWithPathDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_is_open_with_item as isOpenWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
isOpenWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
isOpenWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> isOpenWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_is_open_with_path as isOpenWithPath' { id `Ptr ()',`const char' } -> `Int' #}
isOpenWithPath :: Tree a  -> const char ->  IO (Int)
isOpenWithPath tree *path = withObject tree $ \treePtr -> isOpenWithPath' treePtr *path
{# fun unsafe Fl_Tree_is_close_with_item as isCloseWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
isCloseWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
isCloseWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> isCloseWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_is_close_with_path as isCloseWithPath' { id `Ptr ()',`const char' } -> `Int' #}
isCloseWithPath :: Tree a  -> const char ->  IO (Int)
isCloseWithPath tree *path = withObject tree $ \treePtr -> isCloseWithPath' treePtr *path
{# fun unsafe Fl_Tree_select_with_item as selectWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
selectWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
selectWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_select_with_item_docallback as selectWithItemDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
selectWithItemDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
selectWithItemDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectWithItemDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_select_with_path as selectWithPath' { id `Ptr ()',`const char' } -> `Int' #}
selectWithPath :: Tree a  -> const char ->  IO (Int)
selectWithPath tree *path = withObject tree $ \treePtr -> selectWithPath' treePtr *path
{# fun unsafe Fl_Tree_select_with_path_docallback as selectWithPathDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
selectWithPathDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
selectWithPathDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectWithPathDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_select_toggle as selectToggle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
selectToggle :: Tree a  -> TreeItem a  ->  IO ()
selectToggle tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectToggle' treePtr itemPtr
{# fun unsafe Fl_Tree_select_toggle_with_docallback as selectToggleWithDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
selectToggleWithDocallback :: Tree a  -> TreeItem a  -> Int ->  IO ()
selectToggleWithDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectToggleWithDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_deselect_with_item as deselectWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
deselectWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
deselectWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> deselectWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_deselect_with_item_docallback as deselectWithItemDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
deselectWithItemDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
deselectWithItemDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> deselectWithItemDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_deselect_with_path as deselectWithPath' { id `Ptr ()',`const char' } -> `Int' #}
deselectWithPath :: Tree a  -> const char ->  IO (Int)
deselectWithPath tree *path = withObject tree $ \treePtr -> deselectWithPath' treePtr *path
{# fun unsafe Fl_Tree_deselect_with_path_docallback as deselectWithPathDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
deselectWithPathDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
deselectWithPathDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> deselectWithPathDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_deselect_all_with_item as deselectAllWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
deselectAllWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
deselectAllWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> deselectAllWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_deselect_all_with_docallback as deselectAllWithDocallback' { id `Ptr ()',`Int' } -> `Int' #}
deselectAllWithDocallback :: Tree a  -> Int ->  IO (Int)
deselectAllWithDocallback tree docallback = withObject tree $ \treePtr -> deselectAllWithDocallback' treePtr docallback
{# fun unsafe Fl_Tree_deselect_all_with_item_docallback as deselectAllWithItemDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `Int' #}
deselectAllWithItemDocallback :: Tree a  -> TreeItem a  -> Int ->  IO (Int)
deselectAllWithItemDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> deselectAllWithItemDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_select_only as selectOnly' { id `Ptr ()',id `Ptr ()' } -> `()' #}
selectOnly :: Tree a  -> TreeItem a  ->  IO ()
selectOnly tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectOnly' treePtr itemPtr
{# fun unsafe Fl_Tree_select_only_with_docallback as selectOnlyWithDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
selectOnlyWithDocallback :: Tree a  -> TreeItem a  -> Int ->  IO ()
selectOnlyWithDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectOnlyWithDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_select_all as selectAll' { id `Ptr ()',id `Ptr ()' } -> `()' #}
selectAll :: Tree a  -> TreeItem a  ->  IO ()
selectAll tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectAll' treePtr itemPtr
{# fun unsafe Fl_Tree_select_all_with_docallback as selectAllWithDocallback' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
selectAllWithDocallback :: Tree a  -> TreeItem a  -> Int ->  IO ()
selectAllWithDocallback tree item docallback = withObject tree $ \treePtr -> withObject item $ \itemPtr -> selectAllWithDocallback' treePtr itemPtr docallback
{# fun unsafe Fl_Tree_set_item_focus as setItemFocus' { id `Ptr ()',id `Ptr ()' } -> `()' #}
setItemFocus :: Tree a  -> TreeItem a  ->  IO ()
setItemFocus tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> setItemFocus' treePtr itemPtr
{# fun unsafe Fl_Tree_get_item_focus as getItemFocus' { id `Ptr ()' } -> `Ptr ()' id #}
getItemFocus :: Tree a  ->  IO (Ptr ())
getItemFocus tree = withObject tree $ \treePtr -> getItemFocus' treePtr
{# fun unsafe Fl_Tree_is_selected_with_item as isSelectedWithItem' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
isSelectedWithItem :: Tree a  -> TreeItem a  ->  IO (Int)
isSelectedWithItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> isSelectedWithItem' treePtr itemPtr
{# fun unsafe Fl_Tree_is_selected_with_path as isSelectedWithPath' { id `Ptr ()',`const char' } -> `Int' #}
isSelectedWithPath :: Tree a  -> const char ->  IO (Int)
isSelectedWithPath tree *path = withObject tree $ \treePtr -> isSelectedWithPath' treePtr *path
{# fun unsafe Fl_Tree_item_labelfont as itemLabelfont' { id `Ptr ()' } -> `Font' cToFont #}
itemLabelfont :: Tree a  ->  IO (Font)
itemLabelfont tree = withObject tree $ \treePtr -> itemLabelfont' treePtr
{# fun unsafe Fl_Tree_item_set_labelfont as itemSetLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
itemSetLabelfont :: Tree a  -> Font ->  IO ()
itemSetLabelfont tree val = withObject tree $ \treePtr -> itemSetLabelfont' treePtr val
{# fun unsafe Fl_Tree_item_labelsize as itemLabelsize' { id `Ptr ()' } -> `Fontsize' cToFontsize #}
itemLabelsize :: Tree a  ->  IO (Fontsize)
itemLabelsize tree = withObject tree $ \treePtr -> itemLabelsize' treePtr
{# fun unsafe Fl_Tree_item_set_labelsize as itemSetLabelsize' { id `Ptr ()',cFromFontsize `Fontsize' } -> `()' #}
itemSetLabelsize :: Tree a  -> Fontsize ->  IO ()
itemSetLabelsize tree val = withObject tree $ \treePtr -> itemSetLabelsize' treePtr val
{# fun unsafe Fl_Tree_item_labelfgcolor as itemLabelfgcolor' { id `Ptr ()' } -> `Color' cToColor #}
itemLabelfgcolor :: Tree a  ->  IO (Color)
itemLabelfgcolor tree = withObject tree $ \treePtr -> itemLabelfgcolor' treePtr
{# fun unsafe Fl_Tree_set_item_labelfgcolor as setItemLabelfgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
setItemLabelfgcolor :: Tree a  -> Color ->  IO ()
setItemLabelfgcolor tree val = withObject tree $ \treePtr -> setItemLabelfgcolor' treePtr val
{# fun unsafe Fl_Tree_item_labelbgcolor as itemLabelbgcolor' { id `Ptr ()' } -> `Color' cToColor #}
itemLabelbgcolor :: Tree a  ->  IO (Color)
itemLabelbgcolor tree = withObject tree $ \treePtr -> itemLabelbgcolor' treePtr
{# fun unsafe Fl_Tree_set_item_labelbgcolor as setItemLabelbgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
setItemLabelbgcolor :: Tree a  -> Color ->  IO ()
setItemLabelbgcolor tree val = withObject tree $ \treePtr -> setItemLabelbgcolor' treePtr val
{# fun unsafe Fl_Tree_connectorcolor as connectorcolor' { id `Ptr ()' } -> `Color' cToColor #}
connectorcolor :: Tree a  ->  IO (Color)
connectorcolor tree = withObject tree $ \treePtr -> connectorcolor' treePtr
{# fun unsafe Fl_Tree_set_connectorcolor as setConnectorcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
setConnectorcolor :: Tree a  -> Color ->  IO ()
setConnectorcolor tree val = withObject tree $ \treePtr -> setConnectorcolor' treePtr val
{# fun unsafe Fl_Tree_marginleft as marginleft' { id `Ptr ()' } -> `Int' #}
marginleft :: Tree a  ->  IO (Int)
marginleft tree = withObject tree $ \treePtr -> marginleft' treePtr
{# fun unsafe Fl_Tree_set_marginleft as setMarginleft' { id `Ptr ()',`Int' } -> `()' #}
setMarginleft :: Tree a  -> Int ->  IO ()
setMarginleft tree val = withObject tree $ \treePtr -> setMarginleft' treePtr val
{# fun unsafe Fl_Tree_margintop as margintop' { id `Ptr ()' } -> `Int' #}
margintop :: Tree a  ->  IO (Int)
margintop tree = withObject tree $ \treePtr -> margintop' treePtr
{# fun unsafe Fl_Tree_set_margintop as setMargintop' { id `Ptr ()',`Int' } -> `()' #}
setMargintop :: Tree a  -> Int ->  IO ()
setMargintop tree val = withObject tree $ \treePtr -> setMargintop' treePtr val
{# fun unsafe Fl_Tree_linespacing as linespacing' { id `Ptr ()' } -> `Int' #}
linespacing :: Tree a  ->  IO (Int)
linespacing tree = withObject tree $ \treePtr -> linespacing' treePtr
{# fun unsafe Fl_Tree_set_linespacing as setLinespacing' { id `Ptr ()',`Int' } -> `()' #}
setLinespacing :: Tree a  -> Int ->  IO ()
setLinespacing tree val = withObject tree $ \treePtr -> setLinespacing' treePtr val
{# fun unsafe Fl_Tree_openchild_marginbottom as openchildMarginbottom' { id `Ptr ()' } -> `Int' #}
openchildMarginbottom :: Tree a  ->  IO (Int)
openchildMarginbottom tree = withObject tree $ \treePtr -> openchildMarginbottom' treePtr
{# fun unsafe Fl_Tree_set_openchild_marginbottom as setOpenchildMarginbottom' { id `Ptr ()',`Int' } -> `()' #}
setOpenchildMarginbottom :: Tree a  -> Int ->  IO ()
setOpenchildMarginbottom tree val = withObject tree $ \treePtr -> setOpenchildMarginbottom' treePtr val
{# fun unsafe Fl_Tree_usericonmarginleft as usericonmarginleft' { id `Ptr ()' } -> `Int' #}
usericonmarginleft :: Tree a  ->  IO (Int)
usericonmarginleft tree = withObject tree $ \treePtr -> usericonmarginleft' treePtr
{# fun unsafe Fl_Tree_set_usericonmarginleft as setUsericonmarginleft' { id `Ptr ()',`Int' } -> `()' #}
setUsericonmarginleft :: Tree a  -> Int ->  IO ()
setUsericonmarginleft tree val = withObject tree $ \treePtr -> setUsericonmarginleft' treePtr val
{# fun unsafe Fl_Tree_labelmarginleft as labelmarginleft' { id `Ptr ()' } -> `Int' #}
labelmarginleft :: Tree a  ->  IO (Int)
labelmarginleft tree = withObject tree $ \treePtr -> labelmarginleft' treePtr
{# fun unsafe Fl_Tree_set_labelmarginleft as setLabelmarginleft' { id `Ptr ()',`Int' } -> `()' #}
setLabelmarginleft :: Tree a  -> Int ->  IO ()
setLabelmarginleft tree val = withObject tree $ \treePtr -> setLabelmarginleft' treePtr val
{# fun unsafe Fl_Tree_connectorwidth as connectorwidth' { id `Ptr ()' } -> `Int' #}
connectorwidth :: Tree a  ->  IO (Int)
connectorwidth tree = withObject tree $ \treePtr -> connectorwidth' treePtr
{# fun unsafe Fl_Tree_set_connectorwidth as setConnectorwidth' { id `Ptr ()',`Int' } -> `()' #}
setConnectorwidth :: Tree a  -> Int ->  IO ()
setConnectorwidth tree val = withObject tree $ \treePtr -> setConnectorwidth' treePtr val
{# fun unsafe Fl_Tree_usericon as usericon' { id `Ptr ()' } -> `Ptr ()' id #}
usericon :: Tree a  ->  IO (Ptr ())
usericon tree = withObject tree $ \treePtr -> usericon' treePtr
{# fun unsafe Fl_Tree_set_usericon as setUsericon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
setUsericon :: Tree a  -> Image a  ->  IO ()
setUsericon tree val = withObject tree $ \treePtr -> withObject val $ \valPtr -> setUsericon' treePtr valPtr
{# fun unsafe Fl_Tree_openicon as openicon' { id `Ptr ()' } -> `Ptr ()' id #}
openicon :: Tree a  ->  IO (Ptr ())
openicon tree = withObject tree $ \treePtr -> openicon' treePtr
{# fun unsafe Fl_Tree_set_openicon as setOpenicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
setOpenicon :: Tree a  -> Image a  ->  IO ()
setOpenicon tree val = withObject tree $ \treePtr -> withObject val $ \valPtr -> setOpenicon' treePtr valPtr
{# fun unsafe Fl_Tree_closeicon as closeicon' { id `Ptr ()' } -> `Ptr ()' id #}
closeicon :: Tree a  ->  IO (Ptr ())
closeicon tree = withObject tree $ \treePtr -> closeicon' treePtr
{# fun unsafe Fl_Tree_set_closeicon as setCloseicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
setCloseicon :: Tree a  -> Image a  ->  IO ()
setCloseicon tree val = withObject tree $ \treePtr -> withObject val $ \valPtr -> setCloseicon' treePtr valPtr
{# fun unsafe Fl_Tree_showcollapse as showcollapse' { id `Ptr ()' } -> `Int' #}
showcollapse :: Tree a  ->  IO (Int)
showcollapse tree = withObject tree $ \treePtr -> showcollapse' treePtr
{# fun unsafe Fl_Tree_set_showcollapse as setShowcollapse' { id `Ptr ()',`Int' } -> `()' #}
setShowcollapse :: Tree a  -> Int ->  IO ()
setShowcollapse tree val = withObject tree $ \treePtr -> setShowcollapse' treePtr val
{# fun unsafe Fl_Tree_showroot as showroot' { id `Ptr ()' } -> `Int' #}
showroot :: Tree a  ->  IO (Int)
showroot tree = withObject tree $ \treePtr -> showroot' treePtr
{# fun unsafe Fl_Tree_set_showroot as setShowroot' { id `Ptr ()',`Int' } -> `()' #}
setShowroot :: Tree a  -> Int ->  IO ()
setShowroot tree val = withObject tree $ \treePtr -> setShowroot' treePtr val
{# fun unsafe Fl_Tree_connectorstyle as connectorstyle' { id `Ptr ()' } -> `Fl_Tree_Connector' #}
connectorstyle :: Tree a  ->  IO (Fl_Tree_Connector)
connectorstyle tree = withObject tree $ \treePtr -> connectorstyle' treePtr
{# fun unsafe Fl_Tree_set_connectorstyle as setConnectorstyle' { id `Ptr ()',`Fl_Tree_Connector' } -> `()' #}
setConnectorstyle :: Tree a  -> Fl_Tree_Connector ->  IO ()
setConnectorstyle tree val = withObject tree $ \treePtr -> setConnectorstyle' treePtr val
{# fun unsafe Fl_Tree_sortorder as sortorder' { id `Ptr ()' } -> `Fl_Tree_Sort' #}
sortorder :: Tree a  ->  IO (Fl_Tree_Sort)
sortorder tree = withObject tree $ \treePtr -> sortorder' treePtr
{# fun unsafe Fl_Tree_set_sortorder as setSortorder' { id `Ptr ()',`Fl_Tree_Sort' } -> `()' #}
setSortorder :: Tree a  -> Fl_Tree_Sort ->  IO ()
setSortorder tree val = withObject tree $ \treePtr -> setSortorder' treePtr val
{# fun unsafe Fl_Tree_selectbox as selectbox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
selectbox :: Tree a  ->  IO (Boxtype)
selectbox tree = withObject tree $ \treePtr -> selectbox' treePtr
{# fun unsafe Fl_Tree_set_selectbox as setSelectbox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
setSelectbox :: Tree a  -> Boxtype ->  IO ()
setSelectbox tree val = withObject tree $ \treePtr -> setSelectbox' treePtr val
{# fun unsafe Fl_Tree_selectmode as selectmode' { id `Ptr ()' } -> `Fl_Tree_Select' #}
selectmode :: Tree a  ->  IO (Fl_Tree_Select)
selectmode tree = withObject tree $ \treePtr -> selectmode' treePtr
{# fun unsafe Fl_Tree_set_selectmode as setSelectmode' { id `Ptr ()',`Fl_Tree_Select' } -> `()' #}
setSelectmode :: Tree a  -> Fl_Tree_Select ->  IO ()
setSelectmode tree val = withObject tree $ \treePtr -> setSelectmode' treePtr val
{# fun unsafe Fl_Tree_displayed as displayed' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
displayed :: Tree a  -> TreeItem a  ->  IO (Int)
displayed tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> displayed' treePtr itemPtr
{# fun unsafe Fl_Tree_show_item_with_yoff as showItemWithYoff' { id `Ptr ()',id `Ptr ()',`Int' } -> `()' #}
showItemWithYoff :: Tree a  -> TreeItem a  -> Int ->  IO ()
showItemWithYoff tree item yoff = withObject tree $ \treePtr -> withObject item $ \itemPtr -> showItemWithYoff' treePtr itemPtr yoff
{# fun unsafe Fl_Tree_show_item as showItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
showItem :: Tree a  -> TreeItem a  ->  IO ()
showItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> showItem' treePtr itemPtr
{# fun unsafe Fl_Tree_show_item_top as showItemTop' { id `Ptr ()',id `Ptr ()' } -> `()' #}
showItemTop :: Tree a  -> TreeItem a  ->  IO ()
showItemTop tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> showItemTop' treePtr itemPtr
{# fun unsafe Fl_Tree_show_item_middle as showItemMiddle' { id `Ptr ()',id `Ptr ()' } -> `()' #}
showItemMiddle :: Tree a  -> TreeItem a  ->  IO ()
showItemMiddle tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> showItemMiddle' treePtr itemPtr
{# fun unsafe Fl_Tree_show_item_bottom as showItemBottom' { id `Ptr ()',id `Ptr ()' } -> `()' #}
showItemBottom :: Tree a  -> TreeItem a  ->  IO ()
showItemBottom tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> showItemBottom' treePtr itemPtr
{# fun unsafe Fl_Tree_display as display' { id `Ptr ()',id `Ptr ()' } -> `()' #}
display :: Tree a  -> TreeItem a  ->  IO ()
display tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> display' treePtr itemPtr
{# fun unsafe Fl_Tree_vposition as vposition' { id `Ptr ()' } -> `Int' #}
vposition :: Tree a  ->  IO (Int)
vposition tree = withObject tree $ \treePtr -> vposition' treePtr
{# fun unsafe Fl_Tree_set_vposition as setVposition' { id `Ptr ()',`Int' } -> `()' #}
setVposition :: Tree a  -> Int ->  IO ()
setVposition tree pos = withObject tree $ \treePtr -> setVposition' treePtr pos
{# fun unsafe Fl_Tree_is_scrollbar as isScrollbar' { id `Ptr ()',id `Ptr ()' } -> `Int' #}
isScrollbar :: Tree a  -> Widget a  ->  IO (Int)
isScrollbar tree w = withObject tree $ \treePtr -> withObject w $ \wPtr -> isScrollbar' treePtr wPtr
{# fun unsafe Fl_Tree_scrollbar_size as scrollbarSize' { id `Ptr ()' } -> `Int' #}
scrollbarSize :: Tree a  ->  IO (Int)
scrollbarSize tree = withObject tree $ \treePtr -> scrollbarSize' treePtr
{# fun unsafe Fl_Tree_set_scrollbar_size as setScrollbarSize' { id `Ptr ()',`Int' } -> `()' #}
setScrollbarSize :: Tree a  -> Int ->  IO ()
setScrollbarSize tree size = withObject tree $ \treePtr -> setScrollbarSize' treePtr size
{# fun unsafe Fl_Tree_is_vscroll_visible as isVscrollVisible' { id `Ptr ()' } -> `Int' #}
isVscrollVisible :: Tree a  ->  IO (Int)
isVscrollVisible tree = withObject tree $ \treePtr -> isVscrollVisible' treePtr
{# fun unsafe Fl_Tree_set_callback_item as setCallbackItem' { id `Ptr ()',id `Ptr ()' } -> `()' #}
setCallbackItem :: Tree a  -> TreeItem a  ->  IO ()
setCallbackItem tree item = withObject tree $ \treePtr -> withObject item $ \itemPtr -> setCallbackItem' treePtr itemPtr
{# fun unsafe Fl_Tree_callback_item as callbackItem' { id `Ptr ()' } -> `Ptr ()' id #}
callbackItem :: Tree a  ->  IO (Ptr ())
callbackItem tree = withObject tree $ \treePtr -> callbackItem' treePtr
{# fun unsafe Fl_Tree_set_callback_reason as setCallbackReason' { id `Ptr ()',`Fl_Tree_Reason' } -> `()' #}
setCallbackReason :: Tree a  -> Fl_Tree_Reason ->  IO ()
setCallbackReason tree reason = withObject tree $ \treePtr -> setCallbackReason' treePtr reason
{# fun unsafe Fl_Tree_callback_reason as callbackReason' { id `Ptr ()' } -> `Fl_Tree_Reason' #}
callbackReason :: Tree a  ->  IO (Fl_Tree_Reason)
callbackReason tree = withObject tree $ \treePtr -> callbackReason' treePtr
{# fun unsafe Fl_Tree_load as load' { id `Ptr ()',`fl_Preferences' } -> `()' #}
load :: Tree a  -> fl_Preferences ->  IO ()
load tree preferences = withObject tree $ \treePtr -> load' treePtr preferences
