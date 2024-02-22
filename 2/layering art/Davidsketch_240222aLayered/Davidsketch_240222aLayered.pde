void setup() {
  size(700, 700);
  background(0);
}
float appear = 1;
float x = random(700);
float y = random(700);
float r = random(255);
float g = random(255);
float b = random(255);
void draw() {
    timeup();
  stroke(appear);
  line(random(0, 700), random(0, 700), 9999, 9999);
  stroke(appear*2, appear*3, appear*20);
  line(-9999, 9999, random(0, 700), random(0, 700));

  println(frameCount);
}

void timeup() {
  if (appear > 10)
  {
    appear=0;
    x = random(700);
    y = random(700);
    r = random(255);
    g = random(255);
    b = random(255);
  } else if (frameCount%19==0) {
    appear+= 2.1;
  }

  noStroke();
  fill(r, g, b, appear);
  circle(x, y, 500);
}
