//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //set frame rate to 50
  frameRate(50);
}
//step variable saving the animation speed
float step = 0;
void draw() {
  //set scale to 0.5
  scale(0.5);
  //set step to frameCount *0.0525
  step = frameCount*0.0525;
  //set background to go from black to grey using sine wave with step
  background(sin(step)*30);
  //translate to 800 and 800 modulated by cosine and sine at diffrent values to make it look like its shaking
  translate(800, 800+69*cos(step/4*sin(step)*50));
  //rotate by secant wave it looks like its reving up
  rotate((1/cos(step/4)));
  //set stroke weight to 3
  strokeWeight(3);

  //make for loop j for controlling how this djuplicates vertically
  for (int j = 0; j<2; j++) {
    //set max value
    float max = 800;
    //for loop for spirals
    for (j=0; j<10; j++) {
      //roate by step this is getting effected by the rotation above
      rotate(step/4);

      for (float i = 0; i<max; i+=0.9) {
        //set stroke to white at a lower opacity
        stroke(255, 88);
        //create easing function wave
        point(0 + i, j*25+500+-99*(float)easeInElastic(sin(step)-map(i, 0, max, 0.3-2, 0.4+2)));
      }
      for (float i = 0; i<max; i+=0.9) {
        //make stroke go from purple to blue
        stroke(255*abs(tan(step)), 44, 255, 123);
        //make purple easing function pop in but appear mostly as a straghit line
        point(0 + i, j*25+500+-99*(float)easeInElastic(-1/cos(step)-map(cos(i), -1, 1, 0.3-1, 0.4+1)));
      }
    }
  }
  //if step reaches TAU * 2 stop loop
  if (step>TAU*2.0) {
    step = 0;
    // noLoop();
  }
  //saveFrame("frames/####.png");
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
