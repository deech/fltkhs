CXXSTATIC = g++ -DINTERNAL_LINKAGE -g -Icpp -static
CXX = g++ -DINTERNAL_LINKAGE -g -Icpp 
CC = gcc -g -Isrc
LD = $(CXX) -shared
EXE_OBJS = examples/make_window.o
C_OBJS = src/Fl_C.o src/Fl_WindowC.o
TARGETS = libfltkc.a make_window

all: $(TARGETS)

libfltkc.a : $(C_OBJS)
	ar rcs $@ $^

make_window: $(EXE_OBJS)
	$(CXX) -o $@ $< -I./ ./libfltkc.a -lfltk_images -lpng -lz -ljpeg -lfltk_gl -lGLU -lfltk -lXext -lXft -lfontconfig -lXinerama -lpthread -ldl -lm  -lX11

clean:
	rm -f $(C_OBJS)
	rm -f $(TARGETS)
	rm -f $(EXE_OBJS)

%.o: %.cpp
	$(CXXSTATIC) -c $^ -o $@ -lfltk

%.o: %.c
	$(CC) -c $^ -o $@ 
