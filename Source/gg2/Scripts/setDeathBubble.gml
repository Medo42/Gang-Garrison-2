if(instance_exists(argument0)) {
    if(argument0.corpseX != -1 && argument0.corpseY != -1) {
        var deathmote;
        deathmote = instance_create(argument0.corpseX, argument0.corpseY, DeathMote);
        deathmote.bubble = argument1;
        deathmote.name = argument0.name;
        deathmote.team = argument0.team;
    }
}
