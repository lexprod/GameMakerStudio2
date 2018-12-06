/// @description debug rect
// 
if global.menuOn {
	//draw_set_color(c_ltgray)
	//draw_rectangle(menu_x1,menu_y1,menu_x2,menu_y2,false)
	
	drawNineSlice(sHedgeMenu,menu_x1,menu_y1,menu_x2,menu_y2)
	
	//draw entries
	draw_set_font(fMenu)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	
	menu_y_txt = (gui_height - (menu_itemheight * menu_items * 1.5))/2
	//show_debug_message(string(menu_y_txt))
	for (var i = 0 ; i < menu_items; i++) {
		//var offset = 2
		var txt = pauseMenu[i];
		//is this the selected item?
		if (cursor_item == i) {
			//add dashes to this line
			txt = string_insert("~ ",txt,0)
			txt = txt + " ~"
			var col = c_fuchsia
		} else {
			var col = c_dkgray
		}
		var xx = gui_width / 2
		var yy = menu_y_txt + (i * 1.5 * menu_itemheight)
		//show_debug_message(string(yy))
		draw_set_color(col);
		draw_text(xx,yy,txt);
	}
}