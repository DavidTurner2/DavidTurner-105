float sx = 150;
float sy = 40;
void setup() {
  size(800, 800);
  println(rng.length);
}
PVector sel = new PVector(0, 0);
int minigame = 0;
//button to go to
Button goTo = new Button();
Button restart = new Button();

//minigame classes
ColorOrder m1 = new ColorOrder();
LineArt m2 = new LineArt();
PolishBoss m3 = new PolishBoss();
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
  if (minigame==100) {
    fill(255);
    textSize(30);

    text("TIME: "+time+" Seconds", 200, 400);

    if (game=="m1") {
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
}
void keyPressed() {
  println("newer");
}
void mouseReleased() {
  goTo.selected=false;
  restart.selected=false;
  m2.newPos[m2.selected].set(m2.lines[m2.selected2]);
  m3.selected=false;
  m2.dragging = false;
}

Boolean collision(PVector a, float sx, float sy) {
  if (sel.x>a.x&&sel.x<a.x+sx&&sel.y>a.y&&sel.y<a.y+sy) {
    return true;
  } else {
    return false;
  }
}
