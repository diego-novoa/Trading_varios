string signal=" ";


void OnTick()
  {

  static double NextBuyPrice;
  if (OrdersTotal()==0)
  NextBuyPrice=0;
  signal=CheckEntrysignal();
  
  if(Ask>=NextBuyPrice)
  if(signal=="buy")
  {
  
  OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-150*_Point,Ask+150*_Point,NULL,0,0,Green);
  NextBuyPrice=Ask+30 *_Point;
  }
  
  Comment("Ask", Ask,"\n","NextBuyPrice:",NextBuyPrice);
  
  }
  
   string CheckEntrysignal()
  {
   if(Close[1]>Open[1])
   signal="buy";
   
   if(Close[1]<Open[1])
   signal="sel";
   
   return signal;
  }
