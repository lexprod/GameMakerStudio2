/// @description turn menu on and off
if global.menuOn {
if keyboard_check_pressed(vk_escape) {
		//shut menu
		global.menuOn = false
	} else {
//key controls
		if keyboard_check_pressed(vk_up) {
			cursor_item --;
			if (cursor_item < 0) {cursor_item = menu_items-1}
		} else if keyboard_check_pressed(vk_down) {
			cursor_item ++;
			if (cursor_item >= menu_items) {cursor_item = 0}
		} else if keyboard_check_pressed(vk_enter) {
			//ok do something
			cursor_string = ds_list_find_value(listMenu,cursor_item)
			switch (cursor_string)
			{
				case "Quit Game": game_end() break;
				case "Back to Hub": room_goto(rMap)
				//unsolve the level
				oGame.yPathComplete = false
				oGame.levelComplete = false
				with oGame{
					killAllSavs()
				}
				//shut menu,
				global.menuOn = false;
				break;
				case "Resume": default: //shut menu,
				global.menuOn = false;
			}
			
		}
	}
} else {
	if keyboard_check_pressed(vk_escape) {
		//open menu
		global.menuOn = true
		//refresh possible menu
		ds_list_clear(listMenu)
		ds_list_add(listMenu,"Resume")
		if room != rMap {
			ds_list_add(listMenu,"Back to Hub")
		}
		ds_list_add(listMenu,"Quit Game")
		menu_items = ds_list_size(listMenu)
		//show_debug_message(string(ds_list_size(listMenu)))
		cursor_item = 0
	}
}




