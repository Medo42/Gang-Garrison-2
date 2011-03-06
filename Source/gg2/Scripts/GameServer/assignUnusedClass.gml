//argument 0 = Team of the testing Player
foundclass=false
while (foundclass=false) {
    tempclass = floor(irandom(9))
        if (classLimitCheck(argument0,tempclass)=true) {
            foundclass=true
        }
    }
return tempclass;
