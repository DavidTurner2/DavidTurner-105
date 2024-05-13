//drawing object
Draw p = new Draw();
//pvector for mouse selctor
PVector sel = new PVector(0, 0);
//create button objects
Button erase = new Button("clear");
Button eraser = new Button("eraser");
Button normal = new Button("normal");
Button glitch = new Button("glitch");
Button tangent = new Button("tangent");
Button rectangle = new Button("rect");
Button ellipse = new Button("ellipse");
Button undo = new Button("undo");
Button redo = new Button("redo");
Button menu = new Button("menu");

Button sine = new Button("sine");
Button WD = new Button("WD");
//create selector objects that change color/size
int h = 800;
int w = 800;
ColorSelector cs = new ColorSelector(w/1.03, h/14.81);
SizeSelector ss = new SizeSelector(w/1.03, h/2.5);
//image variables for cursors
PImage wingDing;
PImage pencil;
PImage pencil2;

boolean stop = false;
PFont font;
PFont wingdings;
//curent color
color c = 0;
//speed
float speed = 50.049;
//current size
float s = 4;
float amplitude = random(10, 30);
PVector sinePos = new PVector(0, 0);
PVector sinePos2 = new PVector(0, 0);
int lengthOfSine = 100;
int sineSpace = 1;
float sineOffset = 0;
boolean adjust = false;
//code runs at setup
void setup() {
  //load images
  wingDing = loadImage("WD.png");
  pencil = loadImage("Pencil.png");
  pencil2 = loadImage("Pencil2.png");
  wingdings = loadFont("Wingdings-Regular-48.vlw");
  font = loadFont("VCROSDMono-48.vlw");
  //size 800,800
  size(800,800);

 // windowResizable(true); 
  //stroke cap project
  strokeCap(PROJECT);
 
}
//background color variable
color bgc;
//code runs every frame
void draw() {
  if (frameCount%15==0&&adjust==false) {
    amplitude = random(10, 30);
  }
  //set selector to mouse x and mouse y
  sel.set(mouseX, mouseY);
  //set bgc to variable
  bgc = color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
  //set bgc to bgc variable
  background(bgc);

  //push matrix so transformations/scale/rotations dont affect the code below
  pushMatrix();
  stroke(0);
  //rotate slightly in center
  translate(500, 500);
  rotate(0.01*sin(2*frameCount/99.009));

  translate(-500, -500);
  //run pixelcolor method for displaying lines
  p.pixelColor(c, s);
  //displaying cursors
  if (p.mode=="normal") {
    //show image of pencil
    image(pencil, sel.x-10, sel.y-40, 50, 50);
  }
  if (p.mode=="glitch") {
    //show image of pencil
    tint(map(sin(frameCount/49.009), -1, 1, 100, 255), map(cos(frameCount/59.009), -1, 1, 100, 255), map(cos(1-frameCount/29.009), -1, 1, 100, 255), map(sin(frameCount/10.009), -1, 1, 200, 255));
    image(pencil2, sel.x-10, sel.y-40, 50, 50);
  }
  if (p.mode=="eraser") {
    //show red square as eraser
    rectMode(CENTER);
    strokeWeight(1);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    square(sel.x, sel.y, s);
  }
  if (p.mode=="WD") {
    image(wingDing, sel.x-10, sel.y-40, 50, 50);
  }
  if (p.mode=="sine") {
    stroke(c);
    strokeWeight(s);
    if (adjust) {
      lengthOfSine = int(map(constrain(sel.x, sinePos.x, sinePos.x+w), sinePos.x, sinePos.x+w, 5, w));
      for (int i = 0; i<lengthOfSine; i++) {
        line(sinePos.x+i*sineSpace, sinePos.y+amplitude*sin(i/9.009+sineOffset), sinePos2.x+i*sineSpace, sinePos2.y+amplitude*sin(i/9.009+sineOffset));
      }
    } else {
      sineOffset+=0.075;
      for (int i = 0; i<lengthOfSine; i++) {
        sinePos.set(mouseX, mouseY);
        sinePos2.set(pmouseX, pmouseY);
        line(mouseX+i*sineSpace, mouseY+amplitude*sin(i/9.009+sineOffset), pmouseX+i*sineSpace, pmouseY+amplitude*sin(i/9.009+sineOffset));
      }
    }
  }
  noStroke();
  rectMode(CORNER);
  //border color
  fill(0, 255*(1/cos(frameCount/89.09)), 255*(1/tan(frameCount/89.09)));
  //borders
  rect(0, -h/11.43, w+-17, h/6.8);
  rect(w/1.07, -90, w/6.7, 9202);
  rect(-w/14.03, 0, w/6.4, 9202);
  rect(0, h/1.07, 9202, 120);
  //text
  fill(255, 200*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
  textFont(font, 40+20*abs(sin(5 *frameCount/99.09)));
  text("GLITCH PIX", w/2.7586+20*-abs(sin(5*frameCount/99.09)), h/17.77);

  //display color selector and size selector objects
  cs.display();
  ss.display();
  popMatrix();
  //put button objects at positions position method takes two numbers
  erase.position(19, 758);
  eraser.position(18, 571);
  normal.position(17, 340);
  glitch.position(15, 476);
  tangent.position(12, 404);
  rectangle.position(13, 195);
  ellipse.position(13, 129);
  undo.position(22, 662);
  if (mousePressed) {
    undo.activate();
  }

  sine.position(21, 265);
  WD.position(26, 55);
}

//code runs when mouse is clicked
void mouseClicked() {


  cs.changeColor();
  ss.changeColor();
  erase.activate();
  eraser.activate();
  normal.activate();
  glitch.activate();
  rectangle.activate();
  ellipse.activate();
  WD.activate();
  if (p.mode=="tangent") {
    //p.trig(c, s,sinePos,sinePos2,amplitude,int(sel.x));
  }
  tangent.activate();


  sine.activate();

}
//code runs when mouse is dragged
void mouseDragged() {


  if (p.mode=="glitch"&&stop==false) {
    p.draw = true;
  }
  if (cs.selected==true) {
    cs.dragging = true;
    stop = true;
  }
  if (ss.selected==true) {
    ss.dragging = true;
    stop = true;
  }
  if (p.mode=="sine"&&cs.dragging==false&&ss.dragging==false) {
    //p.trig(c, s);
    adjust=true;
  }
}
//code runs when mouse is pressed
void mousePressed() {
  if (!(p.mode=="glitch")) {
    p.draw = true;
  }
}
//code runs when mouse is released
void mouseReleased() {
  if (p.mode=="sine"&&cs.dragging==false) {
    p.trig(c, s, sinePos, sinePos2, amplitude, lengthOfSine, sineSpace, sineOffset);
  }
  adjust=false;
  stop = false;
  p.draw = false;
  p.fix();
  cs.dragging = false;
  ss.dragging = false;
}
//code runs when key is pressed
void keyPressed() {

  p.mode = "u";
}
