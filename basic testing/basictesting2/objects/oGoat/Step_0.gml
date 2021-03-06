/// @description move controls
// 

//only operate if menu is closed
if global.menuOn == false {
#region //input udlr and space from STATE.idle
//before move check for obstacle, and if it is set mode to bumping
if state = GOAT_STATE.IDLE and oGardenMaker.editing == false{
	if keyboard_check(vk_up) {
		//targinst checks to see if there's an object in the way
		targobj = instance_place(x,y-64,oGardenObj) 
		//check for a gate too
		targgate = instance_place(x,y-64,oGate) 
		if targobj != noone and targobj.solidobj {
			//and if there is one, and its solid, then just bump in that dir
			goatBump(x,y,-1,x,y-10)
		} else if targgate != noone and targgate.solidobj {
			goatBump(x,y,-1,x,y-10)
		} else {
			state = GOAT_STATE.MOVING
			targety = y-64
		}
	} else if keyboard_check(vk_down) {
		//targinst checks to see if there's an object in the way
		targobj = instance_place(x,y+64,oGardenObj) 
		//check for a gate too
		targgate = instance_place(x,y+64,oGate) 
		if targobj != noone and targobj.solidobj {
			//and if there is one, and its solid, then just bump in that dir
			goatBump(x,y,1,x,y+10)
		} else if targgate != noone and targgate.solidobj {
			goatBump(x,y,1,x,y+10)
		} else {
			state = GOAT_STATE.MOVING
			targety = y+64
		}
	}else if keyboard_check(vk_left) {
		//targinst checks to see if there's an object in the way
		targobj = instance_place(x-64,y,oGardenObj) 
		//check for a gate too
		targgate = instance_place(x-64,y,oGate) 
		if targobj != noone and targobj.solidobj {
			//and if there is one, and its solid, then just bump in that dir
			goatBump(x,y,-1,x-10,y)
		} else if targgate != noone and targgate.solidobj {
			goatBump(x,y,-1,x-10,y)
		} else {
			state = GOAT_STATE.MOVING
			targetx = x-64
		}
	} else if keyboard_check(vk_right) {
		//targinst checks to see if there's an object in the way
		targobj = instance_place(x+64,y,oGardenObj) 
		//check for a gate too
		targgate = instance_place(x+64,y,oGate) 
		if targobj != noone and targobj.solidobj {
			//and if there is one, and its solid, then just bump in that dir
			goatBump(x,y,1,x+10,y)
		} else if targgate != noone and targgate.solidobj {
			goatBump(x,y,1,x+10,y)
		} else {
			state = GOAT_STATE.MOVING
			targetx = x+64
		}
	} else if keyboard_check_pressed(vk_space) {
		state = GOAT_STATE.FLIPPING	
				//space means FLIP all for now
		tileN = instance_place(x,y-gridsize,oTile)
		tileE = instance_place(x+gridsize,y,oTile)
		tileS = instance_place(x,y+gridsize,oTile)
		tileW = instance_place(x-gridsize,y,oTile)
	}
}
#endregion

#region //Movement handling for STATE.moving
if state = GOAT_STATE.MOVING{
	//check if we're trying to go out of bounds
	if targety < 0 {
		goatBump(x,y,-1,x,y-10)
	} else if targetx < 0 {
		goatBump(x,y,-1,x-10,y)
	} else if targety >= room_height {
		goatBump(x,y,1,x,y+10)
	} else if targetx >= room_width {
		goatBump(x,y,1,x+10,y)
	} else if targety = y and targetx = x {
		//if legit, check if we've arrived
		state = GOAT_STATE.IDLE
		//testing saving after each move
		//this increases with each move and tile flip of the oGoat
		with (oGame)
		{
			movecount +=1
			//the save file is now the next number up
			movefile = "room" + string(room) +" move" + string(movecount) + ".sav";
			saveRoom(movefile);
			//add that save file to the stack
			ds_stack_push(movelist, movefile);
			//we have to add a save to a piule
		}
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
#endregion

#region //Bumpiong off obstacles state.bumping
if state == GOAT_STATE.BUMPING {
	if y == targety and x == targetx {
		if y != bumpstarty or x != bumpstartx {
		//bump halfway done, reverse
		bumpdir = bumpdir * -1
		targety = bumpstarty
		targetx = bumpstartx
		} else if y == bumpstarty and x == bumpstartx {
			state = GOAT_STATE.IDLE
		}
	} else if y != targety {
		y = y + (bumpdir * bumpamount)
	} else if x != targetx {
		x = x + (bumpdir * bumpamount)
		
	}
	
}
#endregion

#region //goinf from FLIPPING to DECIDING WHAT TO FLIP
if state == GOAT_STATE.FLIPPING{
	tileNeighbors = 0
	if tileN != noone {tileNeighbors += 1 }
	if tileE != noone {tileNeighbors += 1 }
	if tileS != noone {tileNeighbors += 1 }
	if tileW != noone {tileNeighbors += 1 }
	if tileNeighbors == 0 {
		//nothing to flip
		state = GOAT_STATE.IDLE
	} else if tileNeighbors > 0 {
		//ok lets make a choice engine
		//create the targets
		if tileN != noone {
			// now does tileN have a north blocker?
			if instance_position(tileN.x,tileN.y-gridsize,all) == noone or instance_position(tileN.x,tileN.y-gridsize,all) == oGoat {
				choiceN = instance_create_layer(tileN.x,tileN.y,"highlights",oHighlight)
			} else {
				choiceN = instance_create_layer(tileN.x,tileN.y,"highlights",oNope)
			}
		}
		if tileE != noone {
			if instance_position(tileE.x+gridsize,tileE.y,all) == noone or instance_position(tileE.x+gridsize,tileE.y,all) == oGoat {
				choiceE = instance_create_layer(tileE.x,tileE.y,"highlights",oHighlight)
			} else {
				choiceE = instance_create_layer(tileE.x,tileE.y,"highlights",oNope)
			}
		//choiceE = instance_create_layer(tileE.x,tileE.y,"highlights",oHighlight)
		}
		if tileS != noone {
			if instance_position(tileS.x,tileS.y+gridsize,all) == noone or instance_position(tileS.x,tileS.y+gridsize,all) == oGoat {
				choiceS = instance_create_layer(tileS.x,tileS.y,"highlights",oHighlight)
			} else {
				choiceS = instance_create_layer(tileS.x,tileS.y,"highlights",oNope)
			}
		//choiceS = instance_create_layer(tileS.x,tileS.y,"highlights",oHighlight)
		}
		if tileW != noone {
		if instance_position(tileW.x-gridsize,tileW.y,all) == noone or instance_position(tileW.x-gridsize,tileW.y,all) == oGoat {
				choiceW = instance_create_layer(tileW.x,tileW.y,"highlights",oHighlight)
			} else {
				choiceW = instance_create_layer(tileW.x,tileW.y,"highlights",oNope)
			}
			//choiceW = instance_create_layer(tileW.x,tileW.y,"highlights",oHighlight)
		}
		state = GOAT_STATE.DECIDING
		//we do this so it doesn't immediately undo with space again
		keyboard_clear(vk_space)
	}
}
#endregion

#region //going from DECIDING to either cancelt o IDLE or going into WAITING for tileflip
if state == GOAT_STATE.DECIDING {
	//hey do you wanna cancel flipping???
	if keyboard_check_pressed(vk_space) {
		clearChoices()
		//kill all ohighlights instance
		destroyallobj(oHighlight)
		destroyallobj(oNope)
		state = GOAT_STATE.IDLE
	} else if keyboard_check_pressed(vk_up) {
		//hey if that was an ok tile, flippit
		//we have to check for noone first, otherwise itll try to pull an index of a non instance
		if choiceN != noone and choiceN.object_index == oHighlight {
			tileFlip(tileN,"N")
			clearChoices()
			//kill all ohighlights instance
			destroyallobj(oHighlight)
			destroyallobj(oNope)
			//this stops the goat from also moving immediately
			keyboard_clear(vk_up)
			fallingtile = tileN
			state = GOAT_STATE.WAITING
		}
	} else if keyboard_check_pressed(vk_right) {
		if choiceE != noone and choiceE.object_index == oHighlight {
			tileFlip(tileE,"E")
			clearChoices()
			//kill all ohighlights instance
			destroyallobj(oHighlight)
			destroyallobj(oNope)
			keyboard_clear(vk_right)
			fallingtile = tileE
			state = GOAT_STATE.WAITING
		}
	} else if keyboard_check_pressed(vk_down) {
		if choiceS != noone and choiceS.object_index == oHighlight {
			tileFlip(tileS,"S")
			clearChoices()
			//kill all ohighlights instance
			destroyallobj(oHighlight)
			destroyallobj(oNope)
			keyboard_clear(vk_down)
			fallingtile = tileS
			state = GOAT_STATE.WAITING
		}
	} else if keyboard_check_pressed(vk_left) {
		if choiceW != noone and choiceW.object_index == oHighlight {
			tileFlip(tileW,"W")
			clearChoices()
			//kill all ohighlights instance
			destroyallobj(oHighlight)
			destroyallobj(oNope)
			keyboard_clear(vk_left)
			fallingtile = tileW
			state = GOAT_STATE.WAITING
		}
	}
	
}
#endregion

#region //WAITING for a tile to flip and return to idle
if state == GOAT_STATE.WAITING{
	//did it stop flipping yet???
	if fallingtile.mystate = TILE_STATE.IDLE 
	{
		//back to idle
		state = GOAT_STATE.IDLE
		//and save the flip
		//testing saving after each move
		//this increases with each move and tile flip of the oGoat
		with (oGame)
		{
			movecount +=1
			//the save file is now the next number up
			movefile = "room" + string(room) +" move" + string(movecount) + ".sav";
			saveRoom(movefile);
			//add that save file to the stack
			ds_stack_push(movelist, movefile);
			//we have to add a save to a piule
		}
	}
}
#endregion	
	
}