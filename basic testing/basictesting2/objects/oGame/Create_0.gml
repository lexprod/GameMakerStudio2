/// @description Insert description here
// You can write your code in this editor


//keeps tabs on any yellow paths
yTilePathList = ds_list_create()


yPathComplete = false
levelComplete = false

//spawn goat 1
//instance_create_layer(gridsize*1,gridsize*1,"goat",oGoat)




//undo variables
//this increases with each move and tile flip of the oGoat
movecount = 0
//this stack stores the filename of each and every save of each move holy cow
//FILO methodology
movelist = ds_stack_create();


