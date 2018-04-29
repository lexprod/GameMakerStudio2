/// @description draw flowers
// go through the whole array

for (w = 0; w <gardenwidth; w++) {
	for (h = 0; h <gardenheight; h++)  {
		//show a grid if editing
		if editing {
			draw_sprite(sGrid,0,x+(w*64), y+(h*64))
		}
		if garden[w,h] > -1 {
			//as long as its not -1, try to draw the thing
			draw_sprite(sFlowers,garden[w,h],x+(w*64), y+(h*64))
		}
	}
}

//current setup for drawing teh cursor flower
if mouseOver = true {
	draw_sprite(sFlowers,currenttype,mouse_x-(mouse_x mod 64),mouse_y-(mouse_y mod 64))
}

//drawing teh flower palette
if editing {
	draw_set_alpha(0.7)
	draw_set_color(c_olive)
	draw_rectangle(typex-10,typey-10,typex+(64*flowertypes)+10,typey+64+10,false)
	draw_set_alpha(1)
	for (i = 0; i < flowertypes; i++) {
		//above the grid ugh maybe this should be its own object? nah
		
		draw_sprite(sFlowers,i,typex+(i*64), typey)
	}
}
