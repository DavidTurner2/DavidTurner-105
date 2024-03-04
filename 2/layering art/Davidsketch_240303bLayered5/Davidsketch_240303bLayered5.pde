void setup() {
  size(1000, 1000);
  background(0);
}
  int sign = 1;

void draw() {
  stroke(0, 2);
  strokeWeight(3);
  int max = 500;
  int[] pos = {-1,1,1,1,-1,1};
  for (int j = 0; j<2; j++) {
    
    stroke(255,88);
    for (float i = 0; i<max; i+=0.9) {
      point(j*25 + i, 500+-99*(float)easeInOutBounce(-tan(frameCount/99.009)+map(i, 0, max, 0.3-2, 0.4+2)));
    }

    for (float i = 0; i<max; i+=0.9) {
      point(500+j*25 + i, 500+-99*(float)easeInOutBounce(-tan(frameCount/99.009)+map(i, 0, max, 0.3-1, 0.4+1)));
    }
  }
  stroke(map(cos(frameCount/99.009),-1,1,100,200),map(sin(frameCount/99.009),-1,1,100,200),map(tan(frameCount/99.009),-1,1,100,200),map(tan(frameCount/99.009),-1,1,0,random(100,255)));
  translate(500,500);
  //sometimes a very big circle would appear
  scale(1+tan(frameCount/99.009)*0.9);
  rotate(TAU*sign*frameCount/99.009);
  for (float i = 0; i<max*99; i+=0.9) {
      point(-9999 + i, 170+-9* abs(1/tan((16*frameCount/99.009+i * PI/16))));
      //point(0 + i, 170+-9*sin(i * PI/9));
    }
    if(tan(frameCount/99.009)>TAU*2){
      sign = pos[int(random(pos.length))];
    }
}


double easeInOutBounce(float x) {
  return x < 0.5
    ? (1 - easeOutBounce(1 - 2 * x)) / 2
    : (1 + easeOutBounce(2 * x - 1)) / 2;
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
