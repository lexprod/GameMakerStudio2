// @desc load game

var _filename = argument0

if (file_exists(_filename)) 
{
	
	//kill gardens obstacles,gates,tiles,startys,endys,andgoats
	with (oGardenObj) { 
		instance_destroy();
	}

	with (oGate) {
		instance_destroy();
	}

	with (oTile) { 
		instance_destroy();
	}

	with (oStartY) {
		instance_destroy();
	}

	with (oEndY) {
		instance_destroy();
	}

	with (oGoat) {
		instance_destroy();
	}
	//var _wrapper = LoadJSONFromFile
	
	
	var _buffer = buffer_load( _filename )
	var _string = buffer_read( _buffer, buffer_string );
	buffer_delete( _buffer)
	
	var _json = json_decode( _string)	
	var _wrapper = _json
	
	var _list = _wrapper[? "ROOT"];
	
	for (var i = 0; i < ds_list_size(_list); i++){
		var _map = _list[| i];
		
		var _obj = _map[? "obj"];
		with (instance_create_layer(_map[? "x"],_map[? "y"],_map[? "layer"],asset_get_index(_obj))) 
		{
			//objects and goats dont require more
			sprite_index = _map[? "spr"];
			image_index = _map[? "img"];
			solidobj = _map[? "solid"];
			//gate
			if asset_get_index(_obj) == oGate 
			{
				gatelocked = _map[? "locked"];
				targetgarden = _map[? "targetgarden"];
			} else if asset_get_index(_obj) == oTile 
			{
			//tiles
				topcolor = _map[? "top"];
				bottomcolor = _map[? "bottom"];
			} else if (asset_get_index(_obj) == oStartY or asset_get_index(_obj) == oEndY)
			{
			//tiles
				topcolor = _map[? "top"];
			}
			
		}
		
	}
	//nuke data
	ds_map_destroy(_wrapper);
	//show_debug_message("loaded " + string(_filename));
	
}