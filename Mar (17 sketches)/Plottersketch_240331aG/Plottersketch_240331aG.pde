//import svg library
import processing.svg.*;
//code runs at start
void setup() {
  //set size to 680,880
  size(680, 880);
  //set stroke to black
  stroke(0);
  //turn off smooth;
  noSmooth();
  //begin recording
  beginRecord(SVG, this+".svg");
  //turn off fill
  noFill();
  //set stroke weight to 3
  //strokeWeight(1);
}
//code runs at start
void draw() {
  //background white
  background(255);
  
   pushMatrix();
  translate(-140,-40);
  for(int i = 0; i<120; i+=7){
    //randomly offset with bouncy middle thing
  quad(400+i*2.12,200+i*2.12,200+i*2.12,200+i*2.12,200+i*1.72,400+i*2.12,400+i*1.62,400+i*2.32);
   quad(400+10+i*1.822,200+13+i*1.822,200+10.23+i*1.822,200+12.012+i*1.822,200+10.23+i,400,400+9.13+i,400+i*1.822);
  }
  popMatrix();
  //rotate slightly and make it move up and down translate sine wave frameCount
  rotate(-0.2);
  translate(-90,-48);
    for(int i = 0; i<120; i+=8){
  quad(400+i*2.12,200+i*2.12,200+i*2.12,200+i*2.12,200+i*1.72,400+i*2.12,400+i*1.62,400+i*2.32);
   quad(400+10+i*1.822,200+13+i*1.822,200+10.23+i*1.822,200+12.012+i*1.822,200+10.23+i,400,400+9.13+i,400+i*1.822);
  }
  
  //draw strange shapes that has a very signifcant meaning to me
  rotate(0.81);
  translate(359,-181);
  for (int i = 0; i<5; i++) {
    arc(540, 400+i*30, 40, 100, PI, TAU);
    arc(580, 400+i*30, 40, 100, PI, TAU);
    line(613, 430+i*30, 620, 350+i*30);
    arc(620, 364+i*30, 40, 34, PI*-0.50, PI*0.50);
    rotate(0.09);
  }
  //end recording for svg
  endRecord();
}
