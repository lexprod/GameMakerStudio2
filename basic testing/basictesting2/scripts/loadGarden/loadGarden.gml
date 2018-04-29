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
				switch temptype {
					case 0:
						tempsprite = sFlowers;
						break;
					case 1:
						tempsprite = sStones;
						break;
					case 2:
						tempsprite = sStatues;
						break;
					case 3:
						//show_debug_message(string(loadthing) + "became a hedge")
						tempsprite = sHedge;
						break;
					case 4:
						tempsprite = sTileYP;
						break;
					case 5:
						tempsprite = sStartY;
						break;
					case 6:
						tempsprite = sEndY;
						break;
				}
				
				if temptype == 4 {
					//if its a tile, then
					var tempobj = instance_create_layer(x+(j*64), y+(i*64),"Instances",oTile)
					with tempobj {
						sprite_index = other.tempsprite			
						mytileimage = tempchoice
						if tempchoice == 1 {
							//pink on top
							show_debug_message(string(loadthing) + "became a pink")
							topcolor = "P"
							bottomcolor = "Y"
						}
					}
				} else if temptype == 5 {
					//if its a tile, then
					var tempobj = instance_create_layer(x+(j*64), y+(i*64),"Instances",oStartY)
					with tempobj {
						sprite_index = other.tempsprite			
						image_index = tempchoice
					}
				} else if temptype == 6 {
					//if its a tile, then
					var tempobj = instance_create_layer(x+(j*64), y+(i*64),"Instances",oEndY)
					with tempobj {
						sprite_index = other.tempsprite			
						image_index = tempchoice
					}
				} else {
					
					var tempobj = instance_create_layer(x+(j*64), y+(i*64),"Instances",oGardenObj)
				
					with tempobj {
						sprite_index = other.tempsprite			
						image_index = tempchoice
					}
				}
				//draw_sprite(sGrid,0,x+(w*64), y+(h*64))
				//garden[OverX,OverY] = tempnum + currentchoice
			}
			
		}
	}
	ini_close()
}



