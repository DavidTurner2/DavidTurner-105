//code runs at start
void setup() {
  size(800, 700);
}
//global variable for saving the position of wave
float saved= 0;
//code runs every frame
void draw() {
  //set background to black
  background(0);
  //set stroke weight to 3
  strokeWeight(3);
  //loop for drawing waves
  for (float i = 0; i<900; i+=0.9) {
    //purple secant wave
    stroke(#aa00fa);
    point(0 + i, 170+30*1/cos(i * PI/43.0));
    //gradient stroke
    stroke(lerpColor(#ff0000, #0000ff, i/800));
    //if you put your mouse in the empty space of the secant wave then a strange animated sine wave would appear
    if (mouseX > i && mouseY> 150 && mouseY < 190 ) {
      //set saved to current value
      saved = i;
      point(0 + i, 150+-11* charaterSine(frameCount/9.009+i * PI/16.6)  );
    }
    //if mouse leaves the empty space of the secant wave make the weird sine wave turn into a reguluar sine wave
    if ( (mouseY> 150 && mouseY < 190 )==false) {
      //make the wave only go up to the position it was at before the mouse left
      if (i>saved) { // do nothing if the i value of loop surpasses the saved value
      } else {
        //draw animated sine wave
        point(0 + i, 170+-9*sin(frameCount/9.009+i * PI/16.6));
      }
    }
  }
}
//experimental sine wave
float charaterSine(float value) {
  return (log(sin(value)/2)*exp(sin((value)/2)));
}
