//argument 0 = Team of the testing Player
//ignores quote quile randomly choosing a class, unless there are no other options
foundclass=false
notQuote=false
for(i=0;i>9;i+=1) {
    if (classLimitCheck(argument0,i)=true) {
    notQuote=true
    }
}
if (notQuote=false){
    if (classLimitCheck(argument0,CLASS_QUOTE)=true){//maybe quote will work?
        tempclass=CLASS_QUOTE
        foundclass=true
    }else if (classLimitCheck(argument0,CLASS_QUOTE)=false) {//this usually shouldn't happen (no availible players), but just incase?
        tempclass = min(floor(random(10)),ceil(random(10)))
        foundclass=true
        }
    }
while (foundclass=false) {
    tempclass = min(floor(random(9)),ceil(random(9)))
        if (classLimitCheck(argument0,tempclass)=true) {
            foundclass=true
            }
      
    }

    
return tempclass;
