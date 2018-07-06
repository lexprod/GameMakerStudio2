/// @description establish variables
// You can write your code in this editor

//birthday = current_time
//show_debug_message(string(birthday))

enum GOAT_STATE {
	IDLE,
	MOVING, //while walking from sq to sq
	FLIPPING, //after space is pressed and after we check for valid targets
	DECIDING, //when looking at options for flips
	PUSHING, 
	BUMPING, //when bouncing off an illegal move
	WAITING //when a tile is falling
}

state = GOAT_STATE.IDLE


targetx = x
targety = y

movespeed = 13

bumpdir = 1

bumpamount = 5


leftx = x-gridsize
rightx = x + gridsize
upy = y - gridsize
downy = y + gridsize

layer_add_instance("goat",self)
clearChoices()

//this is for waiting for the tile to complete its move
fallingtile = noone


