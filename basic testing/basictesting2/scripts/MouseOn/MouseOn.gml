/// MouseOn(a)
/// @description MouseOn(obj)
/// @param obj

//checks the mouse x and y, and returns true if its over the object obj
obj = argument0
startx = obj.x
endx = startx + obj.sprite_width
starty = obj.y
endy = starty + obj.sprite_height

if (startx <= mouse_x and mouse_x <= endx and starty <= mouse_y and mouse_y <= endy ) {
	return true
} else {
	return false
}
