//argument 0 = current team of Player
//argument 1 = class Player would like to switch to
check = 0;
classlimitmax=0
teamplayers=0

for (i=0; i<10; i+=1) {
        classlimitmax+=global.classlimit[i]
        
    }

with(Player) {
    if (team=argument0){
                GameServer.teamplayers+=1;
        } 
    }
if teamplayers > classlimitmax{ //if the players exceed class limits, just start ignoring classlimits
    return true;
    }

if (argument1 < 0 || argument1 > 9){
 return true;
 }
 
if global.classlimit[argument1]  < 0 return true;


with(Player) {
    if team == argument0 {
        if class = argument1 {
        GameServer.check+= 1;
        } 
    }
}

if check >= global.classlimit[argument1] return false;
else return true;
