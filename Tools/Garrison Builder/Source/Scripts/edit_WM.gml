if (global.WM != "")
{
    if (global.autoRefresh == 0)
    {
        execute_program(global.paintAppdir, global.WM, false);
    }
    else if (global.autoRefresh == 1)
    {
        execute_program(global.paintAppdir, global.WM, true);
        // after returning, let's refresh the image.
        background_replace(levelwm, global.rawWM, true, false);
        room_set_background(room0,1,true,false,levelbg,0,0,false,false,0,0,1);
    }
    global.madeChange = true;
}
