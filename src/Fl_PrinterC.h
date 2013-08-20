#ifndef __FL_PRINTER_C__
#define __FL_PRINTER_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Printer.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  // Inherited from Fl_Surface_Driver
  FL_EXPORT_C(const char*, Fl_Printer_class_id)();
  FL_EXPORT_C(const char*, Fl_Printer_class_name)(fl_Printer printer);
  FL_EXPORT_C(void, Fl_Printer_set_current)(fl_Printer printer);
  FL_EXPORT_C(fl_Graphics_Driver, Fl_Printer_driver)(fl_Printer printer);
  FL_EXPORT_C(fl_Surface_Device, Fl_Printer_surface)();
  // Inherited from Fl_Printer
  FL_EXPORT_C(int, Fl_Printer_start_job)(fl_Printer printer,int pagecount);
  FL_EXPORT_C(int, Fl_Printer_start_job_with_frompage)(fl_Printer printer,int pagecount, int* frompage);
  FL_EXPORT_C(int, Fl_Printer_start_job_with_topage)(fl_Printer printer,int pagecount, int* topage);
  FL_EXPORT_C(int, Fl_Printer_start_job_with_frompage_topage)(fl_Printer printer,int pagecount, int* frompage, int* topage);
  FL_EXPORT_C(int, Fl_Printer_start_page)(fl_Printer printer);
  FL_EXPORT_C(int, Fl_Printer_printable_rect)(fl_Printer printer,int* w, int* h);
  FL_EXPORT_C(void, Fl_Printer_margins)(fl_Printer printer,int* left, int* top, int* right, int* bottom);
  FL_EXPORT_C(void, Fl_Printer_origin)(fl_Printer printer,int* x, int* y);
  FL_EXPORT_C(void, Fl_Printer_scale)(fl_Printer printer,float scale_x);
  FL_EXPORT_C(void, Fl_Printer_scale_with_scale_y)(fl_Printer printer,float scale_x, float scale_y);
  FL_EXPORT_C(void, Fl_Printer_rotate)(fl_Printer printer,float angle);
  FL_EXPORT_C(void, Fl_Printer_translate)(fl_Printer printer,int x, int y);
  FL_EXPORT_C(void, Fl_Printer_untranslate)(fl_Printer printer);
  FL_EXPORT_C(void, Fl_Printer_print_widget)(fl_Printer printer,fl_Widget widget);
  FL_EXPORT_C(void, Fl_Printer_print_widget_with_delta_x)(fl_Printer printer,fl_Widget widget, int delta_x);
  FL_EXPORT_C(void, Fl_Printer_print_widget_with_delta_y)(fl_Printer printer,fl_Widget widget, int delta_y);
  FL_EXPORT_C(void, Fl_Printer_print_widget_with_delta_x_delta_y)(fl_Printer printer,fl_Widget widget, int delta_x, int delta_y);
  FL_EXPORT_C(void, Fl_Printer_print_window)(fl_Printer printer,fl_Window win);
  FL_EXPORT_C(void, Fl_Printer_print_window_with_x_offset)(fl_Printer printer,fl_Window win, int x_offset);
  FL_EXPORT_C(void, Fl_Printer_print_window_with_y_offset)(fl_Printer printer,fl_Window win, int y_offset);
  FL_EXPORT_C(void, Fl_Printer_print_window_with_x_offset_y_offset)(fl_Printer printer,fl_Window win, int x_offset, int y_offset);
  FL_EXPORT_C(void, Fl_Printer_print_window_part)(fl_Printer printer,fl_Window win, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Printer_print_window_part_with_delta_x)(fl_Printer printer,fl_Window win, int x, int y, int w, int h, int delta_x);
  FL_EXPORT_C(void, Fl_Printer_print_window_part_with_delta_y)(fl_Printer printer,fl_Window win, int x, int y, int w, int h, int delta_y);
  FL_EXPORT_C(void, Fl_Printer_print_window_part_with_delta_xy)(fl_Printer printer,fl_Window win, int x, int y, int w, int h, int delta_x, int delta_y);
  FL_EXPORT_C(int,  Fl_Printer_end_page)(fl_Printer printer);
  FL_EXPORT_C(void, Fl_Printer_end_job)(fl_Printer printer);
  FL_EXPORT_C(fl_Printer, Fl_Printer_New)();
  FL_EXPORT_C(void, Fl_Printer_Destroy)(fl_Printer printer);
#ifdef __cplusplus
}
#endif
#endif /* __FL_PRINTER_C__ */
