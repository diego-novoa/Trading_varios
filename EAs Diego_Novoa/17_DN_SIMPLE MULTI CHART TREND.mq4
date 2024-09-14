

void OnTick()
  {
   
   string ChartSignal="",EURUSDSignal="";
   double EMA20 = iMA(_Symbol,_Period,20,0,MODE_EMA,PRICE_CLOSE,0);
   double oldEMA20 = iMA(_Symbol,_Period,20,0,MODE_EMA,PRICE_CLOSE,2);
   double EMAEURUSD20 = iMA("EURUSD",_Period,20,0,MODE_EMA,PRICE_CLOSE,0);
   double oldEMAEURUSD20 = iMA(_Symbol,_Period,20,0,MODE_EMA,PRICE_CLOSE,2);
   
   if(EMA20 > oldEMA20) ChartSignal="buy";
   if(EMA20 < oldEMA20) ChartSignal="sell";
   
   if(EMAEURUSD20 > oldEMAEURUSD20) EURUSDSignal= "buy";
   if(EMAEURUSD20 < oldEMAEURUSD20) EURUSDSignal= "sell";
   
   Comment (
   
            "EMA 20",_Symbol,":",EMA20,"\n",
            "EMA 20 EURUSD :",EMAEURUSD20,"\n",
            "TREND",_Symbol,":",ChartSignal,"\n",
            "TREND EURUSD :",EURUSDSignal,"\n"
   
           );
   
  }

