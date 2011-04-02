// given a string that contains custom leveldata, this will setup everything
// - Create all instances
// - Create the walkmask sprite

// argument0: the leveldata string

{
  var entityString, walkmaskString, walkmaskSurface;
  var a, b;
  var ENTITYTAG, ENDENTITYTAG, WALKMASKTAG, ENDWALKMASKTAG, DIVIDER;
  ENTITYTAG = "{ENTITIES}";
  ENDENTITYTAG = "{END ENTITIES}";
  WALKMASKTAG = "{WALKMASK}";
  ENDWALKMASKTAG = "{END WALKMASK}";
  DIVIDER = chr(10);
  draw_clear(c_white)
  draw_text_transformed(200,200,"LOADING...",2,2,0)

  // grab the walkmask data
  a = string_pos(WALKMASKTAG, argument0);
  b = string_pos(ENDWALKMASKTAG, argument0);
  if(a == 0 || b == 0) {
    show_message("Error: This file does not contain valid level data.");
    break;
  }
  set_automatic_draw(0)
  walkmaskString = string_copy(argument0, a + string_length(WALKMASKTAG) + string_length(DIVIDER), b - a - string_length(WALKMASKTAG) - string_length(DIVIDER) - 1);
  
  // create the walkmask surface
  walkmaskSurface = CustomMapDecompressWalkmaskToSurface(walkmaskString);
  draw_text_transformed(200,200,"LOADING...",2,2,0)
  screen_refresh()
  io_handle()
  // convert it to a sprite, and delete the surface
  if(global.CustomMapCollisionSprite != -1) {
    sprite_delete(global.CustomMapCollisionSprite); 	
  } 
  var tempfile;
    tempfile = temp_directory + "/wallmask.png";
  if file_exists(tempfile) file_delete(tempfile);
    surface_save(walkmaskSurface,tempfile);
    global.CustomMapCollisionSprite=sprite_add(tempfile,1,1,0,0,0);
    file_delete(tempfile);
    surface_free(walkmaskSurface);
    draw_text_transformed(200,200,"LOADING...",2,2,0)
    screen_refresh()

  // grab the entity data
  a = string_pos(ENTITYTAG, argument0);
  b = string_pos(ENDENTITYTAG, argument0);
  if(a == 0 || b == 0) {
    show_message("Error: This file does not contain valid level data.");
    break;
  }
  entityString = string_copy(argument0, a + string_length(ENTITYTAG) + string_length(DIVIDER), b - a - string_length(ENTITYTAG) - string_length(DIVIDER) - 1);
  
  // create entities
    screen_refresh()
  CustomMapCreateEntitiesFromEntityData(entityString);
}
