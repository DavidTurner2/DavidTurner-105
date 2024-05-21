
PVector p = new PVector(400, 400);
Boolean l = false;
Boolean r = false;
float speed = 4.002;
Boost[] part = new Boost[8];
boolean colliding = false;
PVector[] spike = new PVector[8];
int a = 0;
void setup() {
  for (int i = 0; i<8; i++) {
    part[i] = new Boost(50, 200);
    spike[i] = new PVector(0, 0);
  }
  size(800, 800);
}


void draw() {

  // background(#93EEFF);
  background(0);
  noStroke();
  fill(255, 0, 0);
  translate(0, 400-p.y);
  a=0;

  if (l&&colliding==false) {
    p.x-=speed;
  }
  if (r&&colliding==false) {
    p.x+=speed;
  }
  if (p.x>width) {
    p.x=0;
  }
  if (p.x<0) {
    p.x=width;
  }
  for (int i = 0; i<part.length; i++) {
    if (!(collision(part[i].rect, part[i].rectSize.x, part[i].rectSize.y))) {
      a++;
    }
    println(a<part.length);
    if (a<part.length) {
      colliding = true;
    } else {
      colliding = false;
    }
  }
  fill(255);
  square(p.x, p.y, 40);
  spike[0].set(496,282);
  triangle(spike[0].x+20,spike[0].y,spike[0].x-20,spike[0].y,spike[0].x,spike[0].y+-52);
    triangle(spike[0].x+20,spike[0].y,spike[0].x-20,spike[0].y,spike[0].x,spike[0].y+52);

  circle(spike[0].x,spike[0].y,50);
  part[0].update(550, 288);
  part[1].update(219, 170);
  part[2].update(0, 0);
}

boolean collision(PVector a, float wide, float high) {
  if (p.x+40>a.x&&p.x<a.x+wide&&p.y+40>a.y&&p.y<a.y+high) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  if (key == 'a'||key=='A'||keyCode==LEFT) {
    l = true;
  }
  if (key == 'd'||key=='D'||keyCode==RIGHT) {
    r = true;
  }
}

void keyReleased() {
  if (key == 'a'||key=='A'||keyCode==LEFT) {
    l = false;
  }
  if (key == 'd'||key=='D'||keyCode==RIGHT) {
    r = false;
  }
}

class Boost {
  PVector rect = new PVector(0, 0);
  PVector rectSize = new PVector(0, 0);
  float r = 255;
  float g = 0;
  float b = 0;
  Boost(float sx, float sy) {
    rectSize.set(sx, sy);
  }

  void update(float x, float y) {
    if (rectSize.x<0) {
      rect.set(8899, 8899);
    } else {
      rect.set(x, y);
    }
    //fill(r, g, b);
    rect(rect.x, rect.y, rectSize.x, rectSize.y);
    if (collision(rect, rectSize.x, rectSize.y)) {
      if (p.x<rect.x) {
        p.x-=0.1;
      }
      if (frameCount%15==0) {
        r = random(50, 155);
        g = random(50, 155);
        b = random(50, 155);
      }
      rectSize.x-=0.42;
      p.y-=0.7;
    }
  }
}
