/// goatBump(startx,starty,dir,targx,targy)
/// @description goatBump(startx,starty,dir,targx,targy)
/// @param startx
/// @param starty
/// @param dir
/// @param targx
/// @param targy

with other {
	bumpstartx = argument0
	bumpstarty = argument1
	bumpdir = argument2
	targetx = argument3
	targety = argument4
	
	state = GOAT_STATE.BUMPING
	
	audio_play_sound(a1,0,false)
}