//code runs at start
void setup() {
  //set size to 800,700
  size(800, 700);
}
//variable for aimation over time
float step = 0;
//code runs every frame
void draw() {
  //set step to frame count multiplied by a small deimal
  step = frameCount*0.0625;
  //set background to black
  background(0);
  //set stroke weight to 3
  strokeWeight(3);
  //for loop creates the waves
  for (float i = 0; i<900; i+=0.9) {
    //light blue stroke
    stroke(#bbbbfa);
    //make the amplitude of the secant wave modulated by a sine wave
    point(0 + i, 300+sin(step)*99*1/cos(i * PI/44.1));
    //make gradient stroke
    stroke(lerpColor(#00ff00, #0000ff, i/800));
    //character sine wave being animated by step
    point(0 + i, 300+-20* charaterSine(step+i * PI/16.6)  );

    //fast sine wave as well
    point(4 + i, 300+27*sin(step+i * PI/2.0));
  }
  //if step>tau*2 stop loop 
  if (step >TAU*2) {
    //step = 0;
    // noLoop();
  }
  //saveFrame("frames/####.png");
}
//experimental sine wave
float charaterSine(float value) {
  return ((sin(value)/2)*(sin((value)/2)));
}
