/// @description make garden array
//array is x grid, ygrid, sprite index

gardenwidth= 10
gardenheight= 6

gardenpixelw = gardenwidth*64
gardenpixelh = gardenheight*64


deletetypes = 1

flowertypes = sprite_get_number(sFlowers)
stonetypes = sprite_get_number(sStones)
statuetypes = sprite_get_number(sStatues)
hedgetypes = sprite_get_number(sHedge)
tileYPtypes = 2 //dont count all the sprites since they animate
tileStartYTypes = sprite_get_number(sStartY)
tileEndYTypes = sprite_get_number(sEndY)

typesArray[6]= tileEndYTypes
typesArray[5]= tileStartYTypes
typesArray[4]= tileYPtypes
typesArray[3]= hedgetypes
typesArray[2]= statuetypes
typesArray[1]= stonetypes
typesArray[0]= flowertypes


//the type choice zone palette area
typex = x+24
typey = y-80

//current assignable category, 0= flowers, 1 = stones
currenttype = 0
numtypes = 7
//each subimage, but 0 in either set is del types
currentchoice = 0



//initialize thing with -1
for (w = gardenwidth-1; w >= 0; w--) {
	for (h = gardenheight-1; h >= 0; h--) {
		//garden[w,h] = irandom_range(-1,1) //for now defaulting to 1 so I can see it exists
		garden[w,h] = -1 //all empty
	}
}

//now load the garden....
loadGarden()

editing = false

mouseOver = false
OverX = 0
OverY = 0



