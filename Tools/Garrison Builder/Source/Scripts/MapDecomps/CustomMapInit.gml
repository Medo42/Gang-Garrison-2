// Initializes a custom level

// argument0: filename
  
  // load the background
  global.background = argument0;
  if (global.loadedC == false)
  {
    file_copy(argument0, program_directory + "\Decompiled\Background\" + global.map + ".png");
  }
  global.BG = chr(34) + program_directory + "\Decompiled\Background\" + global.map + ".png" + chr(34); // we add the quotes, just in case the file/the directory it is located in has spaces in it
  
  // reset these values, just in case the user wants to load another pre-made map.
  global.mapURL = "";
  global.loadedC = false;

  // get the leveldata
  var leveldata;
  leveldata = GG2DLL_extract_PNG_leveldata(argument0);
  if(leveldata == "") {
    show_message("This map does not contain level data.#Exiting from the current process.");
    exit;
  }
  // handle the leveldata
  CustomMapProcessLevelData(leveldata);