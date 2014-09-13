// void initPlanetFromCache()
// Initialises planet, loading pre-rendered from cached

var cacheFilename;
cacheFilename = planetCacheFilename();

// Load from file
global.planetBackground = sprite_add(cacheFilename, 1, false, false, global.planetCircleRadius, global.planetCircleRadius);
