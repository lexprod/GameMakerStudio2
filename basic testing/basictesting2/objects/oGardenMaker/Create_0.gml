/// @description make garden array
//array is x grid, ygrid, sprite index

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
	gates
}

maxtypes = 7 //0-8
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

#region //flowers into array
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
#endregion

//type 1 is statues
#region //statues into array
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
#endregion

#region //type 2 is hedges

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
#endregion


#region //type 3 is yellow/pink tiles
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
#endregion




#region //type 4 is y/p starts
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
#endregion

#region//type 5 is y/p ends
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
#endregion


#region //type 6 is gates
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
#endregion

//ok feels good, now to use this object

//the type choice zone palette area
typex = x+24
typey = y-80

//current assignable category, 0= flowers, 1 = stones
currenttype = 0
//each subimage, but 0 in either set is del types
currentchoice = 0


//ok so now we need to work on a map for all the level files


if (file_exists("gardenrMap.lvl")) {
	ini_open("gardenrMap.lvl")
	
	//hey lets check the garden size
	gardenwidth = ini_read_real("gardensize","width",1)
	gardenheight = ini_read_real("gardensize","height",1)
	ini_close()
} else {
	gardenwidth = 1
	gardenheight = 1
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
// the room code does this now, so dont? loadGarden()



editing = false

mouseOver = false
OverX = 0
OverY = 0

currentGarden = "rMap"

loadGarden(currentGarden)

