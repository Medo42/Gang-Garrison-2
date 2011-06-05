if global.special == MOUSE_LEFT && !mouse_check_button_pressed(mb_left) exit;
else if global.special == MOUSE_RIGHT && !mouse_check_button_pressed(mb_right) exit;

if global.myself.humiliated == 0 && global.myself.class == CLASS_ENGINEER 
{
    if !instance_exists(BuildMenu) instance_create(0,0,BuildMenu);
    else if instance_exists(BuildMenu) with (BuildMenu) done=true;
} else if global.myself.humiliated == 0 && global.myself.object.taunting==false && global.myself.object.omnomnomnom==false && global.myself.class==CLASS_HEAVY {
    write_ubyte(global.serverSocket, OMNOMNOMNOM);
    socket_send(global.serverSocket);
} else if global.myself.class == CLASS_SNIPER {
    write_ubyte(global.serverSocket, TOGGLE_ZOOM);
    socket_send(global.serverSocket);
}
