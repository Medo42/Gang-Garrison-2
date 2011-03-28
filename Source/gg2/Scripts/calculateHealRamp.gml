//argument0: timeSinceDamageTaken

var time, minTime, maxTime, minRate, maxRate;
time = argument0;
minTime = 5*30;
maxTime = 10*30;
minRate = 1;
maxRate = 3;

if (time <=minTime)
{ return minRate; }
else if (time >=maxTime)
{ return maxRate; }
else { return time * (maxRate - minRate)/(maxTime-minTime) - minRate; }
