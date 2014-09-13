// draw_sprite_ext_planet(sprite,subimg,x,y,xscale,yscale,rot,color,alpha)
// The same as draw_sprite_ext, but it draws it scaled, positioned and rotated correctly for the planet

var _sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _color, _alpha;
_sprite = argument0;
_subimg = argument1;
_x = argument2;
_y = argument3;
_xscale = argument4;
_yscale = argument5;
_rot = argument6;
_color = argument7;
_alpha = argument8;

var list, drawX, drawY, scaleX, scaleY, drawAngle;
list = planetMapPosToPlanetPos(_x, _y);
drawX = ds_list_find_value(list, 2);
drawY = ds_list_find_value(list, 3);
scaleX = ds_list_find_value(list, 4);
scaleY = ds_list_find_value(list, 5);
drawAngle = ds_list_find_value(list, 6);
ds_list_destroy(list);

draw_sprite_ext(_sprite,
    _subimg,
    drawX,
    drawY,
    _xscale * scaleX,
    _yscale * scaleY,
    drawAngle + _rot,
    _color,
    _alpha);
