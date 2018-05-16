/// @description color flip


if mystate = TILE_STATE.STARTFLIP {
	if ( image_speed > 0 and floor(image_index) >= HalfFrame ) or (image_speed < 0 and floor(image_index) <= negHalfFrame) {
		//halfway through the flip, change position and colors
		x = flipx
		y = flipy
		tempcolor = topcolor
		topcolor = bottomcolor
		bottomcolor = tempcolor
		mystate = TILE_STATE.ENDFLIP
	}	
} else if mystate = TILE_STATE.ENDFLIP {
	if ( image_speed > 0 and image_index == sprite_get_number(sprite_index)-1 ) or (image_speed < 0  and image_index == 0) {
		sprite_index = sTileYP
		image_speed = 0
		mystate = TILE_STATE.IDLE
		if topcolor = "Y" {
			image_index = 0
		} else  {
			image_index = 1
		}
		
	}
}






