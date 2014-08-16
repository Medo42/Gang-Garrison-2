// makes it so that, for a frame afterwards, we can't place entities
// For some reason, if I don't do this, then after clicking OK in a file
// dialog, an entity will get placed in the room.

{
  mc.addingEntitiesAllowed = false;
  mc.alarm[0] = 1;
}