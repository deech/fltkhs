#include "Fl_DeviceC.h"
#ifdef __cplusplus
EXPORT {
#endif
FL_EXPORT_C(const char*,Fl_Graphics_Driver_class_id)( ){
 return Fl_Graphics_Driver::class_id;
}
FL_EXPORT_C(const char*,Fl_Graphics_Driver_class_name)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->class_name();
}
FL_EXPORT_C(void,Fl_Graphics_Driver_set_font)(fl_Graphics_Driver graphics_driver,Fl_Font face,Fl_Fontsize fsize){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font(face,fsize);
}
FL_EXPORT_C(Fl_Font,Fl_Graphics_Driver_font)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font();
}
FL_EXPORT_C(Fl_Fontsize,Fl_Graphics_Driver_size)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->size();
}
FL_EXPORT_C(double,Fl_Graphics_Driver_width)(fl_Graphics_Driver graphics_driver,const char* str,int n){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->width(str,n);
}
FL_EXPORT_C(double,Fl_Graphics_Driver_width_with_c)(fl_Graphics_Driver graphics_driver,unsigned int c){
  return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->width(c);
}
FL_EXPORT_C(void,Fl_Graphics_Driver_text_extents)(fl_Graphics_Driver graphics_driver,const char* c,int n,int* dx,int* dy,int* w,int* h){
  return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->text_extents(c,n,*dx,*dy,*w,*h);
}
FL_EXPORT_C(int,Fl_Graphics_Driver_height)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->height();
}
FL_EXPORT_C(int,Fl_Graphics_Driver_descent)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->descent();
}
FL_EXPORT_C(Fl_Color,Fl_Graphics_Driver_color)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->color();
}
FL_EXPORT_C(Fl_Font_Descriptor*,Fl_Graphics_Driver_font_descriptor)(fl_Graphics_Driver graphics_driver){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font_descriptor();
}
FL_EXPORT_C(void,Fl_Graphics_Driver_set_font_descriptor)(fl_Graphics_Driver graphics_driver,Fl_Font_Descriptor* d){
 return (static_cast<Fl_Graphics_Driver*>(graphics_driver))->font_descriptor(d);
}
FL_EXPORT_C(void,Fl_Graphics_Driver_Destroy)(fl_Graphics_Driver graphics_driver){
 delete (static_cast<Fl_Graphics_Driver*>(graphics_driver));
}
FL_EXPORT_C(const char*,Fl_Surface_Device_class_id)( ){
 return Fl_Surface_Device::class_id;
}
FL_EXPORT_C(const char*,Fl_Surface_Device_class_name)(fl_Surface_Device surface_device){
 return (static_cast<Fl_Surface_Device*>(surface_device))->class_name();
}
FL_EXPORT_C(void,Fl_Surface_Device_set_current)(fl_Surface_Device surface_device){
 return (static_cast<Fl_Surface_Device*>(surface_device))->set_current();
}
FL_EXPORT_C(void,Fl_Surface_Device_set_driver)(fl_Surface_Device surface_device,fl_Graphics_Driver graphics_driver){
  return (static_cast<Fl_Surface_Device*>(surface_device))->driver((static_cast<Fl_Graphics_Driver*>(graphics_driver)));
}
FL_EXPORT_C(fl_Surface_Device,Fl_Surface_Device_driver)(fl_Surface_Device surface_device){
 return (fl_Surface_Device)(static_cast<Fl_Surface_Device*>(surface_device))->driver();
}
FL_EXPORT_C(fl_Surface_Device,Fl_Surface_Device_surface)(){
 return Fl_Surface_Device::surface();
}
FL_EXPORT_C(void,Fl_Surface_Device_Destroy)(fl_Surface_Device surface_device){
 delete (static_cast<Fl_Surface_Device*>(surface_device));
}
//   FL_EXPORT_C(fl_Font_Descriptor,Fl_Font_Descriptor_get_next)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->next;
//   }
//   FL_EXPORT_C(Fl_Fontsize,Fl_Font_Descriptor_get_size)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->size;
//   }
// #ifdef WIN32
//   FL_EXPORT_C(HFONT,Fl_Font_Descriptor_get_fid)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->fid;
//   }
//   FL_EXPORT_C(int*,Fl_Font_Descriptor_get_width)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->width;
//   }
//   FL_EXPORT_C(TEXTMETRIC,Fl_Font_Descriptor_get_metr)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->metr;
//   }
//   FL_EXPORT_C(int,Fl_Font_Descriptor_get_angle)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->angle;
//   }
//   FL_EXPORT_C(fl_Font_Descriptor,Fl_Font_Descriptor_New)(const char* fontname,Fl_Fontsize size){
//     Fl_Font_Descriptor* d = new Fl_Font_Descriptor(fontname,size);
//     return (fl_Font_Descriptor)d;
//   }
// #elif defined(__APPLE_QUARTZ__)
//   FL_EXPORT_C(fl_Font_Descriptor,Fl_Font_Descriptor_New)(const char* fontname,Fl_Fontsize size){
//     Fl_Font_Descriptor* d = new Fl_Font_Descriptor(fontname,size);
//     return (fl_Font_Descriptor)d;
//   }
//   FL_EXPORT_C(ATSUTextLayout,Fl_Font_Descriptor_get_layout)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->layout;
//   }
// #if MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_5
//   FL_EXPORT_C(CTFontRef,Fl_Font_Descriptor_get_fontref)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->fontref;
//   }
//   FL_EXPORT_C(float*,Fl_Font_Descriptor_get_width)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->width;
//   }
// #endif
//   FL_EXPORT_C(ATSUStyle,Fl_Font_Descriptor_get_style)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->style;
//   }
//   FL_EXPORT_C(short,Fl_Font_Descriptor_get_ascent)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->ascent;
//   }
//   FL_EXPORT_C(short,Fl_Font_Descriptor_get_descent)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->descent;
//   }
//   FL_EXPORT_C(short,Fl_Font_Descriptor_get_q_width)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->q_width;
//   }
//   FL_EXPORT_C(char*,Fl_Font_Descriptor_get_q_name)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->q_name;
//   }
// #elif USE_XFT
//   FL_EXPORT_C(XftFont*,Fl_Font_Descriptor_get_font)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->font;
//   }
//   FL_EXPORT_C(int,Fl_Font_Descriptor_get_angle)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->angle;
//   }
//   FL_EXPORT_C(fl_Font_Descriptor,Fl_Font_Descriptor_New)(const char* xfontname,Fl_Fontsize size,int angle){
//     Fl_Font_Descriptor* d = new Fl_Font_Descriptor(xfontname,size,angle);
//     return (fl_Font_Descriptor)d;
//   }
// #else
//   FL_EXPORT_C(XUtf8FontStruct*,Fl_Font_Descriptor_get_font)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->font;
//   }
//   FL_EXPORT_C(fl_Font_Descriptor,Fl_Font_Descriptor_New)(const char* fontname){
//     Fl_Font_Descriptor* d = new Fl_Font_Descriptor(fontname);
//     return (fl_Font_Descriptor)d;
//   }
// #endif
// #if HAVE_GL
//   FL_EXPORT_C(unsigned int,Fl_Font_Descriptor_get_listbase)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->listbase;
//   }
// #ifndef __APPLE_QUARTZ__
//   FL_EXPORT_C(char,Fl_Font_Descriptor_get_glok)(fl_Font_Descriptor font_descriptor){
//     return (static_cast<Fl_Font_Descriptor*>(font_descriptor))->glok;
//   }
// #endif // __APPLE_QUARTZ__
// #endif // HAVE_GL
//   FL_EXPORT_C(void,Fl_Font_Descriptor_Destroy)(fl_Font_Descriptor font_descriptor){
//     delete (static_cast<Fl_Font_Descriptor*>(font_descriptor));
//   }
#ifdef __cplusplus
}
#endif
