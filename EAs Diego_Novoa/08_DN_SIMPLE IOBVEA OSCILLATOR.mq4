

void OnTick()
  {

  string signal="";
  
  double IOBVArray[100];
  for(int i=99;i>=0;i--)
  
  {
  
    double CounterIOBVValue= iOBV(_Symbol,_Period,PRICE_CLOSE,i);
    IOBVArray[i]= CounterIOBVValue;
  
  }

    double IOBVValue= iOBV(_Symbol,_Period,PRICE_CLOSE,0);
    
    int maxIOBVCandle=ArrayMaximum(IOBVArray,WHOLE_ARRAY,0);
    int minIOBVCandle=ArrayMinimum(IOBVArray,WHOLE_ARRAY,0);
    int maxIOBVValue=IOBVArray[maxIOBVCandle];
    int minIOBVValue=IOBVArray[minIOBVCandle];
    
    if(IOBVValue>=maxIOBVValue)
    signal="buy";
    if(IOBVValue<=minIOBVValue)
    signal="sell";
    
    if(signal=="buy" && OrdersTotal()==0)
    OrderSend(_Symbol,OP_BUY,0.10,Ask-50*_Point,Ask+50*_Point,NULL,Green);
    
    if(signal=="sell" && OrdersTotal()==0)
    OrderSend(_Symbol,OP_SELL,0.10,Ask+50*_Point,Ask-50*_Point,NULL,Red);
    
    Comment ("Current IOBV Value: ", IOBVValue,"\n",
             "max IOBV Value: ", maxIOBVValue,"\n",
             "min IOBV Value: ",minIOBVValue,"\n",
             "SIGNAL: ",signal,"\n"
    
            );

   
  }