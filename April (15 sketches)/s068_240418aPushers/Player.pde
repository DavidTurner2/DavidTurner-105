/*
//code runs at start
void setup() {
  //set size to 800,800
  size(800, 800);
  //set stroke cap to project to make points look like squares
  strokeCap(PROJECT);
}
//variable for incrmenting a number over time to animate things
float step;
//random rgb values start at 50 to make it lighter
float r = random(50, 155);
float g = random(50, 155);
float b = random(50, 155);
//size of the rectangle to change to
float sizer = 0;
//code runs everyframe
void draw() {
  //set background to black
  background(0);
  //increment step
  step += 0.0009;
  //set stroke to red
  stroke(255, 0, 0);
  //stroke weight to 30 big points
  strokeWeight(30);
  //a bunch of squares going to where the rectangle is and make it look like its hitting its collision
  for (int j = 0; j<5; j++) {
    point(lerp(-j*50+200, constrain(mouseX, 300, 800)-13, constrain(map(step*100, 0, 20, 0, 1), 0, 1)), lerp(-j*50+-50, 600, constrain(sin(map(step*100, 0, 20, 0, 1)), 0, 1)));
  }
  //turn off stroke
  noStroke();
  //make rectangle you can move that fades in using step
  fill(lerp(0, r, abs(sin(step*4.0))), lerp(0, g, abs(sin(step*4.0))), lerp(0, b, abs(sin(step*4.0))));
  rect(constrain(mouseX, 300, 800), 0, 50+sizer, 861);

  //when squares collide with the rectangle
  if (step*100>TAU*3.2&&step<TAU*5) {
    //when framecount is divisible by 25 change rgb values for rectangle
    if (frameCount%25==0) {
      r = random(50, 155);
      g = random(50, 155);
      b = random(50, 155);
    }
    //make random sizes going up and down with cosine
    sizer = random(10, 40)*cos(step*90);
  }

  //translate to 400,400
  translate(400, 400);
  //start rotating white and light grey squares
  rotate(step*100);
  strokeWeight(9);
  for (int i =0; i<99; i++) {
    if (i>50) {
      stroke(200, 100);
      point(0, 400);
    } else {
      stroke(255, 90);
      point(i+0, 400);
    }
  }
  //set step to zero to begin the loop again
  if (step*100>TAU*11.0) {
    step = 0;
  }
}*/
