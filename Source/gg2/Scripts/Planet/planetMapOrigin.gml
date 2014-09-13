// planetMapOrigin()
// Gives x and y position of the planet's origin, and the x offset not centred on player
// Return value is a list:
// 0 - originX - X position of planet origin
// 1 - originY - Y position of planet origin
// 2 - offsetX - X offset of camera, but not centred on player (player at 0, not 400)
// 3 - offsetY - Y offset of camera, but not centred on player (player at 0, not 300)

var xoffset, yoffset, xsize, ysize;

xoffset = view_xview[0];
yoffset = view_yview[0];
xsize = view_wview[0];
ysize = view_hview[0];

var offsetX, offsetY, originX, originY;

offsetX = xoffset + xsize / 2;
offsetY = yoffset + ysize / 2;
// Centre X (circle will rotate to X position)
originX = xoffset + xsize / 2;
// Move Y to camera offset
originY = yoffset + ysize + global.planetCircleRadius - (ysize / 2) - (offsetY / global.planetMapHeight) * global.planetCircleRadius;

var returnValue;
returnValue = ds_list_create();
ds_list_add(returnValue, originX);
ds_list_add(returnValue, originY);
ds_list_add(returnValue, offsetX);
ds_list_add(returnValue, offsetY);
return returnValue;
