void setup() {
  size(500, 500);
    strokeWeight(3);
frameRate(15);
}
void draw() {
  background(242);
  float divider = 250;
  PVector start = new PVector(0, -13);
  //ine(start.x + 90, start.y + 90, start.x + 90, 277);
  translate(start.x + divider, start.y + divider);
  rotate(-frameCount);
  //PVector start2 = new PVector(100, 100);
  for (int j = 0; j<divider; j++) {
     rotate(frameCount/5);
    line(start.x + j, start.y, start.x +(j+ 82), start.y);
  }
}
