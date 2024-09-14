
void OnTick()
  {

   string signal="";
   double UpperFractalsValue=iFractals(_Symbol,_Period,MODE_UPPER,2);
   double LowerFractalsValue=iFractals(_Symbol,_Period,MODE_LOWER,2);


   if(!LowerFractalsValue<=0)
      if(LowerFractalsValue<Low[1])

        {

         signal="buy";

        }

   if(!UpperFractalsValue>=0)
      if(UpperFractalsValue>High[1])

        {

         signal="sell";

        }
   if(signal=="buy" && OrdersTotal()==0)

   OrderSend(_Symbol,OP_BUY,0.10,Ask,3,0,Ask+150*_Point,NULL,0,0,Green);

   if(signal=="sell" && OrdersTotal()==0)

   OrderSend(_Symbol,OP_SELL,0.10,Bid,3,0,Bid-150*_Point,NULL,0,0,Red);

   Comment("Upper Fractals Value: ",UpperFractalsValue,"\n",
           "LowerFractalsValue: " ,LowerFractalsValue,"\n",
           "The Current Signal is:",signal

          );

  }


