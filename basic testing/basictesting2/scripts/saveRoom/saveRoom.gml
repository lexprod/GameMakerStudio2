//will save all objects using json??
var _filename = argument0

//create a root list
var _root_list = ds_list_create();

//for each rando obj, create a map
with (oGardenObj) {
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
	ds_map_add(_map, "spr", sprite_index);
	ds_map_add(_map, "img", image_index);
	ds_map_add(_map, "layer", layer);
	ds_map_add(_map, "solid", solidobj);
}
//now add the gates
with (oGate) {
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
	ds_map_add(_map, "spr", sprite_index);
	ds_map_add(_map, "img", image_index);
	ds_map_add(_map, "layer", layer);
	ds_map_add(_map, "solid", solidobj);
	//gate
	ds_map_add(_map, "locked", gatelocked);
	ds_map_add(_map, "targetroom", targetroomindex);
}

//the tiles
with (oTile) {
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
	ds_map_add(_map, "spr", sprite_index);
	ds_map_add(_map, "img", image_index);
	ds_map_add(_map, "layer", layer);
	//tiles
	ds_map_add(_map, "top", topcolor);
	ds_map_add(_map, "bottom", bottomcolor);
}
//starts
with (oStartY) {
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
	ds_map_add(_map, "spr", sprite_index);
	ds_map_add(_map, "img", image_index);
	ds_map_add(_map, "layer", layer);
	//tiles starts
	ds_map_add(_map, "top", topcolor);
}


//and ends
with (oEndY) {
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
	ds_map_add(_map, "spr", sprite_index);
	ds_map_add(_map, "img", image_index);
	ds_map_add(_map, "layer", layer);
	//tiles starts
	ds_map_add(_map, "top", topcolor);
}

//and the goat
with (oGoat) {
	var _map = ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
	ds_map_add(_map, "spr", sprite_index);
	ds_map_add(_map, "img", image_index);
	ds_map_add(_map, "layer", layer);
}

	
//wrapping the root list in a map
var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

//save toa  string
var _string  = json_encode(_wrapper);
//SaveStringToFile("testsave.sav", _string);

//var _filename = "testsave.sav"
//also argument for string

var _buffer = buffer_create(string_byte_length( _string)+1, buffer_fixed, 1);
buffer_write( _buffer, buffer_string, _string);
buffer_save( _buffer, _filename);
buffer_delete( _buffer);

//nuke data//
ds_map_destroy(_wrapper);

show_debug_message("saved " + string(_filename));
	