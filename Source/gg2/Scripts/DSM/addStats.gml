global.statsGames+=1
//Wins and losses changed in create event of win banner.
global.statsKills+=global.myself.stats[KILLS]
global.statsDeaths+=global.myself.stats[DEATHS]
global.statsAssists+=global.myself.stats[ASSISTS]
global.statsDestruction+=global.myself.stats[DESTRUCTION]
global.statsCaps+=global.myself.stats[CAPS]
global.statsDefences+=global.myself.stats[DEFENSES]
global.statsInvulns+=global.myself.stats[INVULNS]
global.statsHealing+=global.myself.stats[HEALING]
global.statsStabs+=global.myself.stats[STABS]

writeStats()
