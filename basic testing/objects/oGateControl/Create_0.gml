/// @description set variables and level obj
// You can write your code in this editor

//gate data goes x, y, room
gatedata[3,2] = 4
gatedata[3,1] = 0
gatedata[3,0] = 64*4
gatedata[2,2] = 3
gatedata[2,1] = 0
gatedata[2,0] = 64*3
gatedata[1,2] = 2
gatedata[1,1] = 0
gatedata[1,0] = 64*2
gatedata[0,2] = 1
gatedata[0,1] = 0
gatedata[0,0] = 64

for (i = 0; i < array_height_2d(gatedata); i++) {
		newgate = instance_create_layer(gatedata[i,0],gatedata[i,1],"Gates",oGate)
		newgate.targetroomindex = gatedata[i,2]
		
}
