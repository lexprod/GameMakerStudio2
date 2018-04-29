//will save the garden grid to an ini
if (file_exists("gardensave.sav")) {
	file_delete("gardensave.sav")
}

ini_open("gardensave.sav")

//loops through the whole dang grid and make a garden
for (i = 0; i < gardenheight; i++) {
	for (j = 0; j < gardenwidth; j++) {
		
		ini_write_real("garden",string(j)+","+string(i),garden[j,i])
	}
}


ini_close()