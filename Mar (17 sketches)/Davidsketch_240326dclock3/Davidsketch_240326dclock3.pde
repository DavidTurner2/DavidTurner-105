//create gloabal varibale font
PFont font;
//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //load font from data folder and assign it to font variable
  font = loadFont("Wingdings-Regular-48.vlw");
  //set stroke weight to 1.4
  strokeWeight(1.4);
}
float step = 0;
float step2 = 0;

//code runs everyframe
void draw() {
  //set background to black
  background(0);
  //make text bigger
  textFont(font, 100);
  //from midnight to midday the fill lerp to colors and from midday to midnight the fill lerp to different color
  if (total(minute())<=720) {
    fill(lerpColor(#9744db, #e8ec4f, norm(total(minute()), 0, 720)));
  } else {
    fill(lerpColor(#e8ec4f, #421010, norm(total(minute()), 720, 1400)));
  }
  //every even second go up every odd second go down using easing function and step variables
  if (second()%2==0) {
    step+=0.017;
    step2 = 0;
    text("6", 530, lerp(750, 125, ((float)easeInOutBack(constrain(step, 0, 1)))));
  } else {
    step2+=0.017;
    step = 0;
    text("6", 530, lerp(125, 750, ((float)easeInOutBack(constrain(step2, 0, 1)))));
  }
  //make text font change sizes every second
  textFont(font, 20*map(cos(second()), -1, 1, 1, 2));
  //circling morning afternoon symbols
  for (int i = 0; i<60; i++) {
    fill(lerpColor(#9744db, #e8ec4f, norm(i, 0, 60)));
    text("am", 530+100*cos(millis()/120+i/10), 200+50*sin(millis()/120+i/10));
    fill(lerpColor(#e8ec4f, #421010, norm(i, 0, 60)));

    text("PM", 530+100*-cos(millis()/120+i/10), 600+50*-sin(millis()/120+i/10));
  }
  //change scale
  scale(0.497);
  //put white stroke
  stroke(255);
  //divides when its afternoon
  line(601, 25+720*1.0777, 200600, 25+720*1.0777);
  //bottom line
  line(-200, 25+1441*1.0777, 200600, 25+1441*1.0777);
  //turn off stroke
  noStroke();
  //changing color pillers rectangles
  fill(lerpColor(#f0f0f0, #e8ec4f, norm(sin(frameCount/99.009), -1, 1)));
  rect(0, 22, 199, 1556);
  rect(601, 22, 199, 1556);
  //total amount of minutes in a day
  for (int i = 0; i<1440; i++) {
    //from midnight to midday the line lerp to colors and from midday to midnight the lines lerp to different color
    if (i<=720) {
      stroke(lerpColor(#9744db, #e8ec4f, norm(i, 0, 720)));
    } else {
      stroke(lerpColor(#e8ec4f, #421010, norm(i, 720, 1400)));
    }
    //every second the line gets longer until a new minute and every minute a new line is added to the bottom of that line
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

//easing function from easings.net
double easeInOutBack(float x) {
  float c1 = 1.70158;
  float c3 = c1 + 1;

  return 1 + c3 * Math.pow(x - 1, 3) + c1 * Math.pow(x - 1, 2);
}
