//code runs at start
void setup() {
  //set size to 1000,1000
  size(1000, 1000);
}
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //set stroke weight to 3
  strokeWeight(3);
  //set max value
  int max = 500;
  //make spiralling 3d looking thing in the bacground
  for (int j = 0; j<58; j++) {
    //set stroke to go to different colors using sine and cosine mapping framecount
    stroke(map(cos(frameCount/99.009), -1, 1, 100, 200), map(sin(frameCount/99.009), -1, 1, 100, 200), map(cos(frameCount/99.009), -1, 1, 100, 200), 44);
    for (float i = 0; i<max*2; i+=0.5) {
      //make bigger making loop go to max * 2
      //modulate this easing wave by a bunch of different waves mapped to different values expermintal
      point(-j*25 + i*2+100+-30*(float)easeInOutBounce(sin(frameCount/99.009)+map(i, 0, max*2, 0.3-2, 0.4+2)), j*50+-200+-99*(float)easeInOutBounce(tan(frameCount/99.009)+map(i, 0, max*2, 0.3-2, 0.4+2)));
    }
  }
  //2 of the spiralling waves
  for (int j = 0; j<2; j++) {
    //set stroke to white
    stroke(255, 88);

    for (float i = 0; i<max*2; i+=0.5) {
      //easing function wave more bigger because it increments to max *2
      point(j*25 + i*2, 500+-99*(float)easeInOutBounce(-tan(frameCount/99.009)+map(i, 0, max, 0.3-2, 0.4+2)));
    }
    for (float i = 0; i<max; i+=0.5) {
      //easing function wave
      point(500+j*25 + i, 500+-99*(float)easeInOutBounce(-tan(frameCount/99.009)+map(i, 0, max, 0.3-1, 0.4+1)));
    }
    for (float i = 0; i<max; i+=0.5) {
      //easing function wave more slower
      point(500+j*25 + i, 500+-99*(float)easeInOutBounce(-tan(0.5*frameCount/99.009)+map(i, 0, max, 0.3-1, 0.4+1)));
    }
  }
  //translate to 500,500
  translate(500, 500);
  //set scale to make the lines seem to be moving toward us using tangent so it goes off screen
  scale(1+tan(frameCount/99.009)*0.9);
  //rotate by framecount/99.009
  rotate(frameCount/99.009);
  //make these line gradully appear with stroke mapped so it looks like its coming from far away
  //make the stroke the same colors as that 3d looking spiralling thing in the background
  for (int i = 0; i<6; i++) {
    stroke(map(cos(frameCount/99.009), -1, 1, 100, 200), map(sin(frameCount/99.009), -1, 1, 100, 200), map(tan(frameCount/99.009), -1, 1, 100, 200), map(tan(frameCount/99.009), -1, 1, 0, i*20));
    line(-9999, 170- i*20, 9999, 170);
  }
  //if frameCount/99.009>TAU stop loop
  if (frameCount/99.009>TAU) {
    //  noLoop();
  }
}

//easing functions from easings.net
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
