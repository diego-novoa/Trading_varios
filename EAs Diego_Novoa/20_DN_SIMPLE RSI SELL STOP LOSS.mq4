


void OnTick()
  {
   string Signal =" ";
   
   double RSIValue= iRSI(_Symbol,_Period,14,PRICE_CLOSE,0);
   
   if(OrdersTotal()==0)
   
   if(RSIValue>70)
   {
   
    OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+150*_Point,0,NULL,0,0,Green);
   
   }
   
   CheckRSISellStop(RSIValue);
   Comment("RSIValue :",RSIValue); 
   
  }
  void CheckRSISellStop(double RSIValue)
  
   {
  
    for(int i=OrdersTotal(); i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS) == true)
      if(OrderSymbol()==_Symbol)
      if(OrderType ()== OP_SELL)
      if(RSIValue<30)
      
      {
      
      OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),5,Red);
      
      }
     
     }
    
    
   }
  