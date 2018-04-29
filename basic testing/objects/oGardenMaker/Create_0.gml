/// @description make garden array
//array is x grid, ygrid, sprite index
//gonna make a 3x3 thing for now

gardenwidth= 8
gardenheight= 8

gardenpixelw = gardenwidth*64
gardenpixelh = gardenheight*64

flowertypes = sprite_get_number(sFlowers)

//the type choice zone palette area
typex = x+24
typey = y-80

//current assignable flower
currenttype = 0


//initialize thing with -1
for (w = gardenwidth-1; w >= 0; w--) {
	for (h = gardenheight-1; h >= 0; h--) {
		//garden[w,h] = irandom_range(-1,1) //for now defaulting to 1 so I can see it exists
		garden[w,h] = -1 //all empty
	}
}

editing = true

mouseOver = false
OverX = 0
OverY = 0



