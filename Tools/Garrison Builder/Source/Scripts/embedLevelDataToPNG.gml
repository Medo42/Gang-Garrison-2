  strayEntityFix();

// preliminary check to see if the user placed the correct entities or the correct combination of entities.
  var neutralIntelExists, neutralIntelSpawnExists, capsExist, cap1Exist, cap2Exist, cap3Exist, cap4Exist, cap5Exist, bluIntelSpawnExists, redIntelSpawnExists, bluIntelExists, redIntelExists, sufficientCapMats;
  neutralIntelExists = false;
  neutralIntelSpawnExists = false;
  bluIntelSpawnExists = false;
  redIntelSpawnExists = false;
  bluIntelExists = false;
  redIntelExists = false;
  sufficientCapMats = false;
  cap1Exist = false;
  cap2Exist = false;
  cap3Exist = false;
  cap4Exist = false;
  cap5Exist = false;
  capsExist = false;
  
  with (LevelEntity)
  {
    if (type == "NeutralIntel")
    {
        neutralIntelExists = true;
    }
    else if (type == "redintel")
    {
        redIntelExists = true;
    }
    else if (type == "blueintel")
    {
        bluIntelExists = true;
    }
    else if (type == "IntelSpawn")
    {    
         neutralIntelSpawnExists = true;
    }
    else if (type == "RedIntelSpawn")
    {    
         redIntelSpawnExists = true;
    }
    else if (type == "BlueIntelSpawn")
    {    
         bluIntelSpawnExists = true;
    }
    else if (type == "CapturePoint")
    {
        sufficientCapMats = true;
    }
    else if (type == "controlPoint1")
    {
        if (cap1Exist == true)
        {
            show_message("Please do not place more than one instance of a unique control point.");
            exit;
        }
        else
        {
            cap1Exist = true;
        }
    }
    else if (type == "controlPoint2")
    {
        if (cap2Exist == true)
        {
            show_message("Please do not place more than one instance of a unique control point.");
            exit;
        }
        else
        {
            cap2Exist = true;
        }       
    }
    else if (type == "controlPoint3")
    {
        if (cap3Exist == true)
        {
            show_message("Please do not place more than one instance of a unique control point.");
            exit;
        }
        else
        {
            cap3Exist = true;
        }
    }
    else if (type == "controlPoint4")
    {
        if (cap4Exist == true)
        {
            show_message("Please do not place more than one instance of a unique control point.");
            exit;
        }
        else
        {
            cap4Exist = true;
        }
    }
    else if (type == "controlPoint5")
    {
        if (cap5Exist == true)
        {
            show_message("Please do not place more than one instance of a unique control point.");
            exit;
        }
        else
        {
            cap5Exist = true;
        }
    }
  }
  
  if (cap1Exist == true || cap2Exist == true || cap3Exist == true || cap4Exist == true || cap5Exist == true)
  {
      capsExist = true;
  }
  
  if (((redIntelExists == true) && (bluIntelExists == false)) || ((redIntelExists == false) && (bluIntelExists == true)) || ((redIntelExists == false) && (bluIntelExists == false))) && (capsExist == false) && (neutralIntelSpawnExists == false && redIntelSpawnExists == false && bluIntelSpawnExists == false && neutralIntelExists == false)
  {
    show_message("If you are making a traditional CTF map, you must place both the Red intelligence and the Blu intelligence somewhere on the map.");
    exit;
  }
  else if (((neutralIntelSpawnExists == true || redIntelSpawnExists == true || bluIntelSpawnExists == true) && (neutralIntelExists == false)) || ((neutralIntelSpawnExists == false && redIntelSpawnExists == false && bluIntelSpawnExists == false) && (neutralIntelExists == false)) || ((neutralIntelSpawnExists == false && redIntelSpawnExists == false && bluIntelSpawnExists == false) && (neutralIntelExists == true))) && (bluIntelExists == true && bluIntelExists == false)
  {
    show_message("If you are making a Tug-of-War CTF map, you must place a Neutral intelligence and a intel spawn point of any association somewhere on the map (one minimum).");
    exit;
  }
  else if (capsExist == true || sufficientCapMats == true) && (neutralIntelExists == true || redIntelExists == true || bluIntelExists == true)
  {
    show_message("You can't mix and match gameplay modes...yet. Please go back and rectify this problem.");
    exit;
  }
  else if (capsExist == true && sufficientCapMats == false) || (capsExist == false && sufficientCapMats == true)
  {
    show_message("Please make sure you've placed Capture Points AND Control Points.");
    exit;
  }
  else if (cap5Exist == true)
  {
    if (cap4Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 5.");
        exit;
    }
    if (cap3Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 5.");
        exit;
    }
    if (cap2Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 5.");
        exit;
    }
    if (cap1Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 5.");
        exit;
    }
  }
  else if (cap4Exist == true) && (cap5Exist == false)
  {
    if (cap3Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 4.");
        exit;
    }
    if (cap2Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 4.");
        exit;
    }
    if (cap1Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 4.");
        exit;
    }
  }
  else if (cap3Exist == true) && (cap4Exist == false) && (cap5Exist == false)
  {
    if (cap2Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 3.");
        exit;
    }
    if (cap1Exist == false)
    {
        show_message("Please make sure you did not skip placement of a control point inbetween 1 and 3.");
        exit;
    }
  }
  
  var target_PNG, c, loadWM, loadBGs;
  
  c = 0;
  if (global.quickSave == 0)
  {
        target_PNG = get_open_filename("PNG|*.png","");
        if (target_PNG == "")
        {
            break;
        }
  }
  else
  {
        target_PNG = global.rawBG;
        if (target_PNG == "")
        {
            target_PNG = global.rawWM;
        }
        if (target_PNG == "")
        {
              show_message("Autosave Failed.");  
              break;
        }
  }
  
  // if we haven't done so already, compress the walkmask to a string
  if(mc.compressedWalkmaskString == "")
    mc.compressedWalkmaskString = compressWalkmaskToString();
  
  // get entity data and compressed walkmask data, and put them together
  var leveldata;
  leveldata = writeEntitiesToString() + chr(10) + mc.compressedWalkmaskString;
  
  GG2DLL_embed_PNG_leveldata(target_PNG, leveldata);
