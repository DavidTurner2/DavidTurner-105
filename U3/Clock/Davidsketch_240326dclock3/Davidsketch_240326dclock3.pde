PFont font;
void setup() {
  size(800, 800);
  font = loadFont("Wingdings-Regular-48.vlw");
  strokeWeight(1.4);
}

void draw() {
  background(0);
  textFont(font, 20*map(cos(second()), -1, 1, 1, 2));
  for (int i = 0; i<60; i++) {
    fill(lerpColor(#9744db, #e8ec4f, norm(i, 0, 60)));
    text("am", 530+100*cos(millis()/120+i/10), 200+50*sin(millis()/120+i/10));
    fill(lerpColor(#e8ec4f, #421010, norm(i, 0, 60)));

    text("PM", 530+100*-cos(millis()/120+i/10), 600+50*-sin(millis()/120+i/10));
  }

  scale(0.497);
  stroke(255);
  line(601, 25+720*1.0777, 200600, 25+720*1.0777);
  line(-200, 25+1441*1.0777, 200600, 25+1441*1.0777);
  line(-200, 25+-1*1.0777, 200600, 25+-1*1.0777);
  noStroke();
  fill(200);
  rect(0, 22, 199, 1556);
  rect(601, 22, 199, 1556);
  for (int i = 0; i<1440; i++) {
    if (i<=720) {
      stroke(lerpColor(#9744db, #e8ec4f, norm(i, 0, 720)));
    } else {
      stroke(lerpColor(#e8ec4f, #421010, norm(i, 720, 1400)));
    }
    if (i <= total(minute())) {
      if (i==total(minute())) {
        line(200, 25+i*1.0777, 200+6*second(), 25+i*1.0777);
      } else {
        line(200, 25+i*1.0777, 600, 25+i*1.0777);
      }
    }
  }
}
//returns total minutes in a day
int total(int m) {
  for (int i = 0; i<24; i++) {
    if (i == hour()) {
      return i*60+m;
    }
  }
  return m;
}
