ini_open("DSM.ini")
global.randomiseMapRotation=ini_read_real("Settings","RandomiseMapRotation",0)
global.drawIntelArrows=ini_read_real("Settings","DrawIntelArrows",1)
global.hpBarText=ini_read_real("Settings","HPBarText",1)
global.ammoBar=ini_read_real("Settings","AmmoBar",1)
global.generatorStab=ini_read_real("Settings","GeneratorStab",1)

ini_write_real("Settings","RandomiseMapRotation",global.randomiseMapRotation)
ini_write_real("Settings","DrawIntelArrows",global.drawIntelArrows)
ini_write_real("Settings","HPBarText",global.hpBarText)
ini_write_real("Settings","AmmoBar",global.ammoBar)
ini_write_real("Settings","GeneratorStab",global.generatorStab)
ini_close()

statsTracker()
