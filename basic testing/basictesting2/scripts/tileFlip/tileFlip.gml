/// tileFlip(tile,dir)
/// @description tileFlip(tile,dir)
/// @param tile
/// @param dir

flippingtile = argument0
dir = argument1

flippingtile.mystate = TILE_STATE.FLIPPING
tiletype = flippingtile.mytileimage

switch dir {
	//assign the new coordinate and fill in the frames to use
	case "N":
		flippingtile.flipy = flippingtile.flipy + ( -1 * gridsize)
		if tiletype = 0 {
			ds_queue_enqueue(flippingtile.flipimages,10,10,10,11,11,11,12,12,12,13,13,13,1)
		} else if tiletype = 1{
			ds_queue_enqueue(flippingtile.flipimages,17,17,17,16,16,16,15,15,15,14,14,14,0)
		}
		break;
	case "E":
		flippingtile.flipx = flippingtile.flipx + ( 1 * gridsize)
		if tiletype = 0 {
			ds_queue_enqueue(flippingtile.flipimages,2,2,2,3,3,3,4,4,4,5,5,5,1)
		} else if tiletype = 1{
			ds_queue_enqueue(flippingtile.flipimages,9,9,9,8,8,8,7,7,7,6,6,6,0)
		}
		break;
	case "S":
		flippingtile.flipy = flippingtile.flipy + ( 1 * gridsize)
		if tiletype = 0 {
			ds_queue_enqueue(flippingtile.flipimages,14,14,14,15,15,15,16,16,16,17,17,17,1)
		} else if tiletype = 1{
			ds_queue_enqueue(flippingtile.flipimages,13,13,13,12,12,12,11,11,11,10,10,10,0)
		}
		break;
	case "W":
		flippingtile.flipx = flippingtile.flipx + ( -1 * gridsize)
		if tiletype = 0 {
			ds_queue_enqueue(flippingtile.flipimages,6,6,6,7,7,7,8,8,8,9,9,9,1)
		} else if tiletype = 1{
			ds_queue_enqueue(flippingtile.flipimages,5,5,5,4,4,4,3,3,3,2,2,2,0)
		}
		break;

}