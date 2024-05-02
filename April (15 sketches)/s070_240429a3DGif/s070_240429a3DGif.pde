//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000, P3D);
}
//variable for controlling animation
float step = 0.0;
void draw() {
  lights();
  //directional
  //set background to black
  background(20);
  //incriment step by 0.05
  step+=0.05;

  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)));
  noStroke();
  translate(500, 200, -1600);
  rotateZ(step/2);
  translate(-500, -200, 1700);
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)));
  //make circle move around slightly using absolute value sine waves and cosine waves and also get slightly larger and smaller
  pushMatrix();
  translate(500+sin(step)*-50*abs(sin(step*2)), 500+cos(step)*+50*abs(sin(step*2)), -1500);
  sphere(200+100*abs(sin(step*2)));
  popMatrix();

  //set stroke
  for (int i = 0; i<12; i++) {
    pushMatrix();
    //turn off stroke
    noStroke();
    fill(200+200*abs(sin(step)), 100+200*abs(sin(step)), 0, 200*abs(sin(step)));
    //getting bigger and smaller
    translate(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*-100), -1500+-500*sin(step+i*100));
    sphere(5+50*abs(sin(step*2)));
    popMatrix();
  }
  
  for (int i = 0; i<12; i++) {
    pushMatrix();
    stroke(143, 23, 224, 60);
    //make purple circles with fill being slightly animated
    fill(0+55*abs(sin(step)), 0, 200); //100+55*abs(sin(step)));
    //everything is slightly moving
    //circles getting larger and smaller following a circular wave but at differnt amplitude so its not going in a circuluar motion
    translate(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*50), -1500+-500*sin(step));
    sphere(50+map(sin(step*4), -1, 1, 20, 10));
    popMatrix();
  }
}
