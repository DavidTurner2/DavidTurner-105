PFont font;

void setup() {
  font = loadFont("Wingdings-Regular-48.vlw");
}
void settings() {
  size(displayWidth, displayHeight);
}
int a = int(width*4);
int b = int(height*4);
boolean yuh = true;
float s = 0;
float step = 0;
float sstep;
void draw() {
  if(second()%2==0){
    sstep+=0.008;
   
  }
  else{
   
  sstep += 0.051;
  }
  
  step +=0.500;
 
  background(0);
  pushMatrix();
  noFill();
  stroke(255);
  strokeWeight(6);
  translate(-(int(width*1.30)+int((width/2)*sin(sstep))), -(int(height/1.75)+int((height/2)*cos(sstep))));
  circle(displayWidth/2, displayHeight/2, displayHeight/1.29);
  popMatrix();
  pushMatrix();
  translate(width/1.45, height/1.5);
  pushMatrix();
  strokeWeight(1);
  for (int i = 0; i<70; i++) {
    stroke(255, i*2, i*3);

    rotate(frameCount/99.009);
    line(width/3*(sin(frameCount/23.009)), height/4+i*0.3, width/2, height/1.5*tan(i*sin(frameCount/99.009))+i+i*0.3);
  }
  popMatrix();
  rotate(-sstep);
  pushMatrix();
  stroke(10, 150, 100);
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
  popMatrix();
  pushMatrix();
  strokeWeight(1);
  translate(width/2, height/2);
  rotate(sstep);
  stroke(255);
  for (int i = 0; i<70; i++) {
    rotate(0.1);
    line(width/2*(sin(frameCount/23.009)), height/4+i*0.3, width/3, height/1.5*cos(i*sin(frameCount/99.009))+100+i+i*0.3);
  }
  popMatrix();


  stroke(200+100*sin(step/99.023), 100+sin(step/4), 100);
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
  popMatrix();
  translate(width/2, height/2);
      scale(0.02);
            rotate(step/10.01919);
  for (int j = 0; j<11; j++) {
                rotate(step/100.01919);
    pushMatrix();
    //rotating random spiralling thing
    for (int i = 0; i<29; i++) {
      //change stroke based on for loop
      stroke(200+i*2, 200+i*2, 100, 255);
      line(sin(j*10)+width/0.48, height/0.27, j*20+width/1.44+i*2.5, height/9.91);
      //extra line at slightl;y differnt
      stroke(i*6, i*9, 18, 260);
      line(sin(j*20)+width/2.00, height/2.00, j*20+width/2.00+i*2.5, height/1.19);
      // translate(118*cos(step/59.7130), 43*sin(step/40.8791));
      translate(width*10, -height);
    }
    popMatrix();
  }




  windowResize(a, b);
  windowMove(int(width*1.30)+int((width/2)*sin(sstep)), int(height/1.75)+int((height/2)*cos(sstep)));
}

void drawHex() {
}
