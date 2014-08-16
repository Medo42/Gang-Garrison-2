{
  strayEntityFix();
  
  switch (show_question("Are you sure you want to discard your changes?"))
  {
    case 0:
    exit;         //if yes was pressed, end the routine 
    break; 
    
    case 1:    
      var ent_filename;
      ent_filename = get_save_filename("Entity file|*.ent","");
      if(ent_filename == "") break;
      ent_file = file_text_open_write(ent_filename);
      file_text_write_string(ent_file, writeEntitiesToString());

      file_text_close(ent_file);
      break;
  }

    with (LevelEntity)
    {
        instance_destroy();
    }
  
  if (global.combo = 2)
  {
    global.madeChange = false;
  }
  else
  {
    global.combo += 1;
  }
  global.loadedEnt = false;
}