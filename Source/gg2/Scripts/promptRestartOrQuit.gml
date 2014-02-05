// Ask the user whether he wants to restart the game, or quit.
// This is used in situations where simply continuing to run is not advisable,
// e.g. on unexpected errors (server sent unexpected data) or because plugin
// code needs to be unloaded.
// argument0 - Message 
// argument1 - Option 1
// argument1 - Option 2
// argument1 - Option 3

var promptText, result, promptOption1, promptOption2, promptOption3;
promptText = argument0;
promptOption1 = argument1;
promptOption2 = argument2;
promptOption3 = argument3;

result = show_message_ext(
    promptText,
    promptOption1,
    promptOption2,
    promptOption3 
);

if (result == 1)
    restartGG2();
if (result == 3)
    game_end()
