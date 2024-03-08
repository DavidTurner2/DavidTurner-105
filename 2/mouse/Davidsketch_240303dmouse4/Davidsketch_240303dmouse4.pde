void setup() {
  size(1100, 1000);
  colorMode(HSB, 360);
}
float step;
float zoom;

float[] saved = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float animation = 0;
boolean stop = false;


void draw() {
  background(#ffffff);
  step += 1/9.009;
  zoom+= 1/9.009;
  for (int i = 0; i<saved.length; i++) {

    if (stop ==true) {
      scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
      translate(lerp(0, -39, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
        lerp(0, -118, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
    }
  }


  noFill();
  strokeWeight(3);
  for (int j = 0; j<4; j++) {
    for (int i = 0; i<4; i++) {
      wave(0, i*275, j*225);
      stroke(0);
      rect(40+i*275, 150 + j*225, 200, 150);
    }
  }
}
float charaterSine(float value) {
  return (log(sin(value)/2)*exp(sin((value)/2)));
}

double easeInOutBack(float x) {
  double c1 = 1.70158;
  double c2 = c1 * 1.525;

  return x < 0.5
    ? (Math.pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2
    : (Math.pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2;
}


void wave(int x, int tx, int ty) {
  if (x==0) {
    for (float i = 0; i<200; i+=0.9) {
      if (stop == false) {
        if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
          animation+=1/9999.009;
          stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          point(40+tx + i, ty*225+ 220+30*sin(step+i * PI/50.0));
          saved[0] = step;
          if (animation>6.5/2.0) {
            zoom =6.9;
            stop = true;
          }
        } else {
          animation = 0;
          stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          step =saved[0];
          point(40 + i + tx, ty+ 220+30*sin(saved[0]+i * PI/50.0));
        }
      } else {
        if (mouseY>140+ty) {
          stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          point(tx+40 + i, ty+220+30*sin(step+i * PI/50.0));
        } else {
          stop = false;
        }
      }
    }
  }
}
