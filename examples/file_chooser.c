#include <stdio.h>
#include <Fl_C.h>
#include <Fl_ChoiceC.h>
#include <Fl_File_ChooserC.h>
#include <Fl_File_BrowserC.h>
#include <Fl_File_IconC.h>
#include <Fl_Shared_ImageC.h>
#include <Fl_PNM_ImageC.h>
#include <Fl_Light_ButtonC.h>
#include <Fl_Double_WindowC.h>
#include <Fl_Light_ButtonC.h>
#include <Fl_Check_ButtonC.h>
#include <Fl_ButtonC.h>
#include <Fl_GroupC.h>
#include <Fl_InputC.h>
#include <filenameC.h>
#include <string.h>
#include "FL/filename.H"
#include "FL/fl_utf8.h"
#include <stdlib.h>

fl_Input	filter;
fl_File_Browser	files;
fl_File_Chooser	fc;
fl_Shared_Image	image;

fl_Choice ch_extra;
fl_Group encodings;
fl_Choice ch_enc;
fl_Check_Button version;

void extra_callback(fl_Choice w,void* v)
{
  int val=Fl_Choice_value(w);
  if (0 == val) Fl_File_Chooser_add_extra(fc,NULL);
  else if (1 == val) {
    if(!encodings){
      encodings=Fl_Group_New(0,0,254,30);
      ch_enc=Fl_Choice_New_WithLabel(152,2,100,25,"Choose Encoding:");
      Fl_Choice_add_with_name(ch_enc,"ASCII|Koi8-r|win1251|Utf-8");
      Fl_Group_end(encodings);
    }
    Fl_File_Chooser_add_extra(fc,encodings);
  } else {
    if (!version) {
      version = Fl_Check_Button_New_WithLabel(5,0,200,25,"Save binary 1.0 version");
    }
    Fl_File_Chooser_add_extra(fc,version);
  }
}
void close_callback(fl_Widget w, void* user_data)
{
  exit(0);
}

void create_callback(fl_Widget w, void* user_data)
{
  Fl_File_Chooser_set_type(fc, Fl_File_Chooser_type(fc) ^ FL_FILE_CHOOSER_CREATE);
}
void
dir_callback(fl_Widget w, void* user_data)
{
  puts("dir_callback");
  Fl_File_Chooser_set_type(fc, Fl_File_Chooser_type(fc) ^ FL_FILE_CHOOSER_DIRECTORY);
}
void
fc_callback(fl_File_Chooser fc,
            void            *data)
{
  const char* filename;
  printf("fc_callback(fc = %p, data = %p)\n", fc, data);
  filename = Fl_File_Chooser_value(fc);
  printf("    filename = \"%s\"\n", filename ? filename : "(null)");
}

void multi_callback(fl_Widget w, void* user_data)
{
  Fl_File_Chooser_set_type(fc, Fl_File_Chooser_type(fc) ^ FL_FILE_CHOOSER_MULTI);
}
fl_Image			// O - Page image or NULL
pdf_check(const char *name,	// I - Name of file
          uchar      *header,	// I - Header data
	  int i)		// I - Length of header data (unused)
{
  const char	*home;		// Home directory
  char		preview[FL_PATH_MAX],	// Preview filename
		command[FL_PATH_MAX];	// Command


  if (memcmp(header, "%PDF", 4) != 0)
    return 0;

  home = getenv("HOME");
  sprintf(preview, "%s/.preview.ppm", home ? home : "");

  sprintf(command,
          "gs -r100 -dFIXED -sDEVICE=ppmraw -dQUIET -dNOPAUSE -dBATCH "
	  "-sstdout=\"%%stderr\" -sOUTPUTFILE=\'%s\' "
	  "-dFirstPage=1 -dLastPage=1 \'%s\' 2>/dev/null", preview, name);

  if (system(command)) return 0;

  return Fl_PNM_Image_New(preview);
}

fl_Image			// O - Page image or NULL
ps_check(const char *name,	// I - Name of file
         uchar      *header,	// I - Header data
	 int i)			// I - Length of header data (unused)
{
  const char	*home;		// Home directory
  char		preview[FL_PATH_MAX],	// Preview filename
		outname[FL_PATH_MAX],	// Preview PS file
		command[FL_PATH_MAX];	// Command
  FILE		*in,		// Input file
		*out;		// Output file
  int		page;		// Current page
  char		line[256];	// Line from file


  if (memcmp(header, "%!", 2) != 0)
    return 0;

  home = getenv("HOME");
  sprintf(preview, "%s/.preview.ppm", home ? home : "");

  if (memcmp(header, "%!PS", 4) == 0) {
    // PS file has DSC comments; extract the first page...
    sprintf(outname, "%s/.preview.ps", home ? home : "");

    if (strcmp(name, outname) != 0) {
      in   = fl_fopen(name, "rb");
      out  = fl_fopen(outname, "wb");
      page = 0;

      while (fgets(line, sizeof(line), in) != NULL) {
	if (strncmp(line, "%%Page:", 7) == 0) {
          page ++;
	  if (page > 1) break;
	}

	fputs(line, out);
      }

      fclose(in);
      fclose(out);
    }
  } else {
    // PS file doesn't have DSC comments; do the whole file...
    strncpy(outname, name, sizeof(outname) - 1);
    outname[sizeof(outname) - 1] = '\0';
  }

  sprintf(command,
          "gs -r100 -dFIXED -sDEVICE=ppmraw -dQUIET -dNOPAUSE -dBATCH "
	  "-sstdout=\"%%stderr\" -sOUTPUTFILE=\'%s\' \'%s\' 2>/dev/null",
	  preview, outname);

  if (system(command)) return 0;
  return Fl_PNM_Image_New(preview);
}
void
show_callback(fl_Widget w, void* user_data)
{
  int	i;			// Looping var
  int	count;			// Number of files selected
  char	relative[FL_PATH_MAX];	// Relative filename

  if (Fl_Input_value(filter)[0])
    Fl_File_Chooser_set_filter(fc,Fl_Input_value(filter));

  Fl_File_Chooser_show(fc);

  while (Fl_File_Chooser_visible(fc)) {
    Fl_wait();
  }
  count = Fl_File_Chooser_count(fc);
  if (count > 0)
  {
    Fl_File_Browser_clear(files);

    for (i = 1; i <= count; i ++)
    {
      if (!Fl_File_Chooser_value_with_f(fc,i))
        break;

      flc_filename_relative(relative, sizeof(relative), Fl_File_Chooser_value_with_f(fc,i));

      Fl_File_Browser_add_with_d(files,relative,Fl_File_Icon_find(Fl_File_Chooser_value_with_f(fc,i), FL_FILE_ICON_PLAIN));
    }

    Fl_File_Browser_redraw(files);
  }
}
int main (int argc, char** argv){
  image = 0;
  encodings = 0;
  version = 0;
  Fl_scheme(NULL);
  Fl_File_Icon_load_system_icons();
  fc = Fl_File_Chooser_New(".", "*", FL_FILE_CHOOSER_SINGLE, "Fl_File_Chooser Test");
  Fl_File_Chooser_callback(fc,&fc_callback);
  Fl_Shared_Image_add_handler(pdf_check);
  Fl_Shared_Image_add_handler(ps_check);

  fl_Button button;
  fl_File_Icon icon;
  fl_Double_Window window = Fl_Double_Window_New_WithLabel(400, 215, "File Chooser Test");
  filter = Fl_Input_New_WithLabel(50, 10, 315, 25, "Filter:");
  int argn = 1;
#ifdef __APPLE__
  // OS X may add the process number as the first argument - ignore
  if (argc>argn && strncmp(argv[1], "-psn_", 5)==0)
    argn++;
#endif
  if (argc > argn)
    Fl_Input_set_value(filter,argv[argn]);
  else
    Fl_Input_set_value(filter, "PDF Files (*.pdf)\tPostScript Files (*.ps)\tImage Files (*.{bmp,gif,jpg,png})\tC/C++ Source Files (*.{c,C,cc,cpp,cxx})");
  button = Fl_Button_New(365, 10, 25, 25);
  Fl_Button_set_labelcolor(button,FL_YELLOW);
  Fl_Button_set_callback(button,&show_callback);
  icon   = Fl_File_Icon_find(".", FL_FILE_ICON_DIRECTORY);
  Fl_File_Icon_label(icon,button);
  button = Fl_Light_Button_New_WithLabel(50, 45, 80, 25, "MULTI");
  Fl_Button_set_callback(button,&multi_callback);

  button = Fl_Light_Button_New_WithLabel(140, 45, 90, 25, "CREATE");
  Fl_Button_set_callback(button,&create_callback);

  button = Fl_Light_Button_New_WithLabel(240, 45, 115, 25, "DIRECTORY");
  Fl_Button_set_callback(button,&dir_callback);
  ch_extra = Fl_Choice_New_WithLabel(150, 75, 150, 25, "Extra Group:");
  Fl_Choice_add_with_name(ch_extra,"none|encodings group|check button");
  Fl_Choice_set_value_with_index(ch_extra,0);
  Fl_Choice_set_callback(ch_extra,&extra_callback);

  files = Fl_File_Browser_New_WithLabel(50, 105, 340, 75, "Files:");
  Fl_File_Browser_set_align(files,FL_ALIGN_LEFT);

  button = Fl_Button_New_WithLabel(340, 185, 50, 25, "Close");
  Fl_Button_set_callback(button, &close_callback);
  Fl_Double_Window_set_resizable(window,window);
  Fl_Double_Window_end(window);
  Fl_Double_Window_show_with_args(window, 1, argv);
  return Fl_run();
}
