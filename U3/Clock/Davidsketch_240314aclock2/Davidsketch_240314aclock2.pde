PFont font;

void setup() {
  font = loadFont("Wingdings-Regular-48.vlw");
}
void settings() {
  size(displayWidth, displayHeight);
}
float step = 0;
void draw() {
  step +=0.500;
  int spacing = 150;
  // textFont(font, spacing/8);
  int spacing2 = 10;
  background(0);
  if (hour()==7) {
    for (int j = 0; j<11; j++) {
      pushMatrix();
      scale(0.4);
      //rotating random spiralling thing
      for (int i = 0; i<29; i++) {
        //change stroke based on for loop
        stroke(160+i*2, i*2, 0, 211);
        line(j*10+width/0.48, height/0.27, j*20+width/1.44+i*0.5, height/9.91);
        //extra line at slightl;y differnt
        stroke(i*6, i*9, 18, 260);
        line(j*20+width/2.00, height/2.00, j*20+width/2.00+i*0.5, height/1.19);
        translate(118*cos(step/1.7130), 43*sin(step/0.8791));
        translate(5047, -447);
        rotate(-step/30.01919);
      }
      popMatrix();
    }
  }

  if (hour()==20) {
    stroke(255);
    noFill();
    strokeWeight(50);


    translate(width/2, height/2);
    rotate(step/8);
    translate(-width/2, -height/2);

    strokeWeight(1);
    for (int j = 0; j<20; j++) {
      for (int i = 0; i<4; i++) {
        curve(j*10+i*20+width/3.61*cos(step/20), height/1.29*sin(step/14.8),
          width/2.00, j*100+height/1.28*sin(step/40),
          width/1.00*cos(step/14.8), height/2.00,
          width/1.00*sin(step/32), height/6.16);
      }
    }
  }

  if (hour()==9) {
    stroke(200+100*sin(step/99.023),100+sin(step/4),100);
    noFill();
    pushMatrix();
    for (int i = 0; i<20; i++) {
      translate(width/2*sin(step/99.009), height/2*sin(step/99.009));
      rotate((step/299.00923));
      strokeWeight(i);
      arc(i+width/2, height/4, width/8, height/8, 0, 10*abs(sin(step/23.234)));
    }
    popMatrix();
    for (int i = 0; i<34; i++) {
      translate(width/2*sin(step/99.009), height/2*sin(step/99.009));
      rotate(-(step/199.00923));
      strokeWeight(i);
      arc(i+width/2, height/4, width/8, height/8, 0, 10*abs(sin(step/23.234)));
    }
  }

  if (hour()==10) {
    translate(width/2, height/2);
    stroke(255);
    for (int i = 0; i<70; i++) {
      rotate(0.1);
      line(width/2*(sin(frameCount/23.009)), height/4+i*0.3, width/3, height/1.5*cos(i*sin(frameCount/99.009))+100+i+i*0.3);
    }
  }

  if (hour()==11) {
    translate(width/2, height/2);
    for (int i = 0; i<70; i++) {
      stroke(255, i*2, i*3);

      rotate(frameCount/99.009);
      line(width/3*(sin(frameCount/23.009)), height/4+i*0.3, width/2, height/1.5*tan(i*sin(frameCount/99.009))+i+i*0.3);
    }
  }

  //translate(-frameCount, 0);


  //windowResize(200,200);
  //windowMove(frameCount, 0);
}

void drawHex() {
}
