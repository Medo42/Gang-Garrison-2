{
  switch(argument0) {
    case "loadBG":
      load_BG();
    break;
    case "editBG":
      edit_BG();
    break;
    case "editWM":
      edit_WM();
    break;
    case "loadWalkmask":
      load_WM();
    break;
    case "loadEntities":
      load_entities();
    break;
    case "unloadBG":
      unload_BG();
    break;
    case "testMap":
      testMap();
    break;
    case "unloadWalkmask":
      unload_WM();
    break;
    case "unloadEntities":
      unload_entities();
    break;
    case "saveEntities":
      save_entities();
    break;
    case "bgVisible":
      background_visible[0] = argument1;
    break;
    case "walkmaskVisible":
      background_visible[1] = argument1;
    break;
    case "gridVisible":
      background_visible[6] = argument1;
      background_visible[7] = argument1;
    case "snapToGrid":
      mc.enableGridSnap = argument1;    
    break;
    case "embedLevelDataInPNG":
      embedLevelDataToPNG();
    break;
    case "customClear":
      global.clearType = get_string("What type of entity group would you like to clear? Valid values are#Spawns#Doors#Health#Logic#Map Objectives#Etcetera#All", "");
      string_lower(global.clearType);
      if (global.clearType == "spawns") || (global.clearType == "doors") || (global.clearType == "health") || (global.clearType == "logic") || (global.clearType == "map objectives") || (global.clearType == "etcetera") || (global.clearType == "etc") || (global.clearType == "all")
      {
            customClearSelect(global.clearType);
      }
      else if (global.clearType == "")
      {
            exit;
      }
      else
      {
            exit;
      }
    break;
    case "loadExisMap":
      load_exisMap();
    break;
    /*
    case "timer":
      timerChoice();
      break;
    case "Teleports":
      teleports();
      break;
    case "teleport_1_point_1":
      teleports();
      break;      
    case "teleport_1_point_2":
      teleports();
      break;
    case "teleport_2_point_1":
      teleports();
      break;      
    case "teleport_2_point_2":
      teleports();
      break;
    case "teleport_3_point_1":
      teleports();
      break;
    case "teleport_3_point_2":
      teleports();
      break;
    case "teleport_4_point_1":
      teleports();
      break;
    case "teleport_4_point_2":
      teleports();
      break;
    case "teleport_5_point_1":
      teleports();
      break;
    case "teleport_5_point_2":
      teleports();
      break;
    case "teleport_6_point_1":
      teleports();
      break;      
    case "teleport_6_point_2":
      teleports();
      break;
    case "teleport_7_point_1":
      teleports();
      break;      
    case "teleport_7_point_2":
      teleports();
      break;
    case "teleport_8_point_1":
      teleports();
      break;
    case "teleport_8_point_2":
      teleports();
      break;
    case "teleport_9_point_1":
      teleports();
      break;
    case "teleport_9_point_2":
      teleports();
      break;
    case "teleport_10_point_1":
      teleports();
      break;
    case "teleport_10_point_2":
      teleports();
      break;
    case "noTool":
      mc.currentTool = "";
      break;
      */
    //let's comment this part out, since there isn't a currently implemented way
    //to add parameters to entities
    
    /*
    case "map_end_trigger_red":
      set_nextmap_red();
    break;
    case "map_end_trigger_blu":
      set_nextmap_blu();
    break;
    */
  }
}
