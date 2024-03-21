//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //turn off fill
  noFill();
}
//variable for saving animation
float step;
//code runs every frame
void draw() {
  //set step to frameCount/99.009
  step = frameCount/99.009;
  //make background orange
  background(255, 100, 0);
  //whenever
  pushMatrix();
  //set stroke to low opacity black
  stroke(0, 100);
  //set stroke weight to 3
  strokeWeight(3);
  //translate and rotate
  translate(400, 400);
  rotate(sin(step/2.0002));
  translate(-200, -100);
  //make duplicated pairs of arcs
  for (int j = 0; j<4; j++) {
    //make arc thAT stands still
    for (int i = 0; i<40; i++) {
      arc(200, -200*j+200+i*4, 320, 320, 0, PI*1.00);
    }
    //make arc that curves the opposite way and moves left and right with cosine
    for (int i = 0; i<40; i++) {
      arc(200+50*cos(step*6), -200*j+ 409+i*4, 410, 320, PI*0.82, PI*1.9);
    }
  }

  popMatrix();
  //set stroke weight to 1
  strokeWeight(1);
  //make putple line do something weird
  for (int i = 0; i<200; i++) {
    stroke(i, i/2, i, i*40.8);
    line(0, i*2+100*cos(step), 900, i*2+100*sin(step));
  }
}
