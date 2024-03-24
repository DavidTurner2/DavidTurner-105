PFont font;

void setup() {
  font = loadFont("Wingdings-Regular-48.vlw");
}
void settings(){
    size(displayWidth, displayHeight);
}

void draw() {
  int spacing = 150;
 // textFont(font, spacing/8);
  int spacing2 = 10;
  background(0);
  text(year(), 10, 30);
 //translate(-frameCount, 0);
  for (int i = 1; i<32; i++) {
    text("JAN.\n "+i, spacing2+0, 0+i* spacing/2);
  }
  if ((year() % 400 == 0) ||(year() % 100 > 1) && (year() % 4 == 0)) {
    for (int i = 1; i<30; i++) {
      text("FEB.\n "+i, spacing2+ spacing, 100+i* spacing/2);
    }
    for (int i = 1; i<32; i++) {
      text("MAR.\n "+i, spacing2+2*spacing, 100+i* spacing/2);
      text("MAY.\n "+i, spacing2+4*spacing, 100+i* spacing/2);
      text("JUL.\n "+i, spacing2+ 6*spacing, 100+i* spacing/2);
    }
    for (int i = 1; i<31; i++) {
      text("APR.\n "+i, spacing2+ 3*spacing, 100+i* spacing/2);
      text("JUN.\n "+i, spacing2+5*spacing, 100+i* spacing/2);
    }
  } else {
    for (int i = 1; i<29; i++) {
      text("February\n "+i, 30*spacing+i*spacing, 110);
    }
  }

  //windowResize(200,200);
  //windowMove(frameCount, 0);
}
