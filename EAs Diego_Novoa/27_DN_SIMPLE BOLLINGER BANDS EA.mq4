


void OnTick()
  {

   string signal="";
   double LowerBB=iBands(_Symbol,_Period,20,2,0,PRICE_CLOSE,MODE_LOWER,1);
   double UpperBB=iBands(_Symbol,_Period,20,2,0,PRICE_CLOSE,MODE_UPPER,1);
   double PrevLowerBB=iBands(_Symbol,_Period,20,2,0,PRICE_CLOSE,MODE_LOWER,2);
   double PrevUpperBB=iBands(_Symbol,_Period,20,2,0,PRICE_CLOSE,MODE_UPPER,2);
   
   if(Close[2]<PrevLowerBB)
   if(Close[1]>LowerBB)
   {
     signal="Buy";
   }
   
   if(Close[2]>PrevUpperBB)
   if(Close[1]<UpperBB)
   {
     signal="Sell";
   }
   if(signal=="Buy" && OrdersTotal()==0)
   OrderSend (_Symbol,OP_BUY,0.10,Ask,3,0,Ask+150*_Point,NULL,0,0,Green);
   
   if(signal=="Sell" && OrdersTotal()==0)
   OrderSend (_Symbol,OP_SELL,0.10,Bid,3,0,Bid-150*_Point,NULL,0,0,Red);
   
   Comment("signal:",signal);
  }


