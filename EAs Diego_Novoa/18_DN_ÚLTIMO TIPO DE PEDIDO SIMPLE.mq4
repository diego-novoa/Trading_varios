

void OnTick()
  {

  if (OrdersTotal()==0)
  {
  
  OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-50*_Point,Ask+50*_Point,NULL,0,0,Green);
  OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+50*_Point,Bid-50*_Point,NULL,0,0,Red);
  
  }
   Comment("my last position was:",GetLasOrderType());
   
   
  }

   string GetLasOrderType()
  {
   
   int counter=0;   
   double LastProfit=0;
   string LasOrderType="";
   string myResult="";
 
   for(int i=OrdersTotal()-1; i>=0; i--)
   {
   
    OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
    if (OrderSymbol()== _Symbol)
    if (i==OrdersHistoryTotal()-1)
    {
     LastProfit=(OrderProfit()+OrderSwap()+OrderCommission());
     
     if(OrderType()==OP_BUY)LasOrderType="BUY_order";
     if(OrderType()==OP_SELL)LasOrderType="SELL_order";
    
    
    }
     myResult=LasOrderType + "Profit:"+LastProfit;
   }
   
     return(myResult);
  }