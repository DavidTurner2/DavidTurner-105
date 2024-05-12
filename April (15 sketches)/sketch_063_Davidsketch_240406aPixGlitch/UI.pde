class Button {
  PVector pos = new PVector(0, 0);
  float size = 20;
  String mode;
  boolean selected = false;
  Button(String z) {
    mode = z;
  }
  void position(float x, float y) {
    pos.set(x, y);

    if (pos.dist(sel)<size) {
      selected = true;
      if (mode=="undo") {
        p.mode="fsdf";
      }
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
      if (mode == "clear") {
        p.erase();
      } else if (mode == "undo") {
        p.undo();
        p.mode="addsf";
      } else if (mode == "redo") {
        //
      } else {
        p.mode = mode;
      }
    }
  }
}

class ColorSelector {
  //pvector of line controlling color
  PVector a = new PVector(0, 0);
  //pvector of circle on line
  PVector circle = new PVector(0, 0);
  //boolean checking if automatically changes
  boolean gradient = false;
  //boolean checking if dragging
  boolean dragging = false;
  boolean selected = false;

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
    if (circle.dist(sel)<24) {
      selected = true;
      if(dragging){
      circle.set(a.x, constrain(sel.y, a.y, a.y+255));
      c=(color(map(circle.y, a.y, a.y+255, 0, 255)));
      }
    } else{
      selected = false;
    }
  }

  void changeColor() {
    if (circle.dist(sel)<24) {
      gradient = !gradient;
    }
  }
}


class SizeSelector {
  //pvector of line controlling size
  PVector a = new PVector(0, 0);
  //pvector of circle on line
  PVector circle = new PVector(0, 0);
  //boolean checking if automatically changes
  boolean gradient = false;
  //boolean checking if dragging
  boolean dragging = false;

boolean selected = false;
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
    if (circle.dist(sel)<24) {
      selected = true;
      if(dragging){
      circle.set(a.x, constrain(sel.y, a.y, a.y+255));
      s=((map(circle.y, a.y, a.y+255, 4, 40)));
      }
    }else{
      selected = false;
    }
  }

  void changeColor() {
    if (circle.dist(sel)<24) {
      gradient = !gradient;
    }
  }
}
