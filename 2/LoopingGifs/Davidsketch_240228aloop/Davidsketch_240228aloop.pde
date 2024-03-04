//add comments
void setup() {
  size(800, 700);
}
float saved= 0;
float setp = 0;
void draw() {
  setp = frameCount*0.0625;
  //println(setp);
  background(0);

  strokeWeight(3);
  for (float i = 0; i<900; i+=0.9) {
    stroke(#bbbbfa);
    point(0 + i, 300+sin(setp)*99*1/cos(i * PI/44.1));
    stroke(lerpColor(#00ff00, #0000ff, i/800));
    point(0 + i, 300+-20* charaterSine(setp+i * PI/16.6)  );


    point(4 + i, 300+27*sin(setp+i * PI/2.0));
  }
  if(setp >TAU*2){
    setp = 0;
   // noLoop();
  }
//saveFrame("frames/####.png");
}

float charaterSine(float value) {
  return ((sin(value)/2)*(sin((value)/2)));
}
