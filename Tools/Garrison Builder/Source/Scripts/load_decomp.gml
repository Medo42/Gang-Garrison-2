  // load the background.
  
  strayEntityFix();
  
  var new_BG, new_BGBG;
  new_BG = program_directory + "\Decompiled\Background\" + global.map + ".png";
  if(new_BG == "") break;
  global.rawBG = new_BG;
  global.BG = chr(34) + new_BG + chr(34); // we add the quotes, just in case the file/the directory it is located in has spaces in it
  background_replace(levelbg, new_BG, false, false);
  room_set_background(room0,0,true,false,levelbg,0,0,false,false,0,0,1);
  background_xscale[0] = 6;
  background_yscale[0] = 6;
  
  global.madeChange = true;  
  global.erasedOnce = false;
  global.loadedBG = true;
  
  if (global.currentCap != "Garrison Builder - Gang Garrison 2")
  {
    global.defaults = false;
  }
  global.currentCap = global.rawBG;
        
  // This next block of code attempts to grab the true base name without the extension and directory.
  while (string_count("\", global.currentCap) != 0) // this part grabs the base name without the directory
  {
  global.currentCap = string_delete(global.currentCap, 1, 1);
  }
    
  fileNameCh = string_pos(".png", global.currentCap);
  if (fileNameCh == 0)
  {
  fileNameCh = string_pos(".PNG", global.currentCap);
  }
  fileLen = string_length(global.currentCap);
  global.currentCap = string_copy(global.currentCap, 0, fileLen - (fileLen - fileNameCh) - 1);
  if (global.defaults == true)
  {
    global.currentCap += " - BG"; 
  }
  else if (global.defaults == false)
  {
    global.currentCap += " - BG & WM";
  }
    
room_caption = global.currentCap;


  // load the walkmask.
  load_decomp_wm();
