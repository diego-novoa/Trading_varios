
int BasicStopPointValue=100;
int CalculatedStopPointValue;

void OnTick()
  {

   string signal="";
   double AverageTrueRangeValue=iATR(_Symbol,_Period,14,0);
   static double OldValue;
   
   if (AverageTrueRangeValue<OldValue||OldValue==0)
   
   {
   
   signal="Sell";
   
   }
    
   if(signal=="Sell" && OrdersTotal()==0)
   OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+250*_Point,Bid-250*_Point,NULL,0,0,Green);
   CalculatedStopPointValue= CheckATRSellTrailingStop(AverageTrueRangeValue);
   
   Comment ("The signal is:",signal,"\n",
            "AverageTrueRangeValue :",AverageTrueRangeValue,"\n",
            "CalculatedStopPointValue :",CalculatedStopPointValue,"\n"
           );
   OldValue=AverageTrueRangeValue;
  }

  int CheckATRSellTrailingStop(double AverageTrueRangeValue)
  
  {
   
   CalculatedStopPointValue= BasicStopPointValue+(AverageTrueRangeValue*100000);
   double CalculatedStopLossPrice=Bid+CalculatedStopPointValue*_Point;
   for(int b=OrdersTotal()-1;b>=0;b--)
    {
    
    if(OrderSelect(b,SELECT_BY_POS,MODE_TRADES))
    
     if(OrderSymbol()==Symbol())
      if(OrderType()==OP_SELL)
      {
      
       if(OrderStopLoss()>CalculatedStopLossPrice)
       
       OrderModify( OrderType(),
                    OrderOpenPrice(),
                    CalculatedStopLossPrice,
                    OrderTakeProfit(),
                    0,
                    CLR_NONE
       
                   );
      
      }
    return CalculatedStopPointValue;
    }
  
  }
