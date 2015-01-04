#include "glutC.h"
#ifdef __cplusplus
EXPORT {
#endif
  FL_EXPORT_C(void,flc_glutInit)(int* argcp,char** argv){
    glutInit(argcp,argv);
  }
  FL_EXPORT_C(void,flc_glutInitDisplayMode)(unsigned int mode){
    glutInitDisplayMode(mode);
  }
  FL_EXPORT_C(void,flc_glutInitWindowPosition)(int x,int y){
    glutInitWindowPosition(x,y);
  }
  FL_EXPORT_C(void,flc_glutInitWindowSize)(int w,int h){
    glutInitWindowSize(w,h);
  }
  FL_EXPORT_C(void,flc_glutMainLoop)( ){
    glutMainLoop();
  }
  FL_EXPORT_C(int,flc_glutCreateWindow)(char* title){
    return glutCreateWindow(title);
  }
  FL_EXPORT_C(int,flc_glutCreateSubWindow)(int win,int x,int y,int width,int height){
    return glutCreateSubWindow(win,x,y,width,height);
  }
  FL_EXPORT_C(void,flc_glutDestroyWindow)(int win){
    glutDestroyWindow(win);
  }
  FL_EXPORT_C(void,flc_glutPostRedisplay)( ){
    glutPostRedisplay();
  }
  FL_EXPORT_C(void,flc_glutPostWindowRedisplay)(int win){
    glutPostWindowRedisplay(win);
  }
  FL_EXPORT_C(void,flc_glutSwapBuffers)( ){
    glutSwapBuffers();
  }
  FL_EXPORT_C(int,flc_glutGetWindow)( ){
    return glutGetWindow();
  }
  FL_EXPORT_C(void,flc_glutSetWindow)(int win){
    glutSetWindow(win);
  }
  FL_EXPORT_C(void,flc_glutSetWindowTitle)(char* t){
    glutSetWindowTitle(t);
  }
  FL_EXPORT_C(void,flc_glutSetIconTitle)(char* t){
    glutSetIconTitle(t);
  }
  FL_EXPORT_C(void,flc_glutPositionWindow)(int x,int y){
    glutPositionWindow(x,y);
  }
  FL_EXPORT_C(void,flc_glutReshapeWindow)(int w,int h){
    glutReshapeWindow(w,h);
  }
  FL_EXPORT_C(void,flc_glutPopWindow)( ){
    glutPopWindow();
  }
  FL_EXPORT_C(void,flc_glutPushWindow)( ){
    glutPushWindow();
  }
  FL_EXPORT_C(void,flc_glutIconifyWindow)( ){
    glutIconifyWindow();
  }
  FL_EXPORT_C(void,flc_glutShowWindow)( ){
    glutShowWindow();
  }
  FL_EXPORT_C(void,flc_glutHideWindow)( ){
    glutHideWindow();
  }
  FL_EXPORT_C(void,flc_glutFullScreen)( ){
    glutFullScreen();
  }
  FL_EXPORT_C(void,flc_glutSetCursor)(Fl_Cursor cursor){
    glutSetCursor(cursor);
  }
  FL_EXPORT_C(void,flc_glutWarpPointer)(int x,int y){
    glutWarpPointer(x,y);
  }
  FL_EXPORT_C(void,flc_glutEstablishOverlay)( ){
    glutEstablishOverlay();
  }
  FL_EXPORT_C(void,flc_glutRemoveOverlay)( ){
    glutRemoveOverlay();
  }
  FL_EXPORT_C(void,flc_glutUseLayer)(GLenum layer){
    glutUseLayer(layer);
  }
  FL_EXPORT_C(void,flc_glutPostOverlayRedisplay)( ){
    glutPostOverlayRedisplay();
  }
  FL_EXPORT_C(void,flc_glutShowOverlay)( ){
    glutShowOverlay();
  }
  FL_EXPORT_C(void,flc_glutHideOverlay)( ){
    glutHideOverlay();
  }
  FL_EXPORT_C(int, flc_glutCreateMenu)(void (*f)(int)){
    return glutCreateMenu(f);
  }
  FL_EXPORT_C(void,flc_glutDestroyMenu)(int menu){
    glutDestroyMenu(menu);
  }
  FL_EXPORT_C(int,flc_glutGetMenu)( ){
    return glutGetMenu();
  }
  FL_EXPORT_C(void,flc_glutSetMenu)(int m){
    glutSetMenu(m);
  }
  FL_EXPORT_C(void,flc_glutAddMenuEntry)(char* label,int value){
    glutAddMenuEntry(label,value);
  }
  FL_EXPORT_C(void,flc_glutAddSubMenu)(char* label,int submenu){
    glutAddSubMenu(label,submenu);
  }
  FL_EXPORT_C(void,flc_glutChangeToMenuEntry)(int item,char* labela,int value){
    glutChangeToMenuEntry(item,labela,value);
  }
  FL_EXPORT_C(void,flc_glutChangeToSubMenu)(int item,char* label,int submenu){
    glutChangeToSubMenu(item,label,submenu);
  }
  FL_EXPORT_C(void,flc_glutRemoveMenuItem)(int item){
    glutRemoveMenuItem(item);
  }
  FL_EXPORT_C(void,flc_glutAttachMenu)(int b){
    glutAttachMenu(b);
  }
  FL_EXPORT_C(void,flc_glutDetachMenu)(int b){
    glutDetachMenu(b);
  }
  FL_EXPORT_C(int,flc_glutGet)(GLenum type){
    return glutGet(type);
  }
  FL_EXPORT_C(int,flc_glutDeviceGet)(GLenum type){
    return glutDeviceGet(type);
  }
  FL_EXPORT_C(int,flc_glutGetModifiers)( ){
    return glutGetModifiers();
  }
  FL_EXPORT_C(int,flc_glutLayerGet)(GLenum type){
    return glutLayerGet(type);
  }
  FL_EXPORT_C(GLUTproc,flc_glutGetProcAddress)(const char* procName){
    return glutGetProcAddress(procName);
  }
  FL_EXPORT_C(void,flc_glutBitmapCharacter)(void* font,int character){
    glutBitmapCharacter(font,character);
  }
  FL_EXPORT_C(int,flc_glutBitmapHeight)(void* font){
    return glutBitmapHeight(font);
  }
  FL_EXPORT_C(int,flc_glutBitmapLength)(void* font,const unsigned char* string){
    return glutBitmapLength(font,string);
  }
  FL_EXPORT_C(void,flc_glutBitmapString)(void* font,const unsigned char* string){
    glutBitmapString(font,string);
  }
  FL_EXPORT_C(int,flc_glutBitmapWidth)(void* font,int character){
    return glutBitmapWidth(font,character);
  }
  // FL_EXPORT_C(int,flc_glutExtensionSupported)(char* name){
  //   return glutExtensionSupported(name);
  // }
  FL_EXPORT_C(void,flc_glutStrokeCharacter)(void* font,int character){
    glutStrokeCharacter(font,character);
  }
  FL_EXPORT_C(GLfloat,flc_glutStrokeHeight)(void* font){
    return glutStrokeHeight(font);
  }
  FL_EXPORT_C(int,flc_glutStrokeLength)(void* font,const unsigned char* string){
    return glutStrokeLength(font,string);
  }
  FL_EXPORT_C(void,flc_glutStrokeString)(void* font,const unsigned char* string){
    glutStrokeString(font,string);
  }
  FL_EXPORT_C(int,flc_glutStrokeWidth)(void* font,int character){
    return glutStrokeWidth(font,character);
  }
  FL_EXPORT_C(void,flc_glutWireSphere)(GLdouble radius,GLint slices,GLint stacks){
    glutWireSphere(radius,slices,stacks);
  }
  FL_EXPORT_C(void,flc_glutSolidSphere)(GLdouble radius,GLint slices,GLint stacks){
    glutSolidSphere(radius,slices,stacks);
  }
  FL_EXPORT_C(void,flc_glutWireCone)(GLdouble base,GLdouble height,GLint slices,GLint stacks){
    glutWireCone(base,height,slices,stacks);
  }
  FL_EXPORT_C(void,flc_glutSolidCone)(GLdouble base,GLdouble height,GLint slices,GLint stacks){
    glutSolidCone(base,height,slices,stacks);
  }
  FL_EXPORT_C(void,flc_glutWireCube)(GLdouble size){
    glutWireCube(size);
  }
  FL_EXPORT_C(void,flc_glutSolidCube)(GLdouble size){
    glutSolidCube(size);
  }
  FL_EXPORT_C(void,flc_glutWireTorus)(GLdouble innerRadius,GLdouble outerRadius,GLint sides,GLint rings){
    glutWireTorus(innerRadius,outerRadius,sides,rings);
  }
  FL_EXPORT_C(void,flc_glutSolidTorus)(GLdouble innerRadius,GLdouble outerRadius,GLint sides,GLint rings){
    glutSolidTorus(innerRadius,outerRadius,sides,rings);
  }
  FL_EXPORT_C(void,flc_glutWireDodecahedron)( ){
    glutWireDodecahedron();
  }
  FL_EXPORT_C(void,flc_glutSolidDodecahedron)( ){
    glutSolidDodecahedron();
  }
  FL_EXPORT_C(void,flc_glutWireTeapot)(GLdouble size){
    glutWireTeapot(size);
  }
  FL_EXPORT_C(void,flc_glutSolidTeapot)(GLdouble size){
    glutSolidTeapot(size);
  }
  FL_EXPORT_C(void,flc_glutWireOctahedron)( ){
    glutWireOctahedron();
  }
  FL_EXPORT_C(void,flc_glutSolidOctahedron)( ){
    glutSolidOctahedron();
  }
  FL_EXPORT_C(void,flc_glutWireTetrahedron)( ){
    glutWireTetrahedron();
  }
  FL_EXPORT_C(void,flc_glutSolidTetrahedron)( ){
    glutSolidTetrahedron();
  }
  FL_EXPORT_C(void,flc_glutWireIcosahedron)( ){
    glutWireIcosahedron();
  }
  FL_EXPORT_C(void,flc_glutSolidIcosahedron)( ){
    glutSolidIcosahedron();
  }
  FL_EXPORT_C(void, flc_glutDisplayFunc)(void (*f)()){
    glutDisplayFunc(f);
  }
  FL_EXPORT_C(void, flc_glutReshapeFunc)(void (*f)(int w, int h)){
    glutReshapeFunc(f);
  }
  FL_EXPORT_C(void, flc_glutKeyboardFunc)(void (*f)(uchar key, int x, int y)){
    glutKeyboardFunc(f);
  }
  FL_EXPORT_C(void, flc_glutMouseFunc)(void (*f)(int b, int state, int x, int y)){
    glutMouseFunc(f);
  }
  FL_EXPORT_C(void, flc_glutMotionFunc)(void (*f)(int x, int y)){
    glutMotionFunc(f);
  }
  FL_EXPORT_C(void, flc_glutPassiveMotionFunc)(void (*f)(int x, int y)){
    glutPassiveMotionFunc(f);
  }
  FL_EXPORT_C(void, flc_glutEntryFunc)(void (*f)(int s)){
    glutEntryFunc(f);
  }
  FL_EXPORT_C(void, flc_glutVisibilityFunc)(void (*f)(int s)){
    glutVisibilityFunc(f);
  }
  FL_EXPORT_C(void, flc_glutIdleFunc)(void (*f)()){
    glutIdleFunc(f);
  }
  FL_EXPORT_C(void, flc_glutTimerFunc)(unsigned int msec, void (*f)(int), int value){
    glutTimerFunc(msec,f,value);
  }
  FL_EXPORT_C(void, flc_glutMenuStateFunc)(void (*f)(int state)){
    glutMenuStateFunc(f);
  }
  FL_EXPORT_C(void, flc_glutMenuStatusFunc)(void (*f)(int status, int x, int y)){
    glutMenuStatusFunc(f);
  }
  FL_EXPORT_C(void, flc_glutSpecialFunc)(void (*f)(int key, int x, int y)){
    glutSpecialFunc(f);
  }
  FL_EXPORT_C(void, flc_glutOverlayDisplayFunc)(void (*f)()){
    glutOverlayDisplayFunc(f);
  }
#ifdef __cplusplus
}
#endif
