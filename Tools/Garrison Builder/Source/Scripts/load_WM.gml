{
  strayEntityFix();

  var new_WM, new_BGWM;
  new_WM = get_open_filename("Walkmask Image (PNG or BMP)|*.png; *.bmp","");
  if(new_WM == "") break;
  global.rawWM = new_WM;
  global.WM = chr(34) + new_WM + chr(34); // we add the quotes, just in case the file/the directory it is located in has spaces in it
  background_replace(levelwm, new_WM, true, false);
  room_set_background(room0,1,true,false,levelbg,0,0,false,false,0,0,1);
  background_xscale[1] = 6;
  background_yscale[1] = 6;
  // invalidate the old walkmask string, so we'll have to regenerate it
  mc.compressedWalkmaskString = "";
  
  global.madeChange = true;
  global.erasedOnce2 = false;
  global.loadedWM = true;
  
  if (global.currentCap != "Garrison Builder - Gang Garrison 2")
  {
    global.defaults = false;
  }
  global.currentCap = global.rawWM;
        
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
  global.wkmskName = global.currentCap;
  if (global.defaults == true)
  {
    global.currentCap += " - WM"; 
  }
  else if (global.defaults == false)
  {
    global.currentCap += " - BG & WM";
  }
    
room_caption = global.currentCap;
}
