// draw_healthbar_planet(x1,y1,x2,y2,amount,backcol,mincol,maxcol,direction,showback,showborder)
// The same as draw_healthbar, but it draws it scaled, rotated and positioned correctly for the planet
var _x1, _y1, _x2, _y2, _amount, _backcol, _mincol, _maxcol, _direction, _showback, _showborder;
_x1 = argument0;
_y1 = argument1;
_x2 = argument2;
_y2 = argument3;
_amount = argument4;
_backcol = argument5;
_mincol = argument6;
_maxcol = argument7;
_direction = argument8;
_showback = argument9;
_showborder = argument10;

// Find corners

var topLeftX, topLeftY,
    topRightX, topRightY,
    bottomLeftX, bottomLeftY,
    bottomRightX, bottomRightY;
topLeftX = _x1;
topLeftY = _y1;
topRightX = _x2;
topRightY = _y1;
bottomLeftX = _x1;
bottomLeftY = _y2;
bottomRightX = _x2;
bottomRightY = _y2;

// Project corners onto planet
var list;
list = planetMapPosToPlanetPos(topLeftX, topLeftY);
topLeftX = ds_list_find_value(list, 2);
topLeftY = ds_list_find_value(list, 3);
ds_list_destroy(list);

list = planetMapPosToPlanetPos(topRightX, topRightY);
topRightX = ds_list_find_value(list, 2);
topRightY = ds_list_find_value(list, 3);
ds_list_destroy(list);

list = planetMapPosToPlanetPos(bottomLeftX, bottomLeftY);
bottomLeftX = ds_list_find_value(list, 2);
bottomLeftY = ds_list_find_value(list, 3);
ds_list_destroy(list);

list = planetMapPosToPlanetPos(bottomRightX, bottomRightY);
bottomRightX = ds_list_find_value(list, 2);
bottomRightY = ds_list_find_value(list, 3);
ds_list_destroy(list);

if (_showback)
{
    // Draw background
    draw_set_color(_backcol);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex(topLeftX, topLeftY);
    draw_vertex(topRightX, topRightY);
    draw_vertex(bottomLeftX, bottomLeftY)
    draw_vertex(bottomRightX, bottomRightY);
    draw_primitive_end();
}

// Find corners of amount bar
var amountTopLeftX, amountTopLeftY,
    amountTopRightX, amountTopRightY,
    amountBottomLeftX, amountBottomLeftY,
    amountBottomRightX, amountBottomRightY;

// From left
if (_direction == 0)
{
    amountTopLeftX = _x1;
    amountTopLeftY = _y1;
    amountTopRightX = _x1 + (_x2 - _x1) * (_amount / 100);
    amountTopRightY = _y1;
    amountBottomLeftX = _x1;
    amountBottomLeftY = _y2;
    amountBottomRightX = _x1 + (_x2 - _x1) * (_amount / 100);
    amountBottomRightY = _y2;
}
// From right
else if (_direction == 1)
{
    amountTopLeftX = _x2 - (_x2 - _x1) * (_amount / 100);
    amountTopLeftY = _y1;
    amountTopRightX = _x1;
    amountTopRightY = _y1;
    amountBottomLeftX = _x2 - (_x2 - _x1) * (_amount / 100);
    amountBottomLeftY = _y2;
    amountBottomRightX = _x2;
    amountBottomRightY = _y2;
}
// From top
else if (_direction == 2)
{
    amountTopLeftX = _x1;
    amountTopLeftY = _y1;
    amountTopRightX = _x1;
    amountTopRightY = _y1;
    amountBottomLeftX = _x1;
    amountBottomLeftY = _y1 + (_y2 - _y1) * (_amount / 100);
    amountBottomRightX = _x2;
    amountBottomRightY = _y1 + (_y2 - _y1) * (_amount / 100);
}
// From bottom
else if (_direction == 3)
{
    amountTopLeftX = _x1;
    amountTopLeftY = _y2 - (_y2 - _y1) * (_amount / 100);
    amountTopRightX = _x1;
    amountTopRightY = _y2 - (_y2 - _y1) * (_amount / 100);
    amountBottomLeftX = _x1;
    amountBottomLeftY = _y2;
    amountBottomRightX = _x2;
    amountBottomRightY = _y2;
}

// Project corners onto planet
var list;
list = planetMapPosToPlanetPos(amountTopLeftX, amountTopLeftY);
amountTopLeftX = ds_list_find_value(list, 2);
amountTopLeftY = ds_list_find_value(list, 3);
ds_list_destroy(list);

list = planetMapPosToPlanetPos(amountTopRightX, amountTopRightY);
amountTopRightX = ds_list_find_value(list, 2);
amountTopRightY = ds_list_find_value(list, 3);
ds_list_destroy(list);

list = planetMapPosToPlanetPos(amountBottomLeftX, amountBottomLeftY);
amountBottomLeftX = ds_list_find_value(list, 2);
amountBottomLeftY = ds_list_find_value(list, 3);
ds_list_destroy(list);

list = planetMapPosToPlanetPos(amountBottomRightX, amountBottomRightY);
amountBottomRightX = ds_list_find_value(list, 2);
amountBottomRightY = ds_list_find_value(list, 3);
ds_list_destroy(list);

// Find in-between colour we want
var drawColour;
drawColour = merge_color(_mincol, _maxcol, _amount / 100);
draw_set_color(drawColour);

// Draw amount bar
draw_primitive_begin(pr_trianglestrip);
draw_vertex(amountTopLeftX, amountTopLeftY);
draw_vertex(amountTopRightX, amountTopRightY);
draw_vertex(amountBottomLeftX, amountBottomLeftY)
draw_vertex(amountBottomRightX, amountBottomRightY);
draw_primitive_end();

if (_showborder)
{
    // Draw border
    draw_set_color(c_black);
    draw_line_width_color_planet(_x1, _y1, _x2, _y1, 1, c_black, c_black);
    draw_line_width_color_planet(_x2, _y1, _x2, _y2, 1, c_black, c_black);
    draw_line_width_color_planet(_x2, _y2, _x1, _y2, 1, c_black, c_black);
    draw_line_width_color_planet(_x1, _y2, _x1, _y1, 1, c_black, c_black);
}
