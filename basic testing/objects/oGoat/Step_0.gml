/// @description move controls
// 

if state = GOAT_STATE.IDLE {
	if keyboard_check(vk_up) {
		state = GOAT_STATE.MOVING
		targety = y-64
		//MoveGrid(self.id,"up")
	} else if keyboard_check(vk_down) {
		state = GOAT_STATE.MOVING
		targety = y+64
		//MoveGrid(self.id,"down")
	}else if keyboard_check(vk_left) {
		state = GOAT_STATE.MOVING
		targetx = x-64
		//MoveGrid(self.id,"up")
	} else if keyboard_check(vk_right) {
		state = GOAT_STATE.MOVING
		targetx = x+64
		//MoveGrid(self.id,"down")
	}
}

if state = GOAT_STATE.MOVING{
	//check if we're trying to go out of bounds
	if targety < 0 or targetx < 0 {
		state = GOAT_STATE.IDLE
	} else if targety = y and targetx = x {
	//if legit, check if we've arrived
		state = GOAT_STATE.IDLE
	} else if targety != y {
	//if we need to move y, do some move
	y = y + sign(targety - y)*min(abs(targety - y), movespeed)
	} else if targetx != x {
		//if we need to move y, do some move
		x = x + sign(targetx - x)*min(abs(targetx - x), movespeed)
	} else {
		//if we got here, something went wrong
		show_debug_message("goat state moving says targetx " + string(targetx) + "and targety" + string(targety))
	}
}

