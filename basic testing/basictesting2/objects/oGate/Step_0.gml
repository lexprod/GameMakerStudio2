/// @description chec for open or close
// 
if gatelocked = true {
	image_index = 0
	solidobj = true
} else {
	image_index = 1
	solidobj = false
}

if keyboard_check_pressed(vk_f1) {
	//debug unlocks
	gatelocked = !gatelocked
}