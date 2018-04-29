/// @description setting up enum?
// You can write your code in this editor

enum TILE_TYPE {
	//first letter is top tile color
	YP,
	PY,
	OP,
	PO,
	YO,
	OY
}

enum TILE_STATE {
	IDLE,
	FLIPPING	
}

mytileimage = image_index
mystate = TILE_STATE.IDLE

animationframes = 12

flipx = x
flipy = y

leftx = x-gridsize
rightx = x + gridsize
upy = y - gridsize
downy = y + gridsize

flipimages = ds_queue_create();

if image_index == 0 {
	topcolor = "Y"
	bottomcolor = "P"
} else {
	topcolor = "P"
	bottomcolor = "Y"
}

