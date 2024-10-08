

#include "CheckEntry_EMACrossover.mq4"
#include "CheckEntry_MacD.mq4"


void OnTick()
  {
   
   string Tradingsignal=CheckEntryEMA();
   string Filter=CheckEntryMacD();
   
   if ((Tradingsignal=="buy") && (Filter=="buy") && (OrdersTotal()==0))
   {
    OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-1500*_Point,NULL,0,0,Green);
   }
   
   if ((Tradingsignal=="sell") && (Filter=="sell") && (OrdersTotal()==0))
   {
    OrderSend(_Symbol,OP_SELL,0.10,Bid,3,Bid+1500*_Point,NULL,0,0,Red);
   }
   Comment("## Trading signal EMA",Tradingsignal,"\n","Filter MACD:",Filter);
  }


