/// @description make garden array
//array is x grid, ygrid, sprite index



deletetypes = 1

flowertypes = sprite_get_number(sFlowers)
stonetypes = sprite_get_number(sStones)
statuetypes = sprite_get_number(sStatues)
hedgetypes = sprite_get_number(sHedge)
tileYPtypes = 2 //dont count all the sprites since they animate
tileStartYTypes = sprite_get_number(sStartY)
tileEndYTypes = sprite_get_number(sEndY)
mudTypes = sprite_get_number(sMud)
gateTypes = sprite_get_number(sGate)



//I only use this array in 3 spots... I can probably gather the same info from the mega array I build
typesArray[7]= gateTypes
typesArray[6]= mudTypes
typesArray[5]= tileEndYTypes
typesArray[4]= tileStartYTypes
typesArray[3]= tileYPtypes
typesArray[2]= hedgetypes
typesArray[1]= statuetypes
typesArray[0]= flowertypes

//also starting now, stone types are out, eff em

//I want to make a 2d array with [object number, property] as the coordinates
//the object number is determined by multiplying the type numer by the max possible choices (8??) 
//and basically just backsolving for a single number
//like an object thats type 2 choice 1, would be 2*7 + 1 = 15
//then in the array, at row 17 would be the main properties across
//[n,0] is object, [n,1] is sprite, [n,2] is subimage, and [n,3] [n,4] are optional addl properties
//example gardenObjects[0,0] = oGardenObj
// gardenObjects[0,1] = sFlowers
//and i just update this array for each item type i want in the levels
//.....we're ignoring having two things on top of each other at the start of the level....
//we may never do that just for my sanity, who knows, maybe a second layer array will become a thing

enum objType {
	flowers,
	statues,
	hedges,
	YPtiles,
	Ystarts,
	Yends,
	mud,
	gates
}

maxtypes = 8 //0-8
maxchoices = 8

//initializing the current size of the array
//right now we have 6 (6-1=5) types and assume a max 8 (8-1=7) choices
//so there need to be = 0-47 rows

//we're just gonna fill it with -1
gardenObjects[((maxtypes)*(maxchoices))-1,4] = -1
for (a=0;a<maxtypes;a++) {
	for (b=0;b<maxchoices;b++){
		for (c=0;c<5;c++){
			gardenObjects[a*maxchoices +b,c] = -1 
		}
	}
}
//there we made it big

//alright, type 0 is flowers
for (i = 0; i < sprite_get_number(sFlowers); i ++) {
	//obj
	gardenObjects[objType.flowers*maxchoices + i,0] = oGardenObj
	//sprite
	gardenObjects[objType.flowers*maxchoices + i,1] = sFlowers
	//subimaGE
	gardenObjects[objType.flowers*maxchoices + i,2] = i
	//optinoals
	gardenObjects[objType.flowers*maxchoices + i,3] = -1
	gardenObjects[objType.flowers*maxchoices + i,4] = -1
}

//type 1 is statues

for (i = 0; i < sprite_get_number(sStatues); i ++) {
	//obj
	gardenObjects[objType.statues*maxchoices + i,0] = oGardenObj
	//sprite
	gardenObjects[objType.statues*maxchoices + i,1] = sStatues
	//subimaGE
	gardenObjects[objType.statues*maxchoices + i,2] = i
	//optinoals
	gardenObjects[objType.statues*maxchoices + i,3] = -1
	gardenObjects[objType.statues*maxchoices + i,4] = -1
}

//type 2 is hedges

for (i = 0; i < sprite_get_number(sHedge); i ++) {
	//obj
	gardenObjects[objType.hedges*maxchoices + i,0] = oGardenObj
	//sprite
	gardenObjects[objType.hedges*maxchoices + i,1] = sHedge
	//subimaGE
	gardenObjects[objType.hedges*maxchoices + i,2] = i
	//optinoals
	gardenObjects[objType.hedges*maxchoices + i,3] = -1
	gardenObjects[objType.hedges*maxchoices + i,4] = -1
}


//type 3 is yellow/pink tiles
//this has to be done one at a time manually to be safe
gardenObjects[objType.YPtiles*maxchoices + 0,0] = oTile
gardenObjects[objType.YPtiles*maxchoices + 0,1] = sTileYP
gardenObjects[objType.YPtiles*maxchoices + 0,2] = 0
//top color
gardenObjects[objType.YPtiles*maxchoices + 0,3] = "Y"
//bottom color
gardenObjects[objType.YPtiles*maxchoices + 0,4] = "P"

//pink up tile
gardenObjects[objType.YPtiles*maxchoices + 1,0] = oTile
gardenObjects[objType.YPtiles*maxchoices + 1,1] = sTileYP
gardenObjects[objType.YPtiles*maxchoices + 1,2] = 1
//top color
gardenObjects[objType.YPtiles*maxchoices + 1,3] = "P"
//bottom color
gardenObjects[objType.YPtiles*maxchoices + 1,4] = "Y"




//type 4 is y/p starts
for (i = 0; i < sprite_get_number(sStartY); i ++) {
	//obj
	gardenObjects[objType.Ystarts*maxchoices + i,0] = oStartY
	//sprite
	gardenObjects[objType.Ystarts*maxchoices + i,1] = sStartY
	//subimaGE
	gardenObjects[objType.Ystarts*maxchoices + i,2] = i
	//optinoals
	gardenObjects[objType.Ystarts*maxchoices + i,3] = -1
	gardenObjects[objType.Ystarts*maxchoices + i,4] = -1
}


//type 5 is y/p ends
for (i = 0; i < sprite_get_number(sEndY); i ++) {
	//obj
	gardenObjects[objType.Yends*maxchoices + i,0] = oEndY
	//sprite
	gardenObjects[objType.Yends*maxchoices + i,1] = sEndY
	//subimaGE
	gardenObjects[objType.Yends*maxchoices + i,2] = i
	//optinoals
	gardenObjects[objType.Yends*maxchoices + i,3] = -1
	gardenObjects[objType.Yends*maxchoices + i,4] = -1
}


//type 6 is mud test
for (i = 0; i < sprite_get_number(sMud); i ++) {
	//obj
	gardenObjects[objType.mud*maxchoices + i,0] = oGardenObj
	//sprite
	gardenObjects[objType.mud*maxchoices + i,1] = sMud
	//subimaGE
	gardenObjects[objType.mud*maxchoices + i,2] = i
	//optinoals
	gardenObjects[objType.mud*maxchoices + i,3] = -1
	gardenObjects[objType.mud*maxchoices + i,4] = -1
}

//type 7 is gates
//manual gate types
//a closed
	//obj
	gardenObjects[objType.gates*maxchoices + 0,0] = oGate
	//sprite
	gardenObjects[objType.gates*maxchoices + 0,1] = sGate
	//subimaGE
	gardenObjects[objType.gates*maxchoices + 0,2] = 0
	//gatelocked
	gardenObjects[objType.gates*maxchoices + 0,3] = true
	gardenObjects[objType.gates*maxchoices + 0,4] = -1
	//an open gate
	//obj
	gardenObjects[objType.gates*maxchoices + 1,0] = oGate
	//sprite
	gardenObjects[objType.gates*maxchoices + 1,1] = sGate
	//subimaGE
	gardenObjects[objType.gates*maxchoices + 1,2] = 1
	//gatelocked
	gardenObjects[objType.gates*maxchoices + 1,3] = false
	gardenObjects[objType.gates*maxchoices + 1,4] = -1


//ok feels good, now to use this object

//the type choice zone palette area
typex = x+24
typey = y-80

//current assignable category, 0= flowers, 1 = stones
currenttype = 0
//each subimage, but 0 in either set is del types
currentchoice = 0


//ok so now we need to work on a map for all the level files


if (file_exists("garden0.lvl")) {
	ini_open("garden0.lvl")
	
	//hey lets check the garden size
	gardenwidth = ini_read_real("gardensize","width",1)
	gardenheight = ini_read_real("gardensize","height",1)
	ini_close()
}

gardenpixelw = gardenwidth*64
gardenpixelh = gardenheight*64

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



