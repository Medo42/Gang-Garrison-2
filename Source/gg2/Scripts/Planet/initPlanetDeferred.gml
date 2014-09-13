// void initPlanetDeferred(string callback)
// Initialises and renders planet in background (doesn't interrupt gameplay)
// Callback is GML code to be executed upon completion

var callback;
callback = argument0;

var renderer;
renderer = instance_create(0, 0, DeferredPlanetRenderer);
renderer.callback = callback;
