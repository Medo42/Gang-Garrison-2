global.entities = ds_list_create();
global.entityData = ds_list_create();
global.gamemodes = ds_list_create();
global.buttons = ds_list_create();

global.placeEntityFunction = "";

addButton("Load map", '
    var map;
    map = get_open_filename("PNG|*.png","");
    if (map == "") break;
    with(LevelEntity) instance_destroy();
    CustomMapInit(map)
    Builder.mapBG = map;  
    Builder.mapWM = " ";
    Builder.wmString = compressWalkmask();
');
addButton("Load BG", '
    var bg;
    bg = get_open_filename("PNG|*.png","");
    if(bg == "") break;
    Builder.mapBG = bg;
    background_replace(BuilderBGB, bg, false, false);
    background_xscale[0] = 6;
    background_yscale[0] = 6;
'); 
addButton("Load WM", '
    var wm;
    wm = get_open_filename("Walkmask Image (PNG or BMP)|*.png; *.bmp","");
    if(wm == "") break;
    Builder.mapWM = wm;
    background_replace(BuilderWMB, wm, true, false);
    background_xscale[1] = 6;
    background_yscale[1] = 6;
    Builder.wmString = compressWalkmask();
'); 
addButton("Show BG", 'background_visible[0] = argument0;', 1, 1); 
addButton("Show WM", '
    room_set_background(BuilderRoom, 1, true, false, BuilderWMB, 0, 0, false, false, 0, 0, 0.7);
    background_visible[1] = argument0;
', 1); 
addButton("Show grid", 'background_visible[2] = argument0;', 1);
addButton("Compile map", '
    if (Builder.mapWM == "") show_message("Select a walkmask first.");
    else if (Builder.mapBG == "") show_message("Select a background first");
    else {
        // Validate the gamemode
        var gmMap, code, error;
        gmMap = ds_list_find_value(global.gamemodes, log2(Builder.gamemode));
        if (gmMap != -1) {
            code = ds_map_find_value(gmMap, "code");
            if (is_string(code)) {
                error = ds_map_find_value(gmMap, "error");
                if (!is_string(error)) error = "Your setup is not valid.";
                else error = "Your setup is not valid:#" + error;
                
                if (!execute_string(ds_map_find_value(gmMap, "code"))) {
                    if (show_message_ext(error, "Continue", "Cancel", "") != 1) return false;
                }
            }
        }
        
        var leveldata;
        leveldata = compressEntities() + chr(10) + Builder.wmString;
        GG2DLL_embed_PNG_leveldata(Builder.mapBG, leveldata);
        if (show_message_ext("Compilation completed", "Ok", "Playtest", "") == 2) {
            // Get the mapname
            global.currentMap = Builder.mapBG;
            while (string_count("\", global.currentMap) != 0) global.currentMap = string_delete(global.currentMap, 1, 1);
            var fileNameCh, fileLen;
            fileNameCh = string_pos(".png", global.currentMap);
            if (fileNameCh == 0) fileNameCh = string_pos(".PNG", global.currentMap);
            fileLen = string_length(global.currentMap);
            global.currentMap = string_copy(global.currentMap, 0, fileLen - (fileLen - fileNameCh) - 1);
                
            // Place a copy in the maps folder if needed
            if (Builder.mapBG != working_directory + "\Maps\"+global.currentMap+".png") {
                if (file_exists("Maps\"+global.currentMap+".png")) file_delete("Maps\"+global.currentMap+".png");
                file_copy(Builder.mapBG, "Maps\"+global.currentMap+".png");
            }

            Builder.visible = false;
            global.launchMap = global.currentMap;
            global.isHost = true;
            global.gameServer = instance_create(0,0,GameServer); 
        }
    }
'); 
addButton("Symmetry mode", '
    Builder.symmetry = argument0;
    return argument0;
', 1); 
addButton("Tile mode", '
    Builder.tile = argument0;
    return argument0;
', 1, 1); 
addButton("Snap tiles", '
    Builder.snap = argument0;
    return argument0;
', 1, 1);
addButton("Scale mode", '
    if (argument0 && !Builder.ggon) {
        if (show_message_ext("This map will be compiled with GGON if you use scale mode. This means that < v2.7.4 won'+chr(39)+'t be able to decompile this map.", "Ok", "Cancel", "") == 1) {
            Builder.scale = argument0;
            Builder.ggon = true;
        } else return false;
    } else Builder.scale = argument0;
    return argument0;
', 1);
addButton("Fast scrolling",'
    Builder.moveSpeed = 32 + 32*argument0;
    return argument0;
', 1);
addButton("Load entities", 'loadEntities()'); 
addButton("Save entities", 'saveEntities()');
addButton("Clear entities", '
    if (show_question("Are you sure you want to scrap your entities?")) {
        with (LevelEntity) instance_destroy();
    }
'); 

var ctf, cp, adcp, koth, dkoth, arena, gen;
addGamemode("Free mode");
ctf = addGamemode("Capture the flag (ctf)", '
    var redCount, blueCount;
    redCount = 0;
    blueCount = 0;
    with(LevelEntity) {
        if (type == "redintel") redCount += 1;
        else if (type == "blueintel") blueCount += 1;
    }
    if (redCount != 1 || blueCount != 1) return false;
    return true;
', "Ctf or invasion mode needs 1 red and 1 blue intelligence.");
cp = addGamemode("Control points (cp)", '
    var controlpoints, zones;
    controlpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "controlPoint1" || type == "controlPoint2" || type == "controlPoint3" || type == "controlPoint4" || type == "controlPoint5") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (controlpoints == 0 || controlpoints > 5 || zones == 0) return false;
    return true;
', "CP needs 1-5 control points and capturezones.");
adcp = addGamemode("A/D control points (adcp)", '
    var controlpoints, zones, gates;
    controlpoints = 0;
    zones = 0;
    gates = 0;
    with(LevelEntity) {
        if (type == "controlPoint1" || type == "controlPoint2" || type == "controlPoint3" || type == "controlPoint4" || type == "controlPoint5") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
        else if (type == "SetupGate") gates += 1;
    }
    if (controlpoints == 0 || controlpoints >= 5 || zones == 0 || gates == 0) return false;
    return true;
', "A/D CP needs 1-5 control points, capturezones and setup gates.");
koth = addGamemode("King of the hill (koth)", '
    var controlpoints, zones;
    controlpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "KothControlPoint") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (controlpoints != 1 || zones == 0) return false;
    return true;
', "KOTH needs 1 control point and capturezones.");
dkoth = addGamemode("Dual king of the hill (dkoth)" ,'
    var redcontrolpoints, bluecontrolpoints, zones;
    redcontrolpoints = 0;
    bluecontrolpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "KothRedControlPoint") redcontrolpoints += 1;
        else if (type == "KothBlueControlPoint") bluecontrolpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (redcontrolpoints != 1 || bluecontrolpoints || zones == 0) return false;
    return true;
', "DKOTH needs 1 red control point, 1 blue control point and capturezones.");
arena = addGamemode("Arena (arena)", '
    var controlpoints, zones;
    controlpoints = 0;
    zones = 0;
    with(LevelEntity) {
        if (type == "ArenaControlPoint") controlpoints += 1;
        else if (type == "CapturePoint") zones += 1;
    }
    if (controlpoints != 1 || zones == 0) return false;
    return true;
', "Arena needs 1 control point and capturezones.");
gen = addGamemode("Generator (gen)", '
    var redgen, bluegen;
    redgen = 0;
    bluegen = 0;
    with(LevelEntity) {
        if (type == "GeneratorRed") redgen += 1;
        else if (type == "GeneratorBlue") bluegen += 1;
    }
    if (redgen != 1 || bluegen != 0) return false;
    return true;
', "Gen needs 1 red and 1 blue generator.");

addEntity("spawnroom", -1, SpawnRoom, sprite64, 1, entityButtonS, 74, "Players can instantly respawn in this area.");
addEntity("redspawn", -1, SpawnPointRed, spawnS, 0, entityButtonS, 30, "Default spawn locator for the red team.");
addEntity("redspawn1", cp | adcp | koth | dkoth, SpawnPointRed1, spawnS, 1, entityButtonS, 34, "Red forward spawn \#1");
addEntity("redspawn2", cp | adcp | dkoth, SpawnPointRed2, spawnS, 2, entityButtonS, 38, "Red forward spawn \#2");
addEntity("redspawn3", adcp, SpawnPointRed3, spawnS, 3, entityButtonS, 42, "Red forward spawn \#3");
addEntity("redspawn4", adcp, SpawnPointRed4, spawnS, 4, entityButtonS, 46, "Red forward spawn \#4");
addEntity("bluespawn", -1, SpawnPointBlue, spawnS, 5, entityButtonS, 32, "Default spawn locator for the blue team.");
addEntity("bluespawn1", cp | adcp | koth | dkoth, SpawnPointBlue1, spawnS, 6, entityButtonS, 36, "Blue forward spawn \#1");
addEntity("bluespawn2", cp | adcp | dkoth, SpawnPointBlue2, spawnS, 7, entityButtonS, 40, "Blue forward spawn \#2");
addEntity("bluespawn3", adcp, SpawnPointBlue3, spawnS, 8, entityButtonS, 44, "Blue forward spawn \#3");
addEntity("bluespawn4", adcp, SpawnPointBlue4, spawnS, 9, entityButtonS, 48, "Blue forward spawn \#4");
addEntity("redintel", ctf, IntelligenceBaseRed, IntelligenceRedS, 0, entityButtonS, 0, "The red intelligence spawnpoint.");
addEntity("blueintel", ctf, IntelligenceBaseBlue, IntelligenceBlueS, 0, entityButtonS, 2, "The blue intelligence spawnpoint.");
addEntity("redteamgate", ctf | cp | adcp | gen | koth | dkoth, RedTeamGate, sprite45, 1, entityButtonS, 84, "A wall that blocks blue players and bullets.");
addEntity("blueteamgate", ctf | cp | adcp | gen | koth | dkoth, BlueTeamGate, sprite45, 2, entityButtonS, 86, "A wall that blocks red players and bullets.");
addEntity("redteamgate2", ctf | cp | adcp | gen | koth | dkoth, RedTeamGate2, sprite44, 1, entityButtonS, 90, "A floor that blocks blue players and bullets.");
addEntity("blueteamgate2", ctf | cp | adcp | gen | koth | dkoth, BlueTeamGate2, sprite44, 2, entityButtonS, 92, "A floor that blocks red players and bullets..");
addEntity("redintelgate", ctf, RedIntelGate, sprite45, 7, entityButtonS, 8, "A wall that blocks players carrying the red intel.");
addEntity("blueintelgate", ctf, BlueIntelGate, sprite45, 8, entityButtonS, 10, "A wall that blocks players carrying the blue intel.");
addEntity("redintelgate2", ctf, RedIntelGate2, sprite44, 6, entityButtonS, 4, "A floor that blocks players carrying the red intel.");
addEntity("blueintelgate2", ctf, BlueIntelGate2, sprite44, 7, entityButtonS, 6, "A floor that blocks players carrying the blue intel.");
addEntity("intelgatehorizontal", ctf, IntelGateHorizontal, sprite44, 8, entityButtonS, 94, "A floor that blocks players carrying the intel.");
addEntity("intelgatevertical", ctf, IntelGateVertical, sprite45, 9, entityButtonS, 96, "A wall that blocks players carrying the intel.");
addEntity("medCabinet", ctf | cp | adcp | gen | koth | dkoth, HealingCabinet, sprite74, 0, entityButtonS, 64, "Refills health and ammo.");
addEntity("killbox", -1, KillBox, sprite64, 2, entityButtonS, 58, "Kills a player.");
addEntity("pitfall", -1, PitFall, sprite64, 3, entityButtonS, 62, "Kills a player.");
addEntity("fragbox", -1, FragBox, sprite64, 4, entityButtonS, 60, "Gibs a player.");
addEntity("playerwall", -1, PlayerWall, sprite45, 3, entityButtonS, 50, "A wall that blocks players but not bullets.");
addEntity("playerwall_horizontal", -1, PlayerWallHorizontal, sprite44, 3, entityButtonS, 54, "A floor that blocks player but not bullets.");
addEntity("bulletwall", -1, BulletWall, sprite45, 4, entityButtonS, 52, "A wall that blocks bullets but not players.");
addEntity("bulletwall_horizontal", -1, BulletWallHorizontal, sprite44, 4, entityButtonS, 56, "A floor that blocks bullets but not players.");
addEntity("leftdoor", -1, LeftDoor, sprite45, 5, entityButtonS, 102, "Blocks players trying to go left");
addEntity("rightdoor", -1, RightDoor, sprite45, 6, entityButtonS, 104, "Blocks players trying to go right.");
addEntity("controlPoint1", cp | adcp, ControlPoint1, ControlPointNeutralS, 0, entityButtonS, 12, "Control point \#1");
addEntity("controlPoint2", cp | adcp, ControlPoint2, ControlPointNeutralS, 2, entityButtonS, 14, "Control point \#2");
addEntity("controlPoint3", cp | adcp, ControlPoint3, ControlPointNeutralS, 3, entityButtonS, 16, "Control point \#3");
addEntity("controlPoint4", cp | adcp, ControlPoint4, ControlPointNeutralS, 4, entityButtonS, 18, "Control point \#4");
addEntity("controlPoint5", cp | adcp, ControlPoint5, ControlPointNeutralS, 5, entityButtonS, 20, "Control point \#5");
addEntity("NextAreaO", ctf | cp | adcp | gen | koth | dkoth, NextAreaO, NextAreaS, 4, entityButtonS, 106, "Marks the next arena in multi stage maps.");
addEntity("CapturePoint", cp | adcp | koth | dkoth | arena, CaptureZone, CaptureZoneS, 0, entityButtonS, 26, "Players touching this will start capping the nearest control point.");
addEntity("SetupGate", ctf | adcp, ControlPointSetupGate, SetupGateS, 0, entityButtonS, 28, "Prevents players from passing during setup time.");
addEntity("ArenaControlPoint", arena, ArenaControlPoint, ControlPointNeutralS, 0, entityButtonS, 22, "Arena control point.");
addEntity("GeneratorRed", gen, GeneratorRed, GeneratorRedS, 0, entityButtonS, 76, "Location of the red generator.");
addEntity("GeneratorBlue", gen, GeneratorBlue, GeneratorBlueS, 0, entityButtonS, 78, "Location of the blue generator.");
addEntity("MoveBoxUp", -1, MoveBoxUp, sprite64, 5, entityButtonS, 66, "Move box up");
addEntity("MoveBoxDown", -1, MoveBoxDown, sprite64, 6, entityButtonS, 68, "Move box down");
addEntity("MoveBoxLeft", -1, MoveBoxLeft, sprite64, 7, entityButtonS, 72, "Move box left");
addEntity("MoveBoxRight", -1, MoveBoxRight, sprite64, 8, entityButtonS, 70, "Move box right ");
addEntity("KothControlPoint", koth, KothControlPoint, ControlPointNeutralS, 0, entityButtonS, 24, "KOTH control point");
addEntity("KothRedControlPoint", dkoth, KothRedControlPoint, ControlPointRedS, 0, entityButtonS, 98, "Red KOTH control point");
addEntity("KothBlueControlPoint", dkoth, KothBlueControlPoint, ControlPointBlueS, 0, entityButtonS, 100, "Blue KOTH control point");
addEntity("dropdownPlatform", -1, DropdownPlatform, sprite44, 5, entityButtonS, 80, "Dropdown platform");
