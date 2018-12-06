///@desc draw a nine slice box of a given sprite
/// @arg sprite
/// @arg x1
/// @arg y1
/// @arg x2
/// @arg y2

var _size = floor( sprite_get_width(argument0) / 3)
//slice size
var _x1 = argument1
var _y1 = argument2
var _x2 = argument3
var _y2 = argument4
var _w = _x2 - _x1
var _h = _y2 - _y1
var _columns = _w div _size
var _rows = _h div _size

//corners
//top left
draw_sprite_part(argument0,0,0,0,_size,_size,_x1,_y1)
//top right
draw_sprite_part(argument0,0,2*_size,0,_size,_size,_x1 + (_columns * _size) ,_y1)
//bottom left
draw_sprite_part(argument0,0,0, 2* _size ,_size,_size, _x1, _y1 + (_rows * _size))
//bottom right
draw_sprite_part(argument0,0,2*_size, 2* _size ,_size,_size,_x1 + (_columns * _size),_y1 + (_rows * _size))

//edges
for (var i = 1; i < (_rows); i++;) {
	//left edge
	draw_sprite_part(argument0,0,0, _size, _size, _size, _x1 , _y1 + (i * _size))
	//right edge
	draw_sprite_part(argument0,0, 2*_size, _size, _size, _size, _x1 + ((_columns - 1) * _size) , _y1 + (i * _size))
}
