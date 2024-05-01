//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
  noFill();
}
//code runs every frame
void draw() {
  //set background to green
  background(155, 255, 100);
  //set stroke weight to 0.5
  strokeWeight(0.5);
  //set stroke to blue
  stroke(0, 0, 155, 100);
  //draw triangles
  for (int j = 0; j<100; j++) {
    for (int i = 0; i<100; i++) {
      //first set of trtiangles
      tri(0+i*10, 0+j*10);
      pushMatrix();
      //do strange effect at start
      if (frameCount<=10) {
        rotate(0.03*cos(frameCount/((int)(random(5, 100)))));
      } else {
        //framecount divided by int makes it pop in
        rotate(0.03*sin(frameCount/((int)(random(7, 8)))));
      }
      //seccond set of triangles
      tri(i*10, 0+j*10);
      popMatrix();
    }
  }
}
//function draws a triangle takes position parameters
void tri(float x, float y) {
  triangle(36+x, 20+y, 0+x, -37+y, -38+x, 20+y);
}
