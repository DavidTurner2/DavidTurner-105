class CircleCross {
  PVector[] enemy = new PVector[11];
  PVector[] enemy2 = new PVector[11];
  PVector[] enemy3 = new PVector[11];
  PVector[] enemy4 = new PVector[110];
  PVector sel = new PVector(400, 700);
  boolean selected = false;
  int selection;
  int power = 1;
  int missed = 0;
  float gtime;
  boolean end = false;
  boolean ouch = false;
  float playerSize = 20/2;
  int zone = 0;
  boolean safe = false;
  CircleCross() {
    restart();
  }
  void update() {
    if (end) {
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 340);
      text("Deaths:"+missed, 200, 450);
      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 6, 5, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 4, "", sx, sy);
    } else {
      if (frameCount%60==0) {
        gtime++;
      }
      if (sel.y<100&&zone==0) {
        resetPos();
        zone=1;
      }
      if (l) {
        sel.x-=speed;
      }
      if (r) {
        sel.x+=speed;
      }
      if (u) {
        sel.y-=speed;
      }
      if (d) {
        sel.y+=speed;
      }
      if (sel.x>width) {
        sel.x=0;
      }
      if (sel.x<0) {
        sel.x=width;
      }
      if (ouch) {
        if (zone==0) {
          sel.set(400, 700);
        } else {
          sel.set(400, 100);
        }
        missed++;
        ouch = false;
      } else {
        for (int i = 0; i<enemy4.length; i++) {

          if (zone==0&&i<enemy.length) {
            textSize(30);
            text("WASD OR ARROW KEYS", 300, 30);
            if (sel.dist(enemy[i])<25+playerSize||sel.dist(enemy2[i])<25+playerSize||
              sel.dist(enemy3[i])<150+playerSize||sel.dist(new PVector(400, 200))<50+playerSize) {
              ouch = true;
            }
            enemy[i].set(400+100*cos(i*0.5201555+frameCount/199.009), 200+100*sin(i*0.5201555+frameCount/199.009));
            enemy2[i].set(400+400*cos(i/2+frameCount/99.009), 400+100*sin(i*0.5201555+frameCount/199.009));
            enemy3[0].set(140, 200);
            enemy3[1].set(680, 200);
            fill(255);
            noStroke();
            circle(enemy3[0].x, enemy3[0].y, 300);
            circle(enemy3[1].x, enemy3[1].y, 300);
            circle(400, 200, 100);
            circle(enemy[i].x, enemy[i].y, 50);
            circle(enemy2[i].x, enemy2[i].y, 50);
            circle(enemy[i].x, enemy[i].y, 50);
          } else if (zone==1) {
            if (sel.dist(new PVector(400, 50))<200+playerSize) {
              safe = true;
            } else {
              safe = false;
            }
            if (sel.dist(enemy4[i])<12.5+playerSize&&safe==false) {
              ouch = true;
            }
            enemy4[i].set(400+400*cos(i/2+frameCount/99.009), 400+400*sin(i*1.5201555+frameCount/199.009));
            fill(255);
            noStroke();
            circle(enemy4[i].x, enemy4[i].y, 25);
            stroke(255);
            fill(0);
            circle(400, 50, 400);
            fill(90, 200, 70);
            noStroke();
            circle(800*abs(cos(frameCount/97.007)), 400+400*abs(sin(frameCount/97.007)), 50);
            if (sel.dist(new PVector(800*abs(cos(frameCount/97.007)), 400+400*abs(sin(frameCount/97.007))))<25+playerSize) {
              end = true;
            }
          }
        }
      }
      noStroke();
      fill(100, 110, 255);
      circle(sel.x, sel.y, 20);
    }
  }
  void restart() {
    end = false;

    power = 1;
    missed = 0;
    gtime=0;
    resetPos();
  }
  void resetPos() {
    for (int i=0; i<enemy.length; i++) {
      enemy[i]=new PVector(1000, 1000);
      enemy2[i]=new PVector(1000, 1000);
      enemy3[i]=new PVector(1000, 1000);
    }
    for (int i = 0; i<enemy4.length; i++) {
      enemy4[i]=new PVector(1000, 1000);
    }
  }
  boolean collide(PVector a, float sx, float sy) {
    if (sel.x>a.x&&sel.x<a.x+sx&&sel.y>a.y&&sel.y<a.y+sy) {
      return true;
    } else {
      return false;
    }
  }
}
