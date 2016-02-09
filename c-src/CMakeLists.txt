SET(SourceFiles
  Fl_Menu_ButtonC.cpp
  Fl_PositionerC.cpp
	Fl_TimerC.cpp
	Fl_Value_OutputC.cpp
	Fl_Value_SliderC.cpp
	Fl_ScrollbarC.cpp
	Fl_ScrollC.cpp
	Fl_RollerC.cpp
	Fl_DialC.cpp
	Fl_CounterC.cpp
	UtilsC.cpp
	xC.cpp
	fl_utf8C.cpp
	glC.cpp
	glutC.cpp
	DerivedText_Editor.cpp
	DerivedShared_Image.cpp
	filenameC.cpp
	Fl_AskC.cpp
	Fl_BitmapC.cpp
	Fl_BoxC.cpp
	Fl_BrowserC.cpp
	Fl_ButtonC.cpp
	Fl_CallbackC.cpp
	Fl_C.cpp
	Fl_Check_ButtonC.cpp
	Fl_ChoiceC.cpp
	Fl_ClockC.cpp
	Fl_Color_ChooserC.cpp
	Fl_Copy_SurfaceC.cpp
	Fl_Double_WindowC.cpp
	Fl_DrawC.cpp
	Fl_DeviceC.cpp
	Fl_EnumerationsC.cpp
	Fl_File_BrowserC.cpp
	Fl_File_IconC.cpp
	Fl_File_InputC.cpp
	Fl_File_ChooserC.cpp
	Fl_Float_InputC.cpp
	Fl_Gl_WindowC.cpp
	Fl_GroupC.cpp
	Fl_Hold_BrowserC.cpp
	Fl_Image_SurfaceC.cpp
	Fl_ImageC.cpp
	Fl_Input_C.cpp
	Fl_InputC.cpp
	Fl_Int_InputC.cpp
	Fl_Light_ButtonC.cpp
	Fl_Menu_C.cpp
	Fl_Menu_ItemC.cpp
	Fl_Multi_BrowserC.cpp
	Fl_Multiline_InputC.cpp
	Fl_Multiline_OutputC.cpp
	Fl_Native_File_ChooserC.cpp
	Fl_OutputC.cpp
	Fl_Overlay_WindowC.cpp
	Fl_Paged_DeviceC.cpp
	Fl_PixmapC.cpp
	Fl_PNM_ImageC.cpp
	Fl_PreferencesC.cpp
	Fl_PrinterC.cpp
	Fl_ProgressC.cpp
	Fl_Radio_ButtonC.cpp
	Fl_Radio_Light_ButtonC.cpp
	Fl_Repeat_ButtonC.cpp
	Fl_Return_ButtonC.cpp
	Fl_RGB_ImageC.cpp
	Fl_Round_ButtonC.cpp
	Fl_Round_ClockC.cpp
	Fl_Secret_InputC.cpp
	Fl_Select_BrowserC.cpp
  Fl_Shared_ImageC.cpp
	fl_show_colormapC.cpp
	Fl_Single_WindowC.cpp
	Fl_SliderC.cpp
	Fl_SpinnerC.cpp
	Fl_Sys_Menu_BarC.cpp
	Fl_TableC.cpp
	Fl_Table_RowC.cpp
	Fl_TabsC.cpp
	Fl_Text_BufferC.cpp
	Fl_Text_DisplayC.cpp
	Fl_Text_EditorC.cpp
	Fl_Text_SelectionC.cpp
	Fl_TileC.cpp
	Fl_PackC.cpp
	Fl_Toggle_ButtonC.cpp
	Fl_TooltipC.cpp
	Fl_TreeC.cpp
	Fl_Tree_ItemC.cpp
	Fl_Tree_PrefsC.cpp
	Fl_ValuatorC.cpp
	Fl_AdjusterC.cpp
	Fl_Value_InputC.cpp
	Fl_Value_SliderC.cpp
	Fl_WidgetC.cpp
	Fl_WindowC.cpp
	Fl_WizardC.cpp
  )

ADD_DEFINITIONS("${CXX_FLAGS} -DWIN32 -DUSE_OPENGL32 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -c -Wall -DINTERNAL_LINKAGE -g -Icpp -I\"${FLTK_HOME}/include\"")

MESSAGE(STATUS ${CXX_FLAGS})

# first build object library so that we can reuse same objects for both static and shared library
ADD_LIBRARY(fltkc_obj OBJECT ${SourceFiles})

ADD_LIBRARY(fltkc-dyn SHARED $<TARGET_OBJECTS:fltkc_obj>)

target_link_libraries(fltkc-dyn ${FLTKLINKFLAGS} -L${FLTK_HOME}/lib)

set_target_properties(fltkc-dyn PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../c-lib
                                       RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../c-lib)


ADD_LIBRARY(fltkc_static STATIC $<TARGET_OBJECTS:fltkc_obj>)
set_target_properties(fltkc_static PROPERTIES ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/../c-lib
                                              OUTPUT_NAME fltkc)


set_directory_properties(PROPERTIES
                         ADDITIONAL_MAKE_CLEAN_FILES "${CMAKE_CURRENT_SOURCE_DIR}/../c-lib;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/../static_object_files;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/cmake_install.cmake;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeCache.txt;
                                                      ${CMAKE_CURRENT_SOURCE_DIR}/CMakeFiles;")
