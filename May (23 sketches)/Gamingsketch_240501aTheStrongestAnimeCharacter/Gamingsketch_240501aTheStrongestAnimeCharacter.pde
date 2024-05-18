//import sound library
import processing.sound.*;
//create soundfile variables
SoundFile bgm;
SoundFile swing;
SoundFile hit;
SoundFile[] hurt = new SoundFile[3];


//Boruto created by Ukyo Kodachi and Masashi Kishimoto,
//Photo by KoolShooters   from Pexels: https://www.pexels.com/photo/a-boxing-gym-9944633/
PImage bg;
//boss image
PImage boss;
//create objects
Boss b = new Boss();
Player p = new Player();
float step = 1;
float step2 = 1;
float time = 0;
void setup() {
  hurt[0] = new SoundFile(this, "hurt.wav");
  hurt[1] = new SoundFile(this, "hurt2.wav");
  hurt[2] = new SoundFile(this, "hurt3.wav");
  bgm = new SoundFile(this, "altpitch.wav");
  swing = new SoundFile(this, "swing.wav");
  hit = new SoundFile(this, "Hit.wav");

  size(600, 800);
  bg = loadImage("bg.jpg");
  boss = loadImage("boss.png");
  strokeCap(PROJECT);
  bgm.loop(random(0.7, 1.7));
  bgm.amp(0.25);
}

void draw() {
  //volume
  hit.amp(10);
  swing.amp(0.5);

//stepping valyues
  step+=0.422214;
  step2+=0.122214;
  //if player and boss are alive
  if (p.alive&&b.alive) {
    //increment time
    time+=0.43353;
    //finish attak animation
    if(time>0.7){
        b.sx=350;
    b.sy=350;
    }
    //attack after time goes over 10 set time back to zero
    if (time>10) {
      p.hurt();
      time = 0;
    }
  }
  background(240);
  //lerping hurt with step
  //when hurt the bg will get tinted red allittle bit
  tint(lerpColor(#ff0000, #ffffaa, step));
  //background
  image(bg, 0, 0, 600, 800);
  textSize(30);
  fill(255);

  text(" You", -2, 23);
  text("Strongest Ninja", 380, 23);
  //low valume
      hurt[0].amp(0.2);
      hurt[1].amp(0.2);
      hurt[2].amp(0.2);
  b.update();
  p.update();
}


void mousePressed() {
  swing.play(random(0.8, 1.2));

  time = 0;
  //when pressing the boss collision
  if (mouseX>b.p.x+100&&mouseX<b.p.x+100+b.sx-160&&mouseY>b.p.y&&mouseY<b.p.y+b.sy) {
    //if player alive attack
    if (p.alive) {
      b.hurt();
    }
  } else {
    //if boss alive get player get hurt
    if (b.alive) {
      p.hurt();
    }
  }
//try again reset all values
  if (p.alive==false) {
    bgm.loop(random(0.7, 1.7));
    bgm.amp(0.25);
hit.stop();
    p.health = 100;
    p.alive = true;
    b.health = 10000;
    b.p.set(100, 400);
    b.to = 100;
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
    } else {
      bgm.stop();
      step = 0;
      alive = false;
      textSize(50);
      fill(0);
      text("Game Over\ntry again?", 240, 300);
    }
    float space2 = 2.00;

    //boss health
    for (int i = 0; i<b.health/100; i++) {
      stroke(lerpColor(#ee00aa, color(86, 170, 241), step2));
      strokeWeight(2.0);
      line(580-i*space2, 35, 580-i*space2, 71);
    }
    if (b.health<10000) {
      textSize(30);
      text(b.health+"/10000", 400, 60);
    }
  }
  //hurt method
  void hurt() {
    //subtract health
    health-=35;
    step = 0;
    hit.play(random(0.8, 1.3));
    b.sx=450;
    b.sy=450;
  }
}
