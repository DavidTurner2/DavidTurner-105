Draw p = new Draw();
PVector sel = new PVector(0, 0);
Button erase = new Button(28, 766, "erase");
Button eraser = new Button(22, 676, "deleteLines");
Button normal = new Button(17, 599, "normal");
Button glitch = new Button(557, 772, "glitch");
Button oval = new Button(787, 706, "oval");
Button rectangle = new Button(758, 769, "rectangle");
Button sine = new Button(726, 770, "sine");
Button WD = new Button(408, 772, "WD");
ColorSelector cs = new ColorSelector(777, 54);
SizeSelector ss = new SizeSelector(777, 320);

//curent color
color c = 0;
float speed = 50.049;
float s = 40;

void setup() {
  size(800, 800);
  strokeCap(PROJECT);
}

color bgc;
void draw() {
  sel.set(mouseX, mouseY);
  bgc = color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
  background(bgc);


  pushMatrix();
  stroke(0);
  translate(500, 500);
  rotate(0.01*sin(2*frameCount/99.009));
  translate(-500, -500);

  p.pixelColor(c, s);
  noStroke();
  //border color
  fill(0, 255*(1/cos(frameCount/89.09)), 255*(1/tan(frameCount/89.09)));
  //borders
  rect(0, -70, 818, 120);
  rect(750, -90, 120, 1202);
  rect(-60, 0, 120, 1202);
  rect(0, 750, 1202, 120);
  //text
  fill(255, 200*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
  textSize(40+20*abs(sin(5 *frameCount/99.09)));
  text("GLITCH PIX", 290+20*-abs(sin(5*frameCount/99.09)), 45);
  cs.display();
  ss.display();
  popMatrix();
  erase.position();
  eraser.position();
  normal.position();
  glitch.position();
  oval.position();
  rectangle.position();
  sine.position();
  WD.position();
}


void mouseClicked() {
  cs.changeColor();
  ss.changeColor();

  erase.activate();
  eraser.activate();
  normal.activate();
  glitch.activate();
  oval.activate();
  rectangle.activate();
  sine.activate();
  WD.activate();
}
void mouseDragged() {
  if (p.mode=="glitch") {
    p.draw = true;
  }
}
void mousePressed() {
  if (!(p.mode=="glitch")) {
    p.draw = true;
  }
}
void mouseReleased() {
  p.draw = false;
  p.fix();
}

void keyPressed() {
  p.mode = "u";
}
