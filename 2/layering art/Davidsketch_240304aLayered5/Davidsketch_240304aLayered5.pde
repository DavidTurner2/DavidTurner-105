//code runs at starT
void setup() {
  size(500, 900); // set size to 500,900
  strokeWeight(3); // set stroke weight to 3
  frameRate(45); // set framerate to 45
  background(142); //set background to grey
}
//set global variable step and initaillize it
float step = 0;
//code runs every frame
void draw() {
  //set step to be framecount * 0.0625
  step = frameCount*0.0625;
  //set divider to 250
  float divider = 250;
  //push matrix save settings
  pushMatrix();
  //set scale to random scales
  scale(random(0.4, 0.7));
  //set starting position
  PVector start = new PVector(0, -13);
  //translate to start + divider
  translate(random(start.x + divider*4), random(start.y + divider*44));
  //rotate by negative framecount
  rotate(-frameCount);
  //change stroke weight to 1
  strokeWeight(1);
//put random grey strokes at different transparencies
  stroke(random(255), random(120, 255));
  //for loop to put spiral lines
  for (int j = 0; j<divider; j++) {
    rotate(frameCount/5);
    line(start.x + j, start.y, start.x +(j+ 82), start.y);
  }
  //put random blue line
  for (int i = 0; i<100; i++) {
    stroke(sin(step)*30, sin(step)*30, random(255));
    strokeWeight(random(10));
    point(random(1600), random(1600));
  }
//revert matrix so rotations and scales dont affect code below
  popMatrix();
  //set scale to 0.3
  scale(0.3);
  //translate to 800 and 800 modulating
  translate(800, 800+69*cos(step/4*sin(step)*50));
  //change stroke weight to 5
  strokeWeight(5);
  for (int j = 0; j<2; j++) {

    float max = 45;
    for (j=0; j<10; j++) {

//red lines
      for (float i = 0; i<max; i+=0.9) {
        stroke(255, 100, 100, 88);
       point(0 + i, j*25+500+-99*(float)easeInElastic(sin(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
      }
//purple lines
      for (float i = 0; i<max; i+=0.9) {
        stroke(random(255), 44, 255, random(255));
        //rotate everything starting here
        rotate(step/16384);
        point(0 + i, j*25+500+-99*(float)easeInElastic(tan(frameCount/99.009)-map(cos(i), 0, 1, 0.3-1, 0.4+1)));
      }
      //rotating white lines
      pushMatrix();
      for (float i = 0; i<max; i+=0.9) {
        stroke(255, 88);
        rotate(-step/16384);
        point(0 + i, j*25+500+-99*(float)easeInElastic(1/tan(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
      }
      popMatrix();
    }
  }
  //slight glitching since frame count keeps counting
  if (step >TAU*2) {
    step = 0;
  }
}

//ease function from easings.net
double easeInElastic(float x) {
  double c4 = (2 * Math.PI) / 3;

  return x == 0
    ? 0
    : x == 1
    ? 1
    : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
}
