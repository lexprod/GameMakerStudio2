/// @description draw flowers
// go through the whole array


// instead of drawing sprites, we'll spawn obj
if editing {
	for (w = 0; w <gardenwidth; w++) {
		for (h = 0; h <gardenheight; h++)  {
			//show a grid if editing
			draw_sprite(sGrid,0,x+(w*gridsize), y+(h*gridsize))
		}
	}
}



//current setup for drawing teh cursor item
//this will have to be adjusted
if mouseOver = true {
	//0 in any type is delete
	if currentchoice = 0 {
		draw_sprite(sDelete,currentchoice,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize))
	} else {
		var tempn = (currenttype * maxchoices) + (currentchoice - 1)
		var tempdrawsprite = gardenObjects[tempn,1]
		var tempdrawsub = gardenObjects[tempn,2]
		
		draw_sprite(tempdrawsprite,tempdrawsub,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
	}
}

//drawing teh  palette
if editing {
	draw_set_alpha(0.7)
	draw_set_color(c_black)
	//ok itll always just be the same size idk
	draw_rectangle(typex-10,typey-10,typex+(gridsize*(maxchoices))+10,typey+gridsize+10,false)
	draw_set_alpha(1)
	for (i=0; i< maxchoices+1;i++){
		//start with the delete
		if i = 0 {
				draw_sprite(sDelete,i,typex+(i*gridsize), typey)
		} else {
			//ok each time there is a thing in this type
			if gardenObjects[currenttype*maxchoices + (i-1),0] != -1 {
				//well draw it
				var dspr = gardenObjects[currenttype*maxchoices + (i-1),1]
				var dsub = gardenObjects[currenttype*maxchoices + (i-1),2]

				draw_sprite(dspr,dsub,typex+(i*gridsize), typey)
			}
		}
	}
}




