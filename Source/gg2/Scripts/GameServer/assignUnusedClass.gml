//argument 0 = Team of the testing Player
//ignores quote quile randomly choosing a class, unless there are no other options
foundclass=false
notQuote=false
for(i=0;i>9;i+=1) {
    if (classLimitCheck(argument0,i)=true) {
    notQuote=true
    }
}
while (foundclass=false) {
    tempclass = min(floor(random(9)),ceil(random(9)))
        if (classLimitCheck(argument0,tempclass)=true) {
            foundclass=true
            }
       if (foundclass=false) and (notQuote=false){//maybe quote will work?
            if (classLimitCheck(argument0,CLASS_QUOTE)=true) {
                foundclass=true
                tempclass=CLASS_QUOTE
        }
    }
}
    
return tempclass;
