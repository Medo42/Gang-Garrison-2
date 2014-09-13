// draw_line_width_color_planet(x1,y1,x2,y2,w,col1,col2);
// The same as draw_line_width_color, but it draws it scaled and positioned correctly for the planet
var _x1, _y1, _x2, _y2, _w, _col1, _col2;
_x1 = argument0;
_y1 = argument1;
_x2 = argument2;
_y2 = argument3;
_w = argument4;
_col1 = argument5;
_col2 = argument6;

var list, drawX1, drawY1, scaleX1, scaleY1;
list = planetMapPosToPlanetPos(_x1, _y1);
drawX1 = ds_list_find_value(list, 2);
drawY1 = ds_list_find_value(list, 3);
scaleX1 = ds_list_find_value(list, 4);
scaleY1 = ds_list_find_value(list, 5);
ds_list_destroy(list);

var list, drawX2, drawY2, scaleX2, scaleY2;
list = planetMapPosToPlanetPos(_x2, _y2);
drawX2 = ds_list_find_value(list, 2);
drawY2 = ds_list_find_value(list, 3);
scaleX2 = ds_list_find_value(list, 4);
scaleY2 = ds_list_find_value(list, 5);
ds_list_destroy(list);

var scale;
scale = (scaleX1 + scaleY1 + scaleX2 + scaleY2) / 4;

draw_line_width_color(drawX1, drawY1, drawX2, drawY2, _w * scale, _col1, _col2);
