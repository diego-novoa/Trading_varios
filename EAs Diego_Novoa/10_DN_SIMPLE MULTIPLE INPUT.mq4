
enum list
    
    {
     RANDOM=0,
     EMA=1,
     TRIX=2,
     ADX=3,
     MOM=4,
     TREND=5,
    };

input list choise=RANDOM;
string Entry;


void OnTick()
  {

  if(choise==0) Entry="RANDOM";
  if(choise==1) Entry="EMA";
  if(choise==2) Entry="TRIX";
  if(choise==3) Entry="ADX";
  if(choise==4) Entry="MOM";
  if(choise==5) Entry="TREND";
  
  Comment (
           
           "Entry: " ,Entry,"\n"
           "choise: ",choise
  
  
          );
   
   
  }

