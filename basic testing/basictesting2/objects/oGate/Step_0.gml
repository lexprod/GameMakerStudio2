/// @description chec for open or close
// 
if gatelocked = true {
	image_index = 0
} else {
	image_index = 1
}

if keyboard_check_pressed(vk_f1) {
	//debug unlocks
	gatelocked = !gatelocked
}