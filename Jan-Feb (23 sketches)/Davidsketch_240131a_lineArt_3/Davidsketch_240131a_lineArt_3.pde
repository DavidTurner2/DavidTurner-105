/* Inspired by Mario Nigro
L'incontro 1 - 1972 https://www.wikiart.org/en/mario-nigro/l-incontro-1-1972
*/
//code runs at start
//i dont think this counts anymore
void setup() {
  size(1010, 990);
}

void draw() {
  background(240);
  float linex = 9;
  float linex2 = 40;
  float liney = 87;
  float liney2 = 27;
  boolean switcher = true;
  strokeWeight(3);
  for (int j = 0; j<13; j++) {
    float temp = 0;
    float temp2 = 0;
    float tempy = 15;
    float tempy2 = 52;
    temp += linex;
    temp2 += linex2;
    tempy += linex;
    tempy2 += linex2;
    for (float i = 0; i< 24; i++) {
      if (!(j%2 > 0) ) {
        if (switcher&&j<6) {
          stroke(0);
        } else if (switcher==false&&j<6) {
          stroke(#d03e33);
        }
         if (switcher&&j>=6) {
          stroke(#d03e33);
        } else if (switcher==false&&j>=6) {
          stroke(0);
        }
        line(temp + (i*38.3), liney + (j*75), temp2 + (i*40.2), liney2 + (j*75));
        i+=i/40.41;
        temp -= -0.1;
        temp2 += -0.5;
        switcher = !switcher;
      } else {
      if (switcher&&j<6) {
          stroke(0);
        } else if (switcher==false&&j<6) {
          stroke(#d03e33);
        }
         if (switcher&&j>=6) {
          stroke(#d03e33);
        } else if (switcher==false&&j>=6) {
          stroke(0);
        }
        line(tempy + (i*43), liney + (j*75), tempy2 + (i*42), liney2 + (j*75));
        switcher = !switcher;
        tempy -= -2.0;
        tempy2 += 0.9;
      }
    }  
  }
}
void mousePressed(){
 save(this + ".png"); 
}
