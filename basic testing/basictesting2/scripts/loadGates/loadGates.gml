///@desc check the room and adjust any gates present to go to the correct destination
/// @arg room

//get teh string of the room we are in 

var theRoom = argument0
var strRoom = room_get_name(theRoom)
//destRoom is a temp var for where teh gate is going to be targeting
var destRoom = rMap
var gatedatarow = 0
var realRoom = 0

var h = 0
var g = 0
//is it just a standard level?
if string_letters(strRoom) == "r" {
	//ok all gates just go to its upper level
	//find out room number
	realRoom = real(string_digits(strRoom))
	//each room has a hall its associated with
	if realRoom <=1 {
		//0 and 1 go to hall1
		destRoom = rHall1
	} else if realRoom <=3 {
		//room 2 and 3 go to hall2
		destRoom = rHall2
	} //otherwise, it stays rmap
	for (i = 0; i < instance_number(oGate); i += 1) {
		//now all gates lead to that dest
		with instance_find(oGate,i) {
			targetroomindex = destRoom
		}
	}
} else {
	//find the room in the gate array
	for (h = 0; h < array_height_2d(oGateControl.gatedata); h++){
		if strRoom == oGateControl.gatedata[h,0] {
			//cool we found the room row to use
			gatedatarow = h
		}
	}
	//for each gate, use that roow to  set the destingations
	for (g = 0; g < instance_number(oGate); g += 1) {
		//find destination
		destRoom = asset_get_index(oGateControl.gatedata[gatedatarow,g+1])
		//with gate "g"
		with instance_find(oGate,g) {
			//assign destination
			targetroomindex = destRoom
			show_debug_message( string(g) + " gate assign to " + string(destRoom))
		}
	}
}