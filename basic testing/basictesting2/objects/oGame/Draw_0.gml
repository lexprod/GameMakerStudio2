/// @description Insert description here
// You can write your code in this editor


//to test add a sPath sprite to each tile in path
	for (b = 0; b < ds_list_size(yTilePathList); b++) {
		var markedtile = ds_list_find_value(yTilePathList,b)
		draw_sprite(sPath,0,markedtile.x,markedtile.y)
	}
	
	
draw_set_font(fBasic)
draw_set_color(c_black)
if yPathComplete {
	draw_text(200,100,"pathyes")
}
if levelComplete {
	draw_text(200,120,"levelyes")
}