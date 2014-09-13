// draw_sprite_planet(sprite,subimg,x,y)
// The same as draw_sprite, but it draws it scaled, positioned and rotated correctly for the planet

var _sprite, _subimg, _x, _y;
_sprite = argument0;
_subimg = argument1;
_x = argument2;
_y = argument3;

draw_sprite_ext_planet(_sprite, _subimg, _x, _y, 1, 1, 0, c_white, 1);
