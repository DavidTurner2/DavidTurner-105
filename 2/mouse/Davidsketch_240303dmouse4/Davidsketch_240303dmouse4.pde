/* This project uses Additive Wave by Daniel Shiffman. */
float xspacing = 0.09;   // How far apart should each horizontal location be spaced
int maxwaves = 5;   // total # of waves to add together
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)
//duplicate values for the other additive waves
float[] amplitude2 = new float[maxwaves];
float[] dx2 = new float[maxwaves];
float[] yvalues2;
float[] amplitude3 = new float[maxwaves];
float[] dx3 = new float[maxwaves];
float[] yvalues3;

//code runs at start
void setup() {
  //set size to 1100,1000
  size(1100, 1000);
  //change color mode to hue satuaration brightness with max value being 360 for all those properties
  colorMode(HSB, 360);
  //for loops to create additive waves
  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(6, 17);
    float period = random(10, 60); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }
  yvalues = new float[2200];
  for (int i = 0; i < maxwaves; i++) {
    amplitude2[i] = random(6, 17);
    float period = random(15, 40); // How many pixels before the wave repeats
    dx2[i] = (TWO_PI / period) * xspacing;
  }
  yvalues2 = new float[2200];
  for (int i = 0; i < maxwaves; i++) {
    amplitude3[i] = random(6, 17);
    float period = random(10, 20); // How many pixels before the wave repeats
    dx3[i] = (TWO_PI / period) * xspacing;
  }
  yvalues3 = new float[2200];
}
//a global array of stepping for saving where a specific wave rotated to
float[] step = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//global variable for controlling specifically when the the scale and translation animates
float zoom;
//saved positions for when not hovering over wave(one is set to 2 becuase a point was on top of another wave)
float[] saved = {0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//global variable for making the wave change colors when hovering over it
float animation = 0;
//boolean array for which wave to has stopped being zoomed in to
boolean[] stop = {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false};
//code runs every frame
void draw() {
  //set background to white using hex value
  background(#ffffff);
  //for loop incrementing all the steps
  for (int i =0; i<step.length; i++) {
    step[i] += 1/9.009;
  }
  //increment zoom
  zoom+= 1/9.009;
  //for loop going through the boolean array stop
  for (int i = 0; i<stop.length; i++) {
    //if the particular index of array is stopped
    if (stop[i] ==true) {
      //conditional statements based on the value of the index of where to zoom in to
      if (i>=0&&i<4) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*i, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==4) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==5) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==6) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==7) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==8) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==9) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==10) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==11) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==12) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==13) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==14) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*2, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
      if (i==15) {
        scale((float)easeInOutBack(map(constrain(zoom/2, 0, 7.30), 1, 5, 0, 1)));
        translate(lerp(0, -39-275*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
          lerp(0, -118-225*3, map((float)easeInOutBack(map(constrain(zoom/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
      }
    }
  }
  //for loop for displaying first set of waves on 0
  for (int k = 0; k<4; k++) {
    wave(k, k*275, 0);
  }
  // make white rectangles for where the waves are going to be in 
  fill(#ffffff);
  for (int j = 1; j<4; j++) {
    for (int i = 0; i<4; i++) {
      stroke(0);
      rect(40+i*275, 150 + j*225, 200, 150);
    }
  }
  //put this wave first before the white rectangles
 wave(15, 3*275, 3*225);
 //turn off stroke make white rectangles to hide the waves outside of the rectangle
fill(#ffffff);
noStroke();
rect(-26, 975, 1550, 150);
rect(-117, 819, 983, 157);
rect(1065, 819, 5000, 159);
//plave the rest of the waves
  wave(4, 0, 225);
  wave(5, 1*275, 225);
  wave(6, 2*275, 225);
  wave(7, 3*275, 225);
  wave(8, 0, 2*225);
  wave(9, 1*275, 2*225);
  wave(10, 2*275, 2*225);
  wave(11, 3*275, 2*225);
  wave(12, 0, 3*225);
  wave(13, 1*275, 3*225);
  wave(14, 2*275, 3*225);
  //make extra white rectangles to hide any extra things
  noFill();
  strokeWeight(3);
  for (int j = 0; j<4; j++) {
    for (int i = 0; i<4; i++) {
      stroke(0);
     rect(40+i*275, 150 + j*225, 200, 150);
    }
  }
}
//easing function from easings.net
double easeInOutBack(float x) {
  double c1 = 1.70158;
  double c2 = c1 * 1.525;
  return x < 0.5
    ? (Math.pow(2 * x, 2) * ((c2 + 1) * 2 * x - c2)) / 2
    : (Math.pow(2 * x - 2, 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2;
}
//wave function where x is the wave being dispayes and tx and ty are the positions
void wave(int x, int tx, int ty) {
  //for loop that make sures the specific wave is animating
  for (int j = 0; j<step.length; j++) {
    //if the wave selected matches with the particular step index value
    if (x==j) {
      /*conditional statements that display different waves
      they check the mouse position based on the tx and ty positions entered into the function
      when the mouse is hovering over the animation variable starts incrementing
      animation variable gets used in stroke to make a cool color zipping effect
      when the animation variable reaches a certain amount then the stop at the index of that particular wave gets called and it zooms in on that wave
      when zoomed in animation gets set back to zero 
      if you move your mouse up then stop at that index gets set to false and it goes back to normal
      
      
      */
      if (j==0) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*sin(step[j]+i * PI/50.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*sin(saved[j]+i * PI/50.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*sin(step[j]+i * PI/50.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 1) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*cos(step[j]+i * PI/50.0)*1/2*log(tan(step[j]+i * PI/50.0)));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*cos(saved[j]+i * PI/50.0)*1/2*log(tan(step[j]+i * PI/50.0)));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*cos(step[j]+i * PI/50.0)*1/2*log(tan(step[j]+i * PI/50.0)));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 2) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 280+30*charaterSine(step[j]+i * PI/50.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 280+30*charaterSine(saved[j]+i * PI/50.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+280+30*charaterSine(step[j]+i * PI/50.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 3) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*1/sin(step[j]+i * PI/50.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*1/sin(saved[j]+i * PI/50.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*1/sin(step[j]+i * PI/50.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 4) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 250+30*1/charaterSine(step[j]+i * PI/50.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 250+30*1/charaterSine(saved[j]+i * PI/50.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+250+30*1/charaterSine(step[j]+i * PI/50.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 5) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*sin(step[j]+i * PI/2.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*sin(saved[j]+i * PI/2.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*sin(step[j]+i * PI/2.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 6) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*charaterSine2(2*step[j]+i * PI/20.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*charaterSine2(2*saved[j]+i * PI/20.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*charaterSine2(2*step[j]+i * PI/20.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 7) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*charaterSine3(step[j]+i * PI/20.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*charaterSine3(saved[j]+i * PI/20.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*charaterSine3(step[j]+i * PI/20.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 8) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*abs(charaterSine2(2*step[j]+i * PI/20.0)));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*abs(charaterSine2(2*saved[j]+i * PI/20.0)));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*abs(charaterSine2(2*step[j]+i * PI/20.0)));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 9) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*charaterSine1(step[j]+i * PI/80.0));
              point(40+tx + i, ty+ 220+30*cos(step[j]+i * PI/80.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*charaterSine1(saved[j]+i * PI/80.0));
              point(40 + i + tx, ty+ 220+30*cos(saved[j]+i * PI/80.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*charaterSine1(step[j]+i * PI/80.0));
              point(tx+40 + i, ty+220+30*cos(step[j]+i * PI/80.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 10) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+30*sin(step[j]+i * PI/80.0));
              point(40+tx + i, ty+ 220+30*cos(step[j]+i * PI/40.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+30*sin(saved[j]+i * PI/80.0));
              point(40 + i + tx, ty+ 220+30*cos(saved[j]+i * PI/40.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+30*sin(step[j]+i * PI/80.0));
              point(tx+40 + i, ty+220+30*cos(step[j]+i * PI/40.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 11) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(40+tx + i, ty+ 220+20*charaterSine4(step[j]+i * PI/80.0));
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              point(40 + i + tx, ty+ 220+20*charaterSine4(saved[j]+i * PI/80.0));
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              point(tx+40 + i, ty+220+20*charaterSine4(step[j]+i * PI/80.0));
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j == 12) {
        calcWave(step[j], tx, ty);
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              step[j] =saved[j];            
            }
          } else {
            if (mouseY>140) {
              animation = 0;
            } else {
              stop[j] = false;
            }
          }
        }
      }      
       if (j == 13) {
        calcWave2(step[j], tx, ty);
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              step[j] =saved[j];            
            }
          } else {
            if (mouseY>140) {
              animation = 0;
            } else {
              stop[j] = false;
            }
          }
        }
      }
         if (j == 14) {
        calcWave3(step[j], tx, ty);
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              step[j] =saved[j];            
            }
          } else {
            if (mouseY>140) {
              animation = 0;
            } else {
              stop[j] = false;
            }
          }
        }
      }
      if (j==15) {
        for (float i = 0; i<200; i+=0.9) {
          if (stop[j] == false) {
            if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
              animation+=1/9999.009;
              stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              for(int a = 0; a<8; a++){
              point(60*tan(a*20-step[j]/4)+ty+ 290+30*sin(step[j]+i * PI/50.0),tx + i);
              }
              saved[j] = step[j];
              if (animation>6.5/2.0) {
                zoom =6.9;
                stop[j] = true;
              }
            } else {
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
              step[j] =saved[j];
              for(int a = 0; a<8; a++){
              point(60*tan(a*20-saved[j]/4)+ty+ 290+30*sin(saved[j]+i * PI/50.0),tx + i);
              }
            }
          } else {
            if (mouseY>140) {
              animation = 0;
              stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
               for(int a = 0; a<8; a++){
              point(60*tan(a*20-step[j]/4)+ty+ 290+30*sin(step[j]+i * PI/50.0),tx + i);
              }
            } else {
              stop[j] = false;
            }
          }
        }
      }
    }
  }
}
//additive wave functions modified to use the position from the wave function and the value is what makes this wave animated
void calcWave(float value, int tx, int ty) {
  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(value)*amplitude[j];
      else yvalues[i] += cos(value)*amplitude[j];
      value+=dx[j];
    }
  }
  // A simple way to draw the wave with an ellipse at each location
  for (float i = 0; i < yvalues.length; i+=0.9) {
    if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
      stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, yvalues.length, 0, 1))*20, 360, 360);
    }
    point(tx+40+i*xspacing, 898+ yvalues[int(i)]);
  }
}
void calcWave2(float value, int tx, int ty) {
  for (int i = 0; i < yvalues2.length; i++) {
    yvalues2[i] = 0;
  }
  for (int j = 0; j < maxwaves; j++) {
    for (int i = 0; i < yvalues2.length; i++) {
      if (j % 2 == 0)  yvalues2[i] += sin(value)*amplitude2[j];
      else yvalues2[i] += cos(value)*amplitude2[j];
      value+=dx2[j];
    }
  }
  for (float i = 0; i < yvalues2.length; i+=0.9) {
    if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
      stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, yvalues.length, 0, 1))*20, 360, 360);
    }
    point(tx+40+i*xspacing, 898+ yvalues2[int(i)]);
  }
}
void calcWave3(float value, int tx, int ty) {
  for (int i = 0; i < yvalues3.length; i++) {
    yvalues3[i] = 0;
  }
  for (int j = 0; j < maxwaves; j++) {
    for (int i = 0; i < yvalues3.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues3[i] += sin(value)*amplitude3[j];
      else yvalues3[i] += cos(value)*amplitude3[j];
      value+=dx3[j];
    }
  }
  for (float i = 0; i < yvalues3.length; i+=0.9) {
    if (mouseY>150+ty&&mouseY<300+ty&&mouseX>40+tx&&mouseX<200+40+tx) {
      stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, yvalues.length, 0, 1))*20, 360, 360);
    }
    point(tx+40+i*xspacing, 898+ yvalues3[int(i)]);
  }
  
//diferent expiremental sine functions
}
float charaterSine(float value) {
  return (log(sin(value)/2)*exp(sin((value)/2)));
}
float charaterSine1(float value) {
  return (sq(sin(value)/exp(0.1)));
}
float charaterSine2(float value) {
  return ((sin(value)/4)*exp(sin((value)/2)));
}
float charaterSine3(float value) {
  return (10*(sin(value)/4)*(sin((value)/2)));
}
float charaterSine4(float value) {
  return (log(sin(value)/4)*(charaterSine3((value))));
}
