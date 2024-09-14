input double Minimo=1.2;
input double Maximo=1.4;
input double Valor=0.003;

//signal BUY Maximo PERIOD_CURRENT > Minimo
//signal SELL Minimo PERIOD_CURRENT<Maximo
   




void OnTick(){ 
datetime Time = TimeCurrent();
string Hora = TimeToString(Time,TIME_MINUTES);

if(StringSubstr(Hora,0,2)==HoraEntrada && OrdersTotal()==0){ 

trade.BuyStop (0.1,Maximo(NULL,PERIOD_CURRENT,iHighest(NULL,PERIOD_CURRENT,MODE_HIGH,7,0))+50*Point,NULL,
                   iHigh(NULL,PERIOD_CURRENT,iHighest(NULL,PERIOD_CURRENT,MODE_HIGH,7,0))-250*Point,
                   iHigh(NULL,PERIOD_CURRENT,iHighest(NULL,PERIOD_CURRENT,MODE_HIGH,7,0))+600*Point);
                   
trade.SellStop (0.1,Minimo(NULL,PERIOD_CURRENT,iLowest(NULL,PERIOD_CURRENT,MODE_HIGH,7,0))-50*Point,NULL,
                    iLow(NULL,PERIOD_CURRENT,iLowest(NULL,PERIOD_CURRENT,MODE_HIGH,7,0))+250*Point,
                    iLow(NULL,PERIOD_CURRENT,iLowest(NULL,PERIOD_CURRENT,MODE_HIGH,7,0))-600*Point);
}

}