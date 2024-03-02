//add comments
void setup() {
  size(800, 700);
    background(0);

}
float saved= 999;
float ransom = 0;
boolean negative = false;
float rx = -900;
float ry = 500;
void draw() {
  translate(500,216);
  scale(0.498);
      //random+= random(9.0005);
if(ransom > 1500){
  negative = true;
rx = random(-2000,1000);
ry = random(-500,1000);
}
if(ransom < -900){
  negative = false;
rx = random(-2000,1000);
ry = random(-500,1000);
}

  stroke(255);
  strokeWeight(3);
  for (float i = 0; i<900; i+=0.9) {
    stroke(#ff0a0a,random(50));
    //scale(0.9);
    translate(rx+ ransom,ry);
    if(negative == true){
    ransom-=random(10)*0.0005;
    //random+=random(-10,90)*0.0005;
    }else{
    ransom+=random(5)*0.0005;
    }
    point(0 + i, 170+30*cos(i * PI/43.0));

    stroke(lerpColor(#0000ab, #a0d00f, i/800));


    if ( (mouseY> 150 && mouseY < 190 )==false) {
      if (i>saved) {
      } else {
        rotate(easeOutBounce(10));

        point(0 + i, 170+-9*sin(frameCount/9.009+i * PI/16.6));
      }
    }
  }
}
//log(sin(frameCount/9.009+i * PI/16.6)/2)*exp(sin((frameCount/9.009+i * PI/16.6)/2))
float charaterSine(float value) {
  return (log(sin(value)/2)*exp(sin((value)/2)));
}
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

void mousePressed(){
  println(ransom);
}
