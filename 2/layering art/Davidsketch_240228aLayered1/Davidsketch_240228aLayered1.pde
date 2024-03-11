//code runs at start
void setup() {
  size(800, 800); //set size to 800,800
  background(0); // set background to black
}
//set global variable step to 0
float step = 0;
void draw() {
  //set scale to 0.5
  scale(0.5);
  //set step to frameCount * 0.0625
  step = frameCount*0.0625;
  //fill using sine wave and random colors
  fill(sin(step)*30, random(20), random(20), random(200));
  //turn off stroke
  noStroke();
  /*for(int i = 0; i<2;i++){
   square(random(1600),random(1000),random(500));
   }*/

  //draw random points at random storke weights
  for (int i = 0; i<100; i++) {
    stroke(sin(step)*30, random(255), random(255), random(20));
    strokeWeight(random(10));
    point(random(1600), random(1600));
  }
  //translate to x 800 and y 800 modulated by sin and cosine wave
  translate(800, 800+69*cos(step/4*sin(step)*50));
  //set stroke weight to 3
  strokeWeight(3);
  
  //trigonometry
  for (int j = 0; j<2; j++) {
    float max = 45;
    for (j=0; j<10; j++) {
      for (float i = 0; i<max; i+=0.9) {
        stroke(255, 88);
        point(0 + i, j*25+500+-99*(float)easeInElastic(sin(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
      }
      for (float i = 0; i<max; i+=0.9) {
        stroke(random(255), 44, 255, random(255));
        rotate(step/16384);
        point(0 + i, j*25+500+-99*(float)easeInElastic(tan(frameCount/99.009)-map(cos(i), 0, 1, 0.3-1, 0.4+1)));
      }
      //make this rotate and make sure it doesnt affect the rest of the waves in this for loop
      pushMatrix();
      for (float i = 0; i<max; i+=0.9) {
        stroke(255, 88);
        rotate(-step/16384);
        point(0 + i, j*25+500+-99*(float)easeInElastic(1/tan(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
      }
      popMatrix();
    }
  }
  //slight glitching this doesnt reset the step entirely because the framecount is still counting
  if (step >TAU*2) {
    step = 0;
  }
}


//easing function from easings.net
double easeInElastic(float x) {
double c4 = (2 * Math.PI) / 3;

  return x == 0
    ? 0
    : x == 1
    ? 1
    : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
}
