void setup() {
  size(600, 275);
}

void draw() {
  background(255);
  stroke(240);
  strokeWeight(0.5);
  Arc(#8d5f1c, #959a52, #c87b03, #211a3c, #a13a18, #706148, #1b1718, 0.50, 1.00, 0, 455, 270, 0);
  Arc(#4b5b63, #c44217, #aa915e, #243e75, #926935, #56844a, #b5181c, 0.75, 1.25, 1.51, 315, 140, 0);
  Arc(#c12e3f, #331e12, #4d4d87, #756453, #9e3259, #dfb902, #4b71ac, 1.25, 1.75, 1.10, 305, 140, 0);
  Arc(#f4dc9d, #218a30, #c5ba56, #b30c35, #394e90, #c9375f, #8e816f, 1.00, 1.50, 0, 165, 9, -1.5);
  noFill();
  stroke(#d77f01);
  strokeWeight(12.1);
  square(171, 4, 130);
  noFill();
  stroke(#a8a2c7);
  strokeWeight(12.1);
  arc(160, 5, 248, 262, TAU * -0.75, TAU * -0.50, PIE);
  noFill();
  stroke(#60223d);
  strokeWeight(12.0);
  arc(697, 147, 254, 241, TAU * -0.75, TAU * -0.50, PIE);
  
  
  
    noFill();
  stroke(#65a2b9);
  strokeWeight(13.5);
  arc(313, 138, 258, 261, TAU * -1.25, TAU * -1.00, PIE);
  noFill();
  stroke(#60223d);
  strokeWeight(14.5);
  arc(304, 145, 257, 245, TAU * -0.75, TAU * -0.50, PIE);
  noFill();
  stroke(#8bb492);
  strokeWeight(12.1);
  square(314, 144, 130);

  
  
  
}
void mousePressed() {
  save(this + ".png");
}

void Arc (color color1, color color2, color color3, color color4, color color5, color color6, color color7, float start, float end, float adjust, float positionx, float positiony, float adjust2) {

  float asdf = 31;
  for (int i = 0; i<7 * asdf; i+= asdf) {
    if (i==0) {
      fill(color1);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start-adjust2, TAU * end-adjust, PIE);
    }
    if (i== asdf) {
      fill(color2);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 2 *asdf) {
      fill(color3);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 3* asdf) {
      fill(color4);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 4* asdf) {
      fill(color5);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i== 5* asdf) {
      fill(color6);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
    if (i==6* asdf) {
      fill(color7);
      arc(positionx, positiony, 250 - i, 250 - i, TAU * start, TAU * end, PIE);
    }
  }
}
