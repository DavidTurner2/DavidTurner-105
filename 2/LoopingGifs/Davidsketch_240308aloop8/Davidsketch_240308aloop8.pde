void setup() {
  size(1000, 1000);
}
float step = 0.0;
float opacity = 255;
float opactiy2 = 0;
void draw() {
  background(0);
  step+=0.05;
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)));
  pushMatrix();
  noStroke();
  translate(500, 500);
  rotate(step);
  translate(-500, -500);

  ellipse(500+100*sin(step), 500+200*cos(step), 1400, 100);

  popMatrix();
  if (step>PI&&step<2.0*PI) {
    opacity = 255;
    opactiy2 = 0;
  }
  if (step>2.0*PI&&step<PI*3.0) {
    opacity = 0;
    opactiy2 = 255;
  }
  if (step>PI*3.0&&step<PI*4.0) {
    opacity = 255;
    opactiy2 = 0;
  }
  if (step>PI*4.0&&step<PI*5.0) {
    opacity = 0;
    opactiy2 = 255;
    step = 0;
  }
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)), opacity);

  circle(500+sin(step)*-50*abs(sin(step*2)), 500+cos(step)*+50*abs(sin(step*2)), 500+100*abs(sin(step*2)));
  strokeWeight(10);
  for (int i = 0; i<12; i++) {
    stroke(0);
    fill(0+55*abs(sin(step)), 0, 100+55*abs(sin(step)));
    circle(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*50), 50+map(sin(step*4), -1, 1, 20, 100));
    noStroke();
    fill(0, 200+200*abs(sin(step)), 0, 70+50*-abs(sin(step)));
    circle(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*-100), 10+50*-abs(sin(step*2)));
  }
  fill(0, 100+55*abs(sin(step)), 200+55*abs(sin(step)), opactiy2);
  circle(500+sin(step)*-50*abs(sin(step*2)), 500+cos(step)*+50*abs(sin(step*2)), 500+100*abs(sin(step*2)));
  for (int i = 0; i<12; i++) {
    noStroke();
    fill(200+200*abs(sin(step)), 100+200*abs(sin(step)), 0, 200*abs(sin(step)));
    circle(10*sin(step)+500+400*cos(step+i*100), 10*cos(step)+500+400*sin(step+i*-100), 10+50*abs(sin(step*2)));
  }
}
