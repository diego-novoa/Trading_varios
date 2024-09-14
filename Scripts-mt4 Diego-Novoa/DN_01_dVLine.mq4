void OnStart()
{

   dVLine("V_Line",3,1,clrRed,0);
   
}

void dVLine(string obj_name,int shf, int line_width, color CLR, int line_style){

   ObjectDelete(ChartID(),obj_name);
   ObjectCreate(ChartID(), obj_name, OBJ_VLINE,0,iTime(NULL,0,shf),0);
   ObjectSetInteger(ChartID(),obj_name, OBJPROP_WIDTH,line_width);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_COLOR,CLR);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_STYLE,line_style);

}
