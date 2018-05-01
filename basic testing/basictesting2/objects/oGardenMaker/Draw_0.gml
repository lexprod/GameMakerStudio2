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
		//case 0:
		//	//flowers
		//	draw_sprite(sFlowers,currentchoice-1,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
		//	break;
		
		//case 1:
		////statues
		//	draw_sprite(sStatues,currentchoice-1,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
		//	break;
		//case 2:
		//	//hedge
		//	draw_sprite(sHedge,currentchoice-1,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
		//	break;
		//case 3:
		//	//tilesyup
		//	draw_sprite(sTileYP,currentchoice-1,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
		//	break;
		//case 4:
		//	//tilestarty
		//	draw_sprite(sStartY,currentchoice-1,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
		//	break;
		//case 5:
		//	//tilesendy
		//	draw_sprite(sEndY,currentchoice-1,mouse_x-(mouse_x mod gridsize),mouse_y-(mouse_y mod gridsize));
		//	break;
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
	//} else if currenttype = 1 {
	//	//statues
	//		draw_rectangle(typex-10,typey-10,typex+(gridsize*(statuetypes+1))+10,typey+gridsize+10,false)
	//	draw_set_alpha(1)
	//	for (i = 0; i < statuetypes+1; i++) {
	//		//above the grid ugh maybe this should be its own object? nah
	//		if i = 0 {
	//			draw_sprite(sDelete,i,typex+(i*gridsize), typey)
	//		} else {
	//			draw_sprite(sStatues,i-1,typex+(i*gridsize), typey)
	//		}
	//	}
	//} else if currenttype = 2 {
	//	//statues
	//		draw_rectangle(typex-10,typey-10,typex+(gridsize*(hedgetypes+1))+10,typey+gridsize+10,false)
	//	draw_set_alpha(1)
	//	for (i = 0; i < hedgetypes+1; i++) {
	//		//above the grid ugh maybe this should be its own object? nah
	//		if i = 0 {
	//			draw_sprite(sDelete,i,typex+(i*gridsize), typey)
	//		} else {
	//			draw_sprite(sHedge,i-1,typex+(i*gridsize), typey)
	//		}
	//	}
	//} else if currenttype = 3 {
	//	//otiles YP
	//		draw_rectangle(typex-10,typey-10,typex+(gridsize*(tileYPtypes+1))+10,typey+gridsize+10,false)
	//	draw_set_alpha(1)
	//	for (i = 0; i < tileYPtypes+1; i++) {
	//		//above the grid ugh maybe this should be its own object? nah
	//		if i = 0 {
	//			draw_sprite(sDelete,i,typex+(i*gridsize), typey)
	//		} else {
	//			draw_sprite(sTileYP,i-1,typex+(i*gridsize), typey)
	//		}
	//	}
	//}else if currenttype = 4 {
	//	//otiles YP
	//		draw_rectangle(typex-10,typey-10,typex+(gridsize*(tileStartYTypes+1))+10,typey+gridsize+10,false)
	//	draw_set_alpha(1)
	//	for (i = 0; i < tileStartYTypes+1; i++) {
	//		//above the grid ugh maybe this should be its own object? nah
	//		if i = 0 {
	//			draw_sprite(sDelete,i,typex+(i*gridsize), typey)
	//		} else {
	//			draw_sprite(sStartY,i-1,typex+(i*gridsize), typey)
	//		}
	//	}
	//}else if currenttype = 5 {
	//	//otiles YP
	//		draw_rectangle(typex-10,typey-10,typex+(gridsize*(tileEndYTypes+1))+10,typey+gridsize+10,false)
	//	draw_set_alpha(1)
	//	for (i = 0; i < tileEndYTypes+1; i++) {
	//		//above the grid ugh maybe this should be its own object? nah
	//		if i = 0 {
	//			draw_sprite(sDelete,i,typex+(i*gridsize), typey)
	//		} else {
	//			draw_sprite(sEndY,i-1,typex+(i*gridsize), typey)
	//		}
	//	}
	//}




