#ifndef __FLC__
#define __FLC__
#include <stdarg.h>
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_EnumerationsC.h"
#ifdef __cplusplus
#include "FL/Fl.H"
#include "Fl_EnumerationsC.h"
#include "Fl_CallbackC.h"
#include "Fl_WindowC.h"
#include "Fl_Double_WindowC.h"
#include "Fl_ButtonC.h"
#include "Fl_Check_ButtonC.h"
#include "Fl_Radio_ButtonC.h"
#include "Fl_Light_ButtonC.h"
#include "Fl_Toggle_ButtonC.h"
#include "Fl_InputC.h"
#include "Fl_File_InputC.h"
#include "Fl_Float_InputC.h"
#include "Fl_Int_InputC.h"
#include "Fl_Multiline_InputC.h"
#include "Fl_Secret_InputC.h"
#include "Fl_Value_InputC.h"
#include "Fl_Tree_PrefsC.h"
#include "Fl_Tree_ItemC.h"
#include "Fl_TreeC.h"
#include "Fl_PreferencesC.h"
#include "Fl_TableC.h"
#include "Fl_DrawC.h"
#include "Fl_Menu_ItemC.h"
#include "Fl_Menu_C.h"
#include "Fl_Sys_Menu_BarC.h"
EXPORT {
#endif
  typedef enum {
    OPTION_ARROW_FOCUS = 0,
    OPTION_VISIBLE_FOCUS,
    OPTION_DND_TEXT,
    OPTION_SHOW_TOOLTIPS,
    OPTION_LAST
  } Fl_Option;
#ifndef INTERNAL_LINKAGE
#if defined(WIN32) && !defined(__CYGWIN__)
# if defined(_WIN64)
#  define FL_SOCKET unsigned __int64
# else
#  define FL_SOCKET int
# endif
#else
# define FL_SOCKET int
#endif
#endif

  typedef void (fl_Label_Draw_F)(const fl_Label label, int x, int y, int w, int h, Fl_Align align);
  typedef void (fl_Label_Measure_F)(const fl_Label label, int *width, int *height);
  typedef void (fl_Box_Draw_F)(int x, int y, int w, int h, Fl_Color color);
  typedef void (*fl_Timeout_Handler)(void *data);
  typedef void (*fl_Awake_Handler)(void *data);
  typedef void (*fl_Idle_Handler)(void *data);
  typedef void (*fl_Old_Idle_Handler)();
  typedef void (*fl_FD_Handler)(FL_SOCKET fd, void *data);
  typedef int  (*fl_Event_Handler)(int event);
  typedef void (*fl_Abort_Handler)(const char *format, va_list argp);
#ifdef __cplusplus
  typedef int  (*fl_Args_Handler)(int argc, char** argv, int& i);
#else
  typedef int  (*fl_Args_Handler)(int argc, char** argv, int* i);
#endif
  typedef void (*fl_Atclose_Handler)(fl_Window window, void *data);
  typedef int  (*fl_Event_Dispatch)(int event, fl_Window w);

  FL_EXPORT_C(int, Fl_run)();
  FL_EXPORT_C(int, Fl_check)();
  FL_EXPORT_C(int, Fl_ready)();
  FL_EXPORT_C(int, Fl_option)(Fl_Option opt);
  FL_EXPORT_C(void, Fl_set_option)(Fl_Option opt, int val);

  FL_EXPORT_C(int, Fl_add_awake_handler_)(fl_Awake_Handler handler, void* user_data);
  FL_EXPORT_C(int, Fl_get_awake_handler_)(fl_Awake_Handler* handler, void** user_data);
  FL_EXPORT_C(double, Fl_version)();
  FL_EXPORT_C(const char*, Fl_help)();
  FL_EXPORT_C(int, Fl_arg)(int argc, char **argv, int i);
  FL_EXPORT_C(int, Fl_args_with_i)(int argc, char **argv, int i);
  FL_EXPORT_C(void, Fl_args)(int argc, char **argv);
  FL_EXPORT_C(int, Fl_args_with_handler)(int argc,char **argv,int i,fl_Args_Handler cb);
  FL_EXPORT_C(void, Fl_display)(const char* text);
  FL_EXPORT_C(int, Fl_visual)(int mode);
#if !defined(__APPLE__) && HAVE_GL
  FL_EXPORT_C(int, Fl_gl_visual)(int mode);
  FL_EXPORT_C(int, Fl_gl_visual_with_alist)(int mode, int *alist);
#endif
  FL_EXPORT_C(void, Fl_own_colormap)();
  FL_EXPORT_C(void, Fl_get_system_colors)();
  FL_EXPORT_C(void, Fl_foreground)(uchar r, uchar g, uchar b);
  FL_EXPORT_C(void, Fl_background)(uchar r, uchar g, uchar b);
  FL_EXPORT_C(void, Fl_background2)(uchar r, uchar g, uchar b);

  FL_EXPORT_C(const char*,Fl_scheme)();
  FL_EXPORT_C(int        ,Fl_set_scheme)(const char* text);
  FL_EXPORT_C(int        ,Fl_is_scheme)(const char* text);
  FL_EXPORT_C(int        ,Fl_reload_scheme)();
  FL_EXPORT_C(int        ,Fl_scrollbar_size)();
  FL_EXPORT_C(void       ,Fl_set_scrollbar_size)(int W);
  FL_EXPORT_C(int        ,Fl_wait)();
  FL_EXPORT_C(double     ,Fl_set_wait)(double time);
  FL_EXPORT_C(fl_Widget  ,Fl_readqueue)();
  FL_EXPORT_C(void       ,Fl_add_timeout)(double t,fl_Timeout_Handler handler);
  FL_EXPORT_C(void       ,Fl_add_timeout_with_userdata)(double t,fl_Timeout_Handler handler, void* userdata);
  FL_EXPORT_C(void       ,Fl_repeat_timeout)(double t,fl_Timeout_Handler handler);
  FL_EXPORT_C(void       ,Fl_repeat_timeout_with_userdata)(double t,fl_Timeout_Handler handler,void* userdata);
  FL_EXPORT_C(int        ,Fl_has_timeout)(fl_Timeout_Handler handler);
  FL_EXPORT_C(int        ,Fl_has_timeout_with_userdata)(fl_Timeout_Handler handler, void* userdata);
  FL_EXPORT_C(void       ,Fl_remove_timeout)(fl_Timeout_Handler handler);
  FL_EXPORT_C(void       ,Fl_remove_timeout_with_userdata)(fl_Timeout_Handler handler,void* userdata);
  FL_EXPORT_C(void       ,Fl_add_check)(fl_Timeout_Handler handler);
  FL_EXPORT_C(void       ,Fl_add_check_with_userdata)(fl_Timeout_Handler handler,void* userdata);
  FL_EXPORT_C(int        ,Fl_has_check)(fl_Timeout_Handler handler);
  FL_EXPORT_C(int        ,Fl_has_check_with_userdata)(fl_Timeout_Handler handler, void* userdata);
  FL_EXPORT_C(void       ,Fl_remove_check)(fl_Timeout_Handler handler);
  FL_EXPORT_C(void       ,Fl_remove_check_with_userdata)(fl_Timeout_Handler handler,void* userdata);
  FL_EXPORT_C(void       ,Fl_add_fd_with_when)(int fd,int when,fl_FD_Handler cb);
  FL_EXPORT_C(void       ,Fl_add_fd_with_when_userdata)(int fd,int when,fl_FD_Handler cb,void* userdata);
  FL_EXPORT_C(void       ,Fl_add_fd)(int fd,fl_FD_Handler cb);
  FL_EXPORT_C(void       ,Fl_add_fd_with_userdata)(int fd,fl_FD_Handler cb,void* userdata);
  FL_EXPORT_C(void       ,Fl_remove_fd_with_when)(int fd_handle,int when);
  FL_EXPORT_C(void       ,Fl_remove_fd)(int fd_handle);
  FL_EXPORT_C(void       ,Fl_add_idle)(fl_Idle_Handler cb);
  FL_EXPORT_C(void       ,Fl_add_idle_with_userdata)(fl_Idle_Handler cb,void* userdata);
  FL_EXPORT_C(int        ,Fl_has_idle)(fl_Idle_Handler cb);
  FL_EXPORT_C(int        ,Fl_has_idle_with_userdata)(fl_Idle_Handler cb, void* userdata);
  FL_EXPORT_C(void       ,Fl_remove_idle)(fl_Idle_Handler cb);
  FL_EXPORT_C(void       ,Fl_remove_idle_with_userdata)(fl_Idle_Handler cb,void* data);
  FL_EXPORT_C(int        ,Fl_damage)();
  FL_EXPORT_C(void       ,Fl_redraw)();
  FL_EXPORT_C(void       ,Fl_flush)();
  FL_EXPORT_C(fl_Window  ,Fl_first_window)();
  FL_EXPORT_C(void       ,Fl_set_first_window)(fl_Window window);
  FL_EXPORT_C(fl_Window  ,Fl_next_window)(fl_Window window);
  FL_EXPORT_C(fl_Window  ,Fl_modal)();
  FL_EXPORT_C(fl_Window  ,Fl_grab)();
  FL_EXPORT_C(void       ,Fl_set_grab)(fl_Window window);
  FL_EXPORT_C(int        ,Fl_event)();
  FL_EXPORT_C(int        ,Fl_event_x)();
  FL_EXPORT_C(int        ,Fl_event_y)();
  FL_EXPORT_C(int        ,Fl_event_x_root)();
  FL_EXPORT_C(int        ,Fl_event_y_root)();
  FL_EXPORT_C(int        ,Fl_event_dx)();
  FL_EXPORT_C(int        ,Fl_event_dy)();
  FL_EXPORT_C(void       ,Fl_get_mouse)(int* x, int* y);
  FL_EXPORT_C(int        ,Fl_event_clicks)();
  FL_EXPORT_C(void       ,Fl_set_event_clicks)(int i);
  FL_EXPORT_C(int        ,Fl_event_is_click)();
  FL_EXPORT_C(void       ,Fl_set_event_is_click)(int i);
  FL_EXPORT_C(int        ,Fl_event_button)();
  FL_EXPORT_C(int        ,Fl_event_state)();
  FL_EXPORT_C(int        ,Fl_contains_event_state)(int i);
  FL_EXPORT_C(int        ,Fl_event_key)();
  FL_EXPORT_C(int        ,Fl_event_original_key)();
  FL_EXPORT_C(int        ,Fl_event_key_pressed)(int key);
  FL_EXPORT_C(int        ,Fl_get_key)(int key);
  FL_EXPORT_C(const char*,Fl_event_text)();
  FL_EXPORT_C(int        ,Fl_event_length)();
  FL_EXPORT_C(int        ,Fl_compose)(int* del);
  FL_EXPORT_C(void       ,Fl_compose_reset)();
  FL_EXPORT_C(int        ,Fl_event_inside_region)(int X,int Y,int W,int H);
  FL_EXPORT_C(int        ,Fl_event_inside_widget)(fl_Widget widget);
  FL_EXPORT_C(int        ,Fl_test_shortcut)(Fl_Shortcut shortcut);
  FL_EXPORT_C(void       ,Fl_enable_im)();
  FL_EXPORT_C(void       ,Fl_disable_im)();
  FL_EXPORT_C(int        ,Fl_handle)(int event,fl_Window window);
  FL_EXPORT_C(int        ,Fl_handle_)(int event,fl_Window window);
  FL_EXPORT_C(fl_Widget  ,Fl_belowmouse)();
  FL_EXPORT_C(void       ,Fl_set_belowmouse)(fl_Widget widget);
  FL_EXPORT_C(fl_Widget  ,Fl_pushed)();
  FL_EXPORT_C(void       ,Fl_set_pushed)(fl_Widget widget);
  FL_EXPORT_C(fl_Widget  ,Fl_focus)();
  FL_EXPORT_C(void       ,Fl_set_focus)(fl_Widget widget);
  FL_EXPORT_C(void       ,Fl_add_handler)(fl_Event_Handler h);
  FL_EXPORT_C(void       ,Fl_remove_handler)(fl_Event_Handler h);
  FL_EXPORT_C(void              ,Fl_set_event_dispatch)(fl_Event_Dispatch* d);
  FL_EXPORT_C(fl_Event_Dispatch ,Fl_event_dispatch)();
  FL_EXPORT_C(void      ,Fl_copy)(const char* stuff,int len);
  FL_EXPORT_C(void      ,Fl_copy_with_destination)(const char* stuff,int len,int destination);
  FL_EXPORT_C(void      ,Fl_paste_with_source)(fl_Widget receiver,int source);
  FL_EXPORT_C(int       ,Fl_dnd)();
  FL_EXPORT_C(fl_Widget ,Fl_selection_owner)();
  FL_EXPORT_C(void      ,Fl_set_selection_owner)(fl_Widget widget);
  FL_EXPORT_C(void      ,Fl_selection)(fl_Widget owner,const char* text,int len);
  FL_EXPORT_C(void      ,Fl_paste)(fl_Widget receiver);
  FL_EXPORT_C(int       ,Fl_x)();
  FL_EXPORT_C(int       ,Fl_y)();
  FL_EXPORT_C(int       ,Fl_w)();
  FL_EXPORT_C(int       ,Fl_h)();
  FL_EXPORT_C(int               ,Fl_screen_count)();
  FL_EXPORT_C(void              ,Fl_screen_xywh)(int* X,int* Y,int* W,int* H);
  FL_EXPORT_C(void              ,Fl_screen_xywh_with_mxmy)(int* X,int* Y,int* W,int* H,int mx,int my);
  FL_EXPORT_C(void              ,Fl_screen_xywh_with_n)(int* X,int* Y,int* W,int* H,int n);
  FL_EXPORT_C(void              ,Fl_screen_xywh_with_mxmymwmh)(int* X,int* Y,int* W,int* H,int mx,int my,int mw,int mh);
  FL_EXPORT_C(void              ,Fl_screen_dpi)(float* h,float* v);
  FL_EXPORT_C(void              ,Fl_screen_dpi_with_n)(float* h,float* v,int n);
  FL_EXPORT_C(void              ,Fl_screen_work_area_with_mx_my)(int* X,int* Y,int* W,int* H,int mx,int my);
  FL_EXPORT_C(void              ,Fl_screen_work_area_with_n)(int* X,int* Y,int* W,int* H,int n);
  FL_EXPORT_C(void              ,Fl_screen_work_area)(int* X,int* Y,int* W,int* H);
  FL_EXPORT_C(void              ,Fl_set_color_rgb)(Fl_Color color,uchar r,uchar g,uchar b);
  FL_EXPORT_C(void              ,Fl_set_color)(Fl_Color i,unsigned c);
  FL_EXPORT_C(unsigned          ,Fl_get_color)(Fl_Color i);
  FL_EXPORT_C(void              ,Fl_get_color_rgb)(Fl_Color i,uchar *red,uchar *green,uchar *blue);
#if !defined(__APPLE__)
  FL_EXPORT_C(void              ,Fl_free_color)(Fl_Color i);
  FL_EXPORT_C(void              ,Fl_free_color_with_overlay)(Fl_Color i,int overlay);
#endif
  FL_EXPORT_C(const char*       ,Fl_get_font)(Fl_Font font);
  FL_EXPORT_C(const char*       ,Fl_get_font_name)(Fl_Font font);
  FL_EXPORT_C(const char*       ,Fl_get_font_name_with_attributes)(Fl_Font font,int* attributes);
  FL_EXPORT_C(int               ,Fl_get_font_sizes)(Fl_Font font,int* sizep);
  FL_EXPORT_C(void              ,Fl_set_font_by_string)(Fl_Font font,const char* fontString);
  FL_EXPORT_C(void              ,Fl_set_font_by_font)(Fl_Font to,Fl_Font from);
  FL_EXPORT_C(Fl_Font           ,Fl_set_fonts)();
  FL_EXPORT_C(Fl_Font           ,Fl_set_fonts_with_string)(const char* string);
  FL_EXPORT_C(void              ,Fl_set_labeltype)(Fl_Labeltype labeltype,fl_Label_Draw_F* label_draw_f,fl_Label_Measure_F* label_measure_f);
  /* FL_EXPORT_C(void              ,Fl_set_labeltype_by_labeltype)(Fl_Labeltype to,Fl_Labeltype from); */
  FL_EXPORT_C(fl_Box_Draw_F*    ,Fl_get_boxtype)(Fl_Boxtype boxtype);
  FL_EXPORT_C(void              ,Fl_set_boxtype)(Fl_Boxtype boxtype,fl_Box_Draw_F* box_draw_f,uchar offsetX,uchar offsetY,uchar offsetW,uchar offsetH);
  FL_EXPORT_C(void              ,Fl_set_boxtype_by_boxtype)(Fl_Boxtype to,Fl_Boxtype from);
  FL_EXPORT_C(int               ,Fl_box_dx)(Fl_Boxtype boxtype);
  FL_EXPORT_C(int               ,Fl_box_dy)(Fl_Boxtype boxtype);
  FL_EXPORT_C(int               ,Fl_box_dw)(Fl_Boxtype boxtype);
  FL_EXPORT_C(int               ,Fl_box_dh)(Fl_Boxtype boxtype);
  FL_EXPORT_C(int               ,Fl_draw_box_active)();
  FL_EXPORT_C(void              ,Fl_default_atclose)(fl_Window window,void* data);
  FL_EXPORT_C(void              ,Fl_set_atclose)(fl_Atclose_Handler* f);
  FL_EXPORT_C(int               ,Fl_event_shift)();
  FL_EXPORT_C(int               ,Fl_event_ctrl)();
  FL_EXPORT_C(int               ,Fl_event_command)();
  FL_EXPORT_C(int               ,Fl_event_alt)();
  FL_EXPORT_C(int               ,Fl_event_buttons)();
  FL_EXPORT_C(int               ,Fl_event_button1)();
  FL_EXPORT_C(int               ,Fl_event_button2)();
  FL_EXPORT_C(int               ,Fl_event_button3)();
  FL_EXPORT_C(void              ,Fl_set_idle)(fl_Old_Idle_Handler cb);
  FL_EXPORT_C(void              ,Fl_release)();
  FL_EXPORT_C(void              ,Fl_set_visible_focus)(int v);
  FL_EXPORT_C(int               ,Fl_visible_focus)();
  FL_EXPORT_C(void              ,Fl_set_dnd_text_ops)(int v);
  FL_EXPORT_C(int               ,Fl_dnd_text_ops)();
  FL_EXPORT_C(int               ,Fl_lock)();
  FL_EXPORT_C(void              ,Fl_unlock)();
  FL_EXPORT_C(void              ,Fl_awake)();
  FL_EXPORT_C(void              ,Fl_awake_with_message)(void* message);
  FL_EXPORT_C(int               ,Fl_awake_with_cb)(fl_Awake_Handler cb);
  FL_EXPORT_C(int               ,Fl_awake_with_cb_message)(fl_Awake_Handler cb, void* message);
  FL_EXPORT_C(void*             ,Fl_thread_message)();
  FL_EXPORT_C(void              ,Fl_delete_widget)(fl_Widget w);
  FL_EXPORT_C(void              ,Fl_do_widget_deletion)();
  FL_EXPORT_C(void              ,Fl_watch_widget_pointer)(fl_Widget w);
  FL_EXPORT_C(void              ,Fl_release_widget_pointer)(fl_Widget w);
  FL_EXPORT_C(void              ,Fl_clear_widget_pointer)(fl_Widget w);
  FL_EXPORT_C(void              ,Fl_clear_widget_pointer)(fl_Widget w);
#if FL_API_VERSION == 10304
  FL_EXPORT_C(void              ,Fl_set_box_color)(Fl_Color c);
  FL_EXPORT_C(Fl_Color          ,Fl_box_color)(Fl_Color c);
  FL_EXPORT_C(int               ,Fl_abi_version)();
  FL_EXPORT_C(int               ,Fl_api_version)();
  FL_EXPORT_C(const char*       ,Fl_local_ctrl)();
  FL_EXPORT_C(const char*       ,Fl_local_meta)();
  FL_EXPORT_C(const char*       ,Fl_local_alt)();
  FL_EXPORT_C(const char*       ,Fl_local_shift)();
#endif
#ifdef __cplusplus
}
#endif
#endif /*__FLC__ */
