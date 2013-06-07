CXXSTATIC = g++ -Wall -DINTERNAL_LINKAGE -g -Icpp -static
CXX = g++ -Wall -DINTERNAL_LINKAGE -g -Icpp
CC = gcc -Wall -g -Isrc
LD = $(CXX) -shared
EXE_OBJS = examples/make_window.o examples/make_window_fullscreen.o examples/make_window_resize.o examples/make_window_with_width_height.o examples/make_window_hide.o examples/make_window_with_callback.o examples/make_button_with_callback.o examples/make_input.o examples/tree-simple.o examples/make_tree.o examples/table-simple.o
C_OBJS = src/Fl_C.o src/Fl_WindowC.o src/Fl_CallbackC.o src/Fl_ButtonC.o src/Fl_Check_ButtonC.o src/Fl_Radio_ButtonC.o src/Fl_Toggle_ButtonC.o src/Fl_Light_ButtonC.o src/Fl_Input_C.o src/Fl_InputC.o src/Fl_File_InputC.o src/Fl_Float_InputC.o src/Fl_Int_InputC.o src/Fl_Multiline_InputC.o src/Fl_Secret_InputC.o src/Fl_Value_InputC.o src/Fl_EnumerationsC.o src/Fl_Tree_PrefsC.o src/Fl_Tree_ItemC.o src/Fl_PreferencesC.o src/Fl_TreeC.o src/Fl_TableC.o src/Fl_DrawC.o src/Fl_Double_WindowC.o
TARGETS = libfltkc.a make_window make_window_with_width_height make_window_resize make_window_fullscreen make_window_hide make_window_with_callback make_button_with_callback make_input make_tree tree-simple table-simple
EXAMPLEDIR = ./examples
EXECUTABLEDIR = ./executables
LIBDIR = ./lib

all: $(TARGETS)

libfltkc.a : $(C_OBJS)
	ar rcs $(LIBDIR)/$@ $^

make_window_hide: examples/make_window_hide.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11

make_window_fullscreen: examples/make_window_fullscreen.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11

make_window: examples/make_window.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11

make_window_with_width_height: examples/make_window_with_width_height.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11

make_window_resize: examples/make_window_resize.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11
make_window_with_callback: examples/make_window_with_callback.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11

make_button_with_callback: examples/make_button_with_callback.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11
make_input: examples/make_input.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11
make_tree: examples/make_tree.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11
tree-simple: examples/tree-simple.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11
table-simple: examples/table-simple.o
	$(CXX) -o $(EXECUTABLEDIR)/$@ $< $(LIBDIR)/libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lGL -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11
clean:
	rm -f $(C_OBJS)
	rm -f $(EXE_OBJS)
	rm -f $(EXECUTABLEDIR)/*
	rm -f $(LIBDIR)/*

%.o: %.cpp
	$(CXXSTATIC) -c $^ -o $@ -lfltk -lfltk_images -lfltk_gl

%.o: %.c
	$(CC) -c $^ -o $@
