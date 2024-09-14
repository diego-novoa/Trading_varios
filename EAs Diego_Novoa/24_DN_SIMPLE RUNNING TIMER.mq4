
datetime CurrentTime;
datetime StarTime;
datetime PassedTimeInSeconds;
string   TimeWhithSeconds;
string   StarTimeWhithSeconds;


void OnTick()
  {

   if(StarTime==0)
   {
   
    StarTime= TimeLocal();
    StarTimeWhithSeconds=TimeToStr(StarTime,TIME_DATE|TIME_SECONDS);
   
   }
    
    CurrentTime=TimeLocal();
    PassedTimeInSeconds=CurrentTime-StarTime;
    TimeWhithSeconds=TimeToStr(StarTime,TIME_DATE|TIME_SECONDS);
    
    Comment("Star Time Whith Seconds:",StarTimeWhithSeconds,"\n",
            "Time Whith Seconds:",TimeWhithSeconds,"\n",
            "Current Time:",CurrentTime,"\n",
            "Passed Time In Seconds :",PassedTimeInSeconds ,"\n",
            "Passed Time In Minutes:",PassedTimeInSeconds/60 ,"\n",
            "Passed Time In Hours:",PassedTimeInSeconds/3600,"\n"
    
           );
   
  }

