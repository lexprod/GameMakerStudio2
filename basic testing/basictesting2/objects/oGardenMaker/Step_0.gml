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
		currenttype = (currenttype + 1) mod numtypes
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
				var tempnum = 0
				for (i = 0 ; i < currenttype ; i++) {
					//add the number of the previous type
					tempnum = tempnum + typesArray[i]
				}
				garden[OverX,OverY] = tempnum + currentchoice
				//show_debug_message("I'm a " +string(tempnum + currentchoice))
				//logged in array, now spawn an obj
				switch currenttype {
					case 0:
						spawnsprite = sFlowers;
						break;
					case 1:
						spawnsprite = sStones;
						break;
					case 2:
						spawnsprite = sStatues;
						break;
					case 3:
						spawnsprite = sHedge;
						break;
					case 4:
						spawnsprite = sTileYP
						break;
					case 5:
						spawnsprite = sStartY;
						break;
					case 6:
						spawnsprite = sEndY;
						break;
				}
				
				//ok we know which type of sprite and which subimage, let's build
				//is it a tile??
				if currenttype == 4 {
					spawnobj = instance_create_layer(mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64), "Instances", oTile)
					//is it updside down???
					if currentchoice -1 == 1 {
						with spawnobj {
							//pink on top
							topcolor = "P"
							bottomcolor = "Y"
							mytileimage = 1
						}
					}
				} else if currenttype == 5 {
					spawnobj = instance_create_layer(mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64), "Instances", oStartY)
				} else if currenttype == 6 {
					spawnobj = instance_create_layer(mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64), "Instances", oEndY)
				} else {
					spawnobj = instance_create_layer(mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64), "Instances", oGardenObj)
				}
				with spawnobj {
					
					sprite_index = other.spawnsprite
							
					image_index = (other.currentchoice - 1) //because 0 is delete
				}
			}
		}
		//is the mouse over the palette?
		
		if mouse_x >= typex and mouse_x <= typex + 64*(typesArray[currenttype]+1)  and mouse_y >= typey and mouse_y <= typey + 64 {
			//find out which choice we're over and assign it
			currentchoice = (mouse_x - typex) div 64 
			
			
		}
	}
} else {
	mouseOver = false	
}
