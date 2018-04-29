/// @description color flip


if mystate = TILE_STATE.FLIPPING {
	mytileimage = ds_queue_dequeue(flipimages)
	if ds_queue_size(flipimages) == animationframes/2 {
		//halfway through the flip, change position and colors
		x = flipx
		y = flipy
		tempcolor = topcolor
		topcolor = bottomcolor
		bottomcolor = tempcolor
	}
	if ds_queue_empty(flipimages) {
		mystate = TILE_STATE.IDLE
		}
}


