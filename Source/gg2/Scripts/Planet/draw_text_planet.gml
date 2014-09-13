// draw_text_planet(x,y,string)
// The same as draw_text, but it draws it scaled, positioned and rotated correctly for the planet

var _x, _y, _string;
_x = argument0;
_y = argument1;
_string = argument2;

draw_text_transformed_planet(_x, _y, _string, 1, 1, 0);
