/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_shift){
	editing = not editing
	currenttype = 0
	currentchoice = 0
	OverX = 0
	OverY = 0
	saveGarden();
}


//first of all, only do ANYTHING if editing is true
if editing then {
	//do we want to switch types?
	if mouse_check_button_pressed(mb_right) {
		currenttype = (currenttype + 1) mod maxtypes
		currentchoice = 0
	}
	//is the mouse in the garden area?
	if mouse_x >= x and mouse_x <= x+gardenpixelw and mouse_y >= y and mouse_y <= y+gardenpixelh {
		mouseOver = true
		//temp store the current grid point
		OverX = (mouse_x-x) div 64
		OverY = (mouse_y-y) div 64
	} else {
	mouseOver = false
	}
	//when a click happens...
	if mouse_check_button_pressed(mb_left){
		//is the mouse in the garden?
		
		if mouseOver = true{
			//if we're on delete, delete it
			
			if currentchoice = 0 {
				//erase it with -1
				garden[OverX,OverY] = -1
				todelete = instance_position(mouse_x, mouse_y, all)
				if todelete != noone {
					instance_destroy(todelete)
				}
			} else {
				//delete old objects
				while instance_position(mouse_x, mouse_y, all) != noone {
					todelete = instance_position(mouse_x, mouse_y, all)
					instance_destroy(todelete)
				}
				
				//new numbering system...
				//we use currentchoice - 1 because the delete option
				var tempnum = (currenttype * maxchoices) + (currentchoice - 1)
				
				garden[OverX,OverY] = tempnum
				//create the new style number
				//now tee up the variables needed
				var tempobj = gardenObjects[tempnum,0]
				var tempsprite = gardenObjects[tempnum,1]
				var tempsubimage = gardenObjects[tempnum,2]
				//now check if we need a top and bottom stat
				if tempobj = oTile {
					var temptop = gardenObjects[tempnum,3]
					var tempbottom = gardenObjects[tempnum,4]
				}
				//now create the new instance
				var newinst = instance_create_layer(mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64),"Instances",tempobj)
				with newinst {
					sprite_index = tempsprite	
					image_index = tempsubimage
					if tempobj = oTile {
						mytileimage = tempsubimage
						topcolor = temptop
						bottomcolor = tempbottom
					}
				}	
				
			}
		}
		//are you in the pallett?
		if mouse_x >= typex and mouse_x <= typex + 64*(typesArray[currenttype]+1)  and mouse_y >= typey and mouse_y <= typey + 64 {
				//find out which choice we're over and assign it
				currentchoice = (mouse_x - typex) div 64 
		}
	}
} else {
	mouseOver = false	
}
