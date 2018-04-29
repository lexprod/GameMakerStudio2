/// @description draw flowers
// go through the whole array

// instead of drawing sprites, we'll spawn obj
if editing {
	for (w = 0; w <gardenwidth; w++) {
		for (h = 0; h <gardenheight; h++)  {
			//show a grid if editing
			draw_sprite(sGrid,0,x+(w*64), y+(h*64))
		}
	}
}



//current setup for drawing teh cursor item
//this will have to be adjusted
if mouseOver = true {
	//0 in any type is delete
	if currentchoice = 0 {
		draw_sprite(sDelete,currentchoice,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64))
	} else switch currenttype {
		case 0:
			//flowers
			draw_sprite(sFlowers,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
		case 1:
			//stones
			draw_sprite(sStones,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
		case 2:
		//statues
			draw_sprite(sStatues,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
		case 3:
			//hedge
			draw_sprite(sHedge,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
		case 4:
			//tilesyup
			draw_sprite(sTileYP,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
		case 5:
			//tilestarty
			draw_sprite(sStartY,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
		case 6:
			//tilesendy
			draw_sprite(sEndY,currentchoice-1,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64));
			break;
	}
}

//drawing teh  palette
if editing {
	draw_set_alpha(0.7)
	draw_set_color(c_olive)
	//ok which type
	if currenttype = 0 {
		draw_rectangle(typex-10,typey-10,typex+(64*(flowertypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < flowertypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sFlowers,i-1,typex+(i*64), typey)
			}
		}
	} else if currenttype = 1 {
		//stones
			draw_rectangle(typex-10,typey-10,typex+(64*(stonetypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < stonetypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sStones,i-1,typex+(i*64), typey)
			}
		}
	} else if currenttype = 2 {
		//statues
			draw_rectangle(typex-10,typey-10,typex+(64*(statuetypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < statuetypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sStatues,i-1,typex+(i*64), typey)
			}
		}
	} else if currenttype = 3 {
		//statues
			draw_rectangle(typex-10,typey-10,typex+(64*(hedgetypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < hedgetypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sHedge,i-1,typex+(i*64), typey)
			}
		}
	} else if currenttype = 4 {
		//otiles YP
			draw_rectangle(typex-10,typey-10,typex+(64*(tileYPtypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < tileYPtypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sTileYP,i-1,typex+(i*64), typey)
			}
		}
	}else if currenttype = 5 {
		//otiles YP
			draw_rectangle(typex-10,typey-10,typex+(64*(tileStartYTypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < tileStartYTypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sStartY,i-1,typex+(i*64), typey)
			}
		}
	}else if currenttype = 6 {
		//otiles YP
			draw_rectangle(typex-10,typey-10,typex+(64*(tileEndYTypes+1))+10,typey+64+10,false)
		draw_set_alpha(1)
		for (i = 0; i < tileEndYTypes+1; i++) {
			//above the grid ugh maybe this should be its own object? nah
			if i = 0 {
				draw_sprite(sDelete,i,typex+(i*64), typey)
			} else {
				draw_sprite(sEndY,i-1,typex+(i*64), typey)
			}
		}
	}
}



