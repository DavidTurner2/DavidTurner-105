void setup() {
  size(800, 800);
}
PVector p = new PVector(400, 400);
Boolean l = false;
Boolean r = false;
float speed = 2.002;
void draw() {

 // background(#93EEFF);
 background(0);
  noStroke();
  rect(800, 400, -100, 100);
  fill(255, 0, 0);
  if (l) {
   p.x-=speed;
  }
  if (r) {
    p.x+=speed;
  }
  square(p.x, p.y, 40);
}



void keyPressed() {
  if (key == 'a') {
    l = true;
  }
  if (key == 'd') {
    r = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    l = false;
  }
  if (key == 'd') {
    r = false;
  }
}
