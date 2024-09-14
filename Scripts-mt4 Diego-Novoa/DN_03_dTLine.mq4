void OnStart()
 {

   dTLine("T_Line",0, Time[0], High[0],Time[10],High[10],2,0, clrWhite,false);

 }

void dTLine(string obj_name, int window, datetime time_0, double price_0,
             datetime time_1, double price_1,int line_width, int line_style, color CLR, bool ray_right){

   ObjectDelete(ChartID(),obj_name);
   ObjectCreate (ChartID(),obj_name,OBJ_TREND,window,time_0,price_0,time_1,price_1);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_COLOR,CLR);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_WIDTH,line_width);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_STYLE,line_style);
   ObjectSetInteger(ChartID(),obj_name,OBJPROP_RAY_RIGHT, ray_right);

 }