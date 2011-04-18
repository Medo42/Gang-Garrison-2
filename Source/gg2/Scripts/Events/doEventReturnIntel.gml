/**
 * argument0 = team of intel being returned
 */
var isMe;
recordEventInLog(3, argument0.team, argument0.name, isMe);
sound_play(IntelDropSnd);
recordEventInLog(8, argument0, "", argument0);
if (argument0 = TEAM_RED) {
        IntelligenceRed.x = IntelligenceBaseRed.x;
        IntelligenceRed.alarm[0]=-1;
    }else{
        IntelligenceBlue.x = IntelligenceBaseBlue.x;
        IntelligenceBlue.alarm[0]=-1;
}
