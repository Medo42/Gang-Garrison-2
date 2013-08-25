var socket, joiningPlayer, totalClientNumber;
socket = socket_accept(global.tcpListener);
if(socket >= 0) {
    // Count players and joining players combined
    var numPlayers;
    numPlayers = 0;
    with (Player)
        numPlayers += 1;
    with (JoiningPlayer)
        numPlayers += 1;
    // If this player joining would make server exceed player limit
    if(numPlayers + 1 > global.playerLimit)
    {
        write_ubyte(socket, SERVER_FULL);
        socket_send(socket);
        socket_destroy(socket);
    }
    else
    {
        joiningPlayer = instance_create(0,0,JoiningPlayer);
        joiningPlayer.socket = socket;
    }
}



