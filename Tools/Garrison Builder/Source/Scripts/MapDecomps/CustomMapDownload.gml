  var downloadHandle, content_type;

  if(!file_exists(program_directory + "\Decompiled\" + global.map + ".png")) {
    // we don't have the map, so download it.
    if(global.mapURL == "") {
      show_message("This locator file is empty!#Exiting.");
      game_end();
      exit;
    }
    downloadHandle = DM_CreateDownload(global.mapURL, program_directory + "\Decompiled\Background\" + global.map + ".png");
    global.loadedC = true;
    DM_StartDownload(downloadHandle);
    while(DM_DownloadStatus(downloadHandle) != 3) { // while download isn't finished
      sleep(floor(1000/30)); // sleep for the equivalent of one frame
      io_handle(); // this prevents GameMaker from appearing locked-up

      // check if the user cancelled the download with the ESC key.
      if(keyboard_check(vk_escape)) {
        show_message("Download cancelled.#Exiting from the current process.");
        exit;
      }
    }
    
    // verify that this is, in fact, a png (and not html, or an exe, or whatever
    // NOTE: this is a security measure, but probably a very weak one
    content_type = DM_GetContentType(downloadHandle);
    if(content_type != "image/png") {
      show_message("Invalid download data.#Exiting from the current process.");
      DM_StopDownload(downloadHandle);
      DM_CloseDownload(downloadHandle);
      file_delete(program_directory + "\Decompiled\" + global.currentMap + ".png");
      exit;
    }
    DM_StopDownload(downloadHandle);
    DM_CloseDownload(downloadHandle); 
  }
  
  global.decompileFile = (program_directory + "\Decompiled\Background\" + global.map + ".png");
  CustomMapInit(global.decompileFile);  // let's begin the decompile process.