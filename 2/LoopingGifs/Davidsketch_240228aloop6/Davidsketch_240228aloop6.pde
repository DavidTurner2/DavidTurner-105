//add comments
void setup() {
  size(800, 800);
  frameRate(50);
}
float setp = 0;
void draw() {
  scale(0.5);
  setp = frameCount*0.0525;
  //println(setp);
  background(sin(setp)*30);  
  translate(800, 800+69*cos(setp/4*sin(setp)*50));
  rotate((1/cos(setp/4)));
  strokeWeight(3);

  for (int j = 0; j<2; j++) {

    float max = 800;
    for (j=0; j<10; j++) {
      rotate(setp/4);

      for (float i = 0; i<max; i+=0.9) {
        stroke(255, 88);

        point(0 + i, j*25+500+-99*(float)easeInElastic(sin(setp)-map(i, 0, max, 0.3-2, 0.4+2)));
      }
      for (float i = 0; i<max; i+=0.9) {
        stroke(255*abs(tan(setp)), 44, 255, 123);
        point(0 + i, j*25+500+-99*(float)easeInElastic(-1/cos(setp)-map(cos(i), -1, 1, 0.3-1, 0.4+1)));
      }
    }
  }

  if (setp>TAU*2.0) {
    setp = 0;
    // noLoop();
  }
  //saveFrame("frames/####.png");
}



double easeInElastic(float x) {
  double c4 = (2 * Math.PI) / 3;

  return x == 0
    ? 0
    : x == 1
    ? 1
    : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
}
