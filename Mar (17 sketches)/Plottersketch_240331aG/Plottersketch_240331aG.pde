//import svg library
import processing.svg.*;
//code runs at start
void setup() {
  //set size to 680,880
  size( 880, 680);
  //set stroke to black
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
  background(255);
  //for loop twice once yellow once black and shifted to make it look
  //like the plotter art version
  for (int j = 0; j<2; j++) {
    if(j==0){
    stroke(250, 240, 50);
    }else{
    translate(-10, 0);
    stroke(0);
    }

    pushMatrix();
    pushMatrix();
    translate(192, -149);
    for (int i = 0; i<120; i+=15) {
      //randomly offset with bouncy middle thing
      quad(400+i*2.12f, 200+i*2.12f, 200+i*2.12f, 200+i*2.12f, 200+i*1.72f, 400+i*2.12f, 400+i*1.62f, 400+i*2.32f);
      //   quad(400+10+i*1.822,200+13+i*1.822,200+10.23+i*1.822,200+12.012+i*1.822,200+10.23+i,400,400+9.13+i,400+i*1.822);
      //stroke(255,0,0);
      if (i%3==0) {
        line(200+10.23f+i, 400, 400+9.13f+i, 400+i*1.822f);
      }
      line(400+9.13f+i, 400+i*1.822f, 400+10+i*1.822f, 200+13+i*1.822f);
    }
    popMatrix();
    //rotate slightly and make it move up and down translate sine wave frameCount
    rotate(-0.2f);
    translate(-67, -44);
    for (int i = -20; i<120; i+=14) {
      quad(400, 200+i*2.12f, 200+i*2.12f, 200+i*2.12f, 200+i*1.72f, 400+i*2.12f, 400+i*1.62f, 400+i*2.32f);
      rotate(-.04f);
      translate(-10, 0);
      quad(400+10+i*1.822f, 200+13+i*1.822f, 200+10.23f+i*1.822f, 200+12.012f+i*1.822f, 200+10.23f+i, 400+i*-1.000002f, 400+9.13f+i*2, 400+i*1.822f);
    }

    //draw strange arcs
    rotate(0.81f);
    translate(-133, 142);
    for (int i = 0; i<4; i++) {
      arc(540, 400+i*30, 40, 100, PI, TAU);
      arc(580, 400+i*30, 40, 100, PI, TAU);
      line(613, 430+i*30, 620, 350+i*30);
      arc(620, 364+i*30, 40, 34, PI*-0.50f, PI*0.50f);
      rotate(-0.18f);
    }
    popMatrix();
  }

  //end recording for svg
  //endRecord();
}
