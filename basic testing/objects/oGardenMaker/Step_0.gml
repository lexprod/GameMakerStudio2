/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_shift){
	editing = not editing
	currenttype = 0
	OverX = 0
	OverY = 0
}


//first of all, only do ANYTHING if editing is true
if editing then {
	//is the mouse in the garden area?
	if mouse_x >= x and mouse_x <= x+gardenpixelw and mouse_y >= y and mouse_y <= y+gardenpixelh {
		mouseOver = true
		//temp store the current grid point
		OverX = (mouse_x-x) div 64
		OverY = (mouse_y-y) div 64
	} else mouseOver = false
	//when a click happens...
	if mouse_check_button_pressed(mb_left){
		//is the mouse in the garden?
		if mouseOver = true{
			//set the grid you clicked to the flower you have
			if currenttype = 0 {
				//erase it with -1
				garden[OverX,OverY] = -1
			} else {
				garden[OverX,OverY] = currenttype
			}
		}
		//is the mouse over the palette?
		if mouse_x >= typex and mouse_x <= typex + 64*flowertypes and mouse_y >= typey and mouse_y <= typey + 64 {
			//find out which flower we're over and assign it
			currenttype = (mouse_x - typex) div 64
		}
	}
} else {
	mouseOver = false	
}
