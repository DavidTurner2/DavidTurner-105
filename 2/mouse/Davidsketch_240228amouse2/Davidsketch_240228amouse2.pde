//add comments
void setup() {
  size(800, 700);
}
float saved= 0;

void draw() {
  background(0);
  stroke(255);
  strokeWeight(3);
  for (float i = 0; i<900; i+=0.9) {
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
    
   
  }
}
//log(sin(frameCount/9.009+i * PI/16.6)/2)*exp(sin((frameCount/9.009+i * PI/16.6)/2))
float charaterSine(float value){
 return (log(sin(value)/2)*exp(sin((value)/2)));
  
}
