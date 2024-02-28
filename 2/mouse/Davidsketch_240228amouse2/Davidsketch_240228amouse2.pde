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

    if (mouseX > i && mouseY> 130 && mouseY < 190 ) {


      saved = i;
      point(0 + i, 170+-9*sin(i * PI/16.6));
    }
            stroke(lerpColor(#0000ff, #ff0000, i/800));

    if ( (mouseY> 130 && mouseY < 190 )==false) {
        point(0 + saved-i, 170+-9*sin(frameCount * saved-i * PI/16.6));
      
    }
  }
}
