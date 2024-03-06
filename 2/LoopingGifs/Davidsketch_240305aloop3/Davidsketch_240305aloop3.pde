void setup() {
  size(800, 800);
  rectMode(CENTER);
  frameRate(50);
}
float step = 0;
float rotatestep = 0;
int counter=0;

int loop=0;
void draw() {
  PVector[] places = {new PVector(200, 250),
    new PVector(600, 250),
    new PVector(600, 600),
    new PVector(200, 600),
    new PVector(200, 250),
    new PVector(600, 250), };
  background(#005039);
  step+=0.01;
  rotatestep=step*12.5;
  noStroke();
  translate(400, 400);
  rotate(PI * 0.1*sin(rotatestep/2));
  translate(-400, -400);
  fill(50+100*tan(step/1.3), 0, 0);
  quad(places[0].x-50*abs(1/tan(rotatestep/4)), places[0].y-50,
  places[1].x+50,  places[1].y-50*sin(rotatestep/4), 
  places[2].x+50*abs(tan(rotatestep/4)), places[2].y+50, 
  places[3].x-50,  places[3].y+50*sin(rotatestep/4));
  fill(0, -60+ 80*1/tan(step/1.3)+87, 90+ 57*1/tan(rotatestep/2));
  quad(places[0].x, places[0].y, 
  places[1].x, places[1].y, 
  places[2].x, places[2].y, 
  places[3].x, places[3].y);

  strokeWeight(9);
  for (int j = 0; j<4; j++) {
    if (loop == j) {
      for (int i = 0; i<8; i++) {
        if (j==0) {
          stroke(8*40-i*40);
          point(lerp(i*40+places[j].x, places[j+1].x, constrain((float)easeOutBounce(step), 0, 1)), lerp(places[j].y, places[j+1].y, constrain((float)easeOutBounce(step), 0, 1)));
        }
        if (j==1) {
          stroke(i*40);
          point(lerp(places[j].x, places[j+1].x, constrain(step, 0, 1)), lerp(places[j].y, i*40+places[j+1].y, constrain((float)easeOutQuart(step), 0, 1)));
        }
        if (j==2) {
          stroke(i*40);
          point(lerp(places[j].x, places[j+1].x, constrain((float)easeOutQuart(step), 0, 1)), lerp(i*40+places[j].y, places[j+1].y, constrain((float)easeOutBounce(step), 0, 1)));
        }
        if (j==3) {
          stroke(8*40-i*40);
          point(lerp(places[j].x, i*40+places[j+1].x, constrain(step, 0, 1)), lerp(places[j].y, places[j+1].y, constrain((float)easeOutQuart(step), 0, 1)));
        }
      }
    }
  }
  if (step > 1) {
    step = 0;
    loop+=1;
    if (loop==4) {
      //noLoop();
      loop=0;
    }
  }
  if (rotatestep > 4) {
    rotatestep = 0;
  }
  // saveFrame("frames/####.png");
}

double easeOutBounce(float x) {
  double n1 = 7.5625;
  double d1 = 2.75;

  if (x < 1 / d1) {
    return n1 * x * x;
  } else if (x < 2 / d1) {
    return n1 * (x -= 1.5 / d1) * x + 0.75;
  } else if (x < 2.5 / d1) {
    return n1 * (x -= 2.25 / d1) * x + 0.9375;
  } else {
    return n1 * (x -= 2.625 / d1) * x + 0.984375;
  }
}

double easeOutQuart(float x) {
  return 1 - Math.pow(1 - x, 4);
}
