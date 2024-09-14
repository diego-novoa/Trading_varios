



void OnTick()
  {

   double RSIValue = iRSI(_Symbol,_Period,14,PRICE_CLOSE,0);
   
   if(OrdersTotal()==0)
   if(RSIValue<30)
   {
    
    OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-150*_Point,NULL,0,0,Green);
    
   }
   CheckRSIBuyStop(RSIValue);
   
   Comment("RSIValue:",RSIValue);
   
   }

   void CheckRSIBuyStop(double RSIValue)
   
   {
    for(int i=OrdersTotal(); i>=0; i--)
     
     {
    
      if (OrderSelect(i,SELECT_BY_POS)== true)
      if (OrderSymbol()== _Symbol)
      if (OrderType()== OP_BUY)
      if (RSIValue>70)
      {
      
       OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,Red);
      
      }
   
     }
   }