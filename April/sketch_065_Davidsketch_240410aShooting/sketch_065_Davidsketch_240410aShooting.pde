//import sound library
import processing.sound.*;
//create soundfile variables
SoundFile bgm;
SoundFile ball;
SoundFile bound;
SoundFile hit;


//create shooter object
Shooters s = new Shooters();
//create player object
Player player = new Player();
//create selector variable
PVector sel = new PVector(0, 0);
//create circle for arena
PVector circle = new PVector(400, 400);
//create font variable
PFont font;
//create start boolean to check if game is started
boolean start = false;
//boolean for out of bounds
boolean outofbounds = false;
//variable for score
int score = 0;
//timer variabel
int countdown = 0;
//variable for controlling death screen transparency
float appear = 0;
//variable for timer cfor countrolling screen color fading and shaking
float hurt = 1;
//boolean check if if out of bounds
boolean out = false;
float vol = 0.25;
//code runs at setup
void setup() {
  //set audio files to the soundfiles in data folder
  ball = new SoundFile(this, "ball_shoot.wav");
  bgm = new SoundFile(this, "SCARE_2.mp3");
  bound = new SoundFile(this, "out_of_bounds.wav");
    hit = new SoundFile(this, "Hit.wav");

  //play and loop background music
  bgm.loop(random(0.7, 4.7));
  //set size to 800,800
  size(800, 800);
  //set font to font in data folder
  font = loadFont("Wingdings-Regular-48.vlw");
  //set text font to font vraible and size 30
  textFont(font, 30);
}
//code runs everyframe
void draw() {
  bgm.amp(vol);
  //set background to lerp from dark red to black using hurt variable
  background(lerpColor(#6A2424, #000000, hurt));
  //keep increasing hurt by 0.1
  hurt+=0.1;
  //if hurt is less than 1 shake the screen by translating to random values
  if (hurt<1) {
    translate(random(8), random(10));
  }
  //set selector to mouseX mouseY
  sel.set(mouseX, mouseY);
  //if selector is inside of circle set out of bounds to false. else set out of bounds true
  if (circle.dist(sel)<350) {
    noFill();
    out = false;
  } else {
    //uhh
    fill(0, 255, 0, 20);
    out = true;
  }
  //make arena circle
  stroke(255, 90);
  strokeWeight(3);
  circle(circle.x, circle.y, 700);



  //if game start then call update method on shooter and player objects
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
    //moving title screen
    circle(399+9*norm(sin(frameCount*0.021), -1, 1), 310+6*norm(sin(frameCount*0.021), -1, 1), 20);
    //click on button to set boolean start true
    if (mouseX>462 && mouseX<462+118&&mouseY>424&&mouseY<424+31) {
      if (mousePressed) {
        start = true;
        score = 0;
      }
      fill(10, 0, 150);
    } else {
      fill(0);
    }
    //start button
    rect(462, 424, 118, 31);
    fill(255);
    text("START", 466, 451);

    //death screen
    fill(255, appear);
    square(0, 0, 900);
    fill(0, appear);
    //show score
    text(score, 400, 400);
    //countdown to change appear transparancy
    if (countdown<0) {
      appear-=2.4;
    }
    countdown--;
  }
}
class Player {
  //position pvecot
  PVector pos = new PVector(0, 0);
  //player health
  int health = 100;
  Player() {
  }

  void update() {
    //set position to selector
    pos.set(sel.x, sel.y);
    //create cyan circle as player
    fill(0, 255, 255);
    circle(pos.x, pos.y, 12);
    //show health bar when at less than full health
    if (health<100) {
      //bars going up to current health for loop
      for (int i = 0; i<health; i++) {
        stroke(200, 0, 50);
        strokeWeight(0.185);
        line(10+pos.x+i/3, pos.y, 10+pos.x+i/3, pos.y-10);
      }
    }
    //die restart set start to false set countdown for death screen
    if (health<0) {
      out = false;
      appear = 255;
      countdown = 155;
      s.restart();
      start = false;
      health = 100;
      bgm.stop();
      bgm.loop(random(0.7, 4.7));
    }
  }
}
