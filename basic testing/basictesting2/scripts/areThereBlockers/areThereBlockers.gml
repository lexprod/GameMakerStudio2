//check for neighbors!
//THIS Is NOT GOOD FOR TILE FLIPPING< BECAUSE IT CHECKS ALL TILES NEXT TO A TILE WHICH IS DUM
//pass your x and y value, we'll look for non goat neighbors (cause a goat shouldnt matter for this)
myx = argument0
myy = argument1

//check each dir and store what it is
northobj = instance_position(myx,myy-gridsize,all)
show_debug_message(string(northobj))
eastobj = instance_position(myx+gridsize,myy,all)
show_debug_message(string(eastobj))
southobj = instance_position(myx,myy+gridsize,all)
show_debug_message(string(southobj))
westobj = instance_position(myx-gridsize,myy,all)
show_debug_message(string(westobj))

//if any of these tile neighbors are not goat and not nothing, thats a block
if northobj != noone and northobj != oGoat {
	return true;
} else if eastobj != noone and eastobj != oGoat {
	return true;
} else if southobj != noone and southobj != oGoat {
	return true;
} else if westobj != noone and westobj != oGoat {
	return true;
} else {
	//oitherwise, good to go
	return false;
}