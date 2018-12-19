/// @description set variables and level obj
// You can write your code in this editor


//gate data goes room of origin, gate destination 1, 2, etc

gatedata[5,3] = "r3"
gatedata[5,2] = "r2"
gatedata[5,1] = "rMap"
gatedata[5,0] = "rHall5"

gatedata[4,3] = "r3"
gatedata[4,2] = "r2"
gatedata[4,1] = "rMap"
gatedata[4,0] = "rHall4"

gatedata[3,3] = "r1"
gatedata[3,2] = "r0"
gatedata[3,1] = "rMap"
gatedata[3,0] = "rHall3"

gatedata[2,3] = "r3"
gatedata[2,2] = "r2"
gatedata[2,1] = "rMap"
gatedata[2,0] = "rHall2"

gatedata[1,9] = "r6"
gatedata[1,8] = "r6"
gatedata[1,7] = "r5"
gatedata[1,6] = "r4"
gatedata[1,5] = "r3"
gatedata[1,4] = "r2"
gatedata[1,3] = "r1"
gatedata[1,2] = "r0"
gatedata[1,1] = "rMap"
gatedata[1,0] = "rHall1"


gatedata[0,5] = "rHall5"
gatedata[0,4] = "rHall4"
gatedata[0,3] = "rHall3"
gatedata[0,2] = "rHall2"
gatedata[0,1] = "rHall1"
gatedata[0,0] = "rMap"


//check our room, and then do that loop
//loadGates()
//rmap and rhall need detail
//specific rooms do not need detail, both gates go home


//for (i = 0; i < array_height_2d(gatedata); i++) {
//		newgate = instance_create_layer(gatedata[i,0],gatedata[i,1],"Gates",oGate)
//		newgate.targetroomindex = asset_get_index(gatedata[i,2])		
//}

//gatedata = 0
