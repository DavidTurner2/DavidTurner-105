//code runs at setup
void setup() {
  //size is set to 800,800
  size(800, 800);
}
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //set scale to 0.2
  scale(0.2);
  pushMatrix();
  translate(800, 1600);
  //fill black
  fill(0);
  //stroke white
  stroke(255);
  //weight 4
  strokeWeight(4);
  //bunch of circles movin up and down
  for (int j = 0; j<100; j++) {
    for (int i = 0; i<1000; i++) {
      circle(-800+-100*sin(8*frameCount/99.009)+i*40, -1200+200*cos(8*frameCount/99.009)+j*30, 50);
    }
  }
  popMatrix();
  //sstroke weight 1.4
  strokeWeight(1.4);
  //red stroke
  stroke(255, 0, 0);
  //fill blue
  fill(50, 10, 204);
//drawin triangles
  for (int j = 0; j<100; j++) {
    for (int i = 0; i<100; i++) {
      tri(i*80, j*60);
    }
  }
  //rotate tit
  pushMatrix();
  rotate(0.04);
  for (int j = 0; j<100; j++) {
    for (int i = 0; i<100; i++) {
      tri(i*80, j*60);
    }
  }
  popMatrix();
}
//function draws trinalge and take agruments for positiosn
void tri(float x, float y) {
  triangle(36+x, 20+y, 0+x, -37+y, -38+x, 20+y);
}
