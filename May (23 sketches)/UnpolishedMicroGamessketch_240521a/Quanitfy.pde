class Quantify {

  int faces;
  PVector[] locations = new PVector[100];
  float gtime=0;
  boolean end = false;
  Quantify() {
    restart();
  }

  void update() {

    if (end) {
      fill(255);
      textSize(30);
      text("TIME: "+gtime+" Seconds", 200, 390);
      if (guess.value==faces+1) {
        text("correct guess there were "+(faces+1)+" faces", 200, 420);
      } else {
        text("wrong guess there were "+(faces+1)+" faces", 200, 420);
        text("you guessed: "+guess.value+" faces", 200, 450);
      }
      goTo.update(new PVector(488, 203), "UNPOLISH NEXT", -22, 159, 5, 6, "", sx, sy);
      restart.update(new PVector(100, 204), " RESTART", -22, 159, 6, 5, "", sx, sy);
    } else {
      fill(255);
      textSize(30);
      text("HOW MANY MOVING FACES ARE HERE?", 0, 780);
      guess.position(500, 740);
      goTo.update(new PVector(600, 740), "Enter Answer", -22, 159, 6, 100, "guess", sx, sy);
      if (frameCount%60==0) {
        gtime++;
      }
      if (frameCount%100==0) {
        locations[int(random(faces))] = new PVector(random(100, 600), random(100, 600));
      }
      fill(map(sin(frameCount/50.005), -1, 1, 200, 255), map(cos(frameCount/50.005), -1, 1, 200, 255), map(sin(frameCount/67.005), -1, 1, 100, 240));
      rect(100, 100, 600, 600);
      for (int i = 0; i<100; i++) {
        if (i>faces) {
          tint(255, map(sin(frameCount/random(60, 77.009)), -1, 1, 100, 200));
          image(distraction, locations[i].x, locations[i].y);
        } else {
          tint(255, map(sin(frameCount/random(70, 77.009)), -1, 1, 190, 200));
          image(face, locations[i].x+10*sin(frameCount/9.009), locations[i].y, 70, 70);
        }
      }
    }
  }

  void restart() {
    end = false;
    gtime=0;
    faces = int(random(30));
    reset();
  }
  void reset() {
    for (int i = 0; i<100; i++) {
      locations[i] = new PVector(random(100, 600), random(100, 600));
    }
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
  NumberArea() {
    //initialize array of saved values
    for ( int i= 0; i<20; i++) {
      saved[0]="";
    }
    text = "";
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
    textSize(15);

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
//typing only integers
void numberIntTyping(NumberArea area) {
  if (collision(area.pos, area.w, area.h)) {
    //reset initial values on keypress
    if (keyPressed) {
      if (area.init==true) {
        area.init = false;
        area.text="";
      }

      if (area.text.length()>9) {
        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
          }
        } else {
          area.text="";
          area.increment = 0;
        }
      } else {

        if (key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'
          ||key=='9'||key=='0') {
          area.text+=key;
          area.increment++;
          area.saved[area.increment]=area.text;
        }
        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
          }
        }
      }
    }
  }
}
