strayEntityFix();
    
      global.teleNumber = get_integer("Enter the teleport number (1-10):", 1);
      global.telePoint = get_integer("Enter the teleport point (1 or 2):", 1);
      
      if ((global.teleNumber < 1) || (global.teleNumber > 10))
      {
          show_message("You can only place teleporters ranging from one to ten." + "#It has been set to the default value of 1.");
          global.teleNumber = 1;
      }
      if ((global.telePoint > 2) || (global.telePoint < 1))
      {
          show_message("You can only place teleporters points ranging from one to two." + "#It has been set to the default value of 1.");
          global.telePoint = 1;
      }      
      
      switch (global.teleNumber)
      {
          case 1:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_1_point_1;
              mc.currentTool = "teleport_1_point_1";
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_1_point_2;
              mc.currentTool = "teleport_1_point_2";          
          }          
          break;
          case 2:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_2_point_1;
              mc.currentTool = "teleport_2_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_2_point_2;
              mc.currentTool = "teleport_2_point_2";     
          }  
          break;
          case 3:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_3_point_1;
              mc.currentTool = "teleport_3_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_3_point_2;
              mc.currentTool = "teleport_3_point_2";     
          }  
          break;
          case 4:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_4_point_1;
              mc.currentTool = "teleport_4_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_4_point_2;
              mc.currentTool = "teleport_4_point_2";     
          }  
          break;
          case 5:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_5_point_1;
              mc.currentTool = "teleport_5_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_5_point_2;
              mc.currentTool = "teleport_5_point_2";     
          }  
          break;
          case 6:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_6_point_1;
              mc.currentTool = "teleport_6_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_6_point_2;
              mc.currentTool = "teleport_6_point_2";     
          }  
          break;
          case 7:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_7_point_1;
              mc.currentTool = "teleport_7_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_7_point_2;
              mc.currentTool = "teleport_7_point_2";     
          }  
          break;
          case 8:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_8_point_1;
              mc.currentTool = "teleport_8_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_8_point_2;
              mc.currentTool = "teleport_8_point_2";     
          }  
          break;
          case 9:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_9_point_1;
              mc.currentTool = "teleport_9_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_9_point_2;
              mc.currentTool = "teleport_9_point_2";     
          }  
          break;
          case 10:
          if (global.telePoint == 1)
          {
              sprite_index = teleport_10_point_1;
              mc.currentTool = "teleport_10_point_1";     
          }
          else if (global.telePoint == 2)
          {
              sprite_index = teleport_10_point_2;
              mc.currentTool = "teleport_10_point_2";     
          }    
          break;                                                                                    
          default:
              sprite_index = teleport_1_point_1;
              mc.currentTool = "teleport_1_point_1";     
          break;                 
          }
          show_message("You can now place teleporter " + string(global.teleNumber) + ", " + "point " + string(global.telePoint))