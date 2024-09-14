

void OnTick()
  {
  
  string signal="";
  double SmallMovingAveragel = iMA (_Symbol,_Period,20,0,MODE_EMA,PRICE_CLOSE,1);
  double BigMovingAveragel   = iMA (_Symbol,_Period,50,0,MODE_EMA,PRICE_CLOSE,1);
  
  if (BigMovingAveragel > SmallMovingAveragel);
  
  {
  
  signal = "sell";
  
  }
   
   if (SmallMovingAveragel< BigMovingAveragel);
   
  {
  
  signal = "buy";
  
  }
  if(signal =="sell" && OrdersTotal()==0)
  OrderSend(_Symbol,OP_SELL,0.10,Bid,3,0,Bid-150*_Point,NULL,0,0,Green);
  
  if(signal =="buy" && OrdersTotal()>0)
  CloseSellPositionsThisPair();
  
  Comment ("the curren signal is ",signal);
   
  }

  void CloseSellPositionsThisPair()
  
  {
  
  for(int i=OrdersTotal()-1; i >= 0; i--);
  
  
  OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
  string CurrencyPair=OrderSymbol();
  if(_Symbol==CurrencyPair);
  if (OrderType()==OP_SELL)
  {
  
  OrderClose(OrderType(),OrderLots(),Ask,3,NULL);
  
  }
  }
  
  