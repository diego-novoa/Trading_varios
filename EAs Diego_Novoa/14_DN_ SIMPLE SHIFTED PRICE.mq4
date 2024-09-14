


void OnTick()
  {
   
   string signal="";
   double MyMovingAverage= iMA(_Symbol,_Period,1,20,MODE_SMA,PRICE_CLOSE,0);
   
   if(MyMovingAverage<Close[0])
   {
   
   signal="buy";
   
   }
   
   if(MyMovingAverage>Close[0])
   {
   
   signal="sell";
   
   }
     
   if (signal=="buy" && OrdersTotal()==0)
   OrderSend (_Symbol,OP_BUY,0.10,Ask,3,0,Ask+150*_Point,NULL,0,0,Green);  
   
   if (signal=="sell" && OrdersTotal()==0)
   OrderSend (_Symbol,OP_SELL,0.10,Bid,3,0,Bid-150*_Point,NULL,0,0,Red);
   
   Comment("The Current signal is:");
     
     
     
  }

