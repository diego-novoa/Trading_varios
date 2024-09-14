


void OnTick()
  {

  static double LastStopEnvelopesValue;
  if (OrdersTotal()==0)
  {
    OrderSend(_Symbol,OP_BUY,0,10,Ask,3,Ask-150*_Point,NULL,0,0,Green);
    LastStopEnvelopesValue=0;
  }
    
    double LowerBand=iEnvelopes(_Symbol,_Period,14,MODE_SMA,0,PRICE_CLOSE,0.05,2,1);
    double UpperBand=iEnvelopes(_Symbol,_Period,14,MODE_SMA,0,PRICE_CLOSE,0.05,1,1);
    
    if(LastStopEnvelopesValue<LowerBand)
    
    {
     
     CheckEnvelopesBuyTrailingStop(LowerBand);
     LastStopEnvelopesValue=LowerBand;
    
    }
  
  }
   
   void CheckEnvelopesBuyTrailingStop(double LowerBand)
   
  {
  
  for (int b=OrdersTotal()-1;b>=0;b--)
  {
  if (OrderSelect(b,SELECT_BY_POS,MODE_TRADES))
  
  if (OrderSymbol()==Symbol())
  
  if (OrderType()==OP_BUY)
  {
  
  if (OrderStopLoss() <LowerBand)
  
  OrderModify( OrderTicket(),
               OrderOpenPrice(),
               LowerBand,
               OrderTakeProfit(),
               0,
               CLR_NONE          
              
             );
 
        }
     
     
    }
  
  }
  