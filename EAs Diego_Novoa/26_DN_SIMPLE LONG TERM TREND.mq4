
input int SmallSMA=950;
input int BigSMA=1000; 


void OnTick()
  {
   string signal="";
   double SmallMovignAveragel= iMA(_Symbol,_Period,SmallSMA,0,MODE_SMA,PRICE_CLOSE,1);
   double BigMovignAveragel= iMA(_Symbol,_Period,BigSMA,0,MODE_SMA,PRICE_CLOSE,1);
   if(BigMovignAveragel>SmallMovignAveragel)
   
   {
   signal="Sell";
   }
   
   if(BigMovignAveragel<SmallMovignAveragel)
   {
   signal="Buy";
   }
   if(signal=="Buy" && OrdersTotal()==0)
   OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-50*_Point,Ask+50*_Point,NULL,0,0,Green);
   
   if(signal=="Sell" && OrdersTotal()==0)
   OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+50*_Point,Bid-50*_Point,NULL,0,0,Red);
  }

