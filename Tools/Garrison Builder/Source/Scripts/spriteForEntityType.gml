// given an entity type (tool string), returns the sprite for this entity, or -1 if it's not an entity

{
  var ret;
  switch(argument0) {
    case "redspawn":
      ret = redspawn_ent;
    break;
    case "bluespawn":
      ret = bluespawn_ent;
    break;
    case "redintel":
      ret = redintel_ent;
    break;
    case "blueintel":
      ret = blueintel_ent;
    break;
    case "redteamgate":
      ret = redteamgate_ent;
    break;
    case "redteamgate2":
      ret = redteamgate2_ent;
    break;
    case "blueteamgate":
      ret = blueteamgate_ent;
    break;
    case "blueteamgate2":
      ret = blueteamgate2_ent;
    break;
    case "redintelgate":
      ret = redintelgate_ent;
    break;
    case "redintelgate2":
      ret = redintelgate2_ent;
    break;
    case "blueintelgate":
      ret = blueintelgate_ent;
    break;
    case "blueintelgate2":
      ret = blueintelgate2_ent;
    break;
    case "intelgatehorizontal":
      ret = intelgatehorizontal_ent;
    break;
    case "intelgatevertical":
      ret = intelgatevertical_ent;
    break;
    case "killbox":
      ret = killbox_ent;
    break;
    case "spawnroom":
      ret = spawnroom_ent;
    break;
    case "medCabinet":
      ret = medCabinet_ent;
    break;
    case "map_end_trigger_red":
      ret = map_end_trigger_red_ent;
    break;    
    case "map_end_trigger_blu":
      ret = map_end_trigger_blu_ent;
    break;    
    case "map_end_trigger_red_back":
      ret = map_end_trigger_red_back_ent;
    break;    
    case "map_end_trigger_blu_back":
      ret = map_end_trigger_blu_back_ent;
    break; 
    case "fragbox":
      ret = fragbox_ent;
    break;       
    case "playerwall":
      ret = playerwall_ent;
    break;   
    case "playerwall_horizontal":
      ret = playerwall_horizontal_ent;
    break;           
    case "bulletwall":
      ret = bulletwall_ent;
    break;   
    case "bulletwall_horizontal":
      ret = bulletwall_horizontal_ent;
    break;     
    case "teleport_1_point_1":
      ret = teleport_1_point_1_ent;
    break;   
    case "teleport_1_point_2":
      ret = teleport_1_point_2_ent;
    break;   
    case "teleport_2_point_1":
      ret = teleport_2_point_1_ent;
    break;   
    case "teleport_2_point_2":
      ret = teleport_2_point_2_ent;
    break; 
    case "teleport_3_point_1":
      ret = teleport_3_point_1_ent;
    break;   
    case "teleport_3_point_2":
      ret = teleport_3_point_2_ent;
    break; 
    case "teleport_4_point_1":
      ret = teleport_4_point_1_ent;
    break;   
    case "teleport_4_point_2":
      ret = teleport_4_point_2_ent;
    break; 
    case "teleport_5_point_1":
      ret = teleport_5_point_1_ent;
    break;   
    case "teleport_5_point_2":
      ret = teleport_5_point_2_ent;
    break; 
    case "teleport_6_point_1":
      ret = teleport_6_point_1_ent;
    break;   
    case "teleport_6_point_2":
      ret = teleport_6_point_2_ent;
    break; 
    case "teleport_7_point_1":
      ret = teleport_7_point_1_ent;
    break;   
    case "teleport_7_point_2":
      ret = teleport_7_point_2_ent;
    break; 
    case "teleport_8_point_1":
      ret = teleport_8_point_1_ent;
    break;   
    case "teleport_8_point_2":
      ret = teleport_8_point_2_ent;
    break; 
    case "teleport_9_point_1":
      ret = teleport_9_point_1_ent;
    break;   
    case "teleport_9_point_2":
      ret = teleport_9_point_2_ent;
    break; 
    case "teleport_10_point_1":
      ret = teleport_10_point_1_ent;
    break;   
    case "teleport_10_point_2":
      ret = teleport_10_point_2_ent;
    break;                     
    case "gameMode_ctf":
      ret = gameMode_ctf_ent;
    break;        
    case "gameMode_vip":
      ret = gameMode_vip_ent;
    break;                         
    case "vip_start":
      ret = vip_start_ent;
    break;    
    case "vip_end":
      ret = vip_end_ent;
    break;         
    case "NeutralIntel":
      ret = NeutralIntel_ent;
    break;      
    case "IntelSpawn":
      ret = IntelSpawn_ent;
    break;    
    case "BlueIntelSpawn":
      ret = BlueIntelSpawn_ent;
    break;     
    case "RedIntelSpawn":
      ret = RedIntelSpawn_ent;
    break;
    case "controlPoint1":
      ret = controlPoint1_ent;
    break;   
    case "controlPoint2":
      ret = controlPoint2_ent;
    break;
    case "controlPoint3":
      ret = controlPoint3_ent;
    break;
    case "controlPoint4":
      ret = controlPoint4_ent;
    break;
    case "controlPoint5":
      ret = controlPoint5_ent;
    break;
    case "NextAreaO":
      ret = NextAreaO_ent;
    break;
    case "PreviousAreaO":
      ret = PreviousAreaO_ent;
    break;
    case "CapturePoint":
      ret = CapturePoint_ent;
    break;
    case "SetupGate":
      ret = SetupGate_ent;
    break;      
    case "timer":
      ret = timer_ent;
    break;    
    default:
      ret = -1;
    break;    
  }
  return ret;
}
