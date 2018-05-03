/// @description establish variables
// You can write your code in this editor


enum GOAT_STATE {
	IDLE,
	MOVING,
	FLIPPING,
	DECIDING,
	PUSHING,
	BUMPING
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