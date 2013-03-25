// Removes the earliest received packet for a server-sent plugin
// If there is packet to remove, returns false, otherwise true
// argument0 - plugin packet ID, passed as argument0 to server-sent plugin upon execution

var packetID, packetBufferQueue, packetPlayerQueue;

packetID = argument0;

// check to make sure the packet ID is valid
if (ds_map_exists(global.pluginPacketBuffers, packetID))
{
    packetBufferQueue = ds_map_find_value(global.pluginPacketBuffers, packetID);
    packetPlayerQueue = ds_map_find_value(global.pluginPacketPlayers, packetID);
    
    // check we have any packet to pop
    if (!ds_queue_empty(packetBufferQueue))
    {
        // dequeue from both queues
        // (the queues are synchronised, two are used because GML has no tuples)
        buffer_destroy(ds_queue_dequeue(packetBufferQueue));
        ds_queue_dequeue(packetPlayerQueue);
        return true;
    }
    else
    {
        return false;
    }
}
else
{
    show_error("ERROR when popping plugin packet buffer: no such plugin packet ID " + string(packetID), true);
}

