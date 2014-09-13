// string planetCacheFilename()
// Gets filename cached planet version of current map would have

var radius, cacheFilename;

radius = map_height() / 2;
cacheFilename = working_directory + "\PlanetPrerenderCache\" + global.currentMap + "@" + global.currentMapMD5 + "@" + string(global.planetCircleRadius) + ".png";

return cacheFilename;
