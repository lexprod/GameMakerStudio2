/// tileFlip(tile,dir)
/// @description tileFlip(tile,dir)
/// @param tile
/// @param dir

flippingtile = argument0
dir = argument1

flippingtile.mystate = TILE_STATE.STARTFLIP

tiletop = flippingtile.topcolor
tilebottom = flippingtile.bottomcolor

switch dir {
	//assign the new coordinate and fill in the frames to use
	case "N":
		flippingtile.flipy = flippingtile.flipy + ( -1 * gridsize)
		if flippingtile.topcolor = "Y" {
			//check bottom color eventually too
			with flippingtile {
				//set the animated sprite
				sprite_index = sFlipYN
				image_speed = 1
			}
		
		} else if flippingtile.topcolor = "P" {
			//check bottom color eventually too
			with flippingtile {
				//set the animated sprite
				sprite_index = sFlipYS
				image_index = sprite_get_number(sprite_index) - 1
				image_speed = -1
			}
		}
		break;
	case "E":
		flippingtile.flipx = flippingtile.flipx + ( 1 * gridsize)
		if flippingtile.topcolor = "Y" {
			//check bottom color eventually too
			with flippingtile {
				//set the animated sprite
				sprite_index = sFlipYE
				image_speed = 1
			}
		
		}else if flippingtile.topcolor = "P" {
			with flippingtile {
				//set the animated sprite but in reverse
				sprite_index = sFlipYW
				image_index = sprite_get_number(sprite_index) - 1
				image_speed = -1
			}
		} 
		break;
	case "S":
		flippingtile.flipy = flippingtile.flipy + ( 1 * gridsize)
		if flippingtile.topcolor = "Y" {
			//check bottom color eventually too
			with flippingtile {
				//set the animated sprite
				sprite_index = sFlipYS
				image_speed = 1
			}
		
		} else if flippingtile.topcolor = "P" {
			//check bottom color eventually too
			with flippingtile {
				//set the animated sprite
				sprite_index = sFlipYN
				image_index = sprite_get_number(sprite_index) - 1
				image_speed = -1
			}
		} 
		break;
	case "W":
		flippingtile.flipx = flippingtile.flipx + ( -1 * gridsize)
		if flippingtile.topcolor = "P" {
			with flippingtile {
				//set the animated sprite but in reverse
				sprite_index = sFlipYE
				image_index = sprite_get_number(sprite_index) - 1
				image_speed = -1
			}
		} else if flippingtile.topcolor = "Y" {
			//check bottom color eventually too
			with flippingtile {
				//set the animated sprite
				sprite_index = sFlipYW
				image_speed = 1
			}
		}
		break;

}