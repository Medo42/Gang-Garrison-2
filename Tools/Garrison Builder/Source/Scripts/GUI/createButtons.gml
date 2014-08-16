{
createButton(loadExisMap);
createButton(loadBG);
createButton(unloadBG);
createButton(loadWalkmask);
createButton(unloadWalkmask);
createButton(loadEntities);
createButton(unloadEntities);
createButton(saveEntities);
createButton(embedLevelDataInPNG);
createButton(editBG);
createButton(editWM);
createButton(testMap);
//createButton(customClear);
createToolButton(moveTool);

createToggleButton(bgVisible, true);
createToggleButton(walkmaskVisible, false);
createToggleButton(snapToGrid, true);
createToggleButton(gridVisible, false);

createToolButton(redspawn);
createToolButton(bluespawn);
createToolButton(redintel);
createToolButton(blueintel);
createToolButton(NeutralIntel);
createToolButton(IntelSpawn);
createToolButton(RedIntelSpawn);
createToolButton(BlueIntelSpawn);
createToolButton(redteamgate);
createToolButton(redteamgate2);
createToolButton(blueteamgate);
createToolButton(blueteamgate2);
createToolButton(redintelgate);
createToolButton(redintelgate2);
createToolButton(blueintelgate);
createToolButton(blueintelgate2);
createToolButton(intelgatevertical);
createToolButton(intelgatehorizontal);
createToolButton(bulletwall);
createToolButton(bulletwall_horizontal);
createToolButton(playerwall);
createToolButton(playerwall_horizontal);
createToolButton(killbox);
createToolButton(fragbox);
createToolButton(spawnroom);
/*
createToolButton(map_end_trigger_red);
createToolButton(map_end_trigger_blu);
createToolButton(map_end_trigger_red_back);
createToolButton(map_end_trigger_blu_back);
*/
createToolButton(medCabinet);
createToolButton(controlPoint1);
createToolButton(controlPoint2);
createToolButton(controlPoint3);
createToolButton(controlPoint4);
createToolButton(controlPoint5);
createToolButton(NextAreaO);
createToolButton(CapturePoint);
createToolButton(SetupGate);


// createSpecifyButton(timer);
/*
createToolButton(gameMode_ctf);
createToolButton(gameMode_vip);
createToolButton(vip_start);
createToolButton(vip_end);
createToolButton(medCabinet);
createSpecifyButton(Teleports);
*/

_buttony = 0;
_buttonx = 0;
_toolbarWidth = global.width;

with(Button) {
  relative_y = other._buttony
  relative_x = other._buttonx
  other._buttonx += 45;
  if(other._buttonx >= 45 * other._toolbarWidth) {
    other._buttonx = 0;
    other._buttony += 45;
  }
}
}
