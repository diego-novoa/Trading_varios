
int BasicStopPoinValue=100;
int CalculatedStopPointValue;
                                                                 
void OnTick()
  {

   string Signal="";
   double AverageTrueRangeValue=iATR(_Symbol,_Period,14,0);
   static double OldValue;

   if(AverageTrueRangeValue > OldValue)
     {

      Signal = "buy";

     }

   if(Signal=="buy" && OrdersTotal()==0)

   OrderSend(_Symbol,OP_BUY,0.10,Ask,3,0,Ask+250*_Point,NULL,0,0,Green);
   CalculatedStopPointValue = CheckATRBuyTrailingStop(AverageTrueRangeValue);

   Comment (
      "The Signal is :",Signal,"\n",
      "AverageTrueRangeValue :",AverageTrueRangeValue,"\n",
      "CalculatedStopPointValue :",CalculatedStopPointValue,"\n"


           );

    OldValue=AverageTrueRangeValue;

  }

   int CheckATRBuyTrailingStop(double AverageTrueRangeValue)
   
   {
    
    CalculatedStopPointValue = BasicStopPoinValue +(AverageTrueRangeValue*100000);
    double CalculatedStopLossPrice = Ask-CalculatedStopPointValue*_Point;
    
    for(int b=OrdersTotal()-1; b>=0; b--)
    {
    
      if(OrderSelect(b,SELECT_BY_POS,MODE_TRADES))
      if(OrderSymbol()== Symbol())
      if(OrderType()== OP_BUY)
      if (OrderStopLoss() < CalculatedStopLossPrice)
      
      OrderModify (
                   OrderTicket(),
                   OrderOpenPrice(),
                   CalculatedStopLossPrice,
                   OrderProfit(),
                   0,
                   CLR_NONE     
                   ); 
      
    }
   
   return CalculatedStopPointValue;
   
  }
