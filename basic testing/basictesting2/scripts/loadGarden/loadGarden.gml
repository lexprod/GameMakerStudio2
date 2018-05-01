//loads the garden from save

//will save the garden grid to an ini
if (file_exists("gardensave.sav")) {
	ini_open("gardensave.sav")
	
		//loops through the whole dang grid and make a garden
	for (i = 0; i < gardenheight; i++;) {
		for (j = 0; j < gardenwidth; j++;) {
			//ini_write_real("garden",string(j)+","+string(i),garden[j,i])
			//fill the array and also instances create?
			var loadthing = ini_read_real("garden",string(j)+","+string(i),-1)
			garden[j,i] = loadthing
			//show_debug_message(string(loadthing))
			if loadthing > -1 {
				//hey this is a real thing, lets make that instance!
				/* old
				//backsolve the number
				var tempchoice = 0
				var temptype = 0
				//is it just n < loadthing?
				for (n = 1 ; n < loadthing ; n++) {
					//add the number of the previous type
					tempchoice = tempchoice + 1
					if tempchoice == typesArray[temptype] {
						tempchoice = 0
						temptype = temptype + 1
					}
				}
				show_debug_message("I'm trying to do " + string(temptype) + "times " + string(maxchoices) + "plus " + string(tempchoice))
				*/
				var tempnum = loadthing 
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
				var newinst = instance_create_layer(x+(j*gridsize), y+(i*gridsize),"Instances",tempobj)
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
	}
	ini_close()
}



