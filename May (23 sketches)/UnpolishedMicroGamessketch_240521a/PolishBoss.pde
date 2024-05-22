class PolishBoss {
  PVector[] enemy = new PVector[7];
  int[] health = new int[7];
  boolean selected = false;
  int selection;
  int power = 1;
  int missed = 0;
  float gtime;
  boolean end = false;
  float ranc = 0;
  float rans = 0;

  PolishBoss() {
    restart();
  }
  void update() {
    if (end) {
      if(power>=40&&missed==0){
        power = 9001;
      }
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 340);
            text("Misses:"+missed, 200, 450);

      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 6, 4, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 3, "", sx, sy);
    } else {
      if (frameCount%60==0) {
        gtime++;
      }
      float a = 0;
      for (int i = 0; i<enemy.length; i++) {
        if (health[i]<=0) {
          a++;
          println(a);
        } else {
          a=0;
        }
        if (a>=7) {
          end = true;
        }
        if (health[i]<100) {
          for (int j = 0; j<health[i]; j++) {
            stroke(251, 2, 8);
            strokeWeight(2.0);
            line(-50+enemy[i].x+j, 50+enemy[i].y, -50+enemy[i].x+j, 50+enemy[i].y);
          }
        }
        if (health[i]>0) {
          enemy[i].set(400+300*cos(i*ranc+frameCount/99.009), 400+300*sin(i*rans+frameCount/99.009));
          fill(255);
          if (sel.dist(enemy[i])<25) {
            fill(200);
            selection = i;
            selected = true;
          }
          noStroke();
          circle(enemy[i].x, enemy[i].y, 50);
        }
      }
    }
  }
  void restart() {
    end = false;
    ranc = random(0.42090, 3);
    rans = random(0.42090, 3);

    power = 1;
    missed = 0;
    gtime=0;
    for (int i=0; i<enemy.length; i++) {
      enemy[i]=new PVector(0, 0);
      health[i]=100;
    }
  }
  void activate() {
    if (selected&&end==false) {
      health[selection]-= power;
      power++;
      // println(power);
    } else {
      power=1;
      if(end==false) {
      missed++;
      }
    }
  }
}
