void setup() {
  size(800, 800);
}
float step = 0;
void draw() {
  background(50, 0, 0);
  step+=1/9.000009;



  for (int j = 0; j<2; j++) {
    if (j ==0) {
      ellipse(400, 400, 200*tan(step/2), sin(step/8)*100);
      stroke(#ffffff);
      strokeWeight(200*abs(sin(step/8)));
      translate(0, cos(step)*-2);
      line(lerp(300, 500, 2*sin(step/8)), 700, lerp(300, 500, 2*cos(step/8)), 500);
    } else {
      pushMatrix();
      scale(0.125*(sin(0.5*frameCount/9.000009)));
      ellipse(400, 400, 200*tan(step/2), sin(step/8)*100);
      stroke(#00bb00);
      strokeWeight(200*abs(sin(step/8)));
      translate(0, cos(step)*-2);
      line(lerp(300, 500, 2*sin(step/8)), 700, lerp(300, 500, 2*cos(step/8)), 500);
      popMatrix();
    }
  }
  scale(1/9.000009);
  ellipse(400, 400, 200*tan(step/2), sin(step/8)*100);
  stroke(#00bb00);
  strokeWeight(200*abs(sin(step/8)));
  translate(800, 0);
  line(lerp(800, 300, 2*sin(step/8)), 700, lerp(800, 300, 2*cos(step/8)), 500);
  if (step>TAU*16) {
    step = 0;
   // noLoop();
  }
  //saveFrame("frames/####.png");
}
