
class Shooters {
  //p shooters
  PVector[] p = new PVector[10];
  //bullet array
  PVector[] bullet = new PVector[100];
  //offset the array for bullets the shooters can shoot
  int[] offset={0, 10, 20, 30, 40, 50, 60, 70, 80, 90};
  //directions for the bullets to go
  PVector[] direction = new PVector[100];
  //shooting rates list for the shooters
  IntList times = new IntList(24, 24, 90, 60, 70, 69, 69, 90, 50, 37, 50, 50, 50, 25);
  float[] sign = {-1, 1, -1, 1};
  int temp = 0;
  Shooters() {
    restart();
  }
  void update() {
    if (frameCount%120==0) {
      score++;
      temp = score;
    }

    if (frameCount%(120*50)==0) {
      times.shuffle();
    }
    for (int i = 20; i<200; i+=20) {
      if (temp == i) {
        temp++;
        p[i/20] = new PVector(400/1.5, 400/1.5);
      }
    }
    for (int i = 0; i<10; i++) {
      if (frameCount%times.get(i)==0) {
        if (offset[i]>8+i*10) {
          offset[i] = i*10;
        }
        offset[i]++;
        bullet[offset[i]].set(400+p[i].x, 400+p[i].y, 20);
        if (p[i].heading()>PI/2) {
          direction[offset[i]].set(4, -1*2+random(4));
        } else if (p[i].heading()<-PI/2) {
          direction[offset[i]].set(random(9), 2+random(4));
        } else if (p[i].heading()>-3*PI/2 && p[i].heading()<0) {
          direction[offset[i]].set(-4, 1+random(4));
        } else if (p[i].heading()<PI/2) {
          direction[offset[i]].set(1, 4*-2+random(4));
        }
      }
    }
    //bullets
    fill(255);
    for (int i = 0; i<bullet.length; i++) {
      circle(bullet[i].x, bullet[i].y, 20);
      if (i == 98) {
        fill(0, 255, 0);
      }
      if (sel.x == 400&&sel.y==400) {
        bullet[i].lerp(sel, 0.1);
      } else {
        bullet[i].add(direction[i]);
      }
      //when you get hit by bullets take off health make screen go red and shake using hurt variable
      if (bullet[i].dist(sel)<25) {
        bullet[i].set(random(1000), random(-1000, -900));
        direction[i].set(0, 0);
        player.health--;
        hurt = 0;
      }
    }
    //bunch of rotation speeds
    //println(degrees(p[0].heading()));
    if (score>222) {
      for (int i = 0; i<p.length; i++) {
        p[0].rotate(sign[int(random(sign.length))]*random(0.009, 0.09));
      }
    } else {
      p[0].rotate(.005);
      p[1].rotate(-.005);
      p[2].rotate(.01);
      p[3].rotate(.0090908);
      p[4].rotate(-.004);
      p[5].rotate(.00523);
      p[6].rotate(.015123);
      p[7].rotate(-.026);
      p[8].rotate(-.007);
      p[9].rotate(.009);
    }
    strokeWeight(1);
    noFill();
    strokeWeight(9);
    //shooters
    for (int i =0; i<20; i++) {
      stroke(255, 90);
      for (int j = 0; j<10; j++) {
        point(400+p[j].x+random(-25, 25), 400+p[j].y+random(-25, 25));
      }
    }
  }
  void restart() {
    //spawn all the bullets offscreen set their direction to 0
    for (int i = 0; i<bullet.length; i++) {
      bullet[i] = new PVector(-900, -900);
      direction[i] = new PVector(0, 0);
    }
    //spawn all shooters randomoly on the circle
    for (int i = 0; i<10; i++) {
      if (i ==0) {
        p[i] = new PVector(400/1.5, 400/1.5);
      } else {
        p[i] = new PVector(40000/1.5, 40000/1.5);
      }
      p[i].rotate(random(-4, 4));
    }
  }
}
