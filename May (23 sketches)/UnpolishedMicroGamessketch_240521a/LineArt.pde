class LineArt {

  PVector[] c = {new PVector(240, 400), new PVector(340, 400), new PVector(440, 400),
    new PVector(240, 700), new PVector(340, 700), new PVector(440, 700),
    new PVector(200, 440), new PVector(200, 540), new PVector( 200, 640),
    new PVector(480, 440), new PVector(480, 540), new PVector( 480, 640)};
  String name;
  int random = int(random(22));
  PVector[] lines = new PVector[c.length];
  PVector[] newPos = new PVector[c.length];
  PVector[] linesCopy = new PVector[c.length];
  PVector[] newPosCopy = new PVector[c.length];
  int selected=0;
  int selected2=0;
  float gtime;
  boolean end = false;
  boolean dragging = false;
  LineArt() {
    restart();
  }

  void update() {
    if (end) {
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 340);
      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 6, 3, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 2, "", sx, sy);
      translate(-162, 0);
      noStroke();
      fill(255);
      rect(190, 390, 300, 320);
      stroke(0);
      for (int i = 0; i<lines.length; i++) {
        line(lines[i].x, lines[i].y, newPos[i].x, newPos[i].y);
      }
      translate(399, 0);
      noStroke();
      fill(255);
      textSize(20);
      text("Original Artwork", 250, 370);
      rect(190, 390, 300, 320);
      stroke(0);
      for (int i = 0; i<linesCopy.length; i++) {
        line(linesCopy[i].x, linesCopy[i].y, newPosCopy[i].x, newPosCopy[i].y);
      }
    } else {
      if (frameCount%60==0) {
        gtime++;
      }
      noStroke();
      if (collision(new PVector(592, 464), 131, 36)) {
        if (mousePressed) {
          end = true;
        }
        fill(60, 50, 210);
      } else {
        fill(200);
      }
      rect(592, 464, 131, 36, 20);
      fill(0);
      textSize(20);
      text("FINISH", 630, 485);
      fill(255);
      rect(190, 390, 300, 320);
      pushMatrix();
      translate(0, -100);
      scale(0.6);
      fill(255);
      noStroke();

      rect(190, 390, 300, 320);

      popMatrix();
      rect(320, 138, 300, 105);
      fill(0);
      name=rng[random];

      text(name, 329, 158);

      for (int i = 0; i<c.length; i++) {
        if (sel.dist(c[i])<20) {
          fill(200);
          if (mousePressed&&dragging==false) {
            selected = i;
            dragging = true;
            selected2 = i;
          }

          if (dragging&&i!=selected) {
            selected2 = i;
          }
        } else {
          fill(200, 100);
        }
        noStroke();
        circle(c[i].x, c[i].y, 20);
        stroke(0);
        line(lines[i].x, lines[i].y, newPos[i].x, newPos[i].y);
        pushMatrix();
        translate(0, -100);
        scale(0.6);
        stroke(0);
        line(linesCopy[i].x, linesCopy[i].y, newPosCopy[i].x, newPosCopy[i].y);
        popMatrix();
      }
      if (dragging) {
        newPos[selected].set(mouseX, mouseY);
      }
    }
  }

  void restart() {
    gtime=0;
    random = int(random(22));
    end = false;
    for (int i = 0; i<c.length; i++) {
      int r = int(random(c.length));
      lines[i] = new PVector(c[i].x, c[i].y);
      linesCopy[i] = new PVector(c[i].x, c[i].y);
      newPosCopy[i] = new PVector(c[r].x, c[r].y);
      newPos[i] = new PVector(c[i].x, c[i].y);
    }
  }
}
