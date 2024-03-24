//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
}
//code runs every frame
void draw() {
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
}
