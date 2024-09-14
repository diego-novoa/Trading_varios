input double Minimo=1.2;
input double Maximo=1.4;
input double Valor=0.003;

input color Color_Linea=clrBlue;
input int Ancho_linea=2;


void OnStart()
  {
  if (Minimo > Maximo) Alert("aler Min Max erroneo!");
  for (double a= Minimo; a <= Maximo; a = a + Valor)
  
  {
  DibujarLinea(rand(),a); 
  }
   ExpertRemove();
  }
void DibujarLinea(string Linea, double posicion)

  {
  
  ObjectCreate(Symbol(),Linea,OBJ_HLINE,0,0,posicion);
  ObjectSetInteger(0,Linea,OBJPROP_COLOR,Color_Linea);
  ObjectSetInteger(0,Linea,OBJPROP_WIDTH,Ancho_linea);
  
  }
