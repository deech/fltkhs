#include <Fl_C.h>
#include <Fl_WindowC.h>
#include <Fl_BoxC.h>
#include <Fl_ButtonC.h>
#include <fl_show_colormapC.h>
#include <Fl_Color_ChooserC.h>
#include <Fl_ImageC.h>
#include <Fl_DrawC.h>

#include <stdlib.h>
#include <stdio.h>
#if !defined(WIN32) && !defined(__APPLE__)
#include "list_visuals.cxx"
#endif

int width = 75;
int height = 75;
uchar *image;

