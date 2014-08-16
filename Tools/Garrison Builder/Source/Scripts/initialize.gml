// global defines

global.BG = "";
global.WM = "";

global.loadedBG = false;
global.loadedWM = false;
global.loadedEnt = false;
global.currentCap = "Garrison Builder - Gang Garrison 2";
room_caption = global.currentCap;
global.defaults = true;

global.wkmskName = "";
global.bgName = "";

global.caughtError = 0;

global.combo = 0;
global.madeChange = false;

global.erasedOnce = true;
global.erasedOnce2 = true;

global.notOnTools = true;

global.CustomMapCollisionSprite = -1;
global.mapURL = "";
global.loadedC = false;

global.sixtyFourBitV = false;

global.quickSave = true;

draw_set_font(gg2Fnt);

/*
    message_background(popupBackgroundB);
    message_button(popupButtonS);
    message_text_font(gg2Fnt,9,c_white,1);
    message_button_font(gg2Fnt,9,c_white,1);
    message_input_font(gg2Fnt,9,c_white,0);
*/

if file_exists("game_errors.log") file_delete("game_errors.log");

ini_open("gb.ini");
global.paintApp = ini_read_string("Settings", "Paint Application", "MSPaint");
global.autoRefresh = ini_read_real("Settings", "Refresh BG/WM after edit", 1);
global.gg2Dir = ini_read_string("Settings", "Gang Garrison 2.exe Location", "");
global.specialE = ini_read_real("Settings", "Graphics Effects", 1);
global.width = ini_read_real("Settings", "Toolbar Width", 5);  
global.sixtyFourBitV = ini_read_real("Settings", "Windows Vista x64", false);  
global.quickSave = ini_read_real("Settings", "Quicksave Maps", 1);  

ini_write_string("Settings", "Paint Application", global.paintApp);
ini_write_real("Settings", "Refresh BG/WM after edit", global.autoRefresh);
ini_write_string("Settings", "Gang Garrison 2.exe Location", global.gg2Dir);
ini_write_real("Settings", "Graphics Effects", global.specialE);
ini_write_real("Settings", "Toolbar Width", global.width);
ini_write_real("Settings", "Windows Vista x64", global.sixtyFourBitV);
ini_write_real("Settings", "Quicksave Maps", global.quickSave);
ini_close();

switch (string_lower(global.paintApp)) // let's determine what program the users wants to launch every time.
{
    case "gimp": 
    global.paintAppdir = "C:\Progra~1\GIMP-2.0\bin\gimp-2.6.exe";
    break;
    
    case "graphicsgale": 
    global.paintAppdir = "C:\Progra~1\GraphicsGale\Gale.exe";
    break;
    
    case "paint.net": 
    global.paintAppdir = "C:\Progra~1\Paint.NET\PaintDotNet.exe";
    break;
    
    case "mspaint":
    case "paint":
    default: // if we didn't know what the program was
    if (global.sixtyFourBitV == 1)
    {
        global.paintAppdir = "C:\WINDOWS\SYSWOW64\mspaint.exe";
    }
    else
    {
        global.paintAppdir = "C:\WINDOWS\system32\mspaint.exe";
    }
    break;
}

