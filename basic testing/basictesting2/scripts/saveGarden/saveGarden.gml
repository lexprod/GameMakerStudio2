//will save the garden grid to an ini


var levelsavename = "garden" + string(room) + ".lvl"


if (file_exists(levelsavename)) {
	file_delete(levelsavename)
}

ini_open(levelsavename)

//might as well label the room inside the file too?
ini_write_real("garden name","room",room)
//save the size
ini_write_real("gardensize","width",gardenwidth)
ini_write_real("gardensize","height",gardenheight)

//loops through the whole dang grid and make a garden
for (i = 0; i < gardenheight; i++) {
	for (j = 0; j < gardenwidth; j++) {
		
		ini_write_real("garden",string(j)+","+string(i),garden[j,i])
	}
}


ini_close()