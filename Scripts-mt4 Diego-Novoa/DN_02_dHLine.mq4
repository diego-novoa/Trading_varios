void OnStart()
{

   dHLine("H_Line",Close[1],clrBlue,2,0);
   
}

void dHLine(string obj_name, double prc, color CLR, int line_width, int line_style){

   ObjectDelete(ChartID(),obj_name);
   ObjectCreate(ChartID(),obj_name,OBJ_HLINE,0,0,prc);
   ObjectSetInteger(ChartID(),obj_name, OBJPROP_WIDTH,line_width);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_COLOR,CLR);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_STYLE,line_width);
}
