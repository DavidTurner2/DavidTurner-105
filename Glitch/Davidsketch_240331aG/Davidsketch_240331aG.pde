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
  strokeWeight(3);
}
//code runs at start
void draw() {
  //background white
  background(255);
  // draw circles in a tangent wave at varying sizes to look deformed
  for (float i = 0; i<500; i+=0.09) {
    circle(0+i, 400+40*tan(i/4), 5*map(sin(i), -1, 1, 1, 2));
  }
  //draw strange shapes that has a very signifcant meaning to me
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
