void setup(){
  size(1000,1000);
}

void draw(){
 background(240); 
 float linex = 35;
 float linex2 = 64;
 float liney = 87;
 float liney2 = 27; 
 
 strokeWeight(3);
  
 for (int j = 1; j<13; j++){
  float temp = 0;
  float temp2 = 0;
   temp += linex;
   temp2 += linex2;
  
 for (int i = 0; i< 22; i++){
   if(!(j%2 > 0) ){
    line(temp + (i*43),liney + (j*75),temp2 + (i*49),liney2 + (j*75));
    temp -= (i*0.0);
    temp2 += (i*-0.5);
 
    print("x:" + temp + " " + "x2:" + temp2 + " " );

   }else{     
    line(linex + (i*43),liney + (j*75),linex2 + (i*43),liney2 + (j*75));
    //linex -= (i*0.0);
    //linex2 -= (i*-0.5);
    
   }
 }
 //noLoop();
  /*for (int i = 0; i< 22; i++){
    line(linex + (i*43),liney + (j*75),linex2 + (i*43),liney2 + (j*75));
    //linex -= (i*0.0);
    //linex2 -= (i*-0.5);
    
 }*/

 }
 
}
