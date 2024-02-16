PFont font;
//code runs at start
void setup(){
  size(500,800);
  font = loadFont("ZapfDingbatsITC-48.vlw");
}
//code runs every frame
void draw(){
  //set background to black
  background(0);
   door(0,0);
   translate(100,100);
   stroke(255);
   noFill();
   rect(250,500,43,50,10,10,0,0);
   rect(254,506,11,21,3,3,3,3);
   rect(277,506,11,21,3,3,3,3);
   line(271,500,271,550);


/*
  fill(255);
  stroke(245);
  line(250,0,250,900);
  for (int i = 0; i <20*39;i+= 53){
    float a = -209;
  rect(335+ a,753-i,17,39);
 
  }
 for (int i = 0; i <20*39;i+= 53){
    float a = 40;
  rect(335+ a,753-i,17,39);
  }*/
}
void door(float x,float y,float size){
  stroke(255);
   noFill();
   rect(x+250,y+500,43,50,10,10,0,0);
   rect(x+256-9,y+506,11,21,19,19,20,18);
   rect(x+275+9,y+506,11,21,19,31,48,16);
   line(x+271-9,y+500,x+271-9,y+550);
   line(x+271+9,y+500,x+271+9,y+550);
   fill(0);
   noStroke();
   rect(x+294,y+500,43,50);
   rect(x+207,y+500,43,50);
}
