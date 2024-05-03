//Photo by KoolShooters   from Pexels: https://www.pexels.com/photo/a-boxing-gym-9944633/
PImage bg;
//boss image
PImage boss;
//create objects
Boss b = new Boss();
Player p = new Player();
float step = 1;
//radial timer when about to hit
void setup() {
  size(600, 800);
  bg = loadImage("bg.jpg");
  boss = loadImage("boss.png");
  strokeCap(PROJECT);
}

void draw() {
  step+=0.322214;
  background(240);
  tint(lerpColor(#ff0000,#ffffff,step));
  image(bg, 0, 0, 600, 800);
  textSize(30);
  fill(255);
  text("Luffy",-2,23);
    text("Boruto",496,23);

  b.update();
  p.update();
}


void mousePressed() {
  //when pressing the boss collision
  if (mouseX>b.p.x+100&&mouseX<b.p.x+100+b.sx-160&&mouseY>b.p.y&&mouseY<b.p.y+b.sy) {
   //if player alive attack
    if(p.alive){
    b.hurt();
   }
  } else {
    //if boss alive get player get hurt
    if(b.alive){
    p.hurt();
    }
  }
}

class Player {
  //health varianle
  int health = 100;
  //alive boolean
  Boolean alive = true;
  Player() {
  }

  void update() {
//spacing
    float space = 2.00;
    //bars going up to current health for loop
    //fighting ui helath your health vs boss health
    
    if (health>0) {
      for (int i = 0; i<health; i++) {
        stroke(251, 2, 8);
        strokeWeight(2.0);
        line(10+i*space, 35, 10+i*space, 71);
      }
    }else{
      step = 0;
      alive = false;
      textSize(50);
      fill(0);
      text("Game Over",240,300);
    }
    float space2 = 2.00;

//boss health
    for (int i = 0; i<b.health/100; i++) {
      stroke(86, 170, 241);
      strokeWeight(2.0);
      line(580-i*space2, 35, 580-i*space2, 71);
    }
  }
//hurt method
  void hurt() {
    //subtract health
    health-=35;
    step = 0;
  }
}
