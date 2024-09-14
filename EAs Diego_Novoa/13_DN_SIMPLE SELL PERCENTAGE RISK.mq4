
input double PercentageRiskValue=0.5;
double MaxPositionLoss;
 
void OnTick()
  {
   
   if(OrdersTotal()<1)
   int sellTick= OrderSend(_Symbol,OP_SELL,0.10,Bid,3,0,Bid-20*_Point,NULL,0,0,Green);
   for(int i=OrdersTotal(); i>=0; i--)
   
   {
   
   if(OrderSelect(i,SELECT_BY_POS)==true)
   
   {
   double PositionProfit= OrderProfit();
   MaxPositionLoss=0-(AccountBalance()/100*PercentageRiskValue);
   
   printf ("##Position Profit: ",PositionProfit);
   printf ("##MaxPosition Loss: ",MaxPositionLoss);
   
   if (PositionProfit < MaxPositionLoss)
   
   {
   OrderClose(OrderTicket(),OrderLots(),MarketInfo(OrderSymbol(),MODE_ASK),5,Red);
   
   }
   
   }// End Select
   
   }//End For Loop
   
   Comment(
           "Balance:",AccountBalance(),"\n",
           "MaxPositionmLoss:",MaxPositionLoss,"\n",
           "Percentage Risk Value :",PercentageRiskValue,"Percent"
   
          );
   
      
  }


