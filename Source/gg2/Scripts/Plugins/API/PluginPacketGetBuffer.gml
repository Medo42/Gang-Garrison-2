// Returns the buffer of the earliest received packet for a server-sent plugin
// If there is no packet buffer to return, returns -1
// argument0 - plugin packet ID, passed as argument0 to server-sent plugin upon execution

var packetID, packetBufferQueue;

packetID = argument0;

// check to make sure the packet ID is valid
if (ds_map_exists(global.pluginPacketBuffers, packetID))
{
    packetBufferQueue = ds_map_find_value(global.pluginPacketBuffers, packetID);

    // check we have any buffer to return
    if (!ds_queue_empty(packetBufferQueue))
    {
        return ds_queue_head(packetBufferQueue);
    }
    else
    {
        return -1;
    }
}
else
{
    show_error("ERROR when fetching plugin packet buffer: no such plugin packet ID " + string(packetID), true);
}

