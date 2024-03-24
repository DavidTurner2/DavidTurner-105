//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
  noFill();
}
//code runs every frame
void draw() {
  //set background to grey
  background(#808BA2);
  stroke(50);
  pushMatrix();
  translate(500, 500);
  rotate(frameCount/99.009);
  translate(-500, -500);
  //elipse in backgoround
  for (int i = 0; i<70; i++) {
    ellipse(500, 500, i*6.01+300, i*5+100);
    ellipse(500, 500, i*7+300, i*7+100);
  }
  popMatrix();

  //scale
  scale(2.4);
  translate(-295, -301);
  stroke(20, 150);
  for (int i = 0; i<370; i++) {
    line(484+-100*cos(-frameCount/19.009), 400, 500, 1.1*sin(i*23.09));
    translate(500, 500);
    rotate(frameCount/9999.009+PI/128);
    translate(-500, -500);
  }

  for (int i = 0; i<105; i++) {
    line(i*0.009+500, i*2.5+450, i*i/0.609+500, i*2.1+260);
  }
}
