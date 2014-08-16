strayEntityFix();
    
      global.timerAmount = get_integer("Enter the map time, in seconds.", 300);
      
      if (global.timerAmount < 1)
      {
          while (global.timerAmount < 1)
          {
                global.timerAmount = get_integer("lol who wants to play in a map that ends right when it begins? #Enter the map time, in seconds.", 300);
          }
      }
    
      mc.currentTool = "timer";
