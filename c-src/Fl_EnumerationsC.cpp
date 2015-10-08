#include <FL/Fl.H>
#include "Fl_ExportMacros.h"
#ifdef __cplusplus
#include "Fl_EnumerationsC.h"
EXPORT {
#endif
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_ROUND_UP_BOXC)(){ return fl_define_FL_ROUND_UP_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_SHADOW_BOXC)(){ return fl_define_FL_SHADOW_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_ROUNDED_BOXC)(){ return fl_define_FL_ROUNDED_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_RFLAT_BOXC)(){ return fl_define_FL_RFLAT_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_RSHADOW_BOXC)(){ return fl_define_FL_RSHADOW_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_DIAMOND_BOXC)(){ return fl_define_FL_DIAMOND_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_OVAL_BOXC)(){ return fl_define_FL_OVAL_BOX(); }
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_PLASTIC_UP_BOXC)(){ return fl_define_FL_PLASTIC_UP_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_GTK_UP_BOXC)(){ return fl_define_FL_GTK_UP_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_define_FL_GLEAM_UP_BOXC)(){ return fl_define_FL_GLEAM_UP_BOX();}
  FL_EXPORT_C(Fl_Boxtype, fl_boxC)(Fl_Boxtype b) { return fl_box(b);}
  FL_EXPORT_C(Fl_Boxtype, fl_downC)(Fl_Boxtype b) { return fl_down(b);}
  FL_EXPORT_C(Fl_Boxtype, fl_frameC)(Fl_Boxtype b) { return fl_frame(b);}
  FL_EXPORT_C(Fl_Labeltype, fl_define_FL_SHADOW_LABELC)() { return fl_define_FL_SHADOW_LABEL();}
  FL_EXPORT_C(Fl_Labeltype, fl_define_FL_ENGRAVED_LABELC)() { return fl_define_FL_ENGRAVED_LABEL();}
  FL_EXPORT_C(Fl_Labeltype, fl_define_FL_EMBOSSED_LABELC)() { return fl_define_FL_EMBOSSED_LABEL();}
  FL_EXPORT_C(Fl_Align, FL_ALIGN_TOP_LEFTC)(){ return FL_ALIGN_TOP | FL_ALIGN_LEFT;}
  FL_EXPORT_C(Fl_Align, FL_ALIGN_TOP_RIGHTC)(){ return FL_ALIGN_TOP | FL_ALIGN_RIGHT;}
  FL_EXPORT_C(Fl_Align, FL_ALIGN_BOTTOM_LEFTC)(){ return FL_ALIGN_BOTTOM | FL_ALIGN_LEFT;}
  FL_EXPORT_C(Fl_Align, FL_ALIGN_BOTTOM_RIGHTC)(){ return FL_ALIGN_BOTTOM | FL_ALIGN_RIGHT;}
  FL_EXPORT_C(Fl_Color, fl_inactiveC)(Fl_Color c) { return fl_inactive(c);};
  FL_EXPORT_C(Fl_Color, fl_contrastC)(Fl_Color fg, Fl_Color bg) { return fl_contrast(fg,bg);}
  FL_EXPORT_C(Fl_Color, fl_color_averageC)(Fl_Color c1, Fl_Color c2, float weight){ return fl_color_average(c1,c2,weight);}
  FL_EXPORT_C(Fl_Color, fl_lighterC)(Fl_Color c){return fl_lighter(c);}
  FL_EXPORT_C(Fl_Color, fl_darkerC)(Fl_Color c){return fl_darker(c);}
  FL_EXPORT_C(Fl_Color, fl_rgb_color_with_rgbC)(uchar r, uchar g, uchar b){return fl_rgb_color(r,g,b);}
  FL_EXPORT_C(Fl_Color, fl_rgb_color_with_grayscaleC)(uchar g){return fl_rgb_color(g);}
  FL_EXPORT_C(Fl_Color, fl_gray_rampC)(int i){return fl_gray_ramp(i);}
  FL_EXPORT_C(Fl_Color, fl_color_cubeC)(int r, int g, int b){return fl_color_cube(r,g,b);}
#ifdef __cplusplus
}
#endif
