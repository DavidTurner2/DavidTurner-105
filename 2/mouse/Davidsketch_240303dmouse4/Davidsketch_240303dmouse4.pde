void setup() {
  size(1100, 1000);
  colorMode(HSB, 360);
}
float setp;
float[] saved = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
float animation = 0;
boolean stop = false;
boolean STOP = false;


void draw() {
  background(#ffffff);
  setp += 1/9.009;

  if (stop ==true) {
    STOP = false;
    scale((float)easeInOutBack(map(constrain(setp/2, 0, 7.30), 1, 5, 0, 1)));
    translate(lerp(0, -39, map((float)easeInOutBack(map(constrain(setp/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)),
    lerp(0, -118, map((float)easeInOutBack(map(constrain(setp/2, 0, 7.00), 1, 5, 0, 1)), 0, 4.0949097, 0, 1)));
  }
  
  wave(0);

  noFill();
  stroke(0);
  strokeWeight(3);
  for (int j = 0; j<4; j++) {
    for (int i = 0; i<4; i++) {
      rect(40+i*275, 150 + j*225, 200, 150);
    }
  }

  /* for (float i = 0; i<900; i+=0.9) {
   stroke(#aa00fa);
   point(0 + i, 170+30*1/cos(i * PI/43.0));
   stroke(lerpColor(#ff0000, #0000ff, i/800));
   
   if (mouseX > i && mouseY> 150 && mouseY < 190 ) {
   saved = i;
   point(0 + i, 150+-11* charaterSine(frameCount/9.009+i * PI/16.6)  );
   }
   
   if ( (mouseY> 150 && mouseY < 190 )==false) {
   if (i>saved) {
   } else {
   point(0 + i, 170+-9*sin(frameCount/9.009+i * PI/16.6));
   }
   }
   
   
   }*/
}
//log(sin(frameCount/9.009+i * PI/16.6)/2)*exp(sin((frameCount/9.009+i * PI/16.6)/2))
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


void wave(int x) {
  if (x==0) {
    for (float i = 0; i<200; i+=0.9) {
      if (stop == false) {
        if (mouseY>150&&mouseX>40&&mouseX<200+40) {
          animation+=1/9999.009;
          stroke(1/-tan(animation)/(float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          point(40 + i, 220+30*sin(setp+i * PI/50.0));
          saved[0] = setp;
          if (animation>6.5) {
            setp =6.9;
            stop = true;
            animation = 0;
          }
        } else {
          animation = 0;
          stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          setp =saved[0];
          point(40 + i, 220+30*sin(saved[0]+i * PI/50.0));
        }
      } else {

        if (mouseY>180) {
          stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          point(40 + i, 220+30*sin(setp+i * PI/50.0));
          saved[0] = setp;
        } else {
          setp =0;
          stop = false;
          stroke((float)easeInOutBack(map(i, 0, 200, 0, 1))*20, 360, 360);
          //setp =saved[0];
          point(40 + i, 220+30*sin(saved[0]+i * PI/50.0));
        }
      }
    }
  }
}
