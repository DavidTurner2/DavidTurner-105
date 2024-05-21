//import sound library
import processing.sound.*;
//create soundfile variables
SoundFile bgm;
SoundFile[] expandLeft = new SoundFile[100];
SoundFile[] expandRight = new SoundFile[100];

SoundFile teleport;

//create new spwaner object
Spawners r = new Spawners();
//create pvector for selctor
PVector sel = new PVector(0, 0);
//create start boolean to check if game is started
boolean start = false;
//variable for score
int score = 0;
//timer variabel
int countdown = 0;
//variable for controlling death screen transparency
float appear = 0;
//code runs at setup
void setup() {
  bgm = new SoundFile(this, "bgmwav.wav");
  for (int i = 0; i<expandLeft.length; i++) {
    expandLeft[i] = new SoundFile(this, "expandLeft.wav");
    expandRight[i] = new SoundFile(this, "expandRight.wav");
  }
  teleport = new SoundFile(this, "teleport.wav");

  //set size to 800,800
  size(800, 800);
}
//code runs every frame
void draw() {
  //set selector to mousex and mousey poistions
  sel.set(mouseX, mouseY);
  //set background to black
  background(0);
  if (start) {
    if (!bgm.isPlaying()) {
      bgm.play(random(0.7, 1.5));
      bgm.amp(0.5);
    }
    strokeWeight(1);
    //set rectangle mode to center
    rectMode(CENTER);
    r.update();
  } else {
    //start screen
    //set rectangle mode to corner
    rectMode(CORNER);
    strokeWeight(1);

    fill(255);
    stroke(0);
    square(0, 0, 900);
    textSize(20);
    fill(0, map(50*abs(2-tan(frameCount*0.021)), 150, 255, 0, 255));
    text("DO NOT LET THIS HAPPEN", 300, 230);

    noFill();
    //moving title screen
    circle(399, 310+6*norm(sin(frameCount*0.021), -1, 1), 40+90*abs(sin(frameCount*0.021)));
    circle(269, 310+6*norm(sin(frameCount*0.021), -1, 1), 40+90*abs(sin(frameCount*0.021)));

    //click on button to set boolean start true
    if (mouseX>462 && mouseX<462+118&&mouseY>424&&mouseY<424+31) {
      if (mousePressed) {
        start = true;
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
    text(score+" Circles Confused You", 400, 400);
    //countdown to change appear transparancy
    if (countdown<0) {
      appear-=2.4;
    }
    countdown--;
  }
  //run game
}

//you cant let the block collide or the circles collide
