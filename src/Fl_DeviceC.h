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
  // Fl_Font_Descriptor
/*   FL_EXPORT_C(fl_Font_Descriptor,  Fl_Font_Descriptor_get_next)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(Fl_Fontsize,         Fl_Font_Descriptor_get_size)(fl_Font_Descriptor font_descriptor); */
/* #  ifdef WIN3 */
/*   FL_EXPORT_C(HFONT,               Fl_Font_Descriptor_get_fid)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(int*,                Fl_Font_Descriptor_get_width)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(TEXTMETRIC,          Fl_Font_Descriptor_get_metr)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(int,                 Fl_Font_Descriptor_get_angle)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(fl_Font_Descriptor,  Fl_Font_Descriptor_New)(const char* fontname, Fl_Fontsize size); */
/* #  elif defined(__APPLE_QUARTZ__) */
/*   FL_EXPORT_C(fl_Font_Descriptor,  Fl_Font_Descriptor_New)(const char* fontname, Fl_Fontsize size); */
/*   FL_EXPORT_C(ATSUTextLayout,      Fl_Font_Descriptor_get_layout)(fl_Font_Descriptor font_descriptor); */
/* #     if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5 */
/*   FL_EXPORT_C(CTFontRef,           Fl_Font_Descriptor_get_fontref)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(float*,              Fl_Font_Descriptor_get_width)(fl_Font_Descriptor font_descriptor); */
/* #     endif */
/*   FL_EXPORT_C(ATSUStyle, Fl_Font_Descriptor_get_style)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(short, Fl_Font_Descriptor_get_ascent)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(short, Fl_Font_Descriptor_get_descent)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(short, Fl_Font_Descriptor_get_q_width)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(char*, Fl_Font_Descriptor_get_q_name)(fl_Font_Descriptor font_descriptor); */
/* #  elif USE_XFT */
/*   FL_EXPORT_C(XftFont*, Fl_Font_Descriptor_get_font)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(int, Fl_Font_Descriptor_get_angle)(fl_Font_Descriptor font_descriptor); */
/*   FL_EXPORT_C(fl_Font_Descriptor,  Fl_Font_Descriptor_New)(const char* xfontname, Fl_Fontsize size, int angle); */
/* #  else */
/*   FL_EXPORT_C(XUtf8FontStruct*, Fl_Font_Descriptor_get_font)(fl_Font_Descriptor font_descriptor);	// X UTF-8 font information */
/*   FL_EXPORT_C(fl_Font_Descriptor,  Fl_Font_Descriptor_New)(const char* fontname); */
/* #  endif */
/* #  if HAVE_GL */
/*   FL_EXPORT_C(unsigned int, Fl_Font_Descriptor_get_listbase)(fl_Font_Descriptor font_descriptor); */
/* #ifndef __APPLE_QUARTZ__ */
/*   FL_EXPORT_C(char, Fl_Font_Descriptor_get_glok)(fl_Font_Descriptor font_descriptor); */
/* #endif // __APPLE_QUARTZ__ */
/* #  endif // HAVE_GL */
/*   FL_EXPORT_C(void,  Fl_Font_Descriptor_Destroy)(fl_Font_Descriptor font_descriptor); */

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
  FL_EXPORT_C(Fl_Font_Descriptor*, Fl_Graphics_Driver_font_descriptor)(fl_Graphics_Driver graphics_driver); 
  FL_EXPORT_C(void, Fl_Graphics_Driver_set_font_descriptor)(fl_Graphics_Driver graphics_driver,Fl_Font_Descriptor* d); 
  FL_EXPORT_C(void, Fl_Graphics_Driver_Destroy)(fl_Graphics_Driver graphics_driver);

  // Fl_Surface_Device
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_id)();
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_name)(fl_Surface_Device surface_device);
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_id)();
  FL_EXPORT_C(const char*, Fl_Surface_Device_class_name)(fl_Surface_Device surface_device);
  FL_EXPORT_C(void, Fl_Surface_Device_set_current)(fl_Surface_Device surface_device);
  FL_EXPORT_C(void, Fl_Surface_Device_set_driver)(fl_Surface_Device surface_device,fl_Surface_Device new_surface_device);
  FL_EXPORT_C(fl_Surface_Device, Fl_Surface_Device_driver)(fl_Surface_Device surface_device);
  FL_EXPORT_C(fl_Surface_Device, Fl_Surface_Device_surface)(); 
  FL_EXPORT_C(void, Fl_Surface_Device_Destroy)(fl_Surface_Device surface_device);
#ifdef __cplusplus
}
#endif
#endif /* __Fl_DeviceC__ */
