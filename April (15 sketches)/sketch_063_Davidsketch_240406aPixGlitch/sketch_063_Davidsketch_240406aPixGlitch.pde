//import sound library
import processing.sound.*;
//create soundfile variables
SoundFile drawing;
SoundFile glitching;
SoundFile undoing;
SoundFile redoing;
SoundFile plot;
SoundFile eplot;
SoundFile trigPlot;
SoundFile button;
SoundFile secr;
SoundFile vanish;
SoundFile export;



Draw p = new Draw();
//pvector for mouse selctor
PVector sel = new PVector(0, 0);
//create button objects
Button erase = new Button("clear");
Button eraser = new Button("eraser");
Button normal = new Button("normal");
Button glitch = new Button("glitch");
Button glitch2 = new Button("glitch2");
Button tangent = new Button("tangent");
Button rectangle = new Button("rect");
Button ellipse = new Button("ellipse");
Button undo = new Button("undo");
Button redo = new Button("redo");
Button sine = new Button("sine");
Button vsine = new Button("v.sine");
Button vtangent = new Button("v.tan");

Button WD = new Button("WD");
Button save = new Button("Save\nas\nPNG");
MenuButton col = new MenuButton("BG\nColor");
//create selector objects that change color/size
Selector cs = new Selector(width/1.03, height/14.81, "color");
Selector ss = new Selector(width/1.03, height/2.5, "size");
//secret button
PVector secret;
//secret button width and height
float secretw;
float secreth;

boolean saving = false;
//image variables for cursors
PImage wingDing;
PImage pencil;
PImage pencil2;
//variable to check if started drawing
boolean startedDrawing = false;
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
//offset for sine and tangent
float sineOffset = 0;
//length of rectanfgle
float wide = 100;
//height of rectangle
float high = 100;
boolean adjust = false;
//value for allowing sine and tangent to be released on right most border
boolean pass = false;
//pass vertical s n t borttom
boolean pass2 = false;
boolean secretPlayed= false;
boolean menu = false;
float lerp = 0;
//secret menu buttons and areas variables
MenuButton hide = new MenuButton("Hide UI And Borders");
MenuButton slant = new MenuButton("");
MenuButton customCol = new MenuButton("");
NumberArea lerpSpeed = new NumberArea(0.01);
NumberArea trigSpace = new NumberArea(1);
NumberArea trigAmp1 = new NumberArea(10);
NumberArea trigAmp2 = new NumberArea(30);
NumberArea sizeRange1 = new NumberArea(4);
NumberArea sizeRange2 = new NumberArea(40);
NumberArea colorRange1 = new NumberArea(0);
NumberArea colorRange2 = new NumberArea(255);
NumberArea csSpeed = new NumberArea(50.049);
NumberArea ssSpeed = new NumberArea(50.049);
TextArea wd = new TextArea("");
Button reset = new Button("default");

ColorArea bgc1[] = {new ColorArea("FF0000"), new ColorArea("00FF00"), new ColorArea("550000"),
  new ColorArea("FFFFFF"), new ColorArea("222222")};

//code runs at setup
void setup() {
  eplot= new SoundFile(this, "ball.wav");
  export = new SoundFile(this,"save.wav");
  drawing= new SoundFile(this, "drawn.wav");
  glitching= new SoundFile(this, "glitchy.wav");
  undoing= new SoundFile(this, "spin.wav");
  redoing= new SoundFile(this, "redoing.wav");
  plot= new SoundFile(this, "plot.wav");
  trigPlot= new SoundFile(this, "musicplace.wav");
  button= new SoundFile(this, "buttonPress.wav");
  secr= new SoundFile(this, "secret.wav");
  vanish= new SoundFile(this, "vae.wav");



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
  if (wd.text=="") {
    wing = p.abc[int(random(p.abc.length))];
  } else {
    wing = wd.text;
  }
  //setting amplitudes
  if (frameCount%15==0&&adjust==false) {
    amplitude = random(trigAmp1.value, trigAmp2.value);
  }
  //set selector to mouse x and mouse y
  sel.set(mouseX, mouseY);
  //set bgc to variable
  if (customCol.activated) {
    lerp+=lerpSpeed.value;
    if (lerp<1) {
      bgc = lerpColor(bgc1[0].col, bgc1[1].col, lerp);
    } else if (lerp>1&&lerp<2) {
      bgc = lerpColor(bgc1[1].col, bgc1[2].col, map(lerp, 1, 2, 0, 1));
    } else if (lerp>2&&lerp<3) {
      bgc = lerpColor(bgc1[2].col, bgc1[3].col, map(lerp, 2, 3, 0, 1));
    } else if (lerp>3&&lerp<4) {
      bgc = lerpColor(bgc1[3].col, bgc1[4].col, map(lerp, 3, 4, 0, 1));
    } else if (lerp>4&&lerp<5) {
      bgc = lerpColor(bgc1[4].col, bgc1[0].col, map(lerp, 4, 5, 0, 1));
    } else {
      lerp = 0;
    }
  } else {
    bgc = color(255, 100*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
  }
  //append bgc if bg color button is active
  if (col.activated) {
    c = bgc;
  }
  //set bgc to bgc variable
  background(bgc);
  if (menu) {
    stop = true;
    noStroke();
    fill(140);
    rect(0, 0, width, height);
    reset.position(40, 760);
    if (customCol.activated) {
      for (int i = 0; i<bgc1.length; i++) {
        bgc1[i].position(width/1.6, height/3.2+i*50);
      }
      lerpSpeed.position(width/1.2903225806451613, height/4);
      textFont(font, 20);
      text("Lerp Speed", width/1.6, height/3.5782608695652173);
    }
    fill(0);
    textFont(font, 40+10);
    text("GLITCH PIX", width/2.7586-20, height/17.77);
    textFont(font, 20);
    text("Custom Background Lerp", width/1.6, height/4);
    text("Trigonometry Spacing", width/40, height/3.2);
    text("Slanted Trigonometry", width/40, height/4);
    text("Trigonometry Amplitude Range", width/40, 300);
    text("Size Selector Range", width/40, height/2.051282051282051);
    text("Size Selector Speed", width/40, height/1.6);
    text("Color Selector Range", width/40, height/1.4814814814814814);
    text("Color Selector Speed", width/40, height/1.2698412698412698);
    text("WD TEXT (LEAVE BLANK FOR RANDOM)", width/40, 680);
    wd.position(width/40, height/1.1594202898550725);
    trigAmp1.position(width/40, height/2.5806451612903225);
    trigAmp2.position(width/4, height/2.5806451612903225);
    sizeRange1.position(width/40, height/2);
    sizeRange2.position(width/4, height/2);
    colorRange1.position(width/40, height/1.4545454545454546);
    colorRange2.position(width/4, height/1.4545454545454546);
    csSpeed.position(width/3.076923076923077, height/1.322314049586777);
    ssSpeed.position(width/3.2, height/1.7582417582417582);
    trigSpace.position(width/3.076923076923077, height/3.5555555555555554);
    slant.position(width/2.96296296296, height/4.2105263157894735);
    customCol.position(width/1.0389610389610389, height/4.2105263157894735);
    hide.position(width/5.714285714285714, height/1.0526315789473684);
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
      //glitch cursors
      if (p.mode=="glitch"||p.mode=="glitch2") {
        //show image of pencil
        tint(map(sin(frameCount/49.009), -1, 1, 100, 255), map(cos(frameCount/59.009), -1, 1, 100, 255), map(cos(1-frameCount/29.009), -1, 1, 100, 255), map(sin(frameCount/10.009), -1, 1, 200, 255));
        image(pencil2, sel.x-10, sel.y-40, 50, 50);
      }
      //eraser cursor
      if (p.mode=="eraser") {
        //show red square as eraser
        rectMode(CENTER);
        strokeWeight(1);
        stroke(255, 0, 0);
        fill(255, 0, 0);
        square(sel.x, sel.y, s);
      }
      //wing ding cursor
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
              if (slant.activated) {
                point(sinePos.x+i*trigSpace.value, sinePos.y+amplitude*sin(i/9.009+sineOffset)+i*map(sel.y, sinePos.y, sinePos.y+height, 1, 10));
              } else {
                point(sinePos.x+i*trigSpace.value, sinePos.y+amplitude*sin(i/9.009+sineOffset));
              }
            }
          } else {
            for (int i = 0; i<lengthOfSine; i++) {
              if (slant.activated) {
                point(sinePos.x+i*trigSpace.value, sinePos.y+amplitude*tan(i/9.009+sineOffset)+i*map(sel.y, sinePos.y, sinePos.y+height, 1, 10));
              } else {
                point(sinePos.x+i*trigSpace.value, sinePos.y+amplitude*tan(i/9.009+sineOffset));
              }
            }
          }
        } else {
          sineOffset+=0.075;
          if (p.mode=="sine") {
            for (int i = 0; i<lengthOfSine; i++) {
              sinePos.set(mouseX, mouseY);
              point(mouseX+i*trigSpace.value, mouseY+amplitude*sin(i/9.009+sineOffset));
            }
          } else {
            for (int i = 0; i<lengthOfSine; i++) {
              sinePos.set(mouseX, mouseY);
              point(mouseX+i*trigSpace.value, mouseY+amplitude*tan(i/9.009+sineOffset));
            }
          }
        }
      }
      //cursor for vertical sine tangent
      if (p.mode=="v.sine"||p.mode=="v.tan") {
        stroke(c);
        strokeWeight(s);
        if (adjust) {
          lengthOfSine = int(map(constrain(sel.y, sinePos.y, sinePos.y+height), sinePos.y, sinePos.y+height, 5, height));
          if (p.mode=="v.sine") {
            for (int i = 0; i<lengthOfSine; i++) {
              if (slant.activated) {
                point(sinePos.x+amplitude*sin(i/9.009+sineOffset)+i*map(sel.x, sinePos.x, sinePos.x+width, 1, 10), sinePos.y+i*trigSpace.value);
              } else {
                point(sinePos.x+amplitude*sin(i/9.009+sineOffset), sinePos.y+i*trigSpace.value);
              }
            }
          } else {
            for (int i = 0; i<lengthOfSine; i++) {
              if (slant.activated) {
                point(sinePos.x+amplitude*tan(i/9.009+sineOffset)+i*map(sel.x, sinePos.x, sinePos.x+width, 1, 10), sinePos.y+i*trigSpace.value);
              } else {
                point(sinePos.x+amplitude*tan(i/9.009+sineOffset), sinePos.y+i*trigSpace.value);
              }
            }
          }
        } else {
          sineOffset+=0.075;
          if (p.mode=="v.sine") {
            for (int i = 0; i<lengthOfSine; i++) {
              sinePos.set(mouseX, mouseY);
              point(mouseX+amplitude*sin(i/9.009+sineOffset), mouseY+i*trigSpace.value);
            }
          } else {
            for (int i = 0; i<lengthOfSine; i++) {
              sinePos.set(mouseX, mouseY);
              point(mouseX+amplitude*tan(i/9.009+sineOffset), mouseY+i*trigSpace.value);
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
      if (hide.activated==false) {
        rect(r1.x, r1.y, r1w, r1h);
        rect(r2.x, r2.y, r2w, r2h);
        rect(r3.x, r3.y, r3w, r3h);
        rect(r4.x, r4.y, r4w, r4h);
      }
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
      //vertical sine bottom border
      pass2 =collision(r4, r4w, r4h);
      //text
      if (hide.activated==false) {

        fill(255, 200*(1/sin(frameCount/189.09)), 100*(1/cos(frameCount/189.09)));
      } else {
        fill(bgc);
      }
      textFont(font, 40+20*abs(sin(5 *frameCount/99.09)));
      text("GLITCH PIX", width/2.7586+20*-abs(sin(5*frameCount/99.09)), height/17.77);

      ellipseMode(CENTER);
      //display color selector and size selector objects
      if (hide.activated==false) {

        if (col.activated==false) {
          cs.display(width/1.03, height/14.81);
        }
        ss.display(width/1.03, height/2.5);
      }
      popMatrix();
      //put button objects at positions if not hidden
      if (hide.activated==false) {
        WD.position(width/40, height/14.54);
        ellipse.position(width/40, height/(14.54/1.9));
        rectangle.position(width/40, height/(14.54/2.9));
        vtangent.position(width/40, height/(14.54/3.8));
        sine.position(width/40, height/(14.54/4.7));
        vsine.position(width/40, height/(14.54/5.6));
        normal.position(width/40, height/(14.54/6.4));
        tangent.position(width/40, height/(14.54/7.2));
        glitch.position(width/40, height/(14.54/8.1));
        glitch2.position(width/40, height/(14.54/9.11));
        eraser.position(width/40, height/(14.54/10));
        undo.position(width/40, height/(14.54/11.01));
        redo.position(width/40, height/(14.54/12.01));
        erase.position(width/40, height/(14.54/13));
        //buttons on the right side
        col.position(width/1.03835324, height/(14.54/11.0));
        save.position(width/1.03835324, height/(14.54/12.5));
      }
      //fast undo and fast redo
      if (mousePressed) {       
        undo.activate();
        redo.activate();
      }
    }
  }
}


//collision function returns true if colloding returns false if not colliding
boolean collision(PVector a, float wide, float high) {
  if (sel.x>a.x&&sel.x<a.x+wide&&sel.y>a.y&&sel.y<a.y+high) {
    return true;
  } else {
    return false;
  }
}
//functionn for typing in hex codes in number area
void keyHandler(ColorArea area) {
  if (collision(area.pos, area.w, area.h)) {
    if (keyPressed) {
      if (area.text.length()==6) {
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
        if (key=='a'||key=='A'||key=='b'||key=='B'||key=='c'||key=='C'||key=='d'||key=='D'||key=='e'||key=='E'||key=='f'||key=='F') {
          area.text+=(""+key).toUpperCase();
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

//function for typing in numbers in number area
void numberTyping(NumberArea area) {
  if (collision(area.pos, area.w, area.h)) {
    if (keyPressed) {
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
          ||key=='9'||key=='0'||key=='.') {
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

void textTyping(TextArea area) {
  if (collision(area.pos, area.w, area.h)) {
    if (keyPressed) {
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


        if (key==unhex("0008")) {
          if (area.increment>0) {
            area.increment--;
            area.text = area.saved[area.increment];
          }
        } else {
          area.text+=key;
          area.increment++;
          area.saved[area.increment]=area.text;
        }
      }
    }
  }
}
