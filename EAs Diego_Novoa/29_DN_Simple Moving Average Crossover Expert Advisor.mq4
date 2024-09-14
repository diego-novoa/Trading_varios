

void OnTick()
  {

   double SlowMovigAverage=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE,0);
   double LastSlowMovigAverage=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE,1);
   double FastMovigAverage=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE,0);
   double LastFastMovigAverage=iMA(NULL,0,20,0,MODE_SMA,PRICE_CLOSE,1);
   
   if((LastFastMovigAverage < LastSlowMovigAverage) 
      && (FastMovigAverage > SlowMovigAverage))
   
   Comment ("Buy");
   
   if((LastFastMovigAverage > LastSlowMovigAverage) 
      && (FastMovigAverage < SlowMovigAverage))
      
   Comment ("Sell");
  }


