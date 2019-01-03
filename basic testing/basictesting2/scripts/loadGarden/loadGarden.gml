///@desc loads the garden from save
/// @arg garden to load

var gardenname = argument0
//loads the garden from save
show_debug_message("I'm laoding  garden " + gardenname + " in room "+ string(room_get_name(room)))

//based on the room we're loading, make that file save name

var levelsavename = "garden" + gardenname + ".lvl"
//show_debug_message("loading " + levelsavename)

//gardenmaker needs to do this
with oGardenMaker {
	
	//will save the garden grid to an ini
	//this updates so the save knows what to save
		currentGarden = gardenname
	if (file_exists(levelsavename)) {
		
		
		ini_open(levelsavename)
	
		//hey lets check the garden size
		gardenwidth = ini_read_real("gardensize","width",1)
		gardenheight = ini_read_real("gardensize","height",1)
	
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
				
					var tempnum = loadthing 
					//create the new style number
					//now tee up the variables needed
					var tempobj = gardenObjects[tempnum,0]
					var tempsprite = gardenObjects[tempnum,1]
					var tempsubimage = gardenObjects[tempnum,2]
					//now check if we need a top and bottom stat
					if tempobj = oTile {
						//assign the color states properly
						var temptop = gardenObjects[tempnum,3]
						var tempbottom = gardenObjects[tempnum,4]
					} else if tempobj = oGate{
						//check if open or shut
						var glock = gardenObjects[tempnum,3]
					}
					//now create the new instance
					var newinst = instance_create_layer(x+(j*gridsize), y+(i*gridsize),"Instances",tempobj)
					if tempobj == oGoat {
						show_debug_message("???????????")
					}
					with newinst {
						sprite_index = tempsprite	
						image_index = tempsubimage
						if tempobj = oTile {
							//mytileimage = tempsubimage
							topcolor = temptop
							bottomcolor = tempbottom
						} else if tempobj = oGate {
							gatelocked = glock
						}
					}
				} 
			}
		}
		ini_close()
	}

	if !instance_exists(oGoat) {
		//show_debug_message("im birthing a goat")
		instance_create_layer(gridsize*1,gridsize*1,"Goat",oGoat)
	}
					//if the goat and a start tile exist, put the goat on it I guessss
	if instance_exists(oStartY) {
		var goatfriend = instance_find(oGoat,0)
		var start = instance_find(oStartY,0)
		goatfriend.x = start.x
		goatfriend.y = start.y
		//we have to do these otherwise the first step is a MESS
		goatfriend.targetx = start.x
		goatfriend.targety = start.y
		goatfriend.leftx = start.x-gridsize
		goatfriend.rightx = start.x + gridsize
		goatfriend.upy = start.y - gridsize
		goatfriend.downy = start.y + gridsize
	} 

	//and assign gates
	if instance_exists(oGate) {
		//show_debug_message("loadGardensays there are " + string(instance_number(oGate)) + " gates" )
		loadGates(gardenname)	
	}
}

//hey new cam plz
//now do pretty stuff
if instance_exists(oCamControl){
	newRoomCam()
}




