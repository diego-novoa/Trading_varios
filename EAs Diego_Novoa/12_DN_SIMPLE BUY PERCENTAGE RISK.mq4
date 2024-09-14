
input double PercentageRiskValue=0.5;
double MaxPositionLoss;


void OnTick()
  {
   
   if (OrdersTotal()<1)
   
   int buytikect = OrderSend(Symbol(),OP_BUY,0.10,Ask,3,0,Ask+10*_Point,NULL,0,0,Green);
   for(int i=OrdersTotal(); i>=0;i--)
   {
   
   if(OrderSelect(i,SELECT_BY_POS)==true)
   
   {
   double PositionProfit=OrderProfit();
   MaxPositionLoss=0-(AccountBalance()/100*PercentageRiskValue);
   
   printf ("##Position Profit: ",PositionProfit);
   printf ("##MaxPosition Loss: ",MaxPositionLoss);
   
   if (PositionProfit < MaxPositionLoss)
   {
   
   OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_BID),5,Red);
   
   }
   
   }// End Select
   
   }//End For Loop
   
   Comment(
           "Balance:",AccountBalance(),"\n",
           "MaxPositionmLoss:",MaxPositionLoss,"\n",
           "Percentage Risk Value :",PercentageRiskValue,"Percent"
   
          );
   
      
  }

