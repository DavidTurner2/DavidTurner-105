//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
}
//variabelle animation
float step=0;
//code runs every frame
void draw() {
  //set background to light blue
  background(#9ed9ed);
  //set angular side to 400
  float as=400;
  //increment step by 0.05
  step+=0.05;
  //push matrix stop pilling rotations and translattions on top of each other
  pushMatrix();
  //make rotate middle triangles
  //in center by translating to positive values then to the same values negative
  translate(486, 450);
  rotate(step);
  translate(-486, -450);
  //make triagle go from red to white
  fill(255, 255+200*-abs(-sin(step*2)), 255+200*-abs(-sin(step*2)));
  //big triagle with the top part going up and down using absolute sine wave
  triangle(450, 500, 580 + 50*abs(sin(step*2)), 450, 450, 400);
  //pop matrix and push again
  popMatrix();
  pushMatrix();
  //change fill to white
  fill(255);
  //translate to animated positions to rotate around
  translate(500+as*cos(step), 480+as*sin(step));
  rotate((step));
  translate(-500+-as*cos(step), -480+-as*sin(step));
  //loops for making white triangle go around
  for (int i = 0; i<8; i++) {
    //the i value that triangles should appear
    if (i == 0 || i == 3|| i == 6) {
      stroke(0);
      fill(255);
    } else {
      //the rest of the i value show triangles going off screen so hide it and hide stroke
      noStroke();
      fill(0, 0);
    }

    triangle(
      480+as*cos(step+i*23),
      410+as*sin(step+i*0),
      520+as*cos(step+i*23),
      410+as*sin(step+i*0),
      500+as*cos(step+i*23),
      469+as*sin(step+i*0));
  }
  //revert matrix
  popMatrix();
  //make black stroke
  stroke(0);
  //translate to adjust a little bit
  translate(0, 10);
  //make weird red triangle sphere using sine waves and cosine waves unit circluar weird motion expiremental
  for (int i = 0; i<99; i++) {
    //set fill to red
    fill(#ff0000, 100);
    triangle(
      480+as*cos(step),
      410+as*sin(step+i*23),
      520+as*cos(step),
      410+as*sin(step+i*23),
      500+as*cos(step+i*23),
      469+as*sin(step+i*23));
  }
  //if step greater than pi * 2.0 then set step to zero
  if (step>2.0*PI) {
    step = 0;
  }
}
