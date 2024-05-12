//import svg library
import processing.svg.*;
//code runs at start
void setup() {
  //set size to 680,880
  size( 880, 680);
  //set stroke to black
  stroke(0, 0, 200);
  //turn off smooth;
  noSmooth();
  //begin recording
 // beginRecord(SVG, this+".svg");
  //turn off fill
  noFill();
  strokeWeight(4);
  //set stroke weight to 3
  //strokeWeight(1);
}
//code runs at start
void draw() {
  //background white
  //background(255);


  //rotate slightly and make it move up and down translate sine wave frameCount
  rotate(0.1);
  translate(130, 5);
  for (int i = -9; i<120; i+=14) {
    //quad(400, 200+i*2.12, 200+i*2.12, 200+i*2.12, 200+i*1.72, 400+i*2.12, 400+i*1.62, 400+i*2.32);
    rotate(-0.014);
    translate(-10, 0);
    quad(400+10+i*1.822, 200+13+i*1.822, 200+10.23+i*1.822, 200+12.012+i*1.822, 200+10.23+i, 400+i*-1.000002, 400+9.13+i*2, 400+i*1.822);
  }
  pushMatrix();
  translate(131, -151);
  for (int i = 0; i<120; i+=15) {
    //randomly offset with bouncy middle thing
   //quad(400+i*2.12, 200+i*2.12, 200+i*2.12, 200+i*2.12, 200+i*1.72, 400+i*2.12, 400+i*1.62, 400+i*2.32);
      quad(400+10+i*1.822,200+13+i*1.822,200+10.23+i*1.822,200+12.012+i*1.822,200+10.23+i,400,400+9.13+i,400+i*1.822);
    //stroke(255,0,0);
    if (i%3==0) {
      line(200+10.23+i, 400, 400+9.13+i, 400+i*1.822);
    }
    line(400+9.13+i, 400+i*1.822, 400+10+i*1.822, 200+13+i*1.822);
  }
  popMatrix();

  //draw strange arcs
  rotate(0.19);
  translate(-460, -57);
  for (int i = 0; i<4; i++) {
    arc(540, 400+i*30, 40, 100, PI, TAU);
    arc(580, 400+i*30, 40, 100, PI, TAU);
    line(613, 430+i*30, 620, 350+i*30);
    arc(620, 364+i*30, 40, 34, PI*-0.50, PI*0.50);
    rotate(-0.18);
  }
  //end recording for svg
   //endRecord();
}
