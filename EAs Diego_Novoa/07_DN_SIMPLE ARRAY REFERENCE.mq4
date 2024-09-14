

void OnTick()
  {
   int myArray[10];
   myArray[0]=8;
   myArray[1]=16;
   myArray[2]=32;
   myArray[3]=64;
   
   int returnedResult=AddValues(myArray);

   Comment ("The returned Result is:",returnedResult);

   
  }

  int AddValues(int& myArray[])
  
 {
  
  int result= myArray[0]+ myArray[1]+ myArray[2] + myArray[3];
  
  return (result);
  
 }