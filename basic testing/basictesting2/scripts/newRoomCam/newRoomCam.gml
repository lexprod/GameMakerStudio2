///@desc check the garden and adjust the viewscreen to view the whole garden plus trim

var gardwidpix = oGardenMaker.gardenwidth * gridsize
var gardheipix = oGardenMaker.gardenheight * gridsize

var widratio = oCamControl.widthratio
var heiratio = oCamControl.heightratio

var wtohRatio = widratio / heiratio

var camx = (gardwidpix) / 2
var camy = (gardheipix) / 2

//is it too tall??
if gardheipix * wtohRatio > gardwidpix {
	//then fit to height, width will adjust accordingly
	gardwidpix = gardheipix * wtohRatio
	//this is cause garden is weird
	
} else {
		//otherwise fit to w, h will adjust accordingly
	gardheipix = gardwidpix * (1/wtohRatio)
	
}

//we have to add one grid to x and y cause of how gardens beeeeeeeeee

camx += gridsize
camy += gridsize
//and update cam
	with oCamControl {
		viewmat = matrix_build_lookat(camx,camy,-100,camx,camy,0,0,1,0)
		camera_set_view_mat(mainCam,viewmat)

		projmat = matrix_build_projection_ortho(gardwidpix, gardheipix ,1,32000)
		camera_set_proj_mat(mainCam,projmat)

		view_camera[0] = mainCam;
	} 
	
show_debug_message("camx " + string(camx))
show_debug_message("camy " + string(camy))
show_debug_message("gardwidpix " + string(gardwidpix))
show_debug_message("gardheipix " + string(gardheipix))
