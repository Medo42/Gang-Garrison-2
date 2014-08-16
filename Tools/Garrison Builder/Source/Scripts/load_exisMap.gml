// Not a huge bug, but an "exploit" of the executable is possible 
// by placing a file that will be loaded in a folder or directory
// with a period in the directory itself.

// using code adapted from the Garrison Decompiler.

if(!directory_exists(program_directory + "\Decompiled")) directory_create(program_directory + "\Decompiled");
if(!directory_exists(program_directory + "\Decompiled\Background")) directory_create(program_directory + "\Decompiled\Background");
if(!directory_exists(program_directory + "\Decompiled\Walkmask")) directory_create(program_directory + "\Decompiled\Walkmask");
if(!directory_exists(program_directory + "\Decompiled\Entities")) directory_create(program_directory + "\Decompiled\Entities");

var currentC, fileNameCh, fileLen;

global.choice = get_string("Would you like to load a *.png map file or a *.locator file?", "png");

switch (global.choice)
{
    case "png":
    chosen = 1;
    break;
    
    case "PNG":
    chosen = 1;
    break;

    case ".PNG":
    chosen = 1;
    break;
    
    case ".png":
    chosen = 1;
    break;
    
    case "locator":
    chosen = 2;
    break;
    
    case "LOCATOR":
    chosen = 2;
    break;

    case ".LOCATOR":
    chosen = 2;
    break;
    
    case ".locator":
    chosen = 2;
    break;
    
    case "":
    exit;
    break;
    
    default:
    chosen = 1;
    break;    
}

if (chosen == 1)
{
    global.decompileFile = get_open_filename("PNG|*.png;*.PNG","");
    
    if (global.decompileFile == "")
    {
        exit;
    }
    
    global.map = global.decompileFile;
    global.decompileFileDir = global.decompileFile;
        
    // This next block of code attempts to grab the true base name without the extension and directory.
    while (string_count("\", global.map) != 0) // this part grabs the base name without the directory
    {
        global.map = string_delete(global.map, 1, 1);
    }
    
    fileNameCh = string_pos(".png", global.map);
    if (fileNameCh == 0)
    {
        fileNameCh = string_pos(".PNG", global.map);
    }
    fileLen = string_length(global.map);
    global.map = string_copy(global.map, 0, fileLen - (fileLen - fileNameCh) - 1);

    CustomMapInit(global.decompileFile);
}
else if (chosen == 2)
{
    global.decompileFile = get_open_filename("Locator|*.locator","");
    if (global.decompileFile == "")
    {
        exit;
    }
    
    global.map = global.decompileFile;
    global.decompileFileDir = global.decompileFile;    
    
    // This next block of code attempts to grab the true base name without the extension and directory.
    while (string_count("\", global.map) != 0) // this part grabs the base name without the directory
    {
        global.map = string_delete(global.map, 1, 1);
    }
    
    fileNameCh = string_pos(".locator", global.map);
    fileLen = string_length(global.map);
    global.map = string_copy(global.map, 0, fileLen - (fileLen - fileNameCh) - 1);
    
    var fileHandle;
    fileHandle = file_text_open_read(global.decompileFile);
    if (fileHandle == -1) 
    {
        show_message("There was an error reading from the file.#Exiting from the current process.");
        exit;
    }
    global.mapURL = file_text_read_string(fileHandle);
    file_text_close(fileHandle);
    
    CustomMapDownload(); // first we download the file
}
global.bgName = global.map;