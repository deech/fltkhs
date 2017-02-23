#ifndef __Fl_DeviceC__
#define __Fl_DeviceC__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// X is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/Fl_Device.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  //Fl_Graphics_Driver
  FL_EXPORT_C(const char*, Fl_Graphics_Driver_class_id)();
  FL_EXPORT_C(const char*, Fl_Graphics_Driver_class_name)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(const char*, Fl_Graphics_Driver_class_id)();
  FL_EXPORT_C(const char*, Fl_Graphics_Driver_class_name)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(void, Fl_Graphics_Driver_set_font)(fl_Graphics_Driver graphics_driver,Fl_Font face, Fl_Fontsize fsize);
  FL_EXPORT_C(Fl_Font, Fl_Graphics_Driver_font)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(Fl_Fontsize, Fl_Graphics_Driver_size)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(double, Fl_Graphics_Driver_width)(fl_Graphics_Driver graphics_driver,const char* str, int n);
  FL_EXPORT_C(double, Fl_Graphics_Driver_width_with_c)(fl_Graphics_Driver graphics_driver,unsigned int c);
  FL_EXPORT_C(void, Fl_Graphics_Driver_text_extents)(fl_Graphics_Driver graphics_driver,const char*, int n, int* dx, int* dy, int* w, int* h);;
  FL_EXPORT_C(int, Fl_Graphics_Driver_height)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(int, Fl_Graphics_Driver_descent)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(Fl_Color, Fl_Graphics_Driver_color)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(fl_Font_Descriptor, Fl_Graphics_Driver_font_descriptor)(fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(void, Fl_Graphics_Driver_set_font_descriptor)(fl_Graphics_Driver graphics_driver,fl_Font_Descriptor d);
#if FL_API_VERSION == 10304
  FL_EXPORT_C(int, fl_Graphics_Driver_draw_scaled)(fl_Graphics_Driver graphics_driver, fl_Image i,int X, int Y, int W, int H);
#endif
  FL_EXPORT_C(void, Fl_Graphics_Driver_Destroy)(fl_Graphics_Driver graphics_driver);

  // Fl_Surface_Device
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_id)();
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_name)(fl_Surface_Device surface_device);
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_id)();
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_name)(fl_Surface_Device surface_device);
  FL_EXPORT_C(void, Fl_Surface_Device_set_current)(fl_Surface_Device surface_device);
  FL_EXPORT_C(void, Fl_Surface_Device_set_driver)(fl_Surface_Device surface_device,fl_Graphics_Driver graphics_driver);
  FL_EXPORT_C(fl_Graphics_Driver, Fl_Surface_Device_driver)(fl_Surface_Device surface_device);
  FL_EXPORT_C(fl_Surface_Device, Fl_Surface_Device_surface)();
  FL_EXPORT_C(void, Fl_Surface_Device_Destroy)(fl_Surface_Device surface_device);
#ifdef __cplusplus
}
#endif
#endif /* __Fl_DeviceC__ */
