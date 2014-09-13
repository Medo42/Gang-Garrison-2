// draw_text_transformed_planet(x,y,string,xscale,yscale,angle)
// The same as draw_text_transformed, but it draws it scaled, positioned and rotated correctly for the planet

var _x, _y, _string, _xscale, _yscale, _angle;
_x = argument0;
_y = argument1;
_string = argument2;
_xscale = argument3;
_yscale = argument4;
_angle = argument5;

var list, drawX, drawY, scaleX, scaleY, drawAngle;
list = planetMapPosToPlanetPos(_x, _y);
drawX = ds_list_find_value(list, 2);
drawY = ds_list_find_value(list, 3);
scaleX = ds_list_find_value(list, 4);
scaleY = ds_list_find_value(list, 5);
drawAngle = ds_list_find_value(list, 6);
ds_list_destroy(list);

draw_text_transformed(drawX,
    drawY,
    _string,
    _xscale * scaleX,
    _yscale * scaleY,
    drawAngle + _angle);;
