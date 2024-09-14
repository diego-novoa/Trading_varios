
string signal= " ";

void OnTick()
  {

   static double NexSellPrice;
   
   if(OrdersTotal()==0)
   NexSellPrice=0;
   
   signal= CheckEntrySignal();
   
   if((Bid<=NexSellPrice)||(NexSellPrice==0))
   
   if(signal=="sell")
  {
   OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+150*_Point,Bid-150*_Point,NULL,0,0,Green);
   
   NexSellPrice=Bid-30*_Point;
      
   
  }
  Comment("Bid:",Bid,"\n","NexSellPrice:",NexSellPrice);
  
  }
  string CheckEntrySignal()
  
  {
  
  if(Close[1]> Open[1])
  signal="buy";
  
  if (Close[1]<Open[1])
  signal="sell";
  
  return signal;
  
  }

