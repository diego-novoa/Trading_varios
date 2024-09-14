


void OnTick()
  {
   if(OrdersTotal()<5)
   int buyticket= OrderSend(_Symbol,OP_BUY,0.10,Ask,3,0,Ask+10*_Point,NULL,0,0,Green);
   if(AccountEquity()>AccountBalance())
   CloseAllTradersthisPar();
   
  }

   double CloseAllTradersthisPar()
   {
    for(int i=OrdersTotal(); i>=0; i--)
    {
     if(OrderSelect(i,SELECT_BY_POS)==true)
     if(OrderSymbol()==Symbol())
     {
      OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,Red);
     
     }
    
    }
     
   } 
