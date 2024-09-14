


void OnTick()
  {
    string Signal="";
    
    double MyMovingAverage= iMA(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE,0);
    if(MyMovingAverage<Close[0])
    {
     Signal="Buy";
    }
    if(MyMovingAverage>Close[0])
    {
     Signal="Sell";
    }
    if(Signal=="Buy" && OrdersTotal()==0)
    OrderSend(_Symbol,OP_BUY,0.10,Ask,3,0,Ask+150*_Point,NULL,0,0,Green);
    
    if(Signal=="Sell" && OrdersTotal()==0)
    OrderSend(_Symbol,OP_SELL,0.10,Bid,3,0,Bid-150*_Point,NULL,0,0,Red);
    
    Comment ("Current Time Signal is:",Signal);
  }



