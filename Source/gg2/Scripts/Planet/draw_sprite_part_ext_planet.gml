// draw_sprite_part_ext(sprite,subimg,left,top,width,height,x,y,xscale,yscale,color,alpha)
// The same as draw_sprite__partext, but it draws it scaled, positioned and rotated correctly for the planet

var _sprite, _subimg, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _rot, _color, _alpha;
_sprite = argument0;
_subimg = argument1;
_left = argument2;
_top = argument3;
_width = argument4;
_height = argument5;
_x = argument6;
_y = argument7;
_xscale = argument8;
_yscale = argument9;
_rot = argument10;
_color = argument11;
_alpha = argument12;

var list, drawX, drawY, scaleX, scaleY, drawAngle;
list = planetMapPosToPlanetPos(_x, _y);
drawX = ds_list_find_value(list, 2);
drawY = ds_list_find_value(list, 3);
scaleX = ds_list_find_value(list, 4);
scaleY = ds_list_find_value(list, 5);
drawAngle = ds_list_find_value(list, 6);
ds_list_destroy(list);

draw_sprite_general(_sprite,
    _subimg,
    _left,
    _top,
    _width,
    _height,
    drawX,
    drawY,
    _xscale * scaleX,
    _yscale * scaleY,
    drawAngle + _rot,
    _color,
    _color,
    _color,
    _color,
    _alpha);
