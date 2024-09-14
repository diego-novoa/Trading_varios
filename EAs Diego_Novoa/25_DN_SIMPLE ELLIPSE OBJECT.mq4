
                                                

void OnTick()
  {
   
   int HighestCandle=iHighest(_Symbol,_Period,MODE_HIGH,30,0);
   int LowestCandle=iLowest(_Symbol,_Period,MODE_LOW,30,0);
   
   ObjectDelete("Ellipse");
   ObjectCreate(0,"Ellipse",OBJ_ELLIPSE,0,Time[LowestCandle],Low[LowestCandle],Time[HighestCandle],High[HighestCandle]);
   ObjectSetInteger(0,"Ellipse",OBJPROP_COLOR,clrBlue);
   ObjectSetInteger(0,"Ellipse",OBJPROP_FILL,clrBlue);
   
  }

