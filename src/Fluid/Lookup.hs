module Lookup
 (
  boxType,
  labelType,
  alignmentType,
  sliderType,
  whenType,
  inputType,
  outputType,
  packType,
  buttonType,
  browserType,
  menuItemType,
  menuButtonType,
  dialType,
  valuatorType,
  scrollbarType,
  counterType,
  scrollType,
  windowType,
  fontType,
  spinnerType,
  flClasses,
  imageExtensions
 )
where

boxType :: [(String, String)]
labelType :: [(String, String)]
alignmentType :: [(String, String)]
sliderType :: [(String, String)]
whenType :: [String]
inputType :: [(String, String)]
outputType :: [(String, String)]
packType :: [(String, String)]
buttonType :: [(String, String)]
browserType :: [(String, String)]
menuItemType :: [(String, String)]
menuButtonType :: [(String, String)]
dialType :: [(String, String)]
valuatorType :: [(String, String)]
scrollbarType :: [(String, String)]
counterType :: [(String, String)]
scrollType :: [(String, String)]
windowType :: [(String, String)]
fontType :: [(String, String)]
spinnerType :: [(String, String)]
flClasses :: [(String, (String, String))]
imageExtensions :: [(String, String)]

boxType = [
  ("NO_BOX"                 ,"NoBox"),
  ("FLAT_BOX"               ,"FlatBox"),
  ("UP_BOX"                 ,"UpBox"),
  ("DOWN_BOX"               ,"DownBox"),
  ("UP_FRAME"               ,"UpFrame"),
  ("DOWN_FRAME"             ,"DownFrame"),
  ("THIN_UP_BOX"            ,"ThinUpBox"),
  ("THIN_DOWN_BOX"          ,"ThinDownBox"),
  ("THIN_UP_FRAME"          ,"ThinUpFrame"),
  ("THIN_DOWN_FRAME"        ,"ThinDownFrame"),
  ("ENGRAVED_BOX"           ,"EngravedBox"),
  ("EMBOSSED_BOX"           ,"EmbossedBox"),
  ("ENGRAVED_FRAME"         ,"EngravedFrame"),
  ("EMBOSSED_FRAME"         ,"EmbossedFrame"),
  ("BORDER_BOX"             ,"BorderBox"),
  ("SHADOW_BOX"             ,"ShadowBox"),
  ("BORDER_FRAME"           ,"BorderFrame"),
  ("SHADOW_FRAME"           ,"ShadowFrame"),
  ("ROUNDED_BOX"            ,"RoundedBox"),
  ("RSHADOW_BOX"            ,"RshadowBox"),
  ("ROUNDED_FRAME"          ,"RoundedFrame"),
  ("RFLAT_BOX"              ,"RFlatBox"),
  ("ROUND_UP_BOX"           ,"RoundUpBox"),
  ("ROUND_DOWN_BOX"         ,"RoundDownBox"),
  ("DIAMOND_UP_BOX"         ,"DiamondUpBox"),
  ("DIAMOND_DOWN_BOX"       ,"DiamondDownBox"),
  ("OVAL_BOX"               ,"OvalBox"),
  ("OSHADOW_BOX"            ,"OshadowBox"),
  ("OVAL_FRAME"             ,"OvalFrame"),
  ("OFLAT_BOX"              ,"FloatBox"),
  ("PLASTIC_UP_BOX"         ,"PlasticUpBox"),
  ("PLASTIC_DOWN_BOX"       ,"PlasticDownBox"),
  ("PLASTIC_UP_FRAME"       ,"PlasticUpFrame"),
  ("PLASTIC_DOWN_FRAME"     ,"PlasticDownFrame"),
  ("PLASTIC_THIN_UP_BOX"    ,"PlasticThinUpBox"),
  ("PLASTIC_THIN_DOWN_BOX"  ,"PlasticThinDownBox"),
  ("PLASTIC_ROUND_UP_BOX"   ,"PlasticRoundUpBox"),
  ("PLASTIC_ROUND_DOWN_BOX" ,"PlasticRoundDownBox"),
  ("GTK_UP_BOX"             ,"GtkUpBox"),
  ("GTK_DOWN_BOX"           ,"GtkDownBox"),
  ("GTK_UP_FRAME"           ,"GtkUpFrame"),
  ("GTK_DOWN_FRAME"         ,"GtkDownFrame"),
  ("GTK_THIN_UP_BOX"        ,"GtkThinUpBox"),
  ("GTK_THIN_DOWN_BOX"      ,"GtkThinDownBox"),
  ("GTK_THIN_UP_FRAME"      ,"GtkThinUpFrame"),
  ("GTK_THIN_DOWN_FRAME"    ,"GtkThinDownFrame"),
  ("GTK_ROUND_UP_BOX"       ,"GtkRoundUpBox"),
  ("GTK_ROUND_DOWN_BOX"     ,"GtkRoundDownBox"),
  ("GLEAM_UP_BOX"           ,"GleamUpBox"),
  ("GLEAM_DOWN_BO"          ,"GleamDownBox"),
  ("GLEAM_UP_FRAME"         ,"GleamUpFrame"),
  ("GLEAM_DOWN_FRAME"       ,"GleamDownFrame"),
  ("GLEAM_THIN_UP_BOX"      ,"GleamThinUpBox"),
  ("GLEAM_THIN_DOWN_BOX"    ,"GleamThinDownBox"),
  ("GLEAM_ROUND_UP_BOX"     ,"GleamRoundUpBox"),
  ("GLEAM_ROUND_DOWN_BOX"   ,"GleamRoundDownBox"),
  ("FREE_BOXTYPE"           ,"FreeBoxtype")
 ]

labelType = [
  ("NORMAL_LABEL"   ,"NormalLabel"),
  ("SHADOW_LABEL"   ,"ShadowLabel"),
  ("ENGRAVED_LABEL" ,"EngravedLabel"),
  ("EMBOSSED_LABEL" ,"EmbossedLabel"),
  ("NO_LABEL"       ,"NoLabel")
  ]
alignmentType = [
  ("FL_ALIGN_CENTER"          ,"alignCenter"),
  ("FL_ALIGN_TOP"             ,"alignTop"),
  ("FL_ALIGN_BOTTOM"          ,"alignBottom"),
  ("FL_ALIGN_LEFT"            ,"alignLeft"),
  ("FL_ALIGN_RIGHT"           ,"alignRight"),
  ("FL_ALIGN_INSIDE"          ,"alignInside"),
  ("FL_ALIGN_CLIP"            ,"alignClip"),
  ("FL_ALIGN_WRAP"            ,"alignWrap"),
  ("FL_ALIGN_TEXT_OVER_IMAGE" ,"alignTextOverImage"),
  ("FL_ALIGN_TOP_LEFT"        ,"alignTopLeft"),
  ("FL_ALIGN_TOP_RIGHT"       ,"alignTopRight"),
  ("FL_ALIGN_BOTTOM_LEFT"     ,"alignBottomLeft"),
  ("FL_ALIGN_BOTTOM_RIGHT"    ,"alignBottomRight"),
  ("FL_ALIGN_LEFT_TOP"        ,"alignLeftTop"),
  ("FL_ALIGN_RIGHT_TOP"       ,"alignRightTop"),
  ("FL_ALIGN_LEFT_BOTTOM"     ,"alignLeftBottom"),
  ("FL_ALIGN_RIGHT_BOTTOM"    ,"alignRightBottom")
 ]

sliderType = [
  ("Vertical"   ,"VertSliderType"),
  ("Horizontal" ,"HorSliderType"),
  ("Vert Fill"  ,"VertFillSliderType"),
  ("Horz Fill"  ,"HorFillSliderType"),
  ("Vert Knob"  ,"VertNiceSliderType"),
  ("Horz Knob"  ,"HorNiceSliderType")
 ]

whenType = [
  "WhenNever"
  ,"WhenChanged"
  ,"WhenNotChanged"
  ,"WhenRelease"
  ,"WhenReleaseAlways"
  ,"WhenEnterKey"
  ,"WhenEnterKeyAlways"
  ,"WhenEnterKeyChanged"
 ]
inputType = [
  ("Normal", "FlNormalInput"),
  ("Multiline", "FlMultilineInput"),
  ("Secret","FlSecretInput"),
  ("Int","FlIntInput"),
  ("Float", "FlFloatInput")
  ]

outputType = [
  ("Normal", "FlNormalOutput"),
  ("Multiline", "FlMultilineOutput")
  ]

packType = [
  ("HORIZONTAL", "PackHorizontal"),
  ("VERTICAL", "PackVertical")
  ]

buttonType = [
  ("Normal","NormalButtonType"),
  ("Toggle","ToggleButtonType"),
  ("Radio","RadioButtonType")
  ]

browserType = [
  ("No Select","NormalBrowserType"),
  ("Select","SelectBrowserType"),
  ("Hold","HoldBrowserType"),
  ("Multi","MultiBrowserType")
  ]

menuItemType = [
  ("Normal","MenuItemNormal"),
  ("Toggle","MenuItemToggle"),
  ("Radio","MenuItemRadio")
  ]

menuButtonType = [
  ("normal","NormalMenuButton"),
  ("popup1","Popup1MenuButton"),
  ("popup2","Popup2MenuButton"),
  ("popup3","Popup3MenuButton"),
  ("popup12","Popup12MenuButton"),
  ("popup23","Popup23MenuButton"),
  ("popup13","Popup13MenuButton"),
  ("popup123","Popup123MenuButton")
  ]

dialType = [
  ("Dot", "NormalDialType"),
  ("Line","LineDialType"),
  ("Fill","FillDialType")
  ]

valuatorType = [
 ("Vertical", "VerticalValuatorType"),
 ("Horizontal", "HorizontalValuatorType")
 ]

scrollbarType = [
 ("Vertical","VertScrollbar"),
 ("Horizontal","HorScrollbar")
 ]

counterType = [
 ("Normal","NormalCounterType"),
 ("Simple","SimpleCounterType")
 ]

scrollType =
  [("BOTH","BothScrollBar")
  ,("HORIZONTAL","HorizontalScrollBar")
  ,("VERTICAL","VerticalScrollBar")
  ,("HORIZONTAL_ALWAYS","HorizontalAlwaysScrollBar")
  ,("VERTICAL_ALWAYS","VerticalAlwaysScrollBar")
  ,("BOTH_ALWAYS","BothAlwaysScrollBar")]

windowType =
  [("Single","SingleWindowType"),("Double","DoubleWindowType")]

fontType =
  [("0","helvetica")
  ,("1","helveticaBold")
  ,("2","helveticaItalic")
  ,("3","helveticaBoldItalic")
  ,("4","courier")
  ,("5","courierBold")
  ,("6","courierItalic")
  ,("7","courierBoldItalic")
  ,("8","times")
  ,("9","timesBold")
  ,("10","timesItalic")
  ,("11","timesBoldItalic")
  ,("12","symbol")
  ,("13","screen")
  ,("14","screenbold")
  ,("15","zapfDingbats")]

spinnerType = [
  ("Integer","IntSpinnerType"),
  ("Float", "FloatSpinnerType")
 ]

flClasses =
  [("Fl_Slider",("Slider", "sliderNew"))
  ,("Fl_Value_Slider",("ValueSlider", "valueSliderNew"))
  ,("Fl_Roller",("Roller", "rollerNew"))
  ,("Fl_Box",("Box", "boxNew"))
  ,("Fl_Scrollbar",("Scrollbar", "scrollbarNew"))
  ,("Fl_Adjuster",("Adjuster", "adjusterNew"))
  ,("Fl_Counter",("Counter", "counterNew"))
  ,("Fl_Roller",("Roller", "rollerNew"))
  ,("Fl_Value_Input",("ValueInput", "valueInputNew"))
  ,("Fl_Value_Output",("ValueOutput", "valueOutputNew"))
  ,("Fl_Spinner",("Spinner", "spinnerNew"))
  ,("Fl_Dial",("Dial", "dialNew"))
  ,("Fl_Button",("Button", "buttonNew"))
  ,("Fl_Output",("Output", "outputNew"))
  ,("MenuItem",("MenuItem", "menuItemNew"))
  ,("Submenu",("MenuItem", "menuItemNew"))
  ,("Fl_Input",("Input", "inputNew"))
  ,("Fl_Clock",("Clock", "clockNew"))
  ,("Fl_Return_Button",("ReturnButton", "returnButtonNew"))
  ,("Fl_Light_Button",("LightButton", "lightButtonNew"))
  ,("Fl_Check_Button",("CheckButton", "checkButtonNew"))
  ,("Fl_Repeat_Button",("RepeatButton", "repeatButtonNew"))
  ,("Fl_Round_Button",("RoundButton", "roundButtonNew"))
  ,("Fl_Window",("Window", "windowNew"))
  ,("Fl_Group",("Group", "groupNew"))
  ,("Fl_Tree",("Tree", "treeNew"))
  ,("Fl_Wizard",("Wizard", "wizardNew"))
  ,("Fl_Pack",("Pack", "packNew"))
  ,("Fl_Table",("Table", "tableNew"))
  ,("Fl_Scroll",("Scroll", "scrollNew"))
  ,("Fl_Menu_Bar",("MenuBar", "sysMenuBarNew"))
  ,("Fl_Menu_Button",("MenuButton", "menuButtonNew"))
  ,("Fl_Choice",("Choice", "choiceNew"))
  ,("Fl_Browser",("Browser", "browserNew" ))
  ,("Fl_Tabs",("Tabs", "tabsNew"))
  ,("Fl_Progress", ("Progress", "progressNew"))
  ,("Fl_File_Input", ("FileInput", "fileInputNew"))
  ,("Fl_Text_Display", ("TextDisplay", "textDisplayNew"))
  ,("Fl_Text_Editor", ("TextEditor", "textEditorNew"))
  ,("Fl_Tile", ("Tile", "tileNew"))
  ,("Fl_File_Browser", ("FileBrowser", "fileBrowserNew"))
  ]

imageExtensions =
  [(".bm", "bmpImageNew")
   ,(".bmp", "bmpImageNew")
   ,(".gif", "gifImageNew")
   ,(".jpg", "jpegImageNew")
   ,(".pbm", "pnmImageNew")
   ,(".pgm", "pnmImageNew")
   ,(".png", "pngImageNew")
   ,(".ppm", "pnmImageNew")
   ,(".xbm", "xbmImageNew")
   ,(".xpm", "xpmImageNew")
  ]
