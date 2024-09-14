


void OnTick()
  {

   string signal="";
   double DeviationArray[200];
   
   for(int i=199; i>=0; i--)
   
   {
   
   double DeviationValue = iStdDev(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE,i);
   
   DeviationArray[i]= DeviationValue;
   
   }
   
   double CurrentValue= iStdDev(_Symbol,_Period,20,0,MODE_SMA,PRICE_CLOSE,0);
   int HighestCandle= ArrayMaximum(DeviationArray,WHOLE_ARRAY,0);
   int LowestCandle= ArrayMinimum(DeviationArray,WHOLE_ARRAY,0); 
   
   if(LowestCandle==0)
   signal="buy";
   
   if(HighestCandle==0)
   signal="sell";
   
   if(signal=="sell" && OrdersTotal()==0)
   OrderSend(_Symbol,OP_BUY,0.10,Ask,3,Ask-50*_Point,Ask+50*_Point,NULL,0,0,Green);
    
   if(signal=="buy" && OrdersTotal()==0)
   OrderSend(_Symbol,OP_BUY,0.10,Bid,3,Bid-50*_Point,Bid+50*_Point,NULL,0,0,Red);
   
   Comment ("Current Value: ",CurrentValue,"\n",
            "Highest Candle: ",HighestCandle,"\n",
            "Lowest Candle: ",LowestCandle,"\n",
            "signal: ",signal
   
   
   
   
           );
    
   }

