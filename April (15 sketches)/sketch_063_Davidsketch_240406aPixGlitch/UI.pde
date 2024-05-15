class Button {
  //position of button
  PVector pos = new PVector(0, 0);
  //size of button
  float size = 20;
  //mode of button
  String mode;
  //if button is selected
  boolean selected = false;
  Button(String z) {
    mode = z;
  }
  //method sets position and other logic
  void position(float x, float y) {
    //set position of button with arguments passed into the function method
    pos.set(x, y);
    //if global mouse seletor is in circle of size of button set selected to true and change fill
    if (pos.dist(sel)<size) {
      if (mode=="Save\nas\nPNG") {
        p.mode="asdf";
      }
      selected = true;
      fill(100);
    } else {
      selected = false;
      fill(255);
    }
    //if draw current mode is this buttons mode then keep the fill changed
    if (p.mode==mode) {
      fill(100);
    }
    //circle button size at postions
    circle(pos.x, pos.y, size);
    //text of name of the mode of the button
    textSize(13);
    text(mode, pos.x-10, pos.y+21);
  }
  //method activates the button
  void activate() {
    //eraser and undo and save are special
    if (selected) {
      if (mode == "clear") {
        p.erase();
      } else if (mode == "undo") {
        p.undo();
      } else if (mode == "Save\nas\nPNG") {
        saving = true;
        println("a");
      } else {
        p.mode = mode;
      }
    }
  }
}

class Selector {
  //pvector of line controlling color/size
  PVector a = new PVector(0, 0);
  //pvector of circle on line
  PVector circle = new PVector(0, 0);
  //boolean checking if automatically changes
  boolean gradient = false;
  //boolean checking if dragging
  boolean dragging = false;
  boolean selected = false;
  //check previous width
  int prev = width;
  //mode of this selector
  String mode = "";
  Selector(float x, float y, String m) {
    updatePosition(x, y);
    mode = m;
  }

  void display(float x, float y,float speed) {
    if (prev!=width) {
      updatePosition(x, y);
    }
    if (mode=="size") {
      if (gradient) {
        circle.y = lerp(a.y, a.y+255, norm(sin(frameCount/speed), -1, 1));
        s=((map(sin(frameCount/speed), -1, 1, sizeRange1, sizeRange2)));
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
        if (dragging) {
          circle.set(a.x, constrain(sel.y, a.y, a.y+255));
          s=((map(circle.y, a.y, a.y+255, 4, 40)));
        }
      } else {
        selected = false;
      }
    } else if (mode=="color") {
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
        if (dragging) {
          circle.set(a.x, constrain(sel.y, a.y, a.y+255));
          c=(color(map(circle.y, a.y, a.y+255, colorRange1, colorRange2)));
        }
      } else {
        selected = false;
      }
    }
  }

  void changeColor() {
    if (circle.dist(sel)<24) {
      gradient = !gradient;
    }
  }
  void updatePosition(float x, float y) {
    a.set(x, y);
    prev = width;
    circle.set(x, y);
    c=0;
    s=4;
  }
}

class MenuButton {
  PVector pos = new PVector(0, 0);
  float size = 20;
  boolean selected = false;
  MenuButton() {
  }

  void position(float x, float y,boolean s) {
    pos.set(x, y);
    if (pos.dist(sel)<size) {
      fill(100);
      selected = true;
    } else {
      selected = false;
      fill(255);
    }
    if (s) {
      fill(100);
    }
    if(s&&selected){
      fill(200);
    }

    circle(pos.x, pos.y, size);
  }
}
