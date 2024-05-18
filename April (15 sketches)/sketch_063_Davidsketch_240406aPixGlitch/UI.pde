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
  //method sets position and other things
  void position(float x, float y) {
    //set position of button with arguments passed into the function method
    pos.set(x, y);
    //if global mouse seletor is in circle of size of button set selected to true and change fill
    if (pos.dist(sel)<size) {
      selected = true;
      if (mode=="Save\nas\nPNG") {
        p.mode="normal";
      }
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
      if (!button.isPlaying()&&!(mode=="undo"||mode=="redo")) {
        button.play(1);
      }
      if (mode == "clear") {
        if (!vanish.isPlaying()) {
          vanish.play(random(0.8, 1.2));
        }
        p.erase();
      } else if (mode == "undo") {
        if (!undoing.isPlaying()&&p.order.size()>0) {
          undoing.play(random(0.8, 1.2));
        }
        p.undo();
      } else if (mode == "redo") {
        if (!redoing.isPlaying()&&p.redo.size()>2) {
          redoing.play(4);
        }
        p.redo();
      } else if (mode=="default") {
        lerpSpeed.reset();
        trigSpace.reset();
        trigAmp1.reset();
        trigAmp2.reset();
        sizeRange1.reset();
        sizeRange2.reset();
        colorRange1.reset();
        colorRange2.reset();
        csSpeed.reset();
        ssSpeed.reset();
        wd.reset();
      } else if (mode == "Save\nas\nPNG") {
        export.play(1);
        saving = true;
        println("saved");
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

  void display(float x, float y) {
    if (prev!=width) {
      updatePosition(x, y);
    }
    if (mode=="size") {
      if (gradient) {
        circle.y = lerp(a.y, a.y+255, norm(sin(frameCount/ssSpeed.value), -1, 1));
        s=((map(sin(frameCount/ssSpeed.value), -1, 1, sizeRange1.value, sizeRange2.value)));
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
          s=((map(circle.y, a.y, a.y+255, sizeRange1.value, sizeRange2.value)));
        }
      } else {
        selected = false;
      }
    } else if (mode=="color") {
      if (gradient) {
        circle.y = lerp(a.y, a.y+255, norm(sin(frameCount/csSpeed.value), -1, 1));
        c=(color(255*norm(sin(frameCount/csSpeed.value), -1, 1)));
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
          c=(color(map(circle.y, a.y, a.y+255, colorRange1.value, colorRange2.value)));
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
  boolean activated = false;
  String mode = "";
  MenuButton(String a) {
    mode=a;
  }

  void position(float x, float y) {
    pos.set(x, y);
    if (pos.dist(sel)<size) {
      fill(100);
      selected = true;
    } else {
      selected = false;
      fill(255);
    }
    if (activated) {
      fill(100);
    }
    if (activated&&selected) {
      fill(200);
    }
    noStroke();
    circle(pos.x, pos.y, size);
    text(mode, pos.x-10, pos.y+21);
  }

  void activate() {
    if (selected) {
      button.play(1);
      activated = !activated;
    }
  }
}

class ColorArea {
  PVector pos = new PVector(0, 0);
  float w = 90;
  float h = 40;
  String text = "";
  color col;
  int increment = 0;
  //initialize array of saved values
  String[] saved = new String[7];
  ColorArea(String a) {
    //initialize array of saved values
    for ( int i= 0; i<7; i++) {
      saved[0]="";
    }
    text = a;
  }
  //method sets position and other logic
  void position(float x, float y) {
    pos.set(x, y);
    //text length is less than 6
    if (text.length()<6) {
      //set fill to white
      fill(255);
    } else {
      //if the text is enough for a hex set fill to hex
      fill(unhex("FF"+text));
    }
    //rectangle areaa
    noStroke();
    textFont(font, 20);

    rect(pos.x, pos.y, w, h);
    strokeWeight(1);

    //text length is less than 6
    if (text.length()<6) {
      //set fill to black
      fill(0);
      //black blink line
      stroke(0, 255*1/sin(frameCount/10.034));
      col = #FFFFFF;
    } else {
      col = unhex("FF"+text);
      //check if color is dark and switch to white text and stroke for blinking line
      if (red(col)<130&&green(col)<130&&blue(col)<130) {
        fill(255);
        stroke(255, 255*1/sin(frameCount/10.034));
      } else {
        fill(0);
        stroke(0, 255*1/sin(frameCount/10.034));
      }
    }
    //blinking line for typing
    if (collision(pos, w, h)) {
      line(pos.x+1+textWidth(" " +text), pos.y, pos.x+1+textWidth(" " +text), pos.y+30);
    }

    //display text but seperate the hashtag
    text(" " +text, pos.x+2, pos.y+25);
    text("#", pos.x+2, pos.y+25);
  }
}


class NumberArea {
  PVector pos = new PVector(0, 0);
  float w = 90;
  float h = 40;
  String text = "";
  float value = 0;
  int increment = 0;
  float prev;
  //initialize array of saved values
  String[] saved = new String[20];
  boolean init = false;
  NumberArea(float x) {
    //initialize array of saved values
    for ( int i= 0; i<20; i++) {
      saved[0]="";
    }
    prev = x;
    value = x;
    text = ""+x;
    init = true;
  }
  //method sets position and other logic
  void position(float x, float y) {
    pos.set(x, y);
    //rectangle areaa
    noStroke();
    fill(255);

    rect(pos.x, pos.y, w, h);
    strokeWeight(1);

    //text length is less than 6
    if (float(text)>0) {
      value = float(text);
    }
    fill(0);

    stroke(0, 255*1/sin(frameCount/10.034));


    //blinking line for typing
    textFont(font, 15);

    if (collision(pos, w, h)) {
      line(pos.x+1+textWidth(text), pos.y, pos.x+1+textWidth(text), pos.y+30);
    }

    //display text but seperate the hashtag
    text(text, pos.x+2, pos.y+25);
  }
  void reset() {
    init = true;
    increment = 0;
    value=prev;
    text = ""+prev;
  }
}

class TextArea {
  PVector pos = new PVector(0, 0);
  float w = 90;
  float h = 40;
  String text = "";
  int increment = 0;
  String prev;
  //initialize array of saved values
  String[] saved = new String[20];
  TextArea(String x) {
    //initialize array of saved values
    for ( int i= 0; i<20; i++) {
      saved[0]="";
    }
    prev = x;
    text = x;
  }
  //method sets position and other logic
  void position(float x, float y) {
    pos.set(x, y);
    //rectangle areaa
    noStroke();
    fill(255);

    rect(pos.x, pos.y, w, h);
    strokeWeight(1);


    fill(0);

    stroke(0, 255*1/sin(frameCount/10.034));


    //blinking line for typing
    textFont(wingdings, 15);

    if (collision(pos, w, h)) {
      line(pos.x+1+textWidth(text), pos.y, pos.x+1+textWidth(text), pos.y+30);
    }

    //display text but seperate the hashtag
    text(text, pos.x+2, pos.y+25);
  }
  void reset() {
    increment = 0;
    text = prev;
  }
}
