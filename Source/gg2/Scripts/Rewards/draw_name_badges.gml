// void draw_name_badges(real x, real y, real player[, real planet])
// Draws a player's name with badges, if any
// player is the ID of the Player object
// planet is an optional parameter defaulting to false, if true drawn with _planet functions

var _x, _y, player, planet;
_x = argument0;
_y = argument1;
player = argument2;
planet = argument3;

draw_set_valign(fa_top);
draw_set_halign(fa_left);

var i;
for (i = 0; i < ds_list_size(player.badges); i += 1)
{
    if (planet)
        draw_sprite_planet(HaxxyBadgeS, ds_list_find_value(player.badges, i), _x, _y - 1);
    else
        draw_sprite(HaxxyBadgeS, ds_list_find_value(player.badges, i), _x, _y - 1);
    _x += sprite_get_width(HaxxyBadgeS);
}

if (planet)
    draw_text_planet(_x, _y, player.name);
else
    draw_text(_x, _y, player.name);
