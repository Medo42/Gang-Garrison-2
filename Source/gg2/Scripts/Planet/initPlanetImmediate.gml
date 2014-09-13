// real initPlanetImmediate()
// Init and render planet immediately (may take minutes, shows loading screen)
// Returns false if cancelled, otherwise true

// Create a drawing surface so we can pre-render the planet
var surface, centreX, centreY;
surface = surface_create(global.planetCircleRadius * 2, global.planetCircleRadius * 2);
centreX = global.planetCircleRadius;
centreY = global.planetCircleRadius;

// Iterate over each pixel of surface
var startTime, angle, radius, mapX, mapY, _x, _y;
startTime = current_time;
for (_x = 0; _x < global.planetCircleRadius * 2; _x += 1)
{
    // Before pre-rendering, let's blank screen with a message to explain the wait
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(0, 0, view_wview, view_hview, false);
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var pct, duration, remaining;
    pct = floor(100 * (_x / (global.planetCircleRadius * 2)));
    duration = floor((current_time - startTime) / 1000);
    if (_x)
        remaining = floor((duration / _x) * (global.planetCircleRadius * 2 - _x));
    else
        remaining = "???";
    draw_text(view_wview / 2, view_hview / 2, "Pre-rendering planet... " + string(pct) + "% done#" + string(duration) + "s elapsed, approx. " + string(remaining) + "s to go##Press ESC to cancel");
    draw_healthbar(view_wview / 2 - 100, view_hview / 2 + 100, view_wview / 2 + 100, view_hview / 2 + 120, pct, c_black, c_white, c_white, 0, true, true);
    screen_refresh();
    io_handle();

    // Switch to surface drawing
    surface_set_target(surface);
    
    for (_y = 0; _y < global.planetCircleRadius * 2; _y += 1)
    {
        // Calculate angle/radius of point on planet from x and y
        angle = point_direction(global.planetCircleRadius, global.planetCircleRadius, _x, _y);
        radius = point_distance(global.planetCircleRadius, global.planetCircleRadius, _x, _y);
        // Figure out where that corresponds to on actual map
        mapX = floor(global.planetMapWidth - (angle / 360) * global.planetMapWidth) mod global.planetMapWidth;
        mapY = floor(global.planetMapHeight - (radius / global.planetCircleRadius) * global.planetMapHeight);
        if (mapY >= 0 and mapY <= global.planetMapHeight)
        {
            // Fill in pixel from actual map
            draw_background_part(background_index,
                floor(mapX / 6),
                floor(mapY / 6),
                1,
                1,
                _x,
                _y);
        }
    }
    
    // Switch back to normal drawing
    surface_reset_target();
    io_handle();
    
    if (keyboard_check(vk_escape))
    {
        surface_free(surface);
        return false;
    }
}

// Create a sprite from surface
global.planetBackground = sprite_create_from_surface(
    surface,
    0,
    0, 
    global.planetCircleRadius * 2,
    global.planetCircleRadius * 2,
    false,
    false,
    global.planetCircleRadius,
    global.planetCircleRadius);

// Clear up
surface_free(surface);

// Create cache dir if it doesn't exist
if (!directory_exists(working_directory + "\PlanetPrerenderCache"))
    directory_create(working_directory + "\PlanetPrerenderCache");

// Cache    
sprite_save(global.planetBackground, 0, cacheFilename);

return true;
