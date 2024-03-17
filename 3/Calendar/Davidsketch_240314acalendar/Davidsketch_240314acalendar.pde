PFont font;
void setup() {
  font = loadFont("Wingdings-Regular-48.vlw");
  //textFont(font, 25);
  size(100, 200);
}
int spacing = 150;
int spacing2 = 10;
void draw() {
  println(month());
  background(0);
  text(year(), 10, 30);
  translate((month()-1)*-spacing, -mouseY-100);
  for (int i = 1; i<32; i++) {
    text("JAN.\n "+i, spacing2+0, 0+i* spacing/2);
  }
  if ((year() % 400 == 0) ||(year() % 100 > 1) && (year() % 4 == 0)) {
    for (int i = 1; i<30; i++) {
      text("FEB.\n "+i, spacing2+ spacing, 0+i* spacing/2);
    }
    for (int i = 1; i<32; i++) {
      text("MAR.\n "+i, spacing2+2*spacing, 0+i* spacing/2);
      text("MAY.\n "+i, spacing2+4*spacing, 0+i* spacing/2);
      text("JUL.\n "+i, spacing2+ 6*spacing, 0+i* spacing/2);
    }
    for (int i = 1; i<31; i++) {
      text("APR.\n "+i, spacing2+ 3*spacing, 0+i* spacing/2);
      text("JUN.\n "+i, spacing2+5*spacing, 0+i* spacing/2);
    }
  } else {
    for (int i = 1; i<29; i++) {
      text("February\n "+i, 30*spacing+i*spacing, 110);
    }
  }



  windowResize(spacing, (-2+spacing/2)*(day()+1));
}
