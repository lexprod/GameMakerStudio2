/// MoveGrid(objID,dir)
/// @description MouseOn(objID,dir)
/// @param instanceID
///@param direction
mover = argument0
dir = argument1

switch (dir) {
case "up":
	mover.y -= 64;
	break;
case "down":
	mover.y += 64;
	break;
}
