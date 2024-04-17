Shooters s = new Shooters();
Player player = new Player();
PVector sel = new PVector(0, 0);
PVector circle = new PVector(400, 400);
PFont font;
boolean start = false;
boolean outofbounds = false;
PVector previous = new PVector(0, 0);
int score = 0;
int countdown = 0;
float appear = 0;
float hurt = 1;
void setup() {
  size(800, 800);
  font = loadFont("Wingdings-Regular-48.vlw");
  textFont(font, 30);
}

void draw() {
  background(lerpColor(#6A2424, #000000, hurt));
  hurt+=0.1;
  if(hurt<1){
    translate(random(8),random(10));
  }
  sel.set(mouseX, mouseY);

  if (circle.dist(sel)<350) {
    noFill();
  } else {
    fill(0, 255, 0, 100);
    sel.set(400, 400);
  }
  stroke(255, 90);
  strokeWeight(3);
  circle(circle.x, circle.y, 700);




  if (start) {
    strokeWeight(1);
    noFill();
    player.update();
    stroke(0);
    s.update();
  } else {
    //start screen


    strokeWeight(1);
    fill(255);
    stroke(0);
    square(0, 0, 900);
    triangle(400, 200, 500, 400, 300, 400);
    ellipse(399, 309, 62, 36);
    fill(0);
    circle(399+9*norm(sin(frameCount*0.021), -1, 1), 310+6*norm(sin(frameCount*0.021), -1, 1), 20);
    if (mouseX>462 && mouseX<462+118&&mouseY>424&&mouseY<424+31) {
      if (mousePressed) {
        start = true;
        score = 0;
      }
      fill(10, 0, 150);
    } else {
      fill(0);
    }
    rect(462, 424, 118, 31);
    fill(255);
    text("START", 466, 451);

    //death screen
    fill(255, appear);
    square(0, 0, 900);
    fill(0, appear);
    text(score, 400, 400);
    if (countdown<0) {
      appear-=2.4;
    }
    countdown--;
  }
}
class Player {
  PVector pos = new PVector(0, 0);
  int health = 100;
  Player() {
  }

  void update() {
    pos.set(sel.x, sel.y);
    fill(0, 255, 255);
    circle(pos.x, pos.y, 12);
    if(health<100){
    for (int i = 0; i<health; i++) {
      stroke(200, 0, 50);
      strokeWeight(0.185);
      line(10+pos.x+i/3, pos.y, 10+pos.x+i/3, pos.y-10);
    }
    }
    if (health<0) {
      appear = 255;
      countdown = 155;
      s.restart();
      start = false;
      health = 100;
    }
    println(score);
  }
}
