//destroy all instances of a given object
//@param obj

obj = argument0

while instance_exists(obj) {
	kill = instance_find(obj,0)
	instance_destroy(kill);
}