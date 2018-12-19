//will save the garden grid to an ini
/// @arg garden to load

var gardenname = argument0
//what if something besides room name determined garden name? that way I dont need empty rooms...


var levelsavename = "garden" + gardenname + ".lvl"


if (file_exists(levelsavename)) {
	file_delete(levelsavename)
}

ini_open(levelsavename)

//might as well label the room inside the file too?
ini_write_string("garden name","room",string(room_get_name(room)))
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