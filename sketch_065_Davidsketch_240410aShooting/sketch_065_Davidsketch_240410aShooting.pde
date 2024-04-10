Shooters s = new Shooters();
void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  s.update();
}

class Shooters {
  PVector p = new PVector(400/1.5, 400/1.5);
  PVector bullet = new PVector(0, 0);
  float idk =0;
  Shooters() {
  }

  void update() {
    // translate(400,400);
    if (frameCount%62==0) {
      bullet.set(400+p.x, 400+p.y, 20);
      idk = p.heading();
    }
    fill(255);
    circle(bullet.x, bullet.y, 20);
    
    //bunch of targets that the bullet should travel to when the p heading is at different angles right now its 90
println(p.heading()>PI/2);
bullet.add(0,10);

    p.rotate(.005);
    strokeWeight(1);
    noFill();
    circle(400, 400, 800);
    strokeWeight(9);

    for (int i =0; i<20; i++) {


      stroke(255, 90);
      point(400+p.x+random(-25, 25), 400+p.y+random(-25, 25));
    }
  }
}
