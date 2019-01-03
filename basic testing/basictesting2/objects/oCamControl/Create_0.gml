/// @description spawn a camera
// You can write your code in this editor
mainCam = camera_create();

viewmat = matrix_build_lookat(x,y,-100,x,y,0,0,1,0)
projmat = matrix_build_projection_ortho(1024,768,1,32000)

camera_set_view_mat(mainCam,viewmat)
camera_set_proj_mat(mainCam,projmat)

view_camera[0] = mainCam;

newX = x
newY = y

widthratio = 4
heightratio = 3