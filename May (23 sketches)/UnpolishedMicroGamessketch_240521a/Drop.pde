class Drop {
  PVector b = new PVector(100, 400);
  PVector[] pill = new PVector[10];
  boolean dragging = false;
  float move = 0;
  boolean init = true;
  boolean end = false;
  int missed = 0;
  float gtime = 0;
  Drop() {
    restart();
  }

  void update() {
    if (end) {
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 340);
      text("Deaths:"+missed, 200, 450);
      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 6, 8, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 7, "", sx, sy);
    } else {
      if (frameCount%60==0) {
        gtime++;
      }
      fill(255);

      if (sel.dist(b)<20) {
        fill(200);
        if (mousePressed) {
          dragging = true;
          init = false;
        }
      }
      circle(b.x, b.y, 40);
      for (int i = 0; i<pill.length; i++) {

        pill[i].x =400+i*350+move;
        if (i%2==0) {
          if (collide(pill[i], 50, 1000)) {
            restart();
            missed++;
          }
          fill(255);
          rect(pill[i].x, pill[i].y, 50, 1000);
        } else {
          if (b.x>pill[i].x&&b.x<pill[i].x+50&&b.y<pill[i].y&&b.y>pill[i].y-1000) {
            restart();
            missed++;
          }
          rect(pill[i].x, pill[i].y, 50, -1000);
        }
      }

      move-=1.99;
      if (move<-3200) {
        end = true;
      }
      println(missed);

      if (init==false) {
        if(dragging==false){
        b.y+=4.444;
        }
        if (b.y>height) {
          restart();
          missed++;
        }
      }

      if (dragging) {
        b.y=constrain(mouseY, 0, b.y);
      }
    }
  }

  void restart() {
    gtime = 0;
    end = false;
    init = true;
    move = 0;
    b = new PVector(100, 400);
    for (int i = 0; i<10; i++) {
      pill[i]=new PVector(0, random(700));
    }
  }
  Boolean collide(PVector a, float sx, float sy) {
    if (b.x>a.x&&b.x<a.x+sx&&b.y>a.y&&b.y<a.y+sy) {
      return true;
    } else {
      return false;
    }
  }
}
