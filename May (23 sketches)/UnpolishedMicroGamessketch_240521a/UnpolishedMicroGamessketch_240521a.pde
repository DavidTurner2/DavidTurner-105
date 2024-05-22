//default button sizes
float sx = 150;
float sy = 40;
boolean l = false;
boolean r = false;
boolean u = false;
boolean d = false;
float speed = 2.502;
PImage face;
PImage distraction;
void setup() {
  face=loadImage("WD.png");
  distraction = loadImage("Pencil.png");
  size(800, 800);
  println(rng.length);
}
PVector sel = new PVector(0, 0);
int minigame = 8;
//button to go to
Button goTo = new Button();
Button restart = new Button();
Button type = new Button();
NumberArea guess = new NumberArea();
//minigame classes
ColorOrder m1 = new ColorOrder();
LineArt m2 = new LineArt();
PolishBoss m3 = new PolishBoss();
CircleCross m4 = new CircleCross();
Quantify m5 = new Quantify();
PushUps m6 = new PushUps();
Drop m7 = new Drop();
PickAThing m8 = new PickAThing();
String game;
float time;
int bad;
int score;
void draw() {
  background(0);
  sel.set(mouseX, mouseY);
  if (minigame == 0) {
    fill(255);
    textSize(30);
    text("UNPOLISHED MICROGAMES\nJust like a triple A game studio", 200, 200);
    goTo.update(new PVector(269, 445), "UNPOLISH START", -22, 159, 6, 1, "", sx, sy);
  }
  if (minigame==1) {
    fill(234);
    text("Click colors in order!", 200, 200);
    m1.update();
  }
  if (minigame==2) {
    textSize(30);
    fill(255);
    text("STEAL LIKE AN ARTIST", 200, 100);
    textSize(12);

    m2.update();
  }
  if (minigame==3) {
    fill(255);
    textSize(30);
    text("Defeat Them All! POWER LEVEL:"+m3.power, 200, 100);
    m3.update();
  }
  if (minigame==4) {
    m4.update();
  }
  if (minigame==5) {

    m5.update();
  }
  if (minigame==6) {
    textSize(30);
    fill(255);
    text("EXCERSIZING GAME", 300, 90);
    m6.update();
  }
  if (minigame==7) {
    textSize(40);
    fill(255);
    text("DRAG AND DROP", 100, 770);
    m7.update();
  }
  if (minigame==8) {
    textSize(20);
    fill(255);
    text("WILL YOU SEE THAT YOU GOT THE WORD BUT THEN CLICK AGAIN AND LOSE THE WORD?", 10, 170);

    m8.update();
  }
  if (minigame==100) {



    if (game=="m1") {
      fill(255);
      textSize(30);
      text("TIME: "+time+" Seconds", 200, 400);
      text("wrong color clicks: "+bad, 200, 450);
      goTo.update(new PVector(269, 500), "UNPOLISH NEXT", -22, 159, 6, 2, "", sx, sy);
      restart.update(new PVector(100, 500), " RESTART", -22, 159, 6, 1, "", sx, sy);
    }
  }
}
void mousePressed() {
  goTo.activate();
  restart.activate();
  m3.activate();
  m8.activate();
}
void keyPressed() {
  if (key=='8') {
    m8.current = m8.thing;
  }
  numberIntTyping(guess);
  if (key == 'a'||key=='A'||keyCode==LEFT) {
    l = true;
  }
  if (key == 'd'||key=='D'||keyCode==RIGHT) {
    r = true;
  }
  if (key == 'w'||key=='W'||keyCode==UP) {
    u = true;
  }
  if (key == 's'||key=='S'||keyCode==DOWN) {
    d = true;
  }
}
void keyReleased() {
  if (key == 'a'||key=='A'||keyCode==LEFT) {
    l = false;
  }
  if (key == 'd'||key=='D'||keyCode==RIGHT) {
    r = false;
  }
  if (key == 'w'||key=='W'||keyCode==UP) {
    u = false;
  }
  if (key == 's'||key=='S'||keyCode==DOWN) {
    d = false;
  }
}
void mouseReleased() {
  goTo.selected=false;
  restart.selected=false;
  m2.newPos[m2.selected].set(m2.lines[m2.selected2]);
  m3.selected=false;
  m2.dragging = false;
  m7.dragging = false;
  m8.selected=false;
}




Boolean collision(PVector a, float sx, float sy) {
  if (sel.x>a.x&&sel.x<a.x+sx&&sel.y>a.y&&sel.y<a.y+sy) {
    return true;
  } else {
    return false;
  }
}
