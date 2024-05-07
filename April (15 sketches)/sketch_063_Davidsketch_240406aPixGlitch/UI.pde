class Button {
  PVector pos = new PVector(0, 0);
  float size = 20;
  String mode;
  boolean selected = false;
  Button(float x, float y, String z) {
    pos.set(x, y);
    mode = z;
  }
  void position() {
    if (pos.dist(sel)<size) {
      selected = true;

      fill(100);
    } else {
      selected = false;
      fill(255);
    }
    if (p.mode==mode) {
      fill(100);
    }
    circle(pos.x, pos.y, size);
    textSize(13);
    text(mode, pos.x-10, pos.y+21);
  }

  void activate() {
    if (selected) {
      if (mode == "erase") {
        p.erase();
      } else {
        p.mode = mode;
      }
    }
  }
}

class ColorSelector {
  PVector a = new PVector(0, 0);
  PVector circle = new PVector(0, 0);
  float control = 0;
  boolean gradient = false;
  boolean dragging = true;

  ColorSelector(float x, float y) {
    a.set(x, y);
    circle.set(x, y);
  }

  void display() {
    if (gradient) {
      circle.y = lerp(a.y, a.y+255, norm(sin(frameCount/speed), -1, 1));
      c=(color(255*norm(sin(frameCount/speed), -1, 1)));
    }
    strokeWeight(2);
    for (int i = 0; i<255; i++) {
      stroke(i);
      point(a.x, a.y+i);
    }
    noStroke();
    fill(255);
    circle(circle.x, circle.y, 12);
    if (circle.dist(sel)<24&&dragging) {
      circle.set(a.x, constrain(sel.y, a.y, a.y+255));
      c=(color(map(circle.y, a.y, a.y+255, 0, 255)));
    }
  }

  void changeColor() {
    if (circle.dist(sel)<24) {
      gradient = !gradient;
    }
  }
}


class SizeSelector {
  PVector a = new PVector(0, 0);
  PVector circle = new PVector(0, 0);
  float control = 0;
  boolean gradient = false;
  boolean dragging = true;

  SizeSelector(float x, float y) {
    a.set(x, y);
    circle.set(x, y);
  }

  void display() {
    if (gradient) {
      circle.y = lerp(a.y, a.y+255, norm(sin(frameCount/speed), -1, 1));
      s=((map(sin(frameCount/speed), -1, 1, 4, 40)));
    }
    stroke(bgc);
    for (int i = 10; i<255+10; i++) {
      strokeWeight(i/28.09);
      point(a.x, -10+a.y+i);
    }
    noStroke();
    fill(255);
    circle(circle.x, circle.y, 12);
    if (circle.dist(sel)<24&&dragging) {
      circle.set(a.x, constrain(sel.y, a.y, a.y+255));
      s=((map(circle.y, a.y, a.y+255, 4, 40)));
    }
  }

  void changeColor() {
    if (circle.dist(sel)<24) {
      gradient = !gradient;
    }
  }
}
