#ifndef __FL_ENUMERATIONSC__
#define __FL_ENUMERATIONSC__
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#ifdef __cplusplus
#include "FL/Fl.H"
#include "FL/Enumerations.H"
EXPORT {
#endif
#ifndef INTERNAL_LINKAGE
#define FLTK_ABI_VERSION        10303  
#define FL_MAJOR_VERSION	1
#define FL_MINOR_VERSION	3
#define FL_PATCH_VERSION	0
#define FL_VERSION		((double)FL_MAJOR_VERSION +		\
				 (double)FL_MINOR_VERSION * 0.01 +	\
				 (double)FL_PATCH_VERSION * 0.0001)
  typedef enum Fl_Event {	// events
    FL_NO_EVENT		= 0,
    FL_PUSH		= 1,
    FL_RELEASE		= 2,
    FL_ENTER		= 3,
    FL_LEAVE		= 4,
    FL_DRAG		= 5,
    FL_FOCUS		= 6,
    FL_UNFOCUS		= 7,
    FL_KEYDOWN		= 8,
    FL_KEYBOARD		= 8,
    FL_KEYUP		= 9,
    FL_CLOSE		= 10,
    FL_MOVE		= 11,
    FL_SHORTCUT		= 12,
    FL_DEACTIVATE		= 13,
    FL_ACTIVATE		= 14,
    FL_HIDE		= 15,
    FL_SHOW		= 16,
    FL_PASTE		= 17,
    FL_SELECTIONCLEAR	= 18,
    FL_MOUSEWHEEL		= 19,
    FL_DND_ENTER		= 20,
    FL_DND_DRAG		= 21,
    FL_DND_LEAVE		= 22,
    FL_DND_RELEASE	= 23,
    FL_SCREEN_CONFIGURATION_CHANGED = 24,
    FL_FULLSCREEN         = 25
  } Fl_Event;

  typedef enum Fl_When {
    FL_WHEN_NEVER		= 0,
    FL_WHEN_CHANGED	= 1,
    FL_WHEN_NOT_CHANGED	= 2,
    FL_WHEN_RELEASE	= 4,
    FL_WHEN_RELEASE_ALWAYS= 6,
    FL_WHEN_ENTER_KEY	= 8,
    FL_WHEN_ENTER_KEY_ALWAYS=10,
    FL_WHEN_ENTER_KEY_CHANGED=11
  } Fl_When;
  typedef enum  Fl_Tree_Sort{
    FL_TREE_SORT_NONE=0,
    FL_TREE_SORT_ASCENDING=1,
    FL_TREE_SORT_DESCENDING=2
  } Fl_Tree_Sort;
  typedef enum   Fl_Tree_Connector{
    FL_TREE_CONNECTOR_NONE=0,
    FL_TREE_CONNECTOR_DOTTED=1,
    FL_TREE_CONNECTOR_SOLID=2
  } Fl_Tree_Connector;
  typedef enum  Fl_Tree_Select{
    FL_TREE_SELECT_NONE=0,
    FL_TREE_SELECT_SINGLE=1,
    FL_TREE_SELECT_MULTI=2
  }Fl_Tree_Select;
#if FLTK_ABI_VERSION >= 10302
  typedef enum  Fl_Tree_Item_Reselect_Mode{
    FL_TREE_SELECTABLE_ONCE=0,
    FL_TREE_SELECTABLE_ALWAYS,
  }Fl_Tree_Item_Reselect_Mode;
  typedef enum  Fl_Tree_Item_Draw_Mode{
    FL_TREE_ITEM_DRAW_DEFAULT=0,
    FL_TREE_ITEM_DRAW_LABEL_AND_WIDGET=1,
    FL_TREE_ITEM_HEIGHT_FROM_WIDGET=2
  }Fl_Tree_Item_Draw_Mode;
#endif /*FLTK_ABI_VERSION*/
#define FL_Button	0xfee8
#define FL_BackSpace	0xff08
#define FL_Tab		0xff09
#define FL_Iso_Key	0xff0c
#define FL_Enter	0xff0d
#define FL_Pause	0xff13
#define FL_Scroll_Lock	0xff14
#define FL_Escape	0xff1b
#define FL_Home		0xff50
#define FL_Left		0xff51
#define FL_Up		0xff52
#define FL_Right	0xff53
#define FL_Down		0xff54
#define FL_Page_Up	0xff55
#define FL_Page_Down	0xff56
#define FL_End		0xff57
#define FL_Print	0xff61
#define FL_Insert	0xff63
#define FL_Menu		0xff67
#define FL_Help		0xff68
#define FL_Num_Lock	0xff7f
#define FL_KP		0xff80
#define FL_KP_Enter	0xff8d
#define FL_KP_Last	0xffbd
#define FL_F		0xffbd
#define FL_F_Last	0xffe0
#define FL_Shift_L	0xffe1
#define FL_Shift_R	0xffe2
#define FL_Control_L	0xffe3
#define FL_Control_R	0xffe4
#define FL_Caps_Lock	0xffe5
#define FL_Meta_L	0xffe7
#define FL_Meta_R	0xffe8
#define FL_Alt_L	0xffe9
#define FL_Alt_R	0xffea
#define FL_Delete	0xffff


#define FL_Volume_Down  0xEF11
#define FL_Volume_Mute  0xEF12
#define FL_Volume_Up    0xEF13
#define FL_Media_Play   0xEF14
#define FL_Media_Stop   0xEF15
#define FL_Media_Prev   0xEF16
#define FL_Media_Next   0xEF17
#define FL_Home_Page    0xEF18
#define FL_Mail         0xEF19
#define FL_Search       0xEF1B
#define FL_Back         0xEF26
#define FL_Forward      0xEF27
#define FL_Stop         0xEF28
#define FL_Refresh      0xEF29
#define FL_Sleep        0xEF2F
#define FL_Favorites    0xEF30

#define FL_LEFT_MOUSE	1
#define FL_MIDDLE_MOUSE	2
#define FL_RIGHT_MOUSE	3

#define FL_SHIFT	0x00010000
#define FL_CAPS_LOCK	0x00020000
#define FL_CTRL		0x00040000
#define FL_ALT		0x00080000
#define FL_NUM_LOCK	0x00100000

#define FL_META		0x00400000

#define FL_SCROLL_LOCK	0x00800000

#define FL_BUTTON1	0x01000000
#define FL_BUTTON2	0x02000000
#define FL_BUTTON3	0x04000000
#define FL_BUTTONS	0x7f000000
#define FL_BUTTON(n)	(0x00800000<<(n))

#define FL_KEY_MASK 0x0000ffff


#ifdef __APPLE__
#  define FL_COMMAND	FL_META
#  define FL_CONTROL 	FL_CTRL
#else
#  define FL_COMMAND	FL_CTRL
#  define FL_CONTROL	FL_META
#endif
  typedef enum Fl_Boxtype {
    FL_NO_BOX = 0,
    FL_FLAT_BOX,
    FL_UP_BOX,
    FL_DOWN_BOX,
    FL_UP_FRAME,
    FL_DOWN_FRAME,
    FL_THIN_UP_BOX,
    FL_THIN_DOWN_BOX,
    FL_THIN_UP_FRAME,
    FL_THIN_DOWN_FRAME,
    FL_ENGRAVED_BOX,
    FL_EMBOSSED_BOX,
    FL_ENGRAVED_FRAME,
    FL_EMBOSSED_FRAME,
    FL_BORDER_BOX,
    _FL_SHADOW_BOX,
    FL_BORDER_FRAME,
    _FL_SHADOW_FRAME,
    _FL_ROUNDED_BOX,
    _FL_RSHADOW_BOX,
    _FL_ROUNDED_FRAME,
    _FL_RFLAT_BOX,
    _FL_ROUND_UP_BOX,
    _FL_ROUND_DOWN_BOX,
    _FL_DIAMOND_UP_BOX,
    _FL_DIAMOND_DOWN_BOX,
    _FL_OVAL_BOX,
    _FL_OSHADOW_BOX,
    _FL_OVAL_FRAME,
    _FL_OFLAT_BOX,
    _FL_PLASTIC_UP_BOX,
    _FL_PLASTIC_DOWN_BOX,
    _FL_PLASTIC_UP_FRAME,
    _FL_PLASTIC_DOWN_FRAME,
    _FL_PLASTIC_THIN_UP_BOX,
    _FL_PLASTIC_THIN_DOWN_BOX,
    _FL_PLASTIC_ROUND_UP_BOX,
    _FL_PLASTIC_ROUND_DOWN_BOX,
    _FL_GTK_UP_BOX,
    _FL_GTK_DOWN_BOX,
    _FL_GTK_UP_FRAME,
    _FL_GTK_DOWN_FRAME,
    _FL_GTK_THIN_UP_BOX,
    _FL_GTK_THIN_DOWN_BOX,
    _FL_GTK_THIN_UP_FRAME,
    _FL_GTK_THIN_DOWN_FRAME,
    _FL_GTK_ROUND_UP_BOX,
    _FL_GTK_ROUND_DOWN_BOX,
    FL_FREE_BOXTYPE
  } Fl_Boxtype;

#define FL_ROUND_UP_BOX fl_define_FL_ROUND_UP_BOXC()
#define FL_ROUND_DOWN_BOX (Fl_Boxtype)(fl_define_FL_ROUND_UP_BOXC()+1)
#define FL_SHADOW_BOX fl_define_FL_SHADOW_BOXC()
#define FL_SHADOW_FRAME (Fl_Boxtype)(fl_define_FL_SHADOW_BOXC()+2)
#define FL_ROUNDED_BOX fl_define_FL_ROUNDED_BOXC()
#define FL_ROUNDED_FRAME (Fl_Boxtype)(fl_define_FL_ROUNDED_BOXC()+2)
#define FL_RFLAT_BOX fl_define_FL_RFLAT_BOXC()
#define FL_RSHADOW_BOX fl_define_FL_RSHADOW_BOXC()
#define FL_DIAMOND_UP_BOX fl_define_FL_DIAMOND_BOXC()
#define FL_DIAMOND_DOWN_BOX (Fl_Boxtype)(fl_define_FL_DIAMOND_BOXC()+1)
#define FL_OVAL_BOX fl_define_FL_OVAL_BOXC()
#define FL_OSHADOW_BOX (Fl_Boxtype)(fl_define_FL_OVAL_BOX()+1)
#define FL_OVAL_FRAME (Fl_Boxtype)(fl_define_FL_OVAL_BOX()+2)
#define FL_OFLAT_BOX (Fl_Boxtype)(fl_define_FL_OVAL_BOX()+3)
#define FL_PLASTIC_UP_BOX fl_define_FL_PLASTIC_UP_BOXC()
#define FL_PLASTIC_DOWN_BOX (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+1)
#define FL_PLASTIC_UP_FRAME (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+2)
#define FL_PLASTIC_DOWN_FRAME (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+3)
#define FL_PLASTIC_THIN_UP_BOX (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+4)
#define FL_PLASTIC_THIN_DOWN_BOX (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+5)
#define FL_PLASTIC_ROUND_UP_BOX (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+6)
#define FL_PLASTIC_ROUND_DOWN_BOX (Fl_Boxtype)(fl_define_FL_PLASTIC_UP_BOXC()+7)
#define FL_GTK_UP_BOX fl_define_FL_GTK_UP_BOXC()
#define FL_GTK_DOWN_BOX (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+1)
#define FL_GTK_UP_FRAME (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+2)
#define FL_GTK_DOWN_FRAME (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+3)
#define FL_GTK_THIN_UP_BOX (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+4)
#define FL_GTK_THIN_DOWN_BOX (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+5)
#define FL_GTK_THIN_UP_FRAME (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+6)
#define FL_GTK_THIN_DOWN_FRAME (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+7)
#define FL_GTK_ROUND_UP_BOX (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+8)
#define FL_GTK_ROUND_DOWN_BOX (Fl_Boxtype)(fl_define_FL_GTK_UP_BOXC()+9)
#define FL_FRAME FL_ENGRAVED_FRAME
#define FL_FRAME_BOX FL_ENGRAVED_BOX
#define FL_CIRCLE_BOX FL_ROUND_DOWN_BOX
#define FL_DIAMOND_BOX FL_DIAMOND_DOWN_BOX
  typedef enum Fl_Labeltype {
    FL_NORMAL_LABEL	= 0,
    FL_NO_LABEL,
    _FL_SHADOW_LABEL,
    _FL_ENGRAVED_LABEL,
    _FL_EMBOSSED_LABEL,
    _FL_MULTI_LABEL,
    _FL_ICON_LABEL,
    _FL_IMAGE_LABEL,

    FL_FREE_LABELTYPE
  } Fl_Labeltype;

#define FL_SYMBOL_LABEL FL_NORMAL_LABEL
#define FL_SHADOW_LABEL fl_define_FL_SHADOW_LABELC()
#define FL_ENGRAVED_LABEL fl_define_FL_ENGRAVED_LABELC()
#define FL_EMBOSSED_LABEL fl_define_FL_EMBOSSED_LABELC()

  typedef unsigned Fl_Align;
  Fl_Align FL_ALIGN_CENTER		= (Fl_Align)0;
  Fl_Align FL_ALIGN_TOP			= (Fl_Align)1;
  Fl_Align FL_ALIGN_BOTTOM		= (Fl_Align)2;
  Fl_Align FL_ALIGN_LEFT		= (Fl_Align)4;
  Fl_Align FL_ALIGN_RIGHT		= (Fl_Align)8;
  Fl_Align FL_ALIGN_INSIDE		= (Fl_Align)16;
  Fl_Align FL_ALIGN_TEXT_OVER_IMAGE	= (Fl_Align)0x0020;
  Fl_Align FL_ALIGN_IMAGE_OVER_TEXT	= (Fl_Align)0x0000;
  Fl_Align FL_ALIGN_CLIP		= (Fl_Align)64;
  Fl_Align FL_ALIGN_WRAP		= (Fl_Align)128;
  Fl_Align FL_ALIGN_IMAGE_NEXT_TO_TEXT	= (Fl_Align)0x0100;
  Fl_Align FL_ALIGN_TEXT_NEXT_TO_IMAGE	= (Fl_Align)0x0120;
  Fl_Align FL_ALIGN_IMAGE_BACKDROP	= (Fl_Align)0x0200;
  Fl_Align FL_ALIGN_LEFT_TOP		= 0x0007;
  Fl_Align FL_ALIGN_RIGHT_TOP		= 0x000b;
  Fl_Align FL_ALIGN_LEFT_BOTTOM		= 0x000d;
  Fl_Align FL_ALIGN_RIGHT_BOTTOM	= 0x000e;
  Fl_Align FL_ALIGN_NOWRAP		= (Fl_Align)0;
  Fl_Align FL_ALIGN_POSITION_MASK	= 0x000f;
  Fl_Align FL_ALIGN_IMAGE_MASK		= 0x0320;

  typedef int Fl_Font;
  Fl_Font FL_HELVETICA              = 0;
  Fl_Font FL_HELVETICA_BOLD         = 1;
  Fl_Font FL_HELVETICA_ITALIC       = 2;
  Fl_Font FL_HELVETICA_BOLD_ITALIC  = 3;
  Fl_Font FL_COURIER                = 4;
  Fl_Font FL_COURIER_BOLD           = 5;
  Fl_Font FL_COURIER_ITALIC         = 6;
  Fl_Font FL_COURIER_BOLD_ITALIC    = 7;
  Fl_Font FL_TIMES                  = 8;
  Fl_Font FL_TIMES_BOLD             = 9;
  Fl_Font FL_TIMES_ITALIC           = 10;
  Fl_Font FL_TIMES_BOLD_ITALIC      = 11;
  Fl_Font FL_SYMBOL                 = 12;
  Fl_Font FL_SCREEN                 = 13;
  Fl_Font FL_SCREEN_BOLD            = 14;
  Fl_Font FL_ZAPF_DINGBATS          = 15;

  Fl_Font FL_FREE_FONT              = 16;
  Fl_Font FL_BOLD                   = 1;
  Fl_Font FL_ITALIC                 = 2;
  Fl_Font FL_BOLD_ITALIC            = 3;

  typedef int Fl_Fontsize;

  Fl_Fontsize FL_NORMAL_SIZE;
  typedef unsigned int Fl_Color;
  Fl_Color FL_FOREGROUND_COLOR  = 0;
  Fl_Color FL_BACKGROUND2_COLOR = 7;
  Fl_Color FL_INACTIVE_COLOR    = 8;
  Fl_Color FL_SELECTION_COLOR   = 15;
  Fl_Color FL_GRAY0   = 32;
  Fl_Color FL_DARK3   = 39;
  Fl_Color FL_DARK2   = 45;
  Fl_Color FL_DARK1   = 47;
  Fl_Color FL_BACKGROUND_COLOR  = 49;
  Fl_Color FL_LIGHT1  = 50;
  Fl_Color FL_LIGHT2  = 52;
  Fl_Color FL_LIGHT3  = 54;

  Fl_Color FL_BLACK   = 56;
  Fl_Color FL_RED     = 88;
  Fl_Color FL_GREEN   = 63;
  Fl_Color FL_YELLOW  = 95;
  Fl_Color FL_BLUE    = 216;
  Fl_Color FL_MAGENTA = 248;
  Fl_Color FL_CYAN    = 223;
  Fl_Color FL_DARK_RED = 72;

  Fl_Color FL_DARK_GREEN    = 60;
  Fl_Color FL_DARK_YELLOW   = 76;
  Fl_Color FL_DARK_BLUE     = 136;
  Fl_Color FL_DARK_MAGENTA  = 152;
  Fl_Color FL_DARK_CYAN     = 140;

  Fl_Color FL_WHITE         = 255;

#define FL_FREE_COLOR     (Fl_Color)16
#define FL_NUM_FREE_COLOR 16
#define FL_GRAY_RAMP      (Fl_Color)32
#define FL_NUM_GRAY       24
#define FL_GRAY           FL_BACKGROUND_COLOR
#define FL_COLOR_CUBE     (Fl_Color)56
#define FL_NUM_RED        5
#define FL_NUM_GREEN      8
#define FL_NUM_BLUE       5

  typedef enum Fl_Cursor {
    FL_CURSOR_DEFAULT	=  0,
    FL_CURSOR_ARROW	= 35,
    FL_CURSOR_CROSS	= 66,
    FL_CURSOR_WAIT	= 76,
    FL_CURSOR_INSERT	= 77,
    FL_CURSOR_HAND	= 31,
    FL_CURSOR_HELP	= 47,
    FL_CURSOR_MOVE	= 27,
    FL_CURSOR_NS	= 78,
    FL_CURSOR_WE	= 79,
    FL_CURSOR_NWSE	= 80,
    FL_CURSOR_NESW	= 81,
    FL_CURSOR_NONE	= 255,
    FL_CURSOR_N		= 70,
    FL_CURSOR_NE	= 69,
    FL_CURSOR_E		= 49,
    FL_CURSOR_SE	=  8,
    FL_CURSOR_S		=  9,
    FL_CURSOR_SW	=  7,
    FL_CURSOR_W		= 36,
    FL_CURSOR_NW	= 68
  } Fl_Cursor;

  enum {
    FL_READ   = 1,
    FL_WRITE  = 4,
    FL_EXCEPT = 8
  };

  typedef enum Fl_Mode {
    FL_RGB		= 0,
    FL_INDEX		= 1,
    FL_SINGLE		= 0,
    FL_DOUBLE		= 2,
    FL_ACCUM		= 4,
    FL_ALPHA		= 8,
    FL_DEPTH		= 16,
    FL_STENCIL		= 32,
    FL_RGB8		= 64,
    FL_MULTISAMPLE	= 128,
    FL_STEREO		= 256,
    FL_FAKE_SINGLE	= 512
  } Fl_Mode;
#define FL_IMAGE_WITH_ALPHA 0x40000000

  typedef enum Fl_Damage {
    FL_DAMAGE_CHILD    = 0x01,
    FL_DAMAGE_EXPOSE   = 0x02,
    FL_DAMAGE_SCROLL   = 0x04,
    FL_DAMAGE_OVERLAY  = 0x08,
    FL_DAMAGE_USER1    = 0x10,
    FL_DAMAGE_USER2    = 0x20,
    FL_DAMAGE_ALL      = 0x80
  } Fl_Damage;

  // FLTK 1.0.x compatibility definitions...
#  ifdef FLTK_1_0_COMPAT
#    define contrast	fl_contrast
#    define down	fl_down
#    define frame	fl_frame
#    define inactive	fl_inactive
#  endif // FLTK_1_0_COMPAT
#endif
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_ROUND_UP_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_SHADOW_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_ROUNDED_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_RFLAT_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_RSHADOW_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_DIAMOND_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_OVAL_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_PLASTIC_UP_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_GTK_UP_BOXC)();
  FL_EXPORT_C(Fl_Boxtype, fl_boxC)(Fl_Boxtype b) ;
  FL_EXPORT_C(Fl_Boxtype, fl_downC)(Fl_Boxtype b) ;
  FL_EXPORT_C(Fl_Boxtype, fl_frameC)(Fl_Boxtype b) ;
  FL_EXPORT_C(Fl_Labeltype, fl_define_FL_SHADOW_LABELC)() ;
  FL_EXPORT_C(Fl_Labeltype, fl_define_FL_ENGRAVED_LABELC)() ;
  FL_EXPORT_C(Fl_Labeltype, fl_define_FL_EMBOSSED_LABELC)() ;
  FL_EXPORT_C(Fl_Align, FL_ALIGN_TOP_LEFTC)();
  FL_EXPORT_C(Fl_Align, FL_ALIGN_TOP_RIGHTC)();
  FL_EXPORT_C(Fl_Align, FL_ALIGN_BOTTOM_LEFTC)();
  FL_EXPORT_C(Fl_Align, FL_ALIGN_BOTTOM_RIGHTC)();
  FL_EXPORT_C(Fl_Color, fl_inactiveC)(Fl_Color c) ;
  FL_EXPORT_C(Fl_Color, fl_contrastC)(Fl_Color fg, Fl_Color bg) ;
  FL_EXPORT_C(Fl_Color, fl_color_averageC)(Fl_Color c1, Fl_Color c2, float weight);
  FL_EXPORT_C(Fl_Color, fl_lighterC)(Fl_Color c);
  FL_EXPORT_C(Fl_Color, fl_darkerC)(Fl_Color c);
  FL_EXPORT_C(Fl_Color, fl_rgb_color_with_rgb_C)(uchar r, uchar g, uchar b);
  FL_EXPORT_C(Fl_Color, fl_rgb_colorC_with_grayscale_C)(uchar g);
  FL_EXPORT_C(Fl_Color, fl_gray_rampC)(int i);
  FL_EXPORT_C(Fl_Color, fl_color_cubeC)(int r, int g, int b);
#ifdef __cplusplus
}
#endif
#endif /*__FL_ENUMERATIONSC__ */
