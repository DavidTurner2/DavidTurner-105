void setup() {
  size(500, 900);
    strokeWeight(3);
frameRate(45);
 background(142);

}
float setp = 0;

void draw() {
    setp = frameCount*0.0625;
  float divider = 250;
  pushMatrix();
  scale(random(0.4,0.7));
  PVector start = new PVector(0, -13);
  //ine(start.x + 90, start.y + 90, start.x + 90, 277);
  translate(random(start.x + divider*4), random(start.y + divider*44));
  rotate(-frameCount);
    strokeWeight(1);

  stroke(random(255),random(120,255));
  //PVector start2 = new PVector(100, 100);
  for (int j = 0; j<divider; j++) {
     rotate(frameCount/5);
    line(start.x + j, start.y, start.x +(j+ 82), start.y);
  }
   for(int i = 0; i<100;i++){
 stroke(sin(setp)*30,sin(setp)*30,random(255));
      strokeWeight(random(10));
  point(random(1600),random(1600));
  }
  
  popMatrix();
  scale(0.3);
  translate(800,800+69*cos(setp/4*sin(setp)*50));
  strokeWeight(5);
  for (int j = 0; j<2; j++) {

    float max = 45;
    for(j=0;j<10;j++){
       
    
    for (float i = 0; i<max; i+=0.9) {
          stroke(255,100,100,88);

      point(0 + i, j*25+500+-99*(float)easeInElastic(sin(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
    }

    for (float i = 0; i<max; i+=0.9) {
          stroke(random(255), 44,255,random(255));
          rotate(setp/16384);
      point(0 + i, j*25+500+-99*(float)easeInElastic(tan(frameCount/99.009)-map(cos(i), 0, 1, 0.3-1, 0.4+1)));
    }
    pushMatrix();
    for (float i = 0; i<max; i+=0.9) {
          stroke(255, 88);
          rotate(-setp/16384);

      point(0 + i, j*25+500+-99*(float)easeInElastic(1/tan(frameCount/99.009)-map(i, 0, max, 0.3-2, 0.4+2)));
    }
        popMatrix();

    }
  }
  if (setp >TAU*2) {
    setp = 0;
    // noLoop();
  }
}

double easeInElastic(float x) {
  double c4 = (2 * Math.PI) / 3;

  return x == 0
    ? 0
    : x == 1
    ? 1
    : -Math.pow(2, 10 * x - 10) * Math.sin((x * 10 - 10.75) * c4);
}
