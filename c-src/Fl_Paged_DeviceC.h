#ifndef __Fl_PAGED_DEVICE_C_
#define __Fl_PAGED_DEVICE_C_
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// X is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Paged_Device.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  // Inherited from Fl_Surface_Driver
  FL_EXPORT_C(const char*, Fl_Paged_Device_class_id)();
  FL_EXPORT_C(const char*, Fl_Paged_Device_class_name)(fl_Paged_Device paged_device);
  FL_EXPORT_C(void, Fl_Paged_Device_set_current)(fl_Paged_Device paged_device);
  FL_EXPORT_C(void, Fl_Paged_Device_set_driver)(fl_Paged_Device paged_device,fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(fl_Graphics_Driver, Fl_Paged_Device_driver)(fl_Paged_Device paged_device);
  FL_EXPORT_C(fl_Surface_Device, Fl_Paged_Device_surface)();
  // Fl_Paged_Device specific
  FL_EXPORT_C(int, Fl_Paged_Device_start_job)(fl_Paged_Device paged_device,int pagecount);
  FL_EXPORT_C(int, Fl_Paged_Device_start_job_with_frompage)(fl_Paged_Device paged_device,int pagecount, int* frompage);
  FL_EXPORT_C(int, Fl_Paged_Device_start_job_with_topage)(fl_Paged_Device paged_device,int pagecount, int* topage);
  FL_EXPORT_C(int, Fl_Paged_Device_start_job_with_frompage_topage)(fl_Paged_Device paged_device,int pagecount, int* frompage, int* topage);
  FL_EXPORT_C(int, Fl_Paged_Device_start_page)(fl_Paged_Device paged_device);
  FL_EXPORT_C(int, Fl_Paged_Device_printable_rect)(fl_Paged_Device paged_device,int* w, int* h);
  FL_EXPORT_C(void, Fl_Paged_Device_margins)(fl_Paged_Device paged_device,int* left, int* top, int* right, int* bottom);
  FL_EXPORT_C(void, Fl_Paged_Device_origin)(fl_Paged_Device paged_device,int* x, int* y);
  FL_EXPORT_C(void, Fl_Paged_Device_scale)(fl_Paged_Device paged_device,float scale_x);
  FL_EXPORT_C(void, Fl_Paged_Device_scale_with_scaly_y)(fl_Paged_Device paged_device,float scale_x, float scale_y);
  FL_EXPORT_C(void, Fl_Paged_Device_rotate)(fl_Paged_Device paged_device,float angle);
  FL_EXPORT_C(void, Fl_Paged_Device_translate)(fl_Paged_Device paged_device,int x, int y);
  FL_EXPORT_C(void, Fl_Paged_Device_untranslate)(fl_Paged_Device paged_device);
  FL_EXPORT_C(void, Fl_Paged_Device_print_widget)(fl_Paged_Device paged_device,fl_Widget widget);
  FL_EXPORT_C(void, Fl_Paged_Device_print_widget_with_delta_x)(fl_Paged_Device paged_device,fl_Widget widget, int delta_x);
  FL_EXPORT_C(void, Fl_Paged_Device_print_widget_with_delta_y)(fl_Paged_Device paged_device,fl_Widget widget, int delta_y);
  FL_EXPORT_C(void, Fl_Paged_Device_print_widget_with_delta_x_delta_y)(fl_Paged_Device paged_device,fl_Widget widget, int delta_x, int delta_y);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window)(fl_Paged_Device paged_device,fl_Window win);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_with_x_offset)(fl_Paged_Device paged_device,fl_Window win, int x_offset);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_with_y_offset)(fl_Paged_Device paged_device,fl_Window win, int y_offset);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_with_x_offset_y_offset)(fl_Paged_Device paged_device,fl_Window win, int x_offset, int y_offset);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_part)(fl_Paged_Device paged_device,fl_Window win, int x, int y, int w, int h);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_part_with_delta_x)(fl_Paged_Device paged_device,fl_Window win, int x, int y, int w, int h, int delta_x);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_part_with_delta_y)(fl_Paged_Device paged_device,fl_Window win, int x, int y, int w, int h, int delta_y);
  FL_EXPORT_C(void, Fl_Paged_Device_print_window_part_with_delta_xy)(fl_Paged_Device paged_device,fl_Window win, int x, int y, int w, int h, int delta_x, int delta_y);
  FL_EXPORT_C(int,  Fl_Paged_Device_end_page)(fl_Paged_Device paged_device);
  FL_EXPORT_C(void, Fl_Paged_Device_end_job)(fl_Paged_Device paged_device);
#ifdef __cplusplus
}
#endif
#endif /* __Fl_PAGED_DEVICE_C_ */
