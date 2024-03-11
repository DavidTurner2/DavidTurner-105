//code runs at start
void setup() {
  size(800, 700); //set size to 800,700
  background(0); //set background to black
}
//position in for loop to make the spiral
float saved= 999;
//float value for distance the weird spiral can go
float ransom = 0;
//changing direction for the spiral to travel to
boolean negative = false;
//the spiral coordinates
float rx = -900;
float ry = 500;
//code runs everyframe
void draw() {
  //translate to 500,216
  translate(500, 216);
  //scale to 0.498
  scale(0.498);

  //if traveled to 1500 switch direcions and travel backwards
  //if traveled to -900 swithc directions and travel forwards
  if (ransom > 1500) {
    negative = true;
    rx = random(-2000, 1000);
    ry = random(-500, 1000);
  }
  if (ransom < -900) {
    negative = false;
    rx = random(-2000, 1000);
    ry = random(-500, 1000);
  }

  //set stroke weight to 3
  strokeWeight(3);
  //for loop for translating and travelling
  for (float i = 0; i<900; i+=0.9) {
    stroke(#ff0a0a, random(50));
    //scale(0.9);
    translate(rx+ ransom, ry);
    if (negative == true) {
      ransom-=random(10)*0.0005;
      //random+=random(-10,90)*0.0005;
    } else {
      ransom+=random(5)*0.0005;
    }
    //red circling thing in center
    point(0 + i, 170+30*cos(i * PI/43.0));
    stroke(lerpColor(#0000ab, #a0d00f, i/800));

    //make the blue green spiral
    if (i>saved) {
    } else {
      rotate(easeOutBounce(10));
      point(0 + i, 170+-9*sin(frameCount/9.009+i * PI/16.6));
    }
  }

}

//easing function from easings.net
float  easeOutBounce(float x) {
  float n1 = 7.5625;
  float d1 = 2.75;

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
