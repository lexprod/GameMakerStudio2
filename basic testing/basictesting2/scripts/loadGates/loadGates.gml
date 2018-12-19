///@desc check the room and adjust any gates present to go to the correct destination
/// @arg room

//get teh string of the room we are in 

var garName = argument0

//var strRoom = room_get_name(theRoom)
//destRoom is a temp var for where teh gate is going to be targeting
var destGar = rMap


var gatedatarow = 0
var realRoom = 0

var h = 0
var g = 0
//is it just a standard level?
if string_letters(garName) == "r" {
	//ok all gates just go to its upper level
	//find out room number
	realRoom = real(string_digits(garName))
	//each room has a hall its associated with
	if realRoom <=6 {
		//0 and 1 go to hall1
		destGar = rHall1
	} else if realRoom <=7 {
		//room 2 and 3 go to hall2
		destGar = rHall2
	} //otherwise, it stays rmap
	for (i = 0; i < instance_number(oGate); i += 1) {
		//now all gates lead to that dest
		with instance_find(oGate,i) {
			targetgarden = string(destGar)
		}
	}
} else {
	//we are some sort of hub world
	//find the room in the gate array
	for (h = 0; h < array_height_2d(oGateControl.gatedata); h++){
		if garName == oGateControl.gatedata[h,0] {
			//cool we found the room row to use
			gatedatarow = h
		}
	}
	//for each gate, use that roow to  set the destingations
	show_debug_message("I think there are " + string(instance_number(oGate)) + " gates")
	for (g = 0; g < instance_number(oGate); g += 1) {
		//find destination
		destGar = oGateControl.gatedata[gatedatarow,g+1]
		//with gate "g"
		with instance_find(oGate,g) {
			//assign destination
			targetgarden = string(destGar)
			show_debug_message( string(g) + " gate assign to " + string(destGar))
		}
	}
}