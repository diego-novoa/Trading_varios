


void OnTick()
  {

   int HighestCandle=iHighest(_Symbol,_Period,MODE_HIGH,30,0);
   int lowestCandle=iLowest(_Symbol,_Period,MODE_LOW,30,0);
   
   ObjectDelete("Triangle");
   ObjectCreate("Triangle",
                 OBJ_TRIANGLE,0,
                 Time[30],
                 Close[30],
                 Time[lowestCandle],
                 Low[lowestCandle],
                 Time[HighestCandle],
                 High[HighestCandle]
                 );
  }

