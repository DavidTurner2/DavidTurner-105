class PickAThing {
  int thing = 0;
  int current = 0;
  boolean chosen = false;
  boolean selected = false;
  float gtime = 0;
  boolean end = false;
  PickAThing() {
  }


  void update() {
    if (end) {
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 340);
      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 6, 0, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 8, "", sx, sy);
    } else {
      if (frameCount%60==0) {
        gtime++;
      }
      if (chosen==false) {
        thing = int(random(defgh.length));
        chosen = true;
      }
      fill(255);
      rect(200, 300, 400, 300);
      stroke(0);
      line(200, 340, 600, 340);
      textSize(20);
      fill(0);
      text("Choose "+defgh[thing]+" to continue", 290, 330);
      fill(#F2F0DA);
      rect(340, 400, 150, 30);
      fill(0);
      text(defgh[current], 342, 420);
      // circle(330, 417, 20);
      fill(0);

      if (sel.dist(new PVector(330, 417))<10) {
        fill(100);
        selected = true;
      } else {
        selected = false;
      }

      triangle(335, 410, 335, 425, 320, 420);
      fill(0);
      if (selected==false) {
        if (sel.dist(new PVector(500, 417))<10) {
          fill(100);
          selected = true;
        } else {
          selected = false;
        }
      }
      triangle(495, 410, 495, 425, 510, 420);
      if (current==thing) {
        goTo.update(new PVector(329, 500), "UNPOLISH NEXT", -22, 159, 6, 200, "pick", sx, sy);
      }
    }
  }

  void restart() {
    chosen = false;
   selected = false;
   gtime = 0;
   end = false;
  }

  void activate() {
    if (selected) {
      fill(255);
      current= int(random(defgh.length));
    }
  }
}
