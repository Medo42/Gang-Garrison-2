// planetMapPosToPlanetPos(x, y)
// Takes position on map, finds angle/radius on planet plus position, scale and rotation projected on planet
// Return value is a list:
// 0 - angle - on planet
// 1 - radius - distance from planet centre
// 2 - drawX - projected X position of point on planet
// 3 - drawY - projected Y position of point on planet
// 4 - scaleX - horizontal scaling factor for drawing onto planet
// 5 - scaleY - vertical scaling factor for drawing onto planet
// 6 - drawAngle - rotation of entity, for drawing onto planet

var _x, _y;
_x = argument0;
_y = argument1;

if (!global.planetActive)
{
    var returnValue;
    returnValue = ds_list_create();
    ds_list_add(returnValue, 0);
    ds_list_add(returnValue, 0);
    ds_list_add(returnValue, _x);
    ds_list_add(returnValue, _y);
    ds_list_add(returnValue, 1);
    ds_list_add(returnValue, 1);
    ds_list_add(returnValue, 0);
    return returnValue;
}

var list, originX, originY, offsetX;
list = planetMapOrigin();
originX = ds_list_find_value(list, 0);
originY = ds_list_find_value(list, 1);
offsetX = ds_list_find_value(list, 2);
ds_list_destroy(list);

// Find angle and radius on planet
angle = -(((_x - offsetX) / global.planetMapWidth) * 360 - 90);
radius = ((global.planetMapHeight - _y) / global.planetMapHeight) * global.planetCircleRadius;

// Projection
var drawX, drawY, scaleX, scaleY, drawAngle;
drawX = originX + lengthdir_x(radius, angle);
drawY = originY + lengthdir_y(radius, angle);
scaleX = (pi * radius * 2) / global.planetMapWidth;
scaleY = global.planetCircleRadius / global.planetMapHeight;
drawAngle = angle - 90;

var returnValue;
returnValue = ds_list_create();
ds_list_add(returnValue, angle);
ds_list_add(returnValue, radius);
ds_list_add(returnValue, drawX);
ds_list_add(returnValue, drawY);
ds_list_add(returnValue, scaleX);
ds_list_add(returnValue, scaleY);
ds_list_add(returnValue, drawAngle);
return returnValue;
