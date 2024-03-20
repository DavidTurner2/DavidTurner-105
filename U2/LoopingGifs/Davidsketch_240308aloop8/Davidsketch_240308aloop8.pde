//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
}
//variable for controlling animation
float step = 0.0;
//variables for controlling opacity of the big circles
float opacity = 0;
float opactiy2 = 255;
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //incriment step by 0.05
  step+=0.05;
  //make blue elipse to rotate around the sphere
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)));
  //push matrix for this specific rotation
  pushMatrix();
  //turn off stroke
  noStroke();
  //translate to 500,500 rotate and translate to -500,-500 so that elipse stays incenter
  translate(500, 500);
  rotate(step);
  translate(-500, -500);
  //have elipse be moving slightly using sin waves and cosine waves
  ellipse(500+100*sin(step), 500+200*cos(step), 1400, 100);
  //pop matrix return it to normal
  popMatrix();
  //conditional statements that change which big circle is going to display and the last one sets step to zero to repeat the loop
  if (step>PI&&step<2.0*PI) {
    opacity = 255;
    opactiy2 = 0;
  }
  if (step>2.0*PI&&step<PI*3.0) {
    opacity = 0;
    opactiy2 = 255;
  }
  if (step>PI*3.0&&step<PI*4.0) {
    opacity = 255;
    opactiy2 = 0;
  }
  if (step>PI*4.0&&step<PI*5.0) {
    opacity = 0;
    opactiy2 = 255;
    step = 0;
    //noLoop();
  }
  //blue circle in front of the purple circles make colors go from blue to a darker shade and back using absoulute value so it doesnt go negative
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)), opacity);
  //make circle move around slightly using absolute value sine waves and cosine waves and also get slightly larger and smaller
  circle(500+sin(step)*-50*abs(sin(step*2)), 500+cos(step)*+50*abs(sin(step*2)), 500+100*abs(sin(step*2)));
  //set stroke weight to 10
  strokeWeight(10);
  //for loops for making the purple spheres
  for (int i = 0; i<12; i++) {
    stroke(0);
    //make purple circles with fill being slightly animated
    fill(0+55*abs(sin(step)), 0, 100+55*abs(sin(step)));
    //everything is slightly moving
    //circles getting larger and smaller following a circular wave but at differnt amplitude so its not going in a circuluar motion
    circle(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*50), 50+map(sin(step*4), -1, 1, 20, 100));
    noStroke();
    //smaller circles inside at a different shade
    fill(0, 200+200*abs(sin(step)), 0, 70+50*-abs(sin(step)));
    circle(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*-100), 10+50*-abs(sin(step*2)));
  }
  //second sphere behind the the purple spheres so it looks 3d when it gets turned off and on
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)), opactiy2);
  circle(500+sin(step)*-50*abs(sin(step*2)), 500+cos(step)*+50*abs(sin(step*2)), 500+100*abs(sin(step*2)));
  //yellow spheres infront of everything going a in a motion that isnt a circle
  for (int i = 0; i<12; i++) {
    //turn off stroke
    noStroke();
    fill(200+200*abs(sin(step)), 100+200*abs(sin(step)), 0, 200*abs(sin(step)));
    //getting bigger and smaller
    circle(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*-100), 10+50*abs(sin(step*2)));
  }
  //saveFrame("frames/####.png");
}
