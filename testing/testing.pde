PVector c1 = new PVector(400, 400);
PVector c2 = new PVector(400, 400);
float d = 500;
float d2 = 200;
void setup() {
  size(800, 800,P3D);
  noFill();
}

void draw() {
  background(0);
  c1.set(400, 400);
  c2.set(400, 400);
  d = 200+200*cos(frameCount/9.9);
  d2 = 100+400*-sin(frameCount/9.09);
  stroke(255);
  circle(c2.x, c2.y, d);
  circle(c1.x, c1.y, d2);
  
  translate(400+100*sin(frameCount/99.009), 400, 400*tan(frameCount/99.009));
  
sphere(100*sin(frameCount/89.009));
    
}
