/// @description turn menu on and off

if keyboard_check_pressed(vk_escape) {
	if global.menuOn {
		//shut menu
		global.menuOn = false
	} else {
		//open menu
		global.menuOn = true
	}
}