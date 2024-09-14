
void OnTick()
  {

   double TekanSenValue=iIchimoku(_Symbol,_Period,9,26,52,MODE_TENKANSEN,0);
   double KinjunSenValue=iIchimoku(_Symbol,_Period,9,26,52,MODE_KIJUNSEN,0);
   double SenkouSpanValue= iIchimoku(_Symbol,_Period,9,26,52,MODE_SENKOUSPANA,-26);
   double SenkouSpabValue= iIchimoku(_Symbol,_Period,9,26,52,MODE_SENKOUSPANB,-26);
   double ChinkouSpabValue= iIchimoku(_Symbol,_Period,9,26,52,MODE_CHIKOUSPAN,26);
   
   
   Comment ("TekanSen Value: " ,TekanSenValue,"\n",
            "KinjunSen Value:" ,KinjunSenValue,"\n",
            "SenkouSpan Value:" ,SenkouSpanValue,"\n",
            "SenkouSpab Value:" ,SenkouSpabValue,"\n",
            "ChinkouSpab Value:" ,ChinkouSpabValue,"\n"
            );
   
  }

