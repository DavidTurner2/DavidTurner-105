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
Button sine = new Button("sine");
Button WD = new Button("WD");
Button save = new Button("Save\nas\nPNG");
MenuButton slant = new MenuButton();

//create selector objects that change color/size
Selector cs = new Selector(width/1.03, height/14.81, "color");
Selector ss = new Selector(width/1.03, height/2.5, "size");

PVector secret;
float secretw;
float secreth;

boolean saving = false;
//image variables for cursors
PImage wingDing;
PImage pencil;
PImage pencil2;
//varibale to check if to stop drawing
boolean stop = false;
//regular text font
PFont font;
//pfont for wingdings
PFont wingdings;
//curent color
color c = 0;
//speed for going up and down of selectors
//current size
float s = 4;
//amplitude for trigonemetric
float amplitude = random(10, 30);
//position for sine and tangent and rectangles need to change name
PVector sinePos = new PVector(0, 0);
//length of sine and tangent
int lengthOfSine = 100;
//spacing for sine and tangent
int sineSpace = 1;
//offset for sine and tangent
float sineOffset = 0;
//length of rectanfgle
float wide = 100;
//height of rectangle
float high = 100;
boolean adjust = false;
//value for allowing sine and recatangles to be released on right most border
boolean pass = false;
boolean menu = true;
//secret menu variables
//if slanted
boolean slanted = false;
boolean vertical = false;
boolean appendbgc = false;
boolean lerpBgc = true;
float lerp = 0;
int ampRange1 = 10;
int ampRange2 = 30;
float csSpeed = 50.049;
float ssSpeed = 50.049;
int colorRange1 = 0;
int colorRange2 = 255;
int sizeRange1 = 4;
int sizeRange2 = 40;


//bgclerping
color[] bgcLerp ={#ff0000, #00ff00, #660000, #ffffff, #000000};
//code runs at setup
void setup() {
  //load images
  wingDing = loadImage("WD.png");
  pencil = loadImage("Pencil.png");
  pencil2 = loadImage("Pencil2.png");
  wingdings = loadFont("Wingdings-Regular-48.vlw");
  font = loadFont("VCROSDMono-48.vlw");
  //size 800,800
  size(800, 800);
  //set window to resizable
  windowResizable(true);
  //stroke cap project
  strokeCap(PROJECT);
}
//background color variable
color bgc;
String wing;
//code runs every frame
void draw() {
  secret = new PVector(width/2.91, -height/11.17);
  secretw = width/2.37;
  secreth = height/6.8;
  //setting wing dings
  wing = p.abc[int(random(p.abc.length-1))];
  //setting amplitudes
  if (frameCount%15==0&&adjust==false) {
    amplitude = random(10, 30);
  }
  //set selector to mouse x and mouse y
  sel.set(mouseX, mouseY);
  //set bgc to variable
  if (lerpBgc) {
    lerp+=0.01;
    if (lerp<1) {
      bgc = lerpColor(bgcLerp[0], bgcLerp[1], lerp);
    } else if (lerp>1&&lerp<2) {
      bgc = lerpColor(bgcLerp[1], bgcLerp[2], map(lerp, 1, 2, 0, 1));
    } else if (lerp>2&&lerp<3) {
      bgc = lerpColor(bgcLerp[2], bgcLerp[3], map(lerp, 2, 3, 0, 1));
    } else if (lerp>3&&lerp<4) {
      bgc = lerpColor(bgcLerp[3], bgcLerp[4], map(lerp, 3, 4, 0, 1));
    }else if (lerp>4&&lerp<5){
      bgc = lerpColor(bgcLerp[4], bgcLerp[0], map(lerp, 4, 5, 0, 1));
    }else{
      lerp = 0;
    }
  } else {
    bgc = color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
  }
  //set bgc to bgc variable
  background(bgc);
  if (menu) {
    noStroke();
    fill(240);
    rect(0, 0, width, height);
    fill(0);
    textFont(font, 40+10);
    text("GLITCH PIX", width/2.7586-20, height/17.77);
    textFont(font, 20);
    text("Background", 400, 300);
    text("color=bgc", 200, 400);
    text("vertical sine", 100, 350);
    text("slanted trigonometry", 100, 300);
    slant.position(100, 330, slanted);
  } else {
    //save as png by getting rid of borders and buttons and cursors and just show the drawing
    if (saving) {
      pushMatrix();
      stroke(0);
      //rotate slightly in center
      translate(500, 500);
      rotate(0.01*sin(2*frameCount/99.009));
      translate(-500, -500);

      rectMode(CORNER);
      ellipseMode(CORNER);
      //run pixelcolor method for displaying lines
      p.pixelColor(c, s);
      save(this+".png");
      saving=false;
      popMatrix();
    } else {

      //push matrix so transformations/scale/rotations dont affect the code below
      pushMatrix();
      stroke(0);
      //rotate slightly in center
      translate(500, 500);
      rotate(0.01*sin(2*frameCount/99.009));
      translate(-500, -500);

      //run pixelcolor method for displaying lines
      rectMode(CORNER);
      ellipseMode(CORNER);
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
      //cursor for sine/tangent
      if (p.mode=="sine"||p.mode=="tangent") {
        stroke(c);
        strokeWeight(s);
        if (adjust) {
          lengthOfSine = int(map(constrain(sel.x, sinePos.x, sinePos.x+width), sinePos.x, sinePos.x+width, 5, width));
          if (p.mode=="sine") {
            for (int i = 0; i<lengthOfSine; i++) {
              if (slanted) {
                point(sinePos.x+i*sineSpace, sinePos.y+amplitude*sin(i/9.009+sineOffset)+i*map(sel.y, sinePos.y, sinePos.y+height, 1, 10));
              } else {
                point(sinePos.x+i*sineSpace, sinePos.y+amplitude*sin(i/9.009+sineOffset));
              }
            }
          } else {
            for (int i = 0; i<lengthOfSine; i++) {
              if (slanted) {
                point(sinePos.x+i*sineSpace, sinePos.y+amplitude*tan(i/9.009+sineOffset)+i*map(sel.y, sinePos.y, sinePos.y+height, 1, 10));
              } else {
                point(sinePos.x+i*sineSpace, sinePos.y+amplitude*tan(i/9.009+sineOffset));
              }
            }
          }
        } else {
          sineOffset+=0.075;
          if (p.mode=="sine") {
            for (int i = 0; i<lengthOfSine; i++) {
              sinePos.set(mouseX, mouseY);
              point(mouseX+i*sineSpace, mouseY+amplitude*sin(i/9.009+sineOffset));
            }
          } else {
            for (int i = 0; i<lengthOfSine; i++) {
              sinePos.set(mouseX, mouseY);
              point(mouseX+i*sineSpace, mouseY+amplitude*tan(i/9.009+sineOffset));
            }
          }
        }
      }
      //cursor for rectangles/ellipses
      if (p.mode=="rect"||p.mode=="ellipse") {
        stroke(c);
        strokeWeight(s);
        noFill();
        if (adjust) {
          wide = int(map(sel.x, sinePos.x, sinePos.x+width, 5, width));
          high = int(map(sel.y, sinePos.y, sinePos.y+height, 5, height));
          if (p.mode=="rect") {
            rect(sinePos.x, sinePos.y, wide, high);
          } else {
            ellipse(sinePos.x, sinePos.y, wide, high);
          }
        } else {
          sinePos.set(mouseX, mouseY);
          if (p.mode=="rect") {
            rect(sel.x, sel.y, wide, high);
          } else {
            ellipse(sel.x, sel.y, wide, high);
          }
        }
      }
      noStroke();
      rectMode(CORNER);
      //border color
      fill(0, 255*(1/cos(frameCount/89.09)), 255*(1/tan(frameCount/89.09)));
      //border pvecttors width and heights
      PVector r1 = new PVector(0, -height/11.43);
      float r1w = width+-17;
      float r1h = height/6.8;
      PVector r2 = new PVector(width/1.07, -90);
      float r2w = width/6.7;
      float r2h = 9202;
      PVector r3 = new PVector(-width/14.03, 0);
      float r3w = width/6.4;
      float r3h = 9202;
      PVector r4 = new PVector(0, height/1.07);
      float r4w = 9202;
      float r4h = 120;
      //borders
      rect(r1.x, r1.y, r1w, r1h);
      rect(r2.x, r2.y, r2w, r2h);
      rect(r3.x, r3.y, r3w, r3h);
      rect(r4.x, r4.y, r4w, r4h);
      //check if collided with borders set stop to true if collided with border
      //also check if not in bounds
      if (collision(r1, r1w, r1h)||collision(r2, r2w, r2h)
        ||collision(r3, r3w, r3h)||collision(r4, r4w, r4h)
        ||!(collision(new PVector(0, 0), width, height))) {
        stop=true;
      } else {
        stop = false;
      }
      //let sine be passed on the right border
      pass = collision(r2, r2w, r2h);

      //text
      fill(255, 200*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
      textFont(font, 40+20*abs(sin(5 *frameCount/99.09)));
      text("GLITCH PIX", width/2.7586+20*-abs(sin(5*frameCount/99.09)), height/17.77);

      ellipseMode(CENTER);
      //display color selector and size selector objects
      cs.display(width/1.03, height/14.81);
      ss.display(width/1.03, height/2.5);
      popMatrix();
      //put button objects at positions
      WD.position(width/40, height/14.54);
      ellipse.position(width/40, height/(14.54/2.3));
      rectangle.position(width/40, height/(14.54/3.5));
      sine.position(width/40, height/(14.54/4.7));
      normal.position(width/40, height/(14.54/6));
      tangent.position(width/40, height/(14.54/7.2));
      glitch.position(width/40, height/(14.54/8.5));
      eraser.position(width/40, height/(14.54/10));
      undo.position(width/40, height/(14.54/11.5));
      erase.position(width/40, height/(14.54/13));
      save.position(width/1.03435324, height/(14.54/11.5));

      if (mousePressed) {
        undo.activate();
      }
    }
  }
}

//code runs when mouse is clicked
void mouseClicked() {
  //activate clicking events on buttons and selectors
  cs.changeColor();
  ss.changeColor();
  erase.activate();
  eraser.activate();
  normal.activate();
  glitch.activate();
  rectangle.activate();
  ellipse.activate();
  WD.activate();
  tangent.activate();
  sine.activate();
  save.activate();
  if (collision(secret, secretw, secreth)) {
    menu=!menu;
  }

  if (slant.selected) {
    slanted=!slanted;
  }
}
//code runs when mouse is dragged
void mouseDragged() {
  //draw only when dragged for glitch
  if (p.mode=="glitch"&&stop==false) {
    p.draw = true;
  }
  //if selectors are selected and dragged
  if (cs.selected==true) {
    cs.dragging = true;
  }
  if (ss.selected==true) {
    ss.dragging = true;
  }
  //if mode requires adjustments
  if ((p.mode=="sine"||p.mode=="tangent"||p.mode=="rect"||p.mode=="ellipse")&&stop==false) {
    adjust=true;
  }
}
//code runs when mouse is pressed
void mousePressed() {
  if (!(p.mode=="glitch")&&stop==false) {
    p.draw = true;
  }
  if ((p.mode=="normal"||p.mode=="glitch"|| p.mode=="eraser")&&stop==false) {
    p.undo();
  }
}
//code runs when mouse is released
void mouseReleased() {
  //fixing any index errors

  //releasing rectangle
  if (p.mode=="rect"&&stop==false) {
    p.rectangle(c, s, sinePos, wide, high);
  }
  //releasing ellipse
  if (p.mode=="ellipse"&&stop==false) {
    p.ell(c, s, sinePos, wide, high);
  }
  //releasing sine waves
  if ((p.mode=="sine"||p.mode=="tangent")&&stop==false) {
    p.trig(c, s, sinePos, amplitude, lengthOfSine, sineSpace, sineOffset);
  } else if ((p.mode=="sine"||p.mode=="tangent")&&pass==true) {
    //let you release if colliding on the right most border
    p.trig(c, s, sinePos, amplitude, lengthOfSine, sineSpace, sineOffset);
  }
  //placing wingdings
  if (p.mode=="WD") {
    p.wd(c, map(s, 4, 40, 40, 80), sel);
  }
  //stop adjusting
  adjust=false;
  //make everything false
  stop = false;
  p.draw = false;
  p.fix();
  cs.dragging = false;
  ss.dragging = false;
}
//code runs when key is pressed
void keyPressed() {
  //println(int("123")+int("10"));
  if (key==unhex("0008")) {
    println("delete on mac");
  }
  //undo on z
  if (key =='z'||key=='Z') {
    p.undo();
  }
  //also undo on x
  if (key =='x'||key=='X') {
    p.undo();
  }
}

//collision function returns true if colloding returns false if not colliding
Boolean collision(PVector a, float wide, float high) {
  if (sel.x>a.x&&sel.x<a.x+wide&&sel.y>a.y&&sel.y<a.y+high) {
    return true;
  } else {
    return false;
  }
}
