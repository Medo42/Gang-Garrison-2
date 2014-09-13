// drawPlanet()
// Draws the planet background

var list, originX, originY, offsetX;
list = planetMapOrigin();
originX = ds_list_find_value(list, 0);
originY = ds_list_find_value(list, 1);
offsetX = ds_list_find_value(list, 2);
ds_list_destroy(list);

// Draw the planet rotated to the xview
draw_sprite_ext(global.planetBackground, 0, originX, originY, 1, 1, (offsetX / global.planetMapWidth) * 360 + 90, c_white, 1);
