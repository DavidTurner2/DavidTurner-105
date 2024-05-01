//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
      stroke(123);
}
float step = 0;

//code runs every frame
void draw() {

  step +=0.500;
  //set background to blue
  background(20, 50, 100);
  //set fill to black
  fill(0);
  //nested loops
  for (int j = 0; j<20; j++) {
    for (int i=0; i<20; i++) {
      //make overlapping lines of circles
      circle(200+i*5, j*5, 2);
      pushMatrix();
      rotate(0.09);
      circle(200+i*5, j*5, 2);
      popMatrix();
      //make weird line things
      line(100+j*5.5340, 100+i*35.09, 2+j*3.1, 300+i*3);
    }
  }
  noFill();
  for (int j = 0; j<4; j++) {
    for (int i = 0; i<40; i++) {
      bezier(j*10+i*20+width/3.61*cos(step/20), height/1.29*sin(step/14.8),
        width/2.00, j*10+height/1.28*sin(step/40),
        width/4.00*cos(step/14.8), height/1.00,
       i*20+ width/1.00*sin(step/32), height/6.16);
    }
  }
}
