/// @description tab to restrtys
// You can write your code in this editor

if keyboard_check_pressed(vk_tab) {game_restart()}

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
			} else {
				levelComplete = false
			}
			//maybe make states for oGame of solving, path complete, and on end? so we dont hmmm, nah we need to always check the path
			//
		}
		// this part isnt working? or its resetting too fast....
	}
} else {
	ds_list_clear(yTilePathList)
}

