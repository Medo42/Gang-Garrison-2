// saves a sprite as a 32bit PNG file
//
// argument0: sprite to save
// argument1: subimage
// argument 2: save location

s = argument0;
w = sprite_get_width(s);
h = sprite_get_height(s);

draw_set_color(c_white);

draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, false);
draw_sprite(s, argument1, 0, 0);
screen_save_part("rgb.bmp", 0, 0, w, h); 
draw_rectangle(0, 0, w, h, 0);
draw_set_blend_mode_ext(0, 5); // 0, 5
draw_sprite(s, argument1, 0, 0);
screen_save_part("alpha.bmp", 0, 0, w, h);

draw_set_blend_mode(bm_normal);

a = makepng(argument2);
file_delete("alpha.bmp");
file_delete("rgb.bmp");
return a;