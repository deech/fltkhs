#ifndef __GLUT_C__
#define __GLUT_C__
#ifdef __cplusplus
// always include the FL/*.H headers before local headers
// Fl_Widget is included transitively and needed for
// the callback mechanism included below to work.
#include "FL/Fl.H"
#include "FL/glut.H"
#include "Fl_CallbackC.h"
EXPORT {
#endif
  FL_EXPORT_C_HEADER(void,flc_glutInit,(int* argcp, char** argv));
  FL_EXPORT_C_HEADER(void,flc_glutInitDisplayMode,(unsigned int mode));
  FL_EXPORT_C_HEADER(void,flc_glutInitWindowPosition,(int x, int y));
  FL_EXPORT_C_HEADER(void,flc_glutInitWindowSize,(int w, int h));
  FL_EXPORT_C_HEADER(void,flc_glutMainLoop,());
  FL_EXPORT_C_HEADER(int,flc_glutCreateWindow,(char* title));
  FL_EXPORT_C_HEADER(int,flc_glutCreateSubWindow,(int win, int x, int y, int width, int height));
  FL_EXPORT_C_HEADER(void,flc_glutDestroyWindow,(int win));
  FL_EXPORT_C_HEADER(void,flc_glutPostRedisplay,());
  FL_EXPORT_C_HEADER(void,flc_glutPostWindowRedisplay,(int win));
  FL_EXPORT_C_HEADER(void,flc_glutSwapBuffers,());
  FL_EXPORT_C_HEADER(int,flc_glutGetWindow,());
  FL_EXPORT_C_HEADER(void,flc_glutSetWindow,(int win));
  FL_EXPORT_C_HEADER(void,flc_glutSetWindowTitle,(char* t));
  FL_EXPORT_C_HEADER(void,flc_glutSetIconTitle,(char* t));
  FL_EXPORT_C_HEADER(void,flc_glutPositionWindow,(int x, int y));
  FL_EXPORT_C_HEADER(void,flc_glutReshapeWindow,(int w, int h));
  FL_EXPORT_C_HEADER(void,flc_glutPopWindow,());
  FL_EXPORT_C_HEADER(void,flc_glutPushWindow,());
  FL_EXPORT_C_HEADER(void,flc_glutIconifyWindow,());
  FL_EXPORT_C_HEADER(void,flc_glutShowWindow,());
  FL_EXPORT_C_HEADER(void,flc_glutHideWindow,());
  FL_EXPORT_C_HEADER(void,flc_glutFullScreen,());
  FL_EXPORT_C_HEADER(void,flc_glutSetCursor,(Fl_Cursor cursor));
  FL_EXPORT_C_HEADER(void,flc_glutWarpPointer,(int x, int y));
  FL_EXPORT_C_HEADER(void,flc_glutEstablishOverlay,());
  FL_EXPORT_C_HEADER(void,flc_glutRemoveOverlay,());
  FL_EXPORT_C_HEADER(void,flc_glutUseLayer,(GLenum layer));
  FL_EXPORT_C_HEADER(void,flc_glutPostOverlayRedisplay,());
  FL_EXPORT_C_HEADER(void,flc_glutShowOverlay,());
  FL_EXPORT_C_HEADER(void,flc_glutHideOverlay,());
  FL_EXPORT_C_HEADER(int,flc_glutCreateMenu,(void (*f)(int)));
  FL_EXPORT_C_HEADER(void,flc_glutDestroyMenu,(int menu));
  FL_EXPORT_C_HEADER(int,flc_glutGetMenu,());
  FL_EXPORT_C_HEADER(void,flc_glutSetMenu,(int m));
  FL_EXPORT_C_HEADER(void,flc_glutAddMenuEntry,(char* label, int value));
  FL_EXPORT_C_HEADER(void,flc_glutAddSubMenu,(char* label, int submenu));
  FL_EXPORT_C_HEADER(void,flc_glutChangeToMenuEntry,(int item, char* labela, int value));
  FL_EXPORT_C_HEADER(void,flc_glutChangeToSubMenu,(int item, char* label, int submenu));
  FL_EXPORT_C_HEADER(void,flc_glutRemoveMenuItem,(int item));
  FL_EXPORT_C_HEADER(void,flc_glutAttachMenu,(int b));
  FL_EXPORT_C_HEADER(void,flc_glutDetachMenu,(int b));
  FL_EXPORT_C_HEADER(void,flc_glutDisplayFunc,(void (*f)()));
  FL_EXPORT_C_HEADER(void,flc_glutReshapeFunc,(void (*f)(int w, int h)));
  FL_EXPORT_C_HEADER(void,flc_glutKeyboardFunc,(void (*f)(uchar key, int x, int y)));
  FL_EXPORT_C_HEADER(void,flc_glutMouseFunc,(void (*f)(int b, int state, int x, int y)));
  FL_EXPORT_C_HEADER(void,flc_glutMotionFunc,(void (*f)(int x, int y)));
  FL_EXPORT_C_HEADER(void,flc_glutPassiveMotionFunc,(void (*f)(int x, int y)));
  FL_EXPORT_C_HEADER(void,flc_glutEntryFunc,(void (*f)(int s)));
  FL_EXPORT_C_HEADER(void,flc_glutVisibilityFunc,(void (*f)(int s)));
  FL_EXPORT_C_HEADER(void,flc_glutIdleFunc,(void (*f)()));
  FL_EXPORT_C_HEADER(void,flc_glutTimerFunc,(unsigned int msec, void (*f)(int), int value));
  FL_EXPORT_C_HEADER(void,flc_glutMenuStateFunc,(void (*f)(int state)));
  FL_EXPORT_C_HEADER(void,flc_glutMenuStatusFunc,(void (*f)(int status, int x, int y)));
  FL_EXPORT_C_HEADER(void,flc_glutSpecialFunc,(void (*f)(int key, int x, int y)));
  FL_EXPORT_C_HEADER(void,flc_glutOverlayDisplayFunc,(void (*f)()));
  FL_EXPORT_C_HEADER(int,flc_glutGet,(GLenum type));
  FL_EXPORT_C_HEADER(int,flc_glutDeviceGet,(GLenum type));
  FL_EXPORT_C_HEADER(int,flc_glutGetModifiers,());
  FL_EXPORT_C_HEADER(int,flc_glutLayerGet,(GLenum type));
  FL_EXPORT_C_HEADER(GLUTproc,flc_glutGetProcAddress,(const char* procName));
  FL_EXPORT_C_HEADER(void,flc_glutBitmapCharacter,(void* font, int character));
  FL_EXPORT_C_HEADER(int,flc_glutBitmapHeight,(void* font));
  FL_EXPORT_C_HEADER(int,flc_glutBitmapLength,(void* font, const unsigned char* string));
  FL_EXPORT_C_HEADER(void,flc_glutBitmapString,(void* font, const unsigned char* string));
  FL_EXPORT_C_HEADER(int,flc_glutBitmapWidth,(void* font, int character));
  FL_EXPORT_C_HEADER(int,flc_glutExtensionSupported,(char* name));
  FL_EXPORT_C_HEADER(void,flc_glutStrokeCharacter,(void* font, int character));
  FL_EXPORT_C_HEADER(GLfloat,flc_glutStrokeHeight,(void* font));
  FL_EXPORT_C_HEADER(int,flc_glutStrokeLength,(void* font, const unsigned char* string));
  FL_EXPORT_C_HEADER(void,flc_glutStrokeString,(void* font, const unsigned char* string));
  FL_EXPORT_C_HEADER(int,flc_glutStrokeWidth,(void* font, int character));
  FL_EXPORT_C_HEADER(void,flc_glutWireSphere,(GLdouble radius, GLint slices, GLint stacks));
  FL_EXPORT_C_HEADER(void,flc_glutSolidSphere,(GLdouble radius, GLint slices, GLint stacks));
  FL_EXPORT_C_HEADER(void,flc_glutWireCone,(GLdouble base, GLdouble height, GLint slices, GLint stacks));
  FL_EXPORT_C_HEADER(void,flc_glutSolidCone,(GLdouble base, GLdouble height, GLint slices, GLint stacks));
  FL_EXPORT_C_HEADER(void,flc_glutWireCube,(GLdouble size));
  FL_EXPORT_C_HEADER(void,flc_glutSolidCube,(GLdouble size));
  FL_EXPORT_C_HEADER(void,flc_glutWireTorus,(GLdouble innerRadius, GLdouble outerRadius, GLint sides, GLint rings));
  FL_EXPORT_C_HEADER(void,flc_glutSolidTorus,(GLdouble innerRadius, GLdouble outerRadius, GLint sides, GLint rings));
  FL_EXPORT_C_HEADER(void,flc_glutWireDodecahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutSolidDodecahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutWireTeapot,(GLdouble size));
  FL_EXPORT_C_HEADER(void,flc_glutSolidTeapot,(GLdouble size));
  FL_EXPORT_C_HEADER(void,flc_glutWireOctahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutSolidOctahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutWireTetrahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutSolidTetrahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutWireIcosahedron,());
  FL_EXPORT_C_HEADER(void,flc_glutSolidIcosahedron,());
#ifdef __cplusplus
}
#endif
#endif /* __GLUT_C__ */
