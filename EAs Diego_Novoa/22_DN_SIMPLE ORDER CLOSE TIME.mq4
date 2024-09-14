

void OnTick()
  {
   
   if(OrdersTotal()==0)
     {
      OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-100*_Point,(Ask+100*_Point),NULL,0,0,Green);
      OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+100*_Point,(Bid-100*_Point),NULL,0,0,Red);
     } 
   ChekCloseTime();
   
  }
void ChekCloseTime()
  {
  
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
     
      OrderSelect(i,SELECT_BY_POS,MODE_HISTORY);
      datetime myTime= TimeLocal();
      MqlDateTime MyTimeStruct;
      TimeToStruct (myTime,MyTimeStruct);
      int CurrentHour=MyTimeStruct.hour;
   
      string TimeWithSeconds=TimeToStr(TimeLocal(),TIME_DATE|TIME_SECONDS);
      
      datetime OpeningTime= OrderOpenTime();
      datetime CloseingTime= OrderCloseTime();
      
      MqlDateTime MyOpenTimeStruct;
      MqlDateTime MyCloseTimeStruct;
      
      TimeToStruct (OrderOpenTime(),MyOpenTimeStruct);
      TimeToStruct (OrderCloseTime(),MyCloseTimeStruct);
      
      string OpeningTimeWithSeconds = TimeToStr(OrderOpenTime(),TIME_DATE|TIME_SECONDS);
      string CloseingTimeWithSeconds = TimeToStr(OrderCloseTime(),TIME_DATE|TIME_SECONDS);
      
      printf ("### Order Ticket :",OrderTicket()); 
      printf ("### Order OpenTime:",OpeningTimeWithSeconds);
      printf ("### Order CloseTime:",CloseingTimeWithSeconds);
      printf ("### Order Profit:",OrderProfit());
      printf ("### Local Time:",TimeWithSeconds);
      
      
     }
  }
