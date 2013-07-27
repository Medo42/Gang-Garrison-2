{
    var currentDate, timestamp, uniqueSuffix, uniqueSuffixNr;
    currentDate = date_current_datetime();
    timestamp = string(date_get_year(currentDate)) + "-";
    if (date_get_month(currentDate) < 10) { timestamp = timestamp + "0"; }
    timestamp += string(date_get_month(currentDate)) + "-";
    if (date_get_day(currentDate) < 10) { timestamp = timestamp + "0"; }
    timestamp += string(date_get_day(currentDate)) + " ";
    if (date_get_hour(currentDate) < 10) { timestamp = timestamp + "0"; }
    timestamp += string(date_get_hour(currentDate)) + "-";
    if (date_get_minute(currentDate) < 10) { timestamp = timestamp + "0"; }
    timestamp += string(date_get_minute(currentDate)) + "-";
    if (date_get_second(currentDate) < 10) { timestamp = timestamp + "0"; }
    timestamp += string(date_get_second(currentDate));
    
    uniqueSuffix = "";
    uniqueSuffixNr = 2;
    while (file_exists("Screenshots/" + timestamp + uniqueSuffix + " " + global.serverName + " " + global.currentMap + ".png")) {
        uniqueSuffix = " ("+string(uniqueSuffixNr)+")";
        uniqueSuffixNr += 1;
    }
    //tons of screenshot formats for each menu
    if instance_exists(LobbyController){
    screen_save("Screenshots/" + timestamp + uniqueSuffix + " " + "Lobby" + ".png");
    }
    if instance_exists(PlayerControl){
    screen_save("Screenshots/" + timestamp + uniqueSuffix + " " + global.serverName + " " + global.currentMap + ".png");
    }
    if instance_exists(MainMenuController){
    screen_save("Screenshots/" + timestamp + uniqueSuffix + " " + "Main_Menu" + ".png");
    }
    if instance_exists(OptionsController){
    screen_save("Screenshots/" + timestamp + uniqueSuffix + " " + "Options" + ".png");
    }
    if instance_exists(HostOptionsController){
    screen_save("Screenshots/" + timestamp + uniqueSuffix + " " + "Host_Options" + ".png");
    }
    if instance_exists(HUDOptionsController){
    screen_save("Screenshots/" + timestamp + uniqueSuffix + " " + "HUD_Options" + ".png");
    }
    //adding this in case I missed a menu to prevent erroring
    else screen_save("Screenshots/" + timestamp + uniqueSuffix + ".png");
}