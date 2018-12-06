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
			switch (cursor_item)
			{
				case 2: game_end() break;
				case 1: room_goto(rMap)
				//unsolve the level
				oGame.yPathComplete = false
				oGame.levelComplete = false
				with oGame{
					killAllSavs()
				}
				//shut menu,
				global.menuOn = false;
				break;
				case 0: default: //shut menu,
				global.menuOn = false;
			}
			
		}
	}
} else {
	if keyboard_check_pressed(vk_escape) {
		//open menu
		global.menuOn = true
	}
}




