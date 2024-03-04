//add comments
void setup() {
  size(800, 800);
}
float saved= 0;
float setp = 0;
void draw() {
  scale(0.5);
  setp = frameCount*0.0625;
  //println(setp);
  background(sin(setp)*30);
  translate(800,69*cos(setp/4*sin(setp)*50));
  strokeWeight(3);
  for (int j = 0; j<2; j++) {

    float max = 800;
    for(j=0;j<10;j++){
    for (float i = 0; i<max; i+=0.9) {
          stroke(255, 88);

      point(0 + i, j*25+500+-99*(float)easeInElastic(sin(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
    }

    for (float i = 0; i<max; i+=0.9) {
          stroke(255, 44,255,44);
          rotate(setp/16384);
      point(0 + i, j*25+500+-99*(float)easeInElastic(tan(frameCount/99.009)-map(cos(i), 0, 1, 0.3-1, 0.4+1)));
    }
    }
  }
  if (setp >TAU*2) {
    setp = 0;
    // noLoop();
  }
  //saveFrame("frames/####.png");
}

float charaterSine(float value) {
  return ((sin(value)/2)*(sin((value)/2)));
}

double easeInElastic(float x) {
  double c4 = (2 * Math.PI) / 3;

  return x == 0
    ? 0
    : x == 1
    ? 1
    : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
}
