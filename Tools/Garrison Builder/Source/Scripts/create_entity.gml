/*
  argument0 - x-coordinate
  argument1 - y-coordinate
  argument2 - tool name
*/

{
  new_ent_x = argument0;
  new_ent_y = argument1;
  if(mc.enableGridSnap = true) {
    new_ent_x = round(round(new_ent_x / 6) * 6);
    new_ent_y = round(round(new_ent_y / 6) * 6);
  }
  if (mc.currentTool != "moveTool")
  {
  with(LevelEntity) {
    if(x = other.new_ent_x && y = other.new_ent_y) instance_destroy();
  }
  }
  new_ent = instance_create(new_ent_x, new_ent_y, LevelEntity);
  new_ent.type = argument2;
  new_ent.sprite_index = spriteForEntityType(argument2);
  if(new_ent.sprite_index < 0)
    show_message("Error: system tried to create entity for which there is no sprite: " + new_ent.type);
}
