if (global.BG != "")
{
    if (global.autoRefresh == 0)
    {
        execute_program(global.paintAppdir, global.BG, false);
    }
    else if (global.autoRefresh == 1)
    {
        execute_program(global.paintAppdir, global.BG, true);
        // after returning, let's refresh the image.
        background_replace(levelbg, global.rawBG, false, false);
        room_set_background(room0,0,true,false,levelbg,0,0,false,false,0,0,1);
    }
    global.madeChange = true;
}
