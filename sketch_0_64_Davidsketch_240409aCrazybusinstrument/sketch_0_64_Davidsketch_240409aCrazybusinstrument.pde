import processing.sound.*;
SawOsc saw = new SawOsc(this);
SqrOsc square = new SqrOsc(this);

Env env = new Env(this);

float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.4;
char check;
boolean buttonPressed = false;

RectButton r = new RectButton();
void setup() {
  size(400, 100);
  for (int i =0; i<1000; i++) {
    //  saw.play(random(440,800),0.24);
    //    env.play(saw, attackTime, sustainTime, sustainLevel, releaseTime);
  }
}


void draw() {
  background(0);
  r.display();
  fill(255);
  text("CRAZYBUS TYPE BEAT CREATOR", 50, 100/2);
  if (frameCount%10==0&&r.p) {
    saw.play(random(220, 800*2), 0.24);
    square.play(random(100, 440), 0.24);
    env.play(saw, attackTime, sustainTime, sustainLevel, releaseTime);
    env.play(square, attackTime, sustainTime, sustainLevel, releaseTime);
  }
}

class RectButton {
  boolean p = true;
  RectButton() {
  }
  void display() {
    if (p) {
      fill(#ff2200);
      rect(275, 25, 100, 50);
      fill(255);
      text("manual mode", 290, 50);
    } else {
      fill(#00ff22);
      rect(275, 25, 100, 50);
      fill(255);
      text("automatic mode", 290, 50);
    }
  }

  void changeMode() {
    if (mouseX>275&&mouseX<275+100&&mouseY>25&&mouseY<25+50) {
      p = !p;
      square.stop();
      saw.stop();
    }
  }
}



void mousePressed() {
  r.changeMode();
}

void keyPressed() {
  if (r.p==false&&buttonPressed==false) {
      check = key;
    buttonPressed = true;
    square.play(random(100, 440), 0.24);
    env.play(square, attackTime, sustainTime, sustainLevel, releaseTime);
  }
  if(r.p==false&&key!=check){
    saw.play(random(220, 800*2), 0.24);
    env.play(saw, attackTime, sustainTime, sustainLevel, releaseTime);
  }
}

void keyReleased(){
  buttonPressed = false;
}
