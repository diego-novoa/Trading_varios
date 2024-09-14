

void OnTick()
  {
   static double LastStopEvenlopesValue;
   
   if (OrdersTotal()==0)
   
   {
     OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid,+150*_Point,NULL,0,0,Green);
     LastStopEvenlopesValue=0;
   
   }
   
    double LowerBand=iEnvelopes(_Symbol,_Period,14,MODE_SMA,0,PRICE_CLOSE,0.10,2,1);
    double UpperBand=iEnvelopes(_Symbol,_Period,14,MODE_SMA,0,PRICE_CLOSE,0.10,1,1);
    
    CheckEnvelopesBuyTrailingStop(UpperBand);
    
    LastStopEvenlopesValue=UpperBand;
   
  }

    void CheckEnvelopesBuyTrailingStop(double UpperBand)
    {
     for (int b= OrdersTotal()-1;b>=0;b--)
     {
       if (OrderSelect(b,SELECT_BY_POS,MODE_TRADES))
       
         if (OrderSymbol()== Symbol())
         if (OrderType()== OP_SELL)
         {
         
         if (OrderStopLoss()>UpperBand)
         
         OrderModify( OrderTicket(),
               OrderOpenPrice(),
               UpperBand,
               OrderTakeProfit(),
               0,
               CLR_NONE          
              
             );
         
         }
     
     }
    
    }