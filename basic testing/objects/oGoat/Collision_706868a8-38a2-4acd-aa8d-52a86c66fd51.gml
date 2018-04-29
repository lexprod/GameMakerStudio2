/// @description warp on open gates
// You can write your code in this editor
//wait until goat is done moving??
if state = GOAT_STATE.IDLE{
	gatecollided = instance_place(x,y,oGate)

	if gatecollided.gatelocked = false {
		//if its unlocked, GO
		room_goto(gatecollided.targetroomindex)
	}
}
