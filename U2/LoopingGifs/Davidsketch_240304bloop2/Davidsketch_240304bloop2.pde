//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
}
//variable for animating it increments over time
float step = 0;
//code runs every frame
void draw() {
  //set background to dark red
  background(50, 0, 0);
  //increment step by small number
  step+=2/9.000009;

  //big white and green elipses and green and white lines at different locations
  //make lines lerp around using sine wave controlled by step variable

  for (int j = 0; j<2; j++) {
    if (j ==0) {
      ellipse(400, 400, 200*tan(step/2), sin(step/8)*100);
      stroke(#ffffff);
      strokeWeight(200*abs(sin(step/8)));
      translate(0, cos(step)*-2);
      line(lerp(300, 500, 2*sin(step/8)), 700, lerp(300, 500, 2*cos(step/8)), 500);
    } else {
      //push matrix so that the scale and translate dont affect the things from above
      pushMatrix();
      //coming from top left corner
      scale(0.125*(sin(step/2)));
      ellipse(400, 400, 200*tan(step/2), sin(step/8)*100);
      stroke(#00bb00);
      strokeWeight(200*abs(sin(step/8)));
      translate(0, cos(step)*-2);
      line(lerp(300, 500, 2*sin(step/8)), 700, lerp(300, 500, 2*cos(step/8)), 500);
      popMatrix();
    }
  }
  //set scale
  scale(1/9.000009);
  //make small green elipse and green line in the top left corner
  ellipse(400, 400, 200*tan(step/2), sin(step/8)*100);
  stroke(#00bb00);
  strokeWeight(200*abs(sin(step/8)));
  translate(800, 0);
  //make line lerp around using sine wave controlled by step variable
  line(lerp(800, 300, 2*sin(step/8)), 700, lerp(800, 300, 2*cos(step/8)), 500);
  //when step goes over tau * 8 set step to zero so it restarts
  if (step>TAU*8) {
    step = 0;
    //noLoop();
  }
  //saveFrame("frames/####.png");
}
