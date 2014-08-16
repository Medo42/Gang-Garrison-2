  // if we've reached this stage, then we are good to go. Let's start the entity creation!
  global.__writeEntitiesToStringRet = "{ENTITIES}" + chr(10);
  with(LevelEntity) 
  {
  /*
  if (sprite_index == timer_ent)
  {
    global.__writeEntitiesToStringRet += type + string(global.timerAmount) + chr(10);
  }
  */
  if (sprite_index == trans)
  {
    global.caughtError += 1;
  }
  else if (type == "moveTool")
  {
    global.caughtError += 1;
  }  
  else
  {
    global.__writeEntitiesToStringRet += type + chr(10);
  }
    if (global.caughtError == 0)  // we don't want to write unwanted "entities" to the file and/or the map.
    {
    global.__writeEntitiesToStringRet += string(x) + chr(10);
    global.__writeEntitiesToStringRet += string(y) + chr(10);
    }
    else
    {
    global.caughtError = 0;
    }
  }
  return global.__writeEntitiesToStringRet + "{END ENTITIES}";
