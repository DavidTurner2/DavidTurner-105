void setup() {
  size(800, 800);
  background(0);
  strokeCap(PROJECT);
}
float c = 0;
Boolean backward = false;
void draw() {
  translate(400, random(-400, 1600));
  scale(0.9);
  strokeWeight(1);
  rotate(frameCount/PI*0.25);
   if(c > 254){
    backward = true;
  }
  if(c <= 0){
    backward = false;
  }
  
  if(backward == true){

    c-= random(2.099);
  }
  if(backward == false){
    if(frameCount%2==0){
  c+= random(0.90999099);
    }
  }

  for (float i=0; i<900; i+=0.9) {
    stroke(c,constrain(i, 0, random(255)),0, constrain(i, 0, random(255)));
    point(0 + i, 170+-9*sin(frameCount/PI * i * PI/16.6));
  }
 
  for (float i=0; i<900; i+=0.9) {
strokeWeight(random(1.5));
    if (frameCount%2==0) {
      point(0 + i, 170+-9*tan(frameCount/PI * i * PI/16.6));
    } else {
      point(0 + i, 170+-9*cos(frameCount/PI * i * PI/16.6));
    }
  }
}
