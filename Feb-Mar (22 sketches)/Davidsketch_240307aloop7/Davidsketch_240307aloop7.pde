//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
}
//variable for animating
float step = 0;
//code runs everyframe
void draw() {
  //incrment step by 0.07
  step +=0.07;
  //set background to dark red
  background(100, 31, 2);
  //set scale to be multiplied by sine usig step to slightly zoom in and out
  scale(0.5+0.125*sin(step));
  //tanslate to thes position using mapping
  translate(map(sin(step), -1, 1, 0, -1600), map(sin(step), -1, 1, 0, -100));
  //make a bunch of elipsses going to different position based on the wave i used and amplituted and period
  for (int i = 0; i<10; i++) {
    strokeWeight(0);
    fill(73, 200, 73, i*25);
    ellipse(i*200+400+100*cos(step/2), 400+100*tan(step), 400, sin(step)*200);
    strokeWeight(100);
    stroke(0, 200, 0, i*25);
    ellipse(i*200+400+100*sin(step), 400+100*1/tan(step), sin(step)*400, 100);
    strokeWeight(200);
    stroke(200, 23, 24, i*25);
    ellipse(i*200+400+100*1/cos(step/4), 400+100*1/sin(step/8), 400, 100);
  }
  //if step is greater than > TAU*8.0 set step to 0
  if (step>TAU*8.0) {
    // noLoop();
    step = 0;
  }
}
