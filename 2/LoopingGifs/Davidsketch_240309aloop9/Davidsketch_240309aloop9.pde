void setup() {
  size(1000, 1000);
}
float step=0;

void draw() {
  background(#9ed9ed);
  float as=400;
  step+=0.05;
  pushMatrix();
  translate(486, 450);
  rotate(step);
  translate(-486, -450);
    fill(255,255+200*-abs(-sin(step*2)),255+200*-abs(-sin(step*2)));

  triangle(450, 500, 580 + 50*abs(sin(step*2)), 450, 450, 400);
  popMatrix();
  pushMatrix();
  fill(255);

  //circle(486,450,20);
  translate(500+as*cos(step), 480+as*sin(step));
  rotate((step));
  translate(-500+-as*cos(step), -480+-as*sin(step));
  for (int i = 0; i<8; i++) {
    if (i == 0 || i == 3|| i == 6) {
      stroke(0);
      fill(255);
    }
    else{
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

  popMatrix();
      stroke(0);

  translate(0, 10);
  for (int i = 0; i<99; i++) {
    fill(#ff0000, 100);
    triangle(
      480+as*cos(step),
      410+as*sin(step+i*23),
      520+as*cos(step),
      410+as*sin(step+i*23),
      500+as*cos(step+i*23),
      469+as*sin(step+i*23));
  }




  if (step>2.0*PI) {
    step = 0;
  }
}
