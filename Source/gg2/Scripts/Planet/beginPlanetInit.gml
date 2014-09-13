// void beginPlanetInit()
// Begins planet initialisation, called before an initPlanet* function

// Clear up existing sprite, if it exists
if (variable_global_exists('planetBackground'))
    sprite_delete(global.planetBackground)

// Save on function calls by caching these values
global.planetMapWidth = map_width();
global.planetMapHeight = map_height();

// This is essentially a constant
global.planetCircleRadius = global.planetMapHeight / 2;
