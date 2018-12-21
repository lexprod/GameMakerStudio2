/// @description Insert description here
// You can write your code in this editor

//this controls all the editing and cheaty options
debugOn = true

//make the menu obj, its gonna be persistent and mostly invis
instance_create_layer(0,0,"Instances",oMenu)
//and camcontrol for zoomies and fullscreenm

//	instance_create_layer(0,0,"Instances",oCamControl)



//keeps tabs on any yellow paths
yTilePathList = ds_list_create()


yPathComplete = false
levelComplete = false

//spawn goat 1
instance_create_layer(gridsize*1,gridsize*1,"goat",oGoat)

movelist = 0


killAllSavs()

RoomReady = false
gametargetgarden = rMap


