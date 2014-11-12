#ifndef __FL_TYPES_H
#define __FL_TYPES_H
#include "FL/fl_types.h"
#include "Fl_EnumerationsC.h"

#if defined(WIN32) && !defined(__CYGWIN__)
# if defined(_WIN64)
#  define FL_SOCKET unsigned __int64
# else
#  define FL_SOCKET int
# endif
#else
# define FL_SOCKET int
#endif
#ifdef _WIN64
#ifdef __GNUC__
#include <stdint.h>
#else
#include <stddef.h>  // M$VC
#endif
typedef intptr_t fl_intptr_t;
typedef uintptr_t fl_uintptr_t;
#else
typedef long fl_intptr_t;
typedef unsigned long fl_uintptr_t;
#endif
#ifdef __cplusplus
class DerivedText_Editor;
EXPORT {
#endif
// values for type(), lowest bit indicate horizontal:
#define FL_VERT_SLIDER		0
#define FL_HOR_SLIDER		1
#define FL_VERT_FILL_SLIDER	2
#define FL_HOR_FILL_SLIDER	3
#define FL_VERT_NICE_SLIDER	4
#define FL_HOR_NICE_SLIDER	5

#define FL_NORMAL_BROWSER	0	/**< type() of Fl_Browser */
#define FL_SELECT_BROWSER	1	/**< type() of FL_Select_Browser */
#define FL_HOLD_BROWSER		2	/**< type() of Fl_Hold_Browser */
#define FL_MULTI_BROWSER	3	/**< type() of Fl_Multi_Browser */

#define FL_SORT_ASCENDING	0	/**< sort browser items in ascending alphabetic order. */
#define FL_SORT_DESCENDING	1	/**< sort in descending order */
#ifndef INTERNAL_LINKAGE
  enum { FL_FILE_BROWSER_FILES, FL_FILE_BROWSER_DIRECTORIES };
  enum
  {
    FL_FILE_ICON_ANY,
    FL_FILE_ICON_PLAIN,
    FL_FILE_ICON_FIFO,
    FL_FILE_ICON_DEVICE,
    FL_FILE_ICON_LINK,
    FL_FILE_ICON_DIRECTORY
  };
  enum
  {
    FL_FILE_ICON_END,
    FL_FILE_ICON_COLOR,
    FL_FILE_ICON_LINE,
    FL_FILE_ICON_CLOSEDLINE,
    FL_FILE_ICON_POLYGON,
    FL_FILE_ICON_OUTLINEPOLYGON,
    FL_FILE_ICON_VERTEX
  };
  enum {
    FL_FILE_CHOOSER_SINGLE = 0,
    FL_FILE_CHOOSER_MULTI = 1,
    FL_FILE_CHOOSER_CREATE = 2,
    FL_FILE_CHOOSER_DIRECTORY = 4
  };

#define FL_RESERVED_TYPE 100
#define FL_NORMAL_BUTTON	0
#define FL_TOGGLE_BUTTON	1
#define FL_RADIO_BUTTON		(FL_RESERVED_TYPE+2)
#define FL_HIDDEN_BUTTON	3
  typedef enum {
    FL_TREE_REASON_NONE=0,
    FL_TREE_REASON_SELECTED,
    FL_TREE_REASON_DESELECTED,
#if FLTK_ABI_VERSION >= 10302
    FL_TREE_REASON_RESELECTED,
#endif /*FLTK_ABI_VERSION*/
    FL_TREE_REASON_OPENED,
    FL_TREE_REASON_CLOSED
  } Fl_Tree_Reason;
  enum {
    FL_MENU_INACTIVE = 1,
    FL_MENU_TOGGLE= 2,
    FL_MENU_VALUE = 4,
    FL_MENU_RADIO = 8,
    FL_MENU_INVISIBLE = 0x10,
    FL_SUBMENU_POINTER = 0x20,
    FL_SUBMENU = 0x40,
    FL_MENU_DIVIDER = 0x80,
    FL_MENU_HORIZONTAL = 0x100
  };
  enum {
    HORIZONTAL = 1,
    VERTICAL = 2,
    BOTH = 3,
    ALWAYS_ON = 4,
    HORIZONTAL_ALWAYS = 5,
    VERTICAL_ALWAYS = 6,
    BOTH_ALWAYS = 7
  };
  enum {
    NORMAL_CURSOR,
    CARET_CURSOR,
    DIM_CURSOR,
    BLOCK_CURSOR,
    HEAVY_CURSOR,
    SIMPLE_CURSOR
  };
  enum {
    CURSOR_POS,
    CHARACTER_POS
  };
  enum {
    DRAG_NONE = -2,
    DRAG_START_DND = -1,
    DRAG_CHAR = 0,
    DRAG_WORD = 1,
    DRAG_LINE = 2
  };
  enum {
    WRAP_NONE,
    WRAP_AT_COLUMN,
    WRAP_AT_PIXEL,
    WRAP_AT_BOUNDS
  };
  enum Page_Format {
    A0 = 0,
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    A8,
    A9,
    B0,
    B1,
    B2,
    B3,
    B4,
    B5,
    B6,
    B7,
    B8,
    B9,
    B10,
    C5E,
    DLE,
    EXECUTIVE,
    FOLIO,
    LEDGER,
    LEGAL,
    LETTER,
    TABLOID,
    ENVELOPE,
    MEDIA = 0x1000
  };
  enum Page_Layout {
    PORTRAIT = 0,
    LANDSCAPE = 0x100,
    REVERSED = 0x200,
    ORIENTATION = 0x300
  };
  typedef struct page_format {
    int width;
    int height;
    const char *name;
  } page_format;
#include <config.h>
#  ifdef __APPLE__
#    include <OpenGL/gl.h>
#  else
#    include <GL/gl.h>
#  endif
  typedef void (*GLUTproc)();
  void (*glut_idle_function)();
  void (*glut_menustate_function)(int);
  void (*glut_menustatus_function)(int,int,int);
#  define GLUT_RGB	FL_RGB
#  define GLUT_RGBA	FL_RGB
#  define GLUT_INDEX	FL_INDEX
#  define GLUT_SINGLE	FL_SINGLE
#  define GLUT_DOUBLE	FL_DOUBLE
#  define GLUT_ACCUM	FL_ACCUM
#  define GLUT_ALPHA	FL_ALPHA
#  define GLUT_DEPTH	FL_DEPTH
#  define GLUT_STENCIL	FL_STENCIL
#  define GLUT_MULTISAMPLE FL_MULTISAMPLE
#  define GLUT_STEREO	FL_STEREO
#  define GLUT_CURSOR_RIGHT_ARROW		((Fl_Cursor)2)
#  define GLUT_CURSOR_LEFT_ARROW		((Fl_Cursor)67)
#  define GLUT_CURSOR_INFO			FL_CURSOR_HAND
#  define GLUT_CURSOR_DESTROY			((Fl_Cursor)45)
#  define GLUT_CURSOR_HELP			FL_CURSOR_HELP
#  define GLUT_CURSOR_CYCLE			((Fl_Cursor)26)
#  define GLUT_CURSOR_SPRAY			((Fl_Cursor)63)
#  define GLUT_CURSOR_WAIT			FL_CURSOR_WAIT
#  define GLUT_CURSOR_TEXT			FL_CURSOR_INSERT
#  define GLUT_CURSOR_CROSSHAIR			FL_CURSOR_CROSS
#  define GLUT_CURSOR_UP_DOWN			FL_CURSOR_NS
#  define GLUT_CURSOR_LEFT_RIGHT		FL_CURSOR_WE
#  define GLUT_CURSOR_TOP_SIDE			FL_CURSOR_N
#  define GLUT_CURSOR_BOTTOM_SIDE		FL_CURSOR_S
#  define GLUT_CURSOR_LEFT_SIDE			FL_CURSOR_W
#  define GLUT_CURSOR_RIGHT_SIDE		FL_CURSOR_E
#  define GLUT_CURSOR_TOP_LEFT_CORNER		FL_CURSOR_NW
#  define GLUT_CURSOR_TOP_RIGHT_CORNER		FL_CURSOR_NE
#  define GLUT_CURSOR_BOTTOM_RIGHT_CORNER	FL_CURSOR_SE
#  define GLUT_CURSOR_BOTTOM_LEFT_CORNER	FL_CURSOR_SW
#  define GLUT_CURSOR_INHERIT			FL_CURSOR_DEFAULT
#  define GLUT_CURSOR_NONE			FL_CURSOR_NONE
#  define GLUT_CURSOR_FULL_CROSSHAIR		FL_CURSOR_CROSS

  enum {GLUT_NORMAL, GLUT_OVERLAY};
#  define GLUT_LEFT_BUTTON		0
#  define GLUT_MIDDLE_BUTTON		1
#  define GLUT_RIGHT_BUTTON		2
#  define GLUT_DOWN			0
#  define GLUT_UP			1
  enum {GLUT_NOT_VISIBLE, GLUT_VISIBLE};
  enum {GLUT_MENU_NOT_IN_USE, GLUT_MENU_IN_USE};
  enum {GLUT_LEFT, GLUT_ENTERED};
#  define GLUT_KEY_F1			1
#  define GLUT_KEY_F2			2
#  define GLUT_KEY_F3			3
#  define GLUT_KEY_F4			4
#  define GLUT_KEY_F5			5
#  define GLUT_KEY_F6			6
#  define GLUT_KEY_F7			7
#  define GLUT_KEY_F8			8
#  define GLUT_KEY_F9			9
#  define GLUT_KEY_F10			10
#  define GLUT_KEY_F11			11
#  define GLUT_KEY_F12			12
  // WARNING: Different values than GLUT uses:
#  define GLUT_KEY_LEFT			FL_Left
#  define GLUT_KEY_UP			FL_Up
#  define GLUT_KEY_RIGHT		FL_Right
#  define GLUT_KEY_DOWN			FL_Down
#  define GLUT_KEY_PAGE_UP		FL_Page_Up
#  define GLUT_KEY_PAGE_DOWN		FL_Page_Down
#  define GLUT_KEY_HOME			FL_Home
#  define GLUT_KEY_END			FL_End
#  define GLUT_KEY_INSERT		FL_Insert
  enum {
    GLUT_RETURN_ZERO = 0,
    GLUT_WINDOW_X,
    GLUT_WINDOW_Y,
    GLUT_WINDOW_WIDTH,
    GLUT_WINDOW_HEIGHT,
    GLUT_WINDOW_PARENT,
    GLUT_SCREEN_WIDTH,
    GLUT_SCREEN_HEIGHT,
    GLUT_MENU_NUM_ITEMS,
    GLUT_DISPLAY_MODE_POSSIBLE,
    GLUT_INIT_WINDOW_X,
    GLUT_INIT_WINDOW_Y,
    GLUT_INIT_WINDOW_WIDTH,
    GLUT_INIT_WINDOW_HEIGHT,
    GLUT_INIT_DISPLAY_MODE,
    GLUT_WINDOW_BUFFER_SIZE,
    GLUT_VERSION
  };
#  define GLUT_WINDOW_STENCIL_SIZE	GL_STENCIL_BITS
#  define GLUT_WINDOW_DEPTH_SIZE	GL_DEPTH_BITS
#  define GLUT_WINDOW_RED_SIZE		GL_RED_BITS
#  define GLUT_WINDOW_GREEN_SIZE	GL_GREEN_BITS
#  define GLUT_WINDOW_BLUE_SIZE		GL_BLUE_BITS
#  define GLUT_WINDOW_ALPHA_SIZE	GL_ALPHA_BITS
#  define GLUT_WINDOW_ACCUM_RED_SIZE	GL_ACCUM_RED_BITS
#  define GLUT_WINDOW_ACCUM_GREEN_SIZE	GL_ACCUM_GREEN_BITS
#  define GLUT_WINDOW_ACCUM_BLUE_SIZE	GL_ACCUM_BLUE_BITS
#  define GLUT_WINDOW_ACCUM_ALPHA_SIZE	GL_ACCUM_ALPHA_BITS
#  define GLUT_WINDOW_DOUBLEBUFFER	GL_DOUBLEBUFFER
#  define GLUT_WINDOW_RGBA		GL_RGBA
#  define GLUT_WINDOW_COLORMAP_SIZE	GL_INDEX_BITS
#  ifdef GL_SAMPLES_SGIS
#    define GLUT_WINDOW_NUM_SAMPLES	GL_SAMPLES_SGIS
#  else
#    define GLUT_WINDOW_NUM_SAMPLES	GLUT_RETURN_ZERO
#  endif
#  define GLUT_WINDOW_STEREO		GL_STEREO
#  define GLUT_HAS_KEYBOARD		600
#  define GLUT_HAS_MOUSE		601
#  define GLUT_HAS_SPACEBALL		602
#  define GLUT_HAS_DIAL_AND_BUTTON_BOX	603
#  define GLUT_HAS_TABLET		604
#  define GLUT_NUM_MOUSE_BUTTONS	605
#  define GLUT_NUM_SPACEBALL_BUTTONS	606
#  define GLUT_NUM_BUTTON_BOX_BUTTONS	607
#  define GLUT_NUM_DIALS		608
#  define GLUT_NUM_TABLET_BUTTONS	609

#  define GLUT_ACTIVE_SHIFT               FL_SHIFT
#  define GLUT_ACTIVE_CTRL                FL_CTRL
#  define GLUT_ACTIVE_ALT                 FL_ALT
#  define GLUT_OVERLAY_POSSIBLE		800
#  define GLUT_TRANSPARENT_INDEX		803
#  define GLUT_NORMAL_DAMAGED		804
#  define GLUT_OVERLAY_DAMAGED		805
  typedef struct Fl_Glut_Bitmap_Font {Fl_Font font; Fl_Fontsize size;} Fl_Glut_Bitmap_Font;
  struct Fl_Glut_Bitmap_Font
    glutBitmap9By15, glutBitmap8By13, glutBitmapTimesRoman10,
    glutBitmapTimesRoman24, glutBitmapHelvetica10, glutBitmapHelvetica12,
    glutBitmapHelvetica18;
#  define GLUT_BITMAP_9_BY_15             (&glutBitmap9By15)
#  define GLUT_BITMAP_8_BY_13             (&glutBitmap8By13)
#  define GLUT_BITMAP_TIMES_ROMAN_10      (&glutBitmapTimesRoman10)
#  define GLUT_BITMAP_TIMES_ROMAN_24      (&glutBitmapTimesRoman24)
#  define GLUT_BITMAP_HELVETICA_10        (&glutBitmapHelvetica10)
#  define GLUT_BITMAP_HELVETICA_12        (&glutBitmapHelvetica12)
#  define GLUT_BITMAP_HELVETICA_18        (&glutBitmapHelvetica18)
  typedef struct Fl_Glut_StrokeVertex {
    GLfloat X, Y;
  } Fl_Glut_StrokeVertex;
  typedef struct Fl_Glut_StrokeStrip {
    int Number;
    const Fl_Glut_StrokeVertex* Vertices;
  } Fl_Glut_StrokeStrip;
  typedef struct Fl_Glut_StrokeChar {
    GLfloat Right;
    int Number;
    const Fl_Glut_StrokeStrip* Strips;
  } Fl_Glut_StrokeChar;
  typedef struct Fl_Glut_StrokeFont {
    char* Name;				// The source font name
    int Quantity;				// Number of chars in font
    GLfloat Height;			// Height of the characters
    const Fl_Glut_StrokeChar** Characters;// The characters mapping
  } Fl_Glut_StrokeFont;
  Fl_Glut_StrokeFont glutStrokeRoman;
  Fl_Glut_StrokeFont glutStrokeMonoRoman;
#  define GLUT_STROKE_ROMAN		(&glutStrokeRoman)
#  define GLUT_STROKE_MONO_ROMAN	(&glutStrokeMonoRoman)
  typedef ulong Fl_Bitmask;
#endif /* INTERNAL_LINKAGE */
  typedef void* ID;
  typedef void* fl_Window;
  typedef void* fl_Group;
  typedef void* fl_Label;
  typedef void* fl_Adjuster;
  typedef void* fl_Bitmap;
  typedef void* fl_BMP_Image;
  typedef void* fl_Box;
  typedef void* fl_Browser_;
  typedef void* fl_Browser;
  typedef void* fl_Button;
  typedef void* fl_Cairo;
  typedef void* fl_Cairo_Window;
  typedef void* fl_Chart;
  typedef void* fl_Check_Browser;
  typedef void* fl_Check_Button;
  typedef void* fl_Choice;
  typedef void* fl_Clock;
  typedef void* fl_Color_Chooser;
  typedef void* fl_Copy_Surface;
  typedef void* fl_Counter;
  typedef void* fl_Device;
  typedef void* fl_Dial;
  typedef void* fl_Double_Window;
  typedef void* fl_Export;
  typedef void* fl_File_Browser;
  typedef void* fl_File_Chooser;
  typedef void* fl_File_Icon;
  typedef void* fl_File_Input;
  typedef void* fl_Fill_Dial;
  typedef void* fl_Fill_Slider;
  typedef void* fl_Float_Input;
  typedef void* fl_Font_Descriptor;
  typedef void* fl_FormsBitmap;
  typedef void* fl_FormsPixmap;
  typedef void* fl_Free;
  typedef void* fl_GIF_Image;
  typedef void* fl_Gl_Window;
  typedef void* fl_Glut_Window;
  typedef void* fl_Graphics_Driver;
  typedef void* fl_Surface_Device;
  typedef void* fl_Display_Device;
  typedef void* fl_Device_Plugin;
  typedef void* fl_Help_Dialog;
  typedef void* fl_Help_View;
  typedef void* fl_Hold_Browser;
  typedef void* fl_Hor_Fill_Slider;
  typedef void* fl_Hor_Nice_Slider;
  typedef void* fl_Hor_Slider;
  typedef void* fl_Hor_Value_Slider;
  typedef void* fl_Image;
  typedef void* fl_Input_Choice;
  typedef void* fl_Input_;
  typedef void* fl_Input;
  typedef void* fl_Int_Input;
  typedef void* fl_JPEG_Image;
  typedef void* fl_Light_Button;
  typedef void* fl_Line_Dial;
  typedef void* fl_Menu_Bar;
  typedef void* fl_Menu_Button;
  typedef void* fl_Menu_;
  typedef void* fl_Menu;
  typedef void* fl_Menu_Item;
  typedef void* fl_Menu_Window;
  typedef void* fl_Multi_Browser;
  typedef void* fl_Multi_Label;
  typedef void* fl_Multiline_Input;
  typedef void* fl_Multiline_Output;
  typedef void* fl_Native_File_Chooser;
  typedef void* fl_Nice_Slider;
  typedef void* fl_Object;
  typedef void* fl_Output;
  typedef void* fl_Overlay_Window;
  typedef void* fl_Pack;
  typedef void* fl_Paged_Device;
  typedef void* fl_Pixmap;
  typedef void* fl_Plugin;
  typedef void* fl_PNG_Image;
  typedef void* fl_PNM_Image;
  typedef void* fl_Positioner;
  typedef void* fl_PostScript;
  typedef void* fl_Preferences;
  typedef void* fl_Printer;
  typedef void* fl_Progress;
  typedef void* fl_Radio_Button;
  typedef void* fl_Radio_Light_Button;
  typedef void* fl_Radio_Round_Button;
  typedef void* fl_Repeat_Button;
  typedef void* fl_Return_Button;
  typedef void* fl_RGB_Image;
  typedef void* fl_Roller;
  typedef void* fl_Round_Button;
  typedef void* fl_Round_Clock;
  typedef void* fl_Scrollbar;
  typedef void* fl_Scroll;
  typedef void* fl_Secret_Input;
  typedef void* fl_Select_Browser;
  typedef void* fl_Shared_Image;
  typedef void* fl_show_input;
  typedef void* fl_Simple_Counter;
  typedef void* fl_Single_Window;
  typedef void* fl_Slider;
  typedef void* fl_Spinner;
  typedef void* fl_Sys_Menu_Bar;
  typedef void* fl_Table;
  typedef void* fl_Table_Row;
  typedef void* fl_Tabs;
  typedef void* fl_Text_Buffer;
  typedef void* fl_Text_Display;
  typedef void* fl_Text_Editor;
  typedef void* fl_Text_Selection;
  typedef void* fl_Tiled_Image;
  typedef void* fl_Tile;
  typedef void* fl_Timer;
  typedef void* fl_Toggle_Button;
  typedef void* fl_Toggle_Light_Button;
  typedef void* fl_Toggle_Round_Button;
  typedef void* fl_Tooltip;
  typedef void* fl_Tree;
  typedef void* fl_Tree_Item_Array;
  typedef void* fl_Tree_Item;
  typedef void* fl_Tree_Prefs;
  typedef void* fl_Valuator;
  typedef void* fl_Value_Input;
  typedef void* fl_Value_Output;
  typedef void* fl_Value_Slider;
  typedef void* fl_Widget;
  typedef void* fl_Wizard;
  typedef void* fl_XBM_Image;
  typedef void* fl_XPM_Image;
  typedef void* fl_Region;
  typedef void (fl_Callback )(fl_Widget, void*);
  typedef void (fl_Text_Buffer_Callback)(fl_Text_Buffer);
  typedef void (*Unfinished_Style_Cb)(int, void *);
  typedef void (fl_File_Chooser_Callback)(fl_File_Chooser,void*);
  typedef fl_Image (fl_Shared_Image_Handler)(const char *name, uchar *header,int headerlen);
  typedef struct Style_Table_Entry {
    Fl_Color    color;
    Fl_Font     font;
    Fl_Fontsize size;
    unsigned    attr;
  }Style_Table_Entry;
  /** Key function binding callback type */
  typedef int (fl_Key_Func)(int key, fl_Text_Editor Editor);
  /** Simple linked list associating a key/state to a function */
  typedef struct Key_BindingC {
    int           key;
    int           state;
    fl_Key_Func*  function;
    struct Key_BindingC* next;
  } Key_BindingC;

  typedef enum {
    SELECT_NONEC,
    SELECT_SINGLEC,
    SELECT_MULTIC
  }TableRowSelectModeC;
  typedef enum {
    CONTEXT_NONEC       = 0,
    CONTEXT_STARTPAGEC  = 0x01,
    CONTEXT_ENDPAGEC    = 0x02,
    CONTEXT_ROW_HEADERC = 0x04,
    CONTEXT_COL_HEADERC = 0x08,
    CONTEXT_CELLC       = 0x10,
    CONTEXT_TABLEC      = 0x20,
    CONTEXT_RC_RESIZEC  = 0x40
  }TableContextC ;
  typedef struct {
    int maxw;
    int maxh;
    int dw;
    int dh;
    int aspect;
  }fl_Window_size_range_args;
  typedef enum { TOP, BOTTOM, MIDDLE } Fl_Line_Position;
  typedef struct {
    int R;
    int C;
    int X;
    int Y;
  }fl_Window_draw_cell_default_args;
  typedef struct {
    /* From Fl_Widget */
    void 	 (*draw        )(fl_Table table);
    int          (*handle      )(fl_Table table,int event);
    void         (*resize      )(fl_Table table,int x, int y, int w, int h);
    void         (*show        )(fl_Table table);
    void         (*hide        )(fl_Table table);
    fl_Window    (*as_window   )(fl_Table table);
    fl_Gl_Window (*as_gl_window)(fl_Table table);
    /* From Fl_Group */
    fl_Group     (*as_group    )(fl_Table table);
    /* From Fl_Table */
    void         (*draw_cell   )(fl_Table table,TableContextC context,int R, int C, int X, int Y, int W, int H);
    void         (*clear       )(fl_Table table);
    void         (*set_rows    )(fl_Table table, int val);
    void         (*set_cols    )(fl_Table table, int val);
    /* Clean up */
    void         (*destroy_data)(fl_Table table);
  } fl_Table_Virtual_Funcs;
  typedef struct {
    void 	 (*draw        )(fl_Widget widget);
    int          (*handle      )(fl_Widget widget,int event);
    void         (*resize      )(fl_Widget widget,int x, int y, int w, int h);
    void         (*show        )(fl_Widget widget);
    void         (*hide        )(fl_Widget widget);
    fl_Window    (*as_window   )(fl_Widget widget);
    fl_Gl_Window (*as_gl_window)(fl_Widget widget);
    fl_Group     (*as_group    )(fl_Widget widget);
    /* Clean up */
    void         (*destroy_data)(fl_Widget widget);
  } fl_Widget_Virtual_Funcs;

  typedef struct {
    /* From Fl_Widget */
    void 	 (*draw        )(fl_Group group);
    int          (*handle      )(fl_Group group,int event);
    void         (*resize      )(fl_Group group,int x, int y, int w, int h);
    void         (*show        )(fl_Group group);
    void         (*hide        )(fl_Group group);
    fl_Window    (*as_window   )(fl_Group group);
    fl_Gl_Window (*as_gl_window)(fl_Group group);
    /* From Fl_Group */
    fl_Group     (*as_group    )(fl_Group group);
    /* Clean up */
    void         (*destroy_data)(fl_Group group);
  } fl_Group_Virtual_Funcs;
  typedef struct {
    /* From Fl_Widget */
    void 	 (*draw        )(fl_Window window);
    int          (*handle      )(fl_Window window,int event);
    void         (*resize      )(fl_Window window,int x, int y, int w, int h);
    void         (*show        )(fl_Window window);
    void         (*hide        )(fl_Window window);
    fl_Window    (*as_window   )(fl_Window window);
    fl_Gl_Window (*as_gl_window)(fl_Window window);
    /* From Fl_Group */
    fl_Window     (*as_group   )(fl_Window window);
    /* Fl_Browser Specific */
    void         (*flush       )(fl_Window window);
    /* Clean up */
    void         (*destroy_data)(fl_Window window);
  } fl_Window_Virtual_Funcs;

  typedef struct {
    /* From Fl_Widget */
    void 	 (*draw          )(fl_Browser browser);
    int          (*handle        )(fl_Browser browser,int event);
    void         (*resize        )(fl_Browser browser,int x, int y, int w, int h);
    fl_Window    (*as_window     )(fl_Browser browser);
    fl_Gl_Window (*as_gl_window  )(fl_Browser browser);
    /* From Fl_Group */
    fl_Group     (*as_group      )(fl_Browser browser);
    /* Fl_Browser Specific */
    void         (*show          )(fl_Browser browser);
    void         (*show_with_line)(fl_Browser browser, int line);
    void         (*hide          )(fl_Browser browser);
    void         (*hide_with_line)(fl_Browser browser, int line);
    /* Clean up */
    void         (*destroy_data)(fl_Browser browser);
  } fl_Browser_Virtual_Funcs;

  typedef struct {
    void      (*color_average)(fl_Image image, Fl_Color c, float i);
    fl_Image  (*copy         )(fl_Image image, int W, int H);
    void      (*desaturate   )(fl_Image image);
    void      (*draw         )(fl_Image image, int X, int Y, int W, int H, int cx, int cy);
    void      (*uncache      )(fl_Image image);
    void      (*destroy_data )(fl_Image image);
  } fl_Image_Virtual_Funcs;
  typedef struct {
    void 	 (*draw        )(fl_Valuator valuator);
    int          (*handle      )(fl_Valuator valuator,int event);
    void         (*resize      )(fl_Valuator valuator,int x, int y, int w, int h);
    void         (*show        )(fl_Valuator valuator);
    void         (*hide        )(fl_Valuator valuator);
    fl_Window    (*as_window   )(fl_Valuator valuator);
    fl_Gl_Window (*as_gl_window)(fl_Valuator valuator);
    fl_Group     (*as_group    )(fl_Valuator valuator);
    /* Clean up */
    void         (*destroy_data)(fl_Valuator valuator);
    /* Fl_Valuator specific */
    int          (*format      )(fl_Valuator valuator, char* format);
  } fl_Valuator_Virtual_Funcs;
  typedef fl_Table_Virtual_Funcs fl_Table_Row_Virtual_Funcs;
  typedef fl_Widget_Virtual_Funcs fl_Button_Virtual_Funcs;
  typedef fl_Widget_Virtual_Funcs fl_Int_Input_Virtual_Funcs;
  typedef fl_Browser_Virtual_Funcs fl_Multi_Browser_Virtual_Funcs;
  typedef fl_Widget_Virtual_Funcs fl_Menu__Virtual_Funcs;
  typedef fl_Widget_Virtual_Funcs fl_Menu_Bar_Virtual_Funcs;
  typedef fl_Widget_Virtual_Funcs fl_Box_Virtual_Funcs;
  typedef fl_Window_Virtual_Funcs fl_Gl_Window_Virtual_Funcs;
  typedef fl_Window_Virtual_Funcs fl_Double_Window_Virtual_Funcs;
  typedef fl_Window_Virtual_Funcs fl_Single_Window_Virtual_Funcs;
#ifdef __cplusplus
}
#endif
#endif /* #ifndef __FL_TYPES_H */
