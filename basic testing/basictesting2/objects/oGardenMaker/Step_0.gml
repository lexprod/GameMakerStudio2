/// @description Insert description here
// You can write your code in this editor

//keep yourself in the instance layer
if layer != "Instances" {
	layer_add_instance("Instances",self)
}


if oGame.debugOn {
	if keyboard_check_pressed(vk_shift){
		editing = not editing
		currenttype = 0
		currentchoice = 0
		OverX = 0
		OverY = 0
		saveGarden();
	}
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
	#region //when a click happens...
	if mouse_check_button_pressed(mb_left){
		//is the mouse in the garden?
		
		if mouseOver = true{
			//if we're on delete, delete it
			
			if currentchoice = 0 {
				//erase it with -1
				garden[OverX,OverY] = -1
				todelete = instance_position(mouse_x, mouse_y, all)
				if todelete != noone  {
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
				} else if tempobj = oGate {
					var glock = gardenObjects[tempnum,3]
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
					} else if tempobj = oGate {
						gatelocked = glock
					}
				}	
				
			}
		}
		//are you in the pallett?
		if mouse_x >= typex and mouse_x <= typex+(gridsize*(maxchoices))  and mouse_y >= typey and mouse_y <= typey + 64 {
				
				//find out which choice we're over and assign it
				currentchoice = (mouse_x - typex) div 64 
		}
	}
	#endregion
	#region //ok also while editing, we can resize the grid/garden how we see fit
	//when an arrow is pressed
	//first let's try the up arrow to reduce rows
	if keyboard_check_pressed(vk_up) {
		//hey would this reduce the rows to 0? if so we should stop
		//so make sure we currently have 2 or more rows
		if gardenheight > 1 {
			//the coast is clear! time to remove the last row of the array
			//so first we make a clone of the original array
			//initialize it
			//a dirty double for loop to dump the one array into the other
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//cloning each entry
					tempgarden[w,h] = garden[w,h]
				}
			}
			//now we need to delete the original garden
			garden = 0
			//and rescope and build the garden array with its new size
			gardenheight= gardenheight - 1
			gardenpixelh = gardenheight*64
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//cloning the relevant entries, it will automatically skip the last h row
					garden[w,h] = tempgarden[w,h]
				}
			}		
			//delete the tempgarden array
			tempgarden = 0
		}	
	}
	if keyboard_check_pressed(vk_down) {
		//would this bleed off the room map? if so we should stop
		//so check if y + current pixel height + gridsize would fit in the room
		if y + gardenpixelh + gridsize <= room_height {
			//the coast is clear! time to add a row of the array
			//so first we make a clone of the original array
			//initialize it
			//a dirty double for loop to dump the one array into the other
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//cloning each entry
					tempgarden[w,h] = garden[w,h]
				}
			}
			//now we need to delete the original garden
			garden = 0
			//and rescope and build the garden array with its new size
			gardenheight= gardenheight + 1
			gardenpixelh = gardenheight*64
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//first if we're on the final new row, we need to dump in new -1 vals
					if h == (gardenheight - 1) {
						garden[w,h] = -1
					} else {
						//cloning the relevant entries
						garden[w,h] = tempgarden[w,h]
					}
				}
			}		
			//delete the tempgarden array
			tempgarden = 0
		}
	}
	//first let's try the left arrow to remove a column
	if keyboard_check_pressed(vk_left) {
		//hey would this reduce the columns to 0? if so we should stop
		//so make sure we currently have 2 or more columns
		if gardenwidth > 1 {
			//the coast is clear! time to remove the last column of the array
			//so first we make a clone of the original array
			//initialize it
			//a dirty double for loop to dump the one array into the other
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//cloning each entry
					tempgarden[w,h] = garden[w,h]
				}
			}
			//now we need to delete the original garden
			garden = 0
			//and rescope and build the garden array with its new size
			gardenwidth= gardenwidth - 1
			gardenpixelw = gardenwidth*gridsize
			for (w = gardenwidth-1; w >= 0; w--) {
				//this should automatically skip the last column "w"
				for (h = gardenheight-1; h >= 0; h--) {
					//cloning the relevant entries
					garden[w,h] = tempgarden[w,h]
				}
			}		
			//delete the tempgarden array
			tempgarden = 0
		}	
	}
	if keyboard_check_pressed(vk_right) {
		//would this bleed off the room map? if so we should stop
		//so check if x + current pixel width + gridsize would fit in the room
		if x + gardenpixelw + gridsize <= room_width {
			//the coast is clear! time to add a column of the array
			//so first we make a clone of the original array
			//initialize it
			//a dirty double for loop to dump the one array into the other
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//cloning each entry
					tempgarden[w,h] = garden[w,h]
				}
			}
			//now we need to delete the original garden
			garden = 0
			//and rescope and build the garden array with its new size
			gardenwidth= gardenwidth + 1
			gardenpixelw = gardenwidth*64
			for (w = gardenwidth-1; w >= 0; w--) {
				for (h = gardenheight-1; h >= 0; h--) {
					//if we're in the new final column, dump new -1 vals
					if w == (gardenwidth-1) {
						garden[w,h] = -1
					} else {
						//cloning the relevant entries
						garden[w,h] = tempgarden[w,h]
					}
				}
			}		
			//delete the tempgarden array
			tempgarden = 0
		}
	}
	#endregion
} else {
	mouseOver = false	
}
