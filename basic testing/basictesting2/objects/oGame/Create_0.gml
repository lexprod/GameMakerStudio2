/// @description Insert description here
// You can write your code in this editor


//keeps tabs on any yellow paths
yTilePathList = ds_list_create()


yPathComplete = false
levelComplete = false

//spawn goat 1
instance_create_layer(gridsize*1,gridsize*1,"goat",oGoat)
