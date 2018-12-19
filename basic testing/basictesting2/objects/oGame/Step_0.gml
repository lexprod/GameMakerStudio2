/// @description tab to restrtys
// You can write your code in this editor

if keyboard_check(vk_control) and keyboard_check_pressed(vk_enter) {
	debugOn = !debugOn
	show_debug_message("debug is " + string(debugOn))
}


if debugOn {
	if keyboard_check_pressed(vk_tab) {
		killAllSavs()
		room_restart()
	}
	if keyboard_check_pressed(vk_home) {
		killAllSavs()
		game_restart()
	}
}



//SAVING UNDO STATES

//hvae we made the first one yet?
if ds_stack_empty(movelist)
{
	//the save file is now the next number up
	movefile = "room" + string(room) +" move" + string(movecount) + ".sav";
	saveRoom(movefile);
	//add that save file to the stack
	ds_stack_push(movelist, movefile);
	//we have to add a save to a piule
}

#region //Z for undo and r to restart ONLY allow undos and redos if the movecount isnt 0 still

if keyboard_check_pressed(ord("Z")) 
{
	//bail out of deciding just in case
	with oGoat 
	{
		clearChoices()
		//kill all ohighlights instance
		destroyallobj(oHighlight)
		destroyallobj(oNope)
		state = GOAT_STATE.IDLE
	}
	//is there any undos to undo?
	if ds_stack_size(movelist) > 0 {
		//ok what was the last save?
		movefile = ds_stack_pop(movelist);
		loadRoom(movefile)
		//and go down one move
		//never go below 0
		movecount = max(0,movecount-1)
		//also delete that undo?
		file_delete(movefile)
	}
} else if keyboard_check_pressed(ord("R"))
{
	//bail out of deciding just in case
	with oGoat 
	{
		clearChoices()
		//kill all ohighlights instance
		destroyallobj(oHighlight)
		destroyallobj(oNope)
		state = GOAT_STATE.IDLE
	}
	//time to restart
	//so pop each move file until movecount = 0?
	restartUndos()
	//load the last one
	movefile = ds_stack_pop(movelist);
	loadRoom(movefile)
	movecount = 0
}
#endregion




#region ///YELLOW PATH CHECKING
//dont turn on if we're editing
if oGardenMaker.editing == false {
	//if there is a start tile, lets see if there's a path
	if instance_exists(oStartY) and instance_exists(oEndY) {
		var endTile = instance_find(oEndY,0)
		//ok theres a start and end
		//we need to put the start tile into a list
		// we need to clear out the list to prep for this check
		ds_list_clear(yTilePathList)
		//if we have a pink or other color path, that'll be in a diff thing
		ds_list_add(yTilePathList,oStartY)
	
		//ok now for every item in the list, which will be growing, we'll check all four neighbors
		for (i = 0; i < ds_list_size(yTilePathList); i++) {
			//using the next tile in the list
			testingtile = ds_list_find_value(yTilePathList,i)
			with testingtile {
				//is there a tile to the north?
				var northtile = instance_position(x,y-gridsize,oTile)
				//if its not a normal tile, hey is it the end tile?
				if northtile == noone {
					//is it an end tile?
					northtile = instance_position(x,y-gridsize,oEndY)
					if northtile != noone {
						//hey we found an end tile, have we already seen it?
						if (ds_list_find_index(other.yTilePathList,northtile) == -1) {
							//if not let's put it in the list
							ds_list_add(other.yTilePathList,northtile)
						}
					}
				}
				//have we already added this tile?
				if (ds_list_find_index(other.yTilePathList,northtile) == -1) {
					if northtile != noone {
						//ok but is this tile yellow side up?
						if northtile.topcolor == "Y" {
							//if so, put it in the path list
							ds_list_add(other.yTilePathList,northtile)
						}
					}
				}
				var easttile = instance_position(x+gridsize,y,oTile)
				//if its not a normal tile, hey is it the end tile?
				if easttile == noone {
					//is it an end tile?
					easttile = instance_position(x+gridsize,y,oEndY)
					if easttile != noone {
						//hey we found an end tile, have we already seen it?
						if (ds_list_find_index(other.yTilePathList,easttile) == -1) {
							//if not let's put it in the list
							ds_list_add(other.yTilePathList,easttile)
						}
					}
				}
				if (ds_list_find_index(other.yTilePathList,easttile) == -1) {
					if easttile != noone {
						//ok but is this tile yellow side up?
						if easttile.topcolor == "Y" {
							//if so, put it in the path list
							ds_list_add(other.yTilePathList,easttile)
						}
					}
				}
				var	southtile = instance_position(x,y+gridsize,oTile)
				//if its not a normal tile, hey is it the end tile?
				if southtile == noone {
					//is it an end tile?
					southtile = instance_position(x,y+gridsize,oEndY)
					if southtile != noone {
						//hey we found an end tile, have we already seen it?
						if (ds_list_find_index(other.yTilePathList,southtile) == -1) {
							//if not let's put it in the list
							ds_list_add(other.yTilePathList,southtile)
						}
					}
				}
				if (ds_list_find_index(other.yTilePathList,southtile) == -1) {
					if southtile != noone {
						//ok but is this tile yellow side up?
						if southtile.topcolor == "Y" {
							//if so, put it in the path list
							ds_list_add(other.yTilePathList,southtile)
						}
					}
				}
				var	westtile = instance_position(x-gridsize,y,oTile)
				//if its not a normal tile, hey is it the end tile?
				if westtile == noone {
					//is it an end tile?
					westtile = instance_position(x-gridsize,y,oEndY)
					if westtile != noone {
						//hey we found an end tile, have we already seen it?
						if (ds_list_find_index(other.yTilePathList,westtile) == -1) {
							//if not let's put it in the list
							ds_list_add(other.yTilePathList,westtile)
						}
					}
				}
				if (ds_list_find_index(other.yTilePathList,westtile) == -1) {
					if westtile != noone {
						//ok but is this tile yellow side up?
						if westtile.topcolor == "Y" {
							//if so, put it in the path list
							ds_list_add(other.yTilePathList,westtile)
						}
					}
				}
			}
		}
		//if its a success, at some point we'll open the exit gate, but for now just make it a win
		if ds_list_find_index(yTilePathList,endTile) == -1 {
			//no end on path
			//show_debug_message(string("i cant find an end"))
			yPathComplete = false
			levelComplete = false
		} else {
			//show_debug_message(string(ds_list_find_index(yTilePathList,endTile)) + "is where the end is")
			//end is on path, its good
			yPathComplete = true
			//but we must check now that the player is at the end sooooooo
			if collision_point(endTile.x,endTile.y,oGoat,false,true){
				levelComplete = true
				//open all the gates????
				for ( n = 0; n < instance_number(oGate); n++)
				{
					var ngate = instance_find(oGate,n)
					ngate.gatelocked = false
				}
			} else {
				//we don't turn it off here, so that it will REMAIN open now that it's been solved. we'll have to do something to paste down the tiles I guess?
			}
			//maybe make states for oGame of solving, path complete, and on end? so we dont hmmm, nah we need to always check the path
			//
		}
		// this part isnt working? or its resetting too fast....
	} else {
		//there's no start and end tile here, clear out the completion
		yPathComplete = false
		levelComplete = false
	}
} else {
	ds_list_clear(yTilePathList)
}
#endregion



#region //ok so what if you are in charge of goat going through gates

//for dumb reasons I need to wait a shole step
			if RoomReady = true{
				show_debug_message("room is ready")
				loadGarden(gametargetgarden)
				RoomReady = false
			}
			
//wait until goat is done moving??
if instance_exists(oGoat) and collision_point(oGoat.x,oGoat.y,oGate,false,false) and oGoat.state = GOAT_STATE.IDLE{
	//show_debug_message("I touched a gate")
	gatecol = instance_position(oGoat.x,oGoat.y,oGate)
	//show_debug_message("my lock is" +string(gatecol.gatelocked) + " and my target room is " + string(gatecol.targetroomindex))
	with (gatecol) {
		//show_debug_message("checking lock")
		if gatelocked == false {
		//if its unlocked, GO
		//show_debug_message("GO TO ROOM")
		
		//what if we just made it persistent?
		//room_instance_add(targetroomindex,gridsize*2,gridsize*2,oGardenMaker)
			
			
			
			//this is to make sure you can still see the level editor in the room
			//add that the goat wont start in the garden, with weird collision
			//the goat will add itself to the goat layer
			if targetgarden == "rMap"{
				room_goto(rMap)
			} else {
				room_goto(rPuzzleGarden)
			}
			oGame.RoomReady = true
			oGame.gametargetgarden = targetgarden
			//show_debug_message("I am in room" + RoomToString(room) + " and the targetgarden is " + targetgarden)
			//hey instead here is where the graden stuff happens
			//loadGarden(targetgarden)
			
			//unsolve the level
			other.yPathComplete = false
			other.levelComplete = false
			
			with oGame{
				killAllSavs()
			}
			////dump the stack for undos
			//other.movecount = 0
			////this stack stores the filename of each and every save of each move holy cow
			////FILO methodology
			//ds_stack_clear(other.movelist);
			
			//movestodelete = true
			////let's clear out any old undo saves just in case

			////this will be a script in future maybe
			////clear all undos
			//while (movestodelete = true)
			//{
			//	var _file = file_find_first("*.sav", 0);
			//	//if an empty string is returned, then we're done!
			//	if _file == "" 
			//	{
			//		movestodelete = false
			//	} else 
			//	{
			//		//otherwise, there's a .sav, kill it!
			//		file_delete(_file)
			//	}
			//}
		} else {
			//show_debug_message("its locked")
		}
	}
	
}
#endregion




